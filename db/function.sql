

--zwraca tabele wolnych miejsc dla danego polaczenia i czasu odjazdu

CREATE OR REPLACE FUNCTION wolne_miejsca(szukane_id_pol INTEGER, data_odjazdu_ DATE)
    RETURNS TABLE(id_miejsca INTEGER, nr_przedzialu INTEGER, id_wagonu INTEGER) AS $$
BEGIN
    RETURN QUERY
        SELECT m.nr_miejsca, p.nr_przedzialu, w.id_wagonu
        FROM wagony w
                 JOIN przedzialy p ON w.id_wagonu = p.id_wagonu
                 JOIN miejsca m ON p.nr_przedzialu = m.nr_przedzialu AND p.id_wagonu = m.id_wagonu
                 JOIN polaczenia_wagony pw ON w.id_wagonu = pw.id_wagonu
        WHERE pw.id_polaczenia = szukane_id_pol
          AND NOT EXISTS (
            SELECT 1
            FROM bilety b
                     JOIN bilety_miejsca bm ON b.id_biletu = bm.id_biletu
            WHERE b.id_polaczenia = szukane_id_pol
              AND b.data_odjazdu = data_odjazdu_
              AND bm.nr_miejsca = m.nr_miejsca
              AND bm.id_wagonu = w.id_wagonu
              AND b.data_zwrotu IS NULL
        );
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

CREATE OR REPLACE FUNCTION wszystkie_miejsca(szukane_id_pol INTEGER,data_odjazdu_ DATE)
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


--Znajduje polaczenie po nazwach bez przesiadek i zwraca tabele

CREATE OR REPLACE FUNCTION znajdz_polaczenia(
    stacja_start_nazwa VARCHAR,
    stacja_koniec_nazwa VARCHAR
) RETURNS TABLE(
                   id_polaczenia INTEGER,
                   godzina_startu TIME,
                   nazwa_przewoznika VARCHAR,
                   czas_podrozy INTERVAL
               ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            p.id_polaczenia,
            p.godzina_startu,
            pr.nazwa_przewoznika,
            t.czas AS czas_podrozy
        FROM
            polaczenia p
                JOIN trasy t ON p.id_trasy = t.id_trasy
                JOIN stacje s_start ON t.skad = s_start.id_stacji
                JOIN stacje s_koniec ON t.dokad = s_koniec.id_stacji
                JOIN przewoznicy pr ON p.id_przewoznika = pr.id_przewoznika
        WHERE
            s_start.nazwa = stacja_start_nazwa
          AND s_koniec.nazwa = stacja_koniec_nazwa
        ORDER BY
            p.godzina_startu;
END;
$$ LANGUAGE plpgsql;
