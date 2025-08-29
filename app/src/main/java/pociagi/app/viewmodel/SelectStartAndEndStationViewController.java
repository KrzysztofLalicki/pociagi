package pociagi.app.viewmodel;

import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.util.StringConverter;
import pociagi.app.dao.DaoFactory;
import pociagi.app.model.PathSegmentEntry;
import pociagi.app.model.Stacja;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.sql.Timestamp;

public class SelectStartAndEndStationViewController {
    @FXML private Node startStationView;
    @FXML private Node endStationView;
    @FXML private DatePicker datePicker;
    @FXML private Spinner<LocalTime> timeSpinner;

    @FXML private TableView<PathSegmentEntry> tableView;
    @FXML private TableColumn<PathSegmentEntry, Integer> id_polaczenia;
    @FXML private TableColumn<PathSegmentEntry, String> stacja1;
    @FXML private TableColumn<PathSegmentEntry, LocalDate> data_odjazdu;
    @FXML private TableColumn<PathSegmentEntry, LocalTime> czas_odjazdu;
    @FXML private TableColumn<PathSegmentEntry, String> stacja2;
    @FXML private TableColumn<PathSegmentEntry, LocalDate> data_przyjazdu;
    @FXML private TableColumn<PathSegmentEntry, LocalTime> czas_przyjazdu;


    private ObjectProperty<Stacja> startStation;
    private ObjectProperty<Stacja> endStation;
    private ObjectProperty<LocalDate> selectedDate = new SimpleObjectProperty<>();
    private ObjectProperty<LocalTime> selectedTime = new SimpleObjectProperty<>();
    private final ObservableList<PathSegmentEntry> routeList = FXCollections.observableArrayList();

    @FXML
    public void initialize() {
        timeSpinner.setValueFactory(new SpinnerValueFactory<LocalTime>() {
            private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");

            {
                setConverter(new StringConverter<>() {
                    @Override
                    public String toString(LocalTime time) {
                        return formatter.format(time);
                    }

                    @Override
                    public LocalTime fromString(String text) {
                        if (text == null || text.trim().isEmpty()) {
                            timeSpinner.getEditor().setText(formatter.format(getValue()));
                            return getValue();
                        }
                        try {
                            return LocalTime.parse(text.trim(), formatter);
                        } catch (DateTimeParseException e) {
                            timeSpinner.getEditor().setText(formatter.format(getValue()));
                            return getValue();
                        }
                    }
                });
            }

            @Override
            public void decrement(int i) {
                LocalTime newValue = getValue().minusMinutes(i);
                if(newValue.isAfter(getValue()))
                    datePicker.setValue(datePicker.getValue().minusDays(1));
                setValue(newValue);
            }

            @Override
            public void increment(int i) {
                LocalTime newValue = getValue().plusMinutes(i);
                if(newValue.isBefore(getValue()))
                    datePicker.setValue(datePicker.getValue().plusDays(1));
                setValue(newValue);
            }
        });

        startStation = ((SelectStationViewModel)startStationView.getUserData()).getStacjaProperty();
        endStation = ((SelectStationViewModel)endStationView.getUserData()).getStacjaProperty();
        selectedDate.bind(datePicker.valueProperty());
        selectedTime.bind(timeSpinner.valueProperty());

        datePicker.setValue(java.time.LocalDate.now());
        timeSpinner.getValueFactory().setValue(LocalTime.now());

        startStation.addListener((obs, oldStacja, newStacja) -> updateTable());
        endStation.addListener((obs, oldStacja, newStacja) -> updateTable());
        selectedDate.addListener((obs, oldDate, newDate) -> updateTable());
        selectedTime.addListener((obs, oldTime, newTime) -> updateTable());

        tableView.setItems(routeList);

        id_polaczenia.setCellValueFactory(new PropertyValueFactory<>("connectionId"));
        stacja1.setCellValueFactory(new PropertyValueFactory<>("startStation"));
        data_odjazdu.setCellValueFactory(new PropertyValueFactory<>("departureDate"));
        czas_odjazdu.setCellValueFactory(new PropertyValueFactory<>("departureTime"));
        stacja2.setCellValueFactory(new PropertyValueFactory<>("endStation"));
        data_przyjazdu.setCellValueFactory(new PropertyValueFactory<>("arrivalDate"));
        czas_przyjazdu.setCellValueFactory(new PropertyValueFactory<>("arrivalTime"));
    }

    private void updateTable() {
        if (startStation.get() != null && endStation.get() != null && selectedDate.get() != null && selectedTime.get() != null) {
            Timestamp timestamp = Timestamp.valueOf(selectedDate.get().atTime(selectedTime.get()));
            List<PathSegmentEntry> results = DaoFactory.getRouteDao().searchRoutesWithTransfers(
                    startStation.get().getIdStacji(),
                    endStation.get().getIdStacji(),
                    timestamp
            );
            routeList.setAll(results);
        }
    }
}
