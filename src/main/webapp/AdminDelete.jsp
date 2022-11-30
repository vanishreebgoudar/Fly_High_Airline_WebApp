<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"   import ="model.Flight,model.FlightDAOImpl,java.text.*,java.util.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<button type="button" onclick="location.href='AdminWelcome.html'">Admin Home Page</button>
<button type="button" onclick="location.href='AdminFlightSearch.jsp'">Previous Page</button>
<%    try{
			String Fly_num = request.getParameter("flynum");
			System.out.println("flight"+Fly_num);
			FlightDAOImpl flightDAOImpl= new FlightDAOImpl();
			FlightDAOImpl.initDataBase();
			flightDAOImpl.deleteFlight(Fly_num);
			out.print("Data Deleted Successfully");
}
catch(Exception e)
{
	out.print(e);
}
%>
</body>
</html>