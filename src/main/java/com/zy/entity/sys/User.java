package com.zy.entity.sys;

import java.util.Date;
import java.util.List;

public class User {

	/*`userid`  int(11) NOT NULL AUTO_INCREMENT ,
	`username`  varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ,
	`password`  varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ,
	`createDate`  datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP ,
	`editDate`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
	`loginDate`  datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,*/
	
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getEditDate() {
		return editDate;
	}

	public void setEditDate(Date editDate) {
		this.editDate = editDate;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	private int userid;
	private String username;
	private String password;
	private Date createDate;
	private Date editDate;
	private Date loginDate;
	
	private List<Role> roles;
}
