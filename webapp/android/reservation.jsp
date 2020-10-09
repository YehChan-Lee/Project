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
	String idx="0";
	
	String email = request.getParameter("email") == null ? "" : request.getParameter("email").trim();
	String USER_EMAIL = request.getParameter("USER_EMAIL");
	try{
		if(USER_EMAIL != null){
			String SHOP_TITLE = request.getParameter("SHOP_TITLE");
			String RES_DATE = request.getParameter("RES_DATE");
			String RES_TIME = request.getParameter("RES_TIME");
			String RES_CUSTOMER = request.getParameter("RES_CUSTOMER");
			String SHOP_ID = request.getParameter("SHOP_ID");
			String REV_PHONE = request.getParameter("REV_PHONE");
			String RES_NAME = request.getParameter("RES_NAME");
			String check = request.getParameter("check");
			idx = QueryBean.getReservationInsert(USER_EMAIL, SHOP_TITLE, RES_DATE, RES_TIME, RES_CUSTOMER, SHOP_ID, REV_PHONE, RES_NAME, check);
		}else{
		resArr = QueryBean.getReservationInfo(email);
		}
	} catch(SQLException e) {
		out.print(e.toString());
	} finally {
		QueryBean.closeConnection();
	}
	
	if(idx.equals("0")){
		out.println("{");
		out.println("\"datas\":[");
		
		if(resArr.size() == 0) {
			out.println("]");
			out.println("}");
		}
		else {
			out.println("{");
			out.println("\"shopTitle\": \"" +(String)resArr.get(0)+"\",");
			out.println("\"resDate\": \"" +(String)resArr.get(1)+"\",");
			out.println("\"resCustomer\": \"" +(String)resArr.get(2)+"\"");
			

			out.println("}");
			
			for(int i = 3; i < resArr.size(); i+=3) {
				out.println(",");
				out.println("{");
				out.println("\"shopTitle\": \"" +(String)resArr.get(i)+"\",");
				out.println("\"resDate\": \"" +(String)resArr.get(i+1)+"\",");
	 			out.println("\"resCustomer\": \"" +(String)resArr.get(i+2)+"\""); 
				out.println("}");
			}
			out.println("]");
			out.println("}");
		}
	}else{
		out.println(idx);
	}

	
%>
			
			