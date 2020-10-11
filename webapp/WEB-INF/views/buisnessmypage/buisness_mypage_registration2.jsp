<%@page import="com.javaex.model.MenuVo"%>
<%@page import="java.util.List"%>
<%@page import="com.javaex.model.ShopVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"	href="<c:url value="${path}/res/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="${path}/res/css/buisness_mypage_registration2.css?ver=1"/>" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript" src="http://malsup.github.com/jquery.form.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		ShopVo shoplist = (ShopVo) request.getAttribute("shopOwnerList");
	%>
	<form action="buisness_update" method="post" class="registration_form" enctype="multipart/form-data">
		<span class="shop_name_span">가게 이름</span> <input type="text"
			class="shop_title" name="shop_title"
			value="<%=shoplist.getShop_title()%>"> <span
			class="shop_addr_span">가게 주소</span> <input type="text"
			class=shop_addr name="shop_addr" value="<%=shoplist.getShop_addr()%>"> <input type="text"
			class=shop_addr2 name="shop_addr"> 
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
		</select> <span class="shop_id_span">사업자 번호</span> <input type="text"
			class="shop_id" name="shop_id" value="<%=shoplist.getShop_id()%>">
		<span class="food_type_span">음식 종류</span> 
			<select class="food_type" name="food_type"
				id="food_type">
				<option value="한식">한식</option>
				<option value="양식">양식</option>
				<option value="중식">중식</option>
				<option value="일식">일식</option>
				<option value="아시아식">아시아식</option>
				<option value="뷔페">뷔페</option>
				<option value="구이">구이</option>
				<option value="술집">술집</option>
				<option value="카페/베이커리">카페/베이커리</option>
			</select> <span
			class="budget_span">예산</span> <label class="budget_label1">5만원
			미만</label><input type="radio" class="budget1" name="budget" value="5만원 미만" checked="checked">
		<label class="budget_label2">5-10만원</label><input type="radio"
			class="budget2" name="budget" value="5-10만원"> <label
			class="budget_label3">10-16만원</label><input type="radio"
			class="budget3" name="budget" value="10-16만원"> <label
			class="budget_label4">16만원 이상</label><input type="radio"
			class="budget4" name="budget" value="16만원 이상"> <span
			class="shop_tip_span">가게 설명</span>
		<textarea class="shop_tip" style="resize: none" name="shop_tip"
			><%=shoplist.getShop_tip()%></textarea>
		<span class="shop_comment_span">한줄 설명</span> <input type="text"
			class="shop_comment" name="shop_comment"
			value="<%=shoplist.getShop_comment()%>"> <span
			class="shop_phone_span">가게 전화번호</span> <input type="text"
			class="shop_phone" name="shop_phone"
			value="<%=shoplist.getShop_phone()%>"> <span
			class="shop_time_span">가게 운영시간</span> <select class="shop_time1"
			name="shop_time">
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
		</select> <span class="shop_time_span2">시</span> <select class="shop_time2"
			name="shop_time">
			<option value="00">00
			<option value="10">10
			<option value="20">20
			<option value="30">30
			<option value="40">40
			<option value="50">50
		</select> <span class="shop_time_span3">분</span> <span class="shop_time_span4">
			~ </span> <select class="shop_time3" name="shop_time">
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
		</select> <span class="shop_time_span5">시</span> <select class="shop_time4"
			name="shop_time">
			<option value="00">00
			<option value="10">10
			<option value="20">20
			<option value="30">30
			<option value="40">40
			<option value="50">50
		</select> <span class="shop_time_span6">분</span>




		<p class="shop_tb_p">가게 테이블 종류</p>
		<label class="shop_tb_label1">바 테이블</label><input type="checkbox"
			class="shop_tb1" name="shop_tb" value="바 테이블"> <label
			class="shop_tb_label2">홀 테이블</label><input type="checkbox"
			class="shop_tb2" name="shop_tb" value="홀 테이블"> <label
			class="shop_tb_label3">좌식 테이블</label><input type="checkbox"
			class="shop_tb3" name="shop_tb" value="좌식 테이블"> <label
			class="shop_tb_label4">룸 테이블</label><input type="checkbox"
			class="shop_tb4" name="shop_tb" value="룸 테이블"> <span
			class="shop_alcohol_span">가게 주류</span>
		<div class="shop_alcohol_div">
			<label class="shop_alcohol_label1">소주</label><input type="checkbox"
				class="shop_alcohol1" name="shop_alcohol" value="소주"> <label
				class="shop_alcohol_label2">맥주</label><input type="checkbox"
				class="shop_alcohol2" name="shop_alcohol" value="맥주"> <label
				class="shop_alcohol_label3">전통주</label><input type="checkbox"
				class="shop_alcohol3" name="shop_alcohol" value="전통주"> <label
				class="shop_alcohol_label4">일본술</label><input type="checkbox"
				class="shop_alcohol4" name="shop_alcohol" value="일본술"> <label
				class="shop_alcohol_label5">양주</label><input type="checkbox"
				class="shop_alcohol5" name="shop_alcohol" value="양주"> <label
				class="shop_alcohol_label6">와인</label><input type="checkbox"
				class="shop_alcohol6" name="shop_alcohol" value="와인"> <label
				class="shop_alcohol_label7">고량주</label><input type="checkbox"
				class="shop_alcohol7" name="shop_alcohol" value="고량주"> <label
				class="shop_alcohol_label8">칵테일</label><input type="checkbox"
				class="shop_alcohol8" name="shop_alcohol" value="칵테일">
		</div>
		<span class="shop_car_span">주차기능</span> <select class="shop_car"
			name="shop_car">
			<option class="car_option" value="1">주차기능 있음
			<option value="0">주차기능 없음
		</select> <span class="shop_close_span">휴무일</span> <input type="text"
			class="shop_close" name="shop_close"
			value="<%=shoplist.getShop_close()%>">

		<div class="shop_addinfo_div">
			<span class="shop_addinfo_span">가게 부가정보</span> <input type="checkbox"
				class="shop_addinfo1" name="shop_addinfo" value="늦은 저녁에도 영업을 하는"><span
				class="shop_addinfo_label1">늦은 저녁에도 영업을 하는</span> <input
				type="checkbox" class="shop_addinfo2" name="shop_addinfo"
				value="단체석이 있는"><span class="shop_addinfo_label2">단체석이
				있는</span> <input type="checkbox" class="shop_addinfo1" name="shop_addinfo"
				value="데이트 하기 좋은"><span class="shop_addinfo_label3">데이트
				하기 좋은</span> <input type="checkbox" class="shop_addinfo2"
				name="shop_addinfo" value="비지니스 미팅에 어울리는"><span
				class="shop_addinfo_label4">비지니스 미팅에 어울리는</span> <input
				type="checkbox" class="shop_addinfo1" name="shop_addinfo"
				value="룸이 준비되어 있는"><span class="shop_addinfo_label5">룸이
				준비되어 있는</span> <input type="checkbox" class="shop_addinfo2"
				name="shop_addinfo" value="런치 메뉴가 있는"><span
				class="shop_addinfo_label6">런치 메뉴가 있는</span> <input type="checkbox"
				class="shop_addinfo1" name="shop_addinfo" value="브런치 메뉴가 있는"><span
				class="shop_addinfo_label7">브런치 메뉴가 있는</span> <input type="checkbox"
				class="shop_addinfo2" name="shop_addinfo" value="야외 테라스 자리가 있는"><span
				class="shop_addinfo_label8">야외 테라스 자리가 있는</span> <input
				type="checkbox" class="shop_addinfo1" name="shop_addinfo"
				value="전문 소믈리에가 있는"><span class="shop_addinfo_label9">전문
				소믈리에가 있는</span> <input type="checkbox" class="shop_addinfo2"
				name="shop_addinfo" value="베이비 시트가 준비되어 있는"><span
				class="shop_addinfo_label10">베이비 시트가 준비되어 있는</span> <input
				type="checkbox" class="shop_addinfo1" name="shop_addinfo"
				value="코르키지가 가능한"> <span class="shop_addinfo_label11">코르키지가
				가능한</span> <input type="checkbox" class="shop_addinfo2" name="shop_addinfo"
				value="24시간 영업을 하는"><span class="shop_addinfo_label12">24시간
				영업을 하는</span>
		</div>
		
		<span class="hash_tag_span">해쉬태그</span>
		<input type="text" class="hash_tag" id="hash_tag" name="hash_tag" placeholder="#맛있는#혼밥(,를 붙이지 말고 나열해주세요)">

		<span class="shop_photo_span">가게 이미지</span> <input type="file"
			class="shop_photo" id="image" name="shop_photo" value="shop_photo"
			accept="image/gif,image/jpeg,image/png"
			/>

		
		
		<span class="shop_subphoto_span">가게 서브 이미지</span>
		<input type="file"
			class="shop_subphoto" id="image2" name="shop_subphoto"
			accept="image/gif,image/jpeg,image/png" multiple="multiple"
			/>

	

		<!-- <input type="submit" class="buisness_submit" value="수정"> -->
		<!-- <a href="javascript:%20modify()" class="buisness_submit">수정</a> -->
		<input type="submit" class="buisness_submit" value="수정">
		
	 </form> 
	<span class="shop_menu">메뉴추가</span>
	<button type="button" class="btn btn-primary" id="menu_add"
		data-toggle="modal" data-target="#myModal">메뉴 추가</button>
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">메뉴 추가</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<div class="food_name_div">음식이름</div>
					<div class="food_price_div">가격</div>
					<div class="food_info_div">음식설명</div>
					<form action="menu_insert" method="post" class="menu_insert_form"
						onsubmit="return false;">
						<input type="text" class="food_id" name="food_id"
							value="<%=shoplist.getShop_id()%>"> <input type="text"
							class="food_name" name="food_name"> <input type="text"
							class="food_price" name="food_price"> <input type="text"
							class="food_info" name="food_info"> <input type="submit"
							class="food_add_submit" value="추가">
					</form>

					<table class="table table-hover" id="table2">

						<%
							List<MenuVo> menulist = (List<MenuVo>) request.getAttribute("menu");
						%>
						<div>내가 등록한 메뉴</div>
						<thead>
							<tr>
								<th>음식 이름</th>
								<th>가격</th>
								<th>음식 설명</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="my-tbody">
							<%
								for (int i = 0; i < menulist.size(); i++) {
							%>

							<tr class="menu_list_hover">
								<td id="food_name"><%=menulist.get(i).getFood_name()%></td>
								<td id="food_price"><%=menulist.get(i).getFood_price()%></td>
								<td id="food_info"><%=menulist.get(i).getFood_info()%></td>
								<td><button class="menu_delete_button">삭제</button></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

	<script>
	$(document).ready(function () {	
	
 		var option = {
			type : "POST",
			url : "buisness_update",

			success : function(data) {
				if (data == "update") {
					alert("수정완료")
				} else if (data == "shopid_null") {
					alert("사업자번호는 필수입력칸 입니다.")
				} else if (data == "shopaddr_null") {
					alert("주소는 필수입력칸 입니다.")
				} else if (data == "shoplocation_null") {
					alert("가게지역은 필수입력칸 입니다.")
				} else if (data == "foodtype_null") {
					alert("음식종류는 필수입력칸 입니다.")
				} else if (data == "shoptime_null") {
					alert("가게 운영시간은 필수 입력칸 입니다.")
				} 
			},
			error : function() {
			}
 		}
 
		$('.registration_form').submit(function () {
				$(this).ajaxSubmit(option);
				return false;
		})




		$(document).on("click",".menu_delete_button", function(){
			console.log("삭제")
			var food =  $(this).parent().parent().children().eq(0).text();
		     if(confirm("음식이름 : "+food+"을 삭제하시겠습니까?")){
		    	$.ajax({
		    		type : "POST",
		    		url : "menu_delete",
		    		data : {
		    				food_name : $(this).parent().parent().children().eq(0).text(),
		    				food_price :  $(this).parent().parent().children().eq(1).text(),
		    				food_info : $(this).parent().parent().children().eq(2).text(),
		    				shop_id : "${shopOwnerList.shop_id}"
		    		},
		    		success : function(data) {
		    			if (data == "success") {
		    				
		    			} else if (data == "fail") {
		    				
		    			}
		    		},
		    		error : function() {
		    		}
		    	});
		    	
		    	var eventTarget = document.getElementsByClassName('menu_delete_button');
		    	for (var i=0; i<eventTarget.length; i++) {
		    			var parent = document.querySelector('#table2 tbody')
		    			parent.removeChild(this.parentElement.parentElement)
		    			i--
		    			
		    	}
		    } 
		});

	$(document).on("click",".food_add_submit" ,function () {
	
		var action = $('.menu_insert_form').attr("action");;
		
		var form_data = {
				food_name : $(".food_name").val(),
				food_price :  $(".food_price").val(),
				food_info : $(".food_info").val(),
				shop_id : "${shopOwnerList.shop_id}"
		}
		$.ajax({
			type : "POST",
			url : action,
			data : form_data,
			success : function(data) {
				if (data == "success") {
					alert("추가 완료");		 
					var my_tbody = document.getElementById('my-tbody');
					var row = my_tbody.insertRow(my_tbody.rows.length);
					var cell1 = row.insertCell(0);
					var cell2 = row.insertCell(1);
					var cell3 = row.insertCell(2);
					var cell4 = row.insertCell(3);
					cell1.innerHTML = $(".food_name").val();
					cell2.innerHTML = $(".food_price").val();
					cell3.innerHTML = $(".food_info").val();
					cell4.innerHTML ="<td><button class='menu_delete_button'>삭제</button></td>"; 
					//$(".menu_list_hover").load(window.location.href + ".menu_list_hover");
				} else if (data == "fail") {
					alert("음식이름을 입력해주세요");
				} else if (data == "fail2") {
					alert("가격을 입력해주세요");
				} else if (data == "fail3") {
					alert("음식 설명을 입력해주세요")
				}
			}		
		});
		
		})
	});
  </script>
</body>
</html>