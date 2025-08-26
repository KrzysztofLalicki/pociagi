package pociagi.app.model;

public record PlaceRecord(
        Integer nr_wagonu,
        Integer nr_miejsca,
        Integer nr_przedzialu)
{
    public Integer getNr_miejsca() { return nr_miejsca; }
    public Integer getNr_wagonu() { return nr_wagonu; }
    public Integer getNr_przedzialu() { return nr_przedzialu; }
}
