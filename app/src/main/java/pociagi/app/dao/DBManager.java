package pociagi.app.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {
    private static final DBConfig config;

    static {
        try {
            config = new DBConfig();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        try {
            Class.forName("org.postgresql.Driver"); // optional but safe
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL driver not found", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
                config.getUrl(),
                config.getUsername(),
                config.getPassword()
        );
    }
}