package pociagi.app.viewmodel;

import javafx.fxml.FXML;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;

public class MainViewModel {
    @FXML private TabPane tabPane;
    @FXML private Tab rozkladJazdy;
    @FXML private Tab wyszukiwarkaPolaczen;
    @FXML private Tab bilet;

    @FXML private TicketViewModel TicketViewController;



    @FXML
    public void initialize() {
        if (TicketViewController != null && bilet != null) {
            TicketViewController.setTab(bilet);
            System.out.println("Wyszukiwarka polaczen");
        }
//        tabPane.getSelectionModel().selectedItemProperty().addListener((obs, oldTab, newTab) -> {
//            if (newTab != null) {
//                System.out.println("Selected tab: " + newTab.getText());
//                if (newTab == rozkladJazdy) {
//                    onRozkladJazdySelected();
//                } else {
//                    onOtherTabSelected();
//                }
//            }
//        });
    }
}