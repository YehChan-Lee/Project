<%@page import="com.javaex.model.ShopVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="${path}/res/css/buisness_mypage_registration2.css?ver=1"/>" />
</head>
<body>
    <%
		ShopVo shoplist = (ShopVo)request.getAttribute("shopOwnerList");
	%>
	

	<form action="buisness_update" method="post" class="registration_form">
		<span class="shop_name_span">가게 이름</span> 
		<input type="text" class="shop_title" name="shop_title" value="<%=shoplist.getShop_title()%>">
		<span class="shop_addr_span">가게 주소</span>
		<input type="text" class=shop_addr name="shop_addr">
		<input type="text" class=shop_addr2 name="shop_addr">
		<span class="shop_location_span">가게 지역</span>
		<select class="shop_location" name="shop_location">
			<option class="buisness_option" value="서울/수도권">서울/수도권
			<option value="부산">부산
			<option value="제주">제주
			<option value="대구">대구
			<option value="대전/세종">대전/세종
			<option value="광주">광주
			<option value="전주">전주
			<option value="울산">울산
		</select>
		<span class="shop_id_span">사업자 번호</span>
		<input type="text" class="shop_id" name="shop_id" value="<%=shoplist.getShop_id()%>">
		<span class="food_type_span">음식 종류</span>
		<input type="text" class="food_type" name="food_type" value="<%=shoplist.getFood_type()%>">
		<span class="budget_span">예산</span>
		<input type="text" class="budget" name="budget" value="<%=shoplist.getBudget()%>">
		<span class="shop_tip_span">가게 설명</span>
		<textarea class="shop_tip" style="resize: none" name="shop_tip" value="<%=shoplist.getShop_tip()%>"></textarea>
		<span class="shop_comment_span">한줄 설명</span>
		<input type="text" class="shop_comment" name="shop_comment" value="<%=shoplist.getShop_comment()%>">
		<span class="shop_phone_span">가게 전화번호</span>
		<input type="text" class="shop_phone" name="shop_phone" value="<%=shoplist.getShop_phone()%>">
		<span class="shop_time_span">가게 운영시간</span>
		<select class="shop_time1" name="shop_time">
			<option value="0">0
			<option value="1">1
			<option value="2">2
			<option value="3">3
			<option value="4">4
			<option value="5">5
			<option value="6">6
			<option value="7">7
			<option value="8">8
			<option value="9">9
			<option value="10">10
			<option value="11">11
			<option value="12">12
			<option value="13">13
			<option value="14">14
			<option value="15">15
			<option value="16">16
			<option value="17">17
			<option value="18">18
			<option value="19">19
			<option value="20">20
			<option value="21">21
			<option value="22">22
			<option value="23">23
		</select>
		<span class="shop_time_span2">시</span>
		<select class="shop_time2" name="shop_time">
			<option value="00">00
			<option value="10">10
			<option value="20">20
			<option value="30">30
			<option value="40">40
			<option value="50">50
		</select>
		<span class="shop_time_span3">분</span>
		<span class="shop_time_span4"> ~ </span>
		<select class="shop_time3" name="shop_time">
			<option value="0">0
			<option value="1">1
			<option value="2">2
			<option value="3">3
			<option value="4">4
			<option value="5">5
			<option value="6">6
			<option value="7">7
			<option value="8">8
			<option value="9">9
			<option value="10">10
			<option value="11">11
			<option value="12">12
			<option value="13">13
			<option value="14">14
			<option value="15">15
			<option value="16">16
			<option value="17">17
			<option value="18">18
			<option value="19">19
			<option value="20">20
			<option value="21">21
			<option value="22">22
			<option value="23">23
		</select>
		<span class="shop_time_span5">시</span>
		<select class="shop_time4" name="shop_time">
			<option value="00">00
			<option value="10">10
			<option value="20">20
			<option value="30">30
			<option value="40">40
			<option value="50">50
		</select>
		<span class="shop_time_span6">분</span>
		
		<span class="shop_addinfo_span">가게 부가정보</span>
		<input type="text" class="shop_addinfo" name="shop_addinfo" value="<%=shoplist.getShop_addinfo()%>">
		<span class="shop_tb_span">가게 테이블 종류</span>
		<select class="shop_tb" name="shop_tb" value="<%=shoplist.getShop_tb()%>">
			<option class="buisness_option" value="바 테이블">바 테이블
			<option value="홀 테이블">홀 테이블
			<option value="좌식 테이블">좌식 테이블
		</select>
		<span class="shop_alcohol_span">가게 주류</span>
		<input type="text" class="shop_alcohol" name="shop_alcohol" value="<%=shoplist.getShop_alcohol()%>">
		<span class="shop_car_span">주차기능</span>
		<input type="text" class="shop_car" name="shop_car" value="<%=shoplist.getShop_car()%>">
		<span class="shop_close_span">휴무일</span>
		<input type="text" class="shop_close" name="shop_close" value="<%=shoplist.getShop_close()%>">
		
		<span class="shop_photo_span">가게 이미지</span>
		<input type="file" class="shop_photo" id="image" name="shop_photo"  value="shop_photo"  accept="image/gif,image/jpeg,image/png" onchange="setThumbnail(event)" multiple="multiple"/>
		
		<div id="image_container"></div>

		<!-- <input type="submit" class="buisness_submit" value="수정"> -->
		<a href="javascript:%20modify()" class="buisness_submit" >수정</a>
	</form>

<script> function setThumbnail(event) { 
	for (var image of event.target.files) { 
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			img.width ="100";
			img.height ="100";
			
			document.querySelector("div#image_container").appendChild(img); 
		}; 
			console.log(image); 
			reader.readAsDataURL(image); 
	}
	
} 

function modify() {
	$(".registration_form").submit();
	
}
	</script>



</body>
</html>