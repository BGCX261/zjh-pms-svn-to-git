package com.kaishengit.service;

import com.kaishengit.dao.TaskDao;
import com.kaishengit.pojo.Task;

public class TaskService {
	private TaskDao taskDao;
	
	
	public void save(Task task){
		taskDao.save(task);
	}

	public void setTaskDao(TaskDao taskDao) {
		this.taskDao = taskDao;
	}
	

}
