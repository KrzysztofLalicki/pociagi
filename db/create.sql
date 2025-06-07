BEGIN;

CREATE TABLE harmonogramy(
    id_harmonogramu SERIAL PRIMARY KEY,
    czy_tydzien BOOLEAN[7] NOT NULL,
    czy_swieta BOOLEAN NOT NULL,
    UNIQUE (czy_tydzien, czy_swieta)
);

CREATE TABLE pasazerowie (
    id_pasazera SERIAL PRIMARY KEY,
    imie VARCHAR NOT NULL,
    nazwisko VARCHAR NOT NULL,
    email VARCHAR UNIQUE CHECK (email LIKE '%@%.%')
);

CREATE TABLE stacje(
    id_stacji SERIAL PRIMARY KEY,
    nazwa VARCHAR UNIQUE NOT NULL,
    tory INT NOT NULL CHECK(tory > 0)
);

CREATE TABLE linie (
    stacja1 INT NOT NULL REFERENCES stacje,
    stacja2 INT NOT NULL REFERENCES stacje CHECK (stacja2 != stacja1),
    odleglosc INT NOT NULL CHECK (odleglosc > 0),
    PRIMARY KEY (stacja1, stacja2)
);

CREATE TABLE przewoznicy (
    id_przewoznika SERIAL PRIMARY KEY,
    nazwa_przewoznika VARCHAR UNIQUE NOT NULL
);

CREATE TABLE historia_cen (
    id_przewoznika INT REFERENCES przewoznicy,
    data_od DATE NOT NULL,
    data_do DATE NOT NULL CHECK (data_do >= data_od),
    cena_za_km_kl1 NUMERIC(10,2) NOT NULL CHECK (cena_za_km_kl1 > 0),
    cena_za_km_kl2 NUMERIC(10,2) NOT NULL CHECK (cena_za_km_kl2 > 0),
    cena_za_rower NUMERIC(10,2) NOT NULL CHECK (cena_za_rower > 0),
    PRIMARY KEY (id_przewoznika, data_od)
);

CREATE TABLE polaczenia (
    id_polaczenia SERIAL PRIMARY KEY,
    godzina_startu TIME NOT NULL,
    id_harmonogramu INT NOT NULL REFERENCES harmonogramy,
    id_przewoznika INT NOT NULL REFERENCES przewoznicy
);

CREATE TABLE stacje_posrednie (
    id_polaczenia INT REFERENCES polaczenia,
    id_stacji INT REFERENCES stacje,
    przyjazd INT,
    odjazd INT CHECK (przyjazd IS NULL OR odjazd IS NULL OR odjazd >= przyjazd),
    zatrzymanie BOOLEAN NOT NULL,
    tor INT NOT NULL,
    PRIMARY KEY (id_polaczenia, id_stacji)
);

CREATE TABLE historia_polaczenia (
    id_polaczenia INT NOT NULL REFERENCES polaczenia,
    data_od DATE NOT NULL,
    data_do DATE NOT NULL CHECK (data_do >= data_od),
    PRIMARY KEY (id_polaczenia, data_od)
);

CREATE TABLE bilety (
    id_biletu SERIAL PRIMARY KEY,
    id_pasazera INT NOT NULL REFERENCES pasazerowie (id_pasazera),
    data_zakupu DATE NOT NULL,
    data_zwrotu DATE CHECK(data_zwrotu >= data_zakupu)
);

CREATE TABLE przejazdy (
    id_przejazdu SERIAL PRIMARY KEY,
    id_biletu INT NOT NULL REFERENCES bilety,
    id_polaczenia INT NOT NULL REFERENCES polaczenia,
    data_odjazdu DATE NOT NULL,
    id_stacji_poczatkowej INT NOT NULL REFERENCES stacje,
    id_stacji_koncowej INT NOT NULL REFERENCES stacje CHECK (id_stacji_koncowej != id_stacji_poczatkowej)
);

CREATE TABLE wagony(
    id_wagonu SERIAL PRIMARY KEY,
    klimatyzacja BOOLEAN NOT NULL,
    restauracyjny BOOLEAN NOT NULL
);

CREATE TABLE przedzialy (
    nr_przedzialu INT CHECK (nr_przedzialu > 0),
    id_wagonu INT NOT NULL REFERENCES wagony,
    klasa INT NOT NULL CHECK (klasa IN (1, 2)),
    czy_zamkniety BOOLEAN NOT NULL,
    strefa_ciszy BOOLEAN NOT NULL,
    PRIMARY KEY (nr_przedzialu, id_wagonu)
);

CREATE TABLE miejsca(
    nr_miejsca INT NOT NULL CHECK (nr_miejsca > 0),
    id_wagonu INT NOT NULL REFERENCES wagony (id_wagonu),
    nr_przedzialu INT NOT NULL CHECK(nr_przedzialu > 0),
    czy_dla_niepelnosprawnych BOOLEAN NOT NULL,
    czy_dla_rowerow BOOLEAN NOT NULL,
    PRIMARY KEY (nr_miejsca, id_wagonu),
    FOREIGN KEY (nr_przedzialu, id_wagonu) REFERENCES przedzialy(nr_przedzialu, id_wagonu)
);

CREATE TABLE ulgi (
    id_ulgi SERIAL PRIMARY KEY,
    nazwa VARCHAR UNIQUE NOT NULL,
    znizka INT NOT NULL CHECK (znizka >= 0 AND znizka <= 100)
);

CREATE TABLE polaczenia_wagony (
    id_polaczenia INT NOT NULL REFERENCES polaczenia,
    nr_wagonu INT NOT NULL,
    id_wagonu INT NOT NULL REFERENCES wagony,
    PRIMARY KEY (id_polaczenia, nr_wagonu)
);

CREATE TABLE bilety_miejsca(
    id_przejazdu INT NOT NULL REFERENCES przejazdy,
    nr_wagonu INT NOT NULL,
    nr_miejsca INT NOT NULL,
    id_ulgi INT REFERENCES ulgi(id_ulgi)
);

CREATE TABLE swieta_stale (
    nazwa VARCHAR UNIQUE NOT NULL,
    dzien INT NOT NULL CHECK (dzien > 0 AND dzien <= 31),
    miesiac INT NOT NULL CHECK (miesiac > 0 AND miesiac < 12),
    UNIQUE (dzien, miesiac)
);

CREATE TABLE swieta_ruchome (
    id_swieta SERIAL PRIMARY KEY,
    nazwa VARCHAR UNIQUE NOT NULL
);

CREATE TABLE daty_swiat (
    id_swieta INT REFERENCES swieta_ruchome,
    data DATE,
    PRIMARY KEY (id_swieta, data)
);

COMMIT;