package pociagi.app.viewmodel;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.*;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import pociagi.app.service.TicketFinding;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

public class TicketPlacesViewModel {
    @FXML private ChoiceBox<Integer> choiceBoxPlacesOne;
    @FXML private ChoiceBox<Integer> choiceBoxPlacesTwo;

    @FXML private DatePicker datePicker;
    @FXML private Spinner<Integer> minuteSpinner;
    @FXML private Spinner<Integer> hourSpinner;

    private Tab tab;

    private TicketFinding ticketFinding;

    public void setTicket(TicketFinding ticket) {
        this.ticketFinding = ticket;
    }

    public void setTab(Tab tab) {
        this.tab = tab;
    }

    @FXML public void initialize() {
        choiceBoxPlacesOne.getItems().addAll(0,1,2);
        choiceBoxPlacesTwo.getItems().addAll(0,1,2);
        choiceBoxPlacesTwo.getSelectionModel().select(0);
        choiceBoxPlacesOne.getSelectionModel().select(0);

        hourSpinner.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0, 23, 12));
        minuteSpinner.setValueFactory(new SpinnerValueFactory.IntegerSpinnerValueFactory(0, 45, 0, 15));
        datePicker.setValue(LocalDate.now());
    }

    @FXML private void HandleButton() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketFindingConnection.fxml"));
        VBox newView = loader.load();

        TicketFindingConnectionViewModel controller = loader.getController();
        controller.setTab(tab);
        //controller.setInfo(choiceBoxPlaces.getValue(),choiceBoxClass.getValue());
        controller.setTicket(ticketFinding);
        LocalDate selectedDate = datePicker.getValue();
        LocalTime selectedTime = LocalTime.of(
                hourSpinner.getValue(),
                minuteSpinner.getValue()
        );

        // Ustaw datę i czas w obiekcie TicketFinding
        ticketFinding.setDepartureDate(selectedDate);
        ticketFinding.setDepartureTime(selectedTime);
        ticketFinding.setNumberOfPlaces(choiceBoxPlacesOne.getValue(),choiceBoxPlacesTwo.getValue());
        tab.setContent(newView);
    }

}
