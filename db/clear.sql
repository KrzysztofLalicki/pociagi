-- 1_tables.sql
BEGIN;

DROP TABLE IF EXISTS harmonogramy CASCADE;
DROP TABLE IF EXISTS pasazerowie CASCADE;
DROP TABLE IF EXISTS stacje CASCADE;
DROP TABLE IF EXISTS linie CASCADE;
DROP TABLE IF EXISTS przewoznicy CASCADE;
DROP TABLE IF EXISTS historia_cen CASCADE;
DROP TABLE IF EXISTS polaczenia CASCADE;
DROP TABLE IF EXISTS stacje_posrednie CASCADE;
DROP TABLE IF EXISTS historia_polaczenia CASCADE;
DROP TABLE IF EXISTS bilety CASCADE;
DROP TABLE IF EXISTS przejazdy CASCADE;
DROP TABLE IF EXISTS wagony CASCADE;
DROP TABLE IF EXISTS przedzialy CASCADE;
DROP TABLE IF EXISTS miejsca CASCADE;
DROP TABLE IF EXISTS ulgi CASCADE;
DROP TABLE IF EXISTS bilety_miejsca CASCADE;
DROP TABLE IF EXISTS polaczenia_wagony CASCADE;
DROP TABLE IF EXISTS swieta_stale CASCADE;
DROP TABLE IF EXISTS swieta_ruchome CASCADE;
DROP TABLE IF EXISTS daty_swiat CASCADE;

drop table if exists p_q;
drop table if exists d;
drop table if exists prev;

COMMIT;
-- 2_triggers.sql
drop function if exists sprawdz_ceny cascade;
drop function if exists sprawdz_droge cascade;
drop function if exists sprawdz_przystanek cascade;
drop function if exists sprawdz_polaczenie cascade;
drop function if exists sprawdz_zwrot cascade;
drop function if exists sprawdz_przejazd cascade;
drop function if exists sprawdz_miejsce cascade;
drop function if exists sprawdz_date cascade;
-- 3_functions.sql
drop function if exists stacje_na_polaczeniu(integer);

drop function if exists dlugosc_drogi(integer, integer, integer);

drop function if exists czy_sa_stacje_na_polaczeniu(integer, integer, integer);

drop function if exists oblicz_godzine_odjazdu(integer, integer);

drop function if exists oblicz_godzine_przyjazdu(integer, integer);

drop function if exists dostepne_polaczenia(integer, integer);

drop function if exists dostepne_polaczenia_dzien_aktualnosc(integer, integer, date);

drop function if exists czy_dzien_to_swieto(date);

drop function if exists wszystkie_miejsca_polaczenie(integer);

drop function if exists czy_miejsce_wolne(integer, date, integer, integer, integer, integer);

drop function if exists wszystkie_wolne_dla_polaczenia_dla_klasy(integer, date, integer, integer, integer, boolean, boolean);

drop function if exists czas_trasy(integer, integer, integer);

drop function if exists koszt_przejazdu(integer, boolean, integer, integer, integer, integer, date);

drop function if exists szukaj_polaczenia(varchar, varchar, integer, integer, date, time, boolean, boolean);

drop function if exists losuj_data_odjazdu_dla_polaczenia(integer, date, date);

drop function if exists polaczenia_wraz_z_dana_stacja(integer);

drop function if exists get_nazwa_stacji(integer);

drop function if exists is_harmonogram_active(integer, date);

drop function if exists swieto(date);

drop function if exists is_polaczenie_active(integer, date);

drop function if exists get_timetable(integer, date);

drop function if exists get_stacje_by_prefix(text);

drop function if exists get_edges(integer, timestamp);

drop function if exists dijkstra(integer, integer, timestamp)

