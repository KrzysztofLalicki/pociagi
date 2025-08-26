package pociagi.app.dao;

import pociagi.app.model.PlaceRecord;
import pociagi.app.service.TicketFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketFreePlacesDao {
    public List<PlaceRecord> getFreePlaces(Integer klasa) {
        List<PlaceRecord> result = new ArrayList<PlaceRecord>();
        String sql = "SELECT nr_wagonu, nr_miejsca, nr_przedzialu FROM wszystkie_wolne_dla_polaczenia_dla_klasy(?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, TicketFactory.getActualPrzeazd().getId_polaczenia());
            stmt.setObject(2, TicketFactory.getActualPrzeazd().getDepartureDate());
            stmt.setInt(3, TicketFactory.getActualPrzeazd().getStartStation().getIdStacji());
            stmt.setInt(4, TicketFactory.getActualPrzeazd().getEndStation().getIdStacji());
            stmt.setInt(5, klasa);
            stmt.setObject(6, false);
            stmt.setObject(7, false);


            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                PlaceRecord entry = new PlaceRecord(
                        rs.getInt("nr_wagonu"),
                        rs.getInt("nr_miejsca"),
                        rs.getInt("nr_przedzialu")
                );
                result.add(entry);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging in production
        }

        return result;
    }
}
