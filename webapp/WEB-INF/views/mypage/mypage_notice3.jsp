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
<link rel="stylesheet" href="<c:url value="${path}/res/css/mypage.css?ver=1"/>"/>
</head>
<body>
	<%
	   List<AllVo> bpList = (ArrayList<AllVo>)request.getAttribute("bpList");
		if(bpList.size()!=0){
			for(int i = 0; i<bpList.size(); i++){
				AllVo vo = bpList.get(i);
	%>

	<ul id="bobpool_notice">
		<li class="bobpool_list">
			<div id="bobpool_info">
				<div id="bobpool_message">
				<%=vo.getNewsVo().getNews_content() %>
				</div>
				<div id="bobpool_time">
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
		$("#my_notice>#my_list").css("text-align", "center").css("background-color", "#fff").css("padding", "150px").css("font-size","17px").css("border-radius", "5px") ;
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
		</div>
	</div> -->

</body>
</html>