package pociagi.app.viewmodel;

import javafx.fxml.FXML;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.control.Tab;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import pociagi.app.service.Przejazd;
import pociagi.app.service.TicketFactory;

import java.util.List;

public class TicketSummaryViewModel {

    @FXML
    private VBox container;

    @FXML private HBox lastHBox;

    private Tab tab;

    public void setTab(Tab tab) {
        this.tab = tab;
        createHBoxes();
    }


    @FXML
    public void initialize(){
    }

    private void createHBoxes() {
        // Oczyść kontener (opcjonalnie, jeśli mógłby być wypełniony wcześniej)
        container.getChildren().clear();

        // Pobierz listę z TicketFactory
        List<Przejazd> przejazdy = TicketFactory.list; // Zakładam, że TicketFactory.list zwraca List<Ticket>

        // Dla każdego elementu w liście utwórz nowy HBox i dodaj do kontenera
        for (Przejazd przejazd : przejazdy) {
            HBox hbox = new HBox();
            hbox.setAlignment(Pos.CENTER);
            VBox vbox1 = new VBox();
            vbox1.setMinWidth(140);
            vbox1.setAlignment(Pos.CENTER);
            vbox1.getChildren().add(new Label("Skąd :"));
            vbox1.getChildren().add(new Label(przejazd.getStartStation().getNazwa()));
            hbox.getChildren().add(vbox1);
            VBox vbox2 = new VBox();
            vbox2.setMinWidth(140);
            vbox2.setAlignment(Pos.CENTER);
            vbox2.getChildren().add(new Label("Dokąd :"));
            vbox2.getChildren().add(new Label(przejazd.getEndStation().getNazwa()));
            hbox.getChildren().add(vbox2);
            VBox vbox3 = new VBox();
            vbox3.setMinWidth(140);
            vbox3.setAlignment(Pos.CENTER);
            vbox3.getChildren().add(new Label("Liczba miejsc w klasie I :"));
            vbox3.getChildren().add(new Label(String.valueOf(przejazd.getNumberOfPlacesOne())));
            hbox.getChildren().add(vbox3);
            VBox vbox4 = new VBox();
            vbox4.setMinWidth(140);
            vbox4.setAlignment(Pos.CENTER);
            vbox4.getChildren().add(new Label("Liczba miejsc w klasie II :"));
            vbox4.getChildren().add(new Label(String.valueOf(przejazd.getNumberOfPlacesTwo())));
            hbox.getChildren().add(vbox4);


            container.getChildren().add(hbox);
        }
        container.getChildren().add(lastHBox);
    }


}
