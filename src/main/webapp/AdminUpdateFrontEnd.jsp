<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.Passenger,model.PassengerDAOImpl,model.FlightDAOImpl,java.util.*,model.Flight"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
            
			String flyNo = request.getParameter("flynum");	
		     FlightDAOImpl flightDAOImpl= new FlightDAOImpl();
			 FlightDAOImpl.initDataBase();
			 List f=flightDAOImpl.SearchFlightFlyNo(flyNo);
			 Iterator i=f.iterator();
			 Flight f2=null;
			 while(i.hasNext())
			 {
				 f2=(Flight)i.next();
			 }
			 
			 
     %>
     <div class="content">

	<form action="updateFlightDB.jsp"  style="border:1px solid #ccc">
	 <div class="container">
	 <h2>Update Flight information for <%out.print(flyNo); %></h2>
	 <hr>
		
		
	    <label>Source</label> 
		<input type="text" name="src" value="<%out.print(f2.getSource());%>"/><br><br>
		
		<label>Destination</label> 
		<input type="text" name="dest" value="<%out.print(f2.getDestination());%>"/><br><br>
		
		<label> Seats</label> 
		<input type="text" name="seats" value="<%out.print(f2.getSeats());%>"/><br><br>
		
		<label>Duration</label> 
		<input type="text" name="duration" value="<%out.print(f2.getDuration());%>"/><br><br>
		
		<label>Price</label> 
		<input type="text" name="price" value="<%out.print(f2.getPrice());%>"/><br><br>
		
		<label>Arrival Time</label> 
		<input type="time" name="arrtime" value="<%out.print(f2.getArrival_time());%>"/><br><br>
		
		<label>Departure Time</label> 
		<input type="time" name="deptime"value="<%out.print(f2.getDeparture_time());%>"/><br><br>
		
		<label> scheduled Date</label> 
		<input type="date" name="schdate" value="<%out.print(f2.getSchedule());%>"/><br><br>
		
		<input type="hidden" id="flyNum" name="flyNum" value="<%out.print(flyNo);%>"/><br><br>
	
		<input type="submit" name="operation" value="Update"/>
		</div>
	</form>
</div>
</body>
</html>