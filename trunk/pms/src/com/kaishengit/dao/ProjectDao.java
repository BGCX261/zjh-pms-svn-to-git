package com.kaishengit.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kaishengit.entity.Project;
import com.kaishengit.util.DBHelp;
import com.kaishengit.util.RowMapper;

public class ProjectDao {
	
	private DBHelp<Project> db = new DBHelp<Project>();
	
	public void save(Project project){
		String sql = "insert into t_project(id,`name`,createtime,`desc`)values(?,?,?,?)";
		db.executeSQL(sql, project.getId(),project.getName(),project.getCreateTime(),project.getDesc());
		
	}

	public List<Project> findAll() {
		String sql = "select id,`name`,createtime,`desc` from t_project";
		return db.executeQueryForList(sql, new ProjectRowMapper() );
	}
	public Project findById(String id){
		String sql = "select id,`name`,`desc`,createtime from t_project where id = ?";
		return db.executeQueryForObject(sql, new ProjectRowMapper(), id);
	}
	
	private class ProjectRowMapper implements RowMapper<Project>{

		public Project mapperRow(ResultSet rs) throws SQLException {
			Project project = new Project();
			project.setId(rs.getString("id"));
			project.setName(rs.getString("name"));
			project.setCreateTime(rs.getString("createTime"));
			project.setDesc(rs.getString("desc"));
			return project;
		}
		
	}

}
