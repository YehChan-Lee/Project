package com.javaex.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDao {

	@Autowired
	private SqlSession sqlSession;
	
	public ReservationDao(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	public ReservationVo user_reserve(String user_email) {
		return sqlSession.selectOne(user_email);
	}

	 public int footerreserve() {
		 int footerreserve = sqlSession.selectOne("All.footerreserve");
			System.out.println(footerreserve);
		return sqlSession.selectOne("All.footerreserve");
	 }
}
