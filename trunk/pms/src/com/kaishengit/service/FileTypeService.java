package com.kaishengit.service;

import java.util.List;

import com.kaishengit.dao.FileDao;
import com.kaishengit.dao.FileTypeDao;
import com.kaishengit.entity.File;
import com.kaishengit.entity.FileType;
import com.kaishengit.util.FloatUtil;

public class FileTypeService {
	private FileTypeDao dao = new FileTypeDao();
	private FileDao filedao = new FileDao();
	
	public List<FileType> findAllById(String id) {
		return dao.findByProjectId(id);
	}

	public void saveFileType(FileType ft) {
		//判断是否存在相同的名字
		FileType f = dao.findByNameAndPid(ft.getName(),ft.getProjectId());
				
				if(f == null) {
					dao.insert(ft);
				} else {
					//存在相同的姓名
					throw new RuntimeException("已存在的名称");
				}
	}

	/**
	 * 根据文件删除文件夹
	 * @param id 依据的id
	 */
	public void del(String id) {
		FileType ft = dao.findById(id);
		if(ft == null) {
			//修改了id的值
			throw new RuntimeException("错误的请求");
		} else {
			dao.del(id);
		}

	}

	/**
	 * 修改文件大小
	 * @param ftid
	 */
	public void update(String ftid) {
		List<File> files = filedao.findByFtId(ftid);
		int length = files.size();
		float total = 0f; 
		String size = null;
		for(File f : files) {
			String filesize = f.getFileSize();
			
			if(filesize.endsWith("KB")){
				String kbsize = filesize.substring(0,filesize.lastIndexOf("K"));
				total += Float.parseFloat(kbsize);
			} else if(filesize.endsWith("M")) {
				String msize = filesize.substring(0,filesize.lastIndexOf("M"));
				total += Float.parseFloat(msize)*1024;
			}
		}
		
		if(total > 1024) {
				long totalsize = (long) ((total)/1024) ;
				size = length + "files" + FloatUtil.getFloat(totalsize)+"M";
			} else {
				size = length + "files" + total + "KB";
		}
		
		dao.update(ftid,size);
	}
}
