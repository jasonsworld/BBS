package cn.edu.bupt.DBUtilImpl;

import java.sql.SQLException;

import cn.edu.bupt.DBUtil.UserUtil;
import cn.edu.bupt.bean.UserInfo;
import cn.edu.bupt.util.MD5Encryption;

/**
 * @author yongsheng
 *
 */
public class UserUtilImple extends CommonDBUtil implements UserUtil{
	
	/**
	 * 登陆
	 */
	public boolean isPermission(String name, String pass) {
		boolean result = false;
		String sql = "select * from userinfo where name='" + name + "'";
		try {
			rs = query(sql);
			if (rs.next()) {
				if (rs.getString("pwd").equals(MD5Encryption.GetMD5Code(pass))) {
					result = true;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("获取用户权限失败,抛出异常");
			e.printStackTrace();
		}finally{
			try {
				close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/**
	 * 判断用户名是否唯一
	 */	
	public boolean isUnique(String userName){
		String sql = "select name from userinfo where name='" + userName + "'";
		rs = query(sql);
		try {
			if(rs.next()){
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return true;
	}
	
	
	/**
	 * 注册
	 */
	public boolean register(UserInfo userInfo){
		int count;
		String sql = "insert into userinfo(name, pwd, sex, headPic, regTime, grade) "
				+ " values('" + userInfo.getName()+ "' , '" + userInfo.getPass() + "' , '"
				+ userInfo.getSex() + "' , '" + userInfo.getHeadPic() + "' , '" 
				+ userInfo.getRegTime() + "' , '" + userInfo.getGrade() + "')";
		count = update(sql);
		if(count == 1){
			return true;
		}
		try {
			close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
