package pociagi.app.model;

import java.time.LocalDate;
import java.time.LocalTime;

public record Polaczenie(
        int idPolaczenia,
        LocalTime godzinaOdjazdu,
        String czasPrzejazdu,
        LocalDate dataWyjazdu
) {
    public int getIdPolaczenia() {
        return idPolaczenia;
    }

    public LocalTime getGodzinaOdjazdu() {
        return godzinaOdjazdu;
    }

    public String getCzasPrzejazdu() {
        return czasPrzejazdu;
    }

    public LocalDate getDataWyjazdu() {
        return dataWyjazdu;
    }
}
