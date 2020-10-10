package com.javaex.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PosDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public PosDao() {
	}
	public PosDao(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	public List<MenuVo> getMenu(String Shop_id) {
		return sqlsession.selectList("MenuVo.MenuOne",Shop_id);
	}
	public List<HashMap<String, String>> getReserveList(String ShopId){
		List<HashMap<String, String>> list = sqlsession.selectList("All.pos_reserveList",ShopId);
		return list;
	}
	public List<ReserveOrderVo> getTableInfo(String shopId, int i) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("tableNum", i);
		return sqlsession.selectList("ReserveOrder.getTableInfo",map);
	}
	public List<HashMap<String,Object>> getPayment(){
		return sqlsession.selectList("All.getPayment");
	}
}
