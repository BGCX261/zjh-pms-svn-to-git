package com.kaishengit.service;

import com.kaishengit.dao.ProjectDao;
import com.kaishengit.entity.Project;

public class ProjectService {
	public static Project findByProjectId(String id){
		ProjectDao proDao = new ProjectDao();
		return proDao.findById(id);
	}

}
