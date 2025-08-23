package pociagi.app.viewmodel;


import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Tab;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import pociagi.app.service.Przejazd;

import java.io.IOException;

public class LoggingViewModel {
    public VBox rootVBoxTicket;



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
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/AccountView.fxml"));
        HBox newView = loader.load();

        AccountViewModel controller = loader.getController();
        controller.setTab(tab);

        tab.setContent(newView);
    }
}
