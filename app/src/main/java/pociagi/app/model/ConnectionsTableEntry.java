package pociagi.app.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

public record ConnectionsTableEntry(
        Integer id,
        String skad,
        String dokad,
        LocalDate date,
        LocalTime odjazd,
        LocalTime czas,
        BigDecimal koszt
) {
    public String getSkad() {return skad; }
    public String getDokad() {return dokad; }
    public LocalTime getOdjazd() { return odjazd;}
    public LocalTime getCzas() { return czas; }
    public BigDecimal getKoszt() { return koszt; }
    public Integer getId() { return id; }
    public LocalDate getDate() { return date; }
}
