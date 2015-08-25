package com.kaishengit.action;

import com.kaishengit.pojo.TaskType;
import com.kaishengit.service.TaskTypeService;
import com.opensymphony.xwork2.ActionSupport;

public class TaskTypeAction extends ActionSupport{

	
	private static final long serialVersionUID = 1L;
	private TaskTypeService taskTypeService;
	private TaskType taskType;
	
	
	
	
	
	//get set
	public TaskType getTaskType() {
		return taskType;
	}
	public void setTaskType(TaskType taskType) {
		this.taskType = taskType;
	}
	public void setTaskTypeService(TaskTypeService taskTypeService) {
		this.taskTypeService = taskTypeService;
	}
	
	
	

}
