package pociagi.app.viewmodel;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.HBox;
import pociagi.app.dao.DaoFactory;
import pociagi.app.model.ConnectionsTableEntry;
import pociagi.app.model.TicketsTableEntry;

import java.io.IOException;
import java.util.Date;

public class ArchiwumViewModel {

    private Tab tab;

    @FXML
    TableView<TicketsTableEntry> tableView;

    @FXML
    TableColumn<TicketsTableEntry, Integer> idCol;
    @FXML TableColumn<TicketsTableEntry, Date> data_zakupuCol;
    @FXML TableColumn<TicketsTableEntry, Date> data_zwrotuCol;
    @FXML TableColumn<TicketsTableEntry, Void> akcjaCol;

    private final ObservableList<TicketsTableEntry> ticketsList = FXCollections.observableArrayList();

    public void setData(Tab tab){
        this.tab = tab;
        ticketsList.addAll(DaoFactory.getAccountTicketsDao().getTicketsTableEntry(1));
        tableView.setItems(ticketsList);
    }

    @FXML
    public void initialize() {
        idCol.setCellValueFactory(new PropertyValueFactory<>("id_biletu"));
        data_zakupuCol.setCellValueFactory(new PropertyValueFactory<>("data_zakupu"));
        data_zwrotuCol.setCellValueFactory(new PropertyValueFactory<>("data_zwrotu"));

        // Dodanie przycisku w kolumnie
        akcjaCol.setCellFactory(col -> new TableCell<>() {
            private final Button btn = new Button("Zwrot");

            {
                btn.setOnAction(event -> {
                    TicketsTableEntry ticket = getTableView().getItems().get(getIndex());

                    if (ticket.getCzy_mozna_zwrocic()) {
                        // TODO: wywołaj DAO do zwrotu biletu
                        System.out.println("Zwracam bilet: " + ticket.getId_biletu());
                    } else {
                        // np. alert, że nie można zwrócić
                        Alert alert = new Alert(Alert.AlertType.WARNING, "Tego biletu nie można zwrócić!");
                        alert.showAndWait();
                    }
                });
            }

            @Override
            protected void updateItem(Void item, boolean empty) {
                super.updateItem(item, empty);
                if (empty) {
                    setGraphic(null);
                } else {
                    TicketsTableEntry ticket = getTableView().getItems().get(getIndex());
                    btn.setDisable(!ticket.getCzy_mozna_zwrocic()); // przycisk aktywny tylko gdy można zwrócić
                    setGraphic(btn);
                }
            }
        });
    }


    @FXML public void CofnijButton() throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/pociagi/app/view/AccountView.fxml"));
        HBox newView = loader.load();

        AccountViewModel controller = loader.getController();
        controller.setTab(tab);

        tab.setContent(newView);
    }

}
