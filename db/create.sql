BEGIN;

DROP TYPE IF EXISTS dzien_tygodnia CASCADE;

CREATE TYPE dzien_tygodnia AS ENUM (
    'Poniedziałek',
    'Wtorek',
    'Środa',
    'Czwartek',
    'Piątek',
    'Sobota',
    'Niedziela'
);

DROP TABLE IF EXISTS miejsca CASCADE;
DROP TABLE IF EXISTS przedzialy;
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
DROP TABLE IF EXISTS harmonogramy CASCADE;
DROP TABLE IF EXISTS przewoznicy CASCADE;
DROP TABLE IF EXISTS historia_cen CASCADE;
DROP TABLE IF EXISTS historia_polaczenia CASCADE;



CREATE TABLE harmonogramy(
id_harmonogramu SERIAL PRIMARY KEY,
czy_poniedzialek BOOLEAN DEFAULT FALSE,
czy_wtorek BOOLEAN DEFAULT FALSE,
czy_sroda BOOLEAN DEFAULT FALSE,
czy_czwartek BOOLEAN DEFAULT FALSE,
czy_piatek BOOLEAN DEFAULT FALSE,
czy_sobota BOOLEAN DEFAULT FALSE,
czy_niedziela BOOLEAN DEFAULT FALSE,
UNIQUE(czy_poniedzialek, czy_wtorek, czy_sroda, czy_czwartek, czy_piatek, czy_sobota, czy_niedziela)
);

CREATE TABLE pasazerowie (
id_pasazera SERIAL PRIMARY KEY,
imie varchar NOT NULL,
nazwisko varchar NOT NULL,
mail varchar UNIQUE CHECK (mail LIKE '%@%.%')
);

CREATE TABLE stacje(
    id_stacji SERIAL PRIMARY KEY,
    nazwa VARCHAR UNIQUE NOT NULL,
    tory INTEGER NOT NULL CHECK(tory > 0)
);

CREATE TABLE trasy (
    id_trasy SERIAL PRIMARY KEY,
    skad INTEGER NOT NULL REFERENCES stacje(id_stacji),
    dokad INTEGER NOT NULL REFERENCES stacje(id_stacji)
        CHECK(skad != dokad),
    czas INTERVAL NOT NULL CHECK(czas > INTERVAL '0 minutes')
);

CREATE TABLE linie (
    stacja1 INTEGER NOT NULL REFERENCES stacje(id_stacji),
    stacja2 INTEGER NOT NULL REFERENCES stacje(id_stacji)
        CHECK(stacja1 != stacja2),
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

CREATE TABLE przewoznicy (
id_przewoznika SERIAL PRIMARY KEY,
nazwa_przewoznika VARCHAR
);

CREATE TABLE historia_cen (
id_przewoznika INTEGER,
data_od DATE NOT NULL,
data_do DATE,
cena_za_km_kl1 NUMERIC(10,2) NOT NULL CHECK (cena_za_km_kl1 > 0),
cena_za_km_kl2 NUMERIC(10,2) NOT NULL CHECK (cena_za_km_kl2 > 0),
cena_za_rower NUMERIC(10,2) NOT NULL CHECK (cena_za_rower > 0),
PRIMARY KEY(id_przewoznika, data_od),
    CONSTRAINT fk_historia_przewoznik
        FOREIGN KEY (id_przewoznika)
        REFERENCES przewoznicy(id_przewoznika)
        DEFERRABLE INITIALLY DEFERRED
);

CREATE TABLE polaczenia (
    id_polaczenia SERIAL PRIMARY KEY,
    id_trasy INTEGER NOT NULL,
    godzina_startu TIME NOT NULL,
    id_harmonogramu INTEGER NOT NULL,
    id_przewoznika INTEGER NOT NULL,
    CONSTRAINT fk_polaczenia_trasy FOREIGN KEY (id_trasy)
        REFERENCES trasy(id_trasy)
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT fk_polaczenia_harmonogram FOREIGN KEY (id_harmonogramu)
        REFERENCES harmonogramy(id_harmonogramu)
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT fk_polaczenia_przewoznik FOREIGN KEY (id_przewoznika)
        REFERENCES przewoznicy(id_przewoznika)
        DEFERRABLE INITIALLY DEFERRED
);

CREATE TABLE historia_polaczenia (
    id_polaczenia INTEGER NOT NULL,
    data_od DATE NOT NULL,
    data_do DATE,
    PRIMARY KEY (id_polaczenia, data_od),
    CONSTRAINT fk_historia_polaczenia_polaczenia
        FOREIGN KEY (id_polaczenia)
        REFERENCES polaczenia(id_polaczenia)
        DEFERRABLE INITIALLY DEFERRED
);

CREATE TABLE bilety (
id_biletu SERIAL PRIMARY KEY,
id_polaczenia INTEGER NOT NULL REFERENCES polaczenia (id_polaczenia),
id_stacji_poczatkowej INTEGER NOT NULL REFERENCES stacje (id_stacji),
id_stacji_koncowej INTEGER NOT NULL REFERENCES stacje (id_stacji)
    CHECK(id_stacji_poczatkowej != id_stacji_koncowej),
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

CREATE TABLE przedzialy (
    nr_przedzialu INTEGER CHECK(nr_przedzialu > 0),
    id_wagonu INTEGER NOT NULL,
    klasa INTEGER NOT NULL CHECK (klasa IN (1, 2)),
    czy_zamkniety BOOLEAN NOT NULL,
    strefa_ciszy BOOLEAN NOT NULL,
    PRIMARY KEY (nr_przedzialu, id_wagonu),
    CONSTRAINT fk_przedzialy_wagony FOREIGN KEY (id_wagonu)
        REFERENCES wagony(id_wagonu)
        DEFERRABLE INITIALLY DEFERRED
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
    id_wagonu INTEGER NOT NULL,
    id_ulgi INTEGER REFERENCES ulgi(id_ulgi),
    PRIMARY KEY (id_biletu, nr_miejsca, id_wagonu),
    FOREIGN KEY (nr_miejsca, id_wagonu) REFERENCES miejsca(nr_miejsca, id_wagonu)
);

CREATE TABLE polaczenia_wagony (
    id_polaczenia INTEGER NOT NULL,
    nr_wagonu INTEGER NOT NULL,
    id_wagonu INTEGER NOT NULL,
    PRIMARY KEY (id_polaczenia, id_wagonu),
    CONSTRAINT fk_polaczenia_wagony_polaczenia FOREIGN KEY (id_polaczenia)
        REFERENCES polaczenia(id_polaczenia)
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT fk_polaczenia_wagony_wagony FOREIGN KEY (id_wagonu)
        REFERENCES wagony(id_wagonu)
        DEFERRABLE INITIALLY DEFERRED
);
