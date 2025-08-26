package pociagi.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeletingFromTicketPlacesDao {
    public void deleteFromTicketPlaces(Integer id_przejazdu){
        String sql = "DELETE FROM bilety_miejsca WHERE id_przejazdu=?;";



        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id_przejazdu);
            stmt.executeUpdate();
            System.out.println("Usunięcie biletów z przejazdu " + id_przejazdu);

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
