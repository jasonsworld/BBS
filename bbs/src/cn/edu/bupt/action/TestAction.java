package cn.edu.bupt.action;

import cn.edu.bupt.DBconnection.ConnectionUtils;

public class TestAction {
	public String execute(){
		ConnectionUtils.getConnection();
		return "success";
	}

}
