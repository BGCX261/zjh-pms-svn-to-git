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
		//�ж��Ƿ������ͬ������
		FileType f = dao.findByNameAndPid(ft.getName(),ft.getProjectId());
				
				if(f == null) {
					dao.insert(ft);
				} else {
					//������ͬ������
					throw new RuntimeException("�Ѵ��ڵ�����");
				}
	}

	/**
	 * �����ļ�ɾ���ļ���
	 * @param id ���ݵ�id
	 */
	public void del(String id) {
		FileType ft = dao.findById(id);
		if(ft == null) {
			//�޸���id��ֵ
			throw new RuntimeException("���������");
		} else {
			dao.del(id);
		}

	}

	/**
	 * �޸��ļ���С
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
