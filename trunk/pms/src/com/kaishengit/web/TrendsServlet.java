package com.kaishengit.web;


import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaishengit.dao.MessageDao;
import com.kaishengit.dao.ProjectDao;
import com.kaishengit.entity.Message;
import com.kaishengit.entity.Project;
import com.kaishengit.entity.User;
import com.kaishengit.util.DateUtil;
import com.kaishengit.util.PKUtil;

public class TrendsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("_m");
		if("save".equals(method)){
			save(request,response);
		}else if("".equals(method) || method == null){
			toadd(request,response);
		}
		
	}
	private void toadd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/trends.jsp").forward(request, response);
	}
	private void save(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		String id = new PKUtil().getPk();
		String projectid = request.getParameter("id");
		request.setAttribute("projectid", projectid);
		String userid = user.getId();
		String content = request.getParameter("centent");
		String createTime = new DateUtil().getNow();
		
		Message msg = new Message();
		msg.setContent(content);
		msg.setCreateTime(createTime);
		msg.setId(id);
		msg.setProjectId(projectid);
		msg.setUserId(userid);
		
		MessageDao messageDao = new MessageDao();
		
	}
	
		
		
//		
		
		
	}
	
