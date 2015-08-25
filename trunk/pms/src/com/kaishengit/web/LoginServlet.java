package com.kaishengit.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.kaishengit.util.exception.ServiceException;

import com.kaishengit.entity.User;
import com.kaishengit.service.UserService;
import com.octo.captcha.module.servlet.image.SimpleImageCaptchaServlet;

public class LoginServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			String name = request.getParameter("username");
			String pwd = request.getParameter("password");
			HttpSession session = request.getSession();
			
			User user = null;
			
			try{
			user = new UserService().login(name,pwd);
			}catch(ServiceException e){
				e.printStackTrace();
				String msg = e.getMessage();
				session.setAttribute("msg", msg);
				response.sendRedirect("index.jspx");
			}
			if(user != null){
				
				session.setAttribute("user", user);
				request.getRequestDispatcher("project.jspx").forward(request, response);
				
			}else{
				
				response.sendRedirect("index.jspx?code=10001");
			}
		
		
		
		
	}

}
