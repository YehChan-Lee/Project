<%@page import="com.javaex.model.AdminVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet"
	href="<c:url value='${path}/res/css/admin/notice_info.css'/>">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://kit.fontawesome.com/c50e3378bc.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<h2>
		<div><i class="fas fa-thumbtack"></i></div>
		공지사항
	</h2>
	<hr />
	<div id="container">
		<%
			List<AdminVo> vo = (List<AdminVo>) request.getAttribute("Anotice_list_info");
		%>
		<table>
			<tr>
				<th>작성자</th>
				<td>admin</td>
				<th>작성날짜</th>
				<td><%=vo.get(0).getNoticeVo().getNotice_date()%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=vo.get(0).getNoticeVo().getNotice_title()%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><p><%=vo.get(0).getNoticeVo().getNotice_content()%></p></td>
			</tr>
		</table>
		<div>
			<button><i class="fas fa-tools"></i>수정</button>
			<button><i class="fas fa-trash-alt"></i>삭제</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#container > div > button:nth-child(1)").on("click", function(){
			var url = decodeURIComponent(window.location.href);
			console.log(url);
			
			function getParameterByName(name) {
		        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		                results = regex.exec(location.search);
		        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		    }
			var idx = getParameterByName('idx');
			console.log(idx);
		
			var modify = "admin_notice_modify?idx="+idx;
			window.open(modify, "_self");
		});

	});
</script>
</html>