<%@page import="java.util.ArrayList"%>
<%@page import="com.javaex.model.AllVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<c:url value="${path}/res/css/mypage.css"/>"/>

</head>
<body>
	<%
   List<AllVo> newsList = (ArrayList<AllVo>)request.getAttribute("newsList");
	if(newsList.size()!=0){
		for(int i = 0; i<newsList.size(); i++){
			AllVo vo = newsList.get(i);
	%>

	<ul id="my_notice">
		<li class="my_list">
			<div id="my_info">
				<div id="my_info_message">
					<%=vo.getNewsVo().getNews_content() %>
				</div>
				<div id="my_info_time">
					<%=vo.getNewsVo().getNews_date() %>
				</div>
			</div>
		</li>
	</ul>
	<%
		}
	} else {
	%>
	<div id="message">
			소식이 없습니다.
		</div>
		<script>
		$(document).ready(function(){
			$("#message").css("text-align", "center").css("background-color", "#fff").css("padding", "150px").css("font-size","17px").css("border-radius", "5px") ;
		});
		</script>    
	<%	
	}
    %>
    <!-- <div id="mypage_pagination">
	<div id="mypage_list">
		<ul id="pagination" onselectstart="return false;">
			<li id="prevAll"> &nbsp<<&nbsp </li>
			<li id="prev">&nbsp < &nbsp </li>
			<li id="current" data-page="1">&nbsp 1 &nbsp </li>
			<li id="next">&nbsp > &nbsp</li>
			<li id="nextAll">&nbsp >> </li>
		</ul>
	</div> -->
</div>

</body>
</html>