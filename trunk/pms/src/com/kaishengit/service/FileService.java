package com.kaishengit.service;

import com.kaishengit.dao.FileDao;
import com.kaishengit.entity.File;

public class FileService {

	private FileDao dao = new FileDao();
	public void delFile(String id) {
		File file = dao.findById(id);
		if(file == null) {
			throw new RuntimeException("���ļ�������");
		} else {
			dao.delFile(id);
		}

	}
	public void findByFtidAndName(String name, String ftid) {
		File file = dao.findByName(name,ftid);
		if(file != null) {
			throw new RuntimeException("�ļ������Ѵ���");
		} 
	}
	public void saveFile(File f) {
		dao.save(f);
	}
}
