-- Pociag na nieistniejacym torze, dwa pociagi na jednym torze, jeden pociag na dwoch stacjach

CREATE FUNCTION sprawdz_przystanek() RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.tor > (SELECT tory FROM stacje WHERE id_stacji = NEW.id_stacji) THEN RAISE EXCEPTION ''; END IF;
    IF (SELECT COUNT(*) FROM stacje_posrednie WHERE id_polaczenia = NEW.id_polaczenia AND tor = NEW.tor
        AND przyjazd < NEW.odjazd AND odjazd > NEW.przyjazd) > 0 THEN RAISE EXCEPTION ''; END IF;
    IF (SELECT COUNT(*) FROM stacje_posrednie WHERE id_polaczenia = NEW.id_polaczenia
        AND (przyjazd <= NEW.odjazd OR przyjazd IS NULL) AND (odjazd >= NEW.przyjazd OR odjazd IS NULL)) > 0
        THEN RAISE EXCEPTION ''; END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_przystanek BEFORE INSERT ON stacje_posrednie
FOR EACH ROW EXECUTE PROCEDURE sprawdz_przystanek();

-- Stacja poczatkowa jest przed koncowa, polaczenie obowiazuje w danym dniu

CREATE FUNCTION sprawdz_przejazd() RETURNS TRIGGER AS
$$
DECLARE
    stacja1 RECORD;
    stacja2 RECORD;
BEGIN
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

-- Okresy aktywnosci polaczenia sa parami rozlaczne

CREATE FUNCTION sprawdz_polaczenie() RETURNS TRIGGER AS
$$
BEGIN
    IF (SELECT COUNT(*) FROM historia_polaczenia WHERE id_polaczenia = NEW.id_polaczenia
        AND data_od <= NEW.data_do AND data_do >= NEW.data_od) > 0 THEN RAISE EXCEPTION ''; END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_polaczenie BEFORE INSERT ON historia_polaczenia
FOR EACH ROW EXECUTE PROCEDURE sprawdz_polaczenie();

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