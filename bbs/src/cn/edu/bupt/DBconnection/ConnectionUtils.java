package cn.edu.bupt.DBconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionUtils {
	private static String driverName;
	private static String url;
	private static String user;
	private static String password;
	private static Connection conn;
	static{
		PropertiesUtils.loadFile("db.properties");
		driverName = PropertiesUtils.getPropertyValue("driverName");
		url = PropertiesUtils.getPropertyValue("url");
		user = PropertiesUtils.getPropertyValue("user");
		password = PropertiesUtils.getPropertyValue("password");
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("连接成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("异常");;
			conn = null;
			e.printStackTrace();
		}   
	}
	
	public static Connection getConnection() {
		return conn;
	}
}
