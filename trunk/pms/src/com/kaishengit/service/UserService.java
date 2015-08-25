package com.kaishengit.service;

import com.kaishengit.dao.UserDao;
import com.kaishengit.entity.User;
import com.kaishengit.util.StringUtil;
import com.kaishengit.util.exception.ServiceException;

public class UserService {
	private UserDao dao = new UserDao();
	public User login(String name,String pwd){
		if(StringUtil.isEmpty(name) || StringUtil.isEmpty(pwd)){
			throw new ServiceException("�û��������벻��Ϊ��");
		}
		return dao.findByNameAndPwd(name, pwd);
	}
}