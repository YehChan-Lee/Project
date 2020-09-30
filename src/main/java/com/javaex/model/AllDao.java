package com.javaex.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AllDao {

	@Autowired
	private SqlSession sqlSession;

	public AllDao(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}

	public List<AllVo> reserveList(String user_email) {
		return sqlSession.selectList("All.reserveList", user_email);
	}

	public List<AllVo> pastList(String user_email) {
		return sqlSession.selectList("All.pastList", user_email);
	}

	public List<AllVo> reviewList(String user_email) {
		return sqlSession.selectList("All.reviewList", user_email);
	}

	public List<AllVo> dibsList(String user_email) {
		return sqlSession.selectList("All.dibsList", user_email);
	}

	public List<AllVo> newsList(String user_email) {
		return sqlSession.selectList("All.newsList", user_email);
	}

	public List<AllVo> bpList(String user_email) {
		return sqlSession.selectList("All.bpList", user_email);
	}

	public List<AllVo> shopreviewList(String shopId, String sort) {
		List<AllVo> list = null;
		if (sort.equals("new")) {
			list = sqlSession.selectList("All.shopreviewList", shopId);
		} else if (sort.equals("popular")) {
			list = sqlSession.selectList("All.popreviewList", shopId);
		}
		return list;
	}

	public List<AllVo> getReview() {
		List<AllVo> list = sqlSession.selectList("All.getReviewList");
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
		return sqlSession.selectList("All.getReviewList");
	}

}
