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
	
	String shop_id = request.getParameter("shop_id");
	
	try{
		resArr = QueryBean.getMenuList(shop_id);
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
		out.println("\"FOOD_NAME\": \"" +(String)resArr.get(0)+"\",");
		out.println("\"FOOD_PRICE\": \"" +(String)resArr.get(1)+"\",");
		out.println("\"FOOD_INFO\": \"" +(String)resArr.get(2)+"\"");

		out.println("}");
		
		for(int i = 3; i < resArr.size(); i+=3) {
			out.println(",");
			out.println("{");
			out.println("	\"FOOD_NAME\": \"" +(String)resArr.get(i)+"\",");
			out.println("	\"FOOD_PRICE\": \"" +(String)resArr.get(i+1)+"\",");
			out.println("	\"FOOD_INFO\": \"" +(String)resArr.get(i+2)+"\"");
			out.println("}");
		}
		out.println("]");
		out.println("}");
	}
	
%>