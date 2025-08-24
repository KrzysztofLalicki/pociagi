package pociagi.app.viewmodel;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Tab;
import javafx.scene.layout.HBox;
import pociagi.app.service.TicketFactory;

import java.io.IOException;

public class AccountViewModel {


    private Tab tab;
    public void setTab(Tab tab) {
        this.tab = tab;
    }

    @FXML public void handleNewBilet() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketPlaces.fxml"));
        HBox newView = loader.load();
        TicketFactory.makeTicket();
        TicketPlacesViewModel controller = loader.getController();
        controller.setTab(tab);

        tab.setContent(newView);
    }

}
