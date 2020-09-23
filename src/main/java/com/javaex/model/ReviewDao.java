package com.javaex.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ReviewDao() {}
	
	public ReviewDao(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	public int footerreview() {
		int footerreview = sqlSession.selectOne("ReviewVo.footerreview");
		System.out.println(footerreview);
		return sqlSession.selectOne("ReviewVo.footerreview");
	 }
}
