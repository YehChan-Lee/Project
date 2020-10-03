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
	<div class="info_to">
		<h4>
			<i class="fas fa-dice-d6"></i>
			<p>접속자 통계 요약</p>
		</h4>
		<table>
			<tr>
				<th>총 접속자 수</th>
				<td>123명</td>
				<th>이달의 접속자 수</th>
				<td>12명</td>
			</tr>
			<tr>
				<th>오늘 접속자 수</th>
				<td>1명</td>
				<th>일일 평균 접속자 수</th>
				<td>2명</td>
			</tr>
		</table>
	</div>
</body>
</html>