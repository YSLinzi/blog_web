package com.ysl.entity;

public class User {
	private int id;
	private String userName;
	private String userPswd;
	private String user_pro;
	private String userIco;
	private String userMotto;
	private String userBlogName;
	private String userCTTime;
	private String user_area;
	
	public String getUser_area() {
		return user_area;
	}
	public void setUser_area(String user_area) {
		this.user_area = user_area;
	}
	public User(int id, String userName, String userPswd, String user_pro, String userIco, String userMotto,
			String userBlogName, String userCTTime) {
		super();
		this.id = id;
		this.userName = userName;
		this.userPswd = userPswd;
		this.user_pro = user_pro;
		this.userIco = userIco;
		this.userMotto = userMotto;
		this.userBlogName = userBlogName;
		this.userCTTime = userCTTime;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPswd() {
		return userPswd;
	}
	public void setUserPswd(String userPswd) {
		this.userPswd = userPswd;
	}	
	
	public String getUser_pro() {
		return user_pro;
	}

	public void setUser_pro(String user_pro) {
		this.user_pro = user_pro;
	}

	public String getUserIco() {
		return userIco;
	}
	public void setUserIco(String userIco) {
		this.userIco = userIco;
	}
	public String getUserMotto() {
		return userMotto;
	}
	public void setUserMotto(String userMotto) {
		this.userMotto = userMotto;
	}
	
	public String getUserBlogName() {
		return userBlogName;
	}
	public String getCutUserBlogName() {
		int len=14;
		if(len>=userBlogName.length()||len<=0)
			return userBlogName;
		else{
			return (userBlogName.substring(0,len)+"..");
		}
	}
	public void setUserBlogName(String userBlogName) {
		this.userBlogName = userBlogName;
	}
	public String getUserCTTime() {
		return userCTTime;
	}
	public void setUserCTTime(String userCTTime) {
		this.userCTTime = userCTTime;
	}
}
