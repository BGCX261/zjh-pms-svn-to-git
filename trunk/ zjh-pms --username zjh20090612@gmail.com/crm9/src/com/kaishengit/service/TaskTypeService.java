package com.kaishengit.service;

import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.dao.TaskTypeDao;

@Transactional
public class TaskTypeService {
	private TaskTypeDao taskTypeDao;

	public void setTaskTypeDao(TaskTypeDao taskTypeDao) {
		this.taskTypeDao = taskTypeDao;
	}
	
	

}
