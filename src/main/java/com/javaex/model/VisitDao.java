package com.javaex.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		/*System.out.println(visitvo.size());
		 for (int i = 0; i < visitvo.size(); i++) {
			 System.out.println(visitvo.get(i));
		 }*/
		return visitvo;
	}
	// 오늘 방문
	public List<VisitVo> aTotalToday(String today) {
		List<VisitVo> visitvo = sqlSession.selectList("VisitVo.visitToday", today);
		/*System.out.println(visitvo.size());
		 for (int i = 0; i < visitvo.size(); i++) {
			 System.out.println(visitvo.get(i));
		 }*/
		return visitvo;
	}
	// 이달 방문
	public int aTotalMonth() {
		int visitInt = sqlSession.selectOne("VisitVo.visitMonth");
		return visitInt;
	}
	// 어드민 홈 월별 통계
	public HashMap<Integer, Object> aHomeMonth(String month) {
		HashMap<Integer, Object> viSize = new HashMap<>();
		for(int i=1; i<13;i++) {
			List<VisitVo> visitvo = sqlSession.selectList("VisitVo.visitHomeM", i);			
			int visitvoSize = visitvo.size();
			viSize.put(i, visitvoSize);
		}

		return viSize;
	}
	public List<Map<String, Object>> aWeek(String week) {
		
		/*List<Map<String, Object>> weekVo = (List<Map<String, Object>>)sqlSession.selectList("VisitVo.visitMonth", week);*/
		List<Map<String, Object>> weekList = sqlSession.selectList("VisitVo.visitMonth", week);
		System.out.println(">>>?"+weekList.get(0));
		System.out.println(">>>?!"+weekList);
		/*for (int i=0; i< weekVo.size(); i++)

		{

		System.out.println( weekVo.get(i));
		}*/
		return weekList;
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