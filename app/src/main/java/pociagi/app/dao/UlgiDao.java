package pociagi.app.dao;

import pociagi.app.model.ConnectionsTableEntry;
import pociagi.app.model.UlgiTableEntry;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UlgiDao {
    public List<UlgiTableEntry> getUlgiTable() {
        List<UlgiTableEntry> result = new ArrayList<>();

        String sql = "SELECT * FROM ulgi";
        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                UlgiTableEntry entry = new UlgiTableEntry(
                        rs.getInt("id_ulgi"),
                        rs.getString("nazwa"),
                        rs.getInt("znizka")
                );
                result.add(entry);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
