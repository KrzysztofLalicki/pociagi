package pociagi.app.service;

public class Place {
    private Integer nr_miejsca;
    private Integer nr_wagonu;
    private Integer nr_przedzialu;
    private Integer id_ulgi = 1;
    private Integer id_przejazdu;
    public Place(Integer nr_miejsca, Integer nr_wagonu, Integer nr_przedzialu, Integer id_przejazdu) {
        this.nr_miejsca = nr_miejsca;
        this.nr_wagonu = nr_wagonu;
        this.nr_przedzialu = nr_przedzialu;
        this.id_przejazdu = id_przejazdu;
    }
    public Integer getId_ulgi() { return id_ulgi; }
    public void setId_ulgi(Integer id_ulgi) { this.id_ulgi = id_ulgi; }
    public Integer getNr_miejsca() { return nr_miejsca;}
    public void setNr_miejsca(Integer nr_miejsca) { this.nr_miejsca = nr_miejsca; }
    public Integer getNr_wagonu() { return nr_wagonu; }
    public void setNr_wagonu(Integer id_wagonu) { this.nr_wagonu = id_wagonu; }
    public Integer getNr_przedzialu() { return nr_przedzialu; }
    public void setNr_przedzialu( Integer nr_przedzialu) { this.nr_przedzialu = nr_przedzialu; }
    public Integer getId_przejazdu() { return id_przejazdu; }
}
