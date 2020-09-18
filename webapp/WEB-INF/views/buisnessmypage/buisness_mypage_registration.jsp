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
		
		 $("#contents_box").load("buisnessmypage/registration2");
		 
	 }
 	 else if($("#rev>.selected")[0] == $("#rev_past")[0]) {
		 $("#contents_box").load("mypage/reservation3");
		
	 }
 }
});
</script>

</body>
</html>