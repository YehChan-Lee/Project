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
	
	String email = request.getParameter("email") == null ? "" : request.getParameter("email").trim();
	String pw = request.getParameter("pw") == null ? "" : request.getParameter("pw").trim();
	
	try{
		resArr = QueryBean.getUserInfo(email, pw);
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
		out.println("\"userEmail\": \"" +(String)resArr.get(0)+"\",");
		out.println("\"userPw\": \"" +(String)resArr.get(1)+"\",");
		out.println("\"userName\": \"" +(String)resArr.get(2)+"\",");
		out.println("\"userGender\": \"" +(String)resArr.get(3)+"\",");
		out.println("\"userBirth\": \"" +(String)resArr.get(4)+"\",");
		out.println("\"userPhone\": \"" +(String)resArr.get(5)+"\",");
		out.println("\"isOwner\": \"" +(String)resArr.get(6)+"\",");
		out.println("\"point\": \"" +(String)resArr.get(7)+"\",");
		out.println("\"userPhoto\": \"" +(String)resArr.get(8)+"\",");
		out.println("\"userIdx\": \"" +(String)resArr.get(9)+"\"");

		out.println("}");
		
		/*for(int i = 5; i < resArr.size(); i+=5) {
			out.println(",");
			out.println("{");
			out.println("\"userEmail : \": \"" +(String)resArr.get(i)+"\",");
			out.println("\"userName : \": \"" +(String)resArr.get(i+1)+"\"");
 			out.println("\"13 : \": \"" +(String)resArr.get(i+2)+"\",");
			out.println("\"14 : \": \"" +(String)resArr.get(i+3)+"\",");
			out.println("\"15 : \": \"" +(String)resArr.get(i+4)+"\",");
			out.println("\"16 : \": \"" +(String)resArr.get(i+5)+"\",");
			out.println("\"17 : \": \"" +(String)resArr.get(i+6)+"\",");
			out.println("\"18 : \": \"" +(String)resArr.get(i+7)+"\",");
			out.println("\"19 : \": \"" +(String)resArr.get(i+8)+"\"");  
			out.println("}");
		}*/
		out.println("]");
		out.println("}");
	}
	
%>
			
			