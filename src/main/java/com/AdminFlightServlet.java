package com;

import java.io.IOException;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Flight;
import model.FlightDAOImpl;
import java.text.DateFormat;
import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AdminFlightServlet")
public class AdminFlightServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 
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
		
           System.out.println("Departure time:"+  request.getParameter("deptime"));
           System.out.println("After change deptime"+deptime);
		       
		    
		        System.out.println("javadate"+schdate);
		        System.out.println("sch sqldate"+sqlschDate);
		        System.out.println("sqlDeptime :"+depTime);
		        int seats=Integer.parseInt(request.getParameter("seats"));
			       int duration=Integer.parseInt(request.getParameter("duration"));
				   double price=Double.parseDouble(request.getParameter("price"));
				
				
				Flight flight=new Flight(request.getParameter("flyno"),request.getParameter("src"),request.getParameter("dest"),sqlArrTime,sqlDepTime,sqlschDate,seats,duration,price);
				 FlightDAOImpl flightDAOImpl= new FlightDAOImpl();
				 FlightDAOImpl.initDataBase();
				flightDAOImpl.addFlight(flight);      
		        
		        
		        
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
			       
	      
		 
		 
		
		
		
	}
}
