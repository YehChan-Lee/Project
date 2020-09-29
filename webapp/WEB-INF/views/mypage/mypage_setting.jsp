<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="${path}/res/css/mypage.css"/>"/>
</head>
<body>
<div id="setting" class="body empty">
	<table>
		<caption>기본 정보</caption>
		<tbody>
			<tr>
				<td class="setting_title">이름</td>
				<td class="setting_value">
					<span>${getUser.user_name}</span>
					<button type="button" tabindex="-1">변경하기</button>
					<form action="">
						<input id="update_name" type="text" name="update_name"/>
						<button id="Uname" class="Dname" type="submit" tabindex="-1">변경</button>
					</form>
				</td>
			</tr>
			<tr>
				<td class="setting_title">프로필 사진</td>
				<td class="setting_value">
					<span>
					<input type="file" name="" accept="" multiple="" />
					</span>
				</td>
			</tr>
			<tr>
				<td class="setting_title">성별</td>
				<td class="setting_value">
					<span>${getUser.user_gender}</span>
				</td>
			</tr>
			<tr>
				<td class="setting_title">생년월일</td>
				<td class="setting_value">
					<span>${getUser.user_birth}</span>
				</td>
			</tr>
			<tr>
				<td class="setting_title">전화번호</td>
				<td class="setting_value">
					<span>${getUser.user_phone}</span>
					<button type="button" tabindex="-1">변경하기</button>
					<form action="">
						<label>
							<span>새 전화번호</span>
							<input id="update_phone" type="text" name="phone"/>
						</label>
						<button id="Uphone" class="Dname" type="submit" tabindex="-1">확인</button>
						<input type="hidden" name="update_phone" value=""/>
						<input type="hidden" name="type" value="phone"/>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(".setting_value>button").on('click', function(){
	if($(this).siblings("form").css("display") == "none"){
		$(this).siblings("form").show();
	} else {
		$(this).siblings("form").hide();
	}
});
/* var datas = {
		if($("#update_name").val() !=null || $("#update_phone").val() != null){
			update_name : $("#update_name").val()
			update_phone : $("#update_phone").val()	
		} else {
			alert("데이터를 입력해주세요~");
			return;
		}
} */
$(".Dname").click(function () {
	$.ajax({
		type : "POST",
		url : "mypage/setting.do",
		data: 
			{update_name : $("#update_name").val(),
			update_phone : $("#update_phone").val()},
		success:function(data) {
			if(data=="update_success"){
				window.reload();	
			}
		},
		error : function() {
			alert("에러발생");
		}

	});
});
</script>
</body>
</html>