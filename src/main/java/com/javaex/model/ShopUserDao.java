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
	
	public void reviewCntUpload(String user_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		
		map.put("userEmail",user_email);
		result = sqlSession.selectOne("Review.idReviewCnt",map);
		int cnt = Integer.parseInt(String.valueOf(result.get("CNT")));
		map.put("cnt",cnt);
		System.out.println("오류테스트 :" + map);
		sqlSession.update("ShopUserVo.reviewCntUpload",map);		
	}
}
