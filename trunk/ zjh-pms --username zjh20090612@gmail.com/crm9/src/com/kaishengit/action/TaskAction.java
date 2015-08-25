package com.kaishengit.action;

import java.util.Map;


import org.apache.struts2.interceptor.SessionAware;

import com.kaishengit.pojo.Task;
import com.kaishengit.pojo.TaskType;
import com.kaishengit.pojo.User;
import com.kaishengit.service.TaskService;
import com.kaishengit.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class TaskAction extends ActionSupport implements SessionAware{

	
	private static final long serialVersionUID = 1L;
	private Task task;
	private TaskType taskType;
	private TaskService taskService;
	private Map<String,Object> session;
	public String list(){
		return SUCCESS;
	}
	
	public String save(){
		User u = (User) session.get("user");
		task.setUser(u);
		task.setCreatetime(DateUtil.getNow());
		System.out.println(task.getCreatetime());
		taskService.save(task);
		return SUCCESS;
	}
	public String addtask(){
		return SUCCESS;
	}
	
	
	//get set
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public TaskType getTaskType() {
		return taskType;
	}

	public void setTaskType(TaskType taskType) {
		this.taskType = taskType;
	}
	
	

}
