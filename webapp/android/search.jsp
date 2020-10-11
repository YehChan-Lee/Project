<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "android.*, java.sql.*, java.util.*, java.io.*" %>
<jsp:useBean id="QueryBean" scope="page" class="android.QueryBean"></jsp:useBean>
<jsp:setProperty property="*" name="QueryBean"/>    

<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	
	request.setCharacterEncoding("UTF-8");
	
	QueryBean.getConnection();
	
	ArrayList resArr = new ArrayList();
	
	String loc = request.getParameter("loc");
	String food_type = request.getParameter("food_type");
	String shop_id = request.getParameter("shop_id");
	String search = request.getParameter("search");
	try{
		if(shop_id != null){
			resArr = QueryBean.getShopInfoList(shop_id);
		}else{
		resArr = QueryBean.getShopList(loc, food_type, search);
		}
	} catch(SQLException e) {
		out.print(e.toString());
	} finally {
		QueryBean.closeConnection();
	}
	
	out.println("{");
	out.println("\"datas\":[");
	
	if(resArr.size() == 0) {
		out.println("]");
		out.println("}");
	}
	else {
		if(shop_id != null){
			out.println("{");
			out.println("\"SHOP_TITLE\": \"" +(String)resArr.get(0)+"\",");
			out.println("\"SHOP_ADDR\": \"" +(String)resArr.get(1)+"\",");
			out.println("\"FOOD_TYPE\": \"" +(String)resArr.get(2)+"\",");
			out.println("\"SHOP_TIP\": \"" +((String)resArr.get(3)).replace("\"", "'")+"\",");
			out.println("\"BUDGET\": \"" +(String)resArr.get(4)+"\",");
			out.println("\"SHOP_RESERVE\": \"" +(String)resArr.get(5)+"\",");
			out.println("\"SHOP_COMMENT\": \"" +(String)resArr.get(6)+"\",");
			out.println("\"SHOP_VIEW\": \"" +(String)resArr.get(7)+"\",");
			out.println("\"SHOP_SCORE\": \"" +(String)resArr.get(8)+"\",");
			out.println("\"SHOP_PHONE\": \"" +(String)resArr.get(9)+"\",");
			out.println("\"SHOP_TIME\": \"" +(String)resArr.get(10)+"\",");
			out.println("\"SHOP_ADDINFO\": \"" +(String)resArr.get(11)+"\",");
			out.println("\"SHOP_TB\": \"" +(String)resArr.get(12)+"\",");
			out.println("\"SHOP_ALCOHOL\": \"" +(String)resArr.get(13)+"\",");
			out.println("\"SHOP_CAR\": \"" +(String)resArr.get(14)+"\",");
			out.println("\"SHOP_CLOSE\": \"" +(String)resArr.get(15)+"\",");
			out.println("\"SHOP_REVIEW\": \"" +(String)resArr.get(16)+"\",");
			out.println("\"HASH_TAG\": \"" +(String)resArr.get(17)+"\",");
			out.println("\"SHOP_PHOTO\": \"" +(String)resArr.get(18)+"\",");
			out.println("\"SHOP_SUBPHOTO\": \"" +(String)resArr.get(19)+"\",");
			out.println("\"SHOP_ID\": \"" +(String)resArr.get(20)+"\"");
			out.println("}");
		}else{
		out.println("{");
		out.println("\"Shop_Title\": \"" +(String)resArr.get(0)+"\",");
		out.println("\"Shop_Location\": \"" +(String)resArr.get(1)+"\",");
		out.println("\"Food_Type\": \"" +(String)resArr.get(2)+"\",");
		out.println("\"Shop_Score\": \"" +(String)resArr.get(3)+"\",");
		out.println("\"Shop_Tip\": \"" +((String)resArr.get(4)).replace("\"", "'")+"\",");
		out.println("\"Shop_Id\": \"" +(String)resArr.get(5)+"\",");
		out.println("\"shop_photo\": \"" +(String)resArr.get(6)+"\"");
		out.println("}");
		
			for(int i = 7; i < resArr.size(); i+=7) {
				out.println(",");
				out.println("{");
				out.println("	\"Shop_Title\": \"" +(String)resArr.get(i)+"\",");
				out.println("	\"Shop_Location\": \"" +(String)resArr.get(i+1)+"\",");
				out.println("	\"Food_Type\": \"" +(String)resArr.get(i+2)+"\",");
				out.println("	\"Shop_Score\": \"" +(String)resArr.get(i+3)+"\",");
				out.println("	\"Shop_Tip\": \"" +((String)resArr.get(i+4)).replace("\"", "'")+"\",");
				out.println("	\"Shop_Id\": \"" +(String)resArr.get(i+5)+"\",");
				out.println("	\"shop_photo\": \"" +(String)resArr.get(i+6)+"\"");
				out.println("}");
			}
		}
		out.println("]");
		out.println("}");
	
	}
	
%>