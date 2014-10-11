package com.iflytek.bbs.dao;

import java.util.List;

import com.iflytek.bbs.entity.UserInfo;

public interface UserInfoDAO {
	
	//增加用户信息
	public void add(UserInfo user);
	
	//删除用户信息
	public void delete(UserInfo user);
	
	//修改用户信息
	public void update(UserInfo user);
	
	//查找所有用户信息
	public List<UserInfo> selectAll();
	
	//按用户名查找用户信息
	public List<UserInfo> selectByName(UserInfo user);

}
