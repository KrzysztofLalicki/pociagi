package pociagi.app.viewmodel;

import javafx.application.Platform;
import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Spinner;
import javafx.scene.control.SpinnerValueFactory;
import javafx.util.StringConverter;
import pociagi.app.model.Stacja;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class SelectStartAndEndStationViewController {
    @FXML private Node startStationView;
    @FXML private Node endStationView;
    @FXML private Button dalejButton;
    @FXML private DatePicker datePicker;
    @FXML private Spinner<LocalTime> timeSpinner;

    private ObjectProperty<Stacja> startStation;
    private ObjectProperty<Stacja> endStation;

    @FXML
    public void initialize() {
        startStation = ((SelectStationViewModel)startStationView.getUserData()).getStacjaProperty();
        endStation = ((SelectStationViewModel)endStationView.getUserData()).getStacjaProperty();

        dalejButton.setOnAction(event -> {
            if(startStation.get() != null && endStation.get() != null)
                Platform.exit();
        });

        datePicker.setValue(java.time.LocalDate.now());
        timeSpinner.setValueFactory(new SpinnerValueFactory<LocalTime>() {
            private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");

            {
                setValue(java.time.LocalTime.now());

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

    }
}
