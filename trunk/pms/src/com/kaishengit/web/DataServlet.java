package com.kaishengit.web;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaishengit.dao.DataDao;
import com.kaishengit.entity.Data;
import com.kaishengit.entity.Project;
import com.kaishengit.entity.User;
import com.kaishengit.util.DateUtil;
import com.kaishengit.util.PKUtil;

public class DataServlet extends HttpServlet {
	
		DataDao dao=new DataDao();
		
	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
	
		String method = request.getParameter("_m");
		if("new".equals(method)){  //������ϣ�
			if(request.getMethod().equalsIgnoreCase("POST")){
				newdata(request,response);
			}else{
				toadd(request,response);
			}
		}else if("show".equals(method)){	//����������ƽ�����ϸ��Ϣ��
			datashow(request,response);
		}else if("del".equals(method)){	//ɾ�����ϣ�
			deldata(request,response);
		}else if("get".equals(method)){	//��ȡ�޸�ǰ�����ϣ�
			get(request,response);
		}else if("edit".equals(method)){	//�༭���ϣ�
			editdata(request,response);
		}else if("".equals(method) || method == null){
			list(request,response);//��ʾһ���б��൱��HomeServlet
		}
		
		
	}
	//ɾ�����ϣ�
	private void deldata(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		Data data = null;
		data = dao.findById(id);	//����idɾ�����ϣ�
		try{
			dao.del(id);
			response.sendRedirect("data.jspx");
		} catch(Exception e) {
			response.sendError(404);
			return;
		}
		
		
	}
	//��ȡ�޸�ǰ��������Ϣ��
	private void get(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");

		Data data = null;
		try {
			data = dao.findById(id);
		} catch(NumberFormatException e) {
			response.sendRedirect("data.jspx");
			return;
		}
		
		if(data != null) {
			request.setAttribute("data", data);
			request.getRequestDispatcher("/WEB-INF/views/editdata.jsp").forward(request, response);
		} else {
			response.sendRedirect("data.jspx");
		}

	}
	//�༭���ϣ�
	private void editdata(HttpServletRequest request,
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
		
		Data data = new Data();
		data.setId(id);
		data.setTitle(title);
		data.setContent(content);
		data.setCreateTime(createtime);
		data.setUserId(userid);
		data.setProjectId(projectid);
		
		dao.update(data);
		
		response.sendRedirect("data.jspx");
		
	}
	//��ϸ��Ϣ��
	private void datashow(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String dataid = request.getParameter("id");
		Data data = dao.findById(dataid);
		request.setAttribute("data",data);
		
	}
	//��ʾ���ϣ�
	private void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException  {
		List<Data> dataList=dao.findAll();
		request.setAttribute("dataList", dataList);
		request.getRequestDispatcher("/WEB-INF/views/data.jsp").forward(request, response);
	}
	private void toadd(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException  {
		request.getRequestDispatcher("/WEB-INF/views/newdata.jsp").forward(request, response);

	}
	//���������ϣ�
	private void newdata(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Project project = (Project) session.getAttribute("project");
		
		String id=PKUtil.getPk();
		String createtime=DateUtil.getNow();
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String userid = user.getId();
		String projectid = project.getId();
		
		
		Data data = new Data();
		data.setContent(content);
		data.setCreateTime(createtime);
		data.setTitle(title);
		data.setId(id);
		data.setUserId(userid);
		data.setProjectId(projectid);
		
		
		dao.save(data);
		response.sendRedirect("data.jspx");
	}

		
		
}
