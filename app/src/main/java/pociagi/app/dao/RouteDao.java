package pociagi.app.dao;

import pociagi.app.model.PathSegmentEntry;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RouteDao {

    public List<PathSegmentEntry> searchRoutesWithTransfers(int startStationId, int endStationId, Timestamp dateTime) {
        List<PathSegmentEntry> result = new ArrayList<>();
        String sql = "SELECT * FROM search_routes_with_transfers(?, ?, ?)";

        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, startStationId);
            stmt.setInt(2, endStationId);
            stmt.setTimestamp(3, dateTime);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                PathSegmentEntry entry = new PathSegmentEntry(
                        rs.getInt("id_polaczenia"),
                        rs.getString("stacja1"),
                        rs.getDate("data_odjazdu").toLocalDate(),
                        rs.getTime("czas_odjazdu").toLocalTime(),
                        rs.getString("stacja2"),
                        rs.getDate("data_przyjazdu").toLocalDate(),
                        rs.getTime("czas_przyjazdu").toLocalTime()
                );
                result.add(entry);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}