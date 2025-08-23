package pociagi.app.viewmodel;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.Tab;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import pociagi.app.dao.DaoFactory;
import pociagi.app.model.ConnectionsTableEntry;
import pociagi.app.model.Stacja;
import pociagi.app.model.TimetableEntry;
import pociagi.app.service.TicketFinding;
import pociagi.app.service.TicketFinding.*;

import java.math.BigDecimal;

public class TicketListOfConnectionViewModel {
    private Tab tab;

    private TicketFinding ticketFinding;

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

    public void setTicketFinding(TicketFinding ticketFinding) {
        this.ticketFinding = ticketFinding;
    }

    public void setLabels(){
        labelOne.setText(String.valueOf(ticketFinding.getNumberOfPlacesOne()));
        labelTwo.setText(String.valueOf(ticketFinding.getNumberOfPlacesTwo()));
        labelTri.setText(String.valueOf(ticketFinding.getDepartureDate()));
        labelQut.setText(String.valueOf(ticketFinding.getDepartureTime()));
        labelFive.setText(String.valueOf(ticketFinding.getStartStation().getNazwa()));
        labelSix.setText(String.valueOf(ticketFinding.getEndStation().getNazwa()));
    }

    public void setTab(Tab tab) {
        this.tab = tab;
    }

    public void setData() {
        stationList.setAll(DaoFactory.getTicketConnectionDao().getConnections(ticketFinding.getStartStation(),
                ticketFinding.getEndStation(),ticketFinding.getNumberOfPlacesOne(), ticketFinding.getNumberOfPlacesTwo(),
                ticketFinding.getDepartureDate(), ticketFinding.getDepartureTime()));

        tableView.setItems(stationList);
    }

    @FXML public void initialize() {
        skadCol.setCellValueFactory(new PropertyValueFactory<>("skad"));
        dokadCol.setCellValueFactory(new PropertyValueFactory<>("dokad"));
        odjazdCol.setCellValueFactory(new PropertyValueFactory<>("odjazd"));
        czasCol.setCellValueFactory(new PropertyValueFactory<>("czas"));
        kosztCol.setCellValueFactory(new PropertyValueFactory<>("koszt"));
        idCol.setCellValueFactory(new PropertyValueFactory<>("id"));
    }


}
