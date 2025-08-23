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
}
