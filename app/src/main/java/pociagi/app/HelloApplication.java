package pociagi.app;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;
import pociagi.app.dao.DaoFactory;
import pociagi.app.service.TicketFactory;

import java.io.IOException;

public class HelloApplication extends Application {

    static {
        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            System.out.println("Zamykanie aplikacji...");
            DaoFactory.getDeletingTicketDao().delete();
        }));
    }

    @Override
    public void start(Stage stage) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("view/MainView.fxml"));
        Scene scene = new Scene(fxmlLoader.load(), 1280, 720);
        stage.setTitle("Pociągi");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}