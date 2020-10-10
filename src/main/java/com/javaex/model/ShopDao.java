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
	public List<ShopVo> getTop5(){
		return sqlsession.selectList("ShopVo.getTop5");
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
		return sqlsession.selectList("ShopVo.shopSearch", map);
	}
	
	public ShopVo shopOwnerList(String user_email){
		return sqlsession.selectOne("ShopVo.shopOwnerList", user_email);
	}
	
	public ShopVo shopOne(int shop_idx){
		return sqlsession.selectOne("ShopVo.shopOne", shop_idx);
	}
	
	public ShopVo getAll_shopIdx(String shop_idx){
		return sqlsession.selectOne("ShopVo.getAll_shopIdx", shop_idx);
	}
	
	public String getShopId(String user_email){
		return sqlsession.selectOne("ShopVo.getShopId", user_email);
	}
	
	public String getShopPhoto(int shop_idx) {
		return sqlsession.selectOne("ShopVo.getShopPhoto", shop_idx);
	}
	
	public String getShopSubPhoto(String shop_idx) {
		return sqlsession.selectOne("ShopVo.getShopSubPhoto", shop_idx);
	}
	
	public ShopVo cntShopReserve(){
		return sqlsession.selectOne("ShopVo.cntShopReserve");
	}
	
	public void insertShop(ShopVo vo) {
		sqlsession.insert("ShopVo.shopInsert",vo);
	}
	
	public void updateShop(ShopVo shopVo) {
		sqlsession.update("ShopVo.shopUpdate", shopVo);
	}
	
	
	public void deleteShop() {
		sqlsession.delete("ShopVo.shopDelete");
	}
	
	public String getShopReview(String user_email) {
		return sqlsession.selectOne("ShopVo.getShopReview", user_email);
	}
	
	public String getShopReserve(String user_email) {
		return sqlsession.selectOne("ShopVo.getShopReserve", user_email);
	}
	
	public void viewUp(String shopId) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		int cnt = 0;
		
		map.put("shopId",shopId);
		System.out.println("viewUp : "+sqlsession.selectOne("ShopVo.viewCnt",map));
		HashMap<String,Object> result = sqlsession.selectOne("ShopVo.viewCnt",map);
		cnt = Integer.parseInt(String.valueOf(result.get("CNT")));
		map.put("cnt",cnt+1);
		sqlsession.update("ShopVo.viewUp",map);
	}

	public List<MenuVo> getMenu(String shopId) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("shopId",shopId);
		return sqlsession.selectList("MenuVo.getMenu",map);
	}

	public void reviewCntReload(String shopId,int reviewCnt) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("shopId",shopId);
		map.put("reviewCnt",reviewCnt);
		sqlsession.update("Review.cntReload",map);
		
	}
	//예약 등록시 가게 예약카운트 증가	
	public void reserveCntUp(int cnt,String shop_id) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("cnt",cnt);
		map.put("shopId",shop_id);
		sqlsession.update("ShopVo.reserveCntUp",map);		
	}

	public int getReservCnt(String shop_id) {
		int cnt = 0;
		HashMap<String,Object> map = sqlsession.selectOne("ShopVo.getReservCnt",shop_id);
		cnt = Integer.parseInt(String.valueOf(map.get("CNT")));
		return cnt;
	}

	public void scoreCalc(String shopId) {
		HashMap<String, Object> map = sqlsession.selectOne("ShopVo.getScoreAvg",shopId);
		map.put("shopId",shopId);
		System.out.println(map);
		sqlsession.update("ShopVo.scoreCalc",map);
	}

}
