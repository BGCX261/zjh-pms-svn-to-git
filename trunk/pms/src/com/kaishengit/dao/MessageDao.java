package com.kaishengit.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kaishengit.entity.Message;
import com.kaishengit.util.DBHelp;
import com.kaishengit.util.RowMapper;

public class MessageDao {

	private DBHelp<Message> db = new DBHelp<Message>();
	
	public void insert(Message message){
		String sql="insert into t_message(id,content,createtime,userid,projectid) value(?,?,?,?,?)";
	    db.executeSQL(sql, message.getId(),message.getContent(),message.getCreateTime(),message.getUserId(),message.getProjectId());
		
	} 
	public List<Message> findAllByProjId(String projectid){
		String sql = "select id,content,createtime,userid,projectid from t_message where projectid = ?";
		return db.executeQueryForList(sql, new MessageRowMapper(), projectid);
	}
	
	public class MessageRowMapper implements RowMapper<Message>{

		public Message mapperRow(ResultSet rs) throws SQLException {
			Message message = new Message();
			message.setId(rs.getString("id"));
			message.setContent(rs.getString("content"));
			message.setCreateTime(rs.getString("createtime"));
			message.setUserId(rs.getString("userid"));
			message.setProjectId(rs.getString("projectid"));
			return message;
		}
	}
			
			
		
}
		