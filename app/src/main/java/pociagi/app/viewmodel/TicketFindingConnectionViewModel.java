package pociagi.app.viewmodel;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.*;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.VBox;
import pociagi.app.model.Stacja;
import pociagi.app.service.Przejazd;
import pociagi.app.service.TicketFactory;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class TicketFindingConnectionViewModel {

    @FXML private ComboBox<Integer> comboBoxPlacesOne;
    @FXML private ComboBox<Integer> comboBoxPlacesTwo;

    @FXML private DatePicker datePicker;
    @FXML private Spinner<Integer> minuteSpinner;
    @FXML private Spinner<Integer> hourSpinner;

    @FXML private VBox dynamicBoxOne;
    @FXML private VBox dynamicBoxTwo;

    @FXML private BorderPane startStationView;
    @FXML private BorderPane endStationView;


    private SelectStationViewModel startStationController;
    private SelectStationViewModel endStationController;

    @FXML Label labelOne;
    @FXML Label labelTwo;

    private Tab tab;

    private Integer numberOfPlaces;
    private Integer Class;


    public void setTab(Tab tab) {
        this.tab = tab;
    }


    @FXML
    public void initialize() {
        startStationController = (SelectStationViewModel) startStationView.getUserData();
        endStationController   = (SelectStationViewModel) endStationView.getUserData();

        comboBoxPlacesOne.getItems().addAll(IntStream.rangeClosed(0, 100).boxed().collect(Collectors.toList()));
        comboBoxPlacesTwo.getItems().addAll(IntStream.rangeClosed(0, 100).boxed().collect(Collectors.toList()));

        comboBoxPlacesOne.getSelectionModel().select(0);
        comboBoxPlacesTwo.getSelectionModel().select(0);
        comboBoxPlacesTwo.setVisibleRowCount(10);
        comboBoxPlacesOne.setVisibleRowCount(10);

        hourSpinner.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0, 23, 12));
        minuteSpinner.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0, 45, 0, 15));
        datePicker.setValue(LocalDate.now());

        /*comboBoxPlacesOne.valueProperty().addListener((obs, oldVal, newVal) -> {
            generateChoiceBoxesOne(newVal);
        });*/
    }


    @FXML public void HandleButton() throws IOException {
        try {
            if(comboBoxPlacesOne.getSelectionModel().getSelectedIndex() == 0 && comboBoxPlacesTwo.getSelectionModel().getSelectedIndex() == 0) {
                throw new Exception();
            }
            if(hourSpinner.getValue() > 18)
            {
                TicketFactory.getActualPrzeazd().IsAfter18 = true;
            }
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketListOfConnection.fxml"));
            VBox newView = loader.load();

            TicketListOfConnectionViewModel controller = loader.getController();
            controller.setTab(tab);

            Stacja startStacja = startStationController.getStacjaProperty().get();
            Stacja endStacja = endStationController.getStacjaProperty().get();

            TicketFactory.getActualPrzeazd().setStartStation(startStacja);
            TicketFactory.getActualPrzeazd().setEndStation(endStacja);

            LocalDate selectedDate = datePicker.getValue();
            LocalTime selectedTime = LocalTime.of(
                    hourSpinner.getValue(),
                    minuteSpinner.getValue()
            );

            // Ustaw datę i czas w obiekcie Przejazd
            TicketFactory.getActualPrzeazd().setDepartureDate(selectedDate);
            TicketFactory.getActualPrzeazd().setDepartureTime(selectedTime);
            TicketFactory.getActualPrzeazd().setNumberOfPlaces(comboBoxPlacesOne.getValue(), comboBoxPlacesTwo.getValue());

            controller.setLabels();
            tab.setContent(newView);
            controller.setData();
        }
        catch(Exception e )
        {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText(null);
            alert.setContentText("Nieprawidłowe dane!");
            alert.showAndWait();

            e.printStackTrace();

        }
    }
}
