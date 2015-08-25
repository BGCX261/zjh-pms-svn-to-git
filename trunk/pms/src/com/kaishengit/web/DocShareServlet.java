package com.kaishengit.web;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.kaishengit.dao.FileDao;
import com.kaishengit.dao.FileTypeDao;
import com.kaishengit.entity.FileType;
import com.kaishengit.entity.Project;
import com.kaishengit.entity.User;
import com.kaishengit.util.DateUtil;
import com.kaishengit.util.PKUtil;

public class DocShareServlet extends HttpServlet {

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
		}else if("".equals(method) || method == null){
			list(request,response);
		}
		
	}
	
	
	FileTypeDao ftDao = new FileTypeDao();
	FileDao fileDao = new FileDao();
	
	

	
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Project project =(Project) session.getAttribute("project");
		User user = (User) session.getAttribute("user");
		String projectid = project.getId();
		List<FileType> ftList = ftDao.findByProjectId(projectid);
		request.setAttribute("project", project);
		request.setAttribute("projectid", projectid);
		request.setAttribute("ftList", ftList);
		request.setAttribute("user", user);
		
		request.getRequestDispatcher("/WEB-INF/views/docshare.jsp").forward(request, response);
	}
	private void toAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/newfiletype.jsp").forward(request, response);
	}
	private void save(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = new PKUtil().getPk();
		String name = request.getParameter("name");
		String createtime = new DateUtil().getNow();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Project project = (Project) session.getAttribute("project");
		String userid = user.getId();
		String projectid = project.getId();
		
		FileType fileType = new FileType();
		fileType.setId(id);
		fileType.setName(name);
		fileType.setCreateTime(createtime);
		fileType.setUserId(userid);
		fileType.setProjectId(projectid);
		
		ftDao.insert(fileType);
		response.sendRedirect("docshare.jspx");
	}

}
