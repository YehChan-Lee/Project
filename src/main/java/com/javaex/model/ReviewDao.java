package com.javaex.model;

import java.util.List;

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
}
