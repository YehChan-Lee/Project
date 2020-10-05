<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 마이 페이지</title>

<link rel="stylesheet" href="<c:url value="${path}/res/css/buisnessmypage.css?ver=1"/>"/>

</head>
<body>
<%@include file="../top_bar.jsp" %>
<!-- 마이페이지 -->

 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.4.0/"/></script>
<link rel="stylesheet" href="<c:url value="${path}/res/css/jquery-ui.css"/>"/>
<script src="<c:url value='${path}/res/js/jquery-ui.js'/>" type="text/javascript"></script>

<div id="timeline">
	<div id="user_timeline">
		<div id="mypage_banner">
			<div id="user_box">
				<div id="user_img">
					<img src="<c:url value="${path}/res/image/chinese.jpg"/>"/>
				</div>
				<div id="user_info_box">
					<div id="user_info">
						<div id="user_name">
							<span>USER NAME</span>
						</div>
						<div class="point">POINT</div>
					</div>
					<div id="situation">
						<a href="">예약 0</a>
						<a href="">리뷰 0</a>
						<a href="">찜한 매장 0</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="content_wrap">
	<div id="content" class="mypage">
		<ul id="my_tab">
			<li id="my_reserv" class="my_item selected">내 가게</li>			
			<li id="my_review" class="my_item">예약 현황</li>
			<li id="my_setting" class="my_item">설정</li>
		</ul>
		<div id="mypage_import">
			
		</div>
	</div>

</div>

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
        	 }
         }
     });
	  
    </script>
    
<%@include file="../footer.jsp" %>

</body>
</html>