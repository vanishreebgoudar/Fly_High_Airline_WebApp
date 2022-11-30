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
  margin-top:150px;
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
     
     DateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
      DateFormat formatter1 = new SimpleDateFormat("dd/MM/yyyy");
        Source = request.getParameter("src");	
        Destination=request.getParameter("des");
        java.util.Date schdate=null;
        
       java.sql.Date sqlschDate=null;

try {
	 schdate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
    sqlschDate = new java.sql.Date(schdate.getTime());
	
      } catch (ParseException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
    }


 Flight f1=new Flight(Source,Destination,sqlschDate);
 FlightDAOImpl flightDAOImpl= new FlightDAOImpl();
 FlightDAOImpl.initDataBase();
 List f=flightDAOImpl.SearchFlight(f1);
 Iterator i=f.iterator();
 System.out.println(f);
 %>
<h1 style="margin-left: 50px;mamargin-top:50px;">Flights From <%out.print(Source);%> to <%out.print(Destination); %> on <%out.print(sqlschDate); %> </h1>

<button type="button" onclick="location.href='index.html'">Back to Previous Page</button>  
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
	     
	    <td><form action="Passenger.jsp">
        <input type="hidden" name="flynum" value="<%=f2.getFly_Num()%>" />
        <input type="submit" value="Book">
</form></td>
	    </tr><%
	    
	}
%>
</TABLE>

 


</body>
</html>