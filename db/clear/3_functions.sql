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

drop function wszystkie_wolne_dla_polaczenia_dla_klasy(integer, date, integer, integer, integer, boolean, boolean);

drop function czas_trasy(integer, integer, integer);

drop function koszt_przejazdu(integer, boolean, integer, integer, integer, integer, date);

drop function szukaj_polaczenia(varchar, varchar, integer, integer, date, time, boolean, boolean);

drop function losuj_data_odjazdu_dla_polaczenia(integer, date, date);

drop function polaczenia_wraz_z_dana_stacja(integer);

drop function get_nazwa_stacji(integer);

drop function is_harmonogram_active(integer, date);

drop function swieto(date);

drop function is_poloczenie_active(integer, date);

drop function get_timetable(integer, date);

drop function get_stacje_by_prefix(text);

drop function get_edges(integer, timestamp);

drop function dijkstra(integer, integer, timestamp)
