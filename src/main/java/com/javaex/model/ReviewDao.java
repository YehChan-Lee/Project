package com.javaex.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public ReviewDao() {}
	
	public ReviewDao(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}	
	public int reviewCnt(String shop_id) {
		HashMap<String, Object> map = sqlsession.selectOne("reviewCnt",shop_id);
//		System.out.println("CNT : "+String.valueOf(map.get("CNT")));
		int cnt = Integer.parseInt(String.valueOf(map.get("CNT")));
		return cnt;
	}
	public void reviewUpload(ReviewVo reviewvo) {
		System.out.println(reviewvo);
		sqlsession.insert("Review.reviewInsert", reviewvo);
	}
}
