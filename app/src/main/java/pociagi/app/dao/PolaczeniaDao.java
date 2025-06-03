package pociagi.app.dao;

import pociagi.app.model.Polaczenie;

import java.sql.*;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class PolaczeniaDao {
    public List<Polaczenie> findDostepnePolaczenia(int idStacjiStart, int idStacjiKoniec, LocalDate dataOdjazdu) {
        List<Polaczenie> result = new ArrayList<>();

        String sql = "SELECT * FROM dostepne_polaczenia_z_wolnymi_miejscami(?, ?, ?)";

        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idStacjiStart);
            stmt.setInt(2, idStacjiKoniec);
            stmt.setDate(3, Date.valueOf(dataOdjazdu));

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int idPolaczenia = rs.getInt("id_polaczenia");
                    LocalTime godzinaOdjazdu = rs.getTime("godzina_odjazdu").toLocalTime();


                    String czasPrzejazdu = rs.getString("czas_przejazdu");

                    LocalDate dataWyjazdu = rs.getDate("data_wyjazdu").toLocalDate();

                    Polaczenie p = new Polaczenie(idPolaczenia, godzinaOdjazdu, czasPrzejazdu, dataWyjazdu);
                    result.add(p);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

}
