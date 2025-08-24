package pociagi.app.dao;

import pociagi.app.model.UlgiTableEntry;
import pociagi.app.service.TicketFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddingTicketDao {
    public void addTicket() {
        String sql = "INSERT INTO bilety(id_pasazera , data_zakupu) VALUES(?,NOW()) RETURNING id_biletu;";


        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, 1);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int generatedId = rs.getInt("id_biletu");
                    TicketFactory.setId(generatedId);
                    System.out.println("Dodanie biletu o id: " + generatedId);
                } else {
                    System.out.println("Nie udało się uzyskać ID biletu");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
