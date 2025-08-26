package pociagi.app.dao;

import pociagi.app.service.Place;
import pociagi.app.service.TicketFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddingTicketPlacesDao {

    public void addToTicketPlaces() {
        String sql = "INSERT INTO bilety_miejsca (id_przejazdu, nr_wagonu, nr_miejsca, id_ulgi) " +
                "VALUES (?, ?, ?, ?)";

        try (Connection conn = DBManager.getConnection()) {
            conn.setAutoCommit(false); // start transakcji

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                for (Place place : TicketFactory.getActualPrzeazd().getPlacesOne()) {
                    stmt.setInt(1, TicketFactory.getActualPrzeazd().getId_przejazdu());
                    stmt.setInt(2, place.getNr_wagonu());
                    stmt.setInt(3, place.getNr_miejsca());
                    stmt.setInt(4, place.getId_ulgi());
                    stmt.addBatch(); // dodaj do batcha
                }
                for (Place place : TicketFactory.getActualPrzeazd().getPlacesTwo()) {
                    stmt.setInt(1, TicketFactory.getActualPrzeazd().getId_przejazdu());
                    stmt.setInt(2, place.getNr_wagonu());
                    stmt.setInt(3, place.getNr_miejsca());
                    stmt.setInt(4, place.getId_ulgi());
                    stmt.addBatch(); // dodaj do batcha
                }
                stmt.executeBatch(); // wykonaj wszystko naraz
            }

            conn.commit(); // zatwierdź całość
            System.out.println("Dodano wszystkie miejsca w jednej transakcji.");
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                DBManager.getConnection().rollback(); // wycofaj w razie błędu
                System.out.println("Wycofano transakcję!");
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
