package com.javaex.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	// 리스트(12개씩)
	public List<NoticeVo> noticeList() {
		List<NoticeVo> nlist = sqlsession.selectList("Notice.noticeList");		
		return nlist;
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
