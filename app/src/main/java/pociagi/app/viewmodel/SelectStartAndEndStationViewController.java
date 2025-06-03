package pociagi.app.viewmodel;

import javafx.application.Platform;
import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Button;
import javafx.scene.layout.VBox;
import pociagi.app.model.Stacja;

import javax.swing.text.View;

public class SelectStartAndEndStationViewController {
    @FXML private VBox root;
    @FXML private Node startStationView;
    @FXML private Node endStationView;
    @FXML private Button dalejButton;

    private ObjectProperty<Stacja> startStation;
    private ObjectProperty<Stacja> endStation;

    @FXML
    public void initialize() {
        startStation = ((SelectStationViewModel)startStationView.getUserData()).getStacjaProperty();
        endStation = ((SelectStationViewModel)endStationView.getUserData()).getStacjaProperty();

        dalejButton.setOnAction(event -> {
            if(startStation.get() != null && endStation.get() != null) {
//                Node selctPolaczenieView = javafx.fxml.FXMLLoader.load(getClass().getResource("SelectPolaczenieView.fxml"));
//                root.getParent().getScene().setRoot((Parent) dalejButton.getUserData());
            }
        });
    }
}
