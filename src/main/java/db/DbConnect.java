package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect {

	static Connection connection = null;
	
	public static Connection getConnection() throws ClassNotFoundException {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/clients?" +
                "user=root&password=Danonebom1234-");
			
		}catch(SQLException ex){
			
			System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		    
		}
		
		return connection;
		
	}
	
}
