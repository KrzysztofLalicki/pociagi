package pociagi.app.model;

import java.time.LocalDate;

public record TicketsTableEntry(
        Integer id_biletu, LocalDate data_zakupu, LocalDate data_zwrotu, boolean czy_mozna_zwrocic) {
    public Integer getId_biletu() { return id_biletu; }
    public LocalDate getData_zakupu() { return data_zakupu; }
    public LocalDate getData_zwrotu() { return data_zwrotu; }
    public boolean getCzy_mozna_zwrocic() { return czy_mozna_zwrocic; }
}
