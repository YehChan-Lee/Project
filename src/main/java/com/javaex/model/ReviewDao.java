package com.javaex.model;

import java.util.HashMap;
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
	
	public int footerreview() {
		int footerreview = sqlsession.selectOne("ReviewVo.footerreview");
		System.out.println(footerreview);
		return sqlsession.selectOne("ReviewVo.footerreview");
	 }

	public int reviewCnt(String shop_id) {
		HashMap<String, Object> map = sqlsession.selectOne("reviewCnt", shop_id);
//		System.out.println("CNT : "+String.valueOf(map.get("CNT")));
		int cnt = Integer.parseInt(String.valueOf(map.get("CNT")));
		return cnt;
	}

	public void reviewUpload(ReviewVo reviewvo) {
		System.out.println(reviewvo);
		sqlsession.insert("Review.reviewInsert", reviewvo);
	}

	public ReviewLikeVo reviewlikeCheck(String email, int reviewIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("reviewIdx", reviewIdx);
		return sqlsession.selectOne("Review.likeCheck", map);
	}
	public ReviewHateVo reviewhateCheck(String email, int reviewIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("reviewIdx", reviewIdx);
		return sqlsession.selectOne("Review.hateCheck", map);
	}

	public void likeAdd(String user_email, int review_idx, String shopId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", user_email);
		map.put("reviewIdx", review_idx);
		map.put("shopId", shopId);
		System.out.println("likeAdd : " + user_email + " " + review_idx + " " + shopId);
		sqlsession.insert("Review.likeAdd", map);
	}

	public int likeCnt(int review_idx) {
		int cnt = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reviewIdx", review_idx);
		HashMap<String, Object> reMap = sqlsession.selectOne("Review.likeCnt", map);
		cnt = Integer.parseInt(String.valueOf(reMap.get("CNT")));
		return cnt;
	}

	public void likeReload(int reviewIdx,int cnt) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("reviewIdx", reviewIdx);
		map.put("cnt", cnt);		
		sqlsession.update("Review.like_up",map);
	}

	public void hateAdd(String user_email, int review_idx, String shopId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", user_email);
		map.put("reviewIdx", review_idx);
		map.put("shopId", shopId);
		System.out.println("hateAdd : " + user_email + " " + review_idx + " " + shopId);
		sqlsession.insert("Review.hateAdd", map);
		
	}

	public void hateReload(int review_idx, int likeCnt) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("reviewIdx", review_idx);
		map.put("cnt", likeCnt);		
		sqlsession.update("Review.hate_up",map);
		
	}

	public int hateCnt(int review_idx) {
		int cnt = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reviewIdx", review_idx);
		HashMap<String, Object> reMap = sqlsession.selectOne("Review.hateCnt", map);
		cnt = Integer.parseInt(String.valueOf(reMap.get("CNT")));		
		return cnt;
	}

	public List<ReviewLikeVo> likeList(String user_email,String shopId) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		map.put("user_email",user_email);
		map.put("shopId",shopId);
		return sqlsession.selectList("Review.likeList",map);
	}

	public List<ReviewHateVo> hateList(String user_email,String shopId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_email",user_email);
		map.put("shopId",shopId);
		return sqlsession.selectList("Review.hateList",map);
	}
}
