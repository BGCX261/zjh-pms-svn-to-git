package com.kaishengit.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.kaishengit.pojo.User;
import com.kaishengit.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 1L;

	private User user;
	private UserService userService;
	private Map<String,Object> session;
	
	public String execute(){
		return SUCCESS;
	}
	public String index(){
		return SUCCESS;
	}
	
	public String login(){
		User u = userService.login(user);
		if(u != null){
			session.put("user", u);
			return SUCCESS;
		}
		return LOGIN;
		
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
