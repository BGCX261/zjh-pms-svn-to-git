package com.kaishengit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.dao.UserDao;
import com.kaishengit.pojo.User;

@Transactional
public class UserService {
	
	private UserDao userDao;
	
	public User login(User user) {
		User u = userDao.findByUnique("username", user.getUsername());
		if(u != null && u.getPassword().equals(user.getPassword())){
			return u;
		}else{
			return null;
		}
	}
	
	public List<User> findAll(){
		return userDao.findAll();
	}
	

	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	

}
