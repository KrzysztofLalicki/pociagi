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

drop function if exists wszystkie_wolne_dla_polaczenia_dla_klasy(integer, date, integer, integer, integer);

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

drop function if exists szukaj_polaczenia(varchar, varchar, integer, integer, date, time);

drop function if exists godzina_odjazdu(integer, integer);

drop function if exists czy_do_zwrotu(integer);

drop function if exists wszystkie_bilety(integer);

drop function if exists cena_przejazdu(integer, integer, date, integer, integer, integer, integer, integer);

drop function if exists get_edges(integer, timestamp);

drop function if exists search_routes_with_transfers(integer, integer, timestamp);


