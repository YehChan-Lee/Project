package android;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBConnection {

	public static Connection getConnection() throws Exception{
		System.out.println("DB연결시도");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection("jdbc:oracle:thin:@14.53.8.39:1525:XE","BP","bob1234");
	}

	public static Connection getConnection(String ip, int port, String db, String user, String pw) throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection("jdbc:oracle:this:@"+ip+":"+port+":"+db,"BP","bob1234");
	}
	
}
