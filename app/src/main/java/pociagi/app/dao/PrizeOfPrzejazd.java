package pociagi.app.dao;

import pociagi.app.service.Place;
import pociagi.app.service.Przejazd;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class PrizeOfPrzejazd {
    public BigDecimal Prize(Przejazd przejazd) {
        String sql = "SELECT cena_przejazdu(?,?,?,?,?,?,?,?)";

        int numbers_of_bikes = 0;
        for (Place place : przejazd.getPlacesOne()) {
            if (place.czy_z_rowerem()) numbers_of_bikes++;
        }
        for (Place place : przejazd.getPlacesTwo()) {
            if (place.czy_z_rowerem()) numbers_of_bikes++;
        }

        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, przejazd.getId_przejazdu());
            stmt.setInt(2, przejazd.getId_polaczenia());

            // LocalDate -> java.sql.Date
            stmt.setDate(3, java.sql.Date.valueOf(przejazd.getDepartureDate()));

            stmt.setInt(4, przejazd.getStartStation().getIdStacji());
            stmt.setInt(5, przejazd.getEndStation().getIdStacji());
            stmt.setInt(6, przejazd.getNumberOfPlacesOne());
            stmt.setInt(7, przejazd.getNumberOfPlacesTwo());
            stmt.setInt(8, numbers_of_bikes);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getBigDecimal(1); // wynik funkcji
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // jeśli coś poszło nie tak
    }
}
