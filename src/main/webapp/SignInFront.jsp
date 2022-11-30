<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 margin-left: 500px; 
  margin-right: 150px;
  margin-top:100px;
}

</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


  <div class="content">
  <form action="SignInServlet" method="post" style="border:1px solid #ccc">
  <div class="container">
    <h1>Sign In</h1>
    <p>Please Enter Details.</p>
    <hr>

             <label for="email"><b>User Name</b></label>
             <input type="text" placeholder="Enter User Name" name="username" required>

             <label for="psw"><b>Password</b></label>
             <input type="password" placeholder="Enter Password" name="password" required>
            <div class="clearfix">
            <button type="button" class="cancelbtn">Cancel</button>
            <button type="submit" class="signupbtn">Sign In</button>
   
    </div>
    <p>New user <a href="SignUp.jsp" style="color:dodgerblue">click here</a>.</p>
         </div>
     </form>
  </div>
 </body>
</html>