package pociagi.app.viewmodel;

import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import pociagi.app.dao.DaoFactory;

public class RegistrationViewModel {

    @FXML
    TextField imieField, nazwiskoField, mailField;


    @FXML void initialize() {
        imieField.setPromptText("Imie");
        nazwiskoField.setPromptText("Nazwisko");
        mailField.setPromptText("Mail");
    }

    @FXML void register() {
        try{
            DaoFactory.getAddingPassengerDao().add(imieField.getText(), nazwiskoField.getText(), mailField.getText());
            imieField.clear();
            nazwiskoField.clear();
            mailField.clear();
        } catch (Exception e) {
            System.out.println(">>> Wszedłem do catch! <<<");
            e.printStackTrace();
            Platform.runLater(() -> {
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Błąd");
                alert.setHeaderText(null);
                alert.setContentText("Nieprawidłowe dane!");
                alert.showAndWait();
            });
        }

    }
}
