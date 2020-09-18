<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<table>
			<tr>
				<th>작성자</th>
				<td>admin</td>
				<th>작성날짜</th>
				<td>2020-01-01 13:20</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">서버정검안내</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><p>안녕하세요 밥풀입니다. 
				원활한 서비스 운영을 위해 아래 기간동안 서버 점검을
					진행합니다. 서버 점검 중에는 서비스 이용이 원활하지
					 않을 수 있습니다. - 2020. 02. 16 (일) 03:00 -
					05:00 - 2020. 02. 17 (월) 03:00 - 05:00 이용에 불편을 드려 죄송하다는 말씀드리며, 더 나은
					서비스로 보답할 수 있도록 노력하겠습니다. 감사합니다.</p></td>
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
			var modify = "admin_notice_modify";
			window.open(modify, "_self");
		});
	});
</script>
</html>