
--ostateczna funkcja sprawdzajaca zwracajaca tabele polaczen z ktorych mozna skorzystac


CREATE OR REPLACE FUNCTION dostepne_polaczenia_z_wolnymi_miejscami(
    id_stacji_start INTEGER,
    id_stacji_koniec INTEGER,
    data_odjazdu DATE
)
    RETURNS TABLE (
                      id_polaczenia INTEGER,
                      godzina_odjazdu TIME,
                      czas_przejazdu INTERVAL,
                      data_wyjazdu DATE
                  ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            dp.id_polaczenia,
            dp.godzina_odjazdu,
            dp.czas_przejazdu,
            dp.data_wyjazdu
        FROM
            dostepne_aktualne_polaczenia(id_stacji_start, id_stacji_koniec, data_odjazdu) dp
        WHERE
            czy_sa_wolne_miejsca(dp.id_polaczenia, id_stacji_start, id_stacji_koniec, data_odjazdu)
        ORDER BY
            dp.godzina_odjazdu;
END;
$$ LANGUAGE plpgsql;




--rozklad stacji dla polaczenia

CREATE OR REPLACE FUNCTION stacje_dla_polaczenia(
    p_id_polaczenia INT
)
    RETURNS TABLE (
                      lp BIGINT,
                      id_stacji INT,
                      nazwa_stacji VARCHAR,
                      przyjazd INTERVAL,
                      odjazd INTERVAL
                  ) AS $$
BEGIN
    RETURN QUERY
        WITH trasa_data AS (
            SELECT p.id_trasy
            FROM polaczenia p
            WHERE p.id_polaczenia = p_id_polaczenia
        ),
             trasa_stacje AS (
                 -- Stacja startowa
                 SELECT
                     1 AS kolejność,
                     s_start.id_stacji,
                     s_start.nazwa AS nazwa_stacji,
                     INTERVAL '0 seconds' AS przyjazd,
                     INTERVAL '0 seconds' AS odjazd
                 FROM trasa_data td
                          JOIN trasy t ON t.id_trasy = td.id_trasy
                          JOIN stacje s_start ON s_start.id_stacji = t.skad

                 UNION ALL

                 -- Stacje pośrednie
                 SELECT
                     2 + ROW_NUMBER() OVER (ORDER BY sp.przyjazd) AS kolejność,
                     sp.id_stacji,
                     s.nazwa,
                     sp.przyjazd,
                     sp.odjazd
                 FROM trasa_data td
                          JOIN stacje_posrednie sp ON sp.id_trasy = td.id_trasy
                          JOIN stacje s ON sp.id_stacji = s.id_stacji

                 UNION ALL

                 -- Stacja końcowa
                 SELECT
                     500 AS kolejność,
                     s_koniec.id_stacji,
                     s_koniec.nazwa,
                     (SELECT t.czas FROM trasy t WHERE t.id_trasy = td.id_trasy) AS przyjazd,
                     NULL::INTERVAL AS odjazd
                 FROM trasa_data td
                          JOIN trasy t ON t.id_trasy = td.id_trasy
                          JOIN stacje s_koniec ON s_koniec.id_stacji = t.dokad
             )
        SELECT
                    ROW_NUMBER() OVER (ORDER BY kolejność) AS lp,
                    ts.id_stacji,
                    ts.nazwa_stacji,
                    ts.przyjazd,
                    ts.odjazd
        FROM trasa_stacje ts
        ORDER BY kolejność;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION czy_sa_wolne_miejsca(
    p_id_polaczenia INT,
    p_id_stacji_od INT,
    p_id_stacji_do INT,
    p_data_odjazdu DATE
)
    RETURNS BOOLEAN AS $$
DECLARE
    lp_od INT;
    lp_do INT;
    wolne BOOLEAN;
BEGIN
    -- Pobierz lp stacji startowej i końcowej na trasie
    SELECT lp INTO lp_od FROM stacje_dla_polaczenia(p_id_polaczenia) WHERE id_stacji = p_id_stacji_od;
    SELECT lp INTO lp_do FROM stacje_dla_polaczenia(p_id_polaczenia) WHERE id_stacji = p_id_stacji_do;

    SELECT EXISTS (
        SELECT 1
        FROM polaczenia_wagony pw
                 JOIN miejsca m ON m.id_wagonu = pw.id_wagonu
                 LEFT JOIN bilety b ON b.id_polaczenia = p_id_polaczenia
            AND b.data_odjazdu = p_data_odjazdu
                 LEFT JOIN bilety_miejsca bm ON bm.id_biletu = b.id_biletu
            AND bm.id_wagonu = m.id_wagonu
            AND bm.nr_miejsca = m.nr_miejsca
        WHERE pw.id_polaczenia = p_id_polaczenia
          AND bm.id_biletu IS NULL -- miejsce nie jest zajęte
          AND NOT EXISTS (
            -- Sprawdź kolizję tras biletów
            SELECT 1
            FROM bilety b2
                     JOIN bilety_miejsca bm2 ON bm2.id_biletu = b2.id_biletu
                     JOIN stacje_dla_polaczenia(p_id_polaczenia) s_start ON s_start.id_stacji = b2.id_stacji_poczatkowej
                     JOIN stacje_dla_polaczenia(p_id_polaczenia) s_end ON s_end.id_stacji = b2.id_stacji_koncowej
            WHERE b2.id_polaczenia = p_id_polaczenia
              AND b2.data_odjazdu = p_data_odjazdu
              AND bm2.id_wagonu = m.id_wagonu
              AND bm2.nr_miejsca = m.nr_miejsca
              AND s_start.lp < lp_do
              AND s_end.lp > lp_od
        )
        LIMIT 1
    ) INTO wolne;

    RETURN wolne;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION wolne_miejsca_lista(
    p_id_polaczenia INT,
    p_id_stacji_od INT,
    p_id_stacji_do INT,
    p_data_odjazdu DATE
)
    RETURNS TABLE (
                      id_wagonu INT,
                      nr_przedzialu INT,
                      nr_miejsca INT
                  ) AS $$
DECLARE
    lp_od INT;
    lp_do INT;
BEGIN
    SELECT lp INTO lp_od FROM stacje_dla_polaczenia(p_id_polaczenia) WHERE id_stacji = p_id_stacji_od;
    SELECT lp INTO lp_do FROM stacje_dla_polaczenia(p_id_polaczenia) WHERE id_stacji = p_id_stacji_do;

    RETURN QUERY
        SELECT
            m.id_wagonu,
            m.nr_przedzialu,
            m.nr_miejsca
        FROM
            polaczenia_wagony pw
                JOIN miejsca m ON m.id_wagonu = pw.id_wagonu
                LEFT JOIN bilety b ON b.id_polaczenia = p_id_polaczenia
                AND b.data_odjazdu = p_data_odjazdu
                LEFT JOIN bilety_miejsca bm ON bm.id_biletu = b.id_biletu
                AND bm.id_wagonu = m.id_wagonu
                AND bm.nr_miejsca = m.nr_miejsca
        WHERE
            pw.id_polaczenia = p_id_polaczenia
          AND bm.id_biletu IS NULL
          AND NOT EXISTS (
            SELECT 1
            FROM bilety b2
                     JOIN bilety_miejsca bm2 ON bm2.id_biletu = b2.id_biletu
                     JOIN stacje_dla_polaczenia(p_id_polaczenia) s_start ON s_start.id_stacji = b2.id_stacji_poczatkowej
                     JOIN stacje_dla_polaczenia(p_id_polaczenia) s_end ON s_end.id_stacji = b2.id_stacji_koncowej
            WHERE b2.id_polaczenia = p_id_polaczenia
              AND b2.data_odjazdu = p_data_odjazdu
              AND bm2.id_wagonu = m.id_wagonu
              AND bm2.nr_miejsca = m.nr_miejsca
              AND s_start.lp < lp_do
              AND s_end.lp > lp_od
        )
        ORDER BY
            m.id_wagonu,
            m.nr_przedzialu,
            m.nr_miejsca;
END;
$$ LANGUAGE plpgsql;




--funkcja znajdujaca polaczenia ktore sa aktualne

CREATE OR REPLACE FUNCTION dostepne_aktualne_polaczenia(
    id_stacji_start INTEGER,
    id_stacji_koniec INTEGER,
    data_odjazdu DATE
)
    RETURNS TABLE (
                      id_polaczenia INTEGER,
                      godzina_startu TIME,
                      godzina_odjazdu TIME,
                      czas_przejazdu INTERVAL,
                      data_wyjazdu DATE
                  ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            dp.id_polaczenia,
            dp.godzina_startu,
            dp.godzina_odjazdu,
            dp.czas_przejazdu,
            dp.data_wyjazdu
        FROM
            dostepne_polaczenia(id_stacji_start, id_stacji_koniec, data_odjazdu) dp
                JOIN
            historia_polaczenia h ON dp.id_polaczenia = h.id_polaczenia
        WHERE
            dp.data_wyjazdu >= h.data_od
          AND (h.data_do IS NULL OR dp.data_wyjazdu <= h.data_do)
        ORDER BY
            dp.godzina_odjazdu;
END;
$$ LANGUAGE plpgsql;




--znajduje polaczenia ktore moga byc ok ale nie sprawdza czy sa aktualne

CREATE OR REPLACE FUNCTION dostepne_polaczenia(
    id_stacji_start INTEGER,
    id_stacji_koniec INTEGER,
    data_odjazdu DATE
)
    RETURNS TABLE (
                      id_polaczenia INTEGER,
                      godzina_startu TIME,
                      godzina_odjazdu TIME,
                      czas_przejazdu INTERVAL,
                      data_wyjazdu DATE
                  ) AS $$
DECLARE
    dzien_tygodnia TEXT;
BEGIN
    SELECT LOWER(TRIM(TO_CHAR(data_odjazdu, 'Day'))) INTO dzien_tygodnia;

    RETURN QUERY
        SELECT
            p.id_polaczenia,
            p.godzina_startu,
            (p.godzina_startu + d.czas_odjazdu_skad) AS godzina_odjazdu,
            (d.czas_odjazdu_dokad - d.czas_odjazdu_skad) AS czas_przejazdu,
            data_odjazdu AS data_wyjazdu
        FROM
            polaczenia p
                JOIN
            dwie_stacje_na_trasie(id_stacji_start, id_stacji_koniec) d ON p.id_trasy = d.id_trasy
                JOIN
            harmonogramy h ON p.id_harmonogramu = h.id_harmonogramu
        WHERE
            CASE dzien_tygodnia
                WHEN 'monday' THEN h.czy_poniedzialek
                WHEN 'tuesday' THEN h.czy_wtorek
                WHEN 'wednesday' THEN h.czy_sroda
                WHEN 'thursday' THEN h.czy_czwartek
                WHEN 'friday' THEN h.czy_piatek
                WHEN 'saturday' THEN h.czy_sobota
                WHEN 'sunday' THEN h.czy_niedziela
                ELSE FALSE
                END = TRUE
        ORDER BY
            godzina_odjazdu;
END;
$$ LANGUAGE plpgsql;








--funkcja zwracajaca kolejne stacje dla trasy i stacji poczatkowej i koncowej

CREATE OR REPLACE FUNCTION stacje_dla_trasy_od_do(
    p_id_trasy INT,
    p_id_stacji_start INT,
    p_id_stacji_koniec INT
)
    RETURNS TABLE (
                      lp BIGINT,
                      id_stacji INT,
                      nazwa_stacji VARCHAR,
                      przyjazd INTERVAL,
                      odjazd INTERVAL
                  ) AS $$
BEGIN
    RETURN QUERY
        WITH trasa_stacje AS (
            -- Stacja startowa
            SELECT
                1 AS kolejność,
                s_start.id_stacji,
                s_start.nazwa AS nazwa_stacji,
                COALESCE(
                        (SELECT sp.przyjazd FROM stacje_posrednie sp
                         WHERE sp.id_trasy = p_id_trasy AND sp.id_stacji = p_id_stacji_start
                         LIMIT 1),
                        NULL
                ) AS przyjazd,
                COALESCE(
                        (SELECT sp.odjazd FROM stacje_posrednie sp
                         WHERE sp.id_trasy = p_id_trasy AND sp.id_stacji = p_id_stacji_start
                         LIMIT 1),
                        NULL
                ) AS odjazd
            FROM stacje s_start
            WHERE s_start.id_stacji = p_id_stacji_start

            UNION ALL

            -- Stacje pośrednie
            SELECT
                2 + ROW_NUMBER() OVER (ORDER BY sp.przyjazd) AS kolejność,
                sp.id_stacji,
                s.nazwa,
                sp.przyjazd,
                sp.odjazd
            FROM stacje_posrednie sp
                     JOIN stacje s ON sp.id_stacji = s.id_stacji
            WHERE sp.id_trasy = p_id_trasy
              AND sp.id_stacji NOT IN (p_id_stacji_start, p_id_stacji_koniec)
              AND sp.przyjazd >= COALESCE(
                    (SELECT sp2.przyjazd FROM stacje_posrednie sp2
                     WHERE sp2.id_trasy = p_id_trasy AND sp2.id_stacji = p_id_stacji_start
                     LIMIT 1),
                    INTERVAL '0'
                                 )
              AND sp.przyjazd <= COALESCE(
                    (SELECT sp3.przyjazd FROM stacje_posrednie sp3
                     WHERE sp3.id_trasy = p_id_trasy AND sp3.id_stacji = p_id_stacji_koniec
                     LIMIT 1),
                    (SELECT czas FROM trasy WHERE id_trasy = p_id_trasy)
                                 )

            UNION ALL

            -- Stacja końcowa
            SELECT
                500 AS kolejność,
                s_koniec.id_stacji,
                s_koniec.nazwa,
                COALESCE(
                        (SELECT sp.przyjazd FROM stacje_posrednie sp
                         WHERE sp.id_trasy = p_id_trasy AND sp.id_stacji = p_id_stacji_koniec
                         LIMIT 1),
                        (SELECT czas FROM trasy WHERE id_trasy = p_id_trasy)
                ) AS przyjazd,
                NULL::INTERVAL AS odjazd
            FROM stacje s_koniec
            WHERE s_koniec.id_stacji = p_id_stacji_koniec
        )
        SELECT
                    ROW_NUMBER() OVER (ORDER BY kolejność) AS lp,
                    t.id_stacji,
                    t.nazwa_stacji,
                    t.przyjazd,
                    t.odjazd
        FROM trasa_stacje t
        ORDER BY kolejność;
END;
$$ LANGUAGE plpgsql;




--funkcja zwraca trasy na ktorych sa dane dwie stacje
CREATE OR REPLACE FUNCTION dwie_stacje_na_trasie(id_skad INTEGER, id_dokad INTEGER)
    RETURNS TABLE (
                      id_trasy INTEGER,
                      czas_odjazdu_skad INTERVAL,
                      czas_odjazdu_dokad INTERVAL
                  ) AS $$
BEGIN
    RETURN QUERY
        WITH stacje_czasy AS (
            SELECT
                t.id_trasy,
                t.skad AS id_stacji,
                INTERVAL '0' AS czas_odjazdu
            FROM trasy t
            UNION ALL
            SELECT
                t.id_trasy,
                t.dokad AS id_stacji,
                t.czas AS czas_odjazdu
            FROM trasy t
            UNION ALL
            SELECT
                sp.id_trasy,
                sp.id_stacji,
                sp.odjazd
            FROM stacje_posrednie sp
                     JOIN trasy t ON sp.id_trasy = t.id_trasy
        ),
             stacje_para AS (
                 SELECT
                     s1.id_trasy,
                     s1.czas_odjazdu AS czas_odjazdu_skad,
                     s2.czas_odjazdu AS czas_odjazdu_dokad
                 FROM stacje_czasy s1
                          JOIN stacje_czasy s2 ON s1.id_trasy = s2.id_trasy
                 WHERE s1.id_stacji = id_skad AND s2.id_stacji = id_dokad
             )
        SELECT
            sp.id_trasy,
            sp.czas_odjazdu_skad,
            sp.czas_odjazdu_dokad
        FROM stacje_para sp
        WHERE sp.czas_odjazdu_skad < sp.czas_odjazdu_dokad;
END;
$$ LANGUAGE plpgsql;










--zwraca dlugosc drogi od dnaej stacji do innej

CREATE OR REPLACE FUNCTION dlugosc_drogi(
    id_trasy_f INTEGER,
    id_stacji_start INTEGER,
    id_stacji_koniec INTEGER
) RETURNS INTEGER AS $$
DECLARE
    odleglosc_total INTEGER := 0;
    stacje_na_trasie INTEGER[];
    obecna_stacja INTEGER;
    nastepna_stacja INTEGER;
    i INTEGER;
    odleglosc_miedzy INTEGER;
BEGIN
    WITH stacje_pozycje AS (
        SELECT tr.skad AS id_stacji, 0 AS pozycja
        FROM trasy tr
        WHERE tr.id_trasy = id_trasy_f

        UNION ALL

        SELECT sp.id_stacji, 1 AS pozycja
        FROM stacje_posrednie sp
        WHERE sp.id_trasy = id_trasy_f

        UNION ALL

        SELECT tr.dokad AS id_stacji, 2 AS pozycja
        FROM trasy tr
        WHERE tr.id_trasy = id_trasy_f
    ),
         stacje_trasowe AS (
             SELECT id_stacji
             FROM stacje_pozycje
             ORDER BY
                 pozycja,
                 CASE WHEN pozycja = 1 THEN (SELECT przyjazd FROM stacje_posrednie
                                             WHERE id_trasy = id_trasy_f AND id_stacji = stacje_pozycje.id_stacji)
                      ELSE NULL END
         )
    SELECT array_agg(id_stacji) INTO stacje_na_trasie
    FROM stacje_trasowe;

    DECLARE
        start_idx INTEGER := array_position(stacje_na_trasie, id_stacji_start);
        koniec_idx INTEGER := array_position(stacje_na_trasie, id_stacji_koniec);
    BEGIN

        FOR i IN start_idx..koniec_idx-1 LOOP
                obecna_stacja := stacje_na_trasie[i];
                nastepna_stacja := stacje_na_trasie[i+1];

                SELECT l.odleglosc INTO odleglosc_miedzy
                FROM linie l
                WHERE (l.stacja1 = obecna_stacja AND l.stacja2 = nastepna_stacja)
                   OR (l.stacja1 = nastepna_stacja AND l.stacja2 = obecna_stacja)
                LIMIT 1;

                odleglosc_total := odleglosc_total + odleglosc_miedzy;
            END LOOP;
    END;

    RETURN odleglosc_total;
END;
$$ LANGUAGE plpgsql;


--Zwraca tabele wszystkich miejsc dla danego polaczenia (i opcjonalnie czasu odjazdu)

CREATE OR REPLACE FUNCTION wszystkie_miejsca(szukane_id_pol INTEGER)
RETURNS TABLE(id_miejsca INTEGER, nr_przedzialu INTEGER, id_wagonu INTEGER) AS $$
BEGIN
    RETURN QUERY
        SELECT m.nr_miejsca, p.nr_przedzialu, w.id_wagonu
        FROM wagony w
                 JOIN przedzialy p ON w.id_wagonu = p.id_wagonu
                 JOIN miejsca m ON p.nr_przedzialu = m.nr_przedzialu AND p.id_wagonu = m.id_wagonu
                 JOIN polaczenia_wagony pw ON w.id_wagonu = pw.id_wagonu
        WHERE pw.id_polaczenia = szukane_id_pol;
END;
$$ LANGUAGE plpgsql;

