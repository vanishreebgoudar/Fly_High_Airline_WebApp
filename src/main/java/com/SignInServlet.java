package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import model.UserDAOImpl;

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String username= request.getParameter("username");
		String password=request.getParameter("password");
		if(username.equals("Admin") && password.equals("Admin"))
		{
			out.println("<h2>Sign In Successfull !</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("AdminWelcome.html");
			rd.forward(request, response);
			
			
		}
		else
		{
		User user = new User(0,username,password);
		
		UserDAOImpl userDAOImpl = new UserDAOImpl();
		
		UserDAOImpl.initDataBase();
		boolean res = userDAOImpl.signin(user);
		
		if(res) {
			out.println("<h2>Sign In Successfull !</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
		
		else {
			out.println("<h2>Credentials did not match please try one more time</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("SignInFront.jsp");
			rd.include(request, response);
		}
		}

	}

}
