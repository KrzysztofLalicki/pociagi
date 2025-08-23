package pociagi.app.viewmodel;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Tab;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import pociagi.app.service.TicketFinding;

import java.io.IOException;

public class TicketViewModel{
    public VBox rootVBoxTicket;

    private TicketFinding ticket = new TicketFinding();


    private Tab tab;

    public TicketViewModel(){}
    public void setTab(Tab tab) {
        this.tab = tab;
    }

    public void initialize(){
    }


    @FXML
    public void handleNext() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketPlaces.fxml"));
        AnchorPane newView = loader.load();

        TicketPlacesViewModel controller = loader.getController();
        controller.setTab(tab);
        controller.setTicket(ticket);

        tab.setContent(newView);
    }

}
