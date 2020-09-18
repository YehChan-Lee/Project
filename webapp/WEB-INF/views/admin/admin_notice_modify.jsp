<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.js"></script>
<link rel="stylesheet"
	href="<c:url value='${path}/res/css/admin/notice_modify.css'/>">
<script src="https://kit.fontawesome.com/c50e3378bc.js"
	crossorigin="anonymous"></script>
<script src="<c:url value='${path}/res/SE2/js/HuskyEZCreator.js'/>"></script>

</head>
<body>
	<h2>
		<div>
			<i class="fas fa-tools"></i>
		</div>
		공지사항 수정
	</h2>
	<hr />
	<form id="container">
		<table>
			<tr>
				<th>작성자</th>
				<td>admin</td>
				<th>작성날짜</th>
				<td>2020-01-01 13:20</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><textarea id="texarea" name="texarea"></textarea>
				</td>
			</tr>
		</table>
		<div>
			<div>
				<i class="fas fa-check"></i>등록
			</div>
			<div>
				<i class="fas fa-ban"></i>취소
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	var oEditors = [];

	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "texarea",
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "res/SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {

				}
			},
			fOnAppLoad : function() {
			//textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
			/* oEditors.getById["ir1"].exec("PASTE_HTML", ["ㅎㅇ 시작하자마자 이문구 작성됨."]); */
			},
			fCreator : "createSEditor2"
		});
	});
	
	$("#container > div > div:nth-child(2)").on("click", function(){
		window.close();
	});
</script>


</html>