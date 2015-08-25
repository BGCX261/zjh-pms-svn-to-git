package com.kaishengit.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kaishengit.entity.Data;
import com.kaishengit.util.DBHelp;
import com.kaishengit.util.RowMapper;

public class DataDao {

	private DBHelp<Data> db = new DBHelp<Data>();
	
	public void save(Data data){
		String sql = "insert into t_data(id,`title`,`content`,`createtime`,userid,projectid)values(?,?,?,?,?,?)";
		db.executeSQL(sql,data.getId(),data.getTitle(),data.getContent(),data.getCreateTime(),data.getUserId(),data.getProjectId());
		
	}

	public List<Data> findAll() {
		String sql = "select id,`title`,`content`,`createtime`,userid,projectid from t_data";
		return db.executeQueryForList(sql, new DataRowMapper() );
	}
	
	private class DataRowMapper implements RowMapper<Data>{

		public Data mapperRow(ResultSet rs) throws SQLException {
			Data data = new Data();
			data.setId(rs.getString("id"));
			data.setTitle(rs.getString("title"));
			data.setContent(rs.getString("content"));
			data.setCreateTime(rs.getString("createtime"));
			data.setUserId(rs.getString("userid"));
			data.setProjectId(rs.getString("projectid"));
			return data;
		}
		
	}


	public Data findById(String id) {
		
		String sql = "select id,`title`,`content`,`createtime`,userid,projectid from t_data where id = ?";
		return db.executeQueryForObject(sql, new DataRowMapper() , id);
	}

	
	public void update(Data d) {
		String sql = "UPDATE t_data SET `title`=?,`content`=?,createtime=?,userid=?,projectid=? WHERE id=?";
		db.executeSQL(sql, d.getTitle(),d.getContent(),d.getCreateTime(),d.getUserId(),d.getProjectId(),d.getId());
	}

	public void del(String id) {
		String sql = "DELETE FROM t_data WHERE id=?";
		db.executeSQL(sql, id);
	} 
}

