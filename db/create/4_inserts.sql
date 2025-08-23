INSERT INTO ulgi (nazwa, znizka) VALUES
('Normalny', 0),
('Studencki', 51),
('Senior', 37),
('Dziecięcy', 50),
('Niepełnosprawny', 49);

INSERT INTO przewoznicy (nazwa_przewoznika) VALUES
('PKP Intercity'),
('PolRegio'),
('Koleje Mazowieckie'),
('SKM Trójmiasto'),
('Koleje Dolnośląskie');

INSERT INTO historia_cen (id_przewoznika, data_od, data_do, cena_za_km_kl1, cena_za_km_kl2, cena_za_rower) VALUES
-- PKP Intercity
(1, '2001-01-01', '2023-12-31', 0.45, 0.30, 10.00),
(1, '2024-01-01', '2024-12-31', 0.50, 0.35, 12.00),
(1, '2025-01-01', '2027-12-31',        0.55, 0.38, 13.00),
-- PolRegio
(2, '2001-06-01', '2023-05-31', 0.35, 0.25, 8.00),
(2, '2023-06-01', '2024-05-31', 0.37, 0.27, 9.00),
(2, '2024-06-01', '2027-12-31',         0.40, 0.30, 10.00),
-- Koleje Mazowieckie
(3, '2001-03-01', '2024-02-29', 0.38, 0.28, 8.50),
(3, '2024-03-01', '2027-12-31',         0.40, 0.30, 9.00),
-- SKM Trójmiasto
(4, '2001-07-01', '2024-06-30', 0.42, 0.32, 7.00),
(4, '2024-07-01', '2027-12-31',         0.44, 0.34, 7.50),
-- Koleje Dolnośląskie
(5, '2001-01-01', '2024-01-31', 0.39, 0.29, 9.00),
(5, '2024-02-01', '2027-12-31',         0.43, 0.32, 9.50);

INSERT INTO stacje (nazwa, tory) VALUES
('Warszawa Centralna', 8),
('Kraków Główny', 6),
('Łódź Fabryczna', 3),
('Wrocław Główny', 9),
('Poznań Główny', 10),
('Gdańsk Główny', 9),
('Szczecin Główny', 8),
('Bydgoszcz Główna', 7),
('Lublin Główny', 6),
('Katowice', 10),
('Białystok', 5),
('Gdynia Główna Osobowa', 8),
('Częstochowa Osobowa', 6),
('Radom', 5),
('Sosnowiec Główny', 4),
('Toruń Główny', 6),
('Kielce', 5),
('Rzeszów Główny', 6),
('Gliwice', 7),
('Zabrze', 6),
('Olsztyn Główny', 6),
('Bielsko-Biała Główna', 4),
('Bytom', 5),
('Zielona Góra Główna', 6),
('Rybnik', 4),
('Ruda Śląska', 3),
('Opole Główne', 7),
('Tychy', 3),
('Gorzów Wielkopolski', 5),
('Dąbrowa Górnicza', 4),
('Płock', 3),
('Elbląg', 5),
('Wałbrzych Główny', 4),
('Włocławek',4),
('Chorzów Batory', 4),
('Koszalin', 5),
('Kalisz', 4),
('Legnica', 6),
('Grudziądz', 3),
('Jaworzno Szczakowa', 4),
('Słupsk', 5),
('Jastrzębie-Zdrój', 2),
('Jelenia Góra', 4),
('Nowy Sącz', 3),
('Konin', 3),
('Piotrków Trybunalski', 4),
('Siedlce', 4),
('Mysłowice', 4),
('Inowrocław', 5),
('Lubin', 3),
('Ostrów Wielkopolski', 5),
('Suwałki', 3),
('Gniezno', 4),
('Stargard', 4),
('Głogów', 4),
('Siemianowice Śląskie', 2),
('Pabianice', 2),
('Świdnica Miasto', 3),
('Zgierz', 2),
('Bełchatów', 1),
('Ełk', 4),
('Tarnowskie Góry', 3),
('Przemyśl Główny', 5),
('Racibórz', 3),
('Ostrołęka', 3),
('Świętochłowice', 2),
('Zawiercie', 4),
('Starachowice Wschodnie', 3),
('Skierniewice', 4),
('Kędzierzyn-Koźle', 6),
('Wejherowo', 3),
('Tczew', 5),
('Jarosław', 3),
('Otwock', 3),
('Kołobrzeg', 4),
('Żory', 2),
('Pruszków', 3),
('Dębica', 3),
('Krosno Odrzańskie', 2),
('Olesno Śląskie', 2),
('Kluczbork', 3),
('Namysłów', 2),
('Nysa', 3),
('Brzeg', 4),
('Kłodzko Główne', 3),
('Wałcz', 2),
('Złotów', 2),
('Chojnice', 3),
('Kościerzyna', 2),
('Lębork', 4),
('Malbork', 5),
('Kwidzyn', 2),
('Sztum', 2),
('Grójec', 2),
('Garwolin', 2),
('Mława', 3),
('Ciechanów', 3),
('Sokołów Podlaski', 2),
('Pułtusk', 1),
('Żyrardów', 3),
('Sochaczew', 2),
('Łowicz Główny', 3),
('Kutno', 5),
('Płońsk', 2),
('Gostynin', 2),
('Kozienice', 1),
('Szczytno', 2),
('Mrągowo', 2)
ON CONFLICT (nazwa) DO NOTHING;

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
(1, 46, 110),     -- Warszawa Centralna <-> Skierniewice
(46, 14, 120),    -- Skierniewice <-> Radom
(14, 13, 70),     -- Radom <-> Częstochowa Osobowa
(13, 2, 120),     -- Częstochowa Osobowa <-> Kraków Główny

(1, 3, 130),      -- Warszawa Centralna <-> Łódź Fabryczna
(3, 4, 220),      -- Łódź Fabryczna <-> Wrocław Główny

(46, 16, 70),     -- Skierniewice <-> Toruń Główny
(16, 6, 150),     -- Toruń Główny <-> Gdańsk Główny

(2, 13, 70),      -- Kraków Główny <-> Częstochowa Osobowa
(13, 14, 70),     -- Częstochowa Osobowa <-> Radom
(14, 46, 90),     -- Radom <-> Skierniewice

(46, 3, 70),      -- Skierniewice <-> Łódź Fabryczna

(10, 15, 10),     -- Katowice <-> Sosnowiec Główny
(15, 2, 70),      -- Sosnowiec Główny <-> Kraków Główny

(1, 102, 40),     -- Warszawa Centralna <-> Łowicz Główny
(102, 46, 50),    -- Łowicz Główny <-> Skierniewice

(6, 74, 15),      -- Gdańsk Główny <-> Tczew
(74, 12, 30),     -- Tczew <-> Gdynia Główna Osobowa

(4, 56, 30),      -- Wrocław Główny <-> Głogów
(56, 33, 50),     -- Głogów <-> Wałbrzych Główny

(10, 23, 15),     -- Katowice <-> Bytom
(23, 26, 15),     -- Bytom <-> Ruda Śląska
(26, 28, 20),     -- Ruda Śląska <-> Tychy
(28, 30, 20),     -- Tychy <-> Dąbrowa Górnicza
(30, 35, 20),     -- Dąbrowa Górnicza <-> Chorzów Batory
(35, 57, 20),     -- Chorzów Batory <-> Siemianowice Śląskie
(57, 63, 20),     -- Siemianowice Śląskie <-> Tarnowskie Góry
(63, 69, 20),     -- Tarnowskie Góry <-> Świętochłowice
(69, 77, 20),     -- Świętochłowice <-> Żory

(1, 31, 65),      -- Warszawa Centralna <-> Płock
(31, 97, 35),     -- Płock <-> Ciechanów
(97, 96, 25),     -- Ciechanów <-> Mława
(96, 94, 20),     -- Mława <-> Grójec
(94, 95, 20),     -- Grójec <-> Garwolin
(95, 101, 20),    -- Garwolin <-> Sochaczew
(101, 104, 20),   -- Sochaczew <-> Płońsk
(104, 105, 20),   -- Płońsk <-> Gostynin
(105, 106, 20),   -- Gostynin <-> Kozienice

(6, 32, 45),      -- Gdańsk Główny <-> Elbląg
(32, 21, 40),     -- Elbląg <-> Olsztyn Główny
(21, 62, 40),     -- Olsztyn Główny <-> Ełk
(62, 53, 50),     -- Ełk <-> Suwałki
(53, 107, 40),    -- Suwałki <-> Szczytno
(107, 108, 30),   -- Szczytno <-> Mrągowo

(4, 43, 60),      -- Wrocław Główny <-> Jelenia Góra
(43, 33, 40),     -- Jelenia Góra <-> Wałbrzych Główny
(33, 59, 30),     -- Wałbrzych Główny <-> Świdnica Miasto
(59, 85, 30),     -- Świdnica Miasto <-> Kłodzko Główne
(85, 83, 30),     -- Kłodzko Główne <-> Nysa
(83, 84, 20),     -- Nysa <-> Brzeg

(5, 37, 50),      -- Poznań Główny <-> Kalisz
(37, 52, 40),     -- Kalisz <-> Ostrów Wielkopolski
(52, 50, 30),     -- Ostrów Wielkopolski <-> Inowrocław
(50, 54, 30),     -- Inowrocław <-> Gniezno
(54, 103, 30),    -- Gniezno <-> Kutno

(1, 48, 60),      -- Warszawa Centralna <-> Siedlce
(48, 68, 40),     -- Siedlce <-> Ostrołęka
(68, 11, 50),     -- Ostrołęka <-> Białystok
(11, 53, 50),     -- Białystok <-> Suwałki
(53, 98, 30),     -- Suwałki <-> Sokołów Podlaski

(8, 39, 40),      -- Bydgoszcz Główna <-> Grudziądz
(39, 34, 40),     -- Grudziądz <-> Włocławek
(34, 50, 40),     -- Włocławek <-> Inowrocław
(50, 88, 40),     -- Inowrocław <-> Chojnice
(88, 87, 30),     -- Chojnice <-> Złotów

(18, 65, 50),     -- Rzeszów Główny <-> Przemyśl Główny
(65, 75, 40),     -- Przemyśl Główny <-> Jarosław
(75, 78, 40),     -- Jarosław <-> Dębica
(78, 71, 40);     -- Dębica <-> Starachowice Wschodnie

INSERT INTO harmonogramy (czy_tydzien, czy_swieta) VALUES
('{true,true,true,true,true,true,true}', false),
('{false,true,true,true,true,true,false}', false),
('{true,true,true,true,true,true,true}', true),
('{false,true,true,true,true,true,false}', true);

INSERT INTO wagony (klimatyzacja, restauracyjny) VALUES
(true, true), --restauracyjny
(true, false),
(true, false),
(true, false),
(true, false);

INSERT INTO przedzialy (nr_przedzialu, id_wagonu, klasa, czy_zamkniety, strefa_ciszy) VALUES
-- Wagon 2: 10 przedziałów, jeden strefa ciszy
(1, 2, 2, true, false),
(2, 2, 2, true, false),
(3, 2, 2, true, false),
(4, 2, 2, true, false),
(5, 2, 2, true, false),
(6, 2, 1, true, false),
(7, 2, 1, true, true), -- strefa ciszy
(8, 2, 1, true, false),
(9, 2, 1, true, false),
(10, 2, 1, true, false),
-- Wagon 3: 8 przedziałów, jeden strefa ciszy
(1, 3, 1, true, false),
(2, 3, 1, true, false),
(3, 3, 1, true, false),
(4, 3, 1, true, false),
(5, 3, 1, true, true), -- strefa ciszy
(6, 3, 1, true, false),
(7, 3, 1, true, false),
(8, 3, 1, true, false),
--Wagon 4: bezprzedziałowy
(1, 4, 1, false, false),
--Wagon 5: bezprzedziałowy
(1, 5, 2, false, false);

INSERT INTO miejsca (nr_miejsca, id_wagonu, nr_przedzialu, czy_dla_niepelnosprawnych, czy_dla_rowerow) VALUES
-- Wagon 2 (50 miejsc)
(1, 2, 1, true, false), (2, 2, 1, false, false), (3, 2, 1, false, false), (4, 2, 1, false, false), (5, 2, 1, false, false),
(6, 2, 2, false, false), (7, 2, 2, false, false), (8, 2, 2, false, false), (9, 2, 2, false, false), (10, 2, 2, false, false),
(11, 2, 3, false, false), (12, 2, 3, false, false), (13, 2, 3, false, false), (14, 2, 3, false, false), (15, 2, 3, false, false),
(16, 2, 4, false, false), (17, 2, 4, false, false), (18, 2, 4, false, false), (19, 2, 4, false, false), (20, 2, 4, false, false),
(21, 2, 5, false, false), (22, 2, 5, false, false), (23, 2, 5, false, false), (24, 2, 5, false, false), (25, 2, 5, false, false),
(26, 2, 6, false, false), (27, 2, 6, false, false), (28, 2, 6, false, false), (29, 2, 6, false, false), (30, 2, 6, false, false),
(31, 2, 7, false, false), (32, 2, 7, false, false), (33, 2, 7, false, false), (34, 2, 7, false, false), (35, 2, 7, false, false),
(36, 2, 8, false, false), (37, 2, 8, false, false), (38, 2, 8, false, false), (39, 2, 8, false, false), (40, 2, 8, false, false),
(41, 2, 9, false, false), (42, 2, 9, false, false), (43, 2, 9, false, false), (44, 2, 9, false, false), (45, 2, 9, false, false),
(46, 2, 10, false, false), (47, 2, 10, false, false), (48, 2, 10, false, false), (49, 2, 10, false, false), (50, 2, 10, false, true),
-- Wagon 3 (40 miejsc)
(1, 3, 1, true, false), (2, 3, 1, false, false), (3, 3, 1, false, false), (4, 3, 1, false, false), (5, 3, 1, false, false),
(6, 3, 2, false, false), (7, 3, 2, false, false), (8, 3, 2, false, false), (9, 3, 2, false, false), (10, 3, 2, false, false),
(11, 3, 3, false, false), (12, 3, 3, false, false), (13, 3, 3, false, false), (14, 3, 3, false, false), (15, 3, 3, false, false),
(16, 3, 4, false, false), (17, 3, 4, false, false), (18, 3, 4, false, false), (19, 3, 4, false, false), (20, 3, 4, false, false),
(21, 3, 5, false, false), (22, 3, 5, false, false), (23, 3, 5, false, false), (24, 3, 5, false, false), (25, 3, 5, false, false),
(26, 3, 6, false, false), (27, 3, 6, false, false), (28, 3, 6, false, false), (29, 3, 6, false, false), (30, 3, 6, false, false),
(31, 3, 7, false, false), (32, 3, 7, false, false), (33, 3, 7, false, false), (34, 3, 7, false, false), (35, 3, 7, false, false),
(36, 3, 8, false, false), (37, 3, 8, false, false), (38, 3, 8, false, false), (39, 3, 8, false, false), (40, 3, 8, false, true),
-- Wagon 4
(1, 4, 1, true, false), (2, 4, 1, false, false), (3, 4, 1, false, false), (4, 4, 1, false, false), (5, 4, 1, true, false),
(6, 4, 1, false, false), (7, 4, 1, false, false), (8, 4, 1, false, false), (9, 4, 1, false, false), (10, 4, 1, false, false),
(11, 4, 1, false, false), (12, 4, 1, false, false), (13, 4, 1, false, false), (14, 4, 1, false, false), (15, 4, 1, false, false),
(16, 4, 1, false, false), (17, 4, 1, false, false), (18, 4, 1, false, false), (19, 4, 1, false, false), (20, 4, 1, false, false),
(21, 4, 1, false, false), (22, 4, 1, false, false), (23, 4, 1, false, false), (24, 4, 1, false, false), (25, 4, 1, false, false),
(26, 4, 1, false, false), (27, 4, 1, false, false), (28, 4, 1, false, false), (29, 4, 1, false, false), (30, 4, 1, false, false),
(31, 4, 1, false, false), (32, 4, 1, false, false), (33, 4, 1, false, false), (34, 4, 1, false, false), (35, 4, 1, false, false),
(36, 4, 1, false, false), (37, 4, 1, false, false), (38, 4, 1, false, false), (39, 4, 1, true, false), (40, 4, 1, false, false),
-- Wagon 5
(1, 5, 1, false, true), (2, 5, 1, false, true), (3, 5, 1, false, false), (4, 5, 1, true, false), (5, 5, 1, false, false),
(6, 5, 1, false, false), (7, 5, 1, false, false), (8, 5, 1, false, false), (9, 5, 1, false, false), (10, 5, 1, false, false),
(11, 5, 1, false, false), (12, 5, 1, false, false), (13, 5, 1, false, false), (14, 5, 1, true, false), (15, 5, 1, false, false),
(16, 5, 1, false, false), (17, 5, 1, false, false), (18, 5, 1, false, false), (19, 5, 1, false, false), (20, 5, 1, false, false),
(21, 5, 1, false, false), (22, 5, 1, false, false), (23, 5, 1, false, false), (24, 5, 1, false, false), (25, 5, 1, false, false),
(26, 5, 1, false, false), (27, 5, 1, false, false), (28, 5, 1, false, false), (29, 5, 1, false, false), (30, 5, 1, false, false),
(31, 5, 1, false, false), (32, 5, 1, false, false), (33, 5, 1, false, false), (34, 5, 1, false, false), (35, 5, 1, false, false),
(36, 5, 1, false, false), (37, 5, 1, false, false), (38, 5, 1, false, false), (39, 5, 1, false, false), (40, 5, 1, false, false);

-- 1. TLK Warszawa - Kraków (PKP Intercity)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('06:00:00', 1, 1) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (1, 1, 0, 5, true, 1),     -- Warszawa Centralna
                                 (1, 46, 85, 85, false, 1),  -- Skierniewice
                                 (1, 14, 175, 177, true, 1), -- Radom
                                 (1, 13, 245, 247, true, 1), -- Częstochowa Osobowa
                                 (1, 2, 365, 370, true, 1);  -- Kraków Główny
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (1, '2023-01-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (1, 1, 1), (1, 2, 2), (1, 3, 3);

-- 2. IC Warszawa - Wrocław (PKP Intercity)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('07:30:00', 1, 1) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (2, 1, 0, 5, true, 1),     -- Warszawa Centralna
                                 (2, 3, 135, 135, false, 1), -- Łódź Fabryczna
                                 (2, 4, 355, 360, true, 1);  -- Wrocław Główny
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
                                                                      (2, '2023-01-01', '2023-06-30'),
                                                                      (2, '2023-09-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (2, 1, 2), (2, 2, 2), (2, 3, 2);
-- 3. EIP Warszawa - Gdańsk (PKP Intercity)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('08:15:00', 1, 1) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (3, 1, 0, 5, true, 2),     -- Warszawa Centralna
                                 (3, 46, 85, 85, false, 1),  -- Skierniewice
                                 (3, 16, 135, 137, true, 3), -- Toruń Główny
                                 (3, 6, 285, 290, true, 5);  -- Gdańsk Główny
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (3, '2023-03-15', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (3, 1, 1), (3, 2, 3), (3, 3, 3);

-- 4. TLK Kraków - Warszawa (PKP Intercity)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('16:00:00', 1, 1) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (4, 2, 0, 5, true, 4),     -- Kraków Główny
                                 (4, 13, 120, 122, true, 2), -- Częstochowa Osobowa
                                 (4, 14, 190, 190, false, 1),-- Radom
                                 (4, 46, 280, 280, false, 2),-- Skierniewice
                                 (4, 1, 365, 370, true, 3);  -- Warszawa Centralna
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (4, '2022-12-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (4, 1, 2), (4, 2, 2), (4, 3, 2);

-- 5. Warszawa - Łódź (PolRegio)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('05:30:00', 2, 2) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (5, 1, 0, 5, true, 3),     -- Warszawa Centralna
                                 (5, 46, 85, 85, false, 2),  -- Skierniewice
                                 (5, 3, 135, 140, true, 1);  -- Łódź Fabryczna
COMMIT;
ROLLBACK;

INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (5, '2023-01-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (5, 1, 4), (5, 2, 4), (5, 3, 3);

-- 6. Katowice - Kraków (PolRegio)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('06:45:00', 2, 2) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (6, 10, 0, 5, true, 4),    -- Katowice
                                 (6, 15, 15, 15, false, 2),  -- Sosnowiec Główny
                                 (6, 2, 85, 90, true, 3);    -- Kraków Główny
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (6, '2023-01-15', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (6, 1, 5), (6, 2, 5), (6, 3, 3);

-- 7. Warszawa - Skierniewice (Koleje Mazowieckie)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('06:00:00', 2, 3) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (7, 1, 0, 5, true, 5),     -- Warszawa Centralna
                                 (7, 102, 45, 45, false, 1),-- Łowicz Główny
                                 (7, 46, 85, 90, true, 2);   -- Skierniewice
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (7, '2023-03-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (7, 1, 4), (7, 2, 4), (7, 3, 3);

-- 8. Gdańsk - Gdynia (SKM Trójmiasto)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('05:45:00', 1, 4) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (8, 6, 0, 5, true, 3),     -- Gdańsk Główny
                                 (8, 74, 15, 15, false, 1),  -- Tczew
                                 (8, 12, 45, 50, true, 2);   -- Gdynia Główna Osobowa
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
                                                                      (8, '2023-01-01', '2023-10-31'),
                                                                      (8, '2024-01-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (8, 1, 5), (8, 2, 5), (8, 3, 2);

-- 9. Wrocław - Wałbrzych (Koleje Dolnośląskie)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('06:20:00', 2, 5) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (9, 4, 0, 5, true, 2),     -- Wrocław Główny
                                 (9, 56, 30, 30, false, 1),  -- Głogów
                                 (9, 33, 70, 75, true, 3);   -- Wałbrzych Główny
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (9, '2023-02-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (9, 1, 4), (9, 2, 4), (9, 3, 3);

-- 10. Katowice - Żory (PolRegio - Śląsk)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('08:00:00', 2, 2) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (10, 10, 0, 5, true, 3),    -- Katowice
                                 (10, 23, 20, 25, true, 1),   -- Bytom
                                 (10, 26, 35, 40, true, 2),   -- Ruda Śląska
                                 (10, 28, 55, 60, true, 1),   -- Tychy
                                 (10, 30, 75, 80, true, 2),   -- Dąbrowa Górnicza
                                 (10, 35, 95, 100, true, 1),  -- Chorzów Batory
                                 (10, 57, 115, 120, true, 2), -- Siemianowice Śląskie
                                 (10, 63, 135, 140, true, 1), -- Tarnowskie Góry
                                 (10, 69, 155, 160, true, 2), -- Świętochłowice
                                 (10, 77, 175, 180, true, 1); -- Żory
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (10, '2023-01-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (10, 1, 5), (10, 2, 4), (10, 3, 2);

-- 11. Warszawa - Kozienice (Koleje Mazowieckie)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('09:00:00', 1, 3) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (11, 1, 0, 5, true, 4),     -- Warszawa Centralna
                                 (11, 31, 65, 70, true, 1),  -- Płock
                                 (11, 97, 100, 105, true, 2),-- Ciechanów
                                 (11, 96, 130, 135, true, 1),-- Mława
                                 (11, 94, 150, 155, true, 2),-- Grójec
                                 (11, 95, 170, 175, true, 1),-- Garwolin
                                 (11, 101, 190, 195, true, 2),-- Sochaczew
                                 (11, 104, 210, 215, true, 1),-- Płońsk
                                 (11, 105, 230, 235, true, 2),-- Gostynin
                                 (11, 106, 250, 255, true, 1);-- Kozienice
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (11, '2023-04-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (11, 1, 4), (11, 2, 5), (11, 3, 2);

-- 12. Gdańsk - Mrągowo (PolRegio - Pomorze/Warmia)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('10:00:00', 1, 2) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (12, 6, 0, 5, true, 3),     -- Gdańsk Główny
                                 (12, 32, 50, 55, true, 1),  -- Elbląg
                                 (12, 21, 90, 95, true, 2),  -- Olsztyn Główny
                                 (12, 62, 130, 135, true, 1),-- Ełk
                                 (12, 53, 180, 185, true, 2),-- Suwałki
                                 (12, 107, 220, 225, true, 1),-- Szczytno
                                 (12, 108, 250, 255, true, 2);-- Mrągowo
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (12, '2023-01-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (12, 1, 2), (12, 2, 2), (12, 3, 2);

-- 13. Wrocław - Brzeg (Koleje Dolnośląskie)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('11:00:00', 2, 5) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (13, 4, 0, 5, true, 2),     -- Wrocław Główny
                                 (13, 43, 60, 65, true, 1),  -- Jelenia Góra
                                 (13, 33, 100, 105, true, 2),-- Wałbrzych Główny
                                 (13, 59, 130, 135, true, 1),-- Świdnica Miasto
                                 (13, 85, 160, 165, true, 2),-- Kłodzko Główne
                                 (13, 83, 190, 195, true, 1),-- Nysa
                                 (13, 84, 210, 215, true, 2);-- Brzeg
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (13, '2023-02-10', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (13, 1, 5), (13, 2, 4), (13, 3, 2);

-- 14. Poznań - Kutno (PolRegio - Wielkopolska)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('12:00:00', 1, 2) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (14, 5, 0, 5, true, 3),     -- Poznań Główny
                                 (14, 37, 50, 55, true, 1),  -- Kalisz
                                 (14, 52, 90, 95, true, 2),  -- Ostrów Wielkopolski
                                 (14, 50, 120, 125, true, 1),-- Inowrocław
                                 (14, 54, 150, 155, true, 2),-- Gniezno
                                 (14, 103, 180, 185, true, 1);-- Kutno
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (14, '2023-01-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (14, 1, 5), (14, 2, 5), (14, 3, 3);

-- 15. Warszawa - Sokołów Podlaski (PolRegio - Podlasie)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('13:00:00', 1, 2) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (15, 1, 0, 5, true, 5),     -- Warszawa Centralna
                                 (15, 48, 60, 65, true, 1),  -- Siedlce
                                 (15, 68, 100, 105, true, 2),-- Ostrołęka
                                 (15, 11, 150, 155, true, 1),-- Białystok
                                 (15, 53, 200, 205, true, 2),-- Suwałki
                                 (15, 98, 230, 235, true, 1);-- Sokołów Podlaski



COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (15, '2023-03-15', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (15, 1, 4), (15, 2, 4), (15, 3, 3);

-- 16. Bydgoszcz - Złotów (PolRegio - Kujawy/Pomorze)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('14:00:00', 2, 2) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (16, 8, 0, 5, true, 2),     -- Bydgoszcz Główna
                                 (16, 39, 40, 45, true, 1),  -- Grudziądz
                                 (16, 34, 80, 85, true, 2),  -- Włocławek
                                 (16, 50, 120, 125, true, 1),-- Inowrocław
                                 (16, 88, 160, 165, true, 2),-- Chojnice
                                 (16, 87, 190, 195, true, 1);-- Złotów
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
                                                                      (16, '2023-01-01', '2023-07-31'),
                                                                      (16, '2023-09-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (16, 1, 3), (16, 2, 3), (16, 3, 2);

-- 17. Rzeszów - Starachowice (PolRegio - Podkarpacie)
BEGIN;
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika) VALUES
    ('15:00:00', 1, 2) RETURNING id_polaczenia;
INSERT INTO stacje_posrednie VALUES
                                 (17, 18, 0, 5, true, 3),    -- Rzeszów Główny
                                 (17, 65, 50, 55, true, 1),  -- Przemyśl Główny
                                 (17, 75, 90, 95, true, 2),  -- Jarosław
                                 (17, 78, 130, 135, true, 1),-- Dębica
                                 (17, 71, 170, 175, true, 2);-- Starachowice Wschodnie
COMMIT;
INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (17, '2023-01-01', '2026-12-31');
INSERT INTO polaczenia_wagony(id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                       (17, 1, 4), (17, 2, 4), (17, 3, 3);



INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika)
VALUES ('08:00:00', 1, 1);
INSERT INTO stacje_posrednie VALUES
     (18, 1,   0,   5, true, 1),   -- Warszawa Centralna
     (18, 14, 60,  65, true, 1),   -- Radom
     (18, 17,120, 125, true, 1),   -- Kielce
      (18, 2, 180, 185, true, 1);   -- Kraków Główny

INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (18, '2023-01-01', '2026-12-31');
INSERT INTO polaczenia_wagony (id_polaczenia, nr_wagonu, id_wagonu) VALUES
     (18, 1, 1),
      (18, 2, 1),
      (18, 3, 2),
     (18, 4, 3);

INSERT INTO linie VALUES
    (1,14,150),
    (14,17,80),
    (17,2,150);

INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika)
VALUES ('10:00:00', 1, 1);
INSERT INTO stacje_posrednie VALUES
                                 (19, 1,   0,   5, true, 1),   -- Warszawa Centralna
                                 (19, 14, 60,  65, true, 1),   -- Radom
                                 (19, 17,120, 125, true, 1),   -- Kielce
                                 (19, 2, 180, 185, true, 1);   -- Kraków Główny

INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (19, '2023-01-01', '2026-12-31');
INSERT INTO polaczenia_wagony (id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                        (19, 1, 1),
                                                                        (19, 2, 1),
                                                                        (19, 3, 2),
                                                                        (19, 4, 3);
INSERT INTO polaczenia (godzina_startu, id_harmonogramu, id_przewoznika)
VALUES ('12:00:00', 1, 2);
INSERT INTO stacje_posrednie VALUES
                                 (20, 1,   0,   5, true, 1),   -- Warszawa Centralna
                                 (20, 14, 60,  65, true, 1),   -- Radom
                                 (20, 17,120, 125, true, 1),   -- Kielce
                                 (20, 2, 180, 185, true, 1);   -- Kraków Główny

INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
    (20, '2023-01-01', '2026-12-31');
INSERT INTO polaczenia_wagony (id_polaczenia, nr_wagonu, id_wagonu) VALUES
                                                                        (20, 1, 1),
                                                                        (20, 2, 1),
                                                                        (20, 3, 2),
                                                                        (20, 4, 3);






insert into pasazerowie (imie, nazwisko, email) values ('Gregg', 'Parkeson', 'gparkeson0@digg.com');
insert into pasazerowie (imie, nazwisko, email) values ('Alvera', 'Keymer', 'akeymer1@mac.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lyndsay', 'Pether', 'lpether2@state.tx.us');
insert into pasazerowie (imie, nazwisko, email) values ('Kassie', 'Osipov', 'kosipov3@comsenz.com');
insert into pasazerowie (imie, nazwisko, email) values ('Josi', 'Haughey', 'jhaughey4@woothemes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Colas', 'Lindenberg', 'clindenberg5@hatena.ne.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Fay', 'Hryskiewicz', 'fhryskiewicz6@homestead.com');
insert into pasazerowie (imie, nazwisko, email) values ('Filip', 'Knightly', 'fknightly7@bigcartel.com');
insert into pasazerowie (imie, nazwisko, email) values ('Forbes', 'McElmurray', 'fmcelmurray8@bravesites.com');
insert into pasazerowie (imie, nazwisko, email) values ('Algernon', 'Vautier', 'avautier9@ibm.com');
insert into pasazerowie (imie, nazwisko, email) values ('Leslie', 'Spadaro', 'lspadaroa@cyberchimps.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bernetta', 'Anderl', 'banderlb@slideshare.net');
insert into pasazerowie (imie, nazwisko, email) values ('Alene', 'Fowle', 'afowlec@answers.com');
insert into pasazerowie (imie, nazwisko, email) values ('Carlynn', 'Cromar', 'ccromard@qq.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rosalie', 'Hoodspeth', 'rhoodspethe@ucsd.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Melinda', 'Radnedge', 'mradnedgef@unicef.org');
insert into pasazerowie (imie, nazwisko, email) values ('Krysta', 'Paulisch', 'kpaulischg@nasa.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Ethelyn', 'Burress', 'eburressh@csmonitor.com');
insert into pasazerowie (imie, nazwisko, email) values ('Leonard', 'Winwood', 'lwinwoodi@ucla.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Layne', 'Bourgourd', 'lbourgourdj@microsoft.com');
insert into pasazerowie (imie, nazwisko, email) values ('Arther', 'Burkhill', 'aburkhillk@independent.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Bordie', 'Witheridge', 'bwitheridgel@surveymonkey.com');
insert into pasazerowie (imie, nazwisko, email) values ('Clareta', 'Cockshutt', 'ccockshuttm@harvard.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Joe', 'Menat', 'jmenatn@purevolume.com');
insert into pasazerowie (imie, nazwisko, email) values ('Olimpia', 'Vigus', 'oviguso@ucla.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Stephanie', 'Grugerr', 'sgrugerrp@youtube.com');
insert into pasazerowie (imie, nazwisko, email) values ('Otha', 'De Angelo', 'odeangeloq@spotify.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bobby', 'Paradise', 'bparadiser@huffingtonpost.com');
insert into pasazerowie (imie, nazwisko, email) values ('Roxana', 'Jarrard', 'rjarrards@meetup.com');
insert into pasazerowie (imie, nazwisko, email) values ('Dominic', 'Bathurst', 'dbathurstt@slashdot.org');
insert into pasazerowie (imie, nazwisko, email) values ('Allina', 'Garaway', 'agarawayu@blog.com');
insert into pasazerowie (imie, nazwisko, email) values ('Aland', 'Tawn', 'atawnv@salon.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nicolina', 'Sedgman', 'nsedgmanw@ebay.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Bekki', 'Camilletti', 'bcamillettix@parallels.com');
insert into pasazerowie (imie, nazwisko, email) values ('Anissa', 'Garard', 'agarardy@twitpic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cad', 'Darcy', 'cdarcyz@topsy.com');
insert into pasazerowie (imie, nazwisko, email) values ('Amie', 'Reitenbach', 'areitenbach10@alexa.com');
insert into pasazerowie (imie, nazwisko, email) values ('Alysa', 'Derx', 'aderx11@hud.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Marita', 'Sendall', 'msendall12@indiegogo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ursula', 'Prin', 'uprin13@last.fm');
insert into pasazerowie (imie, nazwisko, email) values ('Clem', 'Perez', 'cperez14@wordpress.com');
insert into pasazerowie (imie, nazwisko, email) values ('Darby', 'Jira', 'djira15@house.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Briney', 'Fullilove', 'bfullilove16@ovh.net');
insert into pasazerowie (imie, nazwisko, email) values ('Dino', 'Knight', 'dknight17@weibo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cointon', 'Crottagh', 'ccrottagh18@mozilla.com');
insert into pasazerowie (imie, nazwisko, email) values ('Irma', 'Poff', 'ipoff19@smh.com.au');
insert into pasazerowie (imie, nazwisko, email) values ('Charil', 'Andreacci', 'candreacci1a@facebook.com');
insert into pasazerowie (imie, nazwisko, email) values ('Emmalynn', 'Ruprechter', 'eruprechter1b@irs.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Vachel', 'Habard', 'vhabard1c@privacy.gov.au');
insert into pasazerowie (imie, nazwisko, email) values ('Edwina', 'Mochan', 'emochan1d@example.com');
insert into pasazerowie (imie, nazwisko, email) values ('Chance', 'Scotchmoor', 'cscotchmoor1e@google.es');
insert into pasazerowie (imie, nazwisko, email) values ('Erma', 'Alfonsini', 'ealfonsini1f@bluehost.com');
insert into pasazerowie (imie, nazwisko, email) values ('Curcio', 'Trundler', 'ctrundler1g@vk.com');
insert into pasazerowie (imie, nazwisko, email) values ('Adrienne', 'Klimowski', 'aklimowski1h@lycos.com');
insert into pasazerowie (imie, nazwisko, email) values ('Evan', 'De Banke', 'edebanke1i@seattletimes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Marv', 'Duiguid', 'mduiguid1j@businessweek.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jarrod', 'Gallant', 'jgallant1k@zimbio.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lynett', 'Simonot', 'lsimonot1l@ebay.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rickert', 'Skewis', 'rskewis1m@goo.gl');
insert into pasazerowie (imie, nazwisko, email) values ('Randolf', 'Ervin', 'rervin1n@dell.com');
insert into pasazerowie (imie, nazwisko, email) values ('Carma', 'Banks', 'cbanks1o@nymag.com');
insert into pasazerowie (imie, nazwisko, email) values ('Farrell', 'Hallbord', 'fhallbord1p@house.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Hilde', 'Hallums', 'hhallums1q@last.fm');
insert into pasazerowie (imie, nazwisko, email) values ('Teddie', 'Martijn', 'tmartijn1r@sourceforge.net');
insert into pasazerowie (imie, nazwisko, email) values ('Skyler', 'Larroway', 'slarroway1s@e-recht24.de');
insert into pasazerowie (imie, nazwisko, email) values ('Griffith', 'Deller', 'gdeller1t@artisteer.com');
insert into pasazerowie (imie, nazwisko, email) values ('Aimil', 'Oldroyde', 'aoldroyde1u@odnoklassniki.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Basilius', 'Crowd', 'bcrowd1v@virginia.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Madge', 'Rushsorth', 'mrushsorth1w@flickr.com');
insert into pasazerowie (imie, nazwisko, email) values ('Maje', 'Reinmar', 'mreinmar1x@sciencedirect.com');
insert into pasazerowie (imie, nazwisko, email) values ('Tobin', 'Grebbin', 'tgrebbin1y@google.com.hk');
insert into pasazerowie (imie, nazwisko, email) values ('Emelita', 'Pomfrey', 'epomfrey1z@theatlantic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Marshal', 'Hewell', 'mhewell20@ustream.tv');
insert into pasazerowie (imie, nazwisko, email) values ('Hermina', 'Sames', 'hsames21@reuters.com');
insert into pasazerowie (imie, nazwisko, email) values ('Frankie', 'Rapier', 'frapier22@xinhuanet.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nicolais', 'Iacopo', 'niacopo23@gravatar.com');
insert into pasazerowie (imie, nazwisko, email) values ('Todd', 'Chuck', 'tchuck24@opensource.org');
insert into pasazerowie (imie, nazwisko, email) values ('Archibold', 'Rounsivall', 'arounsivall25@miitbeian.gov.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Jacquenetta', 'Jenteau', 'jjenteau26@toplist.cz');
insert into pasazerowie (imie, nazwisko, email) values ('Gates', 'Chawkley', 'gchawkley27@dedecms.com');
insert into pasazerowie (imie, nazwisko, email) values ('Artair', 'Dewdney', 'adewdney28@nyu.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Marcellina', 'Jedryka', 'mjedryka29@marketwatch.com');
insert into pasazerowie (imie, nazwisko, email) values ('Koo', 'Steaning', 'ksteaning2a@cbslocal.com');
insert into pasazerowie (imie, nazwisko, email) values ('Janaya', 'Squibbs', 'jsquibbs2b@unicef.org');
insert into pasazerowie (imie, nazwisko, email) values ('Rona', 'Matuszyk', 'rmatuszyk2c@usda.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Drusie', 'Canaan', 'dcanaan2d@ucoz.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Maurizia', 'Danzelman', 'mdanzelman2e@baidu.com');
insert into pasazerowie (imie, nazwisko, email) values ('Angelica', 'Cater', 'acater2f@wp.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nerti', 'Walsham', 'nwalsham2g@berkeley.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Hayley', 'Landon', 'hlandon2h@stumbleupon.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kay', 'Benninger', 'kbenninger2i@tripadvisor.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cati', 'Wickins', 'cwickins2j@nbcnews.com');
insert into pasazerowie (imie, nazwisko, email) values ('Marleah', 'Dutt', 'mdutt2k@hc360.com');
insert into pasazerowie (imie, nazwisko, email) values ('Theressa', 'Camilleri', 'tcamilleri2l@moonfruit.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nanci', 'Jubb', 'njubb2m@ustream.tv');
insert into pasazerowie (imie, nazwisko, email) values ('Auberta', 'Hanbridge', 'ahanbridge2n@wsj.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lukas', 'Pledge', 'lpledge2o@bluehost.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bethena', 'Binnell', 'bbinnell2p@newsvine.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ernesta', 'Wheldon', 'ewheldon2q@eventbrite.com');
insert into pasazerowie (imie, nazwisko, email) values ('Fleming', 'Yanne', 'fyanne2r@ning.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jamie', 'Stuckford', 'jstuckford2s@omniture.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ted', 'O''Nowlan', 'tonowlan2t@wix.com');
insert into pasazerowie (imie, nazwisko, email) values ('Dickie', 'Gostall', 'dgostall2u@columbia.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Ivar', 'Fieller', 'ifieller2v@nymag.com');
insert into pasazerowie (imie, nazwisko, email) values ('Graig', 'Kemmey', 'gkemmey2w@clickbank.net');
insert into pasazerowie (imie, nazwisko, email) values ('Miguelita', 'Bwye', 'mbwye2x@purevolume.com');
insert into pasazerowie (imie, nazwisko, email) values ('Millisent', 'Boshere', 'mboshere2y@foxnews.com');
insert into pasazerowie (imie, nazwisko, email) values ('Adolpho', 'Uff', 'auff2z@github.io');
insert into pasazerowie (imie, nazwisko, email) values ('Glennie', 'Bradforth', 'gbradforth30@arizona.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Neill', 'Sember', 'nsember31@umn.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Benedetta', 'Dumphries', 'bdumphries32@wikispaces.com');
insert into pasazerowie (imie, nazwisko, email) values ('Delcine', 'Lampbrecht', 'dlampbrecht33@myspace.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gladys', 'Dayce', 'gdayce34@msn.com');
insert into pasazerowie (imie, nazwisko, email) values ('Appolonia', 'Blei', 'ablei35@sakura.ne.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Koralle', 'Tilt', 'ktilt36@delicious.com');
insert into pasazerowie (imie, nazwisko, email) values ('Pegeen', 'Mc Caghan', 'pmccaghan37@goo.gl');
insert into pasazerowie (imie, nazwisko, email) values ('Waverley', 'Easterling', 'weasterling38@issuu.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rafaela', 'Sailes', 'rsailes39@bizjournals.com');
insert into pasazerowie (imie, nazwisko, email) values ('Barnaby', 'Bouchier', 'bbouchier3a@army.mil');
insert into pasazerowie (imie, nazwisko, email) values ('Bendick', 'Cargill', 'bcargill3b@g.co');
insert into pasazerowie (imie, nazwisko, email) values ('Meagan', 'Carpenter', 'mcarpenter3c@fda.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Manon', 'Fardon', 'mfardon3d@privacy.gov.au');
insert into pasazerowie (imie, nazwisko, email) values ('Guillemette', 'Kauble', 'gkauble3e@moonfruit.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lee', 'Alessandone', 'lalessandone3f@dion.ne.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Vin', 'Calender', 'vcalender3g@furl.net');
insert into pasazerowie (imie, nazwisko, email) values ('Ker', 'Faustian', 'kfaustian3h@51.la');
insert into pasazerowie (imie, nazwisko, email) values ('Marj', 'Tammadge', 'mtammadge3i@qq.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rubetta', 'Pillman', 'rpillman3j@state.tx.us');
insert into pasazerowie (imie, nazwisko, email) values ('Ulrike', 'Leeder', 'uleeder3k@ucla.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Carroll', 'Muttitt', 'cmuttitt3l@webeden.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Sandy', 'Almak', 'salmak3m@livejournal.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jeannine', 'Temperley', 'jtemperley3n@home.pl');
insert into pasazerowie (imie, nazwisko, email) values ('Aeriel', 'Lukash', 'alukash3o@freewebs.com');
insert into pasazerowie (imie, nazwisko, email) values ('Panchito', 'Swendell', 'pswendell3p@scribd.com');
insert into pasazerowie (imie, nazwisko, email) values ('Pippy', 'Kaine', 'pkaine3q@moonfruit.com');
insert into pasazerowie (imie, nazwisko, email) values ('Malinda', 'Bonanno', 'mbonanno3r@php.net');
insert into pasazerowie (imie, nazwisko, email) values ('Halette', 'Kiddle', 'hkiddle3s@simplemachines.org');
insert into pasazerowie (imie, nazwisko, email) values ('Vere', 'Wilfling', 'vwilfling3t@cam.ac.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Dorelia', 'Lorden', 'dlorden3u@e-recht24.de');
insert into pasazerowie (imie, nazwisko, email) values ('Harlene', 'Trump', 'htrump3v@booking.com');
insert into pasazerowie (imie, nazwisko, email) values ('Tammara', 'Keedy', 'tkeedy3w@samsung.com');
insert into pasazerowie (imie, nazwisko, email) values ('Melloney', 'Eckersall', 'meckersall3x@ed.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Rich', 'Fearnsides', 'rfearnsides3y@creativecommons.org');
insert into pasazerowie (imie, nazwisko, email) values ('Arlie', 'Greetland', 'agreetland3z@dedecms.com');
insert into pasazerowie (imie, nazwisko, email) values ('Britte', 'Sedgeworth', 'bsedgeworth40@theatlantic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Zorah', 'Wickey', 'zwickey41@noaa.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Clay', 'Gatman', 'cgatman42@skype.com');
insert into pasazerowie (imie, nazwisko, email) values ('Maurise', 'Hunstone', 'mhunstone43@zdnet.com');
insert into pasazerowie (imie, nazwisko, email) values ('Udall', 'Mabbett', 'umabbett44@hp.com');
insert into pasazerowie (imie, nazwisko, email) values ('Frederic', 'Flanne', 'fflanne45@google.de');
insert into pasazerowie (imie, nazwisko, email) values ('Fairleigh', 'Duffet', 'fduffet46@dell.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rozelle', 'Lope', 'rlope47@goodreads.com');
insert into pasazerowie (imie, nazwisko, email) values ('Carl', 'Chafer', 'cchafer48@nymag.com');
insert into pasazerowie (imie, nazwisko, email) values ('Syd', 'Ingleton', 'singleton49@deviantart.com');
insert into pasazerowie (imie, nazwisko, email) values ('Art', 'Eborall', 'aeborall4a@hubpages.com');
insert into pasazerowie (imie, nazwisko, email) values ('Catina', 'Pickrell', 'cpickrell4b@biblegateway.com');
insert into pasazerowie (imie, nazwisko, email) values ('Dene', 'Dwire', 'ddwire4c@github.io');
insert into pasazerowie (imie, nazwisko, email) values ('Powell', 'Spoole', 'pspoole4d@usatoday.com');
insert into pasazerowie (imie, nazwisko, email) values ('Eyde', 'Cowdrey', 'ecowdrey4e@alibaba.com');
insert into pasazerowie (imie, nazwisko, email) values ('Magdalena', 'De Lacey', 'mdelacey4f@harvard.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Ingar', 'Ellwand', 'iellwand4g@boston.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lion', 'Oakhill', 'loakhill4h@nature.com');
insert into pasazerowie (imie, nazwisko, email) values ('Brittan', 'Calderon', 'bcalderon4i@telegraph.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Lia', 'Bowley', 'lbowley4j@nifty.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ara', 'Neate', 'aneate4k@bloglovin.com');
insert into pasazerowie (imie, nazwisko, email) values ('Barbe', 'Musson', 'bmusson4l@woothemes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Benedicto', 'Ulster', 'bulster4m@abc.net.au');
insert into pasazerowie (imie, nazwisko, email) values ('Dasi', 'Giriardelli', 'dgiriardelli4n@chicagotribune.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kilian', 'Butland', 'kbutland4o@technorati.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rubina', 'Lovie', 'rlovie4p@ucoz.com');
insert into pasazerowie (imie, nazwisko, email) values ('Honor', 'Biagioni', 'hbiagioni4q@jimdo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Wendeline', 'Berford', 'wberford4r@prnewswire.com');
insert into pasazerowie (imie, nazwisko, email) values ('Hoebart', 'Cadell', 'hcadell4s@mapy.cz');
insert into pasazerowie (imie, nazwisko, email) values ('Tulley', 'Dammarell', 'tdammarell4t@marriott.com');
insert into pasazerowie (imie, nazwisko, email) values ('Mae', 'Mazella', 'mmazella4u@lycos.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cristi', 'Twigg', 'ctwigg4v@baidu.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bertha', 'Plevey', 'bplevey4w@jalbum.net');
insert into pasazerowie (imie, nazwisko, email) values ('Norry', 'Rosellini', 'nrosellini4x@hexun.com');
insert into pasazerowie (imie, nazwisko, email) values ('Reeta', 'Eaglen', 'reaglen4y@jugem.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Mame', 'Beverstock', 'mbeverstock4z@unblog.fr');
insert into pasazerowie (imie, nazwisko, email) values ('Cornall', 'Ladd', 'cladd50@amazon.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Clayborne', 'Lickorish', 'clickorish51@un.org');
insert into pasazerowie (imie, nazwisko, email) values ('Cristian', 'Sapwell', 'csapwell52@netlog.com');
insert into pasazerowie (imie, nazwisko, email) values ('Marta', 'Whittet', 'mwhittet53@devhub.com');
insert into pasazerowie (imie, nazwisko, email) values ('Haleigh', 'Colledge', 'hcolledge54@imgur.com');
insert into pasazerowie (imie, nazwisko, email) values ('Giffard', 'McGilvary', 'gmcgilvary55@virginia.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Micheline', 'Blazynski', 'mblazynski56@forbes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lexie', 'Cattonnet', 'lcattonnet57@gov.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Garry', 'Housiaux', 'ghousiaux58@bloglines.com');
insert into pasazerowie (imie, nazwisko, email) values ('Morgan', 'Roderick', 'mroderick59@pen.io');
insert into pasazerowie (imie, nazwisko, email) values ('Wilfred', 'Niven', 'wniven5a@unesco.org');
insert into pasazerowie (imie, nazwisko, email) values ('Sloan', 'Hector', 'shector5b@desdev.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Renaldo', 'Cribbin', 'rcribbin5c@jimdo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Stace', 'Lere', 'slere5d@imageshack.us');
insert into pasazerowie (imie, nazwisko, email) values ('Aurore', 'Woollends', 'awoollends5e@about.me');
insert into pasazerowie (imie, nazwisko, email) values ('Joelle', 'Hendrik', 'jhendrik5f@drupal.org');
insert into pasazerowie (imie, nazwisko, email) values ('Kimmy', 'Bhar', 'kbhar5g@twitpic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Peterus', 'Assinder', 'passinder5h@icq.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jami', 'Sackur', 'jsackur5i@tinypic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bili', 'Skirven', 'bskirven5j@wufoo.com');
insert into pasazerowie (imie, nazwisko, email) values ('De', 'Inglesent', 'dinglesent5k@qq.com');
insert into pasazerowie (imie, nazwisko, email) values ('Tyrone', 'Fain', 'tfain5l@homestead.com');
insert into pasazerowie (imie, nazwisko, email) values ('Theobald', 'Hirsthouse', 'thirsthouse5m@businesswire.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nollie', 'Worthy', 'nworthy5n@jimdo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kendal', 'Ilyuchyov', 'kilyuchyov5o@google.it');
insert into pasazerowie (imie, nazwisko, email) values ('Candi', 'Stacy', 'cstacy5p@sciencedaily.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nevins', 'Melior', 'nmelior5q@ibm.com');
insert into pasazerowie (imie, nazwisko, email) values ('Burl', 'Brimilcombe', 'bbrimilcombe5r@opensource.org');
insert into pasazerowie (imie, nazwisko, email) values ('Orson', 'Baterip', 'obaterip5s@unblog.fr');
insert into pasazerowie (imie, nazwisko, email) values ('Eamon', 'Dummett', 'edummett5t@e-recht24.de');
insert into pasazerowie (imie, nazwisko, email) values ('Charis', 'Lippo', 'clippo5u@sogou.com');
insert into pasazerowie (imie, nazwisko, email) values ('Aviva', 'Barlace', 'abarlace5v@360.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Eldon', 'Casarini', 'ecasarini5w@people.com.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Lancelot', 'Handscombe', 'lhandscombe5x@t-online.de');
insert into pasazerowie (imie, nazwisko, email) values ('Susanetta', 'Shorie', 'sshorie5y@mac.com');
insert into pasazerowie (imie, nazwisko, email) values ('Pauly', 'Timlin', 'ptimlin5z@vistaprint.com');
insert into pasazerowie (imie, nazwisko, email) values ('Hardy', 'Lambarth', 'hlambarth60@umn.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Kristoforo', 'Vassie', 'kvassie61@zdnet.com');
insert into pasazerowie (imie, nazwisko, email) values ('Hartwell', 'Midden', 'hmidden62@woothemes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ki', 'Rosenfeld', 'krosenfeld63@ask.com');
insert into pasazerowie (imie, nazwisko, email) values ('Johnna', 'Baudon', 'jbaudon64@imageshack.us');
insert into pasazerowie (imie, nazwisko, email) values ('Victor', 'Stickford', 'vstickford65@auda.org.au');
insert into pasazerowie (imie, nazwisko, email) values ('Hart', 'Rubinlicht', 'hrubinlicht66@etsy.com');
insert into pasazerowie (imie, nazwisko, email) values ('Latashia', 'Childes', 'lchildes67@home.pl');
insert into pasazerowie (imie, nazwisko, email) values ('Susanetta', 'Cheake', 'scheake68@blogspot.com');
insert into pasazerowie (imie, nazwisko, email) values ('Brianna', 'Warsop', 'bwarsop69@wix.com');
insert into pasazerowie (imie, nazwisko, email) values ('Janel', 'Pole', 'jpole6a@youku.com');
insert into pasazerowie (imie, nazwisko, email) values ('Giffer', 'Virr', 'gvirr6b@theglobeandmail.com');
insert into pasazerowie (imie, nazwisko, email) values ('Muffin', 'Buffery', 'mbuffery6c@ameblo.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Othello', 'Mabbitt', 'omabbitt6d@amazon.com');
insert into pasazerowie (imie, nazwisko, email) values ('Obie', 'Ellcome', 'oellcome6e@digg.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jarred', 'Hovell', 'jhovell6f@hp.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kamila', 'Clewett', 'kclewett6g@symantec.com');
insert into pasazerowie (imie, nazwisko, email) values ('Duffie', 'Ramberg', 'dramberg6h@shop-pro.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Maddi', 'Madgin', 'mmadgin6i@techcrunch.com');
insert into pasazerowie (imie, nazwisko, email) values ('Astra', 'Jodrellec', 'ajodrellec6j@printfriendly.com');
insert into pasazerowie (imie, nazwisko, email) values ('Vassili', 'Chifney', 'vchifney6k@networksolutions.com');
insert into pasazerowie (imie, nazwisko, email) values ('Caryl', 'Milner', 'cmilner6l@free.fr');
insert into pasazerowie (imie, nazwisko, email) values ('Trescha', 'Greenshields', 'tgreenshields6m@ameblo.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Ardelle', 'Nolot', 'anolot6n@wikia.com');
insert into pasazerowie (imie, nazwisko, email) values ('Doy', 'Huskisson', 'dhuskisson6o@cbsnews.com');
insert into pasazerowie (imie, nazwisko, email) values ('Adria', 'Conibere', 'aconibere6p@sourceforge.net');
insert into pasazerowie (imie, nazwisko, email) values ('Essa', 'Agirre', 'eagirre6q@clickbank.net');
insert into pasazerowie (imie, nazwisko, email) values ('Fremont', 'Nesbitt', 'fnesbitt6r@craigslist.org');
insert into pasazerowie (imie, nazwisko, email) values ('Valentina', 'Bottjer', 'vbottjer6s@people.com.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Pauletta', 'Lebond', 'plebond6t@wisc.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Elysha', 'Swyndley', 'eswyndley6u@ebay.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Gram', 'Jordine', 'gjordine6v@squarespace.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rock', 'Sturge', 'rsturge6w@spiegel.de');
insert into pasazerowie (imie, nazwisko, email) values ('Bartolemo', 'Lawly', 'blawly6x@t.co');
insert into pasazerowie (imie, nazwisko, email) values ('Minda', 'Incogna', 'mincogna6y@themeforest.net');
insert into pasazerowie (imie, nazwisko, email) values ('Keene', 'Hoofe', 'khoofe6z@oracle.com');
insert into pasazerowie (imie, nazwisko, email) values ('Astrix', 'Woodward', 'awoodward70@twitter.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lillis', 'Cranmere', 'lcranmere71@unicef.org');
insert into pasazerowie (imie, nazwisko, email) values ('Barbey', 'Fibbens', 'bfibbens72@fema.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Dorie', 'Coyett', 'dcoyett73@europa.eu');
insert into pasazerowie (imie, nazwisko, email) values ('Ina', 'Capel', 'icapel74@desdev.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Bobbe', 'Mucklestone', 'bmucklestone75@fema.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Michel', 'Dearnaly', 'mdearnaly76@wired.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bartholomew', 'Gilstin', 'bgilstin77@nhs.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Nelson', 'Radoux', 'nradoux78@skype.com');
insert into pasazerowie (imie, nazwisko, email) values ('Brynne', 'Barnes', 'bbarnes79@prlog.org');
insert into pasazerowie (imie, nazwisko, email) values ('Lamont', 'Orans', 'lorans7a@fda.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Cynthy', 'Lindenbluth', 'clindenbluth7b@opera.com');
insert into pasazerowie (imie, nazwisko, email) values ('Eziechiele', 'Manby', 'emanby7c@fc2.com');
insert into pasazerowie (imie, nazwisko, email) values ('Hilde', 'Hartmann', 'hhartmann7d@shop-pro.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Ealasaid', 'Dwane', 'edwane7e@cdc.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Constantia', 'Watmough', 'cwatmough7f@google.com.au');
insert into pasazerowie (imie, nazwisko, email) values ('Lisetta', 'Eilles', 'leilles7g@parallels.com');
insert into pasazerowie (imie, nazwisko, email) values ('Roz', 'Matic', 'rmatic7h@xing.com');
insert into pasazerowie (imie, nazwisko, email) values ('Garvey', 'Shury', 'gshury7i@cloudflare.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cacilia', 'Labroue', 'clabroue7j@simplemachines.org');
insert into pasazerowie (imie, nazwisko, email) values ('Ransell', 'Jandel', 'rjandel7k@gravatar.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ruy', 'Verillo', 'rverillo7l@altervista.org');
insert into pasazerowie (imie, nazwisko, email) values ('Kassey', 'Bugge', 'kbugge7m@nyu.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Cleveland', 'Mackett', 'cmackett7n@google.com.hk');
insert into pasazerowie (imie, nazwisko, email) values ('Bryn', 'Polino', 'bpolino7o@ucsd.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Linette', 'Strotton', 'lstrotton7p@sfgate.com');
insert into pasazerowie (imie, nazwisko, email) values ('Normy', 'Warhurst', 'nwarhurst7q@mysql.com');
insert into pasazerowie (imie, nazwisko, email) values ('Janet', 'Lyster', 'jlyster7r@devhub.com');
insert into pasazerowie (imie, nazwisko, email) values ('Clevie', 'Dugood', 'cdugood7s@blogger.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bendicty', 'Skechley', 'bskechley7t@taobao.com');
insert into pasazerowie (imie, nazwisko, email) values ('Fiorenze', 'Glasby', 'fglasby7u@clickbank.net');
insert into pasazerowie (imie, nazwisko, email) values ('Brittan', 'Igonet', 'bigonet7v@artisteer.com');
insert into pasazerowie (imie, nazwisko, email) values ('Timothea', 'Shillaker', 'tshillaker7w@cnet.com');
insert into pasazerowie (imie, nazwisko, email) values ('Marie-ann', 'Eyer', 'meyer7x@ebay.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Davidson', 'Simmonett', 'dsimmonett7y@ed.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Benjy', 'Grady', 'bgrady7z@quantcast.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ravid', 'Agent', 'ragent80@microsoft.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rudolf', 'Haken', 'rhaken81@ca.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Miltie', 'Munson', 'mmunson82@ifeng.com');
insert into pasazerowie (imie, nazwisko, email) values ('Theodore', 'Yarnley', 'tyarnley83@altervista.org');
insert into pasazerowie (imie, nazwisko, email) values ('Anna', 'Truggian', 'atruggian84@nih.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Moina', 'Newnham', 'mnewnham85@hubpages.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bevan', 'Blackhurst', 'bblackhurst86@creativecommons.org');
insert into pasazerowie (imie, nazwisko, email) values ('Elysia', 'De Cristoforo', 'edecristoforo87@netvibes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jonas', 'Jearum', 'jjearum88@mysql.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rene', 'Penrith', 'rpenrith89@chron.com');
insert into pasazerowie (imie, nazwisko, email) values ('Teriann', 'Conklin', 'tconklin8a@yolasite.com');
insert into pasazerowie (imie, nazwisko, email) values ('Locke', 'MacGowan', 'lmacgowan8b@ucoz.com');
insert into pasazerowie (imie, nazwisko, email) values ('Budd', 'Starrs', 'bstarrs8c@quantcast.com');
insert into pasazerowie (imie, nazwisko, email) values ('Hugh', 'Middas', 'hmiddas8d@liveinternet.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Doti', 'Ogden', 'dogden8e@yale.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Erastus', 'Rablan', 'erablan8f@harvard.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Henrik', 'Tocque', 'htocque8g@printfriendly.com');
insert into pasazerowie (imie, nazwisko, email) values ('Francine', 'McCulloch', 'fmcculloch8h@harvard.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Aleta', 'Filipczak', 'afilipczak8i@java.com');
insert into pasazerowie (imie, nazwisko, email) values ('Emiline', 'Colwell', 'ecolwell8j@wikispaces.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cissiee', 'Bullingham', 'cbullingham8k@yolasite.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rudolf', 'Lillo', 'rlillo8l@pinterest.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lenette', 'Weeke', 'lweeke8m@bloomberg.com');
insert into pasazerowie (imie, nazwisko, email) values ('Johan', 'Virgin', 'jvirgin8n@youku.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ancell', 'Meier', 'ameier8o@forbes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Teriann', 'Ulyat', 'tulyat8p@example.com');
insert into pasazerowie (imie, nazwisko, email) values ('Andrea', 'Cardenas', 'acardenas8q@wired.com');
insert into pasazerowie (imie, nazwisko, email) values ('Odelle', 'Benjamin', 'obenjamin8r@columbia.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Valentin', 'Booeln', 'vbooeln8s@ihg.com');
insert into pasazerowie (imie, nazwisko, email) values ('Uri', 'Djurkovic', 'udjurkovic8t@yelp.com');
insert into pasazerowie (imie, nazwisko, email) values ('Janith', 'Sobey', 'jsobey8u@state.tx.us');
insert into pasazerowie (imie, nazwisko, email) values ('Hillery', 'Deware', 'hdeware8v@jugem.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Vanya', 'McGing', 'vmcging8w@skype.com');
insert into pasazerowie (imie, nazwisko, email) values ('Tobye', 'Tilberry', 'ttilberry8x@statcounter.com');
insert into pasazerowie (imie, nazwisko, email) values ('Aldric', 'Bawle', 'abawle8y@time.com');
insert into pasazerowie (imie, nazwisko, email) values ('Grace', 'Freak', 'gfreak8z@taobao.com');
insert into pasazerowie (imie, nazwisko, email) values ('Josee', 'Ledgerton', 'jledgerton90@blogspot.com');
insert into pasazerowie (imie, nazwisko, email) values ('Arie', 'Mildner', 'amildner91@hud.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Davy', 'Roskrug', 'droskrug92@dmoz.org');
insert into pasazerowie (imie, nazwisko, email) values ('Vevay', 'Oxlee', 'voxlee93@simplemachines.org');
insert into pasazerowie (imie, nazwisko, email) values ('Johnnie', 'Ronaghan', 'jronaghan94@nytimes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lutero', 'Samter', 'lsamter95@yahoo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gleda', 'McTeague', 'gmcteague96@geocities.com');
insert into pasazerowie (imie, nazwisko, email) values ('Hattie', 'Cartwright', 'hcartwright97@list-manage.com');
insert into pasazerowie (imie, nazwisko, email) values ('Viki', 'Plumtree', 'vplumtree98@auda.org.au');
insert into pasazerowie (imie, nazwisko, email) values ('Barbee', 'Falcus', 'bfalcus99@stumbleupon.com');
insert into pasazerowie (imie, nazwisko, email) values ('Howie', 'Iacivelli', 'hiacivelli9a@hibu.com');
insert into pasazerowie (imie, nazwisko, email) values ('Janeen', 'Bows', 'jbows9b@unesco.org');
insert into pasazerowie (imie, nazwisko, email) values ('Seward', 'Welbelove', 'swelbelove9c@abc.net.au');
insert into pasazerowie (imie, nazwisko, email) values ('Marya', 'Tomei', 'mtomei9d@newyorker.com');
insert into pasazerowie (imie, nazwisko, email) values ('Catrina', 'Melmore', 'cmelmore9e@digg.com');
insert into pasazerowie (imie, nazwisko, email) values ('Alvy', 'Hares', 'ahares9f@shareasale.com');
insert into pasazerowie (imie, nazwisko, email) values ('Clayborn', 'Anshell', 'canshell9g@hugedomains.com');
insert into pasazerowie (imie, nazwisko, email) values ('Stephine', 'Malec', 'smalec9h@shinystat.com');
insert into pasazerowie (imie, nazwisko, email) values ('Morlee', 'McCurrie', 'mmccurrie9i@simplemachines.org');
insert into pasazerowie (imie, nazwisko, email) values ('Annelise', 'Tomowicz', 'atomowicz9j@moonfruit.com');
insert into pasazerowie (imie, nazwisko, email) values ('Fenelia', 'Lyttle', 'flyttle9k@craigslist.org');
insert into pasazerowie (imie, nazwisko, email) values ('Justis', 'Amphlett', 'jamphlett9l@howstuffworks.com');
insert into pasazerowie (imie, nazwisko, email) values ('Melli', 'Chiplin', 'mchiplin9m@tinyurl.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lilllie', 'Sapwell', 'lsapwell9n@reuters.com');
insert into pasazerowie (imie, nazwisko, email) values ('Adelind', 'Kilbee', 'akilbee9o@economist.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bob', 'Woolvett', 'bwoolvett9p@umn.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Stavro', 'Morrill', 'smorrill9q@dion.ne.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Mal', 'Clampe', 'mclampe9r@deviantart.com');
insert into pasazerowie (imie, nazwisko, email) values ('Wells', 'Pantin', 'wpantin9s@earthlink.net');
insert into pasazerowie (imie, nazwisko, email) values ('Herta', 'Tivers', 'htivers9t@cafepress.com');
insert into pasazerowie (imie, nazwisko, email) values ('Keely', 'Coarser', 'kcoarser9u@yahoo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Arleta', 'Baud', 'abaud9v@examiner.com');
insert into pasazerowie (imie, nazwisko, email) values ('Wye', 'Hassey', 'whassey9w@mysql.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sarge', 'Caselick', 'scaselick9x@senate.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Thaine', 'Freemantle', 'tfreemantle9y@ucsd.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Mellie', 'Gooly', 'mgooly9z@sitemeter.com');
insert into pasazerowie (imie, nazwisko, email) values ('Annette', 'Farherty', 'afarhertya0@networksolutions.com');
insert into pasazerowie (imie, nazwisko, email) values ('Florella', 'Gaitone', 'fgaitonea1@alexa.com');
insert into pasazerowie (imie, nazwisko, email) values ('Faun', 'Rawlin', 'frawlina2@stanford.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Ashely', 'Longwood', 'alongwooda3@github.io');
insert into pasazerowie (imie, nazwisko, email) values ('Jerrie', 'Rawll', 'jrawlla4@xrea.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sergeant', 'Inchbald', 'sinchbalda5@dedecms.com');
insert into pasazerowie (imie, nazwisko, email) values ('Eddy', 'Hexter', 'ehextera6@feedburner.com');
insert into pasazerowie (imie, nazwisko, email) values ('Elisabetta', 'Wynch', 'ewyncha7@wisc.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Elvina', 'McKeighen', 'emckeighena8@ed.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Coretta', 'Peris', 'cperisa9@ask.com');
insert into pasazerowie (imie, nazwisko, email) values ('Quintina', 'Montes', 'qmontesaa@pagesperso-orange.fr');
insert into pasazerowie (imie, nazwisko, email) values ('Wendell', 'Cluff', 'wcluffab@youtube.com');
insert into pasazerowie (imie, nazwisko, email) values ('Valina', 'Charker', 'vcharkerac@merriam-webster.com');
insert into pasazerowie (imie, nazwisko, email) values ('Wileen', 'Conerding', 'wconerdingad@jalbum.net');
insert into pasazerowie (imie, nazwisko, email) values ('Sibylle', 'Goalley', 'sgoalleyae@fda.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Hollis', 'Gunson', 'hgunsonaf@cam.ac.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Auberon', 'Francombe', 'afrancombeag@webs.com');
insert into pasazerowie (imie, nazwisko, email) values ('Hetty', 'Gotcliff', 'hgotcliffah@ehow.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lian', 'Hallows', 'lhallowsai@cbslocal.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cicely', 'Tavener', 'ctaveneraj@clickbank.net');
insert into pasazerowie (imie, nazwisko, email) values ('Boris', 'Filipowicz', 'bfilipowiczak@last.fm');
insert into pasazerowie (imie, nazwisko, email) values ('Katrina', 'Dorward', 'kdorwardal@amazonaws.com');
insert into pasazerowie (imie, nazwisko, email) values ('Shirleen', 'Skeels', 'sskeelsam@seesaa.net');
insert into pasazerowie (imie, nazwisko, email) values ('Brnaby', 'Edmed', 'bedmedan@blogger.com');
insert into pasazerowie (imie, nazwisko, email) values ('Pammie', 'Brogan', 'pbroganao@trellian.com');
insert into pasazerowie (imie, nazwisko, email) values ('Wade', 'Spracklin', 'wspracklinap@cisco.com');
insert into pasazerowie (imie, nazwisko, email) values ('Merissa', 'Fader', 'mfaderaq@sbwire.com');
insert into pasazerowie (imie, nazwisko, email) values ('Stoddard', 'Paxeford', 'spaxefordar@webeden.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Vince', 'Aylmer', 'vaylmeras@omniture.com');
insert into pasazerowie (imie, nazwisko, email) values ('Candi', 'Ivimey', 'civimeyat@cisco.com');
insert into pasazerowie (imie, nazwisko, email) values ('Hattie', 'Adshede', 'hadshedeau@domainmarket.com');
insert into pasazerowie (imie, nazwisko, email) values ('Costanza', 'Taplin', 'ctaplinav@youku.com');
insert into pasazerowie (imie, nazwisko, email) values ('Alonzo', 'McMeyler', 'amcmeyleraw@cdbaby.com');
insert into pasazerowie (imie, nazwisko, email) values ('Zonnya', 'Curner', 'zcurnerax@1688.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jabez', 'Pearton', 'jpeartonay@netscape.com');
insert into pasazerowie (imie, nazwisko, email) values ('Babbie', 'Oswal', 'boswalaz@google.de');
insert into pasazerowie (imie, nazwisko, email) values ('Annamarie', 'Sennett', 'asennettb0@desdev.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Farlee', 'Jillings', 'fjillingsb1@xrea.com');
insert into pasazerowie (imie, nazwisko, email) values ('Shantee', 'Lenox', 'slenoxb2@marriott.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gun', 'Laise', 'glaiseb3@shinystat.com');
insert into pasazerowie (imie, nazwisko, email) values ('Norene', 'Bellord', 'nbellordb4@cafepress.com');
insert into pasazerowie (imie, nazwisko, email) values ('Amos', 'Kinnoch', 'akinnochb5@howstuffworks.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cilka', 'Elwel', 'celwelb6@ucla.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Giustina', 'Agass', 'gagassb7@a8.net');
insert into pasazerowie (imie, nazwisko, email) values ('Georgy', 'Abernethy', 'gabernethyb8@xinhuanet.com');
insert into pasazerowie (imie, nazwisko, email) values ('Daron', 'Alasdair', 'dalasdairb9@live.com');
insert into pasazerowie (imie, nazwisko, email) values ('Mathe', 'Arnholz', 'marnholzba@cocolog-nifty.com');
insert into pasazerowie (imie, nazwisko, email) values ('Thane', 'Dorey', 'tdoreybb@wufoo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Codi', 'Glader', 'cgladerbc@bbc.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Blondell', 'Hindsberg', 'bhindsbergbd@bizjournals.com');
insert into pasazerowie (imie, nazwisko, email) values ('Irwin', 'Brindley', 'ibrindleybe@mapquest.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sergei', 'Bottrill', 'sbottrillbf@yale.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Aldin', 'Spratt', 'asprattbg@elegantthemes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lucita', 'Cordeiro', 'lcordeirobh@examiner.com');
insert into pasazerowie (imie, nazwisko, email) values ('Vida', 'McKinnell', 'vmckinnellbi@gravatar.com');
insert into pasazerowie (imie, nazwisko, email) values ('Simeon', 'Sommerton', 'ssommertonbj@businessweek.com');
insert into pasazerowie (imie, nazwisko, email) values ('Yank', 'Handmore', 'yhandmorebk@dailymail.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Ari', 'Rogeon', 'arogeonbl@vk.com');
insert into pasazerowie (imie, nazwisko, email) values ('Francklyn', 'Pegden', 'fpegdenbm@netlog.com');
insert into pasazerowie (imie, nazwisko, email) values ('Shayna', 'Fleisch', 'sfleischbn@usatoday.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ruthy', 'Gerrard', 'rgerrardbo@tripod.com');
insert into pasazerowie (imie, nazwisko, email) values ('Therese', 'Barnaby', 'tbarnabybp@xrea.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ive', 'Zamudio', 'izamudiobq@netvibes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Verney', 'McDool', 'vmcdoolbr@xing.com');
insert into pasazerowie (imie, nazwisko, email) values ('Marcellus', 'Winscum', 'mwinscumbs@flickr.com');
insert into pasazerowie (imie, nazwisko, email) values ('Corrianne', 'Newell', 'cnewellbt@zimbio.com');
insert into pasazerowie (imie, nazwisko, email) values ('Leah', 'Tombleson', 'ltomblesonbu@istockphoto.com');
insert into pasazerowie (imie, nazwisko, email) values ('Herold', 'Tracey', 'htraceybv@mapquest.com');
insert into pasazerowie (imie, nazwisko, email) values ('Celina', 'Meeus', 'cmeeusbw@liveinternet.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Hewie', 'Ascraft', 'hascraftbx@msu.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Ardine', 'Wallas', 'awallasby@census.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Lurette', 'Housecroft', 'lhousecroftbz@lycos.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lorraine', 'Gagan', 'lgaganc0@scribd.com');
insert into pasazerowie (imie, nazwisko, email) values ('Maryl', 'Veart', 'mveartc1@stumbleupon.com');
insert into pasazerowie (imie, nazwisko, email) values ('Horatia', 'Hryncewicz', 'hhryncewiczc2@artisteer.com');
insert into pasazerowie (imie, nazwisko, email) values ('Valenka', 'Burgill', 'vburgillc3@scribd.com');
insert into pasazerowie (imie, nazwisko, email) values ('Quillan', 'Clendinning', 'qclendinningc4@mozilla.org');
insert into pasazerowie (imie, nazwisko, email) values ('Shawna', 'Lobe', 'slobec5@amazon.co.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Kendell', 'McKinnell', 'kmckinnellc6@icio.us');
insert into pasazerowie (imie, nazwisko, email) values ('Jeremy', 'Frisdick', 'jfrisdickc7@hugedomains.com');
insert into pasazerowie (imie, nazwisko, email) values ('Merrielle', 'Venard', 'mvenardc8@sina.com.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Meghann', 'Berzen', 'mberzenc9@uiuc.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Ludvig', 'Jilkes', 'ljilkesca@yellowbook.com');
insert into pasazerowie (imie, nazwisko, email) values ('Garvey', 'Winning', 'gwinningcb@icq.com');
insert into pasazerowie (imie, nazwisko, email) values ('Federica', 'Galler', 'fgallercc@icq.com');
insert into pasazerowie (imie, nazwisko, email) values ('Charo', 'Dunnet', 'cdunnetcd@miitbeian.gov.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Nowell', 'Mayman', 'nmaymance@reuters.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kori', 'McKelvie', 'kmckelviecf@latimes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Hinze', 'Ygoe', 'hygoecg@unesco.org');
insert into pasazerowie (imie, nazwisko, email) values ('Sibbie', 'Trank', 'strankch@wiley.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lilllie', 'Lafferty', 'llaffertyci@deviantart.com');
insert into pasazerowie (imie, nazwisko, email) values ('Thoma', 'MacCambridge', 'tmaccambridgecj@nydailynews.com');
insert into pasazerowie (imie, nazwisko, email) values ('Evita', 'Mourge', 'emourgeck@hc360.com');
insert into pasazerowie (imie, nazwisko, email) values ('Carey', 'Dobing', 'cdobingcl@accuweather.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sven', 'Riccelli', 'sriccellicm@yandex.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Morgun', 'MacNeilly', 'mmacneillycn@usnews.com');
insert into pasazerowie (imie, nazwisko, email) values ('Daron', 'Brumbye', 'dbrumbyeco@quantcast.com');
insert into pasazerowie (imie, nazwisko, email) values ('Doralyn', 'Avrahamof', 'davrahamofcp@jugem.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Fey', 'Newsham', 'fnewshamcq@intel.com');
insert into pasazerowie (imie, nazwisko, email) values ('Dionne', 'Shaddock', 'dshaddockcr@google.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Ty', 'Melvin', 'tmelvincs@columbia.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Karolina', 'Freezer', 'kfreezerct@ted.com');
insert into pasazerowie (imie, nazwisko, email) values ('Max', 'Kurt', 'mkurtcu@homestead.com');
insert into pasazerowie (imie, nazwisko, email) values ('Domenic', 'Easterling', 'deasterlingcv@creativecommons.org');
insert into pasazerowie (imie, nazwisko, email) values ('Sib', 'Cobb', 'scobbcw@newyorker.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gussi', 'Massie', 'gmassiecx@twitter.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ricard', 'Hamshaw', 'rhamshawcy@merriam-webster.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lyn', 'Whenman', 'lwhenmancz@abc.net.au');
insert into pasazerowie (imie, nazwisko, email) values ('Delmor', 'Girton', 'dgirtond0@yelp.com');
insert into pasazerowie (imie, nazwisko, email) values ('Guillema', 'Fulks', 'gfulksd1@fastcompany.com');
insert into pasazerowie (imie, nazwisko, email) values ('Carmella', 'Thirtle', 'cthirtled2@gnu.org');
insert into pasazerowie (imie, nazwisko, email) values ('Derrek', 'Saggs', 'dsaggsd3@ow.ly');
insert into pasazerowie (imie, nazwisko, email) values ('Nerty', 'Temple', 'ntempled4@forbes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gaspar', 'Esmond', 'gesmondd5@wikia.com');
insert into pasazerowie (imie, nazwisko, email) values ('Avie', 'Antoons', 'aantoonsd6@trellian.com');
insert into pasazerowie (imie, nazwisko, email) values ('Babbie', 'Delong', 'bdelongd7@cnbc.com');
insert into pasazerowie (imie, nazwisko, email) values ('Shandie', 'Sines', 'ssinesd8@ning.com');
insert into pasazerowie (imie, nazwisko, email) values ('Brigham', 'Wansbury', 'bwansburyd9@mozilla.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ruthy', 'Sebrens', 'rsebrensda@gravatar.com');
insert into pasazerowie (imie, nazwisko, email) values ('Mychal', 'Maddaford', 'mmaddaforddb@ning.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nanon', 'Jaffray', 'njaffraydc@answers.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nadiya', 'Scourfield', 'nscourfielddd@parallels.com');
insert into pasazerowie (imie, nazwisko, email) values ('Christalle', 'Dryden', 'cdrydende@google.pl');
insert into pasazerowie (imie, nazwisko, email) values ('Kyrstin', 'Novacek', 'knovacekdf@about.me');
insert into pasazerowie (imie, nazwisko, email) values ('Westley', 'Meakin', 'wmeakindg@mail.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Jenn', 'Windmill', 'jwindmilldh@cdc.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Melisande', 'Benjafield', 'mbenjafielddi@pinterest.com');
insert into pasazerowie (imie, nazwisko, email) values ('Malva', 'Shwenn', 'mshwenndj@hibu.com');
insert into pasazerowie (imie, nazwisko, email) values ('Winnie', 'Fright', 'wfrightdk@army.mil');
insert into pasazerowie (imie, nazwisko, email) values ('Nanci', 'Cockerell', 'ncockerelldl@cargocollective.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ruby', 'Lademann', 'rlademanndm@google.com.hk');
insert into pasazerowie (imie, nazwisko, email) values ('Waly', 'Pozer', 'wpozerdn@springer.com');
insert into pasazerowie (imie, nazwisko, email) values ('Pablo', 'Rowaszkiewicz', 'prowaszkiewiczdo@squidoo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Alexandros', 'Rodda', 'aroddadp@mit.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Angil', 'Yea', 'ayeadq@freewebs.com');
insert into pasazerowie (imie, nazwisko, email) values ('Elsworth', 'Moxon', 'emoxondr@japanpost.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Donnie', 'Simeon', 'dsimeonds@yellowbook.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nikita', 'Molnar', 'nmolnardt@live.com');
insert into pasazerowie (imie, nazwisko, email) values ('Norene', 'Cashmore', 'ncashmoredu@trellian.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cory', 'Swait', 'cswaitdv@dot.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Dulcinea', 'Harvatt', 'dharvattdw@reverbnation.com');
insert into pasazerowie (imie, nazwisko, email) values ('Adeline', 'Owtram', 'aowtramdx@bravesites.com');
insert into pasazerowie (imie, nazwisko, email) values ('Thelma', 'Launder', 'tlaunderdy@jiathis.com');
insert into pasazerowie (imie, nazwisko, email) values ('Carmon', 'Grelak', 'cgrelakdz@sakura.ne.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Francklyn', 'Roll', 'frolle0@unc.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Ruth', 'Greenhalf', 'rgreenhalfe1@cdbaby.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bernice', 'MacKill', 'bmackille2@webs.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lynde', 'Blackmore', 'lblackmoree3@google.pl');
insert into pasazerowie (imie, nazwisko, email) values ('Tedd', 'Andrzejowski', 'tandrzejowskie4@smugmug.com');
insert into pasazerowie (imie, nazwisko, email) values ('Elli', 'Emig', 'eemige5@yellowbook.com');
insert into pasazerowie (imie, nazwisko, email) values ('Tracie', 'Chalk', 'tchalke6@instagram.com');
insert into pasazerowie (imie, nazwisko, email) values ('Vanya', 'Iczokvitz', 'viczokvitze7@ucsd.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Titus', 'Tapping', 'ttappinge8@yolasite.com');
insert into pasazerowie (imie, nazwisko, email) values ('Alf', 'Hamlin', 'ahamline9@phoca.cz');
insert into pasazerowie (imie, nazwisko, email) values ('Katee', 'Dillaway', 'kdillawayea@networksolutions.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sheilah', 'Pulster', 'spulstereb@columbia.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Isa', 'Djuricic', 'idjuricicec@globo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Monique', 'Rumin', 'mrumined@msu.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Gannie', 'MacIver', 'gmaciveree@army.mil');
insert into pasazerowie (imie, nazwisko, email) values ('Cosimo', 'Legrand', 'clegrandef@japanpost.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Graig', 'Matchett', 'gmatchetteg@soundcloud.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ira', 'Lehenmann', 'ilehenmanneh@exblog.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Linea', 'Georgeon', 'lgeorgeonei@google.ca');
insert into pasazerowie (imie, nazwisko, email) values ('Betsy', 'Elmes', 'belmesej@over-blog.com');
insert into pasazerowie (imie, nazwisko, email) values ('Marlin', 'McMillan', 'mmcmillanek@hibu.com');
insert into pasazerowie (imie, nazwisko, email) values ('Briny', 'Brewerton', 'bbrewertonel@wix.com');
insert into pasazerowie (imie, nazwisko, email) values ('Steve', 'Mattioli', 'smattioliem@paginegialle.it');
insert into pasazerowie (imie, nazwisko, email) values ('Bettine', 'Legat', 'blegaten@epa.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Ulysses', 'Trineman', 'utrinemaneo@dion.ne.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Mignon', 'Beebee', 'mbeebeeep@t.co');
insert into pasazerowie (imie, nazwisko, email) values ('Dianne', 'Blaksland', 'dblakslandeq@umn.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Butch', 'Samworth', 'bsamworther@topsy.com');
insert into pasazerowie (imie, nazwisko, email) values ('Regina', 'Sadat', 'rsadates@cnbc.com');
insert into pasazerowie (imie, nazwisko, email) values ('Roman', 'Cadd', 'rcaddet@com.com');
insert into pasazerowie (imie, nazwisko, email) values ('Clarance', 'Dudding', 'cduddingeu@google.es');
insert into pasazerowie (imie, nazwisko, email) values ('Blakelee', 'Middas', 'bmiddasev@amazon.co.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Lenee', 'Govey', 'lgoveyew@drupal.org');
insert into pasazerowie (imie, nazwisko, email) values ('Freemon', 'London', 'flondonex@dailymotion.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ibby', 'Tidy', 'itidyey@de.vu');
insert into pasazerowie (imie, nazwisko, email) values ('Barbe', 'Beardon', 'bbeardonez@mozilla.org');
insert into pasazerowie (imie, nazwisko, email) values ('Marlena', 'Collumbell', 'mcollumbellf0@lycos.com');
insert into pasazerowie (imie, nazwisko, email) values ('Brittani', 'Probart', 'bprobartf1@flickr.com');
insert into pasazerowie (imie, nazwisko, email) values ('Germaine', 'McCracken', 'gmccrackenf2@businessweek.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ingaberg', 'Jeffreys', 'ijeffreysf3@blogger.com');
insert into pasazerowie (imie, nazwisko, email) values ('Delcine', 'Sadry', 'dsadryf4@xing.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gaspard', 'Collishaw', 'gcollishawf5@irs.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Sisile', 'Kennerley', 'skennerleyf6@washingtonpost.com');
insert into pasazerowie (imie, nazwisko, email) values ('Vida', 'Shurrocks', 'vshurrocksf7@google.pl');
insert into pasazerowie (imie, nazwisko, email) values ('Nata', 'Larret', 'nlarretf8@auda.org.au');
insert into pasazerowie (imie, nazwisko, email) values ('Devy', 'Duffie', 'dduffief9@samsung.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sandie', 'Prydie', 'sprydiefa@fc2.com');
insert into pasazerowie (imie, nazwisko, email) values ('Flossie', 'Cressar', 'fcressarfb@who.int');
insert into pasazerowie (imie, nazwisko, email) values ('Kaitlynn', 'McQuirk', 'kmcquirkfc@simplemachines.org');
insert into pasazerowie (imie, nazwisko, email) values ('Zia', 'Punshon', 'zpunshonfd@sphinn.com');
insert into pasazerowie (imie, nazwisko, email) values ('Karna', 'Corp', 'kcorpfe@phpbb.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lyman', 'Zielinski', 'lzielinskiff@mashable.com');
insert into pasazerowie (imie, nazwisko, email) values ('Celesta', 'Bradbrook', 'cbradbrookfg@wikipedia.org');
insert into pasazerowie (imie, nazwisko, email) values ('Ulric', 'Maginot', 'umaginotfh@about.com');
insert into pasazerowie (imie, nazwisko, email) values ('Keefer', 'Duester', 'kduesterfi@usatoday.com');
insert into pasazerowie (imie, nazwisko, email) values ('Graehme', 'Valentetti', 'gvalentettifj@foxnews.com');
insert into pasazerowie (imie, nazwisko, email) values ('Silas', 'Nast', 'snastfk@guardian.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Katie', 'Fawssett', 'kfawssettfl@biblegateway.com');
insert into pasazerowie (imie, nazwisko, email) values ('Amalee', 'Jersch', 'ajerschfm@goo.gl');
insert into pasazerowie (imie, nazwisko, email) values ('Sunny', 'Tregenza', 'stregenzafn@constantcontact.com');
insert into pasazerowie (imie, nazwisko, email) values ('Tommy', 'Danbury', 'tdanburyfo@histats.com');
insert into pasazerowie (imie, nazwisko, email) values ('Querida', 'Chander', 'qchanderfp@si.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Kimberlyn', 'Lembcke', 'klembckefq@php.net');
insert into pasazerowie (imie, nazwisko, email) values ('Andy', 'Northbridge', 'anorthbridgefr@godaddy.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kare', 'Poulston', 'kpoulstonfs@harvard.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Rozamond', 'Banbrook', 'rbanbrookft@nasa.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Tami', 'Boyd', 'tboydfu@stanford.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Melodie', 'McCandless', 'mmccandlessfv@geocities.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Abby', 'Ellum', 'aellumfw@nature.com');
insert into pasazerowie (imie, nazwisko, email) values ('Karen', 'Beech', 'kbeechfx@wufoo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Walt', 'Giacomini', 'wgiacominify@theglobeandmail.com');
insert into pasazerowie (imie, nazwisko, email) values ('Magnum', 'Dallinder', 'mdallinderfz@geocities.com');
insert into pasazerowie (imie, nazwisko, email) values ('Laureen', 'Corteis', 'lcorteisg0@cbc.ca');
insert into pasazerowie (imie, nazwisko, email) values ('Marsiella', 'Medley', 'mmedleyg1@bigcartel.com');
insert into pasazerowie (imie, nazwisko, email) values ('Temple', 'McGibbon', 'tmcgibbong2@smugmug.com');
insert into pasazerowie (imie, nazwisko, email) values ('Alli', 'MacFadyen', 'amacfadyeng3@stanford.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Bab', 'Okeshott', 'bokeshottg4@hc360.com');
insert into pasazerowie (imie, nazwisko, email) values ('Marion', 'Reggler', 'mregglerg5@webmd.com');
insert into pasazerowie (imie, nazwisko, email) values ('Eartha', 'O''Hallagan', 'eohallagang6@naver.com');
insert into pasazerowie (imie, nazwisko, email) values ('Shanda', 'Spelwood', 'sspelwoodg7@over-blog.com');
insert into pasazerowie (imie, nazwisko, email) values ('Shaine', 'Boissier', 'sboissierg8@ehow.com');
insert into pasazerowie (imie, nazwisko, email) values ('Stormie', 'Rampling', 'sramplingg9@friendfeed.com');
insert into pasazerowie (imie, nazwisko, email) values ('Anselm', 'Bridywater', 'abridywaterga@theatlantic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Michaela', 'Gash', 'mgashgb@bbc.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Ketty', 'Lydford', 'klydfordgc@tumblr.com');
insert into pasazerowie (imie, nazwisko, email) values ('Mary', 'McFetrich', 'mmcfetrichgd@nps.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Nertie', 'Bambrick', 'nbambrickge@naver.com');
insert into pasazerowie (imie, nazwisko, email) values ('Juanita', 'Fairtlough', 'jfairtloughgf@fema.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Celine', 'Mitkov', 'cmitkovgg@shareasale.com');
insert into pasazerowie (imie, nazwisko, email) values ('Brooke', 'Trudgion', 'btrudgiongh@ca.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Hobey', 'Scripps', 'hscrippsgi@yelp.com');
insert into pasazerowie (imie, nazwisko, email) values ('Morie', 'Burnhard', 'mburnhardgj@hc360.com');
insert into pasazerowie (imie, nazwisko, email) values ('Abey', 'Geraldo', 'ageraldogk@google.de');
insert into pasazerowie (imie, nazwisko, email) values ('Roscoe', 'Gheeraert', 'rgheeraertgl@netvibes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Whit', 'Emanuelli', 'wemanuelligm@rediff.com');
insert into pasazerowie (imie, nazwisko, email) values ('Dane', 'McCusker', 'dmccuskergn@e-recht24.de');
insert into pasazerowie (imie, nazwisko, email) values ('Margarette', 'Gozney', 'mgozneygo@dagondesign.com');
insert into pasazerowie (imie, nazwisko, email) values ('Janine', 'Lansdale', 'jlansdalegp@twitpic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Roxi', 'Trippack', 'rtrippackgq@mayoclinic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Marleah', 'Cohani', 'mcohanigr@vk.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ivory', 'Longstreet', 'ilongstreetgs@msn.com');
insert into pasazerowie (imie, nazwisko, email) values ('Stanley', 'Abramzon', 'sabramzongt@irs.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Nedi', 'McHarry', 'nmcharrygu@ox.ac.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Tallia', 'MacAllaster', 'tmacallastergv@cbc.ca');
insert into pasazerowie (imie, nazwisko, email) values ('Nanine', 'Billion', 'nbilliongw@delicious.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lanny', 'Gratton', 'lgrattongx@psu.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Gaby', 'Battany', 'gbattanygy@tiny.cc');
insert into pasazerowie (imie, nazwisko, email) values ('Reeta', 'Hulse', 'rhulsegz@cocolog-nifty.com');
insert into pasazerowie (imie, nazwisko, email) values ('Keefe', 'Postgate', 'kpostgateh0@narod.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Frederich', 'Davydochkin', 'fdavydochkinh1@nasa.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Grenville', 'Venditti', 'gvendittih2@google.co.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Karin', 'O''Kennavain', 'kokennavainh3@nsw.gov.au');
insert into pasazerowie (imie, nazwisko, email) values ('Maryjo', 'Freeborn', 'mfreebornh4@constantcontact.com');
insert into pasazerowie (imie, nazwisko, email) values ('Aurthur', 'Kubasek', 'akubasekh5@sciencedirect.com');
insert into pasazerowie (imie, nazwisko, email) values ('Verna', 'Larsen', 'vlarsenh6@latimes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Alasteir', 'Birk', 'abirkh7@taobao.com');
insert into pasazerowie (imie, nazwisko, email) values ('Odilia', 'Simonnet', 'osimonneth8@nifty.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rhett', 'Aharoni', 'raharonih9@blogger.com');
insert into pasazerowie (imie, nazwisko, email) values ('Levon', 'Davidovics', 'ldavidovicsha@msn.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cristin', 'Selbie', 'cselbiehb@wunderground.com');
insert into pasazerowie (imie, nazwisko, email) values ('Mimi', 'Darkott', 'mdarkotthc@reverbnation.com');
insert into pasazerowie (imie, nazwisko, email) values ('Brittney', 'Swithenby', 'bswithenbyhd@issuu.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kippie', 'Roycroft', 'kroycrofthe@slashdot.org');
insert into pasazerowie (imie, nazwisko, email) values ('Clementia', 'Pinks', 'cpinkshf@newsvine.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cam', 'Calwell', 'ccalwellhg@slashdot.org');
insert into pasazerowie (imie, nazwisko, email) values ('Julianne', 'Grainger', 'jgraingerhh@cisco.com');
insert into pasazerowie (imie, nazwisko, email) values ('Townie', 'Tenwick', 'ttenwickhi@xrea.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cointon', 'Loffill', 'cloffillhj@merriam-webster.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lorilyn', 'Mapholm', 'lmapholmhk@ning.com');
insert into pasazerowie (imie, nazwisko, email) values ('Anne', 'Bolstridge', 'abolstridgehl@va.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Franni', 'MacGowan', 'fmacgowanhm@ameblo.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Gordon', 'Arrault', 'garraulthn@wix.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gelya', 'Wallbridge', 'gwallbridgeho@parallels.com');
insert into pasazerowie (imie, nazwisko, email) values ('Griffie', 'Jullian', 'gjullianhp@csmonitor.com');
insert into pasazerowie (imie, nazwisko, email) values ('Shea', 'Jeger', 'sjegerhq@mozilla.org');
insert into pasazerowie (imie, nazwisko, email) values ('Jeremie', 'Yerbury', 'jyerburyhr@netscape.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kerrill', 'MacFadyen', 'kmacfadyenhs@yahoo.co.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Tammie', 'Songist', 'tsongistht@ucoz.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Marisa', 'Rollingson', 'mrollingsonhu@blogs.com');
insert into pasazerowie (imie, nazwisko, email) values ('Whit', 'Meardon', 'wmeardonhv@toplist.cz');
insert into pasazerowie (imie, nazwisko, email) values ('Eldridge', 'Turri', 'eturrihw@techcrunch.com');
insert into pasazerowie (imie, nazwisko, email) values ('Andrea', 'Kornousek', 'akornousekhx@hc360.com');
insert into pasazerowie (imie, nazwisko, email) values ('Charmion', 'Edling', 'cedlinghy@wsj.com');
insert into pasazerowie (imie, nazwisko, email) values ('Zachariah', 'Danielsky', 'zdanielskyhz@technorati.com');
insert into pasazerowie (imie, nazwisko, email) values ('Tami', 'Rexworthy', 'trexworthyi0@census.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Bab', 'Pollastro', 'bpollastroi1@guardian.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Katuscha', 'Ingilson', 'kingilsoni2@umich.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Deloria', 'Studde', 'dstuddei3@issuu.com');
insert into pasazerowie (imie, nazwisko, email) values ('Edi', 'Wagon', 'ewagoni4@plala.or.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Calvin', 'Robilliard', 'crobilliardi5@acquirethisname.com');
insert into pasazerowie (imie, nazwisko, email) values ('Neala', 'Kells', 'nkellsi6@ted.com');
insert into pasazerowie (imie, nazwisko, email) values ('Slade', 'Maisey', 'smaiseyi7@tmall.com');
insert into pasazerowie (imie, nazwisko, email) values ('Zeke', 'Catterall', 'zcatteralli8@behance.net');
insert into pasazerowie (imie, nazwisko, email) values ('Thomasin', 'Curnok', 'tcurnoki9@pagesperso-orange.fr');
insert into pasazerowie (imie, nazwisko, email) values ('Rosalynd', 'Aberhart', 'raberhartia@arizona.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Jory', 'Tutchings', 'jtutchingsib@technorati.com');
insert into pasazerowie (imie, nazwisko, email) values ('Fanny', 'Vickarman', 'fvickarmanic@aboutads.info');
insert into pasazerowie (imie, nazwisko, email) values ('Jasun', 'Scallon', 'jscallonid@chicagotribune.com');
insert into pasazerowie (imie, nazwisko, email) values ('Meridith', 'Haverty', 'mhavertyie@digg.com');
insert into pasazerowie (imie, nazwisko, email) values ('Howey', 'Twelve', 'htwelveif@google.com.au');
insert into pasazerowie (imie, nazwisko, email) values ('Giles', 'McMylor', 'gmcmylorig@mayoclinic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gaspard', 'Cotillard', 'gcotillardih@amazonaws.com');
insert into pasazerowie (imie, nazwisko, email) values ('Carina', 'Dorgan', 'cdorganii@scientificamerican.com');
insert into pasazerowie (imie, nazwisko, email) values ('Maxie', 'Parbrook', 'mparbrookij@cbslocal.com');
insert into pasazerowie (imie, nazwisko, email) values ('Brooks', 'Tanswill', 'btanswillik@nasa.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Maggee', 'Draco', 'mdracoil@goo.ne.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Bernadina', 'Pitford', 'bpitfordim@ucla.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Raddie', 'Sifleet', 'rsifleetin@cloudflare.com');
insert into pasazerowie (imie, nazwisko, email) values ('Martyn', 'Switsur', 'mswitsurio@ehow.com');
insert into pasazerowie (imie, nazwisko, email) values ('Brinn', 'Bowich', 'bbowichip@springer.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gillan', 'Schust', 'gschustiq@acquirethisname.com');
insert into pasazerowie (imie, nazwisko, email) values ('Mattias', 'Alabone', 'malaboneir@amazonaws.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bobbie', 'Stops', 'bstopsis@rambler.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Ganny', 'Baskerville', 'gbaskervilleit@digg.com');
insert into pasazerowie (imie, nazwisko, email) values ('Harlie', 'Aguilar', 'haguilariu@deliciousdays.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kathie', 'Imore', 'kimoreiv@opensource.org');
insert into pasazerowie (imie, nazwisko, email) values ('Gannie', 'Gyurkovics', 'ggyurkovicsiw@ameblo.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Dinny', 'Schiefersten', 'dschieferstenix@cmu.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Dew', 'Dunkerton', 'ddunkertoniy@prlog.org');
insert into pasazerowie (imie, nazwisko, email) values ('Alice', 'Petken', 'apetkeniz@cornell.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Tomlin', 'Keyho', 'tkeyhoj0@microsoft.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rozanne', 'Clemoes', 'rclemoesj1@photobucket.com');
insert into pasazerowie (imie, nazwisko, email) values ('Moira', 'Dawson', 'mdawsonj2@netscape.com');
insert into pasazerowie (imie, nazwisko, email) values ('Eleonore', 'Stone', 'estonej3@economist.com');
insert into pasazerowie (imie, nazwisko, email) values ('Keelby', 'Davison', 'kdavisonj4@loc.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Buck', 'Chalcraft', 'bchalcraftj5@examiner.com');
insert into pasazerowie (imie, nazwisko, email) values ('Emanuele', 'Hucke', 'ehuckej6@ycombinator.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cinderella', 'Grasser', 'cgrasserj7@shareasale.com');
insert into pasazerowie (imie, nazwisko, email) values ('Hugues', 'Hartburn', 'hhartburnj8@w3.org');
insert into pasazerowie (imie, nazwisko, email) values ('Enos', 'Frantzen', 'efrantzenj9@themeforest.net');
insert into pasazerowie (imie, nazwisko, email) values ('Brooks', 'Meany', 'bmeanyja@patch.com');
insert into pasazerowie (imie, nazwisko, email) values ('Mile', 'Robuchon', 'mrobuchonjb@geocities.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Corny', 'Semmens', 'csemmensjc@cnn.com');
insert into pasazerowie (imie, nazwisko, email) values ('Selby', 'Armstrong', 'sarmstrongjd@elegantthemes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sayer', 'Gibbie', 'sgibbieje@cmu.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Flory', 'Scanderet', 'fscanderetjf@rediff.com');
insert into pasazerowie (imie, nazwisko, email) values ('Romona', 'Crumley', 'rcrumleyjg@who.int');
insert into pasazerowie (imie, nazwisko, email) values ('Julianne', 'Hawley', 'jhawleyjh@cnbc.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gay', 'Jerams', 'gjeramsji@yolasite.com');
insert into pasazerowie (imie, nazwisko, email) values ('Judah', 'Corkan', 'jcorkanjj@digg.com');
insert into pasazerowie (imie, nazwisko, email) values ('Fair', 'Allden', 'falldenjk@myspace.com');
insert into pasazerowie (imie, nazwisko, email) values ('Launce', 'Bernhard', 'lbernhardjl@yahoo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Marcia', 'Mosson', 'mmossonjm@flavors.me');
insert into pasazerowie (imie, nazwisko, email) values ('Artemis', 'Hogsden', 'ahogsdenjn@opensource.org');
insert into pasazerowie (imie, nazwisko, email) values ('Averell', 'Andrewartha', 'aandrewarthajo@telegraph.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('L;urette', 'Joint', 'ljointjp@homestead.com');
insert into pasazerowie (imie, nazwisko, email) values ('Roz', 'Tidbold', 'rtidboldjq@npr.org');
insert into pasazerowie (imie, nazwisko, email) values ('Iseabal', 'Strickland', 'istricklandjr@shinystat.com');
insert into pasazerowie (imie, nazwisko, email) values ('Dani', 'Matteoni', 'dmatteonijs@sakura.ne.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Hastings', 'Posselwhite', 'hposselwhitejt@guardian.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Irwinn', 'Brewis', 'ibrewisju@yellowpages.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jillayne', 'Poetz', 'jpoetzjv@1688.com');
insert into pasazerowie (imie, nazwisko, email) values ('Melodee', 'Beatty', 'mbeattyjw@posterous.com');
insert into pasazerowie (imie, nazwisko, email) values ('Keenan', 'Jobbing', 'kjobbingjx@ted.com');
insert into pasazerowie (imie, nazwisko, email) values ('Worthington', 'Fayers', 'wfayersjy@wikipedia.org');
insert into pasazerowie (imie, nazwisko, email) values ('Dewain', 'Trayford', 'dtrayfordjz@xinhuanet.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ginnifer', 'Liebrecht', 'gliebrechtk0@oracle.com');
insert into pasazerowie (imie, nazwisko, email) values ('Will', 'O''Doohaine', 'wodoohainek1@wufoo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nonah', 'Winterborne', 'nwinterbornek2@behance.net');
insert into pasazerowie (imie, nazwisko, email) values ('Halli', 'Ferrers', 'hferrersk3@symantec.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ingemar', 'Winsper', 'iwinsperk4@webnode.com');
insert into pasazerowie (imie, nazwisko, email) values ('Dory', 'Akam', 'dakamk5@cdc.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Tiler', 'Cotter', 'tcotterk6@woothemes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Felicle', 'Leason', 'fleasonk7@altervista.org');
insert into pasazerowie (imie, nazwisko, email) values ('Griffith', 'Cankett', 'gcankettk8@phpbb.com');
insert into pasazerowie (imie, nazwisko, email) values ('Joey', 'Wayper', 'jwayperk9@usnews.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nicolle', 'McDonnell', 'nmcdonnellka@jugem.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Karlie', 'Tapner', 'ktapnerkb@businessweek.com');
insert into pasazerowie (imie, nazwisko, email) values ('Stacie', 'Lindman', 'slindmankc@samsung.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kelcey', 'Zannini', 'kzanninikd@yelp.com');
insert into pasazerowie (imie, nazwisko, email) values ('Harriet', 'Mitcheson', 'hmitchesonke@twitpic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kandy', 'Ginman', 'kginmankf@accuweather.com');
insert into pasazerowie (imie, nazwisko, email) values ('Candis', 'Smeeth', 'csmeethkg@comcast.net');
insert into pasazerowie (imie, nazwisko, email) values ('Mitch', 'Thickin', 'mthickinkh@yahoo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Barbee', 'Poole', 'bpooleki@ezinearticles.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jesse', 'Loutheane', 'jloutheanekj@youku.com');
insert into pasazerowie (imie, nazwisko, email) values ('Em', 'Gavaran', 'egavarankk@google.com.br');
insert into pasazerowie (imie, nazwisko, email) values ('Shirl', 'Rudram', 'srudramkl@adobe.com');
insert into pasazerowie (imie, nazwisko, email) values ('Brendan', 'Yegorev', 'byegorevkm@weibo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bunnie', 'Dawson', 'bdawsonkn@shop-pro.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Louella', 'Devonish', 'ldevonishko@smugmug.com');
insert into pasazerowie (imie, nazwisko, email) values ('Carlita', 'Duggan', 'cduggankp@fotki.com');
insert into pasazerowie (imie, nazwisko, email) values ('Fidelia', 'Stollberger', 'fstollbergerkq@narod.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Carlie', 'Scrooby', 'cscroobykr@shinystat.com');
insert into pasazerowie (imie, nazwisko, email) values ('Barny', 'Zemler', 'bzemlerks@vkontakte.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Cori', 'Rediers', 'credierskt@google.nl');
insert into pasazerowie (imie, nazwisko, email) values ('Meredeth', 'Cottell', 'mcottellku@facebook.com');
insert into pasazerowie (imie, nazwisko, email) values ('Patti', 'Jurries', 'pjurrieskv@tripod.com');
insert into pasazerowie (imie, nazwisko, email) values ('Garrek', 'Nanni', 'gnannikw@biglobe.ne.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Meredith', 'Fosbraey', 'mfosbraeykx@usnews.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bernadina', 'Clear', 'bclearky@ehow.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bobby', 'Clerk', 'bclerkkz@dropbox.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jewel', 'Wasylkiewicz', 'jwasylkiewiczl0@webmd.com');
insert into pasazerowie (imie, nazwisko, email) values ('Keelby', 'Byres', 'kbyresl1@prnewswire.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lorrie', 'MacCollom', 'lmaccolloml2@joomla.org');
insert into pasazerowie (imie, nazwisko, email) values ('Kliment', 'McDermot', 'kmcdermotl3@rediff.com');
insert into pasazerowie (imie, nazwisko, email) values ('Perkin', 'Buckland', 'pbucklandl4@cyberchimps.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jasper', 'Cantrill', 'jcantrilll5@ebay.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Alphard', 'Ornils', 'aornilsl6@macromedia.com');
insert into pasazerowie (imie, nazwisko, email) values ('Alejoa', 'Towey', 'atoweyl7@tumblr.com');
insert into pasazerowie (imie, nazwisko, email) values ('Guthrie', 'Pretor', 'gpretorl8@amazon.co.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Sula', 'Hansmann', 'shansmannl9@dagondesign.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kala', 'Huggett', 'khuggettla@howstuffworks.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kelli', 'Callinan', 'kcallinanlb@nationalgeographic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Adelina', 'Gourlay', 'agourlaylc@google.ca');
insert into pasazerowie (imie, nazwisko, email) values ('Dinny', 'Chastelain', 'dchastelainld@tripod.com');
insert into pasazerowie (imie, nazwisko, email) values ('Blondy', 'Blune', 'bblunele@ebay.com');
insert into pasazerowie (imie, nazwisko, email) values ('Anthony', 'Wasling', 'awaslinglf@theguardian.com');
insert into pasazerowie (imie, nazwisko, email) values ('Larissa', 'Yesenev', 'lyesenevlg@google.co.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Adi', 'McKennan', 'amckennanlh@canalblog.com');
insert into pasazerowie (imie, nazwisko, email) values ('Katey', 'Coulthurst', 'kcoulthurstli@wufoo.com');
insert into pasazerowie (imie, nazwisko, email) values ('Micky', 'Lindenman', 'mlindenmanlj@wordpress.com');
insert into pasazerowie (imie, nazwisko, email) values ('Danya', 'Capes', 'dcapeslk@imdb.com');
insert into pasazerowie (imie, nazwisko, email) values ('Laurene', 'Brockest', 'lbrockestll@bizjournals.com');
insert into pasazerowie (imie, nazwisko, email) values ('Pam', 'Pygott', 'ppygottlm@ed.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Roch', 'Cogzell', 'rcogzellln@sitemeter.com');
insert into pasazerowie (imie, nazwisko, email) values ('Batsheva', 'Holdren', 'bholdrenlo@economist.com');
insert into pasazerowie (imie, nazwisko, email) values ('Albertine', 'Iddens', 'aiddenslp@tmall.com');
insert into pasazerowie (imie, nazwisko, email) values ('Odessa', 'Berkelay', 'oberkelaylq@phoca.cz');
insert into pasazerowie (imie, nazwisko, email) values ('Marlowe', 'Gredden', 'mgreddenlr@reuters.com');
insert into pasazerowie (imie, nazwisko, email) values ('Fawn', 'Blackford', 'fblackfordls@weebly.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gwenore', 'Osant', 'gosantlt@miitbeian.gov.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Esta', 'Yea', 'eyealu@lycos.com');
insert into pasazerowie (imie, nazwisko, email) values ('Di', 'Brashaw', 'dbrashawlv@arstechnica.com');
insert into pasazerowie (imie, nazwisko, email) values ('Damita', 'Nendick', 'dnendicklw@gnu.org');
insert into pasazerowie (imie, nazwisko, email) values ('Edward', 'Simione', 'esimionelx@usa.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Mollee', 'Ovendon', 'movendonly@seattletimes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sarajane', 'McClifferty', 'smccliffertylz@desdev.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Jae', 'Barton', 'jbartonm0@yellowpages.com');
insert into pasazerowie (imie, nazwisko, email) values ('Judie', 'Eaglen', 'jeaglenm1@yolasite.com');
insert into pasazerowie (imie, nazwisko, email) values ('Miquela', 'Harfleet', 'mharfleetm2@geocities.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Ruperta', 'Simoes', 'rsimoesm3@imgur.com');
insert into pasazerowie (imie, nazwisko, email) values ('Dixie', 'Amsden', 'damsdenm4@privacy.gov.au');
insert into pasazerowie (imie, nazwisko, email) values ('Peggy', 'Suter', 'psuterm5@wikispaces.com');
insert into pasazerowie (imie, nazwisko, email) values ('Dorotea', 'Olenikov', 'dolenikovm6@naver.com');
insert into pasazerowie (imie, nazwisko, email) values ('Grayce', 'Penquet', 'gpenquetm7@weather.com');
insert into pasazerowie (imie, nazwisko, email) values ('Filia', 'Lipgens', 'flipgensm8@hubpages.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ciel', 'Chander', 'cchanderm9@blogs.com');
insert into pasazerowie (imie, nazwisko, email) values ('Maurine', 'Harmar', 'mharmarma@miibeian.gov.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Angie', 'Winspurr', 'awinspurrmb@constantcontact.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sascha', 'Duckett', 'sduckettmc@naver.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cassie', 'Oganesian', 'coganesianmd@eventbrite.com');
insert into pasazerowie (imie, nazwisko, email) values ('Mano', 'Halsey', 'mhalseyme@springer.com');
insert into pasazerowie (imie, nazwisko, email) values ('Thoma', 'Dyers', 'tdyersmf@cmu.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Brook', 'Gowry', 'bgowrymg@usgs.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Therese', 'Folliss', 'tfollissmh@clickbank.net');
insert into pasazerowie (imie, nazwisko, email) values ('Irwin', 'Gerardeaux', 'igerardeauxmi@ted.com');
insert into pasazerowie (imie, nazwisko, email) values ('Banky', 'Juzek', 'bjuzekmj@washingtonpost.com');
insert into pasazerowie (imie, nazwisko, email) values ('Chrissy', 'Portchmouth', 'cportchmouthmk@deliciousdays.com');
insert into pasazerowie (imie, nazwisko, email) values ('Alyss', 'Nodes', 'anodesml@ihg.com');
insert into pasazerowie (imie, nazwisko, email) values ('Park', 'Kynforth', 'pkynforthmm@sfgate.com');
insert into pasazerowie (imie, nazwisko, email) values ('Webb', 'Gulland', 'wgullandmn@scribd.com');
insert into pasazerowie (imie, nazwisko, email) values ('Brigitta', 'Winch', 'bwinchmo@zdnet.com');
insert into pasazerowie (imie, nazwisko, email) values ('Coretta', 'Moth', 'cmothmp@sfgate.com');
insert into pasazerowie (imie, nazwisko, email) values ('Beatrix', 'Gooble', 'bgooblemq@blinklist.com');
insert into pasazerowie (imie, nazwisko, email) values ('Forester', 'Ewers', 'fewersmr@alexa.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sharl', 'Fomichyov', 'sfomichyovms@yahoo.co.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Maximo', 'Kleiser', 'mkleisermt@ifeng.com');
insert into pasazerowie (imie, nazwisko, email) values ('Richmound', 'Mcimmie', 'rmcimmiemu@ezinearticles.com');
insert into pasazerowie (imie, nazwisko, email) values ('Arlan', 'Le Breton', 'alebretonmv@bing.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cleveland', 'Pinner', 'cpinnermw@barnesandnoble.com');
insert into pasazerowie (imie, nazwisko, email) values ('Englebert', 'Hynson', 'ehynsonmx@biglobe.ne.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Alix', 'Thal', 'athalmy@so-net.ne.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Kenna', 'Monery', 'kmonerymz@naver.com');
insert into pasazerowie (imie, nazwisko, email) values ('Karlis', 'Oyley', 'koyleyn0@vk.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lindy', 'Ogborne', 'logbornen1@unesco.org');
insert into pasazerowie (imie, nazwisko, email) values ('Brande', 'Coggin', 'bcogginn2@blogspot.com');
insert into pasazerowie (imie, nazwisko, email) values ('Yehudi', 'Sumpton', 'ysumptonn3@mayoclinic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jae', 'MacElroy', 'jmacelroyn4@mediafire.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gideon', 'Crafter', 'gcraftern5@gov.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Alejandrina', 'Classen', 'aclassenn6@slideshare.net');
insert into pasazerowie (imie, nazwisko, email) values ('Noami', 'Durman', 'ndurmann7@wired.com');
insert into pasazerowie (imie, nazwisko, email) values ('Georg', 'Lowseley', 'glowseleyn8@bbb.org');
insert into pasazerowie (imie, nazwisko, email) values ('Cyndy', 'Robbert', 'crobbertn9@wikipedia.org');
insert into pasazerowie (imie, nazwisko, email) values ('Hanson', 'Durie', 'hduriena@google.pl');
insert into pasazerowie (imie, nazwisko, email) values ('Annie', 'Niemetz', 'aniemetznb@cnet.com');
insert into pasazerowie (imie, nazwisko, email) values ('Linnell', 'Clinning', 'lclinningnc@issuu.com');
insert into pasazerowie (imie, nazwisko, email) values ('Valry', 'Passo', 'vpassond@theguardian.com');
insert into pasazerowie (imie, nazwisko, email) values ('Carri', 'Turnpenny', 'cturnpennyne@admin.ch');
insert into pasazerowie (imie, nazwisko, email) values ('Anastasie', 'Ropkes', 'aropkesnf@symantec.com');
insert into pasazerowie (imie, nazwisko, email) values ('Codie', 'Willson', 'cwillsonng@soundcloud.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kathryne', 'Moughton', 'kmoughtonnh@gnu.org');
insert into pasazerowie (imie, nazwisko, email) values ('Shawn', 'Tiddy', 'stiddyni@mapquest.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rollin', 'Chellam', 'rchellamnj@newsvine.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bjorn', 'Cage', 'bcagenk@forbes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Leanora', 'Sherme', 'lshermenl@lulu.com');
insert into pasazerowie (imie, nazwisko, email) values ('Karlotta', 'Chapelle', 'kchapellenm@soundcloud.com');
insert into pasazerowie (imie, nazwisko, email) values ('Eirena', 'Bankes', 'ebankesnn@imdb.com');
insert into pasazerowie (imie, nazwisko, email) values ('Pooh', 'Cosin', 'pcosinno@1und1.de');
insert into pasazerowie (imie, nazwisko, email) values ('Carson', 'Strodder', 'cstroddernp@networkadvertising.org');
insert into pasazerowie (imie, nazwisko, email) values ('Nelli', 'Renzini', 'nrenzininq@seesaa.net');
insert into pasazerowie (imie, nazwisko, email) values ('Monty', 'Creelman', 'mcreelmannr@unicef.org');
insert into pasazerowie (imie, nazwisko, email) values ('Swen', 'Sclater', 'ssclaterns@homestead.com');
insert into pasazerowie (imie, nazwisko, email) values ('Shina', 'Hearnah', 'shearnahnt@over-blog.com');
insert into pasazerowie (imie, nazwisko, email) values ('Heddi', 'Sanpher', 'hsanphernu@slashdot.org');
insert into pasazerowie (imie, nazwisko, email) values ('Erna', 'Trew', 'etrewnv@ca.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Ariella', 'Argo', 'aargonw@walmart.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nathalia', 'Abrahamoff', 'nabrahamoffnx@washingtonpost.com');
insert into pasazerowie (imie, nazwisko, email) values ('Mayne', 'Skirving', 'mskirvingny@wisc.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Carlo', 'Varian', 'cvariannz@washingtonpost.com');
insert into pasazerowie (imie, nazwisko, email) values ('Benson', 'Truswell', 'btruswello0@yellowbook.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cherri', 'Lengthorn', 'clengthorno1@dailymail.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Marilyn', 'Bedward', 'mbedwardo2@google.co.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Alano', 'Steuart', 'asteuarto3@discovery.com');
insert into pasazerowie (imie, nazwisko, email) values ('Margarethe', 'Havoc', 'mhavoco4@is.gd');
insert into pasazerowie (imie, nazwisko, email) values ('Abran', 'Duffield', 'aduffieldo5@soup.io');
insert into pasazerowie (imie, nazwisko, email) values ('Alexa', 'Orpen', 'aorpeno6@tripadvisor.com');
insert into pasazerowie (imie, nazwisko, email) values ('Fulton', 'Readett', 'freadetto7@odnoklassniki.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Gizela', 'Ayres', 'gayreso8@unesco.org');
insert into pasazerowie (imie, nazwisko, email) values ('Catrina', 'Kneale', 'cknealeo9@rambler.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Hesther', 'Josskowitz', 'hjosskowitzoa@census.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Amandi', 'Diable', 'adiableob@skype.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ivar', 'Bunner', 'ibunneroc@odnoklassniki.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Charlena', 'Gouck', 'cgouckod@unblog.fr');
insert into pasazerowie (imie, nazwisko, email) values ('Sanford', 'Stockau', 'sstockauoe@apache.org');
insert into pasazerowie (imie, nazwisko, email) values ('Standford', 'Nelthrop', 'snelthropof@angelfire.com');
insert into pasazerowie (imie, nazwisko, email) values ('Deny', 'Alvarado', 'dalvaradoog@eventbrite.com');
insert into pasazerowie (imie, nazwisko, email) values ('Dody', 'Norvell', 'dnorvelloh@sitemeter.com');
insert into pasazerowie (imie, nazwisko, email) values ('Deanne', 'Neal', 'dnealoi@t-online.de');
insert into pasazerowie (imie, nazwisko, email) values ('Sandor', 'Bushell', 'sbushelloj@miibeian.gov.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Filia', 'Roots', 'frootsok@technorati.com');
insert into pasazerowie (imie, nazwisko, email) values ('Dun', 'Payle', 'dpayleol@dell.com');
insert into pasazerowie (imie, nazwisko, email) values ('Andra', 'Penke', 'apenkeom@geocities.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Aubine', 'Hackworthy', 'ahackworthyon@google.es');
insert into pasazerowie (imie, nazwisko, email) values ('Jelene', 'Genny', 'jgennyoo@princeton.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Alanah', 'Sidle', 'asidleop@symantec.com');
insert into pasazerowie (imie, nazwisko, email) values ('Liliane', 'MacTrustey', 'lmactrusteyoq@themeforest.net');
insert into pasazerowie (imie, nazwisko, email) values ('Aeriell', 'Chipperfield', 'achipperfieldor@netlog.com');
insert into pasazerowie (imie, nazwisko, email) values ('Anson', 'Itzcak', 'aitzcakos@angelfire.com');
insert into pasazerowie (imie, nazwisko, email) values ('Gerri', 'Kenworthey', 'gkenwortheyot@usda.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Otto', 'Grabban', 'ograbbanou@columbia.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Jone', 'Tivers', 'jtiversov@goo.ne.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Gustaf', 'Houchin', 'ghouchinow@acquirethisname.com');
insert into pasazerowie (imie, nazwisko, email) values ('Alley', 'Roelofs', 'aroelofsox@telegraph.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Goraud', 'Gonnely', 'ggonnelyoy@xrea.com');
insert into pasazerowie (imie, nazwisko, email) values ('Karisa', 'Averill', 'kaverilloz@java.com');
insert into pasazerowie (imie, nazwisko, email) values ('Garrott', 'Sainsbury-Brown', 'gsainsburybrownp0@smugmug.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ginelle', 'Mulvagh', 'gmulvaghp1@freewebs.com');
insert into pasazerowie (imie, nazwisko, email) values ('Christy', 'Muirhead', 'cmuirheadp2@usa.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Teddy', 'Polly', 'tpollyp3@ft.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sibelle', 'Cooper', 'scooperp4@arizona.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Glendon', 'Andrejs', 'gandrejsp5@booking.com');
insert into pasazerowie (imie, nazwisko, email) values ('Emanuel', 'Slucock', 'eslucockp6@drupal.org');
insert into pasazerowie (imie, nazwisko, email) values ('Stephannie', 'Hawse', 'shawsep7@about.com');
insert into pasazerowie (imie, nazwisko, email) values ('Emmeline', 'Badrock', 'ebadrockp8@yelp.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jerrine', 'McPhelimy', 'jmcphelimyp9@phpbb.com');
insert into pasazerowie (imie, nazwisko, email) values ('Cicely', 'Talby', 'ctalbypa@last.fm');
insert into pasazerowie (imie, nazwisko, email) values ('Emmalynne', 'Haggidon', 'ehaggidonpb@alexa.com');
insert into pasazerowie (imie, nazwisko, email) values ('Bartie', 'Wadhams', 'bwadhamspc@chronoengine.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sander', 'Marrows', 'smarrowspd@gov.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Valerie', 'Snead', 'vsneadpe@ted.com');
insert into pasazerowie (imie, nazwisko, email) values ('Meir', 'Yegorovnin', 'myegorovninpf@webmd.com');
insert into pasazerowie (imie, nazwisko, email) values ('Giorgi', 'Bransom', 'gbransompg@51.la');
insert into pasazerowie (imie, nazwisko, email) values ('Betta', 'Coole', 'bcooleph@nih.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Dulcinea', 'Gregan', 'dgreganpi@plala.or.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Porter', 'Torritti', 'ptorrittipj@deviantart.com');
insert into pasazerowie (imie, nazwisko, email) values ('Marguerite', 'Wakeley', 'mwakeleypk@devhub.com');
insert into pasazerowie (imie, nazwisko, email) values ('Coraline', 'Pimbley', 'cpimbleypl@mit.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Neil', 'Gabe', 'ngabepm@ameblo.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Chrissie', 'Crawley', 'ccrawleypn@smugmug.com');
insert into pasazerowie (imie, nazwisko, email) values ('Hillary', 'Sabatier', 'hsabatierpo@usatoday.com');
insert into pasazerowie (imie, nazwisko, email) values ('Giselbert', 'Allison', 'gallisonpp@latimes.com');
insert into pasazerowie (imie, nazwisko, email) values ('Georges', 'Staner', 'gstanerpq@goodreads.com');
insert into pasazerowie (imie, nazwisko, email) values ('Neysa', 'Yvon', 'nyvonpr@google.fr');
insert into pasazerowie (imie, nazwisko, email) values ('Tove', 'Dilkes', 'tdilkesps@vk.com');
insert into pasazerowie (imie, nazwisko, email) values ('Salvador', 'Wooler', 'swoolerpt@buzzfeed.com');
insert into pasazerowie (imie, nazwisko, email) values ('Pip', 'Schaffel', 'pschaffelpu@amazon.co.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Travus', 'Baistow', 'tbaistowpv@java.com');
insert into pasazerowie (imie, nazwisko, email) values ('Micky', 'Casaroli', 'mcasarolipw@squarespace.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sheilah', 'Baldree', 'sbaldreepx@mozilla.org');
insert into pasazerowie (imie, nazwisko, email) values ('Christophe', 'Wegman', 'cwegmanpy@twitpic.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kerstin', 'MacTimpany', 'kmactimpanypz@creativecommons.org');
insert into pasazerowie (imie, nazwisko, email) values ('Ferdinand', 'Pauleit', 'fpauleitq0@joomla.org');
insert into pasazerowie (imie, nazwisko, email) values ('Lonny', 'Baylay', 'lbaylayq1@dedecms.com');
insert into pasazerowie (imie, nazwisko, email) values ('Johna', 'Radband', 'jradbandq2@altervista.org');
insert into pasazerowie (imie, nazwisko, email) values ('Ali', 'Gregolin', 'agregolinq3@marketwatch.com');
insert into pasazerowie (imie, nazwisko, email) values ('Danyelle', 'Goldis', 'dgoldisq4@msu.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Arthur', 'Itzik', 'aitzikq5@prnewswire.com');
insert into pasazerowie (imie, nazwisko, email) values ('Kennett', 'Montes', 'kmontesq6@facebook.com');
insert into pasazerowie (imie, nazwisko, email) values ('Tobye', 'Golsby', 'tgolsbyq7@prlog.org');
insert into pasazerowie (imie, nazwisko, email) values ('Andeee', 'Sabates', 'asabatesq8@google.cn');
insert into pasazerowie (imie, nazwisko, email) values ('Hart', 'Bussen', 'hbussenq9@discuz.net');
insert into pasazerowie (imie, nazwisko, email) values ('Marleah', 'Duff', 'mduffqa@baidu.com');
insert into pasazerowie (imie, nazwisko, email) values ('Alexis', 'Belmont', 'abelmontqb@scientificamerican.com');
insert into pasazerowie (imie, nazwisko, email) values ('Donny', 'Trunby', 'dtrunbyqc@pen.io');
insert into pasazerowie (imie, nazwisko, email) values ('Dorian', 'Garman', 'dgarmanqd@freewebs.com');
insert into pasazerowie (imie, nazwisko, email) values ('Prisca', 'Bauldrey', 'pbauldreyqe@4shared.com');
insert into pasazerowie (imie, nazwisko, email) values ('Amalie', 'Robbert', 'arobbertqf@ihg.com');
insert into pasazerowie (imie, nazwisko, email) values ('Yard', 'Styant', 'ystyantqg@topsy.com');
insert into pasazerowie (imie, nazwisko, email) values ('Mitchell', 'Calleja', 'mcallejaqh@over-blog.com');
insert into pasazerowie (imie, nazwisko, email) values ('Lyssa', 'Airlie', 'lairlieqi@upenn.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Hazel', 'Laphorn', 'hlaphornqj@ameblo.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Lanie', 'Swanborrow', 'lswanborrowqk@howstuffworks.com');
insert into pasazerowie (imie, nazwisko, email) values ('Donnie', 'Puxley', 'dpuxleyql@slashdot.org');
insert into pasazerowie (imie, nazwisko, email) values ('Lara', 'Pennycord', 'lpennycordqm@house.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Chevalier', 'Jirik', 'cjirikqn@weather.com');
insert into pasazerowie (imie, nazwisko, email) values ('Flynn', 'Reddoch', 'freddochqo@netlog.com');
insert into pasazerowie (imie, nazwisko, email) values ('Madelaine', 'Prince', 'mprinceqp@dropbox.com');
insert into pasazerowie (imie, nazwisko, email) values ('Culver', 'Dufaur', 'cdufaurqq@123-reg.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Reamonn', 'Dishman', 'rdishmanqr@un.org');
insert into pasazerowie (imie, nazwisko, email) values ('Tann', 'Rubinlicht', 'trubinlichtqs@godaddy.com');
insert into pasazerowie (imie, nazwisko, email) values ('Nikos', 'Redholls', 'nredhollsqt@slideshare.net');
insert into pasazerowie (imie, nazwisko, email) values ('Desdemona', 'Bage', 'dbagequ@free.fr');
insert into pasazerowie (imie, nazwisko, email) values ('Ricky', 'Naish', 'rnaishqv@mozilla.org');
insert into pasazerowie (imie, nazwisko, email) values ('Wadsworth', 'Dwine', 'wdwineqw@youtube.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rayshell', 'Cripwell', 'rcripwellqx@w3.org');
insert into pasazerowie (imie, nazwisko, email) values ('Gerti', 'Kells', 'gkellsqy@noaa.gov');
insert into pasazerowie (imie, nazwisko, email) values ('Neils', 'Blose', 'nbloseqz@comcast.net');
insert into pasazerowie (imie, nazwisko, email) values ('Winonah', 'Orpin', 'worpinr0@tinyurl.com');
insert into pasazerowie (imie, nazwisko, email) values ('Collie', 'Brezlaw', 'cbrezlawr1@wired.com');
insert into pasazerowie (imie, nazwisko, email) values ('Rheba', 'Jenckes', 'rjenckesr2@facebook.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ilsa', 'Brownbill', 'ibrownbillr3@vistaprint.com');
insert into pasazerowie (imie, nazwisko, email) values ('Christiane', 'Jenken', 'cjenkenr4@webeden.co.uk');
insert into pasazerowie (imie, nazwisko, email) values ('Garvey', 'Breem', 'gbreemr5@wikispaces.com');
insert into pasazerowie (imie, nazwisko, email) values ('Ulrica', 'Witchell', 'uwitchellr6@cloudflare.com');
insert into pasazerowie (imie, nazwisko, email) values ('Jenelle', 'Habbijam', 'jhabbijamr7@home.pl');
insert into pasazerowie (imie, nazwisko, email) values ('Gaylord', 'Jephcott', 'gjephcottr8@jiathis.com');
insert into pasazerowie (imie, nazwisko, email) values ('Walsh', 'Gyurkovics', 'wgyurkovicsr9@facebook.com');
insert into pasazerowie (imie, nazwisko, email) values ('Damara', 'Verdun', 'dverdunra@sun.com');
insert into pasazerowie (imie, nazwisko, email) values ('Marcelline', 'Handyside', 'mhandysiderb@omniture.com');
insert into pasazerowie (imie, nazwisko, email) values ('Reuben', 'Butler', 'rbutlerrc@eventbrite.com');
insert into pasazerowie (imie, nazwisko, email) values ('Terese', 'Regnard', 'tregnardrd@prlog.org');
insert into pasazerowie (imie, nazwisko, email) values ('Erich', 'Alders', 'ealdersre@ucoz.ru');
insert into pasazerowie (imie, nazwisko, email) values ('Dominique', 'Aire', 'dairerf@stanford.edu');
insert into pasazerowie (imie, nazwisko, email) values ('Elga', 'Jeynes', 'ejeynesrg@deviantart.com');
insert into pasazerowie (imie, nazwisko, email) values ('Irma', 'Spendlove', 'ispendloverh@jigsy.com');
insert into pasazerowie (imie, nazwisko, email) values ('Briny', 'Tisor', 'btisorri@wikia.com');
insert into pasazerowie (imie, nazwisko, email) values ('Karia', 'Barbery', 'kbarberyrj@sourceforge.net');
insert into pasazerowie (imie, nazwisko, email) values ('Nadia', 'Abrashkin', 'nabrashkinrk@artisteer.com');
insert into pasazerowie (imie, nazwisko, email) values ('Peterus', 'Linde', 'plinderl@g.co');
insert into pasazerowie (imie, nazwisko, email) values ('Germaine', 'Roder', 'groderrm@studiopress.com');
insert into pasazerowie (imie, nazwisko, email) values ('Sigismundo', 'Mc Caughen', 'smccaughenrn@shop-pro.jp');
insert into pasazerowie (imie, nazwisko, email) values ('Yank', 'Ringsell', 'yringsellro@mapquest.com');
insert into pasazerowie (imie, nazwisko, email) values ('Curtice', 'Andrieu', 'candrieurp@etsy.com');
insert into pasazerowie (imie, nazwisko, email) values ('Pauline', 'Torvey', 'ptorveyrq@salon.com');
insert into pasazerowie (imie, nazwisko, email) values ('Isidore', 'Champneys', 'ichampneysrr@vinaora.com');
insert into pasazerowie (imie, nazwisko, email) values ('Mieczysław', 'Zorro', 'tabaluga@vinaora.com');

INSERT INTO swieta_stale (nazwa, dzien, miesiac) VALUES
('Nowy Rok', 1, 1),
('Święto Trzech Króli', 6, 1),
('Święto Pracy', 1, 5),
('Święto Konstytucji 3 Maja', 3, 5),
('Boże Narodzenie', 25, 12);

INSERT INTO swieta_ruchome (nazwa) VALUES
('Wielkanoc'),
('Poniedziałek Wielkanocny'),
('Zesłanie Ducha Świętego'),
('Boże Ciało'),
('Niedziela Palmowa');

INSERT INTO daty_swiat (id_swieta, data) VALUES
(1, '2024-03-31'),
(2, '2024-04-01'),
(3, '2024-05-19'),
(4, '2024-05-30'),
(5, '2024-03-24'),

(1, '2025-04-20'),
(2, '2025-04-21'),
(3, '2025-06-08'),
(4, '2025-06-19'),
(5, '2025-04-13'),

(1, '2026-04-05'),
(2, '2026-04-06'),
(3, '2026-05-24'),
(4, '2026-06-04'),
(5, '2026-03-29'),

(1, '2027-03-28'),
(2, '2027-03-29'),
(3, '2027-05-16'),
(4, '2027-05-27'),
(5, '2027-03-21'),

(1, '2028-04-16'),
(2, '2028-04-17'),
(3, '2028-06-04'),
(4, '2028-06-15'),
(5, '2028-04-09');