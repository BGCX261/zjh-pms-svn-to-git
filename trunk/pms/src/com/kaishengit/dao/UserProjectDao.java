package com.kaishengit.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kaishengit.entity.UserProject;
import com.kaishengit.util.DBHelp;
import com.kaishengit.util.RowMapper;

public class UserProjectDao {
	private DBHelp<UserProject> db = new DBHelp<UserProject>();
	
	public void insert(String userid,String projectid) {
		String sql="insert into t_user_Project(t_user_id,t_project_id) value(?,?) ";
		db.executeSQL(sql, userid,projectid);
	}
//通过项目的id查询所有
	public List<UserProject> findList(String projectid){
		String sql="select DISTINCT  userid,projectid,role from t_user_project where projectid=?";
		return db.executeQueryForList(sql, new UserProjectRowMapper(), projectid);
		
		
	}
	public class UserProjectRowMapper implements RowMapper<UserProject>{

		public UserProject mapperRow(ResultSet rs) throws SQLException {
			UserProject ds=new UserProject();
			
			ds.setT_user_id(rs.getString("userid"));
			ds.setT_project_id(rs.getString("projectid"));
			ds.setRole(rs.getString("role"));
			return ds;
		}}
}
