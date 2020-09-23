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
		List<AllVo> allvo = sqlSession.selectList("All.reserveList", user_email);
		System.out.println(allvo.size());
		for (int i = 0; i < allvo.size(); i++) {
			System.out.println(allvo.get(i));
		}
		return sqlSession.selectList("All.reserveList", user_email);
	}
	
	public List<AllVo> pastList(String user_email) {
		List<AllVo> allvo = sqlSession.selectList("All.pastList", user_email);
		System.out.println(allvo.size());
		for (int i = 0; i < allvo.size(); i++) {
			System.out.println(allvo.get(i));
		}
		return sqlSession.selectList("All.pastList", user_email);
	}

	public List<AllVo> reviewList(String user_email) {
		List<AllVo> allvo = sqlSession.selectList("All.reviewList", user_email);
		System.out.println(allvo.size());
		for (int i = 0; i < allvo.size(); i++) {
			System.out.println(allvo.get(i));
		}
		return sqlSession.selectList("All.reviewList", user_email);
	}

	 public List<AllVo> dibsList(String user_email){
		 List<AllVo> allvo = sqlSession.selectList("All.dibsList", user_email);
		 System.out.println(allvo.size());
		 for (int i = 0; i < allvo.size(); i++) {
			 System.out.println(allvo.get(i));
		 }
		 return sqlSession.selectList("All.dibsList", user_email); 
	 }
	 
	 public List<AllVo> newsList(String user_email){
		 List<AllVo> allvo = sqlSession.selectList("All.newsList", user_email);
		 System.out.println(allvo.size());
		 for (int i = 0; i < allvo.size(); i++) {
			 System.out.println(allvo.get(i));
		 }
		 return sqlSession.selectList("All.newsList", user_email); 
	 }
	 
	 public List<AllVo> bpList(String user_email){
		 List<AllVo> allvo = sqlSession.selectList("All.bpList", user_email);
		 System.out.println(allvo.size());
		 for (int i = 0; i < allvo.size(); i++) {
			 System.out.println(allvo.get(i));
		 }
		 return sqlSession.selectList("All.bpList", user_email); 
	 }

	 public int footeruser() {
		int footeruser = sqlSession.selectOne("All.footeruser");
		System.out.println(footeruser);
		return sqlSession.selectOne("All.footeruser");
	 }
	 public List<AllVo> shopreviewList(String shopId){
		 List<AllVo> allvo = sqlSession.selectList("All.shopreviewList",shopId);
			System.out.println(allvo.size());
			for (int i = 0; i < allvo.size(); i++) {
				System.out.println(allvo.get(i));
			}
		return sqlSession.selectList("All.shopreviewList",shopId);
	}
	 
}
