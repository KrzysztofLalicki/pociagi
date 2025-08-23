package pociagi.app.service;

import pociagi.app.model.Stacja;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class TicketFinding {
    private Stacja startStation;
    private Stacja endStation;
    private Integer numberOfPlacesOne;
    private Integer numberOfPlacesTwo;
    private LocalDate departureDate;
    private LocalTime departureTime;

    public void setStartStation(Stacja startStation) {
        this.startStation = startStation;
    }
    public void setEndStation(Stacja endStation) {
        this.endStation = endStation;
    }
    public void setNumberOfPlaces(Integer numberOfPlacesOne, Integer numberOfPlacesTwo) {
        this.numberOfPlacesOne = numberOfPlacesOne;
        this.numberOfPlacesTwo = numberOfPlacesTwo;
    }
    public void setDepartureDate(LocalDate departureDate) {
        this.departureDate = departureDate;
    }
    public void setDepartureTime(LocalTime departureTime) {
        this.departureTime = departureTime;
    }

    public Integer getNumberOfPlacesOne() {
        return numberOfPlacesOne;
    }
    public Integer getNumberOfPlacesTwo() {
        return numberOfPlacesTwo;
    }
    public LocalDate getDepartureDate() {
        return departureDate;
    }
    public LocalTime getDepartureTime() {
        return departureTime;
    }
    public Stacja getStartStation() {
        return startStation;
    }
    public Stacja getEndStation() {
        return endStation;
    }

}
