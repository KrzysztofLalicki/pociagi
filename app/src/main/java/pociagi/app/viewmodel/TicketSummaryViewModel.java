package pociagi.app.viewmodel;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.Tab;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import pociagi.app.dao.DaoFactory;
import pociagi.app.service.Przejazd;
import pociagi.app.service.TicketFactory;

import java.io.IOException;
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
            vbox3.setMinWidth(70);
            vbox3.setAlignment(Pos.CENTER);
            vbox3.getChildren().add(new Label("Klasa I :"));
            vbox3.getChildren().add(new Label(String.valueOf(przejazd.getNumberOfPlacesOne())));
            hbox.getChildren().add(vbox3);
            VBox vbox4 = new VBox();
            vbox4.setMinWidth(70);
            vbox4.setAlignment(Pos.CENTER);
            vbox4.getChildren().add(new Label("Klasa II :"));
            vbox4.getChildren().add(new Label(String.valueOf(przejazd.getNumberOfPlacesTwo())));
            hbox.getChildren().add(vbox4);
            VBox vbox5 = new VBox();
            vbox5.setMinWidth(70);
            vbox5.setAlignment(Pos.CENTER);
            vbox5.getChildren().add(new Label("Data :"));
            vbox5.getChildren().add(new Label(String.valueOf(przejazd.getDepartureDate())));
            hbox.getChildren().add(vbox5);
            VBox vbox6 = new VBox();
            vbox6.setMinWidth(70);
            vbox6.setAlignment(Pos.CENTER);
            vbox6.getChildren().add(new Label("Godzina :"));
            vbox6.getChildren().add(new Label(String.valueOf(przejazd.getDepartureTime())));
            hbox.getChildren().add(vbox6);
            VBox vbox8 = new VBox();
            vbox8.setMinWidth(70);
            vbox8.setAlignment(Pos.CENTER);
            vbox8.getChildren().add(new Label("Czas :"));
            vbox8.getChildren().add(new Label(String.valueOf(przejazd.getCzas())));
            hbox.getChildren().add(vbox8);
            VBox vbox7 = new VBox();
            vbox7.setMinWidth(70);
            vbox7.setAlignment(Pos.CENTER);
            vbox7.getChildren().add(new Label("Numer :"));
            vbox7.getChildren().add(new Label(String.valueOf(przejazd.getId_polaczenia())));
            hbox.getChildren().add(vbox7);
            VBox vbox10 = new VBox();
            vbox10.setMinWidth(70);
            vbox10.setAlignment(Pos.CENTER);
            vbox10.getChildren().add(new Label("Cena :"));
            vbox10.getChildren().add(new Label(String.valueOf(DaoFactory.getPrizeOfPrzejazdDao().Prize(przejazd))));
            hbox.getChildren().add(vbox10);

            VBox vbox9 = new VBox();
            Button button = new Button("Usuń");
            button.setOnAction(event -> {
                DaoFactory.getDeletingPrzejazdDao().delete(przejazd);
                TicketFactory.list.remove(przejazd);
                createHBoxes();
            });
            vbox9.getChildren().add(button);
            hbox.getChildren().add(vbox9);
            container.getChildren().add(hbox);
        }
        container.getChildren().add(lastHBox);
    }

    @FXML public void HandleButton() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketFindingConnection.fxml"));
        VBox newView = loader.load();
        TicketFindingConnectionViewModel controller = loader.getController();
        controller.setTab(tab);
        tab.setContent(newView);

    }

    @FXML public void BuyTicket() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/AccountView.fxml"));
        HBox newView = loader.load();
        TicketFactory.setIsCreated(false);
        AccountViewModel controller = loader.getController();
        controller.setTab(tab);
        tab.setContent(newView);
    }

    @FXML public void AnulujButton() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/AccountView.fxml"));
        HBox newView = loader.load();
        DaoFactory.getDeletingTicketDao().delete();
        TicketFactory.setIsCreated(Boolean.FALSE);
        AccountViewModel controller = loader.getController();
        controller.setTab(tab);
        tab.setContent(newView);
    }



}
