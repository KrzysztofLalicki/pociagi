package pociagi.app.dao;

import pociagi.app.model.ConnectionsTableEntry;
import pociagi.app.model.TicketsTableEntry;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountTickets {
    public List<TicketsTableEntry> getTicketsTableEntry(int user_id) {
        List<TicketsTableEntry> result = new ArrayList<>();
        String sql = "SELECT * FROM wszystkie_bilety(?);";

        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, user_id);


            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                TicketsTableEntry entry = new TicketsTableEntry(
                        rs.getInt(1),
                        rs.getDate(2).toLocalDate() ,
                        rs.getTime(3).toLocalTime(),
                        rs.getDate(4) == null ? null : rs.getDate(4).toLocalDate(),
                        rs.getBoolean(5)
                );
                result.add(entry);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging in production
        }

        return result;

    }
}
