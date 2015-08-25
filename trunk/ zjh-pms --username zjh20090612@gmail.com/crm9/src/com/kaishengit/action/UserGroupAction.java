package com.kaishengit.action;

import com.kaishengit.service.UserGroupService;
import com.opensymphony.xwork2.ActionSupport;

public class UserGroupAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private UserGroupService userGroupService;
	
	public String execute(){
		return SUCCESS;
	}
	
	public void setUserGroupService(UserGroupService userGroupService) {
		this.userGroupService = userGroupService;
	}
	
	
	
}
