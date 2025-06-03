package pociagi.app.viewmodel;

import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.BorderPane;
import pociagi.app.dao.DaoFactory;
import pociagi.app.model.Stacja;

public class SelectStationViewModel {
    @FXML private TextField searchField;
    @FXML private TableView<Stacja> tableView;
    @FXML private TableColumn<Stacja, String> nazwaCol;
    @FXML private Label lblNazwa;
    @FXML private BorderPane root;

    private final ObservableList<Stacja> stationList = FXCollections.observableArrayList();
    private final ObjectProperty<Stacja> stacja = new SimpleObjectProperty<>();

    @FXML
    public void initialize() {
        root.setUserData(this);

        searchField.setOnKeyTyped(_ -> {
            tableView.getSelectionModel().clearSelection();
            String prefix = searchField.getText();
            stationList.setAll(DaoFactory.getStacjeDao().findByPrefix(prefix));
        });

        tableView.setItems(stationList);

        tableView.getSelectionModel().selectedItemProperty().addListener((obs, oldStacja, newStacja) -> {
            if (newStacja != null) {
                stacja.set(newStacja);
                searchField.setText(newStacja.getNazwa());
            }
        });

        stacja.addListener((obs, oldStacja, newStacja) -> lblNazwa.setText(newStacja.getNazwa()));

        nazwaCol.setCellValueFactory(new PropertyValueFactory<>("nazwa"));
    }

    public ObjectProperty<Stacja> getStacjaProperty() {
        return stacja;
    }
}