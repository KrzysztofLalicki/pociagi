package pociagi.app.dao;

import pociagi.app.model.TimetableEntry;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class TimetableDao {

    public List<TimetableEntry> getTimetable(int idStacji, LocalDate data) {
        List<TimetableEntry> result = new ArrayList<>();
        String sql = "SELECT * FROM get_timetable(?, ?)";

        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idStacji);
            stmt.setDate(2, Date.valueOf(data));

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                TimetableEntry entry = new TimetableEntry(
                        rs.getInt("id_pol_out"),
                        rs.getString("skad_out"),
                        rs.getString("dokad_out"),
                        rs.getTime("przyjazd_out") == null ? null : rs.getTime("przyjazd_out").toLocalTime(),
                        rs.getTime("odjazd_out") == null ? null : rs.getTime("odjazd_out").toLocalTime()
                );
                result.add(entry);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging in production
        }

        return result;
    }
}