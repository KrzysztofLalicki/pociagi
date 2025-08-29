package pociagi.app.model;

import java.time.LocalDate;
import java.time.LocalTime;

public record TicketsTableEntry(
        Integer id_biletu, LocalDate data_odjazdu, LocalTime godzina_odjazdu, LocalDate data_zwrotu, boolean czy_mozna_zwrocic) {
    public Integer getId_biletu() { return id_biletu; }
    public LocalDate getData_odjazdu() { return data_odjazdu; }
    public LocalDate getData_zwrotu() { return data_zwrotu; }
    public boolean getCzy_mozna_zwrocic() { return czy_mozna_zwrocic; }
    public LocalTime getGodzina_odjazdu() { return godzina_odjazdu; }
}
