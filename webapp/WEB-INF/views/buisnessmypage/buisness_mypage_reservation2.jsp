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

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">

		<table class="table table-hover">
		<%List<ReservationVo> reservationvoArr = (List<ReservationVo>)request.getAttribute("reservation"); %>
			<thead>
				<tr>
					<th>예약자 이름</th>
					<th>예약 인원</th>
					<th>예약 날짜</th>
					<th>예약자 전화번호</th>
				</tr>
			</thead>
			<tbody>
			<% 
				for (int i=0; i < reservationvoArr.size(); i++) { 
			%>
				<tr>
					<td><%=reservationvoArr.get(i).getRes_name() %></td>
					<td><%=reservationvoArr.get(i).getRes_customer() %></td>
					<td><%=reservationvoArr.get(i).getRes_date() %></td>
					<td><%=reservationvoArr.get(i).getRev_phone() %></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>