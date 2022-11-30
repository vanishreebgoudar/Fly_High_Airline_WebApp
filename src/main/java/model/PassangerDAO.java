package model;

import java.util.List;

public interface PassangerDAO 
{

	int addPassenger(Passenger passenger);
	List searchPassenger(Passenger passenger);
	
}
