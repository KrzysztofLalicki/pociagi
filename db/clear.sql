-- 1_tables.sql
--BEGIN;
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

-- 2_triggers.sql
DROP FUNCTION sprawdz_ceny CASCADE;
DROP FUNCTION sprawdz_droge CASCADE;
DROP FUNCTION sprawdz_przystanek CASCADE;
DROP FUNCTION sprawdz_polaczenie CASCADE;
DROP FUNCTION sprawdz_zwrot CASCADE;
DROP FUNCTION sprawdz_przejazd CASCADE;
DROP FUNCTION  IF EXISTS sprawdz_miejsce CASCADE;
DROP FUNCTION sprawdz_date CASCADE;
-- 3_functions.sql
drop function stacje_na_polaczeniu(integer);

drop function dlugosc_drogi(integer, integer, integer);

drop function czy_sa_stacje_na_polaczeniu(integer, integer, integer);

drop function oblicz_godzine_odjazdu(integer, integer);

drop function oblicz_godzine_przyjazdu(integer, integer);

drop function dostepne_polaczenia(integer, integer);

drop function dostepne_polaczenia_dzien_aktualnosc(integer, integer, date);

drop function czy_dzien_to_swieto(date);

drop function wszystkie_miejsca_polaczenie(integer);

drop function czy_miejsce_wolne(integer, date, integer, integer, integer, integer);

drop function wszystkie_wolne_dla_polaczenia_dla_klasy(integer, date, integer, integer, integer);

drop function czas_trasy(integer, integer, integer);

drop function koszt_przejazdu(integer, boolean, integer, integer, integer, integer, date);

drop function szukaj_polaczenia(varchar, varchar, integer, integer, date, time);

drop function losuj_data_odjazdu_dla_polaczenia(integer, date, date);

drop function polaczenia_wraz_z_dana_stacja(integer);

drop function get_nazwa_stacji(integer);

drop function is_harmonogram_active(integer, date);

drop function swieto(date);

drop function is_poloczenie_active(integer, date);

drop function get_timetable(integer, date);

drop function get_stacje_by_prefix(text);

drop function cena_przejazdu(integer,id_pol integer, dzien date, id_start integer, id_koniec integer, number_of_one integer, number_of_two integer, number_of_bikes integer);

drop function czy_do_zwrotu(bilet integer);


drop function godzina_odjazdu(id integer, id_s integer);

drop function wszystkie_bilety(user_id integer);

--COMMIT;