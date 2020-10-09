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
	String user_email = request.getParameter("user_email");
	String review_idx = request.getParameter("review_idx");
	String check = request.getParameter("check");
	String review_score = request.getParameter("review_score");
	String review = request.getParameter("review");
	
	try{
		if(review_idx != null){
			if(check != null){
				QueryBean.insertReviewHate(user_email, shop_id, review_idx);
			}else{
				QueryBean.insertReviewLike(user_email, shop_id, review_idx);
			}
		}
		else if(user_email != null){
			if(review != null){
				QueryBean.insertReview(shop_id, user_email, review_score, review);
			}else{
				resArr = QueryBean.getReviewLH(user_email);
			}
		}else{
			resArr = QueryBean.getReviewList(shop_id);
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
		if(user_email != null){
			out.println("\"like_idx\": \"" +(String)resArr.get(0)+"\",");
			out.println("\"hate_idx\": \"" +(String)resArr.get(1)+"\"");

			out.println("}");
			
			for(int i = 2; i < resArr.size(); i+=2) {
				out.println(",");
				out.println("{");
				out.println("	\"like_idx\": \"" +(String)resArr.get(i)+"\",");
				out.println("	\"hate_idx\": \"" +(String)resArr.get(i+1)+"\"");
				out.println("}");
			}
		}
		else{
			out.println("\"user_email\": \"" +(String)resArr.get(0)+"\",");
			out.println("\"review\": \"" +(String)resArr.get(1)+"\",");
			out.println("\"review_date\": \"" +(String)resArr.get(2)+"\",");
			out.println("\"score\": \"" +(String)resArr.get(3)+"\",");
			out.println("\"like_review\": \"" +(String)resArr.get(4)+"\",");
			out.println("\"hate_review\": \"" +(String)resArr.get(5)+"\",");
			out.println("\"review_idx\": \"" +(String)resArr.get(6)+"\"");

			out.println("}");
			
			for(int i = 7; i < resArr.size(); i+=7) {
				out.println(",");
				out.println("{");
				out.println("	\"user_email\": \"" +(String)resArr.get(i)+"\",");
				out.println("	\"review\": \"" +(String)resArr.get(i+1)+"\",");
				out.println("	\"review_date\": \"" +(String)resArr.get(i+2)+"\",");
				out.println("	\"score\": \"" +(String)resArr.get(i+3)+"\",");
				out.println("	\"like_review\": \"" +(String)resArr.get(i+4)+"\",");
				out.println("	\"hate_review\": \"" +(String)resArr.get(i+5)+"\",");
				out.println("	\"review_idx\": \"" +(String)resArr.get(i+6)+"\"");
				out.println("}");
			}
		}
		out.println("]");
		out.println("}");
	}
	
%>