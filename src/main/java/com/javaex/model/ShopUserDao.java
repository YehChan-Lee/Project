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
		sqlSession.insert("ShopUserVo.signUp", user);
	}

	public void update_recentShop_shopIdx(String user_email,int shop_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_email", user_email);
		map.put("shop_idx", shop_idx);
		sqlSession.update("ShopUserVo.update_recentShop_user_email", map);
	}

	public ShopUserVo getUser(String user_email) {
		return sqlSession.selectOne("ShopUserVo.getUser", user_email);
	}

	public String selectemail(HashMap<String, Object> map) {
		return sqlSession.selectOne("ShopUserVo.selectemail", map);
	}

	public List<String> searchemail() {
		return sqlSession.selectList("ShopUserVo.searchEmail");
	}

	public void updatepassword(HashMap<String, Object> map) {
		sqlSession.update("ShopUserVo.passwordupdate", map);

	}

	// 마이페이지 정보수정
	public void Update_shopuser(String user_name, String user_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_name", user_name);
		map.put("user_email", user_email);
		sqlSession.update("ShopUserVo.Update_shopuser", map);
	}

	public void Update_phone(String user_phone, String user_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_phone", user_phone);
		map.put("user_email", user_email);
		sqlSession.update("ShopUserVo.Update_phone", map);
	}

	public void reviewCntUpload(String user_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> result = new HashMap<String, Object>();

		map.put("userEmail", user_email);
		result = sqlSession.selectOne("Review.idReviewCnt", map);
		int cnt = Integer.parseInt(String.valueOf(result.get("CNT")));
		map.put("cnt", cnt);
		System.out.println("오류테스트 :" + map);
		sqlSession.update("ShopUserVo.reviewCntUpload", map);
	}

	public void profileUpdate(String fileName,String user_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		map.put("user_email", user_email);
		sqlSession.update("ShopUserVo.profileUpdate",map);		
	}
}
