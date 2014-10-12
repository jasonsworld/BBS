package cn.edu.bupt.DBUtilImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import cn.edu.bupt.DBconnection.ConnectionUtils;
/**
 * a class for Common DB's DAO
 * 
 * @author cys
 * @version 1.0
 */
public class CommonDBUtil {

	protected Connection connection = null;
	protected Statement statement = null;
	protected ResultSet rs = null;

	public ResultSet query(String sql) {
		try {
			connection = ConnectionUtils.getConnection();
			statement = connection.createStatement();
			rs = statement.executeQuery(sql);
		} catch (Exception e) {
			System.out.println("CommonDBUtil中query（）抛出异常");
			e.printStackTrace();
			// TODO: handle exception
		}
		return rs;
	}

	public int update(String sql) {
		int count = 0;
		try {
			connection = ConnectionUtils.getConnection();
			statement = connection.createStatement();
			count = statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("CommonDBUtil中update（）抛出异常");
			e.printStackTrace();
		}
		return count;
	}

	public void close() throws Exception {
		if (rs != null) {
			rs.close();
		}
		if (statement != null) {
			statement.close();
		}
	}
}
