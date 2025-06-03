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
('Grójec', 1),
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
('Gostynin', 1),
('Kozienice', 1),
('Szczytno', 2),
('Mrągowo', 1);

INSERT INTO trasy (skad, dokad, czas) VALUES
(1, 50, '05:00:00'),
(2, 70, '06:30:00'),
(3, 100, '04:20:00'),
(4, 80, '05:10:00'),
(5, 90, '05:45:00');

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(1, 14, '00:40:00', '00:45:00', TRUE, 2),
(1, 47, '01:10:00', '01:15:00', TRUE, 1),
(1, 97, '01:45:00', '01:50:00', TRUE, 1),
(1, 102, '02:15:00', '02:20:00', TRUE, 2),
(1, 103, '02:50:00', '02:55:00', TRUE, 2),
(1, 50, '03:25:00', '03:30:00', TRUE, 3);

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(2, 15, '00:35:00', '00:40:00', TRUE, 2),
(2, 19, '01:10:00', '01:15:00', TRUE, 1),
(2, 27, '01:50:00', '01:55:00', TRUE, 2),
(2, 54, '02:25:00', '02:30:00', TRUE, 2),
(2, 71, '03:00:00', '03:05:00', TRUE, 3);

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(3, 46, '00:30:00', '00:35:00', TRUE, 2),
(3, 59, '01:05:00', '01:10:00', TRUE, 1),
(3, 77, '01:45:00', '01:50:00', TRUE, 1),
(3, 100, '02:20:00', '02:25:00', FALSE, 1);
INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(4, 38, '00:40:00', '00:45:00', TRUE, 1),
(4, 27, '01:15:00', '01:20:00', TRUE, 2),
(4, 80, '01:50:00', '01:55:00', TRUE, 1);
INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(5, 53, '00:30:00', '00:35:00', TRUE, 1),
(5, 90, '01:15:00', '01:20:00', FALSE, 2);

INSERT INTO trasy (skad, dokad, czas) VALUES
(6, 40, '05:30:00'),
(7, 50, '07:10:00'),
(8, 60, '06:00:00'),
(9, 70, '05:40:00'),
(10, 80, '07:20:00'),
(11, 55, '04:50:00'),
(12, 65, '05:10:00'),
(13, 35, '06:25:00'),
(14, 45, '04:15:00'),
(15, 75, '05:45:00');

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(6, 7, '00:25:00', '00:30:00', TRUE, 1),
(6, 11, '00:55:00', '01:00:00', TRUE, 1),
(6, 15, '01:30:00', '01:35:00', TRUE, 2),
(6, 19, '02:05:00', '02:10:00', TRUE, 2),
(6, 23, '02:40:00', '02:45:00', TRUE, 3);

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(7, 8, '00:20:00', '00:25:00', TRUE, 1),
(7, 12, '00:55:00', '01:00:00', TRUE, 1),
(7, 16, '01:30:00', '01:35:00', TRUE, 2),
(7, 20, '02:05:00', '02:10:00', TRUE, 2),
(7, 24, '02:40:00', '02:45:00', TRUE, 3),
(7, 28, '03:15:00', '03:20:00', TRUE, 3),
(7, 32, '03:50:00', '03:55:00', TRUE, 4),
(7, 36, '04:25:00', '04:30:00', TRUE, 4),
(7, 40, '05:00:00', '05:05:00', TRUE, 5);

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(8, 9, '00:30:00', '00:35:00', TRUE, 1),
(8, 14, '01:05:00', '01:10:00', TRUE, 1),
(8, 19, '01:40:00', '01:45:00', TRUE, 2),
(8, 24, '02:15:00', '02:20:00', TRUE, 2),
(8, 29, '02:50:00', '02:55:00', TRUE, 3),
(8, 34, '03:25:00', '03:30:00', TRUE, 3);

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(9, 10, '00:25:00', '00:30:00', TRUE, 1),
(9, 15, '00:55:00', '01:00:00', TRUE, 1),
(9, 20, '01:30:00', '01:35:00', TRUE, 2),
(9, 25, '02:05:00', '02:10:00', TRUE, 2),
(9, 30, '02:40:00', '02:45:00', TRUE, 3),
(9, 35, '03:15:00', '03:20:00', TRUE, 3),
(9, 40, '03:50:00', '03:55:00', TRUE, 4);

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(10, 11, '00:20:00', '00:25:00', TRUE, 1),
(10, 16, '00:50:00', '00:55:00', TRUE, 1),
(10, 21, '01:25:00', '01:30:00', TRUE, 2),
(10, 26, '02:00:00', '02:05:00', TRUE, 2),
(10, 31, '02:35:00', '02:40:00', TRUE, 3);

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(11, 12, '00:30:00', '00:35:00', TRUE, 1),
(11, 17, '01:00:00', '01:05:00', TRUE, 1),
(11, 22, '01:35:00', '01:40:00', TRUE, 2),
(11, 27, '02:10:00', '02:15:00', TRUE, 2),
(11, 32, '02:45:00', '02:50:00', TRUE, 3),
(11, 37, '03:20:00', '03:25:00', TRUE, 3);

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(12, 13, '00:40:00', '00:45:00', TRUE, 1),
(12, 18, '01:10:00', '01:15:00', TRUE, 1),
(12, 23, '01:45:00', '01:50:00', TRUE, 2),
(12, 28, '02:15:00', '02:20:00', TRUE, 2);

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(13, 14, '00:20:00', '00:25:00', TRUE, 1),
(13, 19, '00:55:00', '01:00:00', TRUE, 1),
(13, 24, '01:30:00', '01:35:00', TRUE, 2),
(13, 29, '02:05:00', '02:10:00', TRUE, 2),
(13, 34, '02:40:00', '02:45:00', TRUE, 3),
(13, 39, '03:15:00', '03:20:00', TRUE, 3),
(13, 44, '03:50:00', '03:55:00', TRUE, 4);

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(14, 15, '00:25:00', '00:30:00', TRUE, 1),
(14, 20, '00:55:00', '01:00:00', TRUE, 1),
(14, 25, '01:30:00', '01:35:00', TRUE, 2),
(14, 30, '02:05:00', '02:10:00', TRUE, 2),
(14, 35, '02:40:00', '02:45:00', TRUE, 3);

INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(15, 16, '00:20:00', '00:25:00', TRUE, 1),
(15, 21, '00:50:00', '00:55:00', TRUE, 1),
(15, 26, '01:25:00', '01:30:00', TRUE, 2),
(15, 31, '02:00:00', '02:05:00', TRUE, 2),
(15, 36, '02:35:00', '02:40:00', TRUE, 3),
(15, 41, '03:10:00', '03:15:00', TRUE, 3);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (1,14,40),
                                                    (14,47,45),
                                                    (47,97,30),
                                                    (97,102,35),
                                                    (102,103,20),
                                                    (103,50,50);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (2,15,35),
                                                    (15,19,40),
                                                    (19,27,45),
                                                    (27,54,50),
                                                    (54,71,45);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (3,46,25),
                                                    (46,59,20),
                                                    (59,77,30),
                                                    (77,100,35);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (4,38,45),
                                                    (38,27,40),
                                                    (27,80,35);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (5,53,50),
                                                    (53,90,45);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (6,7,30),
                                                    (7,11,40),
                                                    (11,15,35),
                                                    (19,23,30),
                                                    (23,40,50);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (7,8,20),
                                                    (8,12,25),
                                                    (12,16,30),
                                                    (16,20,40),
                                                    (20,24,35),
                                                    (24,28,25),
                                                    (28,32,30),
                                                    (32,36,40),
                                                    (36,40,45),
                                                    (40,50,50);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (8,9,25),
                                                    (9,14,30),
                                                    (14,19,35),
                                                    (19,24,40),
                                                    (24,29,30),
                                                    (29,34,25),
                                                    (34,60,50);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (9,10,20),
                                                    (10,15,35),
                                                    (15,20,40),
                                                    (20,25,25),
                                                    (25,30,30),
                                                    (30,35,35),
                                                    (35,40,40),
                                                    (40,70,45);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (10,11,25),
                                                    (11,16,30),
                                                    (16,21,35),
                                                    (21,26,30),
                                                    (26,31,40),
                                                    (31,80,45);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (11,12,20),
                                                    (12,17,30),
                                                    (17,22,35),
                                                    (22,27,40),
                                                    (27,32,25),
                                                    (32,37,30),
                                                    (37,55,40);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (12,13,25),
                                                    (13,18,30),
                                                    (18,23,35),
                                                    (23,28,30),
                                                    (28,65,40);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (13,14,20),
                                                    (34,39,25),
                                                    (39,44,20),
                                                    (44,35,40);

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (14,15,30),
                                                    (35,45,35);
INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
                                                    (15,16,25),
                                                    (31,36,25),
                                                    (36,41,30),
                                                    (41,75,45);

INSERT INTO przewoznicy (nazwa_przewoznika) VALUES
('PKP Intercity'),
('Polregio'),
('Koleje Mazowieckie'),
('Koleje Śląskie'),
('Łódzka Kolej Aglomeracyjna');

INSERT INTO historia_cen (id_przewoznika, data_od, data_do, cena_za_km_kl1, cena_za_km_kl2, cena_za_rower) VALUES
(1, '2023-01-01', NULL, 0.50, 0.30, 5.00),
(2, '2023-01-01', '2023-12-31', 0.45, 0.25, 4.50),
(2, '2024-01-01', NULL, 0.48, 0.28, 4.80),
(3, '2022-06-01', NULL, 0.52, 0.32, 5.20),
(4, '2023-03-01', '2023-11-30', 0.47, 0.27, 4.70),
(4, '2023-12-01', NULL, 0.49, 0.29, 4.90),
(5, '2023-01-15', NULL, 0.46, 0.26, 4.60);

INSERT INTO harmonogramy (
    czy_poniedzialek, czy_wtorek, czy_sroda, czy_czwartek, czy_piatek, czy_sobota, czy_niedziela
) VALUES
      (true, true, true, true, true, false, false),
      (false, false, false, false, false, true, true),
      (true, false, true, false, true, false, false),
      (false, true, false, true, false, true, false),
      (true, true, true, true, true, true, true),
      (true, false, false, false, true, false, false),
      (false, false, true, true, false, true, false),
      (true, true, false, false, true, false, true),
      (false, true, true, true, false, false, false),
      (true, false, true, false, true, true, false),
      (false, true, false, true, true, false, true);

INSERT INTO polaczenia (id_trasy, godzina_startu, id_harmonogramu, id_przewoznika) VALUES
(1, '06:00:00', 1, 1),
(1, '08:30:00', 3, 2),
(1, '11:00:00', 5, 3),
(2, '07:15:00', 2, 2),
(2, '10:00:00', 4, 1),
(2, '13:30:00', 6, 4),
(3, '06:45:00', 1, 3),
(3, '09:20:00', 3, 5),
(3, '12:00:00', 5, 1),
(4, '07:30:00', 2, 4),
(4, '10:15:00', 4, 2),
(4, '13:45:00', 6, 3),
(5, '06:10:00', 1, 5),
(5, '08:50:00', 3, 1),
(5, '11:30:00', 5, 2),
(6, '07:00:00', 2, 4),
(6, '09:40:00', 4, 3),
(6, '12:10:00', 6, 5),
(7, '06:20:00', 1, 2),
(7, '08:55:00', 3, 1),
(7, '11:40:00', 5, 4),
(8, '07:25:00', 2, 3),
(8, '10:05:00', 4, 2),
(8, '12:50:00', 6, 5),
(9, '06:35:00', 1, 1),
(9, '09:10:00', 3, 5),
(9, '11:55:00', 5, 2),
(10, '07:05:00', 2, 4),
(10, '09:45:00', 4, 3),
(10, '12:30:00', 6, 1),
(11, '06:15:00', 1, 3),
(11, '09:00:00', 3, 2),
(11, '11:40:00', 5, 4),
(12, '07:20:00', 2, 1),
(12, '10:00:00', 4, 5),
(12, '12:45:00', 6, 3),
(13, '06:50:00', 1, 2),
(13, '09:30:00', 3, 4),
(13, '12:10:00', 5, 1),
(14, '07:35:00', 2, 5),
(14, '10:15:00', 4, 3),
(14, '13:00:00', 6, 2),
(15, '06:25:00', 1, 4),
(15, '09:00:00', 3, 1),
(15, '11:45:00', 5, 5);

INSERT INTO polaczenia (id_trasy, godzina_startu, id_harmonogramu, id_przewoznika) VALUES
(1, '15:00:00', 1, 1),
(1, '17:30:00', 3, 2),
(1, '20:00:00', 5, 3),
(2, '16:15:00', 2, 2),
(2, '18:45:00', 4, 1),
(2, '21:30:00', 6, 4),
(3, '15:45:00', 1, 3),
(3, '18:20:00', 3, 5),
(3, '20:50:00', 5, 1),
(4, '16:30:00', 2, 4),
(4, '19:15:00', 4, 2),
(4, '21:45:00', 6, 3),
(5, '15:10:00', 1, 5),
(5, '17:50:00', 3, 1),
(5, '20:30:00', 5, 2),
(6, '16:00:00', 2, 4),
(6, '18:40:00', 4, 3),
(6, '21:10:00', 6, 5),
(7, '15:20:00', 1, 2),
(7, '17:55:00', 3, 1),
(7, '20:40:00', 5, 4),
(8, '16:25:00', 2, 3),
(8, '19:05:00', 4, 2),
(8, '21:50:00', 6, 5),
(9, '15:35:00', 1, 1),
(9, '18:10:00', 3, 5),
(9, '20:55:00', 5, 2),
(10, '16:05:00', 2, 4),
(10, '18:45:00', 4, 3),
(10, '21:30:00', 6, 1),
(11, '15:15:00', 1, 3),
(11, '18:00:00', 3, 2),
(11, '20:40:00', 5, 4),
(12, '16:20:00', 2, 1),
(12, '19:00:00', 4, 5),
(12, '21:45:00', 6, 3),
(13, '15:50:00', 1, 2),
(13, '18:30:00', 3, 4),
(13, '21:10:00', 5, 1),
(14, '16:35:00', 2, 5),
(14, '19:15:00', 4, 3),
(14, '22:00:00', 6, 2),
(15, '15:25:00', 1, 4),
(15, '18:00:00', 3, 1),
(15, '20:45:00', 5, 5);

INSERT INTO historia_polaczenia (id_polaczenia, data_od, data_do) VALUES
(1, '2023-01-01', '2023-06-30'),
(2, '2023-01-01', NULL),
(3, '2023-03-15', '2023-12-31'),
(4, '2023-02-01', NULL),
(5, '2023-01-10', '2023-09-30'),
(6, '2023-01-01', NULL),
(7, '2023-04-01', '2023-10-31'),
(8, '2023-01-20', NULL),
(9, '2023-02-15', '2023-08-31'),
(10, '2023-03-01', NULL),
(11, '2023-01-01', '2023-07-31'),
(12, '2023-05-01', NULL),
(13, '2023-02-10', '2023-11-30'),
(14, '2023-01-15', NULL),
(15, '2023-04-01', '2023-12-31'),
(16, '2023-01-01', NULL),
(17, '2023-02-01', '2023-06-30'),
(18, '2023-03-01', NULL),
(19, '2023-01-01', '2023-05-31'),
(20, '2023-01-15', NULL),
(21, '2023-02-20', '2023-09-30'),
(22, '2023-01-01', NULL),
(23, '2023-04-01', '2023-08-31'),
(24, '2023-03-01', NULL),
(25, '2023-01-01', '2023-07-31'),
(26, '2023-02-15', NULL),
(27, '2023-01-01', '2023-06-30'),
(28, '2023-05-01', NULL),
(29, '2023-02-01', '2023-11-30'),
(30, '2023-01-01', NULL);

INSERT INTO wagony (klimatyzacja, restauracyjny) VALUES
(true, false),
(true, true),
(false, false),
(false, true),
(true, false),
(false, false),
(true, true),
(false, false),
(true, false),
(false, true);


INSERT INTO polaczenia_wagony(id_polaczenia,nr_wagonu,id_wagonu) VALUES
(1,1,1),(1,2,2),(1,3,3),
(2,1,2),(2,2,4),(2,3,5),
(3,1,1),(3,2,3),(3,3,6),
(4,1,2),(4,2,5),(4,3,4),
(5,1,3),(5,2,6),(5,3,1),
(6,1,4),(6,2,5),(6,3,2),
(7,1,3),(7,2,1),(7,3,6),
(8,1,2),(8,2,4),(8,3,5),
(9,1,3),(9,2,1),(9,3,6),
(10,1,2),(10,2,4),(10,3,5),
(11,1,3),(11,2,6),(11,3,1),
(12,1,4),(12,2,5),(12,3,2),
(13,1,3),(13,2,1),(13,3,6),
(14,1,2),(14,2,4),(14,3,5),
(15,1,3),(15,2,1),(15,3,6);

INSERT INTO przedzialy(nr_przedzialu,id_wagonu,klasa,czy_zamkniety,strefa_ciszy) VALUES
(1,1,1,true,false),(2,1,1,true,true),
(3,1,2,false,false),(4,1,2,false,true),
(5,1,1,true,false),(6,1,2,false,false),(7,1,2,false,true),
(8,1,1,true,true),(9,1,2,false,false),(10,1,2,false,false),
(1,2,2,false,false),(2,2,1,true,true),(3,2,1,true,false),
(4,2,2,false,false),(5,2,2,false,true),(6,2,1,true,false),
(1,3,1,true,false),(2,3,2,false,false),(3,3,2,false,true),
(4,3,1,true,true),(5,3,1,true,false),(1,4,2,false,false),
(2,4,2,false,true),(3,4,1,true,false),(4,4,1,true,true),
(5,4,2,false,false);

INSERT INTO miejsca (nr_miejsca,id_wagonu,nr_przedzialu,czy_dla_niepelnosprawnych,czy_dla_rowerow) VALUES
(1,1,1,false,false),(2,1,1,false,false),(3,1,1,false,false),(4,1,1,false,true),
(5,1,1,true,false),(6,1,2,false,false),(7,1,2,false,false),
(8,1,2,false,false),(9,1,2,false,false),(10,1,2,false,true),
(11,1,3,false,false),(12,1,3,true,false),(13,1,3,false,false),
(14,1,3,false,false),(15,1,3,false,false),(16,1,4,false,false),
(17,1,4,false,false),(18,1,4,false,true),(19,1,4,false,false),
(20,1,4,true,false),(21,1,5,false,false),(22,1,5,false,false),
(23,1,5,false,false),(24,1,5,false,true),(25,1,5,false,false),(26,1,6,false,false),
(27,1,6,false,false),(28,1,6,true,false),(29,1,6,false,false),
(30,1,6,false,false),(31,1,7,false,false),(32,1,7,false,false),
(33,1,7,false,false),(34,1,7,false,true),(35,1,7,true,false),(36,1,8,false,false),(37,1,8,false,false),
(38,1,8,false,false),(39,1,8,false,false),(40,1,8,false,true),(41,1,9,false,false),
(42,1,9,true,false),(43,1,9,false,false),(44,1,9,false,false),
(45,1,9,false,false),(46,1,10,false,false),(47,1,10,false,false),
(48,1,10,false,true),(49,1,10,false,false),(50,1,10,true,false),
(1,2,1,false,false),(2,2,1,false,true),(3,2,1,false,false),
(4,2,1,true,false),(5,2,1,false,false),(6,2,1,false,false),
(7,2,1,false,false),(8,2,1,false,true),(9,2,2,false,false),
(10,2,2,false,false),(11,2,2,false,true),(12,2,2,false,false),
(13,2,2,true,false),(14,2,2,false,false),(15,2,2,false,false),(16,2,2,false,false),(17,2,3,false,false),
(18,2,3,false,false),(19,2,3,false,false),(20,2,3,false,false),
(21,2,3,true,false),(22,2,3,false,false),(23,2,3,false,true),
(24,2,3,false,false),(25,2,4,false,false),(26,2,4,false,false),
(27,2,4,false,true),(28,2,4,false,false),(29,2,4,false,false),
(30,2,4,false,false),
(31,2,4,true,false),(32,2,4,false,false),(33,2,5,false,false),
(34,2,5,false,false),(35,2,5,false,false),(36,2,5,false,false),
(37,2,5,false,true),(38,2,5,false,false),(39,2,5,false,false),(40,2,5,false,false),(41,2,6,false,false),
(42,2,6,false,false),(43,2,6,false,false),(44,2,6,false,false),
(45,2,6,false,false),(46,2,6,true,false),(47,2,6,false,false),
(48,2,6,false,true);

INSERT INTO miejsca(nr_miejsca,id_wagonu,nr_przedzialu,czy_dla_niepelnosprawnych,czy_dla_rowerow)VALUES(1,3,1,false,false),(2,3,1,false,false),(3,3,1,true,false),(4,3,1,false,false),
(5,3,1,false,false),(6,3,1,false,true),(7,3,1,false,false),
(8,3,1,false,false),(9,3,1,false,false),(10,3,1,false,false),
(11,3,2,false,false),(12,3,2,false,false),(13,3,2,false,true),(14,3,2,false,false),(15,3,2,false,false),
(16,3,2,false,false),(17,3,2,true,false),(18,3,2,false,false),
(19,3,2,false,false),(20,3,2,false,false),(21,3,3,false,false),(22,3,3,false,false),(23,3,3,false,false),
(24,3,3,false,true),(25,3,3,false,false),(26,3,3,false,false),(27,3,3,false,false),(28,3,3,false,false),
(29,3,3,false,false),(30,3,3,false,false),
(31,3,4,true,false),(32,3,4,false,false),(33,3,4,false,false),(34,3,4,false,false),(35,3,4,false,false),
(36,3,4,false,true),(37,3,4,false,false),(38,3,4,false,false),(39,3,4,false,false),(40,3,4,false,false),
(41,3,5,false,false),(42,3,5,false,false),(43,3,5,false,false),
(44,3,5,true,false),(45,3,5,false,false),(46,3,5,false,false),(47,3,5,false,false),(48,3,5,false,false),
(49,3,5,false,true),(50,3,5,false,false);
INSERT INTO miejsca(nr_miejsca,id_wagonu,nr_przedzialu,czy_dla_niepelnosprawnych,czy_dla_rowerow)VALUES(1,4,1,false,false),(2,4,1,false,false),
(3,4,1,false,true),(4,4,1,false,false),(5,4,1,true,false),(6,4,1,false,false),
(7,4,1,false,false),(8,4,1,false,false),(9,4,1,false,false),(10,4,1,false,false),(11,4,2,false,false),
(12,4,2,false,false),(13,4,2,false,false),(14,4,2,false,false),
(15,4,2,false,true),(16,4,2,false,false),(17,4,2,false,false),(18,4,2,true,false),(19,4,2,false,false),
(20,4,2,false,false),(21,4,3,false,false),(22,4,3,false,false),
(23,4,3,false,false),(24,4,3,false,false),(25,4,3,false,false),(26,4,3,false,true),(27,4,3,false,false),
(28,4,3,false,false),(29,4,3,false,false),(30,4,3,false,false),(31,4,4,false,false),(32,4,4,false,false),
(33,4,4,false,true),(34,4,4,false,false),(35,4,4,false,false),(36,4,4,false,false),(37,4,4,false,false),
(38,4,4,true,false),(39,4,4,false,false),(40,4,4,false,false),
(41,4,5,false,false),(42,4,5,false,false),(43,4,5,false,false),
(44,4,5,false,false),(45,4,5,false,false),(46,4,5,false,true),(47,4,5,false,false),(48,4,5,false,false),
(49,4,5,false,false),(50,4,5,false,false);

INSERT INTO ulgi (nazwa, znizka) VALUES
('Normalny', 0),
('Studencki', 51),
('Senior', 37),
('Dziecięcy', 50),
('Niepełnosprawny', 49);


insert into pasazerowie (imie, nazwisko, mail) values ('Gregg', 'Parkeson', 'gparkeson0@digg.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Alvera', 'Keymer', 'akeymer1@mac.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lyndsay', 'Pether', 'lpether2@state.tx.us');
insert into pasazerowie (imie, nazwisko, mail) values ('Kassie', 'Osipov', 'kosipov3@comsenz.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Josi', 'Haughey', 'jhaughey4@woothemes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Colas', 'Lindenberg', 'clindenberg5@hatena.ne.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Fay', 'Hryskiewicz', 'fhryskiewicz6@homestead.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Filip', 'Knightly', 'fknightly7@bigcartel.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Forbes', 'McElmurray', 'fmcelmurray8@bravesites.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Algernon', 'Vautier', 'avautier9@ibm.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Leslie', 'Spadaro', 'lspadaroa@cyberchimps.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bernetta', 'Anderl', 'banderlb@slideshare.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Alene', 'Fowle', 'afowlec@answers.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Carlynn', 'Cromar', 'ccromard@qq.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rosalie', 'Hoodspeth', 'rhoodspethe@ucsd.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Melinda', 'Radnedge', 'mradnedgef@unicef.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Krysta', 'Paulisch', 'kpaulischg@nasa.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Ethelyn', 'Burress', 'eburressh@csmonitor.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Leonard', 'Winwood', 'lwinwoodi@ucla.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Layne', 'Bourgourd', 'lbourgourdj@microsoft.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Arther', 'Burkhill', 'aburkhillk@independent.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Bordie', 'Witheridge', 'bwitheridgel@surveymonkey.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Clareta', 'Cockshutt', 'ccockshuttm@harvard.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Joe', 'Menat', 'jmenatn@purevolume.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Olimpia', 'Vigus', 'oviguso@ucla.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Stephanie', 'Grugerr', 'sgrugerrp@youtube.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Otha', 'De Angelo', 'odeangeloq@spotify.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bobby', 'Paradise', 'bparadiser@huffingtonpost.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Roxana', 'Jarrard', 'rjarrards@meetup.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Dominic', 'Bathurst', 'dbathurstt@slashdot.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Allina', 'Garaway', 'agarawayu@blog.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Aland', 'Tawn', 'atawnv@salon.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nicolina', 'Sedgman', 'nsedgmanw@ebay.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Bekki', 'Camilletti', 'bcamillettix@parallels.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Anissa', 'Garard', 'agarardy@twitpic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cad', 'Darcy', 'cdarcyz@topsy.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Amie', 'Reitenbach', 'areitenbach10@alexa.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Alysa', 'Derx', 'aderx11@hud.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Marita', 'Sendall', 'msendall12@indiegogo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ursula', 'Prin', 'uprin13@last.fm');
insert into pasazerowie (imie, nazwisko, mail) values ('Clem', 'Perez', 'cperez14@wordpress.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Darby', 'Jira', 'djira15@house.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Briney', 'Fullilove', 'bfullilove16@ovh.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Dino', 'Knight', 'dknight17@weibo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cointon', 'Crottagh', 'ccrottagh18@mozilla.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Irma', 'Poff', 'ipoff19@smh.com.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Charil', 'Andreacci', 'candreacci1a@facebook.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Emmalynn', 'Ruprechter', 'eruprechter1b@irs.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Vachel', 'Habard', 'vhabard1c@privacy.gov.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Edwina', 'Mochan', 'emochan1d@example.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Chance', 'Scotchmoor', 'cscotchmoor1e@google.es');
insert into pasazerowie (imie, nazwisko, mail) values ('Erma', 'Alfonsini', 'ealfonsini1f@bluehost.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Curcio', 'Trundler', 'ctrundler1g@vk.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Adrienne', 'Klimowski', 'aklimowski1h@lycos.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Evan', 'De Banke', 'edebanke1i@seattletimes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Marv', 'Duiguid', 'mduiguid1j@businessweek.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jarrod', 'Gallant', 'jgallant1k@zimbio.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lynett', 'Simonot', 'lsimonot1l@ebay.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rickert', 'Skewis', 'rskewis1m@goo.gl');
insert into pasazerowie (imie, nazwisko, mail) values ('Randolf', 'Ervin', 'rervin1n@dell.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Carma', 'Banks', 'cbanks1o@nymag.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Farrell', 'Hallbord', 'fhallbord1p@house.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Hilde', 'Hallums', 'hhallums1q@last.fm');
insert into pasazerowie (imie, nazwisko, mail) values ('Teddie', 'Martijn', 'tmartijn1r@sourceforge.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Skyler', 'Larroway', 'slarroway1s@e-recht24.de');
insert into pasazerowie (imie, nazwisko, mail) values ('Griffith', 'Deller', 'gdeller1t@artisteer.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Aimil', 'Oldroyde', 'aoldroyde1u@odnoklassniki.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Basilius', 'Crowd', 'bcrowd1v@virginia.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Madge', 'Rushsorth', 'mrushsorth1w@flickr.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Maje', 'Reinmar', 'mreinmar1x@sciencedirect.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Tobin', 'Grebbin', 'tgrebbin1y@google.com.hk');
insert into pasazerowie (imie, nazwisko, mail) values ('Emelita', 'Pomfrey', 'epomfrey1z@theatlantic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Marshal', 'Hewell', 'mhewell20@ustream.tv');
insert into pasazerowie (imie, nazwisko, mail) values ('Hermina', 'Sames', 'hsames21@reuters.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Frankie', 'Rapier', 'frapier22@xinhuanet.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nicolais', 'Iacopo', 'niacopo23@gravatar.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Todd', 'Chuck', 'tchuck24@opensource.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Archibold', 'Rounsivall', 'arounsivall25@miitbeian.gov.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Jacquenetta', 'Jenteau', 'jjenteau26@toplist.cz');
insert into pasazerowie (imie, nazwisko, mail) values ('Gates', 'Chawkley', 'gchawkley27@dedecms.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Artair', 'Dewdney', 'adewdney28@nyu.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Marcellina', 'Jedryka', 'mjedryka29@marketwatch.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Koo', 'Steaning', 'ksteaning2a@cbslocal.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Janaya', 'Squibbs', 'jsquibbs2b@unicef.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Rona', 'Matuszyk', 'rmatuszyk2c@usda.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Drusie', 'Canaan', 'dcanaan2d@ucoz.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Maurizia', 'Danzelman', 'mdanzelman2e@baidu.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Angelica', 'Cater', 'acater2f@wp.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nerti', 'Walsham', 'nwalsham2g@berkeley.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Hayley', 'Landon', 'hlandon2h@stumbleupon.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kay', 'Benninger', 'kbenninger2i@tripadvisor.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cati', 'Wickins', 'cwickins2j@nbcnews.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Marleah', 'Dutt', 'mdutt2k@hc360.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Theressa', 'Camilleri', 'tcamilleri2l@moonfruit.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nanci', 'Jubb', 'njubb2m@ustream.tv');
insert into pasazerowie (imie, nazwisko, mail) values ('Auberta', 'Hanbridge', 'ahanbridge2n@wsj.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lukas', 'Pledge', 'lpledge2o@bluehost.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bethena', 'Binnell', 'bbinnell2p@newsvine.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ernesta', 'Wheldon', 'ewheldon2q@eventbrite.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Fleming', 'Yanne', 'fyanne2r@ning.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jamie', 'Stuckford', 'jstuckford2s@omniture.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ted', 'O''Nowlan', 'tonowlan2t@wix.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Dickie', 'Gostall', 'dgostall2u@columbia.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Ivar', 'Fieller', 'ifieller2v@nymag.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Graig', 'Kemmey', 'gkemmey2w@clickbank.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Miguelita', 'Bwye', 'mbwye2x@purevolume.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Millisent', 'Boshere', 'mboshere2y@foxnews.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Adolpho', 'Uff', 'auff2z@github.io');
insert into pasazerowie (imie, nazwisko, mail) values ('Glennie', 'Bradforth', 'gbradforth30@arizona.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Neill', 'Sember', 'nsember31@umn.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Benedetta', 'Dumphries', 'bdumphries32@wikispaces.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Delcine', 'Lampbrecht', 'dlampbrecht33@myspace.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gladys', 'Dayce', 'gdayce34@msn.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Appolonia', 'Blei', 'ablei35@sakura.ne.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Koralle', 'Tilt', 'ktilt36@delicious.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Pegeen', 'Mc Caghan', 'pmccaghan37@goo.gl');
insert into pasazerowie (imie, nazwisko, mail) values ('Waverley', 'Easterling', 'weasterling38@issuu.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rafaela', 'Sailes', 'rsailes39@bizjournals.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Barnaby', 'Bouchier', 'bbouchier3a@army.mil');
insert into pasazerowie (imie, nazwisko, mail) values ('Bendick', 'Cargill', 'bcargill3b@g.co');
insert into pasazerowie (imie, nazwisko, mail) values ('Meagan', 'Carpenter', 'mcarpenter3c@fda.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Manon', 'Fardon', 'mfardon3d@privacy.gov.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Guillemette', 'Kauble', 'gkauble3e@moonfruit.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lee', 'Alessandone', 'lalessandone3f@dion.ne.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Vin', 'Calender', 'vcalender3g@furl.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Ker', 'Faustian', 'kfaustian3h@51.la');
insert into pasazerowie (imie, nazwisko, mail) values ('Marj', 'Tammadge', 'mtammadge3i@qq.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rubetta', 'Pillman', 'rpillman3j@state.tx.us');
insert into pasazerowie (imie, nazwisko, mail) values ('Ulrike', 'Leeder', 'uleeder3k@ucla.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Carroll', 'Muttitt', 'cmuttitt3l@webeden.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Sandy', 'Almak', 'salmak3m@livejournal.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jeannine', 'Temperley', 'jtemperley3n@home.pl');
insert into pasazerowie (imie, nazwisko, mail) values ('Aeriel', 'Lukash', 'alukash3o@freewebs.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Panchito', 'Swendell', 'pswendell3p@scribd.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Pippy', 'Kaine', 'pkaine3q@moonfruit.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Malinda', 'Bonanno', 'mbonanno3r@php.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Halette', 'Kiddle', 'hkiddle3s@simplemachines.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Vere', 'Wilfling', 'vwilfling3t@cam.ac.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Dorelia', 'Lorden', 'dlorden3u@e-recht24.de');
insert into pasazerowie (imie, nazwisko, mail) values ('Harlene', 'Trump', 'htrump3v@booking.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Tammara', 'Keedy', 'tkeedy3w@samsung.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Melloney', 'Eckersall', 'meckersall3x@ed.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Rich', 'Fearnsides', 'rfearnsides3y@creativecommons.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Arlie', 'Greetland', 'agreetland3z@dedecms.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Britte', 'Sedgeworth', 'bsedgeworth40@theatlantic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Zorah', 'Wickey', 'zwickey41@noaa.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Clay', 'Gatman', 'cgatman42@skype.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Maurise', 'Hunstone', 'mhunstone43@zdnet.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Udall', 'Mabbett', 'umabbett44@hp.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Frederic', 'Flanne', 'fflanne45@google.de');
insert into pasazerowie (imie, nazwisko, mail) values ('Fairleigh', 'Duffet', 'fduffet46@dell.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rozelle', 'Lope', 'rlope47@goodreads.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Carl', 'Chafer', 'cchafer48@nymag.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Syd', 'Ingleton', 'singleton49@deviantart.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Art', 'Eborall', 'aeborall4a@hubpages.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Catina', 'Pickrell', 'cpickrell4b@biblegateway.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Dene', 'Dwire', 'ddwire4c@github.io');
insert into pasazerowie (imie, nazwisko, mail) values ('Powell', 'Spoole', 'pspoole4d@usatoday.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Eyde', 'Cowdrey', 'ecowdrey4e@alibaba.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Magdalena', 'De Lacey', 'mdelacey4f@harvard.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Ingar', 'Ellwand', 'iellwand4g@boston.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lion', 'Oakhill', 'loakhill4h@nature.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Brittan', 'Calderon', 'bcalderon4i@telegraph.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Lia', 'Bowley', 'lbowley4j@nifty.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ara', 'Neate', 'aneate4k@bloglovin.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Barbe', 'Musson', 'bmusson4l@woothemes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Benedicto', 'Ulster', 'bulster4m@abc.net.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Dasi', 'Giriardelli', 'dgiriardelli4n@chicagotribune.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kilian', 'Butland', 'kbutland4o@technorati.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rubina', 'Lovie', 'rlovie4p@ucoz.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Honor', 'Biagioni', 'hbiagioni4q@jimdo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Wendeline', 'Berford', 'wberford4r@prnewswire.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Hoebart', 'Cadell', 'hcadell4s@mapy.cz');
insert into pasazerowie (imie, nazwisko, mail) values ('Tulley', 'Dammarell', 'tdammarell4t@marriott.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Mae', 'Mazella', 'mmazella4u@lycos.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cristi', 'Twigg', 'ctwigg4v@baidu.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bertha', 'Plevey', 'bplevey4w@jalbum.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Norry', 'Rosellini', 'nrosellini4x@hexun.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Reeta', 'Eaglen', 'reaglen4y@jugem.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Mame', 'Beverstock', 'mbeverstock4z@unblog.fr');
insert into pasazerowie (imie, nazwisko, mail) values ('Cornall', 'Ladd', 'cladd50@amazon.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Clayborne', 'Lickorish', 'clickorish51@un.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Cristian', 'Sapwell', 'csapwell52@netlog.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Marta', 'Whittet', 'mwhittet53@devhub.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Haleigh', 'Colledge', 'hcolledge54@imgur.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Giffard', 'McGilvary', 'gmcgilvary55@virginia.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Micheline', 'Blazynski', 'mblazynski56@forbes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lexie', 'Cattonnet', 'lcattonnet57@gov.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Garry', 'Housiaux', 'ghousiaux58@bloglines.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Morgan', 'Roderick', 'mroderick59@pen.io');
insert into pasazerowie (imie, nazwisko, mail) values ('Wilfred', 'Niven', 'wniven5a@unesco.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Sloan', 'Hector', 'shector5b@desdev.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Renaldo', 'Cribbin', 'rcribbin5c@jimdo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Stace', 'Lere', 'slere5d@imageshack.us');
insert into pasazerowie (imie, nazwisko, mail) values ('Aurore', 'Woollends', 'awoollends5e@about.me');
insert into pasazerowie (imie, nazwisko, mail) values ('Joelle', 'Hendrik', 'jhendrik5f@drupal.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Kimmy', 'Bhar', 'kbhar5g@twitpic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Peterus', 'Assinder', 'passinder5h@icq.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jami', 'Sackur', 'jsackur5i@tinypic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bili', 'Skirven', 'bskirven5j@wufoo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('De', 'Inglesent', 'dinglesent5k@qq.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Tyrone', 'Fain', 'tfain5l@homestead.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Theobald', 'Hirsthouse', 'thirsthouse5m@businesswire.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nollie', 'Worthy', 'nworthy5n@jimdo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kendal', 'Ilyuchyov', 'kilyuchyov5o@google.it');
insert into pasazerowie (imie, nazwisko, mail) values ('Candi', 'Stacy', 'cstacy5p@sciencedaily.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nevins', 'Melior', 'nmelior5q@ibm.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Burl', 'Brimilcombe', 'bbrimilcombe5r@opensource.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Orson', 'Baterip', 'obaterip5s@unblog.fr');
insert into pasazerowie (imie, nazwisko, mail) values ('Eamon', 'Dummett', 'edummett5t@e-recht24.de');
insert into pasazerowie (imie, nazwisko, mail) values ('Charis', 'Lippo', 'clippo5u@sogou.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Aviva', 'Barlace', 'abarlace5v@360.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Eldon', 'Casarini', 'ecasarini5w@people.com.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Lancelot', 'Handscombe', 'lhandscombe5x@t-online.de');
insert into pasazerowie (imie, nazwisko, mail) values ('Susanetta', 'Shorie', 'sshorie5y@mac.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Pauly', 'Timlin', 'ptimlin5z@vistaprint.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Hardy', 'Lambarth', 'hlambarth60@umn.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Kristoforo', 'Vassie', 'kvassie61@zdnet.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Hartwell', 'Midden', 'hmidden62@woothemes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ki', 'Rosenfeld', 'krosenfeld63@ask.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Johnna', 'Baudon', 'jbaudon64@imageshack.us');
insert into pasazerowie (imie, nazwisko, mail) values ('Victor', 'Stickford', 'vstickford65@auda.org.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Hart', 'Rubinlicht', 'hrubinlicht66@etsy.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Latashia', 'Childes', 'lchildes67@home.pl');
insert into pasazerowie (imie, nazwisko, mail) values ('Susanetta', 'Cheake', 'scheake68@blogspot.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Brianna', 'Warsop', 'bwarsop69@wix.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Janel', 'Pole', 'jpole6a@youku.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Giffer', 'Virr', 'gvirr6b@theglobeandmail.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Muffin', 'Buffery', 'mbuffery6c@ameblo.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Othello', 'Mabbitt', 'omabbitt6d@amazon.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Obie', 'Ellcome', 'oellcome6e@digg.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jarred', 'Hovell', 'jhovell6f@hp.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kamila', 'Clewett', 'kclewett6g@symantec.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Duffie', 'Ramberg', 'dramberg6h@shop-pro.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Maddi', 'Madgin', 'mmadgin6i@techcrunch.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Astra', 'Jodrellec', 'ajodrellec6j@printfriendly.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Vassili', 'Chifney', 'vchifney6k@networksolutions.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Caryl', 'Milner', 'cmilner6l@free.fr');
insert into pasazerowie (imie, nazwisko, mail) values ('Trescha', 'Greenshields', 'tgreenshields6m@ameblo.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Ardelle', 'Nolot', 'anolot6n@wikia.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Doy', 'Huskisson', 'dhuskisson6o@cbsnews.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Adria', 'Conibere', 'aconibere6p@sourceforge.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Essa', 'Agirre', 'eagirre6q@clickbank.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Fremont', 'Nesbitt', 'fnesbitt6r@craigslist.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Valentina', 'Bottjer', 'vbottjer6s@people.com.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Pauletta', 'Lebond', 'plebond6t@wisc.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Elysha', 'Swyndley', 'eswyndley6u@ebay.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Gram', 'Jordine', 'gjordine6v@squarespace.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rock', 'Sturge', 'rsturge6w@spiegel.de');
insert into pasazerowie (imie, nazwisko, mail) values ('Bartolemo', 'Lawly', 'blawly6x@t.co');
insert into pasazerowie (imie, nazwisko, mail) values ('Minda', 'Incogna', 'mincogna6y@themeforest.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Keene', 'Hoofe', 'khoofe6z@oracle.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Astrix', 'Woodward', 'awoodward70@twitter.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lillis', 'Cranmere', 'lcranmere71@unicef.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Barbey', 'Fibbens', 'bfibbens72@fema.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Dorie', 'Coyett', 'dcoyett73@europa.eu');
insert into pasazerowie (imie, nazwisko, mail) values ('Ina', 'Capel', 'icapel74@desdev.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Bobbe', 'Mucklestone', 'bmucklestone75@fema.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Michel', 'Dearnaly', 'mdearnaly76@wired.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bartholomew', 'Gilstin', 'bgilstin77@nhs.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Nelson', 'Radoux', 'nradoux78@skype.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Brynne', 'Barnes', 'bbarnes79@prlog.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Lamont', 'Orans', 'lorans7a@fda.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Cynthy', 'Lindenbluth', 'clindenbluth7b@opera.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Eziechiele', 'Manby', 'emanby7c@fc2.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Hilde', 'Hartmann', 'hhartmann7d@shop-pro.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Ealasaid', 'Dwane', 'edwane7e@cdc.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Constantia', 'Watmough', 'cwatmough7f@google.com.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Lisetta', 'Eilles', 'leilles7g@parallels.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Roz', 'Matic', 'rmatic7h@xing.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Garvey', 'Shury', 'gshury7i@cloudflare.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cacilia', 'Labroue', 'clabroue7j@simplemachines.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Ransell', 'Jandel', 'rjandel7k@gravatar.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ruy', 'Verillo', 'rverillo7l@altervista.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Kassey', 'Bugge', 'kbugge7m@nyu.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Cleveland', 'Mackett', 'cmackett7n@google.com.hk');
insert into pasazerowie (imie, nazwisko, mail) values ('Bryn', 'Polino', 'bpolino7o@ucsd.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Linette', 'Strotton', 'lstrotton7p@sfgate.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Normy', 'Warhurst', 'nwarhurst7q@mysql.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Janet', 'Lyster', 'jlyster7r@devhub.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Clevie', 'Dugood', 'cdugood7s@blogger.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bendicty', 'Skechley', 'bskechley7t@taobao.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Fiorenze', 'Glasby', 'fglasby7u@clickbank.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Brittan', 'Igonet', 'bigonet7v@artisteer.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Timothea', 'Shillaker', 'tshillaker7w@cnet.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Marie-ann', 'Eyer', 'meyer7x@ebay.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Davidson', 'Simmonett', 'dsimmonett7y@ed.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Benjy', 'Grady', 'bgrady7z@quantcast.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ravid', 'Agent', 'ragent80@microsoft.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rudolf', 'Haken', 'rhaken81@ca.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Miltie', 'Munson', 'mmunson82@ifeng.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Theodore', 'Yarnley', 'tyarnley83@altervista.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Anna', 'Truggian', 'atruggian84@nih.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Moina', 'Newnham', 'mnewnham85@hubpages.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bevan', 'Blackhurst', 'bblackhurst86@creativecommons.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Elysia', 'De Cristoforo', 'edecristoforo87@netvibes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jonas', 'Jearum', 'jjearum88@mysql.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rene', 'Penrith', 'rpenrith89@chron.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Teriann', 'Conklin', 'tconklin8a@yolasite.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Locke', 'MacGowan', 'lmacgowan8b@ucoz.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Budd', 'Starrs', 'bstarrs8c@quantcast.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Hugh', 'Middas', 'hmiddas8d@liveinternet.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Doti', 'Ogden', 'dogden8e@yale.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Erastus', 'Rablan', 'erablan8f@harvard.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Henrik', 'Tocque', 'htocque8g@printfriendly.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Francine', 'McCulloch', 'fmcculloch8h@harvard.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Aleta', 'Filipczak', 'afilipczak8i@java.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Emiline', 'Colwell', 'ecolwell8j@wikispaces.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cissiee', 'Bullingham', 'cbullingham8k@yolasite.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rudolf', 'Lillo', 'rlillo8l@pinterest.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lenette', 'Weeke', 'lweeke8m@bloomberg.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Johan', 'Virgin', 'jvirgin8n@youku.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ancell', 'Meier', 'ameier8o@forbes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Teriann', 'Ulyat', 'tulyat8p@example.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Andrea', 'Cardenas', 'acardenas8q@wired.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Odelle', 'Benjamin', 'obenjamin8r@columbia.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Valentin', 'Booeln', 'vbooeln8s@ihg.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Uri', 'Djurkovic', 'udjurkovic8t@yelp.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Janith', 'Sobey', 'jsobey8u@state.tx.us');
insert into pasazerowie (imie, nazwisko, mail) values ('Hillery', 'Deware', 'hdeware8v@jugem.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Vanya', 'McGing', 'vmcging8w@skype.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Tobye', 'Tilberry', 'ttilberry8x@statcounter.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Aldric', 'Bawle', 'abawle8y@time.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Grace', 'Freak', 'gfreak8z@taobao.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Josee', 'Ledgerton', 'jledgerton90@blogspot.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Arie', 'Mildner', 'amildner91@hud.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Davy', 'Roskrug', 'droskrug92@dmoz.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Vevay', 'Oxlee', 'voxlee93@simplemachines.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Johnnie', 'Ronaghan', 'jronaghan94@nytimes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lutero', 'Samter', 'lsamter95@yahoo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gleda', 'McTeague', 'gmcteague96@geocities.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Hattie', 'Cartwright', 'hcartwright97@list-manage.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Viki', 'Plumtree', 'vplumtree98@auda.org.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Barbee', 'Falcus', 'bfalcus99@stumbleupon.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Howie', 'Iacivelli', 'hiacivelli9a@hibu.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Janeen', 'Bows', 'jbows9b@unesco.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Seward', 'Welbelove', 'swelbelove9c@abc.net.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Marya', 'Tomei', 'mtomei9d@newyorker.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Catrina', 'Melmore', 'cmelmore9e@digg.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Alvy', 'Hares', 'ahares9f@shareasale.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Clayborn', 'Anshell', 'canshell9g@hugedomains.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Stephine', 'Malec', 'smalec9h@shinystat.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Morlee', 'McCurrie', 'mmccurrie9i@simplemachines.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Annelise', 'Tomowicz', 'atomowicz9j@moonfruit.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Fenelia', 'Lyttle', 'flyttle9k@craigslist.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Justis', 'Amphlett', 'jamphlett9l@howstuffworks.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Melli', 'Chiplin', 'mchiplin9m@tinyurl.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lilllie', 'Sapwell', 'lsapwell9n@reuters.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Adelind', 'Kilbee', 'akilbee9o@economist.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bob', 'Woolvett', 'bwoolvett9p@umn.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Stavro', 'Morrill', 'smorrill9q@dion.ne.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Mal', 'Clampe', 'mclampe9r@deviantart.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Wells', 'Pantin', 'wpantin9s@earthlink.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Herta', 'Tivers', 'htivers9t@cafepress.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Keely', 'Coarser', 'kcoarser9u@yahoo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Arleta', 'Baud', 'abaud9v@examiner.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Wye', 'Hassey', 'whassey9w@mysql.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sarge', 'Caselick', 'scaselick9x@senate.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Thaine', 'Freemantle', 'tfreemantle9y@ucsd.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Mellie', 'Gooly', 'mgooly9z@sitemeter.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Annette', 'Farherty', 'afarhertya0@networksolutions.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Florella', 'Gaitone', 'fgaitonea1@alexa.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Faun', 'Rawlin', 'frawlina2@stanford.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Ashely', 'Longwood', 'alongwooda3@github.io');
insert into pasazerowie (imie, nazwisko, mail) values ('Jerrie', 'Rawll', 'jrawlla4@xrea.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sergeant', 'Inchbald', 'sinchbalda5@dedecms.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Eddy', 'Hexter', 'ehextera6@feedburner.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Elisabetta', 'Wynch', 'ewyncha7@wisc.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Elvina', 'McKeighen', 'emckeighena8@ed.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Coretta', 'Peris', 'cperisa9@ask.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Quintina', 'Montes', 'qmontesaa@pagesperso-orange.fr');
insert into pasazerowie (imie, nazwisko, mail) values ('Wendell', 'Cluff', 'wcluffab@youtube.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Valina', 'Charker', 'vcharkerac@merriam-webster.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Wileen', 'Conerding', 'wconerdingad@jalbum.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Sibylle', 'Goalley', 'sgoalleyae@fda.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Hollis', 'Gunson', 'hgunsonaf@cam.ac.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Auberon', 'Francombe', 'afrancombeag@webs.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Hetty', 'Gotcliff', 'hgotcliffah@ehow.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lian', 'Hallows', 'lhallowsai@cbslocal.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cicely', 'Tavener', 'ctaveneraj@clickbank.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Boris', 'Filipowicz', 'bfilipowiczak@last.fm');
insert into pasazerowie (imie, nazwisko, mail) values ('Katrina', 'Dorward', 'kdorwardal@amazonaws.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Shirleen', 'Skeels', 'sskeelsam@seesaa.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Brnaby', 'Edmed', 'bedmedan@blogger.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Pammie', 'Brogan', 'pbroganao@trellian.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Wade', 'Spracklin', 'wspracklinap@cisco.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Merissa', 'Fader', 'mfaderaq@sbwire.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Stoddard', 'Paxeford', 'spaxefordar@webeden.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Vince', 'Aylmer', 'vaylmeras@omniture.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Candi', 'Ivimey', 'civimeyat@cisco.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Hattie', 'Adshede', 'hadshedeau@domainmarket.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Costanza', 'Taplin', 'ctaplinav@youku.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Alonzo', 'McMeyler', 'amcmeyleraw@cdbaby.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Zonnya', 'Curner', 'zcurnerax@1688.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jabez', 'Pearton', 'jpeartonay@netscape.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Babbie', 'Oswal', 'boswalaz@google.de');
insert into pasazerowie (imie, nazwisko, mail) values ('Annamarie', 'Sennett', 'asennettb0@desdev.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Farlee', 'Jillings', 'fjillingsb1@xrea.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Shantee', 'Lenox', 'slenoxb2@marriott.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gun', 'Laise', 'glaiseb3@shinystat.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Norene', 'Bellord', 'nbellordb4@cafepress.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Amos', 'Kinnoch', 'akinnochb5@howstuffworks.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cilka', 'Elwel', 'celwelb6@ucla.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Giustina', 'Agass', 'gagassb7@a8.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Georgy', 'Abernethy', 'gabernethyb8@xinhuanet.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Daron', 'Alasdair', 'dalasdairb9@live.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Mathe', 'Arnholz', 'marnholzba@cocolog-nifty.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Thane', 'Dorey', 'tdoreybb@wufoo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Codi', 'Glader', 'cgladerbc@bbc.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Blondell', 'Hindsberg', 'bhindsbergbd@bizjournals.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Irwin', 'Brindley', 'ibrindleybe@mapquest.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sergei', 'Bottrill', 'sbottrillbf@yale.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Aldin', 'Spratt', 'asprattbg@elegantthemes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lucita', 'Cordeiro', 'lcordeirobh@examiner.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Vida', 'McKinnell', 'vmckinnellbi@gravatar.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Simeon', 'Sommerton', 'ssommertonbj@businessweek.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Yank', 'Handmore', 'yhandmorebk@dailymail.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Ari', 'Rogeon', 'arogeonbl@vk.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Francklyn', 'Pegden', 'fpegdenbm@netlog.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Shayna', 'Fleisch', 'sfleischbn@usatoday.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ruthy', 'Gerrard', 'rgerrardbo@tripod.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Therese', 'Barnaby', 'tbarnabybp@xrea.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ive', 'Zamudio', 'izamudiobq@netvibes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Verney', 'McDool', 'vmcdoolbr@xing.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Marcellus', 'Winscum', 'mwinscumbs@flickr.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Corrianne', 'Newell', 'cnewellbt@zimbio.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Leah', 'Tombleson', 'ltomblesonbu@istockphoto.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Herold', 'Tracey', 'htraceybv@mapquest.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Celina', 'Meeus', 'cmeeusbw@liveinternet.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Hewie', 'Ascraft', 'hascraftbx@msu.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Ardine', 'Wallas', 'awallasby@census.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Lurette', 'Housecroft', 'lhousecroftbz@lycos.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lorraine', 'Gagan', 'lgaganc0@scribd.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Maryl', 'Veart', 'mveartc1@stumbleupon.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Horatia', 'Hryncewicz', 'hhryncewiczc2@artisteer.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Valenka', 'Burgill', 'vburgillc3@scribd.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Quillan', 'Clendinning', 'qclendinningc4@mozilla.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Shawna', 'Lobe', 'slobec5@amazon.co.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Kendell', 'McKinnell', 'kmckinnellc6@icio.us');
insert into pasazerowie (imie, nazwisko, mail) values ('Jeremy', 'Frisdick', 'jfrisdickc7@hugedomains.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Merrielle', 'Venard', 'mvenardc8@sina.com.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Meghann', 'Berzen', 'mberzenc9@uiuc.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Ludvig', 'Jilkes', 'ljilkesca@yellowbook.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Garvey', 'Winning', 'gwinningcb@icq.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Federica', 'Galler', 'fgallercc@icq.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Charo', 'Dunnet', 'cdunnetcd@miitbeian.gov.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Nowell', 'Mayman', 'nmaymance@reuters.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kori', 'McKelvie', 'kmckelviecf@latimes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Hinze', 'Ygoe', 'hygoecg@unesco.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Sibbie', 'Trank', 'strankch@wiley.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lilllie', 'Lafferty', 'llaffertyci@deviantart.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Thoma', 'MacCambridge', 'tmaccambridgecj@nydailynews.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Evita', 'Mourge', 'emourgeck@hc360.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Carey', 'Dobing', 'cdobingcl@accuweather.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sven', 'Riccelli', 'sriccellicm@yandex.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Morgun', 'MacNeilly', 'mmacneillycn@usnews.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Daron', 'Brumbye', 'dbrumbyeco@quantcast.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Doralyn', 'Avrahamof', 'davrahamofcp@jugem.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Fey', 'Newsham', 'fnewshamcq@intel.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Dionne', 'Shaddock', 'dshaddockcr@google.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Ty', 'Melvin', 'tmelvincs@columbia.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Karolina', 'Freezer', 'kfreezerct@ted.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Max', 'Kurt', 'mkurtcu@homestead.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Domenic', 'Easterling', 'deasterlingcv@creativecommons.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Sib', 'Cobb', 'scobbcw@newyorker.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gussi', 'Massie', 'gmassiecx@twitter.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ricard', 'Hamshaw', 'rhamshawcy@merriam-webster.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lyn', 'Whenman', 'lwhenmancz@abc.net.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Delmor', 'Girton', 'dgirtond0@yelp.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Guillema', 'Fulks', 'gfulksd1@fastcompany.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Carmella', 'Thirtle', 'cthirtled2@gnu.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Derrek', 'Saggs', 'dsaggsd3@ow.ly');
insert into pasazerowie (imie, nazwisko, mail) values ('Nerty', 'Temple', 'ntempled4@forbes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gaspar', 'Esmond', 'gesmondd5@wikia.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Avie', 'Antoons', 'aantoonsd6@trellian.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Babbie', 'Delong', 'bdelongd7@cnbc.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Shandie', 'Sines', 'ssinesd8@ning.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Brigham', 'Wansbury', 'bwansburyd9@mozilla.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ruthy', 'Sebrens', 'rsebrensda@gravatar.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Mychal', 'Maddaford', 'mmaddaforddb@ning.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nanon', 'Jaffray', 'njaffraydc@answers.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nadiya', 'Scourfield', 'nscourfielddd@parallels.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Christalle', 'Dryden', 'cdrydende@google.pl');
insert into pasazerowie (imie, nazwisko, mail) values ('Kyrstin', 'Novacek', 'knovacekdf@about.me');
insert into pasazerowie (imie, nazwisko, mail) values ('Westley', 'Meakin', 'wmeakindg@mail.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Jenn', 'Windmill', 'jwindmilldh@cdc.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Melisande', 'Benjafield', 'mbenjafielddi@pinterest.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Malva', 'Shwenn', 'mshwenndj@hibu.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Winnie', 'Fright', 'wfrightdk@army.mil');
insert into pasazerowie (imie, nazwisko, mail) values ('Nanci', 'Cockerell', 'ncockerelldl@cargocollective.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ruby', 'Lademann', 'rlademanndm@google.com.hk');
insert into pasazerowie (imie, nazwisko, mail) values ('Waly', 'Pozer', 'wpozerdn@springer.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Pablo', 'Rowaszkiewicz', 'prowaszkiewiczdo@squidoo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Alexandros', 'Rodda', 'aroddadp@mit.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Angil', 'Yea', 'ayeadq@freewebs.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Elsworth', 'Moxon', 'emoxondr@japanpost.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Donnie', 'Simeon', 'dsimeonds@yellowbook.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nikita', 'Molnar', 'nmolnardt@live.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Norene', 'Cashmore', 'ncashmoredu@trellian.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cory', 'Swait', 'cswaitdv@dot.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Dulcinea', 'Harvatt', 'dharvattdw@reverbnation.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Adeline', 'Owtram', 'aowtramdx@bravesites.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Thelma', 'Launder', 'tlaunderdy@jiathis.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Carmon', 'Grelak', 'cgrelakdz@sakura.ne.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Francklyn', 'Roll', 'frolle0@unc.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Ruth', 'Greenhalf', 'rgreenhalfe1@cdbaby.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bernice', 'MacKill', 'bmackille2@webs.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lynde', 'Blackmore', 'lblackmoree3@google.pl');
insert into pasazerowie (imie, nazwisko, mail) values ('Tedd', 'Andrzejowski', 'tandrzejowskie4@smugmug.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Elli', 'Emig', 'eemige5@yellowbook.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Tracie', 'Chalk', 'tchalke6@instagram.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Vanya', 'Iczokvitz', 'viczokvitze7@ucsd.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Titus', 'Tapping', 'ttappinge8@yolasite.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Alf', 'Hamlin', 'ahamline9@phoca.cz');
insert into pasazerowie (imie, nazwisko, mail) values ('Katee', 'Dillaway', 'kdillawayea@networksolutions.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sheilah', 'Pulster', 'spulstereb@columbia.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Isa', 'Djuricic', 'idjuricicec@globo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Monique', 'Rumin', 'mrumined@msu.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Gannie', 'MacIver', 'gmaciveree@army.mil');
insert into pasazerowie (imie, nazwisko, mail) values ('Cosimo', 'Legrand', 'clegrandef@japanpost.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Graig', 'Matchett', 'gmatchetteg@soundcloud.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ira', 'Lehenmann', 'ilehenmanneh@exblog.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Linea', 'Georgeon', 'lgeorgeonei@google.ca');
insert into pasazerowie (imie, nazwisko, mail) values ('Betsy', 'Elmes', 'belmesej@over-blog.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Marlin', 'McMillan', 'mmcmillanek@hibu.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Briny', 'Brewerton', 'bbrewertonel@wix.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Steve', 'Mattioli', 'smattioliem@paginegialle.it');
insert into pasazerowie (imie, nazwisko, mail) values ('Bettine', 'Legat', 'blegaten@epa.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Ulysses', 'Trineman', 'utrinemaneo@dion.ne.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Mignon', 'Beebee', 'mbeebeeep@t.co');
insert into pasazerowie (imie, nazwisko, mail) values ('Dianne', 'Blaksland', 'dblakslandeq@umn.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Butch', 'Samworth', 'bsamworther@topsy.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Regina', 'Sadat', 'rsadates@cnbc.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Roman', 'Cadd', 'rcaddet@com.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Clarance', 'Dudding', 'cduddingeu@google.es');
insert into pasazerowie (imie, nazwisko, mail) values ('Blakelee', 'Middas', 'bmiddasev@amazon.co.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Lenee', 'Govey', 'lgoveyew@drupal.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Freemon', 'London', 'flondonex@dailymotion.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ibby', 'Tidy', 'itidyey@de.vu');
insert into pasazerowie (imie, nazwisko, mail) values ('Barbe', 'Beardon', 'bbeardonez@mozilla.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Marlena', 'Collumbell', 'mcollumbellf0@lycos.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Brittani', 'Probart', 'bprobartf1@flickr.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Germaine', 'McCracken', 'gmccrackenf2@businessweek.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ingaberg', 'Jeffreys', 'ijeffreysf3@blogger.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Delcine', 'Sadry', 'dsadryf4@xing.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gaspard', 'Collishaw', 'gcollishawf5@irs.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Sisile', 'Kennerley', 'skennerleyf6@washingtonpost.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Vida', 'Shurrocks', 'vshurrocksf7@google.pl');
insert into pasazerowie (imie, nazwisko, mail) values ('Nata', 'Larret', 'nlarretf8@auda.org.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Devy', 'Duffie', 'dduffief9@samsung.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sandie', 'Prydie', 'sprydiefa@fc2.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Flossie', 'Cressar', 'fcressarfb@who.int');
insert into pasazerowie (imie, nazwisko, mail) values ('Kaitlynn', 'McQuirk', 'kmcquirkfc@simplemachines.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Zia', 'Punshon', 'zpunshonfd@sphinn.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Karna', 'Corp', 'kcorpfe@phpbb.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lyman', 'Zielinski', 'lzielinskiff@mashable.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Celesta', 'Bradbrook', 'cbradbrookfg@wikipedia.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Ulric', 'Maginot', 'umaginotfh@about.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Keefer', 'Duester', 'kduesterfi@usatoday.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Graehme', 'Valentetti', 'gvalentettifj@foxnews.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Silas', 'Nast', 'snastfk@guardian.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Katie', 'Fawssett', 'kfawssettfl@biblegateway.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Amalee', 'Jersch', 'ajerschfm@goo.gl');
insert into pasazerowie (imie, nazwisko, mail) values ('Sunny', 'Tregenza', 'stregenzafn@constantcontact.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Tommy', 'Danbury', 'tdanburyfo@histats.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Querida', 'Chander', 'qchanderfp@si.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Kimberlyn', 'Lembcke', 'klembckefq@php.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Andy', 'Northbridge', 'anorthbridgefr@godaddy.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kare', 'Poulston', 'kpoulstonfs@harvard.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Rozamond', 'Banbrook', 'rbanbrookft@nasa.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Tami', 'Boyd', 'tboydfu@stanford.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Melodie', 'McCandless', 'mmccandlessfv@geocities.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Abby', 'Ellum', 'aellumfw@nature.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Karen', 'Beech', 'kbeechfx@wufoo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Walt', 'Giacomini', 'wgiacominify@theglobeandmail.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Magnum', 'Dallinder', 'mdallinderfz@geocities.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Laureen', 'Corteis', 'lcorteisg0@cbc.ca');
insert into pasazerowie (imie, nazwisko, mail) values ('Marsiella', 'Medley', 'mmedleyg1@bigcartel.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Temple', 'McGibbon', 'tmcgibbong2@smugmug.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Alli', 'MacFadyen', 'amacfadyeng3@stanford.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Bab', 'Okeshott', 'bokeshottg4@hc360.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Marion', 'Reggler', 'mregglerg5@webmd.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Eartha', 'O''Hallagan', 'eohallagang6@naver.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Shanda', 'Spelwood', 'sspelwoodg7@over-blog.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Shaine', 'Boissier', 'sboissierg8@ehow.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Stormie', 'Rampling', 'sramplingg9@friendfeed.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Anselm', 'Bridywater', 'abridywaterga@theatlantic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Michaela', 'Gash', 'mgashgb@bbc.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Ketty', 'Lydford', 'klydfordgc@tumblr.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Mary', 'McFetrich', 'mmcfetrichgd@nps.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Nertie', 'Bambrick', 'nbambrickge@naver.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Juanita', 'Fairtlough', 'jfairtloughgf@fema.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Celine', 'Mitkov', 'cmitkovgg@shareasale.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Brooke', 'Trudgion', 'btrudgiongh@ca.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Hobey', 'Scripps', 'hscrippsgi@yelp.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Morie', 'Burnhard', 'mburnhardgj@hc360.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Abey', 'Geraldo', 'ageraldogk@google.de');
insert into pasazerowie (imie, nazwisko, mail) values ('Roscoe', 'Gheeraert', 'rgheeraertgl@netvibes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Whit', 'Emanuelli', 'wemanuelligm@rediff.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Dane', 'McCusker', 'dmccuskergn@e-recht24.de');
insert into pasazerowie (imie, nazwisko, mail) values ('Margarette', 'Gozney', 'mgozneygo@dagondesign.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Janine', 'Lansdale', 'jlansdalegp@twitpic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Roxi', 'Trippack', 'rtrippackgq@mayoclinic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Marleah', 'Cohani', 'mcohanigr@vk.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ivory', 'Longstreet', 'ilongstreetgs@msn.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Stanley', 'Abramzon', 'sabramzongt@irs.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Nedi', 'McHarry', 'nmcharrygu@ox.ac.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Tallia', 'MacAllaster', 'tmacallastergv@cbc.ca');
insert into pasazerowie (imie, nazwisko, mail) values ('Nanine', 'Billion', 'nbilliongw@delicious.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lanny', 'Gratton', 'lgrattongx@psu.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Gaby', 'Battany', 'gbattanygy@tiny.cc');
insert into pasazerowie (imie, nazwisko, mail) values ('Reeta', 'Hulse', 'rhulsegz@cocolog-nifty.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Keefe', 'Postgate', 'kpostgateh0@narod.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Frederich', 'Davydochkin', 'fdavydochkinh1@nasa.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Grenville', 'Venditti', 'gvendittih2@google.co.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Karin', 'O''Kennavain', 'kokennavainh3@nsw.gov.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Maryjo', 'Freeborn', 'mfreebornh4@constantcontact.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Aurthur', 'Kubasek', 'akubasekh5@sciencedirect.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Verna', 'Larsen', 'vlarsenh6@latimes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Alasteir', 'Birk', 'abirkh7@taobao.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Odilia', 'Simonnet', 'osimonneth8@nifty.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rhett', 'Aharoni', 'raharonih9@blogger.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Levon', 'Davidovics', 'ldavidovicsha@msn.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cristin', 'Selbie', 'cselbiehb@wunderground.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Mimi', 'Darkott', 'mdarkotthc@reverbnation.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Brittney', 'Swithenby', 'bswithenbyhd@issuu.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kippie', 'Roycroft', 'kroycrofthe@slashdot.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Clementia', 'Pinks', 'cpinkshf@newsvine.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cam', 'Calwell', 'ccalwellhg@slashdot.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Julianne', 'Grainger', 'jgraingerhh@cisco.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Townie', 'Tenwick', 'ttenwickhi@xrea.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cointon', 'Loffill', 'cloffillhj@merriam-webster.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lorilyn', 'Mapholm', 'lmapholmhk@ning.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Anne', 'Bolstridge', 'abolstridgehl@va.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Franni', 'MacGowan', 'fmacgowanhm@ameblo.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Gordon', 'Arrault', 'garraulthn@wix.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gelya', 'Wallbridge', 'gwallbridgeho@parallels.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Griffie', 'Jullian', 'gjullianhp@csmonitor.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Shea', 'Jeger', 'sjegerhq@mozilla.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Jeremie', 'Yerbury', 'jyerburyhr@netscape.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kerrill', 'MacFadyen', 'kmacfadyenhs@yahoo.co.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Tammie', 'Songist', 'tsongistht@ucoz.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Marisa', 'Rollingson', 'mrollingsonhu@blogs.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Whit', 'Meardon', 'wmeardonhv@toplist.cz');
insert into pasazerowie (imie, nazwisko, mail) values ('Eldridge', 'Turri', 'eturrihw@techcrunch.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Andrea', 'Kornousek', 'akornousekhx@hc360.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Charmion', 'Edling', 'cedlinghy@wsj.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Zachariah', 'Danielsky', 'zdanielskyhz@technorati.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Tami', 'Rexworthy', 'trexworthyi0@census.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Bab', 'Pollastro', 'bpollastroi1@guardian.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Katuscha', 'Ingilson', 'kingilsoni2@umich.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Deloria', 'Studde', 'dstuddei3@issuu.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Edi', 'Wagon', 'ewagoni4@plala.or.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Calvin', 'Robilliard', 'crobilliardi5@acquirethisname.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Neala', 'Kells', 'nkellsi6@ted.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Slade', 'Maisey', 'smaiseyi7@tmall.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Zeke', 'Catterall', 'zcatteralli8@behance.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Thomasin', 'Curnok', 'tcurnoki9@pagesperso-orange.fr');
insert into pasazerowie (imie, nazwisko, mail) values ('Rosalynd', 'Aberhart', 'raberhartia@arizona.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Jory', 'Tutchings', 'jtutchingsib@technorati.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Fanny', 'Vickarman', 'fvickarmanic@aboutads.info');
insert into pasazerowie (imie, nazwisko, mail) values ('Jasun', 'Scallon', 'jscallonid@chicagotribune.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Meridith', 'Haverty', 'mhavertyie@digg.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Howey', 'Twelve', 'htwelveif@google.com.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Giles', 'McMylor', 'gmcmylorig@mayoclinic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gaspard', 'Cotillard', 'gcotillardih@amazonaws.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Carina', 'Dorgan', 'cdorganii@scientificamerican.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Maxie', 'Parbrook', 'mparbrookij@cbslocal.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Brooks', 'Tanswill', 'btanswillik@nasa.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Maggee', 'Draco', 'mdracoil@goo.ne.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Bernadina', 'Pitford', 'bpitfordim@ucla.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Raddie', 'Sifleet', 'rsifleetin@cloudflare.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Martyn', 'Switsur', 'mswitsurio@ehow.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Brinn', 'Bowich', 'bbowichip@springer.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gillan', 'Schust', 'gschustiq@acquirethisname.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Mattias', 'Alabone', 'malaboneir@amazonaws.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bobbie', 'Stops', 'bstopsis@rambler.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Ganny', 'Baskerville', 'gbaskervilleit@digg.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Harlie', 'Aguilar', 'haguilariu@deliciousdays.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kathie', 'Imore', 'kimoreiv@opensource.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Gannie', 'Gyurkovics', 'ggyurkovicsiw@ameblo.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Dinny', 'Schiefersten', 'dschieferstenix@cmu.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Dew', 'Dunkerton', 'ddunkertoniy@prlog.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Alice', 'Petken', 'apetkeniz@cornell.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Tomlin', 'Keyho', 'tkeyhoj0@microsoft.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rozanne', 'Clemoes', 'rclemoesj1@photobucket.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Moira', 'Dawson', 'mdawsonj2@netscape.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Eleonore', 'Stone', 'estonej3@economist.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Keelby', 'Davison', 'kdavisonj4@loc.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Buck', 'Chalcraft', 'bchalcraftj5@examiner.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Emanuele', 'Hucke', 'ehuckej6@ycombinator.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cinderella', 'Grasser', 'cgrasserj7@shareasale.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Hugues', 'Hartburn', 'hhartburnj8@w3.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Enos', 'Frantzen', 'efrantzenj9@themeforest.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Brooks', 'Meany', 'bmeanyja@patch.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Mile', 'Robuchon', 'mrobuchonjb@geocities.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Corny', 'Semmens', 'csemmensjc@cnn.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Selby', 'Armstrong', 'sarmstrongjd@elegantthemes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sayer', 'Gibbie', 'sgibbieje@cmu.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Flory', 'Scanderet', 'fscanderetjf@rediff.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Romona', 'Crumley', 'rcrumleyjg@who.int');
insert into pasazerowie (imie, nazwisko, mail) values ('Julianne', 'Hawley', 'jhawleyjh@cnbc.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gay', 'Jerams', 'gjeramsji@yolasite.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Judah', 'Corkan', 'jcorkanjj@digg.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Fair', 'Allden', 'falldenjk@myspace.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Launce', 'Bernhard', 'lbernhardjl@yahoo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Marcia', 'Mosson', 'mmossonjm@flavors.me');
insert into pasazerowie (imie, nazwisko, mail) values ('Artemis', 'Hogsden', 'ahogsdenjn@opensource.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Averell', 'Andrewartha', 'aandrewarthajo@telegraph.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('L;urette', 'Joint', 'ljointjp@homestead.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Roz', 'Tidbold', 'rtidboldjq@npr.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Iseabal', 'Strickland', 'istricklandjr@shinystat.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Dani', 'Matteoni', 'dmatteonijs@sakura.ne.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Hastings', 'Posselwhite', 'hposselwhitejt@guardian.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Irwinn', 'Brewis', 'ibrewisju@yellowpages.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jillayne', 'Poetz', 'jpoetzjv@1688.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Melodee', 'Beatty', 'mbeattyjw@posterous.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Keenan', 'Jobbing', 'kjobbingjx@ted.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Worthington', 'Fayers', 'wfayersjy@wikipedia.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Dewain', 'Trayford', 'dtrayfordjz@xinhuanet.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ginnifer', 'Liebrecht', 'gliebrechtk0@oracle.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Will', 'O''Doohaine', 'wodoohainek1@wufoo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nonah', 'Winterborne', 'nwinterbornek2@behance.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Halli', 'Ferrers', 'hferrersk3@symantec.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ingemar', 'Winsper', 'iwinsperk4@webnode.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Dory', 'Akam', 'dakamk5@cdc.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Tiler', 'Cotter', 'tcotterk6@woothemes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Felicle', 'Leason', 'fleasonk7@altervista.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Griffith', 'Cankett', 'gcankettk8@phpbb.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Joey', 'Wayper', 'jwayperk9@usnews.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nicolle', 'McDonnell', 'nmcdonnellka@jugem.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Karlie', 'Tapner', 'ktapnerkb@businessweek.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Stacie', 'Lindman', 'slindmankc@samsung.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kelcey', 'Zannini', 'kzanninikd@yelp.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Harriet', 'Mitcheson', 'hmitchesonke@twitpic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kandy', 'Ginman', 'kginmankf@accuweather.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Candis', 'Smeeth', 'csmeethkg@comcast.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Mitch', 'Thickin', 'mthickinkh@yahoo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Barbee', 'Poole', 'bpooleki@ezinearticles.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jesse', 'Loutheane', 'jloutheanekj@youku.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Em', 'Gavaran', 'egavarankk@google.com.br');
insert into pasazerowie (imie, nazwisko, mail) values ('Shirl', 'Rudram', 'srudramkl@adobe.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Brendan', 'Yegorev', 'byegorevkm@weibo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bunnie', 'Dawson', 'bdawsonkn@shop-pro.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Louella', 'Devonish', 'ldevonishko@smugmug.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Carlita', 'Duggan', 'cduggankp@fotki.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Fidelia', 'Stollberger', 'fstollbergerkq@narod.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Carlie', 'Scrooby', 'cscroobykr@shinystat.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Barny', 'Zemler', 'bzemlerks@vkontakte.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Cori', 'Rediers', 'credierskt@google.nl');
insert into pasazerowie (imie, nazwisko, mail) values ('Meredeth', 'Cottell', 'mcottellku@facebook.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Patti', 'Jurries', 'pjurrieskv@tripod.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Garrek', 'Nanni', 'gnannikw@biglobe.ne.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Meredith', 'Fosbraey', 'mfosbraeykx@usnews.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bernadina', 'Clear', 'bclearky@ehow.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bobby', 'Clerk', 'bclerkkz@dropbox.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jewel', 'Wasylkiewicz', 'jwasylkiewiczl0@webmd.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Keelby', 'Byres', 'kbyresl1@prnewswire.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lorrie', 'MacCollom', 'lmaccolloml2@joomla.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Kliment', 'McDermot', 'kmcdermotl3@rediff.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Perkin', 'Buckland', 'pbucklandl4@cyberchimps.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jasper', 'Cantrill', 'jcantrilll5@ebay.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Alphard', 'Ornils', 'aornilsl6@macromedia.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Alejoa', 'Towey', 'atoweyl7@tumblr.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Guthrie', 'Pretor', 'gpretorl8@amazon.co.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Sula', 'Hansmann', 'shansmannl9@dagondesign.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kala', 'Huggett', 'khuggettla@howstuffworks.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kelli', 'Callinan', 'kcallinanlb@nationalgeographic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Adelina', 'Gourlay', 'agourlaylc@google.ca');
insert into pasazerowie (imie, nazwisko, mail) values ('Dinny', 'Chastelain', 'dchastelainld@tripod.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Blondy', 'Blune', 'bblunele@ebay.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Anthony', 'Wasling', 'awaslinglf@theguardian.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Larissa', 'Yesenev', 'lyesenevlg@google.co.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Adi', 'McKennan', 'amckennanlh@canalblog.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Katey', 'Coulthurst', 'kcoulthurstli@wufoo.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Micky', 'Lindenman', 'mlindenmanlj@wordpress.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Danya', 'Capes', 'dcapeslk@imdb.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Laurene', 'Brockest', 'lbrockestll@bizjournals.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Pam', 'Pygott', 'ppygottlm@ed.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Roch', 'Cogzell', 'rcogzellln@sitemeter.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Batsheva', 'Holdren', 'bholdrenlo@economist.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Albertine', 'Iddens', 'aiddenslp@tmall.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Odessa', 'Berkelay', 'oberkelaylq@phoca.cz');
insert into pasazerowie (imie, nazwisko, mail) values ('Marlowe', 'Gredden', 'mgreddenlr@reuters.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Fawn', 'Blackford', 'fblackfordls@weebly.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gwenore', 'Osant', 'gosantlt@miitbeian.gov.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Esta', 'Yea', 'eyealu@lycos.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Di', 'Brashaw', 'dbrashawlv@arstechnica.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Damita', 'Nendick', 'dnendicklw@gnu.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Edward', 'Simione', 'esimionelx@usa.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Mollee', 'Ovendon', 'movendonly@seattletimes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sarajane', 'McClifferty', 'smccliffertylz@desdev.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Jae', 'Barton', 'jbartonm0@yellowpages.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Judie', 'Eaglen', 'jeaglenm1@yolasite.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Miquela', 'Harfleet', 'mharfleetm2@geocities.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Ruperta', 'Simoes', 'rsimoesm3@imgur.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Dixie', 'Amsden', 'damsdenm4@privacy.gov.au');
insert into pasazerowie (imie, nazwisko, mail) values ('Peggy', 'Suter', 'psuterm5@wikispaces.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Dorotea', 'Olenikov', 'dolenikovm6@naver.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Grayce', 'Penquet', 'gpenquetm7@weather.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Filia', 'Lipgens', 'flipgensm8@hubpages.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ciel', 'Chander', 'cchanderm9@blogs.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Maurine', 'Harmar', 'mharmarma@miibeian.gov.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Angie', 'Winspurr', 'awinspurrmb@constantcontact.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sascha', 'Duckett', 'sduckettmc@naver.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cassie', 'Oganesian', 'coganesianmd@eventbrite.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Mano', 'Halsey', 'mhalseyme@springer.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Thoma', 'Dyers', 'tdyersmf@cmu.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Brook', 'Gowry', 'bgowrymg@usgs.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Therese', 'Folliss', 'tfollissmh@clickbank.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Irwin', 'Gerardeaux', 'igerardeauxmi@ted.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Banky', 'Juzek', 'bjuzekmj@washingtonpost.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Chrissy', 'Portchmouth', 'cportchmouthmk@deliciousdays.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Alyss', 'Nodes', 'anodesml@ihg.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Park', 'Kynforth', 'pkynforthmm@sfgate.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Webb', 'Gulland', 'wgullandmn@scribd.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Brigitta', 'Winch', 'bwinchmo@zdnet.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Coretta', 'Moth', 'cmothmp@sfgate.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Beatrix', 'Gooble', 'bgooblemq@blinklist.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Forester', 'Ewers', 'fewersmr@alexa.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sharl', 'Fomichyov', 'sfomichyovms@yahoo.co.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Maximo', 'Kleiser', 'mkleisermt@ifeng.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Richmound', 'Mcimmie', 'rmcimmiemu@ezinearticles.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Arlan', 'Le Breton', 'alebretonmv@bing.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cleveland', 'Pinner', 'cpinnermw@barnesandnoble.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Englebert', 'Hynson', 'ehynsonmx@biglobe.ne.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Alix', 'Thal', 'athalmy@so-net.ne.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Kenna', 'Monery', 'kmonerymz@naver.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Karlis', 'Oyley', 'koyleyn0@vk.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lindy', 'Ogborne', 'logbornen1@unesco.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Brande', 'Coggin', 'bcogginn2@blogspot.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Yehudi', 'Sumpton', 'ysumptonn3@mayoclinic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jae', 'MacElroy', 'jmacelroyn4@mediafire.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gideon', 'Crafter', 'gcraftern5@gov.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Alejandrina', 'Classen', 'aclassenn6@slideshare.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Noami', 'Durman', 'ndurmann7@wired.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Georg', 'Lowseley', 'glowseleyn8@bbb.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Cyndy', 'Robbert', 'crobbertn9@wikipedia.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Hanson', 'Durie', 'hduriena@google.pl');
insert into pasazerowie (imie, nazwisko, mail) values ('Annie', 'Niemetz', 'aniemetznb@cnet.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Linnell', 'Clinning', 'lclinningnc@issuu.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Valry', 'Passo', 'vpassond@theguardian.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Carri', 'Turnpenny', 'cturnpennyne@admin.ch');
insert into pasazerowie (imie, nazwisko, mail) values ('Anastasie', 'Ropkes', 'aropkesnf@symantec.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Codie', 'Willson', 'cwillsonng@soundcloud.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kathryne', 'Moughton', 'kmoughtonnh@gnu.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Shawn', 'Tiddy', 'stiddyni@mapquest.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rollin', 'Chellam', 'rchellamnj@newsvine.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bjorn', 'Cage', 'bcagenk@forbes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Leanora', 'Sherme', 'lshermenl@lulu.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Karlotta', 'Chapelle', 'kchapellenm@soundcloud.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Eirena', 'Bankes', 'ebankesnn@imdb.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Pooh', 'Cosin', 'pcosinno@1und1.de');
insert into pasazerowie (imie, nazwisko, mail) values ('Carson', 'Strodder', 'cstroddernp@networkadvertising.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Nelli', 'Renzini', 'nrenzininq@seesaa.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Monty', 'Creelman', 'mcreelmannr@unicef.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Swen', 'Sclater', 'ssclaterns@homestead.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Shina', 'Hearnah', 'shearnahnt@over-blog.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Heddi', 'Sanpher', 'hsanphernu@slashdot.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Erna', 'Trew', 'etrewnv@ca.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Ariella', 'Argo', 'aargonw@walmart.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nathalia', 'Abrahamoff', 'nabrahamoffnx@washingtonpost.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Mayne', 'Skirving', 'mskirvingny@wisc.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Carlo', 'Varian', 'cvariannz@washingtonpost.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Benson', 'Truswell', 'btruswello0@yellowbook.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cherri', 'Lengthorn', 'clengthorno1@dailymail.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Marilyn', 'Bedward', 'mbedwardo2@google.co.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Alano', 'Steuart', 'asteuarto3@discovery.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Margarethe', 'Havoc', 'mhavoco4@is.gd');
insert into pasazerowie (imie, nazwisko, mail) values ('Abran', 'Duffield', 'aduffieldo5@soup.io');
insert into pasazerowie (imie, nazwisko, mail) values ('Alexa', 'Orpen', 'aorpeno6@tripadvisor.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Fulton', 'Readett', 'freadetto7@odnoklassniki.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Gizela', 'Ayres', 'gayreso8@unesco.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Catrina', 'Kneale', 'cknealeo9@rambler.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Hesther', 'Josskowitz', 'hjosskowitzoa@census.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Amandi', 'Diable', 'adiableob@skype.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ivar', 'Bunner', 'ibunneroc@odnoklassniki.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Charlena', 'Gouck', 'cgouckod@unblog.fr');
insert into pasazerowie (imie, nazwisko, mail) values ('Sanford', 'Stockau', 'sstockauoe@apache.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Standford', 'Nelthrop', 'snelthropof@angelfire.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Deny', 'Alvarado', 'dalvaradoog@eventbrite.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Dody', 'Norvell', 'dnorvelloh@sitemeter.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Deanne', 'Neal', 'dnealoi@t-online.de');
insert into pasazerowie (imie, nazwisko, mail) values ('Sandor', 'Bushell', 'sbushelloj@miibeian.gov.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Filia', 'Roots', 'frootsok@technorati.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Dun', 'Payle', 'dpayleol@dell.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Andra', 'Penke', 'apenkeom@geocities.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Aubine', 'Hackworthy', 'ahackworthyon@google.es');
insert into pasazerowie (imie, nazwisko, mail) values ('Jelene', 'Genny', 'jgennyoo@princeton.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Alanah', 'Sidle', 'asidleop@symantec.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Liliane', 'MacTrustey', 'lmactrusteyoq@themeforest.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Aeriell', 'Chipperfield', 'achipperfieldor@netlog.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Anson', 'Itzcak', 'aitzcakos@angelfire.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Gerri', 'Kenworthey', 'gkenwortheyot@usda.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Otto', 'Grabban', 'ograbbanou@columbia.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Jone', 'Tivers', 'jtiversov@goo.ne.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Gustaf', 'Houchin', 'ghouchinow@acquirethisname.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Alley', 'Roelofs', 'aroelofsox@telegraph.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Goraud', 'Gonnely', 'ggonnelyoy@xrea.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Karisa', 'Averill', 'kaverilloz@java.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Garrott', 'Sainsbury-Brown', 'gsainsburybrownp0@smugmug.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ginelle', 'Mulvagh', 'gmulvaghp1@freewebs.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Christy', 'Muirhead', 'cmuirheadp2@usa.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Teddy', 'Polly', 'tpollyp3@ft.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sibelle', 'Cooper', 'scooperp4@arizona.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Glendon', 'Andrejs', 'gandrejsp5@booking.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Emanuel', 'Slucock', 'eslucockp6@drupal.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Stephannie', 'Hawse', 'shawsep7@about.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Emmeline', 'Badrock', 'ebadrockp8@yelp.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jerrine', 'McPhelimy', 'jmcphelimyp9@phpbb.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Cicely', 'Talby', 'ctalbypa@last.fm');
insert into pasazerowie (imie, nazwisko, mail) values ('Emmalynne', 'Haggidon', 'ehaggidonpb@alexa.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Bartie', 'Wadhams', 'bwadhamspc@chronoengine.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sander', 'Marrows', 'smarrowspd@gov.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Valerie', 'Snead', 'vsneadpe@ted.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Meir', 'Yegorovnin', 'myegorovninpf@webmd.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Giorgi', 'Bransom', 'gbransompg@51.la');
insert into pasazerowie (imie, nazwisko, mail) values ('Betta', 'Coole', 'bcooleph@nih.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Dulcinea', 'Gregan', 'dgreganpi@plala.or.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Porter', 'Torritti', 'ptorrittipj@deviantart.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Marguerite', 'Wakeley', 'mwakeleypk@devhub.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Coraline', 'Pimbley', 'cpimbleypl@mit.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Neil', 'Gabe', 'ngabepm@ameblo.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Chrissie', 'Crawley', 'ccrawleypn@smugmug.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Hillary', 'Sabatier', 'hsabatierpo@usatoday.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Giselbert', 'Allison', 'gallisonpp@latimes.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Georges', 'Staner', 'gstanerpq@goodreads.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Neysa', 'Yvon', 'nyvonpr@google.fr');
insert into pasazerowie (imie, nazwisko, mail) values ('Tove', 'Dilkes', 'tdilkesps@vk.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Salvador', 'Wooler', 'swoolerpt@buzzfeed.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Pip', 'Schaffel', 'pschaffelpu@amazon.co.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Travus', 'Baistow', 'tbaistowpv@java.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Micky', 'Casaroli', 'mcasarolipw@squarespace.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sheilah', 'Baldree', 'sbaldreepx@mozilla.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Christophe', 'Wegman', 'cwegmanpy@twitpic.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kerstin', 'MacTimpany', 'kmactimpanypz@creativecommons.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Ferdinand', 'Pauleit', 'fpauleitq0@joomla.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Lonny', 'Baylay', 'lbaylayq1@dedecms.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Johna', 'Radband', 'jradbandq2@altervista.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Ali', 'Gregolin', 'agregolinq3@marketwatch.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Danyelle', 'Goldis', 'dgoldisq4@msu.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Arthur', 'Itzik', 'aitzikq5@prnewswire.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Kennett', 'Montes', 'kmontesq6@facebook.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Tobye', 'Golsby', 'tgolsbyq7@prlog.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Andeee', 'Sabates', 'asabatesq8@google.cn');
insert into pasazerowie (imie, nazwisko, mail) values ('Hart', 'Bussen', 'hbussenq9@discuz.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Marleah', 'Duff', 'mduffqa@baidu.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Alexis', 'Belmont', 'abelmontqb@scientificamerican.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Donny', 'Trunby', 'dtrunbyqc@pen.io');
insert into pasazerowie (imie, nazwisko, mail) values ('Dorian', 'Garman', 'dgarmanqd@freewebs.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Prisca', 'Bauldrey', 'pbauldreyqe@4shared.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Amalie', 'Robbert', 'arobbertqf@ihg.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Yard', 'Styant', 'ystyantqg@topsy.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Mitchell', 'Calleja', 'mcallejaqh@over-blog.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Lyssa', 'Airlie', 'lairlieqi@upenn.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Hazel', 'Laphorn', 'hlaphornqj@ameblo.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Lanie', 'Swanborrow', 'lswanborrowqk@howstuffworks.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Donnie', 'Puxley', 'dpuxleyql@slashdot.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Lara', 'Pennycord', 'lpennycordqm@house.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Chevalier', 'Jirik', 'cjirikqn@weather.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Flynn', 'Reddoch', 'freddochqo@netlog.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Madelaine', 'Prince', 'mprinceqp@dropbox.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Culver', 'Dufaur', 'cdufaurqq@123-reg.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Reamonn', 'Dishman', 'rdishmanqr@un.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Tann', 'Rubinlicht', 'trubinlichtqs@godaddy.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Nikos', 'Redholls', 'nredhollsqt@slideshare.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Desdemona', 'Bage', 'dbagequ@free.fr');
insert into pasazerowie (imie, nazwisko, mail) values ('Ricky', 'Naish', 'rnaishqv@mozilla.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Wadsworth', 'Dwine', 'wdwineqw@youtube.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rayshell', 'Cripwell', 'rcripwellqx@w3.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Gerti', 'Kells', 'gkellsqy@noaa.gov');
insert into pasazerowie (imie, nazwisko, mail) values ('Neils', 'Blose', 'nbloseqz@comcast.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Winonah', 'Orpin', 'worpinr0@tinyurl.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Collie', 'Brezlaw', 'cbrezlawr1@wired.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Rheba', 'Jenckes', 'rjenckesr2@facebook.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ilsa', 'Brownbill', 'ibrownbillr3@vistaprint.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Christiane', 'Jenken', 'cjenkenr4@webeden.co.uk');
insert into pasazerowie (imie, nazwisko, mail) values ('Garvey', 'Breem', 'gbreemr5@wikispaces.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Ulrica', 'Witchell', 'uwitchellr6@cloudflare.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Jenelle', 'Habbijam', 'jhabbijamr7@home.pl');
insert into pasazerowie (imie, nazwisko, mail) values ('Gaylord', 'Jephcott', 'gjephcottr8@jiathis.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Walsh', 'Gyurkovics', 'wgyurkovicsr9@facebook.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Damara', 'Verdun', 'dverdunra@sun.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Marcelline', 'Handyside', 'mhandysiderb@omniture.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Reuben', 'Butler', 'rbutlerrc@eventbrite.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Terese', 'Regnard', 'tregnardrd@prlog.org');
insert into pasazerowie (imie, nazwisko, mail) values ('Erich', 'Alders', 'ealdersre@ucoz.ru');
insert into pasazerowie (imie, nazwisko, mail) values ('Dominique', 'Aire', 'dairerf@stanford.edu');
insert into pasazerowie (imie, nazwisko, mail) values ('Elga', 'Jeynes', 'ejeynesrg@deviantart.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Irma', 'Spendlove', 'ispendloverh@jigsy.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Briny', 'Tisor', 'btisorri@wikia.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Karia', 'Barbery', 'kbarberyrj@sourceforge.net');
insert into pasazerowie (imie, nazwisko, mail) values ('Nadia', 'Abrashkin', 'nabrashkinrk@artisteer.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Peterus', 'Linde', 'plinderl@g.co');
insert into pasazerowie (imie, nazwisko, mail) values ('Germaine', 'Roder', 'groderrm@studiopress.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Sigismundo', 'Mc Caughen', 'smccaughenrn@shop-pro.jp');
insert into pasazerowie (imie, nazwisko, mail) values ('Yank', 'Ringsell', 'yringsellro@mapquest.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Curtice', 'Andrieu', 'candrieurp@etsy.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Pauline', 'Torvey', 'ptorveyrq@salon.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Isidore', 'Champneys', 'ichampneysrr@vinaora.com');
insert into pasazerowie (imie, nazwisko, mail) values ('Mieczysław', 'Zorro', 'tabaluga@vinaora.com');

INSERT INTO bilety (id_polaczenia, id_stacji_poczatkowej, id_stacji_koncowej, id_pasazera, data_zakupu, data_odjazdu, data_zwrotu) VALUES
(1, 1, 5, 101, '2025-05-01', '2025-05-05', NULL),
(1, 2, 6, 102, '2025-05-02', '2025-05-07', '2025-05-04'),
(2, 3, 7, 103, '2025-05-03', '2025-05-09', NULL),
(2, 1, 4, 104, '2025-05-04', '2025-05-12', NULL),
(3, 2, 6, 105, '2025-05-05', '2025-05-14', '2025-05-10'),
(3, 4, 8, 106, '2025-05-06', '2025-05-16', NULL),
(4, 1, 5, 107, '2025-05-07', '2025-05-19', NULL),
(4, 3, 7, 108, '2025-05-08', '2025-05-21', '2025-05-15'),
(5, 2, 6, 109, '2025-05-09', '2025-05-23', NULL),
(5, 1, 4, 110, '2025-05-10', '2025-05-26', NULL);

INSERT INTO bilety (id_polaczenia, id_stacji_poczatkowej, id_stacji_koncowej, id_pasazera, data_zakupu, data_odjazdu, data_zwrotu) VALUES
(1, 1, 5, 111, '2025-05-11', '2025-05-29', NULL),
(1, 2, 6, 112, '2025-05-12', '2025-06-02', '2025-05-28'),
(2, 3, 7, 113, '2025-05-13', '2025-06-04', NULL),
(2, 1, 4, 114, '2025-05-14', '2025-06-06', NULL),
(3, 2, 6, 115, '2025-05-15', '2025-06-08', '2025-06-05'),
(3, 4, 8, 116, '2025-05-16', '2025-06-10', NULL),
(4, 1, 5, 117, '2025-05-17', '2025-06-12', NULL),
(4, 3, 7, 118, '2025-05-18', '2025-06-14', '2025-06-11'),
(5, 2, 6, 119, '2025-05-19', '2025-06-16', NULL),
(5, 1, 4, 120, '2025-05-20', '2025-06-18', NULL),
(1, 1, 5, 121, '2025-05-21', '2025-06-20', NULL),
(1, 2, 6, 122, '2025-05-22', '2025-06-22', '2025-06-18'),
(2, 3, 7, 123, '2025-05-23', '2025-06-24', NULL),
(2, 1, 4, 124, '2025-05-24', '2025-06-26', NULL),
(3, 2, 6, 125, '2025-05-25', '2025-06-28', '2025-06-25'),
(3, 4, 8, 126, '2025-05-26', '2025-06-30', NULL),
(4, 1, 5, 127, '2025-05-27', '2025-07-02', NULL),
(4, 3, 7, 128, '2025-05-28', '2025-07-04', '2025-07-01'),
(5, 2, 6, 129, '2025-05-29', '2025-07-06', NULL),
(5, 1, 4, 130, '2025-05-30', '2025-07-08', NULL),
(1, 1, 5, 131, '2025-05-31', '2025-07-10', NULL),
(1, 2, 6, 132, '2025-06-01', '2025-07-12', '2025-07-09'),
(2, 3, 7, 133, '2025-06-02', '2025-07-14', NULL),
(2, 1, 4, 134, '2025-06-03', '2025-07-16', NULL),
(3, 2, 6, 135, '2025-06-04', '2025-07-18', '2025-07-15'),
(3, 4, 8, 136, '2025-06-05', '2025-07-20', NULL),
(4, 1, 5, 137, '2025-06-06', '2025-07-22', NULL),
(4, 3, 7, 138, '2025-06-07', '2025-07-24', '2025-07-21'),
(5, 2, 6, 139, '2025-06-08', '2025-07-26', NULL),
(5, 1, 4, 140, '2025-06-09', '2025-07-28', NULL),
(1, 1, 5, 141, '2025-06-10', '2025-07-30', NULL),
(1, 2, 6, 142, '2025-06-11', '2025-08-01', '2025-07-28'),
(2, 3, 7, 143, '2025-06-12', '2025-08-03', NULL),
(2, 1, 4, 144, '2025-06-13', '2025-08-05', NULL),
(3, 2, 6, 145, '2025-06-14', '2025-08-07', '2025-08-04'),
(3, 4, 8, 146, '2025-06-15', '2025-08-09', NULL),
(4, 1, 5, 147, '2025-06-16', '2025-08-11', NULL),
(4, 3, 7, 148, '2025-06-17', '2025-08-13', '2025-08-10'),
(5, 2, 6, 149, '2025-06-18', '2025-08-15', NULL),
(5, 1, 4, 150, '2025-06-19', '2025-08-17', NULL);

INSERT INTO bilety(id_polaczenia,id_stacji_poczatkowej,id_stacji_koncowej,id_pasazera,data_zakupu,data_odjazdu,data_zwrotu) VALUES
                (1,1,5,151,'2025-06-20','2025-08-19',NULL),(1,2,6,152,'2025-06-21','2025-08-21','2025-08-20'),(2,3,7,153,'2025-06-22','2025-08-23',NULL),
(2,1,4,154,'2025-06-23','2025-08-25',NULL),(3,2,6,155,'2025-06-24','2025-08-27','2025-08-26'),(3,4,8,156,'2025-06-25','2025-08-29',NULL),(4,1,5,157,'2025-06-26','2025-08-31',NULL),
(4,3,7,158,'2025-06-27','2025-09-02','2025-09-01'),(5,2,6,159,'2025-06-28','2025-09-04',NULL),(5,1,4,160,'2025-06-29','2025-09-06',NULL),(1,1,5,161,'2025-06-30','2025-09-08',NULL),
(1,2,6,162,'2025-07-01','2025-09-10','2025-09-09'),(2,3,7,163,'2025-07-02','2025-09-12',NULL),(2,1,4,164,'2025-07-03','2025-09-14',NULL),(3,2,6,165,'2025-07-04','2025-09-16','2025-09-15'),
(3,4,8,166,'2025-07-05','2025-09-18',NULL),(4,1,5,167,'2025-07-06','2025-09-20',NULL),(4,3,7,168,'2025-07-07','2025-09-22','2025-09-21'),(5,2,6,169,'2025-07-08','2025-09-24',NULL),
(5,1,4,170,'2025-07-09','2025-09-26',NULL),(1,1,5,171,'2025-07-10','2025-09-28',NULL),(1,2,6,172,'2025-07-11','2025-09-30','2025-09-29'),(2,3,7,173,'2025-07-12','2025-10-02',NULL),
(2,1,4,174,'2025-07-13','2025-10-04',NULL),(3,2,6,175,'2025-07-14','2025-10-06','2025-10-05'),(3,4,8,176,'2025-07-15','2025-10-08',NULL),(4,1,5,177,'2025-07-16','2025-10-10',NULL),
(4,3,7,178,'2025-07-17','2025-10-12','2025-10-11'),(5,2,6,179,'2025-07-18','2025-10-14',NULL),(5,1,4,180,'2025-07-19','2025-10-16',NULL),(1,1,5,181,'2025-07-20','2025-10-18',NULL),
(1,2,6,182,'2025-07-21','2025-10-20','2025-10-19'),(2,3,7,183,'2025-07-22','2025-10-22',NULL),(2,1,4,184,'2025-07-23','2025-10-24',NULL),(3,2,6,185,'2025-07-24','2025-10-26','2025-10-25'),
(3,4,8,186,'2025-07-25','2025-10-28',NULL),(4,1,5,187,'2025-07-26','2025-10-30',NULL),(4,3,7,188,'2025-07-27','2025-11-01','2025-10-31'),(5,2,6,189,'2025-07-28','2025-11-03',NULL),
(5,1,4,190,'2025-07-29','2025-11-05',NULL),(1,1,5,191,'2025-07-30','2025-11-07',NULL),(1,2,6,192,'2025-07-31','2025-11-09','2025-11-08'),(2,3,7,193,'2025-08-01','2025-11-11',NULL),
(2,1,4,194,'2025-08-02','2025-11-13',NULL),(3,2,6,195,'2025-08-03','2025-11-15','2025-11-14'),(3,4,8,196,'2025-08-04','2025-11-17',NULL),(4,1,5,197,'2025-08-05','2025-11-19',NULL),
(4,3,7,198,'2025-08-06','2025-11-21','2025-11-20'),(5,2,6,199,'2025-08-07','2025-11-23',NULL),(5,1,4,200,'2025-08-08','2025-11-25',NULL);
/*
INSERT INTO bilety_miejsca(id_biletu,nr_miejsca,id_wagonu,id_ulgi) VALUES
(1,1,1,1),(2,2,1,2),(3,3,1,1),
(4,4,2,2),(5,5,2,1),(6,6,2,3),
(7,7,3,2),(8,8,3,1),(9,9,3,2),
(10,10,4,3),(11,11,4,1),(12,12,4,2),
(13,13,5,3),(14,14,5,1),(15,15,5,2),
(16,16,1,1),(17,17,1,3),(18,18,1,2),
(19,19,2,1),(20,20,2,2),(21,21,2,3),
(22,22,3,1),(23,23,3,2),(24,24,3,3),
(25,25,4,1),(26,26,4,2),(27,27,4,3),
(28,28,5,1),(29,29,5,2),(30,30,5,3),
(31,31,1,1),(32,32,1,2),(33,33,1,3),
(34,34,2,1),(35,35,2,2),(36,36,2,3),
(37,37,3,1),(38,38,3,2),(39,39,3,3),
(40,40,4,1),(41,41,4,2),(42,42,4,3),
(43,43,5,1),(44,44,5,2),(45,45,5,3),
(46,46,1,1),(47,47,1,2),(48,48,1,3),
(49,49,2,1),(50,50,2,2),(51,1,1,1),
(52,2,1,2),(53,3,1,1),(54,4,2,2),
(55,5,2,1),(56,6,2,3),(57,7,3,2),
(58,8,3,1),(59,9,3,2),(60,10,4,3),
(61,11,4,1),(62,12,4,2),(63,13,5,3),
(64,14,5,1),(65,15,5,2),(66,16,1,1),
(67,17,1,3),(68,18,1,2),(69,19,2,1),
(70,20,2,2),(71,21,2,3),(72,22,3,1),
(73,23,3,2),(74,24,3,3),(75,25,4,1),
(76,26,4,2),(77,27,4,3),(78,28,5,1),
(79,29,5,2),(80,30,5,3),(81,31,1,1),
(82,32,1,2),(83,33,1,3),(84,34,2,1),
(85,35,2,2),(86,36,2,3),(87,37,3,1),
(88,38,3,2),(89,39,3,3),(90,40,4,1),
(91,41,4,2),(92,42,4,3),(93,43,5,1),
(94,44,5,2),(95,45,5,3),(96,46,1,1),
(97,47,1,2),(98,48,1,3),(99,49,2,1),(100,50,2,2);*/









