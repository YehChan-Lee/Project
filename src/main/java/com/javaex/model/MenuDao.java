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
	
	 public void insert_menu(MenuVo vo) {
	      sqlSession.insert("MenuVo.menuinsert", vo);
	   }
	 
	 public List<MenuVo> MenuOne(String shop_id) {
		 return sqlSession.selectList("MenuVo.MenuOne", shop_id);
	 }
	 
	 public void DeleteMenu(HashMap<String, Object> map) {
		 sqlSession.delete("MenuVo.MenuDelete", map);
	 }
	
}
