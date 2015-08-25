package com.kaishengit.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kaishengit.entity.File;
import com.kaishengit.entity.FileType;
import com.kaishengit.util.DBHelp;
import com.kaishengit.util.RowMapper;

public class FileDao {

	private DBHelp<File> db = new DBHelp<File>();
	
	public List<File> findByFtId(String ftid){
		String sql = "select id,name,filename,filesize,createtime,filetypeid,userid from t_file where filetypeid = ?";
		return db.executeQueryForList(sql, new FileRowMapper(), ftid);
	}
	public void delFile(String id) {
		String sql = "DELETE FROM t_file WHERE id = ?";
		db.executeSQL(sql, id);
	}
	public void save(File f) {
		String sql = "INSERT INTO t_file(id,`name`,createtime,userid, fileTypeid) VALUES(?,?,?,?,?)";
		db.executeSQL(sql, f.getId(), f.getName(), f.getCreateTime(), f.getUserId(), f.getFileTypeId());
	}
	
	
	public class FileRowMapper implements RowMapper<File> {

		public File mapperRow(ResultSet rs) throws SQLException {
			
			File file = new File();
			
			file.setId(rs.getString("id"));
			file.setName(rs.getString("name"));
			file.setFileName(rs.getString("fileName"));
			file.setFileSize(rs.getString("fileSize"));
			file.setCreateTime(rs.getString("createTime"));
			file.setUserId(rs.getString("userId"));
			file.setFileTypeId(rs.getString("fileTypeId"));
			return file;
		}

	}


	
	public File findById(String id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT id,`name`,createtime,userid, filetypeid");
		sql.append(" FROM t_file where userid in(select id from t_user) and id= ? order by createtime desc");
		return db.executeQueryForObject(sql.toString(), new FileRowMapper(), id);
	}
	
	public File findByName(String name, String ftid) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT id,`name`,createtime,userid, filetypeid");
		sql.append(" FROM t_file where userid in(select id from t_user) and name = ? and filetypeid= ? order by createtime desc");
		return db.executeQueryForObject(sql.toString(), new FileRowMapper(), name, ftid);
	}
		
	

}
