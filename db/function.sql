
--funkcja zwracajaca stacje na polaczeniu

CREATE OR REPLACE FUNCTION stacje_na_polaczeniu(
    id_polaczenia_droga INTEGER
) RETURNS TABLE (
                    numer BIGINT,
                    id_stacji INTEGER,
                    nazwa_stacji VARCHAR,
                    przyjazd integer,
                    odjazd integer,
                    zatrzymanie BOOLEAN
                ) AS $$

BEGIN
    RETURN QUERY
        SELECT
                    ROW_NUMBER() OVER (ORDER BY sp.przyjazd) AS numer,
                    sp.id_stacji,
                    s.nazwa,
                    sp.przyjazd,
                    sp.odjazd,
                    sp.zatrzymanie
        FROM
            stacje_posrednie sp
                JOIN
            stacje s ON sp.id_stacji = s.id_stacji
        WHERE
            sp.id_polaczenia = id_polaczenia_droga
        ORDER BY
            sp.przyjazd;
END;
$$ LANGUAGE plpgsql;

--funkcja zwracajaca odleglosc pomiedzy jakimis stacjami na polaczeniu

CREATE OR REPLACE FUNCTION dlugosc_drogi(
    id_polaczenia INTEGER,
    id_stacji_start INTEGER,
    id_stacji_koniec INTEGER
) RETURNS INTEGER AS $$

DECLARE
    wynik INTEGER := 0;
    stacje INTEGER[];
    odleglosc_ INTEGER;
    i INTEGER;
BEGIN

    stacje := ARRAY(SELECT id_stacji
                    FROM stacje_na_polaczeniu(id_polaczenia)
                    WHERE id_stacji >= id_stacji_start AND id_stacji <= id_stacji_koniec
                    ORDER BY przyjazd);

    FOR i IN 1..array_length(stacje, 1) - 1 LOOP
            SELECT odleglosc
            INTO odleglosc_
            FROM linie
            WHERE (stacja1 = stacje[i] AND stacja2 = stacje[i + 1])
               OR (stacja1 = stacje[i + 1] AND stacja2 = stacje[i]);

            wynik := wynik + odleglosc_;
        END LOOP;

    RETURN wynik;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION czy_sa_stacje_na_polaczeniu(
    id_polaczenia INTEGER,
    id_stacji_start INTEGER,
    id_stacji_koniec INTEGER
) RETURNS BOOLEAN AS $$
DECLARE
    stacja_start RECORD;
    stacja_koniec RECORD;
BEGIN
    SELECT * INTO stacja_start FROM stacje_na_polaczeniu(id_polaczenia)
    WHERE id_stacji = id_stacji_start AND zatrzymanie = TRUE;

    SELECT * INTO stacja_koniec FROM stacje_na_polaczeniu(id_polaczenia)
    WHERE id_stacji = id_stacji_koniec AND zatrzymanie = TRUE;

    IF stacja_start IS NOT NULL AND stacja_koniec IS NOT NULL THEN
        IF COALESCE(stacja_start.odjazd,0) < stacja_koniec.przyjazd THEN
            RETURN TRUE;
        END IF;
    END IF;
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION oblicz_godzine_odjazdu(
    id_stacji_start INTEGER,
    id_pol INTEGER
) RETURNS TIME AS $$

DECLARE
    godzina_startu TIME;
    godzina_odjazdu INTEGER;
    wynik_godzina TIME;
BEGIN

    SELECT p.godzina_startu INTO godzina_startu
    FROM polaczenia p
    WHERE id_pol = p.id_polaczenia;

    SELECT odjazd INTO godzina_odjazdu
    FROM stacje_posrednie sp
    WHERE sp.id_polaczenia = id_pol
      AND sp.id_stacji = id_stacji_start;

    wynik_godzina := (godzina_startu + (godzina_odjazdu || ' minutes')::INTERVAL)::TIME;

    RETURN wynik_godzina;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION oblicz_godzine_przyjazdu(
    id_stacji_start INTEGER,
    id_pol INTEGER
) RETURNS TIME AS $$

DECLARE
    godzina_startu TIME;
    godzina_przyjazdu INTEGER;
    wynik_godzina TIME;
BEGIN

    SELECT p.godzina_startu INTO godzina_startu
    FROM polaczenia p
    WHERE id_pol = p.id_polaczenia;

    SELECT przyjazd INTO godzina_przyjazdu
    FROM stacje_posrednie sp
    WHERE sp.id_polaczenia = id_pol
      AND sp.id_stacji = id_stacji_start;

    wynik_godzina := (godzina_startu + (godzina_przyjazdu || ' minutes')::INTERVAL)::TIME;

    RETURN wynik_godzina;
END;
$$ LANGUAGE plpgsql;



--znajduje polaczenia ktore moga byc ok ale nie sprawdza czy sa aktualne

CREATE OR REPLACE FUNCTION dostepne_polaczenia(
    id_stacji_start INTEGER,
    id_stacji_koniec INTEGER
) RETURNS TABLE (
                    id_polaczenia INTEGER,
                    godzina_startu TIME,
                    id_harmonogramu INTEGER
                ) AS $$
BEGIN
    RETURN QUERY SELECT p.id_polaczenia,oblicz_godzine_odjazdu(id_stacji_start,p.id_polaczenia), p.id_harmonogramu FROM polaczenia p WHERE
        czy_sa_stacje_na_polaczeniu(p.id_polaczenia,id_stacji_start,id_stacji_koniec);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION dostepne_polaczenia_dzien_aktualnosc(
    id_stacji_start INTEGER,
    id_stacji_koniec INTEGER,
    dzien_odjazdu DATE
) RETURNS TABLE (
                    id_polaczenia INTEGER,
                    godzina_startu TIME
                ) AS $$

DECLARE
    dzien_tygodnia TEXT;
    czy_swieto BOOLEAN;
BEGIN
    SELECT LOWER(TRIM(TO_CHAR(dzien_odjazdu, 'Day'))) INTO dzien_tygodnia;

    SELECT czy_dzien_to_swieto(dzien_odjazdu) INTO czy_swieto;

    RETURN QUERY
        SELECT p.id_polaczenia, p.godzina_startu
        FROM dostepne_polaczenia(id_stacji_start, id_stacji_koniec) p
                 JOIN historia_polaczenia ph ON p.id_polaczenia = ph.id_polaczenia
                 JOIN harmonogramy h ON p.id_harmonogramu = h.id_harmonogramu
        WHERE ph.data_od <= dzien_odjazdu
          AND (ph.data_do IS NULL OR ph.data_do >= dzien_odjazdu)
          AND (
            (dzien_tygodnia = 'monday' AND h.czy_tydzien[1] = TRUE) OR
            (dzien_tygodnia = 'tuesday' AND h.czy_tydzien[2] = TRUE) OR
            (dzien_tygodnia = 'wednesday' AND h.czy_tydzien[3] = TRUE) OR
            (dzien_tygodnia = 'thursday' AND h.czy_tydzien[4] = TRUE) OR
            (dzien_tygodnia = 'friday' AND h.czy_tydzien[5] = TRUE) OR
            (dzien_tygodnia = 'saturday' AND h.czy_tydzien[6] = TRUE) OR
            (dzien_tygodnia = 'sunday' AND h.czy_tydzien[7] = TRUE)
            )
          AND (
            NOT czy_swieto OR h.czy_swieta = TRUE
            )
        ORDER BY p.godzina_startu;

END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION czy_dzien_to_swieto(dzien_odjazdu DATE)
    RETURNS BOOLEAN AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM swieta_stale WHERE dzien = EXTRACT(DAY FROM dzien_odjazdu) AND miesiac = EXTRACT(MONTH FROM dzien_odjazdu)) THEN
        RETURN TRUE;
    END IF;

    IF EXISTS (SELECT 1 FROM daty_swiat WHERE data = dzien_odjazdu) THEN
        RETURN TRUE;
    END IF;

    RETURN FALSE;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION wszystkie_miejsca_polaczenie(id_pol INTEGER)
RETURNS TABLE(nr_wagonu INTEGER,nr_miejsca INTEGER, nr_przedzialu INTEGER, KLASA INTEGER, czy_dla_niepelnosprawnych BOOLEAN, czy_dla_rowerow BOOLEAN ) AS $$
    BEGIN
        RETURN QUERY SELECT pw.nr_wagonu, m.nr_miejsca, p.nr_przedzialu, p.klasa, m.czy_dla_niepelnosprawnych, m.czy_dla_rowerow FROM polaczenia_wagony pw
            JOIN wagony w ON pw.id_wagonu = w.id_wagonu
            JOIN miejsca m ON w.id_wagonu = m.id_wagonu
            JOIN przedzialy p ON m.nr_przedzialu = p.nr_przedzialu and m.id_wagonu = p.id_wagonu
            WHERE pw.id_polaczenia = id_pol ORDER BY nr_wagonu,nr_przedzialu,nr_miejsca;
    END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION czy_miejsce_wolne(
    p_id_polaczenia INTEGER,
    p_dzien DATE,
    p_id_stacji_start INTEGER,
    p_id_stacji_koniec INTEGER,
    p_nr_wagonu INTEGER,
    p_nr_miejsca INTEGER
) RETURNS BOOLEAN AS $$
DECLARE
    start INT;
    koniec INT;
    is_booked BOOLEAN;
BEGIN
    SELECT numer INTO start
    FROM stacje_na_polaczeniu(p_id_polaczenia)
    WHERE id_stacji = p_id_stacji_start;

    SELECT przyjazd INTO koniec
    FROM stacje_na_polaczeniu(p_id_polaczenia)
    WHERE id_stacji = p_id_stacji_koniec;

    SELECT TRUE INTO is_booked
    FROM bilety_miejsca bm
             JOIN przejazdy pr ON bm.id_przejazdu = pr.id_przejazdu
             JOIN bilety b ON pr.id_biletu = b.id_biletu
             JOIN stacje_na_polaczeniu(pr.id_polaczenia) sp_przejazd_start ON pr.id_stacji_poczatkowej = sp_przejazd_start.id_stacji
             JOIN stacje_na_polaczeniu(pr.id_polaczenia) sp_przejazd_koniec ON pr.id_stacji_koncowej = sp_przejazd_koniec.id_stacji
    WHERE pr.id_polaczenia = p_id_polaczenia
      AND pr.data_odjazdu = p_dzien
      AND b.data_zwrotu IS NULL
      AND bm.nr_wagonu = p_nr_wagonu
      AND bm.nr_miejsca = p_nr_miejsca
      AND (
        (sp_przejazd_koniec.numer BETWEEN start AND koniec) OR
        (sp_przejazd_start.numer BETWEEN start AND koniec) OR
        (start >= sp_przejazd_start.numer AND koniec <= sp_przejazd_koniec.numer) OR
        (start <= sp_przejazd_start.numer AND koniec >= sp_przejazd_koniec.numer)
        )
    LIMIT 1;

    RETURN COALESCE(NOT is_booked, TRUE);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION wszystkie_wolne_dla_polaczenia_dla_klasy(
    id_pol INTEGER,
    dzien_odjazdu DATE,
    id_stacji_start INTEGER,
    id_stacji_koniec INTEGER,
    klasa_miejsca INTEGER,
    czy_dla_niepelnosprawnych_ BOOLEAN,
    czy_dla_rowerow_ BOOLEAN
) RETURNS TABLE(nr_wagonu INTEGER,nr_miejsca INTEGER, nr_przedzialu INTEGER, klasa INTEGER, czy_dla_niepelnosprawnych BOOLEAN,
    czy_dla_rowerow BOOLEAN) AS $$
    BEGIN
        RETURN QUERY SELECT * FROM wszystkie_miejsca_polaczenie(id_pol) m WHERE
        czy_miejsce_wolne(id_pol,dzien_odjazdu,id_stacji_start,id_stacji_koniec,m.nr_miejsca,m.nr_wagonu)
        AND m.klasa = klasa_miejsca AND m.czy_dla_niepelnosprawnych =  czy_dla_niepelnosprawnych_ AND m.czy_dla_rowerow = czy_dla_rowerow_;
    END;
$$ LANGUAGE plpgsql;






--to jest debesciak ostateczna funkcja szukająca połączen pewnie jeszcze beda modyfikacje zeby nie było problemu jeśli będzie 23

CREATE OR REPLACE FUNCTION czas_trasy(id_pol INTEGER, id_stacji_start INTEGER, id_stacji_koniec INTEGER)
RETURNS TIME AS $$
DECLARE
    czas_odjazdu INTEGER;
    czas_przyjazdu INTEGER;
BEGIN
    SELECT odjazd INTO czas_odjazdu FROM stacje_na_polaczeniu(id_pol) WHERE id_stacji = id_stacji_start;
    SELECT przyjazd INTO czas_przyjazdu FROM stacje_na_polaczeniu(id_pol) WHERE id_stacji = id_stacji_koniec;

    RETURN (SELECT (TIME '00:00:00' + (czas_przyjazdu - czas_odjazdu || ' minutes')::INTERVAL)::TIME);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION koszt_przejazdu(liczba_osob INTEGER, czy_dla_rowerow BOOLEAN, id_pol INTEGER, id_stacji_start INTEGER, id_stacji_koniec INTEGER, klasa integer, data DATE)
RETURNS NUMERIC(8,2) AS $$
DECLARE
    koszt_km NUMERIC(8,2);
    koszt_rower NUMERIC(8,2) = 0;
    BEGIN
    IF czy_dla_rowerow  THEN
        SELECT cena_za_rower INTO koszt_rower FROM polaczenia p JOIN przewoznicy pw ON pw.id_przewoznika = p.id_przewoznika
        JOIN historia_cen h ON h.id_przewoznika = pw.id_przewoznika WHERE (data BETWEEN h.data_od AND h.data_do) OR
            (h.data_do IS NULL AND data >= h.data_od);
    END IF;
    IF klasa = 1 THEN
        SELECT cena_za_km_kl1 INTO koszt_km FROM polaczenia p JOIN przewoznicy pw ON pw.id_przewoznika = p.id_przewoznika
        JOIN historia_cen h ON h.id_przewoznika = pw.id_przewoznika WHERE (data BETWEEN h.data_od AND h.data_do) OR
        (h.data_do IS NULL AND data >= h.data_od);
    ELSE
        SELECT cena_za_km_kl2 INTO koszt_km FROM polaczenia p JOIN przewoznicy pw ON pw.id_przewoznika = p.id_przewoznika
        JOIN historia_cen h ON h.id_przewoznika = pw.id_przewoznika WHERE (data BETWEEN h.data_od AND h.data_do) OR
            (h.data_do IS NULL AND data >= h.data_od);
    end if;
        RETURN liczba_osob * dlugosc_drogi(id_pol,id_stacji_start,id_stacji_koniec) * koszt_km + liczba_osob * koszt_rower;


    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION szukaj_polaczenia(
    stacja1 VARCHAR,
    stacja2 VARCHAR,
    liczba_miejsc_klasa1 INTEGER,
    liczba_miejsc_klasa2 INTEGER,
    dzien_szukania DATE,
    godzina TIME,
    czy_dla_niepelnosprawnych boolean,
    czy_dla_rowerow boolean
) RETURNS TABLE (stacja_start VARCHAR, stacja_koniec VARCHAR, godzina_odjazdu TIME, czas_trasy TIME,koszt_przejazdu NUMERIC(8,2)) AS $$
DECLARE
    id_stacji_start INTEGER;
    id_stacji_koniec INTEGER;
BEGIN
    SELECT id_stacji INTO id_stacji_start FROM stacje WHERE nazwa ILIKE stacja1;
    SELECT id_stacji INTO id_stacji_koniec FROM stacje WHERE nazwa ILIKE stacja2;
    IF(godzina < '18:00:00') THEN
    RETURN QUERY
        SELECT
            start.nazwa AS stacja_start,
            koniec.nazwa AS stacja_koniec,
            p.godzina_startu,
            czas_trasy(p.id_polaczenia,id_stacji_start,id_stacji_koniec),
            koszt_przejazdu(liczba_miejsc_klasa1,czy_dla_rowerow,p.id_polaczenia,id_stacji_start,id_stacji_koniec,1,dzien_szukania) +
            koszt_przejazdu(liczba_miejsc_klasa2,czy_dla_rowerow,p.id_polaczenia,id_stacji_start,id_stacji_koniec,2,dzien_szukania)
        FROM
            dostepne_polaczenia_dzien_aktualnosc(id_stacji_start, id_stacji_koniec, dzien_szukania) p
                JOIN
            stacje start ON start.id_stacji = id_stacji_start
                JOIN
            stacje koniec ON koniec.id_stacji = id_stacji_koniec
        WHERE
            (SELECT COUNT(*)
             FROM wszystkie_wolne_dla_polaczenia_dla_klasy(p.id_polaczenia, dzien_szukania, id_stacji_start, id_stacji_koniec,1,czy_dla_niepelnosprawnych,czy_dla_rowerow))
                >= liczba_miejsc_klasa1
          AND
            (SELECT COUNT(*)
             FROM wszystkie_wolne_dla_polaczenia_dla_klasy(p.id_polaczenia, dzien_szukania, id_stacji_start, id_stacji_koniec,2,czy_dla_niepelnosprawnych,czy_dla_rowerow)
            ) >= liczba_miejsc_klasa2
            AND
            p.godzina_startu >= godzina
        ORDER BY p.godzina_startu;
    ELSE
        RETURN QUERY
            (SELECT
                start.nazwa AS stacja_start,
                koniec.nazwa AS stacja_koniec,
                p.godzina_startu,
                czas_trasy(p.id_polaczenia,id_stacji_start,id_stacji_koniec),
                koszt_przejazdu(liczba_miejsc_klasa1,czy_dla_rowerow,p.id_polaczenia,id_stacji_start,id_stacji_koniec,1,dzien_szukania) +
                koszt_przejazdu(liczba_miejsc_klasa2,czy_dla_rowerow,p.id_polaczenia,id_stacji_start,id_stacji_koniec,2,dzien_szukania)
            FROM
                dostepne_polaczenia_dzien_aktualnosc(id_stacji_start, id_stacji_koniec, dzien_szukania) p
                    JOIN
                stacje start ON start.id_stacji = id_stacji_start
                    JOIN
                stacje koniec ON koniec.id_stacji = id_stacji_koniec
            WHERE
                (SELECT COUNT(*)
                 FROM wszystkie_wolne_dla_polaczenia_dla_klasy(p.id_polaczenia, dzien_szukania, id_stacji_start, id_stacji_koniec,1,czy_dla_niepelnosprawnych,czy_dla_rowerow)
                ) >= liczba_miejsc_klasa1
              AND
                (SELECT COUNT(*)
                 FROM wszystkie_wolne_dla_polaczenia_dla_klasy(p.id_polaczenia, dzien_szukania, id_stacji_start, id_stacji_koniec,2,czy_dla_niepelnosprawnych,czy_dla_rowerow)
                ) >= liczba_miejsc_klasa2
              AND
                p.godzina_startu >= godzina
            ORDER BY p.godzina_startu)
        UNION
            (SELECT
                start.nazwa AS stacja_start,
                koniec.nazwa AS stacja_koniec,
                p.godzina_startu,
                czas_trasy(p.id_polaczenia,id_stacji_start,id_stacji_koniec),
                koszt_przejazdu(liczba_miejsc_klasa1,czy_dla_rowerow,p.id_polaczenia,id_stacji_start,id_stacji_koniec,1,dzien_szukania + INTERVAL '1 day') +
                 koszt_przejazdu(liczba_miejsc_klasa2,czy_dla_rowerow,p.id_polaczenia,id_stacji_start,id_stacji_koniec,2,dzien_szukania + INTERVAL '1 day')
            FROM
                dostepne_polaczenia_dzien_aktualnosc(id_stacji_start, id_stacji_koniec, dzien_szukania + INTERVAL '1 day') p
                    JOIN
                stacje start ON start.id_stacji = id_stacji_start
                    JOIN
                stacje koniec ON koniec.id_stacji = id_stacji_koniec
            WHERE
                (SELECT COUNT(*)
                 FROM wszystkie_wolne_dla_polaczenia_dla_klasy(p.id_polaczenia, dzien_szukania + INTERVAL '1 day', id_stacji_start, id_stacji_koniec,1,czy_dla_niepelnosprawnych,czy_dla_rowerow)
                ) >= liczba_miejsc_klasa1
              AND
                (SELECT COUNT(*)
                 FROM wszystkie_wolne_dla_polaczenia_dla_klasy(p.id_polaczenia, dzien_szukania + INTERVAL '1 day', id_stacji_start, id_stacji_koniec,2,czy_dla_niepelnosprawnych,czy_dla_rowerow)
                ) >= liczba_miejsc_klasa2
            ORDER BY p.godzina_startu);
    END IF;
END;
$$ LANGUAGE plpgsql;




--funkcja generująca mozliwe daty biletow dla danego polaczenia

CREATE OR REPLACE FUNCTION losuj_data_odjazdu_dla_polaczenia(
    p_id_polaczenia INT,
    p_start DATE,
    p_end DATE
)
    RETURNS DATE AS $$
DECLARE
    h RECORD;
    harmonogram harmonogramy;
    daty DATE[];
    "current_date" DATE := p_start;
    pasujace_dni DATE[];
    idx INT;
BEGIN
    SELECT h.* INTO harmonogram
    FROM polaczenia p
             JOIN harmonogramy h ON p.id_harmonogramu = h.id_harmonogramu
    WHERE p.id_polaczenia = p_id_polaczenia;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Brak harmonogramu dla polaczenia %', p_id_polaczenia;
    END IF;

    pasujace_dni := ARRAY[]::DATE[];

    WHILE current_date <= p_end LOOP
            IF
                (EXTRACT(DOW FROM "current_date") = 1 AND harmonogram.czy_tydzien[1]) OR
                (EXTRACT(DOW FROM "current_date") = 2 AND harmonogram.czy_tydzien[2]) OR
                (EXTRACT(DOW FROM "current_date") = 3 AND harmonogram.czy_tydzien[3]) OR
                (EXTRACT(DOW FROM "current_date") = 4 AND harmonogram.czy_tydzien[4]) OR
                (EXTRACT(DOW FROM "current_date") = 5 AND harmonogram.czy_tydzien[5]) OR
                (EXTRACT(DOW FROM "current_date") = 6 AND harmonogram.czy_tydzien[6]) OR
                (EXTRACT(DOW FROM "current_date") = 0 AND harmonogram.czy_tydzien[7])
            THEN
                pasujace_dni := pasujace_dni || "current_date";
            END IF;

                    "current_date" := "current_date" + INTERVAL '1 day';
        END LOOP;

    IF array_length(pasujace_dni, 1) IS NULL THEN
        RAISE EXCEPTION 'Brak pasujacych dni w harmonogramie dla polaczenia % w zadanym okresie', p_id_polaczenia;
    END IF;

    idx := FLOOR(random() * array_length(pasujace_dni, 1) + 1)::INT;

    RETURN pasujace_dni[idx];
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_timetable(id_stac INTEGER, data DATE)
    RETURNS TABLE(id_pol_out INTEGER, skad_out VARCHAR, dokad_out VARCHAR, przyjazd_out TIME, odjazd_out TIME) AS $$
BEGIN
    RETURN QUERY SELECT id_pol, get_nazwa_stacji(id_stac_start), get_nazwa_stacji(id_stac_koniec),
                        CASE
                            WHEN id_stac = id_stac_start THEN NULL
                            ELSE oblicz_godzine_przyjazdu(id_stac,id_pol)
                            END,
                        CASE
                            WHEN id_stac = id_stac_koniec THEN NULL
                            ELSE oblicz_godzine_odjazdu(id_stac,id_pol)
                            END
                 FROM polaczenia_wraz_z_dana_stacja(id_stac) WHERE is_poloczenie_active(id_pol,data);

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_stacje_by_prefix(prefix TEXT)
    RETURNS TABLE (
                      id_stacji INTEGER,
                      nazwa VARCHAR,
                      tory INTEGER
                  ) AS $$
BEGIN
    RETURN QUERY
        SELECT s.id_stacji, s.nazwa, s.tory
        FROM stacje s
        WHERE s.nazwa ILIKE prefix || '%'
        ORDER BY s.tory DESC, s.nazwa;
END;
$$ LANGUAGE plpgsql;