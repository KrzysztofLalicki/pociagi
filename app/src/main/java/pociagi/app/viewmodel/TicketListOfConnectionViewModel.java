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
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import pociagi.app.dao.DaoFactory;
import pociagi.app.model.ConnectionsTableEntry;
import pociagi.app.service.Przejazd;
import pociagi.app.service.Przejazd.*;
import pociagi.app.service.TicketFactory;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalTime;

public class TicketListOfConnectionViewModel {
    private Tab tab;


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
    @FXML private TableColumn<ConnectionsTableEntry, LocalTime> dateCol;
    @FXML private TableColumn<ConnectionsTableEntry, Object> odjazdCol;
    @FXML private TableColumn<ConnectionsTableEntry, Object> czasCol;
    @FXML private TableColumn<ConnectionsTableEntry, BigDecimal> kosztCol;

    private final ObservableList<ConnectionsTableEntry> stationList = FXCollections.observableArrayList();


    public void setLabels(){
        labelOne.setText(String.valueOf(TicketFactory.getActualPrzeazd().getNumberOfPlacesOne()));
        labelTwo.setText(String.valueOf(TicketFactory.getActualPrzeazd().getNumberOfPlacesTwo()));
        labelTri.setText(String.valueOf(TicketFactory.getActualPrzeazd().getDepartureDate()));
        labelQut.setText(String.valueOf(TicketFactory.getActualPrzeazd().getDepartureTime()));
        labelFive.setText(String.valueOf(TicketFactory.getActualPrzeazd().getStartStation().getNazwa()));
        labelSix.setText(String.valueOf(TicketFactory.getActualPrzeazd().getEndStation().getNazwa()));
    }

    public void setTab(Tab tab) {
        this.tab = tab;
    }

    public void setData() {
        stationList.setAll(DaoFactory.getTicketConnectionDao().getConnections(TicketFactory.getActualPrzeazd().getStartStation(),
                TicketFactory.getActualPrzeazd().getEndStation(),TicketFactory.getActualPrzeazd().getNumberOfPlacesOne(),
                TicketFactory.getActualPrzeazd().getNumberOfPlacesTwo(), TicketFactory.getActualPrzeazd().getDepartureDate(),
                TicketFactory.getActualPrzeazd().getDepartureTime()));

        tableView.setItems(stationList);
    }

    @FXML public void initialize() {
        skadCol.setCellValueFactory(new PropertyValueFactory<>("skad"));
        dokadCol.setCellValueFactory(new PropertyValueFactory<>("dokad"));
        odjazdCol.setCellValueFactory(new PropertyValueFactory<>("odjazd"));
        dateCol.setCellValueFactory(new PropertyValueFactory<>("date"));
        czasCol.setCellValueFactory(new PropertyValueFactory<>("czas"));
        kosztCol.setCellValueFactory(new PropertyValueFactory<>("koszt"));
        idCol.setCellValueFactory(new PropertyValueFactory<>("id"));

        tableView.getSelectionModel().selectedItemProperty().addListener((obs, oldSel, newSel) -> {
            if (newSel != null) {
                int id = newSel.getId();
                LocalTime czas = newSel.getCzas();
                LocalTime odjazd = newSel.getOdjazd();

                TicketFactory.getActualPrzeazd().setId_polaczenia(id);
                TicketFactory.getActualPrzeazd().setDepartureTime(odjazd);
                TicketFactory.getActualPrzeazd().setCzas(czas);
                System.out.println("Wybrano połączenie o ID: " + id);
            }
        });
    }

    @FXML public void HandleButton() throws IOException {
        if(TicketFactory.getActualPrzeazd().IsAfter18 && TicketFactory.getActualPrzeazd().getDepartureTime().isBefore(LocalTime.of(18, 0)))
        {
            TicketFactory.getActualPrzeazd().setDepartureDate(TicketFactory.getActualPrzeazd().getDepartureDate().plusDays(1));
        }
        if(TicketFactory.getActualPrzeazd().getId_polaczenia() != null) {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketPlacesChoice.fxml"));
            VBox newView = loader.load();

            TicketPlacesChoiceViewModel ticketPlacesChoiceViewModel = loader.getController();
            ticketPlacesChoiceViewModel.setTab(tab);
            ticketPlacesChoiceViewModel.setData();
            tab.setContent(newView);
        }

    }

    @FXML public void CofnijButton() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketFindingConnection.fxml"));
        VBox newView = loader.load();
        TicketFindingConnectionViewModel controller = loader.getController();
        controller.setTab(tab);
        TicketFactory.getActualPrzeazd().resetData();
        tab.setContent(newView);
    }


}
