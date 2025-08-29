package pociagi.app.viewmodel;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Tab;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import pociagi.app.service.TicketFactory;

import java.io.IOException;

public class AccountViewModel {


    private Tab tab;
    public void setTab(Tab tab) {
        this.tab = tab;
    }

    @FXML public void handleNewBilet() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketFindingConnection.fxml"));
        VBox newView = loader.load();
        TicketFactory.makeTicket();
        TicketFindingConnectionViewModel controller = loader.getController();
        controller.setTab(tab);

        tab.setContent(newView);
    }

    @FXML public void ArchiwumButton() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/ArchiwumView.fxml"));
        VBox newView = loader.load();
        ArchiwumViewModel controller = loader.getController();
        controller.setData(tab);
        tab.setContent(newView);
    }

    @FXML public void logOut() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/Logging.fxml"));
        VBox newView = loader.load();
        LoggingViewModel controller = loader.getController();
        controller.setTab(tab);
        tab.setContent(newView);
    }

}
