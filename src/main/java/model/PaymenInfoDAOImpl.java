package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PaymenInfoDAOImpl implements PaymentInfoDAO 
{
	public static Connection con;

	public static void initDataBase()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver is loaded.");

			con = DriverManager.getConnection("jdbc:mysql://localhost/Airline_Booking", "root", "root");
			System.out.println("Connection is established.");

		   } catch (Exception e) 
		   {
			e.printStackTrace();
		   }
	}
	
	
	
	
	@Override
	public boolean addPaymentinfo(PaymentInfo payInfo)
	{
		int res = -1;
		
		try {
			PreparedStatement pst = con.prepareStatement("insert into PaymentInfo(userId,cardNo,cardHolderName,cardMon,cardYear,paidDate,paidAmt) values (?,?,?,?,?,?,?)");
			pst.setInt(1,payInfo.getUserId());
			pst.setString(2,payInfo.getCardNumber());
			pst.setString(3,payInfo.getCardHolderName());
			pst.setString(4,payInfo.getMonth());
			pst.setString(5,payInfo.getYear());
			pst.setDate(6,payInfo.getPaidDate());
			pst.setDouble(7,payInfo.getPaidAmount());
			res = pst.executeUpdate();
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}

		return (res == 1) ? true : false;
		
	}

}
