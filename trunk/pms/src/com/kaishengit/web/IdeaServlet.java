package com.kaishengit.web;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaishengit.dao.IdeaDao;
import com.kaishengit.entity.Data;
import com.kaishengit.entity.Idea;
import com.kaishengit.entity.Project;
import com.kaishengit.entity.User;
import com.kaishengit.util.DateUtil;
import com.kaishengit.util.PKUtil;

public class IdeaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	IdeaDao dao=new IdeaDao();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		

		String method = request.getParameter("_m");
		if("new".equals(method)){  //发表想法；
			if(request.getMethod().equalsIgnoreCase("POST")){
				newidea(request,response);
			}else{
				toadd(request,response);
			}
		}else if("show".equals(method)){	//点击想法题目名称进入详细信息；
			ideashow(request,response);
		}else if("del".equals(method)){	//删除想法；
			delidea(request,response);
		}else if("get".equals(method)){	//获取修改前的想法；
			get(request,response);
		}else if("edit".equals(method)){	//编辑想法；
			editidea(request,response);
		}else if("".equals(method) || method == null){
			list(request,response);//
		}
		
		
	}
	//获得想法原有的内容；
		private void get(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
			String id = request.getParameter("id");
			Idea idea = null;
			try {
				idea = dao.findById(id);
			} catch(NumberFormatException e) {
				response.sendRedirect("idea.jspx");
				return;
			}
			
			if(idea != null) {
				request.setAttribute("idea", idea);
				request.getRequestDispatcher("/WEB-INF/views/editidea.jsp").forward(request, response);
			} else {
				response.sendRedirect("idea.jspx");
			}
	}
		
		//编辑想法；
		private void editidea(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
			String id = request.getParameter("id");
			String title = request.getParameter("title");
		
			String content = request.getParameter("content");
			String createtime = new DateUtil().getNow();
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			Project project = (Project) session.getAttribute("project");
			String userid = user.getId();
			String projectid = project.getId();
			
			Idea idea = new Idea();
			idea.setId(id);
			idea.setTitle(title);
			idea.setContent(content);
			idea.setCreateTime(createtime);
			idea.setUserId(userid);
			idea.setProjectId(projectid);
			
			dao.update(idea);
			
			response.sendRedirect("idea.jspx");
					
	}
		//删除想法；
		private void delidea(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			String id = request.getParameter("id");
			Idea idea = null;
			idea = dao.findById(id);	//根据id删除想法；
			try{
				dao.del(id);
				response.sendRedirect("idea.jspx");
			} catch(Exception e) {
				response.sendError(404);
				return;
				
			}
		}
	//点标题显示想法详细信息；
		private void ideashow(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
			String ideaid = request.getParameter("id");
			
			Idea idea = dao.findById(ideaid);
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			request.setAttribute("user", user);
			request.setAttribute("idea",idea);
			request.getRequestDispatcher("/WEB-INF/views/ideashow.jsp").forward(request, response);
	}
		//显示资料；
		private void list(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException  {
			List<Idea> ideaList=dao.findAll();
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			String username = user.getUserName();
			request.setAttribute("ideaList", ideaList);
			request.setAttribute("username", username);
			request.getRequestDispatcher("/WEB-INF/views/idea.jsp").forward(request, response);
		}
		
		private void toadd(HttpServletRequest request,
				HttpServletResponse response)throws ServletException, IOException  {
			request.getRequestDispatcher("/WEB-INF/views/newidea.jsp").forward(request, response);

		}
		//发表新想法；
		private void newidea(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			Project project = (Project) session.getAttribute("project");
			
			String id=PKUtil.getPk();
			String createtime=DateUtil.getNow();
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			String userid = user.getId();
			String projectid = project.getId();
			
			
			Idea idea = new Idea();
			idea.setContent(content);
			idea.setCreateTime(createtime);
			idea.setTitle(title);
			idea.setId(id);
			idea.setUserId(userid);
			idea.setProjectId(projectid);
			
			
			dao.save(idea);
			response.sendRedirect("idea.jspx");
		}
}

