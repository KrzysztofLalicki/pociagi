-- Tabela harmonogramy
INSERT INTO harmonogramy (czy_tydzien, czy_swieta)
VALUES
    ('{TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE}', TRUE),
    ('{FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE}', FALSE);

-- Tabela pasazerowie
INSERT INTO pasazerowie (imie, nazwisko, email)
VALUES
    ('Jan', 'Kowalski', 'jan.kowalski@example.com'),
    ('Anna', 'Nowak', 'anna.nowak@example.com');

-- Tabela stacje
INSERT INTO stacje (nazwa, tory)
VALUES
    ('Warszawa Centralna', 5),
    ('Kraków Główny', 3),
    ('Łódź Fabryczna', 2),
    ('Wrocław Główny', 4),
    ('Katowice', 3),
    ('Poznań Główny', 4);

-- Tabela linie
INSERT INTO linie (stacja1, stacja2, odleglosc)
VALUES
    (1, 2, 300),
    (2, 3, 150),
    (3, 4, 200),
    (4, 5, 100),
    (5, 6, 180),
    (1, 3, 420),
    (2, 4, 350),
    (3, 5, 450),
    (4, 6, 300);

-- Tabela przewoznicy
INSERT INTO przewoznicy (nazwa_przewoznika)
VALUES
    ('PKP Intercity'),
    ('Przewozy Regionalne');

-- Tabela historia_cen
INSERT INTO historia_cen (id_przewoznika, data_od, data_do, cena_za_km_kl1, cena_za_km_kl2, cena_za_rower)
VALUES
    (1, '2025-01-01', '2025-12-31', 1.2, 1.0, 5.0),
    (2, '2025-01-01', '2025-12-31', 1.0, 0.9, 4.5);

-- Tabela polaczenia
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika)
VALUES
    ('08:00:00', 1, 1),
    ('12:00:00', 2, 2);

-- Tabela stacje_posrednie - dodanie kilku stacji pośrednich do połączenia
-- Połączenie 1: Warszawa Centralna -> Kraków Główny -> Łódź Fabryczna -> Wrocław Główny
INSERT INTO stacje_posrednie (id_polaczenia, id_stacji, przyjazd, odjazd, zatrzymanie, tor)
VALUES
    (1, 1, 8, 8, TRUE, 1),  -- Warszawa Centralna
    (1, 2, 10, 10, TRUE, 2), -- Kraków Główny
    (1, 3, 12, 12, TRUE, 3), -- Łódź Fabryczna
    (1, 4, 14, 14, TRUE, 4); -- Wrocław Główny

-- Połączenie 2: Kraków Główny -> Katowice -> Poznań Główny
INSERT INTO stacje_posrednie (id_polaczenia, id_stacji, przyjazd, odjazd, zatrzymanie, tor)
VALUES
    (2, 2, 9, 9, TRUE, 1),  -- Kraków Główny
    (2, 5, 11, 11, TRUE, 2), -- Katowice
    (2, 6, 13, 13, TRUE, 3); -- Poznań Główny

-- Tabela historia_polaczenia
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do)
VALUES
    (1, '2025-01-01', '2025-12-31'),
    (2, '2025-01-01', '2025-12-31');

-- Tabela bilety
INSERT INTO bilety (id_pasazera, data_zakupu, data_zwrotu)
VALUES
    (1, '2025-06-01', NULL),
    (2, '2025-06-01', '2025-06-10');

-- Tabela przejazdy
INSERT INTO przejazdy (id_biletu, id_polaczenia, id_stacji_poczatkowej, id_stacji_koncowej, data_odjazdu)
VALUES
    (1, 1, 1, 4, '2025-06-10'),
    (2, 2, 2, 6,'2025-06-15');

-- Tabela wagony
INSERT INTO wagony (klimatyzacja, restauracyjny)
VALUES
    (TRUE, FALSE),
    (FALSE, TRUE);

-- Tabela przedzialy
INSERT INTO przedzialy (nr_przedzialu, id_wagonu, klasa, czy_zamkniety, strefa_ciszy)
VALUES
    (1, 1, 1, FALSE, TRUE),
    (2, 2, 2, TRUE, FALSE);

-- Tabela miejsca
INSERT INTO miejsca (nr_miejsca, id_wagonu, nr_przedzialu, czy_dla_niepelnosprawnych, czy_dla_rowerow)
VALUES
    (1, 1, 1, FALSE, FALSE),
    (2, 2, 2, TRUE, TRUE);

-- Tabela ulgi
INSERT INTO ulgi (nazwa, znizka)
VALUES
    ('Senior', 50),
    ('Dziecko', 30);

-- Tabela bilety_miejsca
INSERT INTO bilety_miejsca (id_przejazdu,nr_wagonu, nr_miejsca, id_ulgi)
VALUES
    (1, 1, 1, 1),
    (2, 2, 2, 2);

-- Tabela polaczenia_wagony
INSERT INTO polaczenia_wagony (id_polaczenia, nr_wagonu, id_wagonu)
VALUES
    (1,2,1),
    (1, 1, 1),
    (2, 2, 2);

-- Tabela swieta_stale
INSERT INTO swieta_stale (nazwa, dzien, miesiac)
VALUES
    ('Nowy Rok', 1, 1),
    ('Boże Narodzenie', 25, 12);

-- Tabela swieta_ruchome
INSERT INTO swieta_ruchome (nazwa)
VALUES
    ('Wielkanoc'),
    ('Zielone Świątki');

-- Tabela daty_swiat
INSERT INTO daty_swiat (id_swieta, data)
VALUES
    (1, '2025-04-20'),
    (2, '2025-06-01');
