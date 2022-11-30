package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class PassengerDAOImpl implements PassangerDAO
{
	
    public static Connection con;

		public static void initDataBase() {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("Driver is loaded.");

				con = DriverManager.getConnection("jdbc:mysql://localhost/Airline_Booking", "root", "root");
				System.out.println("Connection is established.");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		@Override
		public int addPassenger(Passenger passenger) 
		{
			int res = -1;
			ResultSet rs = null;
			Statement stmt = null;
			int autoIncKeyFromFunc = -1;
			try {
				PreparedStatement pst = con.prepareStatement("insert into Passenger(FirstName,LastName,PhNo,NoOfPer,Addr,FlyNo) values (?,?,?,?,?,?)");
				pst.setString(1,passenger.getFirstName());
				pst.setString(2,passenger.getLastName());
				pst.setLong(3,passenger.getMobileNumber());
				pst.setInt(4,passenger.getNoOfPerson());
				pst.setString(5,passenger.getAddress());
				pst.setString(6,passenger.getFlightNumber());
				
				res = pst.executeUpdate();
			    rs = pst.executeQuery("SELECT LAST_INSERT_ID()");

			    if (rs.next()) {
			        autoIncKeyFromFunc = rs.getInt(1);
			    } else {
			        // throw an exception from here
			    }
				
			    
			} catch (SQLException e) 
			{
				e.printStackTrace();
			}

			return autoIncKeyFromFunc;
			
		}

	

		@Override
		public List searchPassenger(Passenger passenger)
		
		{
			List result = null ;
			try {
				PreparedStatement pst = con.prepareStatement("select * from Passenger where FlyNo=?");
				pst.setString(1, passenger.getFlightNumber());
				
				} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			
			
			return result;
		}
   
	}

	

