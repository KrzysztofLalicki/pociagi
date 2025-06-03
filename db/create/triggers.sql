-- Sprawdzamy, czy dany tor istnieje i jest wolny

CREATE FUNCTION sprawdz_tor() RETURNS TRIGGER AS
$$
BEGIN
	IF NEW.tor > (SELECT tory FROM stacje WHERE id_stacji = NEW.id_stacji) THEN RAISE EXCEPTION ''; END IF;
	IF (SELECT COUNT(*) FROM stacje_posrednie WHERE przyjazd < NEW.odjazd AND odjazd > NEW.przyjazd) > 0
	    THEN RAISE EXCEPTION ''; END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_tor BEFORE INSERT ON stacje_posrednie
FOR EACH ROW EXECUTE PROCEDURE sprawdz_tor();

-- Sprawdzamy, czy dane polaczenie jezdzi w danym dniu i przyjezdza najpierw na stacje poczatkowa, a potem koncowa

CREATE FUNCTION sprawdz_podroz() RETURNS TRIGGER AS
$$
DECLARE
	stacja1 RECORD;
	stacja2 RECORD;
BEGIN
	IF (SELECT * FROM historia_polaczenia WHERE id_polaczenia = NEW.id_polaczenia
		AND data_od <= NEW.data_odjazdu AND data_do >= NEW.data_odjazdu) THEN RAISE EXCEPTION ''; END IF;
	stacja1 := (SELECT * FROM stacje_posrednie WHERE id_stacji = NEW.id_stacji_poczatkowej AND id_trasy =
		(SELECT id_trasy FROM polaczenia WHERE id_polaczenia = NEW.id_polaczenia));
	stacja2 := (SELECT * FROM stacje_posrednie WHERE id_stacji = NEW.id_stacji_koncowej AND id_trasy =
		(SELECT id_trasy FROM polaczenia WHERE id_polaczenia = NEW.id_polaczenia));
	IF stacja1 IS NULL OR stacja2 IS NULL THEN RAISE EXCEPTION ''; END IF;
	IF stacja1.odjazd >= stacja2.przyjazd THEN RAISE EXCEPTION ''; END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_stacje BEFORE INSERT ON bilety
FOR EACH ROW EXECUTE PROCEDURE sprawdz_podroz();

-- Sprawdzamy, czy dane miejsce jest wolne

CREATE FUNCTION sprawdz_miejsce() RETURNS TRIGGER AS
$$
BEGIN
	IF (SELECT COUNT(*) FROM bilety b NATURAL JOIN bilety_miejsca bm NATURAL JOIN miejsca m
		WHERE nr_miejsca = NEW.nr_miejsca AND id_wagonu = NEW.id_wagonu
		AND id_polaczenia = (SELECT id_polaczenia FROM bilety WHERE id_biletu = NEW.id_biletu)
		AND data_odjazdu = (SELECT data_odjazdu FROM bilety WHERE id_biletu = NEW.id_biletu)) > 0
	THEN RAISE EXCEPTION ''; END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sprawdz_miejsce BEFORE INSERT ON bilety_miejsca
FOR EACH ROW EXECUTE PROCEDURE sprawdz_miejsce();

-- Sprawdzamy, czy okresy aktywnosci danego polaczenia sa parami rozlaczne

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

-- Sprawdzamy, czy okresy obowiazywania danych cennikow sa rozlaczne

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