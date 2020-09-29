package com.javaex.model;

import java.util.HashMap;

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
	
	public void update_recentShop_shopIdx(String user_email, String shop_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_email", user_email);
		map.put("shop_idx", shop_idx);
		sqlSession.update("ShopUser.update_recentShop_user_email", map);
	}
	
	public ShopUserVo getUser(String user_email) {
		return sqlSession.selectOne("ShopUser.getUser", user_email);
	}
	// 마이페이지 정보수정
	public void Update_shopuser(String user_name, String user_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_name", user_name);
		map.put("user_email", user_email);
		sqlSession.update("ShopUser.Update_shopuser", map);		
	}
	public void Update_phone(String user_phone, String user_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_phone", user_phone);
		map.put("user_email", user_email);
		sqlSession.update("ShopUser.Update_phone", map);
	}
	
}
