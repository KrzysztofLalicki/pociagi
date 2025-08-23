package pociagi.app.dao;

import pociagi.app.model.ConnectionsTableEntry;
import pociagi.app.model.Stacja;
import pociagi.app.model.TimetableEntry;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class TicketConnectionDao {

    public List<ConnectionsTableEntry> getConnections(Stacja startStacja, Stacja endStacja, Integer numberOfPlacesClassOne,
                                                      Integer numberOfPlacesClassTwo, LocalDate date, LocalTime time)
    {
        List<ConnectionsTableEntry> result = new ArrayList<>();
        String sql = "SELECT * FROM szukaj_polaczenia(?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, startStacja.getNazwa());
            stmt.setString(2, endStacja.getNazwa());
            stmt.setInt(3, numberOfPlacesClassOne);
            stmt.setInt(4, numberOfPlacesClassTwo);
            stmt.setDate(5, Date.valueOf(date));
            stmt.setTime(6, Time.valueOf(time));

            // Dwa ostatnie argumenty zawsze ustawione na false
            stmt.setBoolean(7, false);
            stmt.setBoolean(8, false);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ConnectionsTableEntry entry = new ConnectionsTableEntry(
                        rs.getInt("id_polaczenia"),
                        rs.getString("stacja_start"),
                        rs.getString("stacja_koniec"),
                        rs.getTime("godzina_odjazdu") == null ? null : rs.getTime("godzina_odjazdu").toLocalTime(),
                        rs.getTime("czas_trasy") == null ? null : rs.getTime("czas_trasy").toLocalTime(),
                        rs.getBigDecimal("koszt_przejazdu")
                );
                result.add(entry);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging in production
        }

        return result;
    }
}
