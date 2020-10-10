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
	
	String resArr = "1";
	
	String user_email = request.getParameter("user_email");
	String user_pw = request.getParameter("user_pw");
	String user_name = request.getParameter("user_name");
	String user_gender = request.getParameter("user_gender");
	String user_birth = request.getParameter("user_birth");
	String user_phone = request.getParameter("user_phone");
	
		resArr = QueryBean.insertJoin(user_email, user_pw, user_name, user_gender, user_birth, user_phone);
		QueryBean.closeConnection();
	
	if(resArr.equals("0")){
		out.println("-1");
	}else{
		out.println("1");
	}
	
	
%>
			
			