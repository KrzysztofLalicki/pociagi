package pociagi.app.model;

import java.time.LocalTime;

public record TimetableEntry(
        int idTrasy,
        String skad,
        String dokad,
        LocalTime przyjazd,
        LocalTime odjazd
) {
    public int getIdTrasy() { return idTrasy; }
    public String getSkad() { return skad; }
    public String getDokad() { return dokad; }
    public LocalTime getPrzyjazd() { return przyjazd; }
    public LocalTime getOdjazd() { return odjazd; }

}