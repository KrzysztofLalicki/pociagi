package pociagi.app.viewmodel;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Label;
import javafx.scene.control.Tab;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;
import pociagi.app.dao.DaoFactory;
import pociagi.app.model.ConnectionsTableEntry;
import pociagi.app.service.Przejazd;
import pociagi.app.service.Przejazd.*;
import pociagi.app.service.TicketFactory;

import java.io.IOException;
import java.math.BigDecimal;

public class TicketListOfConnectionViewModel {
    private Tab tab;

    private Przejazd przejazd;

    @FXML private Label labelOne;
    @FXML private Label labelTwo;
    @FXML private Label labelTri;
    @FXML private Label labelQut;
    @FXML private Label labelFive;
    @FXML private Label labelSix;

    @FXML private TableView<ConnectionsTableEntry> tableView;

    @FXML private TableColumn<ConnectionsTableEntry, Integer> idCol;
    @FXML private TableColumn<ConnectionsTableEntry, String> skadCol;
    @FXML private TableColumn<ConnectionsTableEntry, String> dokadCol;
    @FXML private TableColumn<ConnectionsTableEntry, Object> odjazdCol;
    @FXML private TableColumn<ConnectionsTableEntry, Object> czasCol;
    @FXML private TableColumn<ConnectionsTableEntry, BigDecimal> kosztCol;

    private final ObservableList<ConnectionsTableEntry> stationList = FXCollections.observableArrayList();

    public void setPrzejazd(Przejazd przejazd) {
        this.przejazd = przejazd;
    }

    public void setLabels(){
        labelOne.setText(String.valueOf(przejazd.getNumberOfPlacesOne()));
        labelTwo.setText(String.valueOf(przejazd.getNumberOfPlacesTwo()));
        labelTri.setText(String.valueOf(przejazd.getDepartureDate()));
        labelQut.setText(String.valueOf(przejazd.getDepartureTime()));
        labelFive.setText(String.valueOf(przejazd.getStartStation().getNazwa()));
        labelSix.setText(String.valueOf(przejazd.getEndStation().getNazwa()));
    }

    public void setTab(Tab tab) {
        this.tab = tab;
    }

    public void setData() {
        stationList.setAll(DaoFactory.getTicketConnectionDao().getConnections(przejazd.getStartStation(),
                przejazd.getEndStation(),przejazd.getNumberOfPlacesOne(), przejazd.getNumberOfPlacesTwo(),
                przejazd.getDepartureDate(), przejazd.getDepartureTime()));

        tableView.setItems(stationList);
    }

    @FXML public void initialize() {
        skadCol.setCellValueFactory(new PropertyValueFactory<>("skad"));
        dokadCol.setCellValueFactory(new PropertyValueFactory<>("dokad"));
        odjazdCol.setCellValueFactory(new PropertyValueFactory<>("odjazd"));
        czasCol.setCellValueFactory(new PropertyValueFactory<>("czas"));
        kosztCol.setCellValueFactory(new PropertyValueFactory<>("koszt"));
        idCol.setCellValueFactory(new PropertyValueFactory<>("id"));

        tableView.getSelectionModel().selectedItemProperty().addListener((obs, oldSel, newSel) -> {
            if (newSel != null) {
                int id = newSel.getId();
                przejazd.setId_polaczenia(id);
                System.out.println("Wybrano połączenie o ID: " + id);
            }
        });
    }

    @FXML public void HandleButton() throws IOException {
        TicketFactory.list.add(przejazd);
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketSummaryView.fxml"));
        VBox newView = loader.load();

        TicketSummaryViewModel ticketSummaryViewModel = loader.getController();
        ticketSummaryViewModel.setTab(tab);
        tab.setContent(newView);

    }


}
