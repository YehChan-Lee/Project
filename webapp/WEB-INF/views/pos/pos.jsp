<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="${path}/res/css/pos.css"/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>POS</title>
</head>
<body>
	<div class="pos_wrap">
		<div id="controll_div">
			<div id="title_div">스시</div>
			<div id="menu_div">
				<c:forEach items="${Menu}" var="menu" varStatus="vs">
					<div class="menu">
						<span>${menu.food_name}</span> 
						<input type="hidden" id="value_${vs.count}" value="${menu.food_name}" /> 
						<span>${menu.food_price}</span>
						<input type="hidden" id="value_${vs.count}"	value="${menu.food_price}" />
					</div>
				</c:forEach>
			</div>
			<div id="button_div">
				<input type="button" value="결제하기" id="payment" /> 
				<input type="text" value="1" id="cnt" />
				<input type="button" value="추가하기" id="add" />
			</div>
			<div id="reserve_list">
				<p>예약 목록</p>
				<div id="list">
					<table class="table table-dark">
						<thead>
							<tr>
								<th>이름</th>
								<th>인원수</th>
								<th>전화번호</th>
								<th>예약날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${reserveList}" var="reserve">
							<tr>
								<td>${reserve.user_name}</td>
								<td>${reserve.res_customer}</td>
								<td>${reserve.rev_phone}</td>
								<td>${reserve.res_date}</td>
							</tr>							
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="table_div">
			<div class="table" id="1">
				<p>1번 테이블</p>
				<div id="food_list1">
				</div>
			</div>
			<div class="table" id="2">
				<p>2번 테이블</p>
				<div id="food_list2">
					<ul>
					</ul>
				</div>
			</div>
			<div class="table" id="3">
				<p>3번 테이블</p>
				<div id="food_list3">
					<ul>
					</ul>
				</div>
			</div>
			<div class="table" id="4">
				<p>4번 테이블</p>
				<div id="food_list4">
					<ul>
					</ul>
				</div>
			</div>
			<div class="table" id="5">
				<p>5번 테이블</p>
				<div id="food_list5">
					<ul>
					</ul>
				</div>
			</div>
			<div class="table" id="6">
				<p>6번 테이블</p>
				<div id="food_list6">
					<ul>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
$(document).ready(function () {
	$(".table").click(function (e) {		
		$(".table").removeClass('selected');
		$(this).toggleClass('selected');
		$("#add").click(()=> {			
			/* $(this).children("ul").html("<li>" +$(".menu.menuselected > :nth-child(2)").val()+"</li>"); */
			$(this).children("div").children("ul").append("<li>" +$(".menu.menuselected > :nth-child(2)").val()+"</li>");
		})
	});
	$(".menu").click(function (e) {
		$(".menu").removeClass('menuselected');
		$(this).toggleClass('menuselected');
	})
})
	
</script>
</html>