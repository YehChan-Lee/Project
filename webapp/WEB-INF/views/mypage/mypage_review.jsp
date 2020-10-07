<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<div id="reservation" class="body empty">
	<div id="reserve_filter">
		<ul id="rever">
			<!-- <li id="star_review">찜한 리뷰</li> -->
			<li id="my_review" class="selected">내가 쓴 리뷰  <!-- &nbsp | &nbsp --> </li>
		</ul>
	</div>
	<div id="contents_box">
		
	</div>
</div>
<script src="http://code.jquery.com/jquery.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"/></script> -->

<script>
$(document).ready(function () {
	mypage_change();
	
	$("#rever>li").on("click", function(){
		$(this).addClass("selected").siblings().removeClass("selected");
		mypage_change();
	 });	 
	 function mypage_change() {
		 
		 if($("#rever>.selected")[0] == $("#star_review")[0]) {
			 $("#contents_box").load("mypage/review3");
			 $.getScript("https://kit.fontawesome.com/a076d05399.js");
			 $.getScript("https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js");
		 }
		 else /* if($("#rever>.selected")[0] == $("#my_review")[0]) */ {
			 $("#contents_box").load("mypage/review2");
			 $.getScript("https://kit.fontawesome.com/a076d05399.js");
		 } 
	 }	
})
	
</script>
<script src="<c:url value='${path}/res/js/jquery.rateyo.js'/>"/></script>
</body>
</html>