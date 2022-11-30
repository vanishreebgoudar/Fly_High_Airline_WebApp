package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAOImpl implements UserDAO {
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
	public boolean signin(User user) {
		try {
			PreparedStatement pst = con.prepareStatement("select * from users where username=? and password=?");
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			ResultSet rs = pst.executeQuery();
			if (rs != null && rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean signup(User user) {

		int res = -1;
		try {
			PreparedStatement pst = con.prepareStatement("insert into users(username, password) values (?,?)");
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			res = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return (res == 1) ? true : false;
	}

}
