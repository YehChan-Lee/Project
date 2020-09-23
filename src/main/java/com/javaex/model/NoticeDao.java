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
	
	// 목록 조회
	public List<NoticeVo> pageList(Criteria cri){
		System.out.println("NoticeDao");
		return sqlsession.selectList("Notice.pageList", cri);
	}
	// 게시물 총 개수
	public int pageCount() {
		return sqlsession.selectOne("Notice.pageCount");
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
	
	public int getNoticeCnt() {
		return sqlsession.selectOne("Notice.getNoticeCnt");
	}

}
