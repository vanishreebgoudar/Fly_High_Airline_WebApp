<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
 body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}
input[type=text], input[type=password] {
  width: 100%;
  padding: 10px;
  margin: 4px 0 15px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

.container {
  padding: 16px;
}
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
.center {
  max-width: 500px;
  margin: auto;
}
</style>

<meta charset="ISO-8859-1">

</head>
<body>
<%
  String flyno=request.getParameter("flynum");
  
%>
<div class="center">
 <form action="Payment.jsp"style="border:1px solid #ccc">
 <div class="container">
 <h2>Add your information</h2>
 <hr>
    <label>Flight Number</label> 
	<input type="text" name="flyno" value="<% out.print(flyno);%>"/><br><br>
	 
    <label>First Name*</label> 
	<input type="text" name="firstname" place holder="Enter first name"/><br><br>
	 <label>Last Name*</label> 
	 <input type="text" name="lastname"place holder="Enter Last name"/><br><br>
	 <label>Phone Number*</label> 
	 <input type="text" name="phoneno" place holder="Enter phone Number"/><br><br>
     <label> No Of Person</label> 
	<input type="text" name="pxc"/><br><br>
	<label>Enter Aadhar Number </label> 
	<input type="text" name="addr" place holder="Enter Aadhar Number"/><br><br>
	
	
	
	
	<input type="submit" name="operation" value="Process to Payment"/>
	</div>
</form>
 </div>
 
 
</body>
</html>