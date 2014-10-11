package com.iflytek.bbs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.iflytek.bbs.dao.BaseDAO;
import com.iflytek.bbs.dao.UserInfoDAO;
import com.iflytek.bbs.entity.UserInfo;

public class UserInfoDAOImpl extends BaseDAO implements UserInfoDAO {

	//增加用户信息
	public void add(UserInfo user) {
		
		String sql = "INSERT INTO bbs.userinfo (NAME, pwd, sex, headPic, regTime)VALUES(?, ?, ?, ?, ?)";
		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String regTime = formatter.format(date);
		
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		try{
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, user.getName());
			pmt.setString(2, user.getPwd());
			pmt.setString(3,user.getSex());
			pmt.setString(4, user.getHeadPic());
			pmt.setString(5, regTime);
			pmt.execute();
		}catch(Exception e ){
			e.printStackTrace();
		}finally{
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}
		

	}

	//删除用户信息
	public void delete(UserInfo user) {
		

	}

	//查询所有用户信息
	public List<UserInfo> selectAll() {
		String sql = "SELECT * FROM bbs.userinfo";
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		ResultSet rs = null;
		List<UserInfo> userList = new LinkedList<UserInfo>();
		try {
			pmt = conn.prepareStatement(sql);
			rs = pmt.executeQuery();
			while(rs.next()){
				UserInfo user = new UserInfo();
				user.setUserId(rs.getInt("userId"));
				user.setName(rs.getString("name"));
				user.setPwd(rs.getString("pwd"));
				user.setSex(rs.getString("sex"));
				user.setHeadPic(rs.getString("headPic"));
				user.setRegTime(rs.getString("regTime"));
				user.setPowLimit(rs.getString("powLimit"));
				userList.add(user);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeResultSet(rs);
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}
		
		return userList;
	}

	//按姓名查询用户信息
	public List<UserInfo> selectByName(UserInfo user) {
		String sql = "SELECT * FROM bbs.userinfo WHERE NAME = ?";
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		List<UserInfo> userinfoList = new LinkedList<UserInfo>();
		
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1,user.getName());
			ResultSet rs = pmt.executeQuery();
			while(rs.next()){
				UserInfo userinfo = new UserInfo();
				
				userinfo.setUserId(rs.getInt("userId"));
				userinfo.setName(rs.getString("name"));
				userinfo.setPwd(rs.getString("pwd"));
				userinfo.setSex(rs.getString("sex"));
				userinfo.setHeadPic(rs.getString("headPic"));
				userinfo.setRegTime(rs.getString("regTime"));
				userinfo.setPowLimit(rs.getString("powLimit"));
				userinfoList.add(userinfo);
			}
			
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		
		
		return userinfoList;
	}

	//更新用户信息
	public void update(UserInfo user) {
	

	}
	
}
