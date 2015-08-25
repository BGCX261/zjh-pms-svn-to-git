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
import com.kaishengit.dao.UserDao;
import com.kaishengit.entity.Goal;
import com.kaishengit.entity.Task;
import com.kaishengit.entity.User;
import com.kaishengit.util.DateUtil;
import com.kaishengit.util.PKUtil;
public class TaskServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
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
		}else if("".equals(method) || method == null){
			list(request,response);
		}
	}
	
	TaskDao taskDao = new TaskDao();
	Goal goal = null;
	
	
	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String begintime = request.getParameter("begintime");
		String endtime = request.getParameter("endtime");
		String createtime = new DateUtil().getNow();
		String desc = request.getParameter("desc");
		String state = request.getParameter("state");
		String level = request.getParameter("level");
		//String username = request.getParameter("username");
		String rate = request.getParameter("rate");
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		//request.setAttribute("user",user);
		goal = (Goal) session.getAttribute("goal");
		String goalid = goal.getId();
		String userid = user.getId();
		
		Task task = new Task();
		task.setId(id);
		task.setName(name);
		task.setDesc(desc);
		task.setBeginTime(begintime);
		task.setEndTime(endtime);
		task.setCreateTime(createtime);
		task.setState(state);
		task.setLevel(level);
		task.setUserId(userid);
		task.setGoalId(goalid);
		task.setRate(rate);
		
		taskDao.update(task);
		response.sendRedirect("task.jspx");
	}
	
	
	private void get(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String taskid = request.getParameter("id");
		//String userid = request.getParameter("userid");
		Task task = null;
		//User user = null;
		try{
			task = taskDao.findById(taskid);
			//user = new UserDao().findById(userid);
		}catch(NumberFormatException e){
			response.sendRedirect("task.jspx");
			return;
		}
		
		if(task != null){
			
			request.setAttribute("task",task);
			//request.setAttribute("userid",userid);
			request.getRequestDispatcher("/WEB-INF/views/edittask.jsp").forward(request,response);
		}else{
			response.sendRedirect("task.jspx");
		}
	}

	
	
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		goal = (Goal) session.getAttribute("goal");
		User user = (User) session.getAttribute("user");
		String goalid = goal.getId();
		request.setAttribute("goal", goal);
		List<Task> taskList = taskDao.findByGoalId(goalid);
		request.setAttribute("goalid", goalid);
		request.setAttribute("taskList", taskList);
		request.setAttribute("user", user);
		
		request.getRequestDispatcher("/WEB-INF/views/goalshow.jsp").forward(request, response);
	}

	
	private void toAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String goalid = request.getParameter("goalid");
//		GoalDao goalDao = new GoalDao();
//		goal = goalDao.findByGoalId(goalid);
//		HttpSession session = request.getSession();
//		session.setAttribute("goal", goal);
		
		request.getRequestDispatcher("/WEB-INF/views/newtask.jsp").forward(request, response);
	}
	private void save(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = PKUtil.getPk();
		String name = request.getParameter("name");
		String begintime = request.getParameter("begintime");
		String endtime = request.getParameter("endtime");
		String createtime = new DateUtil().getNow();
		String desc = request.getParameter("desc");
		String state = request.getParameter("state");
		String level = request.getParameter("level");
		String username = request.getParameter("username");
		String rate = request.getParameter("rate");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		goal = (Goal) session.getAttribute("goal");
		String userid = user.getId();
		String goalid= goal.getId();
		
		Task task = new Task();
		task.setId(id);
		task.setName(name);
		task.setDesc(desc);
		task.setBeginTime(begintime);
		task.setEndTime(endtime);
		task.setCreateTime(createtime);
		task.setState(state);
		task.setLevel(level);
		task.setUserId(userid);
		task.setGoalId(goalid);
		task.setRate(rate);
		taskDao.insert(task);
		response.sendRedirect("task.jspx");
	}
}
