package cn.edu.bupt.action;

import java.util.HashMap;
import java.util.Map;

import cn.edu.bupt.DBUtil.UserUtil;
import cn.edu.bupt.DBUtilImpl.UserUtilImple;

/**
 * @author yongsheng
 *
 */
public class UserAction{
	
	private String userName;
	private String userPass;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String login() throws Exception{
		System.out.println("进入login.action");
		boolean result;
		UserUtil userUtil = new UserUtilImple();
		System.out.println(userName + " " + userPass);
		result = userUtil.isPermission(userName, userPass);
		if(result){
			return "success";
		}
		return "error";
	}
	
	public String register(){
		UserUtil userUtil = new UserUtilImple();
		Map<String, Boolean> result = new HashMap<>();
		result.put("message", userUtil.isUnique(userName));
		
		return "success";
	}
}
