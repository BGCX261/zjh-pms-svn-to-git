package com.kaishengit.service;

import com.kaishengit.dao.MessageDao;
import com.kaishengit.entity.Message;
import com.kaishengit.util.DateUtil;
import com.kaishengit.util.PKUtil;

public class MsgService {
public static void insert(String projectid,String content,String userid){
		
		Message message=new Message();
		 message.setId(PKUtil.getPk());
		 message.setContent(content);
		 message.setUserId(userid);
		 message.setProjectId(projectid);
		 message.setCreateTime(DateUtil.getNow());
		 MessageDao msgDao=new MessageDao();
		 
		/* System.out.println(proid);
		 System.out.println(text);
		 System.out.println(employeeid);*/
		 
		 msgDao.insert(message);
		}

}
