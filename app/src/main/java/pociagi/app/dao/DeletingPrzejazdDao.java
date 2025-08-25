package pociagi.app.dao;

import pociagi.app.service.Przejazd;
import pociagi.app.service.TicketFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeletingPrzejazdDao {
    public void delete(Przejazd przejazd) {
        String sql = "DELETE FROM przejazdy WHERE id_przejazdu=?";


        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, przejazd.getId_przejazdu());
            stmt.executeUpdate();
            System.out.println("Usunięcie przejazdu o id: " + String.valueOf(przejazd.getId_przejazdu()));

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
