package com.javaex.model;

import java.util.HashMap;
import java.util.List;

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
		return sqlSession.selectOne("ShopUserVo.getUser", email);
	}
	
	public void signUp(ShopUserVo user) {
		sqlSession.insert("ShopUserVo.signUp",user);
	}
	
	public void update_recentShop_shopIdx(String user_email, String shop_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_email", user_email);
		map.put("shop_idx", shop_idx);
		sqlSession.update("ShopUserVo.update_recentShop_user_email", map);
	}
	
	public ShopUserVo getUser(String user_email) {
		return sqlSession.selectOne("ShopUserVo.getUser", user_email);
	}
	public String selectemail(HashMap<String, Object> map) {
		return sqlSession.selectOne("ShopUserVo.selectemail",map);
	}
	public List<String> searchemail() {
		return sqlSession.selectList("ShopUserVo.searchEmail");
	}
	
	public void updatepassword(HashMap<String, Object> map) {
		sqlSession.update("ShopUserVo.passwordupdate", map);
	}
}
