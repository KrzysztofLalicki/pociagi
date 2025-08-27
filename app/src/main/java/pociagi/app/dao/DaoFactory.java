package pociagi.app.dao;

public class DaoFactory {
    private static final StacjeDao stacjeDao = new StacjeDao();
    public static StacjeDao getStacjeDao() {
        return stacjeDao;
    }

    private static final TimetableDao timetableDao = new TimetableDao();
    public static TimetableDao getTimetableDao() { return timetableDao; }

    private static final TicketConnectionDao ticketConnectionDao = new TicketConnectionDao();
    public static TicketConnectionDao getTicketConnectionDao() { return ticketConnectionDao; }

    private static final UlgiDao ulgiDao = new UlgiDao();
    public static UlgiDao getUlgiDao() { return ulgiDao; }

    private static final AddingTicketDao addingTicketDao = new AddingTicketDao();
    public static AddingTicketDao getAddingTicketDao() { return addingTicketDao; }

    private static final AddingPrzejazdDao addingPrzejazdDao = new AddingPrzejazdDao();
    public static AddingPrzejazdDao getAddingPrzejazdDao() { return addingPrzejazdDao; }

    private static final DeletingPrzejazdDao deletingPrzejazdDao = new DeletingPrzejazdDao();
    public static DeletingPrzejazdDao getDeletingPrzejazdDao() { return deletingPrzejazdDao; }

    private static final DeletingTicketDao deletingTicketDao = new DeletingTicketDao();
    public static DeletingTicketDao getDeletingTicketDao() { return deletingTicketDao; }

    private static final TicketFreePlacesDao ticketFreePlacesDao = new TicketFreePlacesDao();
    public static TicketFreePlacesDao getTicketFreePlacesDao() { return ticketFreePlacesDao; }

    private static final AddingTicketPlacesDao addingTicketPlacesDao = new AddingTicketPlacesDao();
    public static AddingTicketPlacesDao getAddingTicketPlacesDao() { return addingTicketPlacesDao; }

    private static final DeletingFromTicketPlacesDao deletingFromTicketPlacesDao = new DeletingFromTicketPlacesDao();
    public static DeletingFromTicketPlacesDao getDeletingFromTicketPlacesDao() { return deletingFromTicketPlacesDao; }

    private static final AccountTickets accountTicketsDao = new AccountTickets();
    public static AccountTickets getAccountTicketsDao() { return accountTicketsDao; }

    private static final ReturningTicketDao returningTicketDao = new ReturningTicketDao();
    public static ReturningTicketDao getReturningTicketDao() { return returningTicketDao; }
}
