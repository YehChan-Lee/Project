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
	private SqlSession sqlSession;
	
	public VisitDao() {}

	public VisitDao(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	// 방문 IP Insert
	public void insertVisit(String visitIp) {	
		sqlSession.insert("VisitVo.VisitInsert", visitIp);
	}
	// 방문 IP 필터링(중복체크)
	public List<VisitVo> reVisi(String custIP) {
		return sqlSession.selectList("VisitVo.reVisi", custIP);
	}
}
/*package com.javaex.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VisitDao {

	@Autowired
	private SqlSession sqlSession;

	public VisitDao() {
	}

	public VisitDao(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}

	public void insertVisit(String visitIp) throws Exception {
		System.out.println(visitIp);
		System.out.println("절취선");

		System.out.println("SqlSession ===> " + sqlSession);
		
		
		

		
		 * HashMap<String,Object> map = new HashMap<String, Object>();
		 * map.put("visitIp",visitVo.getVisit_ip()); System.out.println(map);
		 * System.out.println(visitVo.getVisit_ip());
		 * 
		 * map.put("visitIp", "s1s2"); sqlSession.insert("VisitVo.VisitInsert", map );
		 

		sqlSession.insert("VisitVo.VisitInsert", visitIp);
		
	}

}*/
