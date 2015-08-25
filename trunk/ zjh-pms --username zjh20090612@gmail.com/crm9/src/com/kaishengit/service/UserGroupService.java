package com.kaishengit.service;

import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.dao.UserGroupDao;

@Transactional
public class UserGroupService {
	private UserGroupDao userGroupDao;

	
	public void setUserGroupDao(UserGroupDao userGroupDao) {
		this.userGroupDao = userGroupDao;
	}
	
}
