<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 마이 페이지</title>

<link rel="stylesheet" href="<c:url value="${path}/res/css/buisnessmypage.css"/>"/>
<link rel="stylesheet" href="<c:url value="${path}/res/css/jquery-ui.css"/>"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%@include file="../top_bar.jsp" %>
<!-- 마이페이지 -->

<div id="timeline">
	<div id="user_timeline">
		<div id="mypage_banner">
			<div id="user_box">
				<div id="user_img">
					<img src="<c:url value="${path}/serverImg/profile/user/${user.user_photo }"/>"/>
				</div>
				<div id="user_info_box">
					<div id="user_info">
						<div id="user_name">
							<span>${user.user_name }</span>
						</div>
						<div class="point">POINT</div>
					</div>
					<div id="situation">
						<a href="">예약 ${shopreserve}</a>
						<a href="">리뷰 ${shopreview}</a>
						<a href="">찜한 매장 ${shopdibsidx}</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="content_wrap">
	<div id="content" class="mypage">
		<ul id="my_tab">
			<li id="my_reserv" class="my_item active">내 가게</li>			
			<li id="my_review" class="my_item">예약 현황</li>
			<li id="my_setting" class="my_item">설정</li>
		</ul>
		<div id="mypage_import">
			
		</div>
	</div>

</div>    
<%@include file="../footer.jsp" %>
<script>
	  $(function() {
		  
		  mypage_change();

         $("#my_tab>.my_item").mouseenter(function(){
        	$(this).css("cursor","pointer");
         });
         
         $("#my_tab>.my_item").on("click", function(){
        	$(this).addClass("selected").siblings().removeClass("selected");
        	
        	mypage_change();
         });
         
         function mypage_change() {
        	 if($("#my_tab>.selected")[0] == $("#my_reserv")[0]) {
        		 $("#mypage_import").load("buisnessmypage/registration");
        	 }
        	 else if($("#my_tab>.selected")[0] == $("#my_review")[0]) {
        		
        		 $("#mypage_import").load("buisnessmypage/reservation");
        	 }
        	 else if($("#my_tab>.selected")[0] == $("#my_setting")[0]) {
        		 $("#mypage_import").load("buisnessmypage/setting");
        	 } else {
        		 $("#mypage_import").load("buisnessmypage/registration");
        	 }
         }
     });
	  
    </script>
</body>
</html>