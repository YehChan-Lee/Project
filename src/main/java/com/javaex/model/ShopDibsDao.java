package com.javaex.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopDibsDao {
	
	@Autowired
	SqlSession sqlsession;
	
	public ShopDibsDao(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	public List<ShopDibsVo> getDibList(String user_email){
		List<ShopDibsVo> list = sqlsession.selectList("Dibs.getDibList",user_email);
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
		return sqlsession.selectList("Dibs.getDibList",user_email);
	}

	public void addDib(String email, String shopId,int shopIdx) {
		HashMap<String ,Object> map = new HashMap<String, Object>();
		map.put("email",email);
		map.put("shopId",shopId);
		map.put("shopIdx",shopIdx);
		System.out.println("map : "+map);
		HashMap<String,Object> result = new HashMap<String, Object>();
		result = sqlsession.selectOne("Dibs.getDibCnt");
		int cnt = Integer.parseInt(String.valueOf(result.get("CNT")));
		map.put("cnt",cnt+1);
		sqlsession.insert("Dibs.addDib",map);		
	}
	public void delDib(String email, String shopId) {
		HashMap<String ,Object> map = new HashMap<String, Object>();
		map.put("email",email);
		map.put("shopId",shopId);
		HashMap<String,Object> result = new HashMap<String, Object>();
		result = sqlsession.selectOne("Dibs.getDibCnt");
		int cnt = Integer.parseInt(String.valueOf(result.get("CNT")));
		map.put("cnt",cnt-1);
		sqlsession.insert("Dibs.delDib",map);		
	}

	public boolean dibCheck(String email, String shopId) {
		HashMap<String ,Object> map = new HashMap<String, Object>();
		map.put("email",email);
		map.put("shopId",shopId);
		if(sqlsession.selectOne("Dibs.dibCheck",map) != null) {
			return true;
		}else {
			return false;			
		}

	}
}
