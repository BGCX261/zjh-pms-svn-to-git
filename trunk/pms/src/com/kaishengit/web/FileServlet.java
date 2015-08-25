package com.kaishengit.web;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kaishengit.dao.FileDao;
import com.kaishengit.entity.File;
import com.kaishengit.entity.Project;
import com.kaishengit.entity.User;
import com.kaishengit.service.FileService;
import com.kaishengit.service.FileTypeService;
import com.kaishengit.util.DateUtil;
import com.kaishengit.util.FloatUtil;
import com.kaishengit.util.PKUtil;

public class FileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String method = request.getParameter("_m");
		if("upload".equals(method)){
			//if(request.getMethod().equalsIgnoreCase("POST")){
				uploadFile(request,response);
		//}//else{
				//toUpload(request,response);
			//}
		}else if("".equals(method) || method == null){
			list(request,response);
		}
	}
//	private void toUpload(HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("/WEB-INF/views/fileupload.jsp").forward(request, response);
//	}
	private void uploadFile(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String ftid = request.getParameter("ftid");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Project project = (Project)session.getAttribute("project");
		FileService fs = new FileService();
		//获取该文件的id
		String id = PKUtil.getPk(); 
		String name = null; 
		String str = null;
		String size = null;
		//设置上传文件存放的路径
		java.io.File file = new java.io.File("c:/pms");
		//设置临时文件夹
		java.io.File tempFile = new java.io.File("c:/temp");
		
		//文件不存在时自动创建
		if(!file.exists()) {
			file.mkdir();
		} 
		if(!tempFile.exists()) {
			tempFile.mkdir();
		}
		
		//判断是否设置了enctype属性
		if(ServletFileUpload.isMultipartContent(request)) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			
			//设置缓冲区大小
			factory.setSizeThreshold(1024*10);
			//设置临时文件夹
			factory.setRepository(tempFile);
			
			ServletFileUpload fileupload = new ServletFileUpload(factory);
			//设置最大上传文件大小,最大上传文件为1G
			fileupload.setSizeMax(1024*1024*1024);
			
			try {
				List<FileItem> items = fileupload.parseRequest(request);
				for(FileItem item :items) {
					//判断下当前元素是否为上传元素
					if(item.isFormField()) {
						//为表单普通元素
						if("name".equals(item.getFieldName())) {
							//为name的元素,获取其值
							name = item.getString("utf-8");
							name = name.replace("<", "&lt;");
							name = name.replace(">", "&gt;");
							//判断该名称是否已存在
							try{
								fs.findByFtidAndName(name,ftid);
							} catch(Exception m) {
								String msg = m.getMessage();
								session.setAttribute("msg", msg);
								response.sendRedirect("file.jspx?id=" + ftid);
								return;
							}
						}
					} else {
						String filename = item.getName(); 
						str = filename.substring(filename.lastIndexOf("."));
						//获取文件的大小
						long fileSize = item.getSize();
						if(fileSize >= 1024*1024) {
							size = FloatUtil.getFloat(fileSize/(1024*1024)) + "M";
						} else {
							size = FloatUtil.getFloat(fileSize/1024) + "KB";
						}
						 
						//为上传文件,写入指定的文件夹中,str为文件的后缀名
						item.write(new java.io.File(file,(id+str)));
					}
				}
			} catch (Exception ee) {
				ee.printStackTrace();
			} 
		} else {
			throw new RuntimeException("请设置表单的enctype属性");
		}
		//获取当前文件夹的id
		File f = new File();
		f.setId(id + str);
		f.setName(name);
		f.setCreateTime(DateUtil.getNow());
		f.setUserId(user.getId());
		f.setFileTypeId(ftid);
		//调用service项数据库中添加数据
		fs.saveFile(f);
		//把记录更新到filetype中
		FileTypeService fts = new FileTypeService();
		fts.update(ftid);
		//保存成功，添加到message中
		//MessageService ms = new MessageService();
		//Message m = new Message();
		String s = "<a href=\"file.jspx?m=download&id="+f.getId() + "\">";
		String	text=" 上传了资料:" + s + name + "</a>";
	//Mage.insert(p.getId(), text, user.getId());
		//m.setContent(" 上传了资料:" + s + name + "</a>");
	/*	m.setId(PKUtil.getPk());
		m.setCreateTime(DateUtil.getNow());
		m.setEmployeeId(e.getId());
		m.setProjectId(p.getId());
		ms.saveMessage(m);*/
		
		response.sendRedirect("file.jspx");
		
		
	}
	FileDao fileDao = new FileDao();
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ftid = request.getParameter("ftid");
		List<File> fileList = fileDao.findByFtId(ftid);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("fileList",fileList);
		request.setAttribute("user", user);
		
		request.getRequestDispatcher("/WEB-INF/views/file.jsp").forward(request, response);
		
	}
}
