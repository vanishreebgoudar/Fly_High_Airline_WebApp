package model;

import java.util.List;

public interface FlightDAO 
{
   void addFlight(Flight Flight);
   List SearchFlight(Flight Flight);
}
