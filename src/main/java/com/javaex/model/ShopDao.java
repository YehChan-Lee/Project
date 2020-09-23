package com.javaex.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopDao {
	@Autowired
	private SqlSession sqlsession;
	
	public ShopDao() {}
	
	public ShopDao(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	public List<ShopVo> shopList(){
		return sqlsession.selectList("ShopVo.shopList");
	}
	// 가게 리스트 출력
	public List<ShopVo> pageList(Criteria cri){
		System.out.println("shopList page");
		return sqlsession.selectList("ShopVo.pageList", cri);
	}
	// shop 총 개수
	public int pageCount() {
		return sqlsession.selectOne("ShopVo.pageCount");
	}
	public List<ShopVo> shopSearch(String location, String[] shop_addrArr, String[] food_typeArr, String string_search, String solt){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("location", location);
		map.put("shop_addrArr", shop_addrArr);
		map.put("food_typeArr", food_typeArr);
		map.put("string_search", string_search);
		map.put("solt", solt);
		return sqlsession.selectList("ShopVo.shopSearch", map);
	}
	
	public ShopVo shopOwnerList(String user_email){
		return sqlsession.selectOne("ShopVo.shopOwnerList", user_email);
	}
	
	public ShopVo shopOne(int shop_idx){
		return sqlsession.selectOne("ShopVo.shopOne", shop_idx);
	}
	
	public ShopVo cntShopReserve(){
		return sqlsession.selectOne("ShopVo.cntShopReserve");
	}
	
	public void insertShop() {
		sqlsession.insert("ShopVo.shopInsert");
	}
	
	public void updateShop(ShopVo shopVo) {
		sqlsession.update("ShopVo.shopUpdate", shopVo);
	}
	
	
	public void deleteShop() {
		sqlsession.delete("Shop.shopDelete");
	}
}
