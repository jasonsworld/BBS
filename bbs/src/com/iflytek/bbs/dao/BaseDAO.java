package com.iflytek.bbs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public abstract class BaseDAO {
	private String url="jdbc:mysql://192.168.6.31:3306/bbs";
	private String name = "root";
	private String pwd ="root";
	
	public Connection getConnection(){
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,name,pwd);
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
	
	public void closeConnection(Connection conn){
		try{
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}
	
	public void closeStatement(Statement sta){
		try{
			sta.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void closeResultSet(ResultSet rs){
		try{
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
