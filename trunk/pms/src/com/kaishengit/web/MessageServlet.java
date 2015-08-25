package com.kaishengit.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaishengit.entity.User;
import com.kaishengit.service.MsgService;

public class MessageServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 String id=request.getParameter("id");//项目id
         String content=request.getParameter("content");
	     HttpSession session=request.getSession();
	     User user=(User)session.getAttribute("user");
	     
	     
	    	 //插入信息到t_message
	    	/* System.out.println(id);
	    	 System.out.println(text);
	    	 System.out.println(employee.getId());*/
	     MsgService.insert(id,content,user.getId());
	    	 
	     response.sendRedirect("trends.jspx?id="+id);
	     
	    
	}
			
	
}


