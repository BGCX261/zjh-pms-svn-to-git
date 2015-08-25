package com.kaishengit.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.kaishengit.pojo.User;
import com.kaishengit.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 1L;

	private User user;
	private UserService userService;
	
	private Map<String,Object> session;
	
	public String execute(){
		return SUCCESS;
	}
	
	
	//get set
	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	
	
}
