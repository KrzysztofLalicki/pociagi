package pociagi.app.dao;

import pociagi.app.service.Przejazd;
import pociagi.app.service.TicketFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddingPrzejazdDao {
    public void addPrzejazd(Przejazd przejazd) {
        String sql = "INSERT INTO przejazdy(id_biletu , id_polaczenia, data_odjazdu, id_stacji_poczatkowej" +
                ",id_stacji_koncowej ) VALUES(?, ?, ?, ?, ?) RETURNING id_przejazdu;";


        try (Connection conn = DBManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, przejazd.getId_biletu());
            stmt.setInt(2,przejazd.getId_polaczenia());
            stmt.setObject(3,przejazd.getDepartureDate());
            stmt.setInt(4,przejazd.getStartStation().getIdStacji());
            stmt.setInt(5,przejazd.getEndStation().getIdStacji());
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int generatedId = rs.getInt(1);
                    przejazd.setId_przejazdu(generatedId);
                    System.out.println("Dodanie przejazdu o id: " + generatedId);
                } else {
                    System.out.println("Nie udało się uzyskać ID przejazdu");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
