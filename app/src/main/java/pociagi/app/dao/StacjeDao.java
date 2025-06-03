package pociagi.app.dao;

import pociagi.app.model.Stacja;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StacjeDao {
    public List<Stacja> findByPrefix(String prefix) {
        List<Stacja> result = new ArrayList<>();
        String sql = "SELECT * FROM get_stacje_by_prefix(?)";

        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, prefix.toLowerCase() + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Stacja stacja = new Stacja(
                        rs.getInt("id_stacji"),
                        rs.getString("nazwa"),
                        rs.getInt("tory")
                );
                result.add(stacja);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Replace with better error handling/logging
        }

        return result;
    }
}
