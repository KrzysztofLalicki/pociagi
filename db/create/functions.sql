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

CREATE FUNCTION swieto(day DATE) RETURNS BOOLEAN AS
$$
BEGIN
    IF (SELECT COUNT(*) FROM daty_swiat WHERE data = day) > 0 THEN RETURN TRUE; END IF;
    IF (SELECT COUNT(*) FROM swieta_stale WHERE dzien = EXTRACT('day' FROM day)
        AND miesiac = EXTRACT('month' FROM day)) > 0 THEN RETURN TRUE; END IF;
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION is_harmonogram_active(id INTEGER, data DATE)
    RETURNS BOOLEAN AS $$
DECLARE
    dzien_tygodnia INT;
    wynik BOOLEAN;
BEGIN
    dzien_tygodnia := EXTRACT(DOW FROM data);

    CASE dzien_tygodnia
        WHEN 0 THEN
            SELECT czy_niedziela INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        WHEN 1 THEN
            SELECT czy_poniedzialek INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        WHEN 2 THEN
            SELECT czy_wtorek INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        WHEN 3 THEN
            SELECT czy_sroda INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        WHEN 4 THEN
            SELECT czy_czwartek INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        WHEN 5 THEN
            SELECT czy_piatek INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        ELSE
            SELECT czy_sobota INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        END CASE;

    RETURN COALESCE(wynik, FALSE);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION is_poloczenie_active(id INTEGER, data DATE)
    RETURNS BOOLEAN AS $$
DECLARE
    id_harmonogramu INTEGER := (SELECT id_harmonogramu FROM polaczenia WHERE id_polaczenia = id);
    pol_od DATE;
    pol_do DATE;
BEGIN
    SELECT data_od, COALESCE(data_do, 'infinity'::date) INTO pol_od, pol_do FROM historia_polaczenia WHERE id_polaczenia = id;
    RETURN is_harmonogram_active(id_harmonogramu, data) AND (data BETWEEN pol_od AND pol_do);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_czasy_stacji(
    id_stac INTEGER,
    id_pol INTEGER,
    data DATE
)
    RETURNS TABLE (czas_przyjazdu TIMESTAMP, czas_odjazdu TIMESTAMP) AS $$
DECLARE
    trasa_id INTEGER;
    godzina_startu TIME;
    start_timestamp TIMESTAMP;
    przyjazd_i INTERVAL;
    odjazd_i INTERVAL;
    stacja_poczatkowa INTEGER;
    stacja_koncowa INTEGER;
BEGIN
    IF NOT is_poloczenie_active(id_pol, data) THEN
        RETURN;
    END IF;

    SELECT p.id_trasy, p.godzina_startu INTO trasa_id, godzina_startu
    FROM polaczenia p
    WHERE p.id_polaczenia = id_pol;

    start_timestamp := data + godzina_startu;

    SELECT skad, dokad INTO stacja_poczatkowa, stacja_koncowa
    FROM trasy
    WHERE id_trasy = trasa_id;

    IF id_stac = stacja_poczatkowa THEN
        czas_przyjazdu := NULL;
        czas_odjazdu := start_timestamp;
    ELSIF id_stac = stacja_koncowa THEN
        czas_przyjazdu := start_timestamp + (SELECT czas FROM trasy WHERE id_trasy = trasa_id);
        czas_odjazdu := NULL;
    ELSE
        SELECT sp.przyjazd, sp.odjazd INTO przyjazd_i, odjazd_i
        FROM stacje_posrednie sp
        WHERE sp.id_trasy = trasa_id AND sp.id_stacji = id_stac;

        czas_przyjazdu := start_timestamp + przyjazd_i;
        czas_odjazdu := start_timestamp + odjazd_i;
    END IF;

    RETURN NEXT;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_nazwa_stacji(id INTEGER)
    RETURNS VARCHAR AS $$
DECLARE
    nazwa_stacji VARCHAR;
BEGIN
    SELECT nazwa INTO nazwa_stacji
    FROM stacje
    WHERE id_stacji = id;

    RETURN nazwa_stacji;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_timetable(id_stac INTEGER, data DATE)
RETURNS TABLE(id_pol_out INTEGER, skad_out VARCHAR, dokad_out VARCHAR, przyjazd_out TIME, odjazd_out TIME) AS $$
DECLARE
    id_tra INTEGER;
    skad_id INTEGER;
    dokad_id INTEGER;
    przyjazd TIMESTAMP;
    odjazd TIMESTAMP;
BEGIN
    FOR id_pol_out, id_tra IN
        SELECT id_polaczenia, id_trasy
        FROM polaczenia
        WHERE id_trasy IN
            ((SELECT id_trasy FROM stacje_posrednie WHERE id_stacji = id_stac)
            UNION
            (SELECT id_trasy FROM trasy WHERE skad = id_stac OR dokad = id_stac))
    LOOP
        SELECT czas_przyjazdu, czas_odjazdu
        INTO przyjazd, odjazd
        FROM get_czasy_stacji(id_stac, id_pol_out, data - 1)
        LIMIT 1;

        IF DATE(przyjazd) = data OR DATE(odjazd) = data THEN
            SELECT skad, dokad
            INTO skad_id, dokad_id
            FROM trasy WHERE id_trasy = id_tra;

            skad_out := get_nazwa_stacji(skad_id);
            dokad_out := get_nazwa_stacji(dokad_id);

            przyjazd_out = przyjazd::time;
            odjazd_out = odjazd::time;

            RETURN NEXT;
        END IF;

        SELECT czas_przyjazdu, czas_odjazdu
        INTO przyjazd, odjazd
        FROM get_czasy_stacji(id_stac, id_pol_out, data)
        LIMIT 1;


        IF DATE(przyjazd) = data OR DATE(odjazd) = data THEN
            SELECT skad, dokad
            INTO skad_id, dokad_id
            FROM trasy WHERE id_trasy = id_tra;

            skad_out := get_nazwa_stacji(skad_id);
            dokad_out := get_nazwa_stacji(dokad_id);

            IF DATE(przyjazd) = data THEN
                przyjazd_out := przyjazd::time; END IF;
            IF DATE(odjazd) = data THEN
                odjazd_out := odjazd::time; END IF;

            RETURN NEXT;

            przyjazd_out = null;
            odjazd_out = null;
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;