package com.iflytek.bbs.entity;

public class UserInfo {
	private int userId;
	private String name;
	private String pwd;
	private String sex;
	private String headPic;
	private String regTime;
	private String powLimit;
	
	public UserInfo() {
		
	}

	public UserInfo(String name, String pwd, String sex, String headPic,
			String regTime) {
		this.name = name;
		this.pwd = pwd;
		this.sex = sex;
		this.headPic = headPic;
		this.regTime = regTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getHeadPic() {
		return headPic;
	}

	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}

	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}

	public String getPowLimit() {
		return powLimit;
	}

	public void setPowLimit(String powLimit) {
		this.powLimit = powLimit;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
