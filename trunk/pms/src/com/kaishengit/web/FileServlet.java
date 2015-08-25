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
		//��ȡ���ļ���id
		String id = PKUtil.getPk(); 
		String name = null; 
		String str = null;
		String size = null;
		//�����ϴ��ļ���ŵ�·��
		java.io.File file = new java.io.File("c:/pms");
		//������ʱ�ļ���
		java.io.File tempFile = new java.io.File("c:/temp");
		
		//�ļ�������ʱ�Զ�����
		if(!file.exists()) {
			file.mkdir();
		} 
		if(!tempFile.exists()) {
			tempFile.mkdir();
		}
		
		//�ж��Ƿ�������enctype����
		if(ServletFileUpload.isMultipartContent(request)) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			
			//���û�������С
			factory.setSizeThreshold(1024*10);
			//������ʱ�ļ���
			factory.setRepository(tempFile);
			
			ServletFileUpload fileupload = new ServletFileUpload(factory);
			//��������ϴ��ļ���С,����ϴ��ļ�Ϊ1G
			fileupload.setSizeMax(1024*1024*1024);
			
			try {
				List<FileItem> items = fileupload.parseRequest(request);
				for(FileItem item :items) {
					//�ж��µ�ǰԪ���Ƿ�Ϊ�ϴ�Ԫ��
					if(item.isFormField()) {
						//Ϊ����ͨԪ��
						if("name".equals(item.getFieldName())) {
							//Ϊname��Ԫ��,��ȡ��ֵ
							name = item.getString("utf-8");
							name = name.replace("<", "&lt;");
							name = name.replace(">", "&gt;");
							//�жϸ������Ƿ��Ѵ���
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
						//��ȡ�ļ��Ĵ�С
						long fileSize = item.getSize();
						if(fileSize >= 1024*1024) {
							size = FloatUtil.getFloat(fileSize/(1024*1024)) + "M";
						} else {
							size = FloatUtil.getFloat(fileSize/1024) + "KB";
						}
						 
						//Ϊ�ϴ��ļ�,д��ָ�����ļ�����,strΪ�ļ��ĺ�׺��
						item.write(new java.io.File(file,(id+str)));
					}
				}
			} catch (Exception ee) {
				ee.printStackTrace();
			} 
		} else {
			throw new RuntimeException("�����ñ���enctype����");
		}
		//��ȡ��ǰ�ļ��е�id
		File f = new File();
		f.setId(id + str);
		f.setName(name);
		f.setCreateTime(DateUtil.getNow());
		f.setUserId(user.getId());
		f.setFileTypeId(ftid);
		//����service�����ݿ����������
		fs.saveFile(f);
		//�Ѽ�¼���µ�filetype��
		FileTypeService fts = new FileTypeService();
		fts.update(ftid);
		//����ɹ�����ӵ�message��
		//MessageService ms = new MessageService();
		//Message m = new Message();
		String s = "<a href=\"file.jspx?m=download&id="+f.getId() + "\">";
		String	text=" �ϴ�������:" + s + name + "</a>";
	//Mage.insert(p.getId(), text, user.getId());
		//m.setContent(" �ϴ�������:" + s + name + "</a>");
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
