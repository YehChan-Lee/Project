<%@page import="java.util.ArrayList"%>
<%@page import="com.javaex.model.AllVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="reservation" class="body empty">
	<div id="reserve_filter">
			<ul id="rev">
				<li id="rev_past">지나간 예약</li>
				<li id="rev_cur" class="selected">방문 예정 예약 &nbsp | &nbsp </li>
			</ul>
	</div>
	<div id="contents_box">
   </div>
   </div>

<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(document).ready(function(){
	mypage_change();
	
$("#rev>li").on("click", function(){
	$(this).addClass("selected").siblings().removeClass("selected");
	
	mypage_change();
 });
 
 function mypage_change() {
	 if($("#rev>.selected")[0] == $("#rev_cur")[0]) {
		 $("#contents_box").load("mypage/reservation2");
	 }
 	 else if($("#rev>.selected")[0] == $("#rev_past")[0]) {
		 $("#contents_box").load("mypage/reservation3");
	 }
 }
});
</script>

</body>
</html>