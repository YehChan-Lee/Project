package com.javaex.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class NewsDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public NewsDao(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}

}
