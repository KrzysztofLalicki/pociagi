package pociagi.app.viewmodel;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Label;
import javafx.scene.control.Tab;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.VBox;
import pociagi.app.model.Stacja;
import pociagi.app.service.Przejazd;

import java.io.IOException;

public class TicketFindingConnectionViewModel {

    @FXML private BorderPane startStationView;
    @FXML private BorderPane endStationView;


    private SelectStationViewModel startStationController;
    private SelectStationViewModel endStationController;

    @FXML Label labelOne;
    @FXML Label labelTwo;

    private Tab tab;

    private Przejazd przejazd;

    public void setTicket(Przejazd ticket) {
        this.przejazd = ticket;
    }


    private Integer numberOfPlaces;
    private Integer Class;

    public void setInfo(Integer numberOfPlaces, Integer Class){
        this.numberOfPlaces = numberOfPlaces;
        this.Class = Class;
        labelOne.setText( "Liczba miejsc : " + String.valueOf(numberOfPlaces));
        labelTwo.setText( "Klasa : " + String.valueOf(Class));
    }

    public void setTab(Tab tab) {
        this.tab = tab;
    }


    @FXML
    public void initialize() {
        startStationController = (SelectStationViewModel) startStationView.getUserData();
        endStationController   = (SelectStationViewModel) endStationView.getUserData();
    }


    @FXML public void HandleButton() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketListOfConnection.fxml"));
        VBox newView = loader.load();

        TicketListOfConnectionViewModel controller = loader.getController();
        controller.setPrzejazd(przejazd);
        controller.setTab(tab);

        Stacja startStacja = startStationController.getStacjaProperty().get();
        Stacja endStacja   = endStationController.getStacjaProperty().get();

        przejazd.setStartStation(startStacja);
        przejazd.setEndStation(endStacja);

        controller.setLabels();
        tab.setContent(newView);
        controller.setData();
    }
}
