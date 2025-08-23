package pociagi.app.viewmodel;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.*;
import javafx.scene.layout.VBox;
import pociagi.app.dao.DaoFactory;
import pociagi.app.model.UlgiTableEntry;
import pociagi.app.service.Przejazd;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class TicketPlacesViewModel {
    @FXML private ComboBox<Integer> comboBoxPlacesOne;
    @FXML private ComboBox<Integer> comboBoxPlacesTwo;

    @FXML private DatePicker datePicker;
    @FXML private Spinner<Integer> minuteSpinner;
    @FXML private Spinner<Integer> hourSpinner;

    @FXML private VBox dynamicBoxOne;
    @FXML private VBox dynamicBoxTwo;

    private Tab tab;

    private Przejazd przejazd = new Przejazd();

    public void setTicket(Przejazd ticket) {
        this.przejazd = ticket;
    }

    public void setTab(Tab tab) {
        this.tab = tab;
    }

    @FXML public void initialize() {

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
        comboBoxPlacesTwo.valueProperty().addListener((obs, oldVal, newVal) -> {
            generateChoiceBoxesTwo(newVal);
        });
    }

    @FXML private void HandleButton() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketFindingConnection.fxml"));
        VBox newView = loader.load();

        TicketFindingConnectionViewModel controller = loader.getController();
        controller.setTab(tab);
        //controller.setInfo(choiceBoxPlaces.getValue(),choiceBoxClass.getValue());
        controller.setTicket(przejazd);
        LocalDate selectedDate = datePicker.getValue();
        LocalTime selectedTime = LocalTime.of(
                hourSpinner.getValue(),
                minuteSpinner.getValue()
        );

        // Ustaw datę i czas w obiekcie Przejazd
        przejazd.setDepartureDate(selectedDate);
        przejazd.setDepartureTime(selectedTime);
        przejazd.setNumberOfPlaces(comboBoxPlacesOne.getValue(),comboBoxPlacesTwo.getValue());
        tab.setContent(newView);
    }

    /*private void generateChoiceBoxesOne(int count) {
        dynamicBoxOne.getChildren().clear(); // czyścimy stare
        if(count > 0)
        {
            dynamicBoxOne.getChildren().add(new Label("Ulgi: "));
        }
        for (int i = 0; i < count; i++) {
            ComboBox<String> cb = new ComboBox<>();
            cb.setPrefWidth(120);
            cb.setMinWidth(120);
            cb.setMaxWidth(120);
            cb.getItems().addAll("Opcja A", "Opcja B", "Opcja C");
            cb.getSelectionModel().selectFirst();
            dynamicBoxOne.getChildren().add(cb);
        }
    }*/
    private void generateChoiceBoxesTwo(int count) {
        dynamicBoxTwo.getChildren().clear(); // czyścimy stare
        if(count > 0)
        {
            dynamicBoxTwo.getChildren().add(new Label("Ulgi: "));
        }
        for (int i = 0; i < count; i++) {
            ComboBox<UlgiTableEntry> cb = new ComboBox<>();
            cb.setCellFactory(param -> new ListCell<UlgiTableEntry>() {
                @Override
                protected void updateItem(UlgiTableEntry item, boolean empty) {
                    super.updateItem(item, empty);
                    if (empty || item == null) {
                        setText(null);
                    } else {
                        setText(item.getNazwa()); // Tylko nazwa
                    }
                }
            });
            cb.setButtonCell(new ListCell<UlgiTableEntry>() {
                @Override
                protected void updateItem(UlgiTableEntry item, boolean empty) {
                    super.updateItem(item, empty);
                    if (empty || item == null) {
                        setText("Wybierz ulgę");
                        setStyle("");
                    } else {
                        setText(item.getNazwa());
                        setStyle("-fx-font-weight: bold;");
                    }
                }
            });
            cb.setPrefWidth(120);
            cb.setMinWidth(120);
            cb.setMaxWidth(120);
            cb.getItems().addAll(DaoFactory.getUlgiDao().getUlgiTable());
            cb.getSelectionModel().selectFirst();
            dynamicBoxTwo.getChildren().add(cb);
        }
    }
}
