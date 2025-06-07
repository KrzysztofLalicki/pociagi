-- W harmonogramie nie ma nulli

CREATE FUNCTION sprawdz_harmonogram() RETURNS TRIGGER AS
$$
DECLARE
    i INT;
BEGIN
    FOR i IN 1 .. 7 LOOP
        IF NEW.czy_tydzien[i] IS NULL THEN RAISE EXCEPTION ''; END IF;
    END LOOP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_harmonogram BEFORE INSERT ON harmonogramy
FOR EACH ROW EXECUTE PROCEDURE sprawdz_harmonogram();

-- Okresy obowiazywania cennikow sa parami rozlaczne

CREATE FUNCTION sprawdz_ceny() RETURNS TRIGGER AS
$$
BEGIN
    IF (SELECT COUNT(*) FROM historia_cen WHERE id_przewoznika = NEW.id_przewoznika
                                            AND data_od <= NEW.data_do AND data_do >= NEW.data_od) > 0 THEN RAISE EXCEPTION ''; END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_ceny BEFORE INSERT ON historia_cen
    FOR EACH ROW EXECUTE PROCEDURE sprawdz_ceny();

-- Pociag jedzie po torach (polaczenie musi byc dodane w jednej transakcji ze stacjami posrednimi)

CREATE FUNCTION sprawdz_droge() RETURNS TRIGGER AS
$$
DECLARE
    poprzednia RECORD;
    nastepna RECORD;
BEGIN
    poprzednia := (SELECT id_stacji, przyjazd FROM stacje_posrednie WHERE id_polaczenia = NEW.id_polaczenia
                   ORDER BY przyjazd LIMIT 1);
    LOOP
        nastepna := (SELECT id_stacji, przyjazd FROM stacje_posrednie WHERE id_polaczenia = NEW.id_polaczenia
                                                                        AND przyjazd > poprzednia.przyjazd ORDER BY przyjazd LIMIT 1);
        IF nastepna IS NULL THEN RETURN NEW; END IF;
        IF (SELECT COUNT(*) FROM linie WHERE (stacja1 = poprzednia AND stacja2 = nastepna)
                                          OR (stacja1 = nastepna AND stacja2 = poprzednia)) = 0 THEN DELETE FROM stacje_posrednie
                                                                                                     WHERE id_polaczenia = NEW.id_polaczenia; DELETE FROM polaczenia WHERE id_polaczenia = NEW.id_polaczenia;
        RAISE EXCEPTION ''; END IF;
        poprzednia := nastepna;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER sprawdz_droge AFTER INSERT ON polaczenia DEFERRABLE INITIALLY DEFERRED
    FOR EACH ROW EXECUTE PROCEDURE sprawdz_droge();

-- Pociag na nieistniejacym torze, dwa pociagi na jednym torze, jeden pociag na dwoch stacjach

CREATE FUNCTION sprawdz_przystanek() RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.tor > (SELECT tory FROM stacje WHERE id_stacji = NEW.id_stacji) THEN RAISE EXCEPTION ''; END IF;
    IF (SELECT COUNT(*) FROM stacje_posrednie WHERE tor = NEW.tor AND przyjazd < NEW.odjazd
                                                AND odjazd > NEW.przyjazd) > 0 THEN RAISE EXCEPTION ''; END IF;
    IF (SELECT COUNT(*) FROM stacje_posrednie WHERE id_polaczenia = NEW.id_polaczenia AND (przyjazd <= NEW.odjazd)
                                                AND (odjazd >= NEW.przyjazd)) > 0 THEN RAISE EXCEPTION ''; END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_przystanek BEFORE INSERT ON stacje_posrednie
    FOR EACH ROW EXECUTE PROCEDURE sprawdz_przystanek();

-- Okresy aktywnosci polaczenia sa parami rozlaczne, polaczenie nie jezdzi gdy przewoznik nie ma cennika

CREATE FUNCTION sprawdz_polaczenie() RETURNS TRIGGER AS
$$
DECLARE
    data DATE;
    okres RECORD;
BEGIN
    IF (SELECT COUNT(*) FROM historia_polaczenia WHERE id_polaczenia = NEW.id_polaczenia
                                                   AND data_od <= NEW.data_do AND data_do >= NEW.data_od) > 0 THEN RAISE EXCEPTION ''; END IF;
    data := NEW.data_od;
    LOOP
        okres := (SELECT data_od, data_do FROM historia_cen WHERE id_przewoznika = (SELECT id_przewoznika
                                                                                    FROM polaczenia WHERE id_polaczenia = NEW.id_polaczenia) AND data_do >= NEW.data_od ORDER BY data_od
                  LIMIT 1);
        IF okres.data_od > data + 1 THEN RAISE EXCEPTION ''; END IF;
        data := okres.data_do;
        IF data >= NEW.data_do THEN RETURN NEW; END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_polaczenie BEFORE INSERT ON historia_polaczenia
    FOR EACH ROW EXECUTE PROCEDURE sprawdz_polaczenie();

-- Zwrot biletu przed odjazdem

CREATE FUNCTION sprawdz_zwrot() RETURNS TRIGGER AS
$$
BEGIN
    IF (SELECT MIN(data_odjazdu) FROM przejazdy WHERE id_biletu = NEW.id_biletu) < NEW.data_zwrotu
    THEN RAISE EXCEPTION ''; END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_zwrot BEFORE UPDATE ON bilety
    FOR EACH ROW EXECUTE PROCEDURE sprawdz_zwrot();

-- Odjazd po kupnie biletu, stacja poczatkowa przed koncowa, polaczenie obowiazuje w danym dniu

CREATE FUNCTION sprawdz_przejazd() RETURNS TRIGGER AS
$$
DECLARE
    stacja1 RECORD;
    stacja2 RECORD;
BEGIN
    IF NEW.data_odjazdu < (SELECT data_zakupu FROM bilety WHERE id_biletu = NEW.id_biletu)
    THEN RAISE EXCEPTION ''; END IF;
    IF (SELECT COUNT(*) FROM historia_polaczenia WHERE id_polaczenia = NEW.id_polaczenia
                                                   AND data_od <= NEW.data_odjazdu AND data_do >= NEW.data_odjazdu) = 0 THEN RAISE EXCEPTION ''; END IF;
    IF swieto(NEW.data_odjazdu) = FALSE AND (SELECT czy_tydzien[extract('day' FROM NEW.data_odjazdu) + 1]
                                             FROM harmonogramy NATURAL JOIN polaczenia WHERE id_polaczenia = NEW.id_polaczenia) = FALSE
    THEN RAISE EXCEPTION ''; END IF;
    IF swieto(NEW.data_odjazdu) = TRUE AND (SELECT czy_swieto FROM harmonogramy NATURAL JOIN polaczenia
                                            WHERE id_polaczenia = NEW.id_polaczenia) = FALSE THEN RAISE EXCEPTION ''; END IF;
    stacja1 := (SELECT * FROM stacje_posrednie WHERE id_stacji = NEW.id_stacji_poczatkowej
                                                 AND id_polaczenia = NEW.id_polaczenia);
    stacja2 := (SELECT * FROM stacje_posrednie WHERE id_stacji = NEW.id_stacji_koncowej
                                                 AND id_polaczenia = NEW.id_polaczenia);
    IF stacja1 IS NULL OR stacja2 IS NULL THEN RAISE EXCEPTION ''; END IF;
    IF stacja1.odjazd >= stacja2.przyjazd THEN RAISE EXCEPTION ''; END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_przejazd BEFORE INSERT ON przejazdy
    FOR EACH ROW EXECUTE PROCEDURE sprawdz_przejazd();

-- Wagon i miejsce istnieje, miejsce jest wolne ca calej trasie przejazdu

CREATE FUNCTION sprawdz_miejsce() RETURNS TRIGGER AS
$$
BEGIN
    IF (SELECT COUNT(*) FROM polaczenia_wagony WHERE id_polaczenia = (SELECT id_polaczenia FROM przejazdy
                                                                      WHERE id_przejazdu = NEW.id_przejazdu) AND nr_wagonu = NEW.nr_wagonu) = 0 THEN RAISE EXCEPTION ''; END IF;
    IF (SELECT COUNT(*) FROM miejsca WHERE id_wagonu = (SELECT id_wagonu FROM polaczenia
                                                        WHERE id_polaczenia = (SELECT id_polaczenia FROM przejazdy WHERE id_przejazdu = NEW.id_przejazdu)
                                                          AND nr_wagonu = NEW.nr_wagonu) AND nr_miejsca = NEW.nr_miejsca) = 0 THEN RAISE EXCEPTION ''; END IF;
    IF (SELECT COUNT(*) FROM bilety_miejsca bm WHERE (SELECT id_polaczenia, data_odjazdu FROM przejazdy
                                                      WHERE id_przejazdu = bm.id_przejazdu) = (SELECT id_polaczenia, data_odjazdu FROM przejazdy
                                                                                               WHERE id_przejazdu = NEW.id_przejazdu) AND nr_wagonu = NEW.nr_wagonu AND nr_miejsca = NEW.nr_miejsca
                                                 AND (SELECT odjazd FROM stacje_posrednie WHERE (id_polaczenia, id_stacji) =
                                                                                                (SELECT id_polaczenia, id_stacji_poczatkowej FROM przejazdy WHERE id_przejazdu = bm.id_przejazdu)) <
                                                     (SELECT przyjazd FROM stacje_posrednie WHERE (id_polaczenia, id_stacji) =
                                                                                                  (SELECT id_polaczenia, id_stacji_koncowej FROM przejazdy WHERE id_przejazdu = NEW.id_przejazdu))
                                                 AND (SELECT przyjazd FROM stacje_posrednie WHERE (id_polaczenia, id_stacji) =
                                                                                                  (SELECT id_polaczenia, id_stacji_koncowej FROM przejazdy WHERE id_przejazdu = bm.id_przejazdu)) <
                                                     (SELECT odjazd FROM stacje_posrednie WHERE (id_polaczenia, id_stacji) =
                                                                                                (SELECT id_polaczenia, id_stacji_poczatkowej FROM przejazdy WHERE id_przejazdu = NEW.id_przejazdu))) > 0
    THEN RAISE EXCEPTION ''; END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_miejsce BEFORE INSERT ON bilety_miejsca
    FOR EACH ROW EXECUTE PROCEDURE sprawdz_miejsce();

-- Data istnieje

CREATE FUNCTION sprawdz_date() RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.miesiac IN (2, 4, 6, 9, 11) AND NEW.dzien = 31 THEN RAISE EXCEPTION ''; END IF;
    IF NEW.miesiac = 2 AND NEW.dzien = 30 THEN RAISE EXCEPTION ''; END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_date BEFORE INSERT ON swieta_stale
    FOR EACH ROW EXECUTE PROCEDURE sprawdz_date();
