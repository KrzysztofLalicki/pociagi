package pociagi.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReturningTicketDao {
        public void returnTicket(Integer id_biletu )
        {
            String sql = "UPDATE bilety SET data_zwrotu = current_date WHERE id_biletu=?;";


            try (Connection conn = DBManager.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, id_biletu);
                stmt.executeUpdate();
                System.out.println("Zwrot biletu o id " + id_biletu);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}
