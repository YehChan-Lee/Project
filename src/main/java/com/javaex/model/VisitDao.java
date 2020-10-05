package com.javaex.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VisitDao {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	VisitDao visitDao;	
	
	public VisitDao() {}

	public VisitDao(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	// 방문 IP Insert
	public void insertVisit(VisitVo visitVo) {	
		sqlSession.insert("VisitVo.VisitInsert", visitVo);
	}
	public List<VisitVo> aTotalAll() {
		List<VisitVo> visitvo = sqlSession.selectList("VisitVo.visitAll");
		System.out.println(visitvo.size());
		 for (int i = 0; i < visitvo.size(); i++) {
			 System.out.println(visitvo.get(i));
		 }
		return visitvo;
	}
	// 오늘 방문
	public List<VisitVo> aTotalToday(String today) {
		List<VisitVo> visitvo = sqlSession.selectList("VisitVo.visitToday", today);
		System.out.println(visitvo.size());
		 for (int i = 0; i < visitvo.size(); i++) {
			 System.out.println(visitvo.get(i));
		 }
		return visitvo;
	}
	// 이달 방문
	public List<VisitVo> aTotalMonth(String today) {
		List<VisitVo> visitvo = sqlSession.selectList("VisitVo.visitToday", today);
		System.out.println(visitvo.size());
		 for (int i = 0; i < visitvo.size(); i++) {
			 System.out.println(visitvo.get(i));
		 }
		return visitvo;
	}
}


//		visitDao.reVisi(visitVo);
//		/* System.out.println(visitDao.reVisi(visitVo).size()); */
//		
//		if(visitDao.reVisi(visitVo).size() == 0) { 
//			visitDao.insertVisit(visitVo);
//		} else {
//			System.out.println("Id 중복 >> " + visitVo + "("+visitDao.reVisi(visitVo).size()+")");
//		}
/*
 * // 방문 IP 필터링(중복체크) public List<VisitVo> reVisi(VisitVo visitVo) { return
 * sqlSession.selectList("VisitVo.reVisi", visitVo); }
 */