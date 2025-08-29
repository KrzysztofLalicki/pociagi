package pociagi.app.dao;

import pociagi.app.service.LoggedAccount;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoggingClassDao {
    public void logging(String mail) {
        String sql = "SELECT id_pasazera FROM pasazerowie WHERE email = ?";


        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1,mail);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int generatedId = rs.getInt(1);
                    LoggedAccount.setUser_id(generatedId);
                    System.out.println("Zalogowanie użytkownika o id: " + generatedId);
                } else {
                    throw new SQLException();
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
