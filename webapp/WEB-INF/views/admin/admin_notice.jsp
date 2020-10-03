<%@page import="com.javaex.model.AdminVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		List<AdminVo> vo = (List<AdminVo>) request.getAttribute("Anotice_list");
	%>

	<div id="sec_admin_notice">
		<h2>
			<i class="fas fa-arrow-circle-right"></i><span>공지사항</span>
		</h2>
		<hr />
		<div class="notice_cont">
			<div class="notice_search">
				<p>
					· 검색 결과 : <span><%=vo.get(0).getNoticeVo().getNotice_idx()%>건</span>
				</p>
				<div class="notice_seaAli">
					<div class="notice_seaAli1">
						정렬 : 등록일 <i class="fas fa-chevron-up"></i>&nbsp<i
							class="fas fa-chevron-down"></i>
					</div>
					<div class="notice_seaAli2">
						| 제목 <i class="fas fa-chevron-up"></i>&nbsp<i
							class="fas fa-chevron-down"></i>
					</div>
					<div class="notice_seaAli3">
						| 작성자 <i class="fas fa-chevron-up"></i>&nbsp<i
							class="fas fa-chevron-down"></i>
					</div>
					<select>
						<option value="10">10개 출력</option>
						<option value="20">20개 출력</option>
						<option value="30">30개 출력</option>
						<option value="40">40개 출력</option>
						<option value="50">50개 출력</option>
					</select>
				</div>
			</div>
			<table>
				<tr>
					<th>NO.</th>
					<th>제목</th>
					<th>리뷰 내용</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>

				<c:forEach items="${Anotice_list}" var="Anotice" begin="0" step="1">
					<c:set var="i" value="${i + 1}" />
					<tr>
						<td>${Anotice.getNoticeVo().getNotice_idx() }</td>
						<td><a href="#">${Anotice.getNoticeVo().getNotice_title() }</a></td>
						<td>${Anotice.getNoticeVo().getNotice_content() }</td>
						<td>관리자</td>
						<td>${Anotice.getNoticeVo().getNotice_date() }</td>
					</tr>
				</c:forEach>
			</table>
			<div class="paging" style="left: 0">
				<a href="#" class="bt"><i class="fas fa-angle-double-left"></i></a>
				<a href="#" class="bt"><i class="fas fa-angle-left"></i></a> <a
					href="#" class="num">1</a> <a href="#" class="num">2</a> <a
					href="#" class="num">3</a> <a href="#" class="bt"><i
					class="fas fa-angle-right"></i></a> <a href="#" class="bt"><i
					class="fas fa-angle-double-right"></i></a>
				<div>
				</div>
			</div>
			<div class="paging_search" >
				<select name="pSea" id="pSea">
					<option value="번호">NO.</option>
					<option value="제목">제목</option>
					<option value="리뷰내용">리뷰내용</option>
					<option value="작성자">작성자</option>
					<option value="등록일">등록일</option>
				</select> <input type="text" name="pSea_txt" id="pSea_txt"> <input
					type="submit" value="검색" id="pSea_txt_btn">
			</div>
		</div>
	</div>

</body>
<script>
	$(document).ready(function() {
		var up1 = $("div.notice_seaAli1 > i.fas.fa-chevron-up"); // 등록일 업
		var down1 = $("div.notice_seaAli1 > i.fas.fa-chevron-down"); // 등록일 다운
		var up2 = $("div.notice_seaAli2 > i.fas.fa-chevron-up"); // 제목 업
		var down2 = $("div.notice_seaAli2 > i.fas.fa-chevron-down"); // 제목 다운
		var up3 = $("div.notice_seaAli3 > i.fas.fa-chevron-up"); // 작성자 업
		var down3 = $("div.notice_seaAli3 > i.fas.fa-chevron-down"); // 작성자 다운

		$(".notice_seaAli").children().find("i").on("click", function() {
			console.log("1");
			if ($(this).has(".udSel")) {
				$(".notice_seaAli").children().find("i").removeClass("udSel");
			}
			$(this).addClass("udSel");
		});

		// 공지사항 클릭 시 새창 팝업창 띄우기
		/* $("table > tbody > tr > td > a").on("click", function(){
			var url = "admin_notice_info";
			window.open(url, "공지사항 정보", "height=700, width=1200, top=100, left=300", "_blank");
			
			
		});
		 */
		$("#sec_admin_notice > div > table tr > td:nth-child(2) > a").on("click", function(){
			/* #sec_admin_resSitu > div:nth-child(1) > table > tbody > tr:nth-child(2) > td:nth-child(4) */
			var info = $(this).closest("tr").children("td:nth-child(1)").text();
			console.log("공지사항 IDX : " + info);
				var url = "admin_notice_info?idx="+info;
				window.open(url, "공지사항 정보", "height=700, width=1200, top=100, left=300", "_blank");
		});
	});
</script>
</html>