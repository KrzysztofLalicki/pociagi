package pociagi.app.viewmodel;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Tab;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import pociagi.app.dao.DaoFactory;
import pociagi.app.model.ConnectionsTableEntry;
import pociagi.app.model.Place;

import java.util.List;

public class TicketPlacesChoiceViewModel {
    @FXML
    public TableView<Place> tableView;

    @FXML
    TableColumn<Place, Integer> nr_miejscaCol;
    @FXML TableColumn<Place, Integer> nr_wagonuCol;
    @FXML TableColumn<Place, Integer> nr_przedzialuCol;

    private final ObservableList<Place> places = FXCollections.observableArrayList();

    private Tab tab;

    public void setTab(Tab tab) {
        this.tab = tab;
    }

    public void setData(){
        places.setAll(DaoFactory.getTicketFreePlacesDao().getFreePlaces(2));
        tableView.setItems((places));
        nr_miejscaCol.setCellValueFactory(new PropertyValueFactory<>("nr_miejsca"));
        nr_wagonuCol.setCellValueFactory(new PropertyValueFactory<>("nr_wagonu"));
        nr_przedzialuCol.setCellValueFactory(new PropertyValueFactory<>("nr_przedzialu"));
    }
}
