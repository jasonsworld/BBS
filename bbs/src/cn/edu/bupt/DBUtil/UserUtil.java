package cn.edu.bupt.DBUtil;

import cn.edu.bupt.bean.UserInfo;

public interface UserUtil {
	public boolean isPermission(String name, String pass);
	public boolean isUnique(String userName);
	public boolean register(UserInfo userInfo);
}
