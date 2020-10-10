<%@page import="com.javaex.model.ShopVo"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="${path}/res/css/detail_info.css"/>">
</head>
<body>
<%
ShopVo shopvo = (ShopVo)request.getAttribute("shopOne");
%>
<div class="detail_wrap">
	<div class="tip_box">
		<div class="section_single">
			<div class="tip_title">Tip</div>
			<div class="tip_content">
				<%=shopvo.getShop_tip() %>
			</div>
		</div>
		<hr />
		<div class="detail_section">
			<div class="section_title">음식 종류</div>
			<div class="section_body"><%=shopvo.getFood_type()%></div>
		</div>
		<div class="detail_section">
			<div class="section_title">예산</div>
			<div class="section_body"><%=shopvo.getBudget() %></div>
		</div>
		<hr />
		<div class="detail_section">
			<div class="section_title">테이블 종류</div>
			<div class="section_body"><%=shopvo.getShop_tb() %></div>			
		</div>
		<div class="detail_section">
			<div class="section_title">판매 주류</div>
			<div class="section_body"><%=shopvo.getShop_alcohol() %></div>
		</div>
		<hr />
		<div class="detail_section">
			<div class="section_title">부가정보</div>
			<div class="section_body"><%=shopvo.getShop_addinfo() %></div>
		</div>		
	</div>
</div>

</body>
</html>