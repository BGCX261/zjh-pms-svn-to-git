package com.kaishengit.pojo;

import java.util.Set;

public class User {
	private String id;
	private String username;
	private String password;
	private String email;
	private String createtime;
	private boolean enable;
	private UserGroup userGroup;
	private Set<Task> taskSet;
	private Set<Contact> contactSet;
	private Set<Deal> dealSet;
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public UserGroup getUserGroup() {
		return userGroup;
	}
	public void setUserGroup(UserGroup userGroup) {
		this.userGroup = userGroup;
	}
	public Set<Task> getTaskSet() {
		return taskSet;
	}
	public void setTaskSet(Set<Task> taskSet) {
		this.taskSet = taskSet;
	}
	public Set<Contact> getContactSet() {
		return contactSet;
	}
	public void setContactSet(Set<Contact> contactSet) {
		this.contactSet = contactSet;
	}
	public Set<Deal> getDealSet() {
		return dealSet;
	}
	public void setDealSet(Set<Deal> dealSet) {
		this.dealSet = dealSet;
	}
	
	
	
	

}
