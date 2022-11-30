<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"   import ="model.Flight,model.FlightDAOImpl,java.text.*,java.util.*"
    %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table{
 border: 2px solid black;
border-collapse: collapse;
  width: 50%;

}
th, td {

  font-size:20px;
  padding: 10px;
  text-align: center;
  border-bottom: 1px solid #ddd;
}
  

tr:nth-child(even) {background-color: #f2f2f2;}
tr:hover {background-color: coral;}
table.center {
  margin-left: 300px; 
  margin-right: 150px;
  margin-top: 30px;
}
</style>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!  
String Source =null,Destination=null;
java.util.Date schdate=null;

%>

<%
 FlightDAOImpl flightDAOImpl=new FlightDAOImpl();
 FlightDAOImpl.initDataBase();
 List f=flightDAOImpl.SearchAllFlight();
 Iterator i=f.iterator();
 System.out.println(f);
 %>
<h1 style="margin-left: 50px;mamargin-top:50px;"><h1> All Flights List</h1> </h1>

<button type="button" onclick="location.href='AdminFlightSearch.html'">Back to Previous Page</button>  
<TABLE class='center' BORDER="1">
 <TR>
      <TH>Flight Number </TH>
      <TH>Departure Time</TH>
      <TH>Duration in hours</TH>
      <TH>Arrival Time</TH>
      <TH>Price in Rs</TH>
      
      </TR>
      <% 
	while(i.hasNext())
	{
		 %>
		<tr>
        <% Flight f2=(Flight)i.next();%>
		<td><% out.print(f2.getFly_Num()) ;%></td>
	    <td><% out.print(f2.getDeparture_time()); %></td>
	     <td><% out.print(f2.getDuration()); %></td>
	      <td><% out.print(f2.getArrival_time()); %></td>
	      <td><% out.print(f2.getPrice()); %></td>
	     <td><form action="AdminUpdateFrontEnd.jsp">
         <input type="hidden" name="flynum" value="<%=f2.getFly_Num()%>"/>
         <input type="submit" value="Update">
        </form></td>
        <td><form action="AdminDelete.jsp">
        <input type="hidden" name="flynum" value="<%=f2.getFly_Num()%>"/>
        <input type="submit" value="Delete">
        </form></td>
	   
	    </tr><%
	    
	}
%>
</TABLE>

 


</body>
</html>