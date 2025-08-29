package pociagi.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddingPassengerDao {
    public void add(String name, String surname, String mail) {
        String sql = "INSERT INTO pasazerowie(imie, nazwisko, email) VALUES(?, ?, ?);";


        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setString(2, surname);
            stmt.setString(3, mail);
            stmt.executeUpdate();
            System.out.println("Dodanie użytkownika.");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
