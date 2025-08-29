package pociagi.app.viewmodel;

import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.*;
import javafx.scene.input.MouseEvent;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import pociagi.app.model.PlaceRecord;
import pociagi.app.dao.DaoFactory;
import pociagi.app.service.Place;
import pociagi.app.service.TicketFactory;

import java.io.IOException;

public class TicketPlacesChoiceViewModel {

    @FXML
    public TableView<PlaceRecord> tableView;

    @FXML
    HBox MainHBox;

    @FXML
    VBox vbox1;

    @FXML
    TableColumn<PlaceRecord, Integer> nr_miejscaCol;
    @FXML
    TableColumn<PlaceRecord, Integer> nr_wagonuCol;
    @FXML
    TableColumn<PlaceRecord, Integer> nr_przedzialuCol;

    @FXML TableColumn<PlaceRecord, String> cechyCol;

    @FXML
    public TableView<PlaceRecord> tableView2;

    @FXML
    VBox vbox2;

    @FXML
    TableColumn<PlaceRecord, Integer> nr_miejscaCol2;
    @FXML
    TableColumn<PlaceRecord, Integer> nr_wagonuCol2;
    @FXML
    TableColumn<PlaceRecord, Integer> nr_przedzialuCol2;

    @FXML TableColumn<PlaceRecord, String> cechyCol2;

    private final ObservableList<PlaceRecord> places = FXCollections.observableArrayList();
    private final ObservableList<PlaceRecord> places2 = FXCollections.observableArrayList();

    private Tab tab;

    public void setTab(Tab tab) {
        this.tab = tab;
    }

    public void setData() {
        MainHBox.getChildren().clear();
        if(TicketFactory.getActualPrzeazd().getNumberOfPlacesOne() > 0 )
        {
            MainHBox.getChildren().add(vbox1);
        }
        if(TicketFactory.getActualPrzeazd().getNumberOfPlacesTwo() > 0 )
        {
            MainHBox.getChildren().add(vbox2);
        }

        tableView.getSelectionModel().setSelectionMode(SelectionMode.MULTIPLE);
        tableView.getSelectionModel().setCellSelectionEnabled(false);

        // Pobranie miejsc z DAO
        places.setAll(DaoFactory.getTicketFreePlacesDao().getFreePlaces(1));
        tableView.setItems(places);

        // Kolumny danych
        nr_miejscaCol.setCellValueFactory(new PropertyValueFactory<>("nr_miejsca"));
        nr_wagonuCol.setCellValueFactory(new PropertyValueFactory<>("nr_wagonu"));
        nr_przedzialuCol.setCellValueFactory(new PropertyValueFactory<>("nr_przedzialu"));
        cechyCol.setCellValueFactory(cellData -> {
            PlaceRecord place = cellData.getValue();
            StringBuilder cechy = new StringBuilder();

            if (place.getCzy_dla_niepelnosprawnych()) {
                cechy.append("♿ "); // ikona albo napis
            }
            if (place.getCzy_dla_rowerow()) {
                cechy.append("🚲 ");
            }

            // jeśli brak cech, możesz wpisać np. "-"
            if (cechy.length() == 0) {
                cechy.append("");
            }

            return new ReadOnlyStringWrapper(cechy.toString().trim());
        });

        // RowFactory z toggle zaznaczenia i podświetleniem
        tableView.setRowFactory(tv -> {
            TableRow<PlaceRecord> row = new TableRow<>();

            Runnable refreshStyle = () -> {
                if (row.isEmpty() || row.getItem() == null) {
                    row.setStyle("");
                } else if (row.isSelected()) {
                    row.setStyle("-fx-background-color: #90caf9;"); // kolor podświetlenia
                } else {
                    row.setStyle("");
                }
            };

            row.selectedProperty().addListener((obs, was, is) -> refreshStyle.run());
            row.itemProperty().addListener((obs, oldItem, newItem) -> refreshStyle.run());
            row.indexProperty().addListener((obs, oldIdx, newIdx) -> refreshStyle.run());

            row.addEventFilter(MouseEvent.MOUSE_PRESSED, event -> {
                if (!row.isEmpty()) {
                    int index = row.getIndex();
                    TableView.TableViewSelectionModel<PlaceRecord> sm = tv.getSelectionModel();
                    PlaceRecord place = row.getItem();
                    if (sm.isSelected(index)) {
                        sm.clearSelection(index);
                        TicketFactory.getActualPrzeazd().getPlacesOne().removeIf(p -> (p.getNr_miejsca() == place.getNr_miejsca()) && p.getNr_wagonu() == place.getNr_wagonu());
                        System.out.println("Usunięcie miejsca");
                        System.out.println(TicketFactory.getActualPrzeazd().getPlacesTwo().size());
                    } else {
                        sm.select(index);
                        TicketFactory.getActualPrzeazd().getPlacesOne().add(new Place(place.getNr_miejsca(),place.nr_wagonu(),place.getNr_przedzialu(),TicketFactory.getActualPrzeazd().getId_przejazdu(),place.czy_dla_rowerow()));
                        System.out.println("Dodanie miejsca");
                    }
                    event.consume();
                    tv.refresh(); // odświeżenie stylu
                }
            });

            return row;
        });

    tableView2.getSelectionModel().setSelectionMode(SelectionMode.MULTIPLE);
        tableView2.getSelectionModel().setCellSelectionEnabled(false);

    // Pobranie miejsc z DAO
        places2.setAll(DaoFactory.getTicketFreePlacesDao().getFreePlaces(2));
        tableView2.setItems(places2);

    // Kolumny danych
        nr_miejscaCol2.setCellValueFactory(new PropertyValueFactory<>("nr_miejsca"));
        nr_wagonuCol2.setCellValueFactory(new PropertyValueFactory<>("nr_wagonu"));
        nr_przedzialuCol2.setCellValueFactory(new PropertyValueFactory<>("nr_przedzialu"));
        cechyCol2.setCellValueFactory(cellData -> {
            PlaceRecord place = cellData.getValue();
            StringBuilder cechy = new StringBuilder();

            if (place.getCzy_dla_niepelnosprawnych()) {
                cechy.append("♿ "); // ikona albo napis
            }
            if (place.getCzy_dla_rowerow()) {
                cechy.append("🚲 ");
            }

            // jeśli brak cech, możesz wpisać np. "-"
            if (cechy.length() == 0) {
                cechy.append("");
            }

            return new ReadOnlyStringWrapper(cechy.toString().trim());
        });

    // RowFactory z toggle zaznaczenia i podświetleniem
        tableView2.setRowFactory(tv -> {
        TableRow<PlaceRecord> row = new TableRow<>();

        Runnable refreshStyle = () -> {
            if (row.isEmpty() || row.getItem() == null) {
                row.setStyle("");
            } else if (row.isSelected()) {
                row.setStyle("-fx-background-color: #90caf9;"); // kolor podświetlenia
            } else {
                row.setStyle("");
            }
        };

        row.selectedProperty().addListener((obs, was, is) -> refreshStyle.run());
        row.itemProperty().addListener((obs, oldItem, newItem) -> refreshStyle.run());
        row.indexProperty().addListener((obs, oldIdx, newIdx) -> refreshStyle.run());

        row.addEventFilter(MouseEvent.MOUSE_PRESSED, event -> {
            if (!row.isEmpty()) {
                int index = row.getIndex();
                TableView.TableViewSelectionModel<PlaceRecord> sm = tv.getSelectionModel();
                PlaceRecord place = row.getItem();
                if (sm.isSelected(index)) {
                    sm.clearSelection(index);
                    TicketFactory.getActualPrzeazd().getPlacesTwo().removeIf(p -> (p.getNr_miejsca() == place.getNr_miejsca()) && p.getNr_wagonu() == place.getNr_wagonu());
                    System.out.println("Usunięcie miejsca");
                    System.out.println(TicketFactory.getActualPrzeazd().getPlacesOne().size());
                } else {
                    sm.select(index);
                    TicketFactory.getActualPrzeazd().getPlacesTwo().add(new Place(place.getNr_miejsca(),place.nr_wagonu(),place.getNr_przedzialu(), TicketFactory.getActualPrzeazd().getId_przejazdu(),place.czy_dla_rowerow()));
                    System.out.println("Dodanie miejsca");
                }
                event.consume();
                tv.refresh(); // odświeżenie stylu
            }
        });

        return row;
    });
    }


    @FXML public void HandleButton() throws IOException {
        if(TicketFactory.getActualPrzeazd().getPlacesOne().isEmpty() && TicketFactory.getActualPrzeazd().getPlacesTwo().isEmpty()){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Błąd");
            alert.setHeaderText(null);
            alert.setContentText("Nieprawidłowe dane!");
            alert.showAndWait();

        }
        else {
            TicketFactory.getActualPrzeazd().setNumberOfPlaces(
                    TicketFactory.getActualPrzeazd().getPlacesOne().size(),
                    TicketFactory.getActualPrzeazd().getPlacesTwo().size());
            if(!TicketFactory.getActualPrzeazd().getPlacesTwo().isEmpty()) {
                FXMLLoader load = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketChosingUlgiView.fxml"));
                VBox newView = load.load();
                TicketChosingUlgiViewModel viewModel = load.getController();
                viewModel.setTab(tab);
                viewModel.setData();
                tab.setContent(newView);
            }
            else{
                FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketSummaryView.fxml"));
                VBox newView = loader.load();
                TicketSummaryViewModel viewmodel= loader.getController();
                TicketFactory.addingActualToList();
                viewmodel.setTab(tab);
                tab.setContent(newView);
            }
        }
    }

    @FXML public void CofnijButton() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketListOfConnection.fxml"));
        VBox newView = loader.load();
        TicketFactory.getActualPrzeazd().resetData2();
        TicketListOfConnectionViewModel controller = loader.getController();
        TicketFactory.getActualPrzeazd().setDepartureTime(TicketFactory.getActualPrzeazd().lookingHour);
        TicketFactory.getActualPrzeazd().setDepartureDate(TicketFactory.getActualPrzeazd().lookingDay);
        controller.setLabels();
        tab.setContent(newView);
        controller.setData();
        controller.setTab(tab);
    }

}
