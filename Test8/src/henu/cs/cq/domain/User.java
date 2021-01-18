package henu.cs.cq.domain;

import java.util.Date;

public class User {
private int id;
private String username;//用户名
private String password;//用户登录密码
private Date register_time;//用户注册日期
private String user_code;//用户唯一识别ID

public User() {
}

public User(int id, String username, String password, Date register_time,
		String user_code) {
	super();
	this.id = id;
	this.username = username;
	this.password = password;
	this.register_time = register_time;
	this.user_code = user_code;
}

public User(String username, String password, Date register_time, String user_code) {
	super();
	this.username = username;
	this.password = password;
	this.register_time = register_time;
	this.user_code = user_code;
}


@Override
public String toString() {
	return "User [id=" + id + ", username=" + username + ", password=" + password
			+ ", register_time=" + register_time + ", user_code=" + user_code + "]";
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public Date getRegister_time() {
	return register_time;
}

public void setRegister_time(Date register_time) {
	this.register_time = register_time;
}

public String getUser_code() {
	return user_code;
}

public void setUser_code(String user_code) {
	this.user_code = user_code;
}
}
