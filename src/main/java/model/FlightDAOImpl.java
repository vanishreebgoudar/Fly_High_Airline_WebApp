package model;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;



public class FlightDAOImpl implements FlightDAO 
{
	static Session session;
	static Transaction tx;
	public static void initDataBase() {
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		
		SessionFactory factory=cfg.buildSessionFactory();
		session=factory.openSession();
		 tx=session.beginTransaction();
		
	}
	@Override
	public void  addFlight(Flight flight) 
	{
		
		try {
        session.save(flight);
		tx.commit();
		System.out.println("Data inserted Successfully....!");
		}
		catch (Exception e) {
			System.out.println(e);
		}
     }
	public boolean UpdateFlight(String fly_Num, String source, String destination, Time arrival_time, Time departure_time,
			Date schedule, int seats, int duration, double price)
	{
		String hql2 = "UPDATE Flight SET source=:source,destination=:destination,arrival_time=:arrival_time,"
				+ "departure_time=:departure_time,schedule=:schedule,seats=:seats,duration=:duration,price=:price WHERE fly_Num=:fly_Num";
		Query query1 = session.createQuery(hql2);
		query1.setParameter("fly_Num",fly_Num);
		query1.setParameter("source",source);
		query1.setParameter("destination",destination);
		query1.setParameter("arrival_time",arrival_time);
		query1.setParameter("departure_time",departure_time);
		query1.setParameter("schedule",schedule);
		query1.setParameter("seats",seats);
		query1.setParameter("duration",duration);
		query1.setParameter("price",price);
		
		int rr = query1.executeUpdate();

		tx.commit();

		if (rr != 0) {
		    return true;
		} else {
		    return true;
		}
		
	}
    public void  deleteFlight(String fly_num)
    {
    	try {
		Flight f=new Flight();
    	f.setFly_Num(fly_num);
    	session.delete(f);
        tx.commit();
		System.out.println("Data deleted Successfully....!");
    	}
    	catch (Exception e) {
			System.out.println(e);
		}
	 }
    
	@Override
	public List SearchFlight(Flight Flight) 
	{
       
		String hql = "FROM Flight WHERE schedule=:schdate and source=:source1 and destination=:dest";
		Query query = session.createQuery(hql);
		query.setParameter("schdate", Flight.getSchedule());
	    query.setParameter("source1", Flight.getSource());
		query.setParameter("dest", Flight.getDestination());
		System.out.println(Flight.getSource()+Flight.getDestination());
		 List result = ((org.hibernate.query.Query) query).list();
		return result;
		
	}
	public List SearchFlightFlyNo(String FlyNo)
	{
		String hql = "FROM Flight WHERE fly_Num=:fly_Num ";
		Query query = session.createQuery(hql);
		query.setParameter("fly_Num",FlyNo );
	    
		 List result = ((org.hibernate.query.Query) query).list();
		return result;
		
	}
	public static boolean  FlightUpdate(String flyNum ,int passengers)
	{   
		String hql = "FROM Flight WHERE fly_Num=:fly_Num ";
		Query query = session.createQuery(hql);
		query.setParameter("fly_Num",flyNum );
		Flight f2=new Flight();
		List result = ((org.hibernate.query.Query) query).list();
		Iterator i=result.iterator();
		 while(i.hasNext())
		 {
			 f2=(Flight)i.next();
		 }
		 System.out.println("seats:"+ f2.getSeats());
		 int seats=f2.getSeats();
	    int newSeats=seats-passengers;
		String hql2 = "UPDATE Flight SET seats=:seats WHERE fly_Num=:flyNum";

		Query query1 = session.createQuery(hql2);
		query1.setParameter("flyNum", flyNum);
		query1.setParameter("seats", newSeats);
		int rr = query1.executeUpdate();

		tx.commit();

		if (rr != 0) {
		    return true;
		} else {
		    return true;
		}
	}
	
	public List SearchAllFlight()
	{
		String hql = "FROM Flight";
		Query query = session.createQuery(hql);
		
	    
		 List result = ((org.hibernate.query.Query) query).list();
		return result;
		
	}
	
}
