BEGIN;

DROP TYPE IF EXISTS dzien_tygodnia CASCADE;
DROP TYPE IF EXISTS KLASA CASCADE;

CREATE TYPE dzien_tygodnia AS ENUM (
    'Poniedziałek',
    'Wtorek',
    'Środa',
    'Czwartek',
    'Piątek',
    'Sobota',
    'Niedziela'
);

CREATE TYPE KLASA AS ENUM('1','2');

DROP TABLE IF EXISTS bilety_miejsce CASCADE;
DROP TABLE IF EXISTS miejsca CASCADE;
DROP TABLE IF EXISTS przedzialy CASCADE;
DROP TABLE IF EXISTS swieta CASCADE;
DROP TABLE IF EXISTS wagony CASCADE;
DROP TABLE IF EXISTS polaczenia_wagony CASCADE;
DROP TABLE IF EXISTS stacje_posrednie CASCADE;
DROP TABLE IF EXISTS polaczenia CASCADE;
DROP TABLE IF EXISTS trasy CASCADE;
DROP TABLE IF EXISTS linie CASCADE;
DROP TABLE IF EXISTS stacje CASCADE;
DROP TABLE IF EXISTS pasazerowie CASCADE;
DROP TABLE IF EXISTS bilety CASCADE;
DROP TABLE IF EXISTS bilety_miejsca CASCADE;
DROP TABLE IF EXISTS ulgi CASCADE;
DROP TABLE IF EXISTS taryfy CASCADE;
DROP TABLE IF EXISTS harmonogramy CASCADE;

CREATE TABLE harmonogramy(
id_harmonogramu SERIAL PRIMARY KEY,
czy_robocze BOOLEAN NOT NULL,
czy_sobota BOOLEAN NOT NULL,
czy_niedziela BOOLEAN NOT NULL);

CREATE TABLE pasazerowie (
id_pasazera SERIAL PRIMARY KEY,
imie varchar NOT NULL,
nazwisko varchar NOT NULL,
mail varchar UNIQUE CHECK (mail LIKE '%@%.%')
);

CREATE TABLE stacje(
    id_stacji SERIAL PRIMARY KEY,
    nazwa VARCHAR(30) NOT NULL,
    tory INTEGER NOT NULL CHECK(tory > 0)
);

CREATE TABLE trasy (
    id_trasy SERIAL PRIMARY KEY,
    skad INTEGER NOT NULL REFERENCES stacje(id_stacji),
    dokad INTEGER NOT NULL REFERENCES stacje(id_stacji),
    czas INTERVAL NOT NULL CHECK(czas > INTERVAL '0 minutes')
);



CREATE TABLE linie (
    stacja1 INTEGER NOT NULL REFERENCES stacje(id_stacji),
    stacja2 INTEGER NOT NULL REFERENCES stacje(id_stacji),
    odleglosc INTEGER NOT NULL CHECK(odleglosc >0),
    PRIMARY KEY (stacja1, stacja2)
);

CREATE TABLE stacje_posrednie (
    id_trasy INTEGER REFERENCES trasy(id_trasy),
    id_stacji INTEGER REFERENCES stacje(id_stacji),
    przyjazd INTERVAL NOT NULL CHECK(przyjazd > INTERVAL '0 minutes'),
    odjazd INTERVAL NOT NULL CHECK(odjazd >= przyjazd),
    zatrzymanie BOOLEAN NOT NULL,
    tor INTEGER NOT NULL,
    PRIMARY KEY (id_trasy, id_stacji)
);

CREATE TABLE taryfy (
id_taryfy SERIAL PRIMARY KEY,
cena_za_km_kl1 NUMERIC(10,2) NOT NULL CHECK (cena_za_km_kl1 > 0),
cena_za_km_kl2 NUMERIC(10,2) NOT NULL CHECK (cena_za_km_kl2 > 0),
cena_za_rower NUMERIC(10,2) NOT NULL CHECK (cena_za_rower > 0)
);

CREATE TABLE historia_polaczenia (
    id_polaczenia INTEGER NOT NULL REFERENCES polaczenia(id_polaczenia),
    od DATE NOT NULL,
    do DATE,
    PRIMARY KEY (id_polaczenia, od)
);

CREATE TABLE polaczenia (
    id_polaczenia SERIAL PRIMARY KEY,
    id_trasy INTEGER NOT NULL REFERENCES trasy(id_trasy),
    godzina_startu TIME NOT NULL,
    id_harmonogramu INTEGER NOT NULL REFERENCES harmonogramy(id_harmonogramu),
    id_taryfy INTEGER NOT NULL REFERENCES taryfy(id_taryfy)
);


CREATE TABLE bilety (
id_biletu SERIAL PRIMARY KEY,
id_polaczenia INTEGER NOT NULL REFERENCES polaczenia (id_polaczenia),
id_stacji_poczatkowej INTEGER NOT NULL REFERENCES stacje (id_stacji),
id_stacji_koncowej INTEGER NOT NULL REFERENCES stacje (id_stacji),
id_pasazera INTEGER NOT NULL REFERENCES pasazerowie (id_pasazera),
data_zakupu date NOT NULL,
data_odjazdu date NOT NULL CHECK (data_zakupu <= data_odjazdu),
data_zwrotu date CHECK(data_zwrotu >= data_zakupu AND data_zwrotu <= data_odjazdu)
);

CREATE TABLE wagony(
    id_wagonu SERIAL PRIMARY KEY,
    klimatyzacja BOOLEAN NOT NULL,
    restauracyjny BOOLEAN NOT NULL
);

CREATE TABLE przedzialy(
    nr_przedzialu INTEGER CHECK(nr_przedzialu > 0),
    id_wagonu INTEGER REFERENCES wagony(id_wagonu),
    klasa KLASA NOT NULL,
    czy_zamkniety BOOLEAN NOT NULL,
    strefa_ciszy BOOLEAN NOT NULL,
    PRIMARY KEY (nr_przedzialu, id_wagonu)
);

CREATE TABLE miejsca(
    nr_miejsca INTEGER NOT NULL CHECK(nr_miejsca > 0),
    id_wagonu INTEGER NOT NULL,
    nr_przedzialu INTEGER NOT NULL CHECK(nr_przedzialu > 0),
    czy_dla_niepelnosprawnych BOOLEAN NOT NULL,
    czy_dla_rowerow BOOLEAN NOT NULL,
    PRIMARY KEY (nr_miejsca, id_wagonu),
    FOREIGN KEY (id_wagonu) REFERENCES wagony(id_wagonu),
    FOREIGN KEY (nr_przedzialu, id_wagonu) REFERENCES przedzialy(nr_przedzialu, id_wagonu)
);


CREATE TABLE ulgi (
id_ulgi SERIAL PRIMARY KEY,
nazwa varchar UNIQUE NOT NULL,
znizka int NOT NULL CHECK (znizka >= 0 AND znizka <= 100)
);

CREATE TABLE bilety_miejsca(
    id_biletu INTEGER NOT NULL REFERENCES bilety(id_biletu),
    nr_miejsca INTEGER NOT NULL,
    id_wagonu INTEGER UNIQUE NOT NULL,
    id_ulgi INTEGER NOT NULL REFERENCES ulgi(id_ulgi),
    PRIMARY KEY (id_biletu, nr_miejsca, id_wagonu),
    FOREIGN KEY (nr_miejsca, id_wagonu) REFERENCES miejsca(nr_miejsca, id_wagonu)
);

CREATE TABLE polaczenia_wagony(
    id_polaczenia INTEGER NOT NULL REFERENCES polaczenia(id_polaczenia),
    nr_wagonu INTEGER NOT NULL,
    id_wagonu INTEGER NOT NULL REFERENCES wagony(id_wagonu),
    PRIMARY KEY(id_polaczenia, id_wagonu)
);


INSERT INTO harmonogramy (czy_robocze, czy_sobota, czy_niedziela) VALUES
(TRUE, FALSE, FALSE),
(FALSE, TRUE, FALSE),
(FALSE, FALSE, TRUE),
(TRUE, TRUE, TRUE);

INSERT INTO pasazerowie (imie, nazwisko, mail) VALUES
('Jan', 'Kowalski', 'jan.kowalski@example.com'),
('Anna', 'Nowak', 'anna.nowak@example.org'),
('Piotr', 'Wiśniewski', 'piotr.wisniewski@example.net'),
('Maria', 'Dąbrowska', 'maria.dabrowska@example.com');

INSERT INTO stacje (nazwa, tory) VALUES
('Warszawa Centralna', 8),
('Kraków Główny', 6),
('Łódź Fabryczna', 3);

INSERT INTO trasy (skad, dokad, czas) VALUES
(1, 2, '02:30:00');

INSERT INTO linie (stacja1, stacja2, odleglosc) VALUES
(1, 3, 130),
(2, 3, 200);


INSERT INTO stacje_posrednie (id_trasy, id_stacji, przyjazd, odjazd, zatrzymanie, tor) VALUES
(1, 3, '01:15:00', '01:20:00', TRUE, 3);

INSERT INTO taryfy (cena_za_km_kl1, cena_za_km_kl2, cena_za_rower) VALUES
(0.30, 0.20, 10.00),
(0.35, 0.25, 12.00),
(0.40, 0.30, 15.00);

INSERT INTO polaczenia (id_trasy, godzina_startu, id_harmonogramu, id_taryfy) VALUES
(1, '06:00:00', 1, 1),
(1, '08:30:00', 1, 2),
(1, '10:15:00', 2, 1);

INSERT INTO wagony (klimatyzacja, restauracyjny) VALUES
(TRUE, FALSE),
(TRUE, FALSE),
(FALSE, FALSE),
(TRUE, TRUE),
(FALSE, FALSE),
(TRUE, FALSE),
(FALSE, TRUE);

INSERT INTO przedzialy (nr_przedzialu, id_wagonu, klasa, czy_zamkniety, strefa_ciszy) VALUES
(1, 1, '1', FALSE, TRUE),
(2, 1, '1', FALSE, FALSE),
(1, 2, '2', FALSE, FALSE),
(2, 2, '2', FALSE, FALSE),
(1, 3, '2', TRUE, FALSE),
(1, 4, '1', FALSE, TRUE),
(2, 4, '1', FALSE, TRUE),
(1, 5, '2', FALSE, FALSE),
(1, 6, '1', FALSE, TRUE),
(1, 7, '2', FALSE, FALSE);

INSERT INTO miejsca (nr_miejsca, id_wagonu, nr_przedzialu, czy_dla_niepelnosprawnych, czy_dla_rowerow) VALUES
(1, 1, 1, FALSE, FALSE),
(2, 1, 1, TRUE, FALSE),
(3, 1, 1, FALSE, FALSE),
(1, 2, 1, FALSE, TRUE),
(2, 2, 1, FALSE, FALSE),
(3, 2, 1, FALSE, FALSE),
(1, 3, 1, FALSE, FALSE),
(2, 3, 1, FALSE, FALSE),
(1, 4, 1, TRUE, FALSE),
(2, 4, 1, FALSE, FALSE),
(3, 4, 1, FALSE, FALSE),
(4, 4, 2, FALSE, FALSE),
(1, 5, 1, FALSE, FALSE),
(2, 5, 1, FALSE, TRUE),
(1, 6, 1, FALSE, FALSE),
(2, 6, 1, FALSE, FALSE),
(1, 7, 1, FALSE, FALSE),
(2, 7, 1, FALSE, FALSE);

INSERT INTO ulgi (nazwa, znizka) VALUES
('Normalny', 0),
('Studencki', 51),
('Senior', 37),
('Dziecięcy', 50),
('Niepełnosprawny', 49);

INSERT INTO bilety (id_polaczenia, id_stacji_poczatkowej, id_stacji_koncowej, id_pasazera, data_zakupu, data_odjazdu) VALUES
(1, 1, 2, 1, '2023-05-01', '2023-05-02'),
(2, 1, 3, 2, '2023-05-01', '2023-05-03'),
(3, 1, 2, 3, '2023-05-02', '2023-05-04'),
(2, 1, 3, 4, '2023-05-03', '2023-05-05'),
(1, 1, 2, 1, '2023-05-04', '2023-05-06');

INSERT INTO bilety_miejsca (id_biletu, nr_miejsca, id_wagonu, id_ulgi) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 3),
(4, 1, 4, 1),
(5, 2, 5, 4);

INSERT INTO polaczenia_wagony (id_polaczenia, nr_wagonu, id_wagonu) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(2, 1, 4),
(2, 2, 5),
(3, 1, 6),
(3, 2, 7);

CREATE TABLE tmp_names (name varchar NOT NULL, male bool NOT NULL, UNIQUE(name, male));
INSERT INTO tmp_names(name, male) VALUES
    ('Antoni', TRUE), ('Jan', TRUE), ('Aleksander', TRUE), ('Jakub', TRUE), ('Franciszek', TRUE),
    ('Szymon', TRUE), ('Mikołaj', TRUE), ('Leon', TRUE), ('Nikodem', TRUE), ('Filip', TRUE),
    ('Zuzanna', FALSE), ('Julia', FALSE), ('Maja', FALSE), ('Zofia', FALSE), ('Hanna', FALSE),
    ('Lena', FALSE), ('Alicja', FALSE), ('Oliwia', FALSE), ('Maria', FALSE), ('Amelia', FALSE);

CREATE TABLE tmp_surnames (surname varchar NOT NULL, male bool NOT NULL, UNIQUE(surname, male));
INSERT INTO tmp_surnames(surname, male) VALUES
  ('Nowak', TRUE), ('Kowalski', TRUE), ('Wiśniewski', TRUE), ('Wójcik', TRUE), ('Kowalczyk', TRUE),
  ('Kamiński', TRUE), ('Lewandowski', TRUE), ('Zieliński', TRUE), ('Szymański', TRUE), ('Woźniak', TRUE),
  ('Nowak', FALSE), ('Kowalska', FALSE), ('Wiśniewska', FALSE), ('Wójcik', FALSE), ('Kowalczyk', FALSE),
  ('Kamińska', FALSE), ('Lewandowska', FALSE), ('Zielińska', FALSE), ('Szymańska', FALSE), ('Woźniak', FALSE);

INSERT INTO pasazerowie (imie, nazwisko, mail)
SELECT name, surname, LOWER(TRANSLATE(name || '@' ||  surname || '.pl', 'ąęółśżźćń', 'aeolszzcn'))
FROM tmp_names n JOIN tmp_surnames s ON n.male = s.male ORDER BY random();

DROP TABLE tmp_names;
DROP TABLE tmp_surnames;

COMMIT;
