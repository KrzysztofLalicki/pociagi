package pociagi.app.model;

public record PlaceRecord(
        Integer nr_wagonu,
        Integer nr_miejsca,
        Integer nr_przedzialu,
        boolean czy_dla_niepelnosprawnych,
        boolean czy_dla_rowerow)
{
    public Integer getNr_miejsca() { return nr_miejsca; }
    public Integer getNr_wagonu() { return nr_wagonu; }
    public Integer getNr_przedzialu() { return nr_przedzialu; }
    public boolean getCzy_dla_rowerow() { return czy_dla_rowerow; }
    public boolean getCzy_dla_niepelnosprawnych() { return czy_dla_niepelnosprawnych; }
}
