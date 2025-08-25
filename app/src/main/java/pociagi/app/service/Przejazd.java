package pociagi.app.service;

import pociagi.app.model.Stacja;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class Przejazd {
    private  Stacja startStation;
    private Stacja endStation;
    private Integer numberOfPlacesOne;
    private Integer numberOfPlacesTwo;
    private LocalDate departureDate;
    private LocalTime departureTime;
    private Integer id_polaczenia;
    private List<Place> places = new ArrayList<>();
    private Integer id_biletu;
    private Integer id_przejazdu;
    private LocalTime czas;

    public Przejazd(Integer id_biletu) { this.id_biletu = id_biletu;  }
    public Przejazd() {}

    public void setStartStation(Stacja startStation) {this.startStation = startStation;    }
    public void setEndStation(Stacja endStation) {        this.endStation = endStation;    }
    public void setNumberOfPlaces(Integer numberOfPlacesOne, Integer numberOfPlacesTwo) {
        this.numberOfPlacesOne = numberOfPlacesOne;
        this.numberOfPlacesTwo = numberOfPlacesTwo;
    }
    public void setDepartureDate(LocalDate departureDate) { this.departureDate = departureDate;    }
    public void setDepartureTime(LocalTime departureTime) { this.departureTime = departureTime;   }
    public void setId_polaczenia(Integer id_polaczenia) {  this.id_polaczenia = id_polaczenia;  }
    public void addPlace(Place place) { places.add(place); }
    public void setId_biletu(Integer id_biletu) { this.id_biletu = id_biletu;    }
    public void setCzas(LocalTime czas) { this.czas = czas; }
    public void setId_przejazdu(Integer id) { this.id_przejazdu = id;    }
    public Integer getId_przejazdu() { return id_przejazdu; }
    public Integer getId_biletu() { return id_biletu; }
    public Integer getNumberOfPlacesOne() {   return numberOfPlacesOne;  }
    public Integer getNumberOfPlacesTwo() {    return numberOfPlacesTwo;  }
    public LocalDate getDepartureDate() { return departureDate;  }
    public LocalTime getDepartureTime() {  return departureTime; }
    public Stacja getStartStation() { return startStation;  }
    public Stacja getEndStation() {   return endStation;   }
    public Integer getId_polaczenia() { return id_polaczenia;  }
    public LocalTime getCzas() { return czas;   }

}