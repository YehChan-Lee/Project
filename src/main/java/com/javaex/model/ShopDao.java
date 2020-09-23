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
		return sqlsession.selectList("Shop.shopList");
	}
	
	public List<ShopVo> shopSearch(String location, String[] shop_addrArr, String[] food_typeArr,
			String string_search, String solt, String price_list, String[] add_infoArr,
			String[] table_typeArr, String[] alcohol_typeArr, String parking_available){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("location", location);
		map.put("shop_addrArr", shop_addrArr);
		map.put("food_typeArr", food_typeArr);
		if(string_search != null){
			if(string_search.indexOf('#') == -1){
			map.put("string_search", string_search);
			} else{
			map.put("hash_tag", string_search);
			}
		}
		map.put("solt", solt);
		map.put("price_list", price_list);
		if(add_infoArr != null){
			for(int i = 0;i<add_infoArr.length;i++){
				if(add_infoArr[i].equals("201")){
					add_infoArr[i] = "늦은 저녁에도 영업을 하는";
				} else if(add_infoArr[i].equals("202")){
					add_infoArr[i] = "단체석이 있는";
				}else if(add_infoArr[i].equals("203")){
					add_infoArr[i] = "데이트 하기 좋은";
				}else if(add_infoArr[i].equals("204")){
					add_infoArr[i] = "비즈니스 미팅에 어울리는";
				}else if(add_infoArr[i].equals("205")){
					add_infoArr[i] = "룸이 준비되어 있는";
				}else if(add_infoArr[i].equals("206")){
					add_infoArr[i] = "런치 메뉴가 있는";
				}else if(add_infoArr[i].equals("207")){
					add_infoArr[i] = "브런치 메뉴가 있는";
				}else if(add_infoArr[i].equals("208")){
					add_infoArr[i] = "야외 테라스 자리가 있는";
				}else if(add_infoArr[i].equals("209")){
					add_infoArr[i] = "전문 소믈리에가 있는";
				}else if(add_infoArr[i].equals("210")){
					add_infoArr[i] = "베이비 시트가 준비되어 있는";
				}else if(add_infoArr[i].equals("211")){
					add_infoArr[i] = "코르키지가 가능한";
				}else if(add_infoArr[i].equals("212")){
					add_infoArr[i] = "24시간 영업을 하는";
				}else{
					add_infoArr[i] = "ERROR";
				}
			}
		}
		map.put("add_infoArr", add_infoArr);
		if(table_typeArr != null){
			for(int i = 0;i<table_typeArr.length;i++){
				if(table_typeArr[i].equals("301")){
					table_typeArr[i] = "홀 테이블";
				}else if(table_typeArr[i].equals("302")){
					table_typeArr[i] = "바 테이블";
				}else if(table_typeArr[i].equals("303")){
					table_typeArr[i] = "룸 테이블";
				}else if(table_typeArr[i].equals("304")){
					table_typeArr[i] = "좌식 테이블";
				}else{
					table_typeArr[i] = "ERROR";
				}
			}
		}
		map.put("table_typeArr", table_typeArr);
		if(alcohol_typeArr != null){
			for(int i = 0;i<alcohol_typeArr.length;i++){
				if(alcohol_typeArr[i].equals("401")){
					alcohol_typeArr[i] = "소주";
				}else if(alcohol_typeArr[i].equals("402")){
					alcohol_typeArr[i] = "맥주";
				}else if(alcohol_typeArr[i].equals("403")){
					alcohol_typeArr[i] = "전통주";
				}else if(alcohol_typeArr[i].equals("404")){
					alcohol_typeArr[i] = "일본술";
				}else if(alcohol_typeArr[i].equals("405")){
					alcohol_typeArr[i] = "양주";
				}else if(alcohol_typeArr[i].equals("406")){
					alcohol_typeArr[i] = "와인";
				}else if(alcohol_typeArr[i].equals("407")){
					alcohol_typeArr[i] = "고량주";
				}else if(alcohol_typeArr[i].equals("408")){
					alcohol_typeArr[i] = "칵테일";
				}else{
					alcohol_typeArr[i] = "ERROR";
				}
			}
		}
		map.put("alcohol_typeArr", alcohol_typeArr);
		map.put("parking_available", parking_available);
		return sqlsession.selectList("Shop.shopSearch", map);
	}
	
	public ShopVo shopOwnerList(String user_email){
		return sqlsession.selectOne("Shop.shopOwnerList", user_email);
	}
	
	public ShopVo shopOne(int shop_idx){
		return sqlsession.selectOne("Shop.shopOne", shop_idx);
	}
	
	public ShopVo getAll_shopIdx(String shop_idx){
		return sqlsession.selectOne("Shop.getAll_shopIdx", shop_idx);
	}
	
	public String getShopId(String user_email){
		return sqlsession.selectOne("Shop.getShopId", user_email);
	}
	
	public ShopVo cntShopReserve(){
		return sqlsession.selectOne("Shop.cntShopReserve");
	}
	
	public void insertShop() {
		sqlsession.insert("Shop.shopInsert");
	}
	
	public void updateShop(ShopVo shopVo) {
		sqlsession.update("Shop.shopUpdate", shopVo);
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
