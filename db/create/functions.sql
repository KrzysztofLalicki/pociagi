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

CREATE OR REPLACE FUNCTION swieto(day DATE) RETURNS BOOLEAN AS
$$
BEGIN
    IF (SELECT COUNT(*) FROM daty_swiat WHERE data = day) > 0 THEN RETURN TRUE; END IF;
    IF (SELECT COUNT(*) FROM swieta_stale WHERE dzien = EXTRACT('day' FROM day)
        AND miesiac = EXTRACT('month' FROM day)) > 0 THEN RETURN TRUE; END IF;
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION polaczenia_wraz_z_dana_stacja(id_stac INTEGER)
RETURNS TABLE (id_pol INTEGER, id_stac_start INTEGER,id_stac_koniec INTEGER) AS $$
    BEGIN
        RETURN QUERY SELECT sp.id_polaczenia,(SELECT id_stacji FROM stacje_posrednie sp2 WHERE sp2.id_polaczenia = sp.id_polaczenia ORDER BY odjazd LIMIT 1),
        (SELECT id_stacji FROM stacje_posrednie sp2 WHERE sp2.id_polaczenia = sp.id_polaczenia ORDER BY odjazd DESC LIMIT 1)
         FROM stacje_posrednie sp WHERE id_stacji = id_stac;
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
            SELECT czy_tydzien[7] INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        WHEN 1 THEN
            SELECT czy_tydzien[1] INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        WHEN 2 THEN
            SELECT czy_tydzien[2] INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        WHEN 3 THEN
            SELECT czy_tydzien[3] INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        WHEN 4 THEN
            SELECT czy_tydzien[4] INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        WHEN 5 THEN
            SELECT czy_tydzien[5] INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        ELSE
            SELECT czy_tydzien[6] INTO wynik
            FROM harmonogramy
            WHERE id_harmonogramu = id;
        END CASE;

    RETURN COALESCE(wynik, FALSE);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION is_poloczenie_active(id INTEGER, data DATE)
    RETURNS BOOLEAN AS $$
DECLARE
    id_harmonogram INTEGER := (SELECT id_harmonogramu FROM polaczenia WHERE id_polaczenia = id);
    pol_od DATE;
    pol_do DATE;
BEGIN
    SELECT data_od, COALESCE(data_do, 'infinity'::date) INTO pol_od, pol_do FROM historia_polaczenia WHERE id_polaczenia = id;
    RETURN is_harmonogram_active(id_harmonogram, data) AND (data BETWEEN pol_od AND pol_do) AND
    (NOT swieto(data) OR (SELECT h.czy_swieta FROM harmonogramy h WHERE h.id_harmonogramu = id_harmonogram));
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
