package com.javaex.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDao {
	@Autowired
	private SqlSession sqlSession;
	
	public MenuDao() {}

	public MenuDao(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	 public void insert_menu(MenuVO vo) {
	      sqlSession.insert("Menu.menuinsert", vo);
	   }
	 
	 public List<MenuVO> MenuOne(String shop_id) {
		 return sqlSession.selectList("Menu.MenuOne", shop_id);
	 }
	 
	 public void DeleteMenu(HashMap<String, Object> map) {
		 sqlSession.delete("Menu.MenuDelete", map);
	 }
	
}
