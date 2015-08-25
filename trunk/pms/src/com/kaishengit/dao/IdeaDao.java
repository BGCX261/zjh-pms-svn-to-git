package com.kaishengit.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kaishengit.entity.Idea;
import com.kaishengit.util.DBHelp;
import com.kaishengit.util.RowMapper;

public class IdeaDao {
	private DBHelp<Idea> db = new DBHelp<Idea>();
	
	public List<Idea> findAll() {
		String sql = "select id,`title`,`content`,`createtime`,userid,projectid from t_idea";
		return db.executeQueryForList(sql, new IdeaRowMapper() );
	}
 
	private class IdeaRowMapper implements RowMapper<Idea>{
		public Idea mapperRow(ResultSet rs) throws SQLException {
			Idea idea = new Idea();
			idea.setId(rs.getString("id"));
			idea.setTitle(rs.getString("title"));
			idea.setContent(rs.getString("content"));
			idea.setCreateTime(rs.getString("createTime"));
			idea.setProjectId(rs.getString("projectid"));
			idea.setUserId(rs.getString("userId"));
			return idea;
		}
		
	}

	public void save(Idea idea) {
		String sql = "insert into t_idea(id,`title`,`content`,`createtime`,userid,projectid)values(?,?,?,?,?,?)";
		db.executeSQL(sql,idea.getId(),idea.getTitle(),idea.getContent(),idea.getCreateTime(),idea.getUserId(),idea.getProjectId());
		
	}

	public Idea findById(String id) {
		String sql = "select id,`title`,`content`,`createtime`,userid,projectid from t_idea where id = ?";
		return db.executeQueryForObject(sql, new IdeaRowMapper() , id);
	}

	public void update(Idea idea) {
		String sql = "UPDATE t_idea SET `title`=?,`content`=?,createtime=?,userid=?,projectid=? WHERE id=?";
		db.executeSQL(sql, idea.getTitle(),idea.getContent(),idea.getCreateTime(),idea.getUserId(),idea.getProjectId(),idea.getId());
	}

	public void del(String id) {
		String sql = "DELETE FROM t_idea WHERE id=?";
		db.executeSQL(sql, id);
	}
}
