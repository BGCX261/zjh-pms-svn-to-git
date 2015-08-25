package com.kaishengit.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kaishengit.entity.User;
import com.kaishengit.util.DBHelp;
import com.kaishengit.util.RowMapper;

public class UserDao {

	private DBHelp<User> db = new DBHelp<User>();
	
	public User findByNameAndPwd(String name,String pwd) {
		String sql = "select id,username,password from t_user where username = ? and password = ?";
		return db.executeQueryForObject(sql, new UserRowMapper(), name,pwd);
	}
	public User findById(String id){
		String sql = "select id,username,password from t_user where id= ?";
		return db.executeQueryForObject(sql, new UserRowMapper(), id);
	} 
	public List<User> findAll(){
		String sql = "select id,username,password from t_user";
		return db.executeQueryForList(sql, new UserRowMapper());
	}
	
	private class UserRowMapper implements RowMapper<User> {

		public User mapperRow(ResultSet rs) throws SQLException {
			User user = new User();
			user.setId(rs.getString("id"));
			user.setPassword(rs.getString("password"));
			user.setUserName(rs.getString("userName"));
			return user;
		}
		
	}
}
