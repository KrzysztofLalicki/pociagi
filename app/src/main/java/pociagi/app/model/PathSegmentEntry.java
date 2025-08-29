package pociagi.app.model;

import java.time.LocalDate;
import java.time.LocalTime;

public record PathSegmentEntry(
        Integer connectionId,
        String startStation,
        LocalDate departureDate,
        LocalTime departureTime,
        String endStation,
        LocalDate arrivalDate,
        LocalTime arrivalTime
) {
    public Integer getConnectionId() { return connectionId; }
    public String getStartStation() { return startStation; }
    public LocalDate getDepartureDate() { return departureDate; }
    public LocalTime getDepartureTime() { return departureTime; }
    public String getEndStation() { return endStation; }
    public LocalDate getArrivalDate() { return arrivalDate; }
    public LocalTime getArrivalTime() { return arrivalTime; }
}
