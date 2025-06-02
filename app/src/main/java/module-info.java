module pociagi.app {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;

    opens pociagi.app to javafx.fxml;
    exports pociagi.app;
    exports pociagi.app.viewmodel;
    opens pociagi.app.viewmodel to javafx.fxml;
    opens pociagi.app.model to javafx.base;
}