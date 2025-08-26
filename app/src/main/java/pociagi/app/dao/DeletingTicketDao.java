package pociagi.app.dao;

import pociagi.app.service.Przejazd;
import pociagi.app.service.TicketFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static java.lang.System.in;

public class DeletingTicketDao {
    public void delete() {
        if(TicketFactory.getId() != null)
        {
            for(Przejazd przejazd : TicketFactory.list)
            {
                DaoFactory.getDeletingPrzejazdDao().delete(przejazd);
            }
            String sql = "DELETE FROM bilety WHERE id_biletu=?;";


            try (Connection conn = DBManager.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, TicketFactory.getId());
                stmt.executeUpdate();
                System.out.println("Usunięcie biletu o id: " + String.valueOf(TicketFactory.getId()));
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }
}
