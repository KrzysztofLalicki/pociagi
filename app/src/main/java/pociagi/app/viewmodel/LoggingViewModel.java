package pociagi.app.viewmodel;


import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Alert;
import javafx.scene.control.Tab;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import pociagi.app.dao.DaoFactory;
import pociagi.app.service.Przejazd;

import java.io.IOException;

public class LoggingViewModel {
    public VBox rootVBoxTicket;

    @FXML
    TextField mailField;

    private Tab tab;

    public LoggingViewModel() {
    }

    public void setTab(Tab tab) {
        this.tab = tab;
    }

    public void initialize() {
    }


    @FXML
    public void handleNext() throws IOException {
        try {
            DaoFactory.getLoggingClassDao().logging(mailField.getText());
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/AccountView.fxml"));
            HBox newView = loader.load();

            AccountViewModel controller = loader.getController();
            controller.setTab(tab);

            tab.setContent(newView);
        }
        catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
            Platform.runLater(() -> {
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Błąd");
                alert.setHeaderText(null);
                alert.setContentText("Nieprawidłowe dane!");
                alert.showAndWait();
            });
        }
    }
}
