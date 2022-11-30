<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.Passenger,model.PassengerDAOImpl,model.FlightDAOImpl,java.util.*,model.Flight"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
.content {
  max-width: 500px;
 margin-left: 350px; 
  margin-right: 150px;
  margin-top:50px;
}

table{
 border: 2px solid black;
border-collapse: collapse;
  width: 50%;

}
th, td {

  font-size:20px;
  padding: 10px;
  
  border-bottom: 1px solid #ddd;
}
  
tr:nth-child(even) {background-color: #f2f2f2;}

table.center {
  margin-left: 300px; 
  margin-right: 100px;
  margin-top:10px;
}
</style>
<meta charset="ISO-8859-1">
</head>
<body>
     <%
            
			String flyNo = request.getParameter("flyno");	
			String firstName=request.getParameter("firstname");
			String lastName=request.getParameter("lastname");
			Long phoNo=Long.parseLong(request.getParameter("phoneno"));
			Integer noOfPerson=Integer.parseInt(request.getParameter("pxc"));
			String addr=request.getParameter("addr");
			
			Passenger P=new Passenger(flyNo,firstName,lastName,phoNo,noOfPerson,addr);
			PassengerDAOImpl PDAOImpl=new PassengerDAOImpl();
			PassengerDAOImpl.initDataBase();
			int autoIncKeyFromFunc=PDAOImpl.addPassenger(P);
			
			 FlightDAOImpl flightDAOImpl= new FlightDAOImpl();
			 FlightDAOImpl.initDataBase();
			 List f=flightDAOImpl.SearchFlightFlyNo(flyNo);
			 Iterator i=f.iterator();
			 Flight f2=null;
			 while(i.hasNext())
			 {
				 f2=(Flight)i.next();
			 }
			 double paidAmt=(f2.getPrice()*noOfPerson);
			 
     %>
	<table class="center" >
	<tr><td>Flight Details</tr></td>
	<tr><td>Flight Number:<% out.print(" "+flyNo) ;%></td><td>Travel:<% out.print(" "+ f2.getSource()+ " to " + f2.getDestination()) ;%></tr>
	<tr><td>Date:<% out.print(" "+f2.getSchedule()) ;%></td><td>Time:<% out.print(" "+f2.getDeparture_time());%></td></tr>
	<tr><td>Travel duration:<% out.print(" "+f2.getDuration()+" hrs") ;%></td><td>Ticket Price :<% out.print(" "+f2.getPrice()+" Rs") ;%></td></tr>
	<tr><td>Your Details</tr></td>
	<tr><td>Name:<% out.print(" "+firstName +" "+lastName) ;%></td><td>Phone Number:<% out.print(" "+phoNo) ;%></tr>
	<tr><td>No Of Persons:<% out.print(" "+noOfPerson);%></td><td>Aadhar Number:<% out.print(" "+addr) ;%></td></tr>
	<tr><td>Total Price:<% out.print(" "+f2.getPrice()*noOfPerson+" Rs");%></td><td></td></tr>
	</table>
 <div class="content">
    <form action="FinalBookFlight.jsp">
     <div class="container">
    <h1>Payment</h1>
     <label><b>Card No*</b></label>
     <input type="text" placeholder="Enter Card No" name="cardNo" required><br>
     <label ><b>Card Holder Name*</b></label>
     <input type="text" placeholder="Enter Card Holder name" name="cardHolderName" required><br>
      <label ><b>Month*</b></label>
     <input type="text" placeholder="MM" name="MM" required><br>
      <label ><b>Year*</b></label>
     <input type="text" placeholder="YYYY" name="YYYY" required><br>
      
     <label ><b>CVV Number*</b></label>
     <input type="text" placeholder="Enter CVV" name="CVV" required><br>
      <input type="hidden" id="userId" name="userId" value="<%out.print(autoIncKeyFromFunc);%>">
      <input type="hidden" id="paidAmt" name="paidAmt" value="<%out.print(paidAmt);%>">
      <input type="hidden" id="flyno" name="flyno" value="<%out.print(flyNo);%>">
      <input type="hidden" id="pxn" name="pxn" value="<%out.print(noOfPerson);%>">
      <input type="hidden" id="firstname" name="firstname" value="<%out.print(firstName);%>">
      <input type="hidden" id="lastname" name="lastname" value="<%out.print(addr);%>">
      <input type="hidden" id="phono" name="phoneno" value="<%out.print(phoNo);%>">
      <input type="hidden" id="addr" name="addr" value="<%out.print(addr);%>">
	<input type="submit" value="Payment and Book">
</div></form></div>
</body>
</html>