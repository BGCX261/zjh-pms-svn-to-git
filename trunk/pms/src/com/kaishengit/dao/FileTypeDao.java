package com.kaishengit.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kaishengit.entity.FileType;
import com.kaishengit.util.DBHelp;
import com.kaishengit.util.RowMapper;

public class FileTypeDao {

	private DBHelp<FileType> db = new DBHelp<FileType>();
	
	public void insert(FileType ft){
		String sql="insert into t_filetype(id,`name`,createtime,`userid`,`projectid`) value(?,?,?,?,?)";
		db.executeSQL(sql, ft.getId(),ft.getName(),ft.getCreateTime(),ft.getUserId(),ft.getProjectId());
	}
	
	public List<FileType> findByProjectId(String projectid) {
		String sql = "select id,`name`,createtime,`userid`,`projectid` from t_filetype where projectid = ?";
		return db.executeQueryForList(sql, new FileTypeRowMapper(), projectid);
	}
	
	public FileType findById(String id) {
		String sql = "SELECT id,`name`,createtime,userid, projectid  FROM t_filetype where userid in (select id from t_user ) and id = ?";
		return db.executeQueryForObject(sql, new FileTypeRowMapper(), id);
	}
	
	public class FileTypeRowMapper implements RowMapper<FileType> {

		public FileType mapperRow(ResultSet rs) throws SQLException {
			
			FileType ft = new FileType();
			
			ft.setId(rs.getString("id"));
			ft.setName(rs.getString("name"));
			ft.setCreateTime(rs.getString("createTime"));
			ft.setUserId(rs.getString("userId"));
			ft.setProjectId(rs.getString("projectId"));
			return ft;
		}

	}

	public FileType findByNameAndPid(String name, String projectId) {
		String sql = "SELECT id,`name`,createtime,userid, projectid  FROM t_filetype where userid in(select id from t_user) and  `name` = ? and projectid = ? ; ";
		return db.executeQueryForObject(sql, new FileTypeRowMapper(), name, projectId);
	}

	public void del(String id) {
		String sql = "DELETE FROM t_filetype WHERE id=?";
		db.executeSQL(sql, id);
	}

	public void update(String ftid, String size) {
		String sql = "UPDATE t_filetype SET filesize=? WHERE id=?";
		db.executeQueryForCount(sql, ftid, size);
	}

	
}
