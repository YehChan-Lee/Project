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

<div id="reservation" class="body empty">
	<div id="reserve_filter">
		<ul id="rev_notice">
			<li id="bob_notice_list">밥풀 소식</li>
			<li id="my_notice_list" class="selected">내 소식  &nbsp | &nbsp </li>
		</ul>
	</div>
	<div id="cont_box">
		
	</div>
</div>
<script src="http://code.jquery.com/jquery.js"></script>
<script>

$(document).ready(function(){
	mypage_change();
	
$("#rev_notice>li").on("click", function(){
	$(this).addClass("selected").siblings().removeClass("selected");
	
	mypage_change();
 });
 
 function mypage_change() {
	 if($("#rev_notice>.selected")[0] == $("#my_notice_list")[0]) {
		 $("#cont_box").load("mypage/notice2");
	 }
 	 else if($("#rev_notice>.selected")[0] == $("#bob_notice_list")[0]) {
		 $("#cont_box").load("mypage/notice3");
	 }
 }
});
	
</script>
</body>
</html>