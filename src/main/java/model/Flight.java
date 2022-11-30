package model;
import java.sql.Date;

import java.sql.Time;

import javax.persistence.*;
@Entity
public class Flight 
{
	public Flight() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Id
	private String fly_Num;
	private String source;
	private String destination;
	private Time arrival_time;
	private Time departure_time;
	private Date schedule;
	private int seats;
	private int duration;
	private double price;
	public Flight(String fly_Num, String source, String destination, Time arrival_time, Time departure_time,
			Date schedule, int seats, int duration, double price) {
		super();
		this.fly_Num = fly_Num;
		this.source = source;
		this.destination = destination;
		this.arrival_time = arrival_time;
		this.departure_time = departure_time;
		this.schedule = schedule;
		this.seats = seats;
		this.duration = duration;
		this.price = price;
	}
	public Flight(String Source,String Destination,Date sqlschDate)
	{
		source=Source;
		destination=Destination;
		schedule=sqlschDate;
	}
	
	
	
	public String getFly_Num() {
		return fly_Num;
	}
	public void setFly_Num(String fly_Num) {
		this.fly_Num = fly_Num;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public Time getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(Time arrival_time) {
		this.arrival_time = arrival_time;
	}
	public Time getDeparture_time() {
		return departure_time;
	}
	public void setDeparture_time(Time departure_time) {
		this.departure_time = departure_time;
	}
	public Date getSchedule() {
		return schedule;
	}
	public void setSchedule(Date schedule) {
		this.schedule = schedule;
	}
	public int getSeats() {
		return seats;
	}
	public void setSeats(int seats) {
		this.seats = seats;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Flight [fly_Num=" + fly_Num + ", source=" + source + ", destination=" + destination + ", arrival_time="
				+ arrival_time + ", departure_time=" + departure_time + ", schedule=" + schedule + ", seats=" + seats
				+ ", duration=" + duration + ", price=" + price + ", getFly_Num()=" + getFly_Num() + ", getSource()="
				+ getSource() + ", getDestination()=" + getDestination() + ", getArrival_time()=" + getArrival_time()
				+ ", getDeparture_time()=" + getDeparture_time() + ", getSchedule()=" + getSchedule() + ", getSeats()="
				+ getSeats() + ", getDuration()=" + getDuration() + ", getPrice()=" + getPrice() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
}

