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
	
	String user_email = request.getParameter("user_email");
	String point = request.getParameter("point");
	String food_name = request.getParameter("food_name");
	String shop_id = request.getParameter("shop_id");
	String food_count = request.getParameter("food_count");
	String table_num = request.getParameter("table_num");
	String is_pay = request.getParameter("is_pay");
	String pay_point = request.getParameter("pay_point");
	String reserve_idx = request.getParameter("reserve_idx");
	
	try{
		if(point != null){
			QueryBean.updatePoint(user_email, point);
		}else if(is_pay != null){
			QueryBean.insertReserveOrder(user_email, food_name, shop_id, food_count, table_num, is_pay);
		}else if(pay_point != null){
			QueryBean.insertPayment(user_email, shop_id, pay_point, table_num, reserve_idx, food_name, food_count);
		}else{
			resArr = QueryBean.getReserveOrder(shop_id, user_email);
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
		out.println("{");
			out.println("\"food_name\": \"" +(String)resArr.get(0)+"\",");
			out.println("\"food_count\": \"" +(String)resArr.get(1)+"\",");
			out.println("\"is_pay\": \"" +(String)resArr.get(2)+"\"");

			out.println("}");
			
			for(int i = 3; i < resArr.size(); i+=3) {
				out.println(",");
				out.println("{");
				out.println("	\"food_name\": \"" +(String)resArr.get(i)+"\",");
				out.println("	\"food_count\": \"" +(String)resArr.get(i+1)+"\",");
				out.println("	\"is_pay\": \"" +(String)resArr.get(i+2)+"\"");
				out.println("}");
			}
		out.println("]");
		out.println("}");
	}
%>