package pociagi.app.model;

public record Stacja(int idStacji, String nazwa, int tory) {
    public int getIdStacji(){
        return idStacji;
    }
    public String getNazwa(){
        return nazwa;
    }
    public int getTory(){
        return tory;
    }
}
