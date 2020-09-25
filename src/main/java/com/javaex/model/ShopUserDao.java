package com.javaex.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopUserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ShopUserDao(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	public ShopUserVo loginCheck(String email) {		
		return sqlSession.selectOne("ShopUser.getUser", email);
	}
	
	public void signUp(ShopUserVo user) {
		sqlSession.insert("ShopUser.signUp",user);
	}
	
	public ShopUserVo getUser(String user_email) {
		return sqlSession.selectOne("ShopUser.getUser", user_email);
	}
	
}
