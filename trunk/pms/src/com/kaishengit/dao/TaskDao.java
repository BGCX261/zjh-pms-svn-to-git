package com.kaishengit.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


import com.kaishengit.entity.Task;
import com.kaishengit.entity.User;
import com.kaishengit.util.DBHelp;
import com.kaishengit.util.RowMapper;

public class TaskDao {
	private DBHelp<Task> db = new DBHelp<Task>();
	
	public void insert(Task task){
		String sql="insert into t_task(id,name,`desc`,state,level,begintime,endtime,createtime,userid,goalid,rate) value(?,?,?,?,?,?,?,?,?,?,?)";
		db.executeSQL(sql,task.getId(),task.getName(),task.getDesc(),task.getState(),task.getLevel(),task.getBeginTime(),task.getEndTime(),task.getCreateTime(),task.getUserId(),task.getGoalId(),task.getRate());
		
		
	}

	public List<Task> findByGoalId(String goalid){
		String sql="select id,name,`desc`,state,level,begintime,endtime,createtime,rate,userid,goalid from t_task where goalid=?";
		return db.executeQueryForList(sql, new TaskRowMapper(), goalid);
		
	}
	
	public Task findById(String id){
		String sql="select id,name,`desc`,state,level,begintime,endtime,createtime,rate,userid,goalid from t_task where id=?";
		return db.executeQueryForObject(sql, new TaskRowMapper(), id);
	}
	
	public void update(Task task) {
		String sql = "update t_task set `name`= ? ,`desc`=?,`state`=?,level=?,begintime=?,endtime=?,createtime=?,userid=?,goalid=?,rate=? where id=?";
		db.executeSQL(sql, task.getName(),task.getDesc(),task.getState(),task.getLevel(),task.getBeginTime(),task.getEndTime(),task.getCreateTime(),task.getUserId(),task.getGoalId(),task.getRate(),task.getId());
	}
	
	private class TaskRowMapper implements RowMapper<Task> {

		public Task mapperRow(ResultSet rs) throws SQLException {
			Task task = new Task();
			task.setId(rs.getString("id"));
			task.setName(rs.getString("name"));
			task.setDesc(rs.getString("desc"));
			task.setState(rs.getString("state"));
			task.setLevel(rs.getString("level"));
			task.setBeginTime(rs.getString("beginTime"));
			task.setEndTime(rs.getString("endTime"));
			task.setCreateTime(rs.getString("createTime"));
			task.setUserId(rs.getString("userId"));
			task.setGoalId(rs.getString("goalId"));
			task.setRate(rs.getString("rate"));
			
			return task;
		}
		
	}
	

}
