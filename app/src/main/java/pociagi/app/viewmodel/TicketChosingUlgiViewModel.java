package pociagi.app.viewmodel;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.control.Tab;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import pociagi.app.dao.DaoFactory;
import pociagi.app.model.UlgiTableEntry;
import pociagi.app.service.Place;
import pociagi.app.service.TicketFactory;

import java.io.IOException;

public class TicketChosingUlgiViewModel {

    private Tab tab;
    public void setTab(Tab tab) {
        this.tab = tab;
    }

    @FXML
    HBox mainHBox;
    @FXML VBox vbox1, vbox2, vbox11, vbox12, vbox13, vbox14, vbox21, vbox22, vbox23, vbox24;

    public void setData(){
        vbox1.setVisible(false);
        vbox1.setManaged(false);
        vbox2.setVisible(false);
        vbox2.setManaged(false);
        if( TicketFactory.getActualPrzeazd().getNumberOfPlacesOne() > 0) {
            for (Place place : TicketFactory.getActualPrzeazd().getPlacesOne()) {
                vbox11.getChildren().add(new Label( String.valueOf(place.getNr_miejsca())));
                vbox12.getChildren().add(new Label( String.valueOf(place.getNr_wagonu())));
                vbox13.getChildren().add(new Label( String.valueOf(place.getNr_przedzialu())));
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
                cb.getSelectionModel().selectedIndexProperty().addListener((observable, oldValue, newValue) -> {
                    place.setId_ulgi(cb.getSelectionModel().getSelectedItem().getId_ulgi());
                });
                cb.setPrefWidth(120);
                cb.setMinWidth(120);
                cb.setMaxWidth(120);
                cb.getItems().addAll(DaoFactory.getUlgiDao().getUlgiTable());
                cb.getSelectionModel().selectFirst();
                vbox14.getChildren().add(cb);
            }
            System.out.println("Set data in ulgi One");
            vbox1.setVisible(true);
            vbox1.setManaged(true);
        }
        if( TicketFactory.getActualPrzeazd().getNumberOfPlacesTwo() > 0) {
            for (Place place : TicketFactory.getActualPrzeazd().getPlacesTwo()) {
                System.out.println("Set data in ulgi Two");
                vbox21.getChildren().add(new Label( String.valueOf(place.getNr_miejsca())));
                vbox22.getChildren().add(new Label( String.valueOf(place.getNr_wagonu())));
                vbox23.getChildren().add(new Label( String.valueOf(place.getNr_przedzialu())));
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
                vbox24.getChildren().add(cb);
            }
            vbox2.setVisible(true);
            vbox2.setManaged(true);
        }
    }

    @FXML public void HandleButton() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/TicketSummaryView.fxml"));
        VBox newView = loader.load();

        TicketSummaryViewModel viewmodel= loader.getController();
        TicketFactory.addingActualToList();
        viewmodel.setTab(tab);
        tab.setContent(newView);
    }



}
