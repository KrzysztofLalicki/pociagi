module pociagi.app {
    requires javafx.controls;
    requires javafx.fxml;


    opens pociagi.app to javafx.fxml;
    exports pociagi.app;
}