package com.kaishengit.web;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaishengit.dao.ProjectDao;
import com.kaishengit.entity.Project;
import com.kaishengit.entity.User;
import com.kaishengit.service.ProjectService;
import com.kaishengit.util.DateUtil;
import com.kaishengit.util.PKUtil;

public class ProjectServlet extends HttpServlet {
	
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
		}else if("trend".equals(method)){
			trend(request,response);
		
		}else if("".equals(method) || method == null){
			list(request,response);//显示一个列表，相当于HomeServlet
		}
		
		
	}

	ProjectDao projectDao = new ProjectDao();
	
	private void trend(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Project project = projectDao.findById(id);
		
		HttpSession session = request.getSession();
		session.setAttribute("project",project);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/trends.jsp");
		rd.forward(request, response);
	}



	

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProjectDao projectDao = new ProjectDao();
		List<Project> projectList = projectDao.findAll();
		request.setAttribute("projectList", projectList);
		//HttpSession session = request.getSession();
		//session.setAttribute("projectlist",projectList);
		
		//ServletContext application = getServletContext();
		//application.setAttribute("projectList", projectList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/main.jsp");
		rd.forward(request, response);
	}

	private void toAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/newproject.jsp").forward(request, response);
	}

	private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Project project = new Project();
		//HttpSession session = request.getSession();
		String id = new PKUtil().getPk(); 
		
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");
		String createTime = new DateUtil().getNow();
		project.setId(id);
		project.setName(name);
		project.setDesc(desc);
		project.setCreateTime(createTime);
		
		ProjectDao dao = new ProjectDao();
		dao.save(project);
		
//		HttpSession session = request.getSession();
//		session.setAttribute("project", project);
		
		response.sendRedirect("project.jspx");
		
	}

}
