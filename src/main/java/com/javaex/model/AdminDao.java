package com.javaex.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;

	public AdminDao(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	public List<AdminVo> Areview_list(){
		 List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Areview_list");
		 System.out.println(adminvo.size());
		 for (int i = 0; i < adminvo.size(); i++) {
			 System.out.println(adminvo.get(i));
		 }
		 return sqlSession.selectList("AdminVo.Areview_list");
	 }
	
	public List<AdminVo> Amember_list(){
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Amember_list");
		 System.out.println(adminvo.size());
		 for (int i = 0; i < adminvo.size(); i++) {
			 System.out.println(adminvo.get(i));
		 }
		return sqlSession.selectList("AdminVo.Amember_list");
	}
}
