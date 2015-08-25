package com.kaishengit.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kaishengit.entity.Goal;
import com.kaishengit.util.DBHelp;
import com.kaishengit.util.RowMapper;

public class GoalDao {
	private DBHelp<Goal> db = new DBHelp<Goal>();
	
	public List<Goal> findGoals(String pid) {
		String sql = "select id,name,`desc`,createtime,userid,projectid,state from t_goal where projectid=?";
		return db.executeQueryForList(sql, new GoalRowMapper(), pid);

	}

	public Goal findByGoalId(String gid) {
		String sql = "select id,name,`desc`,createtime,userid,projectid,state from t_goal where id=?";
		return db.executeQueryForObject(sql, new GoalRowMapper(), gid);

	}

	public void update(Goal goal) {
		String sql = "update t_goal set name= ? ,`desc`=?,state=? where id=?";
		db.executeSQL(sql, goal.getName(), goal.getDesc(), goal.getState(),
				goal.getId());

	}
	public void save(Goal goal){
	String sql="insert into t_goal(id,`name`,`desc`,state,createtime,`userid`,`projectid`) value(?,?,?,?,?,?,?)";
	
	db.executeSQL(sql, goal.getId(),goal.getName(),goal.getDesc(),goal.getState(),goal.getCreateTime(),goal.getUserId(),goal.getProjectId());
	
	}
	public class GoalRowMapper implements RowMapper<Goal> {

		public Goal mapperRow(ResultSet rs) throws SQLException {
			Goal goal = new Goal();
			goal.setId(rs.getString("id"));
			goal.setName(rs.getString("name"));
			goal.setDesc(rs.getString("desc"));
			goal.setUserId(rs.getString("userId"));
			goal.setProjectId(rs.getString("projectId"));
			goal.setState(rs.getString("state"));
			return goal;
		}

	}
}
