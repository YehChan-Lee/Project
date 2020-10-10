<%@page import="com.javaex.model.VisitVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value='${path}/res/css/admin/numerical_total.css'/>">
</head>
<body>
	<%
			List<VisitVo> viVoTo = (List<VisitVo>) request.getAttribute("admin_numerical_total_total");
			int vivoToSize = viVoTo.size();

			List<VisitVo> viVoToToday = (List<VisitVo>) request.getAttribute("admin_numerical_total_totalToday");
			int viVoToTodaySize = viVoToToday.size();
			
			int viVoToMonth = (int)request.getAttribute("admin_numerical_total_totalMonth");
		%>
	<div class="info_to">
		<h4>
			<i class="fas fa-dice-d6"></i>
			<p>접속자 통계 요약</p>
		</h4>
		<table>
			<tr>
				<th>총 접속자 수</th>
				<td><%=vivoToSize %>명</td>
				<th>이달의 접속자 수</th>
				<td><%=viVoToMonth %>명</td>
			</tr>
			<tr>
				<th>오늘 접속자 수</th>
				<td><%=viVoToMonth %>명</td>
				<th></th>
				<td></td>
			</tr>
			<tr>
		</table>
	</div>
</body>
</html>