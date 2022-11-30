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

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		User user = new User(0, request.getParameter("username"), request.getParameter("password"));

		UserDAOImpl userDAOImpl = new UserDAOImpl();

		UserDAOImpl.initDataBase();
		boolean res = userDAOImpl.signup(user);

		if (res) {
			out.println("<h2>Sign Up Successfull !</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp");
			rd.forward(request, response);
			response.sendRedirect("SignInFront.jsp?success=1");
		}

		else {
			out.println("<h2>There was some error, please try again</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("signup.html");
			rd.include(request, response);
		}

	}

}
