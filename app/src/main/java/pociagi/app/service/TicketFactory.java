package pociagi.app.service;

import pociagi.app.dao.DaoFactory;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class TicketFactory {
    public static List<Przejazd> list = new ArrayList<Przejazd>();
    private static Integer id;
    private static LocalDate data_zakupu;
    private static Przejazd actualPrzeazd = new Przejazd();
    private static boolean isCreated = false;

    public static boolean isCreated() {
        return isCreated;
    }
    public static void setIsCreated(boolean value) { isCreated = value; }

    public static void setId(Integer id) { TicketFactory.id = id;}
    public static  Integer getId() { return id; }
    public static LocalDate getData_zakupu() { return data_zakupu; }
    public static void setData_zakupu(LocalDate data_zakupu) { TicketFactory.data_zakupu = data_zakupu; }
    public static void makeTicket() {DaoFactory.getAddingTicketDao().addTicket(); actualPrzeazd.setId_biletu(id); isCreated = true; }
    public static Przejazd getActualPrzeazd() { return actualPrzeazd; }
    public static void setActualPrzeazd(Przejazd actualPrzeazd) { TicketFactory.actualPrzeazd = actualPrzeazd; }

    public static void addingActualToList(){
        list.add(actualPrzeazd);
        DaoFactory.getAddingPrzejazdDao().addPrzejazd(actualPrzeazd);
        DaoFactory.getAddingTicketPlacesDao().addToTicketPlaces();
        actualPrzeazd = new Przejazd(id);
    }
}
