package com.javaex.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
	@Autowired
	private SqlSession sqlsession;
	
	public NoticeDao() {}
	
	public NoticeDao(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	public List<NoticeVo> noticeList(){
		return sqlsession.selectList("Notice.noticeList");
	}
	
	public void insertNotice() {
		sqlsession.insert("Notice.noticeInsert");
	}
	
	public void updateNotice() {
		sqlsession.update("Notice.noticeUpdate");
	}
	
	public void deleteNotice() {
		sqlsession.delete("Notice.noticeDelete");
	}
}
