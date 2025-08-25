package pociagi.app.dao;

import pociagi.app.model.ConnectionsTableEntry;
import pociagi.app.model.Place;
import pociagi.app.service.TicketFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketFreePlacesDao {
    public List<Place> getFreePlaces(Integer klasa) {
        List<Place> result = new ArrayList<Place>();
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
                Place entry = new Place(
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
