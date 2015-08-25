package com.kaishengit.web;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaishengit.dao.GoalDao;
import com.kaishengit.dao.TaskDao;
import com.kaishengit.entity.Goal;
import com.kaishengit.entity.Project;
import com.kaishengit.entity.Task;
import com.kaishengit.entity.User;
import com.kaishengit.util.DateUtil;
import com.kaishengit.util.PKUtil;

public class GoalServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		String method = request.getParameter("_m");
		if("save".equals(method)){
			if(request.getMethod().equalsIgnoreCase("POST")){
				save(request,response);
			}else{
				toAdd(request,response);
			}
		}else if("get".equals(method)){
			get(request,response);
		}else if("edit".equals(method)){
			edit(request,response);
		}else if("show".equals(method)){
			goalshow(request,response);
		}else if("".equals(method) || method == null){
			list(request,response);
		}
	}
	
	GoalDao goalDao = new GoalDao();
	
	private void goalshow(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String goalid = request.getParameter("goalid");
		//String projectid = request.getParameter("projectid");
		Goal goal = null;
		try{
			goal = goalDao.findByGoalId(goalid);
		}catch(NumberFormatException e){
			response.sendRedirect("goal.jspx");
			return;
		}
		
		if(goal != null){
			HttpSession session = request.getSession();
			session.setAttribute("goal",goal);
			TaskDao taskDao = new TaskDao();
			List<Task> taskList = taskDao.findByGoalId(goalid);
			request.setAttribute("taskList",taskList);
			//request.setAttribute("projectid", projectid);
			User user = (User) session.getAttribute("user");
			request.setAttribute("user", user);
			
			request.getRequestDispatcher("/WEB-INF/views/goalshow.jsp").forward(request,response);
		}else{
			response.sendRedirect("goal.jspx");
		}
		
	}

	
	private void get(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
		Goal goal = null;
		try{
			goal = goalDao.findByGoalId(id);
		}catch(NumberFormatException e){
			response.sendRedirect("goal.jspx");
			return;
		}
		
		if(goal != null){
			
			request.setAttribute("goal",goal);
			
			request.getRequestDispatcher("/WEB-INF/views/editgoal.jsp").forward(request,response);
		}else{
			response.sendRedirect("goal.jspx");
		}
	}

	
	
	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");
		String state = request.getParameter("state");
		
		Goal goal = new Goal();
		goal.setId(id);
		goal.setName(name);
		goal.setDesc(desc);
		goal.setState(state);
		
		goalDao.update(goal);
		
		response.sendRedirect("goal.jspx");
	}


	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Project project =(Project) session.getAttribute("project");
		String projectid = project.getId();
		List<Goal> goalList = goalDao.findGoals(projectid);
		String goalid = (String) session.getAttribute("goalid");
		Goal goal = goalDao.findByGoalId(goalid);
		request.setAttribute("goal", goal);
		session.setAttribute("goal",goal);
		request.setAttribute("projectid", projectid);
		//request.setAttribute("project", project);
		request.setAttribute("goalList", goalList);
		
	request.getRequestDispatcher("/WEB-INF/views/goal.jsp").forward(request, response);
				
	}
	private void toAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/newgoal.jsp").forward(request, response);
	}
	private void save(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
			Goal goal = new Goal();
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			Project project= (Project) session.getAttribute("project");
			
			String id = new PKUtil().getPk();
			//session.setAttribute("goalid",id);
					
			String name = request.getParameter("name");
			String desc = request.getParameter("desc");
			String createTime = new DateUtil().getNow();
			String userid = user.getId();
			String projectid = project.getId();
			String state = request.getParameter("state");
			
			
			goal.setId(id);
			goal.setName(name);
			goal.setDesc(desc);
			goal.setCreateTime(createTime);
			goal.setUserId(userid);
			goal.setProjectId(projectid);
			goal.setState(state);
		
			
			goalDao.save(goal);
			//request.setAttribute("projectid", projectid);
			
			response.sendRedirect("goal.jspx");
			
	}
	

}