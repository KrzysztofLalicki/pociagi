package pociagi.app.viewmodel;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import pociagi.app.dao.DaoFactory;

import java.time.LocalDate;
import java.time.LocalTime;

public class SelectPolaczenieViewModel {

    @FXML private VBox root;
    @FXML
    private Label stacjaPoczatkowa;
    @FXML
    private Label stacjaKoncowa;
    @FXML
    private Label dataOdjazdu;
    @FXML
    private Label godzinaOdjazdu;
    @FXML
    private Label czasPodrozy;

    IntegerProperty idStacjiPoczatkowej = new SimpleIntegerProperty();
    IntegerProperty idStacjiKoncowej = new SimpleIntegerProperty();
    ObjectProperty<LocalTime> dataOdjazduProperty = new SimpleObjectProperty<>();

    @FXML
    private void initialize() {
        root.setUserData(this);

        dataOdjazdu.setText("Nie wybrano");
        godzinaOdjazdu.setText("Nie wybrano");
        czasPodrozy.setText("Nie wybrano");

        idStacjiPoczatkowej.addListener((_, _, id) -> {
            stacjaPoczatkowa.setText(DaoFactory.getStacjeDao().getNazwaStacjiById(id.intValue()));
            updateTable();
        });
        idStacjiKoncowej.addListener((_, _, id) -> {
            stacjaKoncowa.setText(DaoFactory.getStacjeDao().getNazwaStacjiById(id.intValue()));
            updateTable();
        });
        dataOdjazduProperty.addListener((_, _, data) -> {
            dataOdjazdu.setText(data.toString());
            updateTable();
        });

    }

    public void setStacjaPoczatkowa(int id) {
        idStacjiPoczatkowej.set(id);
    }

    public void setStacjaKoncowa(int id) {
        idStacjiKoncowej.set(id);
    }

    public void setDataOdjazdu(LocalDate date) {
        dataOdjazduProperty.set(LocalTime.now());
    }

    private void updateTable() {

    }
}
