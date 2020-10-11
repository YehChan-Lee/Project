<%@page import="java.util.List"%>
<%@page import="com.javaex.model.ReservationVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet"
	href="<c:url value="${path}/res/css/bootstrap.min.css?ver=1"/>" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container" style="padding:0px;">
<c:choose>
	<c:when test="${!empty reservation}">
		<table class="table table-hover">
				<thead>
				<tr>
					<th>예약자 이름</th>
					<th>예약 인원</th>
					<th>예약 날짜</th>
					<th>예약자 전화번호</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach items="${reservation}" var="reservation">
				<tr>
					<td>${reservation.res_name}</td>
					<td>${reservation.res_customer}</td>
					<td>${reservation.res_date}</td>
					<td>${reservation.rev_phone}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</c:when>
	
	<c:otherwise>
		<div id="message">
			예약자가 없습니다.
		</div>
		<script>
		$(document).ready(function(){
			$("#message").css("color", "lightgray").css("text-align", "center").css("background-color", "#fff").css("padding", "150px").css("font-size","17px").css("border-radius", "5px").css("font-family","'Noto Sans KR', sans-serif").css("font-weight", "500") ;
		});
			</script>
	</c:otherwise>
</c:choose>
	</div>
</body>
</html>