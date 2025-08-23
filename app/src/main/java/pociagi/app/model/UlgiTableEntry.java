package pociagi.app.model;

public record UlgiTableEntry(
        Integer id_ulgi,
        String nazwa,
        Integer znizka) {
    public Integer getId_ulgi() {return id_ulgi;}
    public String getNazwa() {return nazwa;}
    public Integer getZnizka() {return znizka;}
}
