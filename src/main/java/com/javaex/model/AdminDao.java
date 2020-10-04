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
		 return adminvo;
	 }
	
	public List<AdminVo> Amember_list(){
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Amember_list");
		 System.out.println(adminvo.size());
		 for (int i = 0; i < adminvo.size(); i++) {
			 System.out.println(adminvo.get(i));
		 }
		return adminvo;
	}
	
	public List<AdminVo> Acompany_list(){
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Acompany_list");
		 System.out.println(adminvo.size());
		 for (int i = 0; i < adminvo.size(); i++) {
			 System.out.println(adminvo.get(i));
		 }
		return adminvo;
	}

	public List<AdminVo> Acompany2_list(){
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Acompany2_list");
		System.out.println(adminvo.size());
		for (int i = 0; i < adminvo.size(); i++) {
			System.out.println(adminvo.get(i));
		}
		return adminvo;
	}
	
	public List<AdminVo> AresSitu_list(){
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.AresSitu_list");
		System.out.println(adminvo.size());
		for (int i = 0; i < adminvo.size(); i++) {
			System.out.println(adminvo.get(i));
		}
		return adminvo;
	}
	
	public List<AdminVo> AresSitu_info(int numIdx){
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.AresSitu_info", numIdx);
		System.out.println(adminvo.size());
		for (int i = 0; i < adminvo.size(); i++) {
			System.out.println(adminvo.get(i));
		}
		return adminvo;
	}
	
	public List<AdminVo> Anotice_list(){
		List<AdminVo> adminvo = sqlSession.selectList("Anotice_list");
		System.out.println(adminvo.size());
		for (int i = 0; i < adminvo.size(); i++) {
			System.out.println(adminvo.get(i));
		}
		return adminvo;
	}
	
	public List<AdminVo> Anotice_list_info(int numIdx){
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Anotice_list_info", numIdx);
		System.out.println(adminvo.size());
		for (int i = 0; i < adminvo.size(); i++) {
			System.out.println(adminvo.get(i));
		}
		return adminvo;
	}
	public List<AdminVo> Anotice_list_modify(int numIdx){
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Anotice_list_modify", numIdx);
		System.out.println(adminvo.size());
		for (int i = 0; i < adminvo.size(); i++) {
			System.out.println(adminvo.get(i));
		}
		return adminvo;
	}
}
