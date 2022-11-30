<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.Passenger,model.PassengerDAOImpl,model.FlightDAOImpl,java.util.*,model.Flight,java.text.DateFormat,java.text.ParseException,java.text.SimpleDateFormat,java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
DateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
DateFormat dateFormat = new SimpleDateFormat("hh:mm:ss");
DateFormat formatter1 = new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat format = new SimpleDateFormat("HH:mm");
//DateFormat formatter = new SimpleDateFormat("HH:mm");
Date arrtime = null,deptime = null;
String flyNo=null,Src=null,Dest=null;

try {
	
   
java.util.Date schdate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("schdate"));
java.sql.Date sqlschDate = new java.sql.Date(schdate.getTime());

java.util.Date depTime =(java.util.Date)format.parse(request.getParameter("deptime"));

java.sql.Time sqlDepTime = new java.sql.Time(depTime.getTime());

java.util.Date arrTime =(java.util.Date)format.parse(request.getParameter("arrtime"));

java.sql.Time sqlArrTime = new java.sql.Time(arrTime.getTime());

   
   
        int seats=Integer.parseInt(request.getParameter("seats"));
	       int duration=Integer.parseInt(request.getParameter("duration"));
		   double price=Double.parseDouble(request.getParameter("price"));
		
	    FlightDAOImpl flightDAOImpl= new FlightDAOImpl();
		 FlightDAOImpl.initDataBase();
		flightDAOImpl.UpdateFlight(request.getParameter("flyNum"),request.getParameter("src"),request.getParameter("dest"), sqlArrTime, sqlDepTime, sqlschDate, seats, duration, price);     
      out.print("Data updated Successfully");
}catch (ParseException e) {
	// TODO Auto-generated catch block
	out.print(e);
}  
	       

%>
</body>
</html>