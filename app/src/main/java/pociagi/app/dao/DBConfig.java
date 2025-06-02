package pociagi.app.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class DBConfig {
    private String username;
    private String password;
    private String url;

    public DBConfig() throws IOException {
        Properties props = new Properties();
        try (FileInputStream fis = new FileInputStream("db.properties")) {
            props.load(fis);
        }
        username = props.getProperty("db.username");
        password = props.getProperty("db.password");
        url = props.getProperty("db.url");
    }

    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getUrl() { return url; }
}