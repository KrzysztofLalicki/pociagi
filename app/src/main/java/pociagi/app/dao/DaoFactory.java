package pociagi.app.dao;

public class DaoFactory {
    private static final StacjeDao stacjeDao = new StacjeDao();
    public static StacjeDao getStacjeDao() {
        return stacjeDao;
    }

}
