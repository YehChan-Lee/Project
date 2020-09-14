package com.javaex.model;

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
		return sqlsession.selectList("Shop.shopList");
	}
	
	public ShopVo shopOne(int shop_idx){
		return sqlsession.selectOne("Shop.shopOne", shop_idx);
	}
	
	public ShopVo cntShopReserve(){
		return sqlsession.selectOne("Shop.cntShopReserve");
	}
	
	public ShopVo selectShopByUser(String user_email) {
		return sqlsession.selectOne("Shop.selectShopByUser", user_email);
	}
	
	public void insertShop() {
		sqlsession.insert("Shop.shopInsert");
	}
	
	public void updateShop() {
		sqlsession.update("Shop.shopUpdate");
	}
	
	public void deleteShop() {
		sqlsession.delete("Shop.shopDelete");
	}
	
//	public ShopVo shopTopDetail(String shop_id){
//		ShopVo shopvo = null;
//		for(int i = 0; i<sqlsession.selectList("Shop.shopTopDetail").size(); i++) {
//			if(sqlsession.selectList("Shop.shopTopDetail").get(i).)
//		}
//		return 
//	}
	
//	List<ShopVo> list = new ArrayList<ShopVo>();
//	{
//		for(int i=1;i<=12;i++) {
//			ShopVo shop = new ShopVo("가게이름"+i, "가게위치"+i, i*10, 10+i, 100*i, i, Math.round(Math.random()*50)/10, true, "5만원 미만(2인 기준)", "대충 맛이 있을거라는 내용"+i);
//			list.add(shop);
//		}		
//	}
//	
//	public ArrayList<ShopVo> shopList(){
//		return list;
//	}
//	public ShopVo shopOne(int shopId) {
//		ShopVo vo = null;
//		
//		for(int i=0;i<list.size();i++) {
//			if(list.get(i).getShopIdx() == shopId) {
//				vo = list.get(i);
//			}
//		}				
//		return vo;
//	}
}
