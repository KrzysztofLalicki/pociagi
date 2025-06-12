package pociagi.app.viewmodel;

import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.BorderPane;
import pociagi.app.dao.DaoFactory;
import pociagi.app.dao.TimetableDao;
import pociagi.app.model.Stacja;
import pociagi.app.model.TimetableEntry;

import java.time.LocalDate;

public class TimeTableViewModel {
    @FXML private Node selectStationView;

    @FXML private DatePicker datePicker;

    @FXML private TableView<TimetableEntry> tableView;
    @FXML private TableColumn<TimetableEntry, Integer> idCol;
    @FXML private TableColumn<TimetableEntry, String> skadCol;
    @FXML private TableColumn<TimetableEntry, String> dokadCol;
    @FXML private TableColumn<TimetableEntry, Object> przyjazdCol;  // LocalTime or Timestamp mapped as Object
    @FXML private TableColumn<TimetableEntry, Object> odjazdCol;

    private ObjectProperty<Stacja> selectedStacja;
    private ObjectProperty<LocalDate> selectedDate = new SimpleObjectProperty<>();
    private final ObservableList<TimetableEntry> timetableList = FXCollections.observableArrayList();

    @FXML
    public void initialize() {
        selectedStacja = ((SelectStationViewModel)selectStationView.getUserData()).getStacjaProperty();

        selectedStacja.addListener((_, _, _) -> updateList());

        datePicker.valueProperty().bindBidirectional(selectedDate);
        datePicker.setValue(LocalDate.now());

        selectedDate.addListener((_, _, _) -> updateList());

        tableView.setItems(timetableList);

        idCol.setCellValueFactory(new PropertyValueFactory<>("idTrasy"));
        skadCol.setCellValueFactory(new PropertyValueFactory<>("skad"));
        dokadCol.setCellValueFactory(new PropertyValueFactory<>("dokad"));
        przyjazdCol.setCellValueFactory(new PropertyValueFactory<>("przyjazd"));
        odjazdCol.setCellValueFactory(new PropertyValueFactory<>("odjazd"));
    }

    private void updateList() {
        if(selectedStacja.get() != null && selectedDate.get() != null)
            timetableList.setAll(DaoFactory.getTimetableDao().getTimetable(selectedStacja.get().getIdStacji(), selectedDate.get()));
    }
}