<%@page import="java.util.List"%>
<%@page import="com.javaex.model.AdminVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>
<link rel="stylesheet"
	href="<c:url value='${path}/res/css/admin/resSitu_info.css'/>">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://kit.fontawesome.com/c50e3378bc.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<h2>
		<div>
			<i class="fas fa-utensils"></i>
		</div>
		예약음식 확인
	</h2>
	<hr />
	<div id="container">
		<%-- <c:set var="num" value="<%= request.getParameter("idx") %>"></c:set> --%>
		<%
			List<AdminVo> aresSitu_info = (List<AdminVo>) request.getAttribute("AresSitu_info");
		%>
		<table>
			<tr>
				<th>예약번호</th>
				<td><%=aresSitu_info.get(0).getReserveOrder().getReserve_idx()%></td>
				<th>예약자</th>
				<td><%=aresSitu_info.get(0).getReservation().getRes_name()%></td>
				<th>테이블</th>
				<td><%=aresSitu_info.get(0).getReserveOrder().getTable_number()%></td>
			</tr>
		</table>
		<table>
			<tr>
				<th colspan="4"><%=aresSitu_info.get(0).getReservation().getShop_title()%></th>
			</tr>
			<c:forEach items="${AresSitu_info}" var="Ainfo" begin="0" step="1">
				<c:set var="i" value="${i + 1}" />
				<tr>
					<td>${i }.</td>
					<td colspan="2">${Ainfo.getReserveOrder().getFood_name() }</td>
					<td>${Ainfo.getReserveOrder().getFood_count() }개</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>