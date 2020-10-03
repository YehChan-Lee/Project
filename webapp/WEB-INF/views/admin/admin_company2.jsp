<%@page import="com.javaex.model.AdminVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="sec_admin_company2">
		<h2>
			<i class="fas fa-arrow-circle-right"></i><span>사업자 승인</span>
		</h2>
		<hr />

		<div>
			<span>검색 키워드</span> <select name="com2_search" id="com2_search">
				<option>사업자 번호</option>
				<option>이름</option>
				<option>가게이름</option>
				<option>연락처</option>
				<option>신청일</option>
				<option>신청 상태</option>
			</select> <input type="text" />
			<button class="com2_btn">
				<i class="fas fa-search"></i>검색
			</button>
		</div>
		<div class="admin_company_btn2">
			<span>업체 리스트</span> <span>사업자 승인</span>
		</div>
		<div id="sec_admin_company2">
			<div>
				<table>
					<tr>
						<th>사업자 번호</th>
						<th>가게 이름</th>
						<th>이름</th>
						<th>연락처</th>
						<th>신청일자</th>
						<th>상태</th>
						<th>결제</th>
					</tr>
					<%
						List<AdminVo> Acompany2_list = (List<AdminVo>)request.getAttribute("Acompany2_list");
						for(int i = 0; i< Acompany2_list.size(); i++){
							AdminVo vo = Acompany2_list.get(i);
					
					%>
					<tr>
						<td><%=vo.getShopVo().getShop_id()%></td>
						<td><%=vo.getShopVo().getShop_title()%></td>
						<td><%=vo.getShopUser().getUser_name()%></td>
						<td><%=vo.getShopUser().getUser_phone()%></td>
						<td><%=vo.getShopUser().getSign_date()%></td>
						<td><%=vo.getShopVo().getShop_state()%></td>
						<td><span><i class="fas fa-angle-right"></i>승인</span> <span><i
								class="fas fa-angle-right"></i>반려</span></td>
					</tr>
					<%
						}
					%>
					<!-- <tr>
						<td>123-12-12345</td>
						<td>골목식당</td>
						<td>testID</td>
						<td>010-1234-1234</td>
						<td>2020-01-01</td>
						<td>반려</td>
						<td><span><i class="fas fa-angle-right"></i>승인</span> <span><i
								class="fas fa-angle-right"></i>반려</span></td>
					</tr>
					<tr>
						<td>123-12-12345</td>
						<td>골목식당</td>
						<td>testID</td>
						<td>010-1234-1234</td>
						<td>2020-01-01</td>
						<td>승인</td>
						<td><span><i class="fas fa-angle-right"></i>승인</span> <span><i
								class="fas fa-angle-right"></i>반려</span></td>
					</tr>
					<tr>
						<td>123-12-12345</td>
						<td>골목식당</td>
						<td>testID</td>
						<td>010-1234-1234</td>
						<td>2020-01-01</td>
						<td>반려</td>
						<td><span><i class="fas fa-angle-right"></i>승인</span> <span><i
								class="fas fa-angle-right"></i>반려</span></td>
					</tr>
					<tr>
						<td>123-12-12345</td>
						<td>골목식당</td>
						<td>testID</td>
						<td>010-1234-1234</td>
						<td>2020-01-01</td>
						<td>승인</td>
						<td><span><i class="fas fa-angle-right"></i>승인</span> <span><i
								class="fas fa-angle-right"></i>반려</span></td>
					</tr>
					<tr>
						<td>123-12-12345</td>
						<td>골목식당</td>
						<td>testID</td>
						<td>010-1234-1234</td>
						<td>2020-01-01</td>
						<td>신청중</td>
						<td><span><i class="fas fa-angle-right"></i>승인</span> <span><i
								class="fas fa-angle-right"></i>반려</span></td>
					</tr>
					<tr>
						<td>123-12-12345</td>
						<td>골목식당</td>
						<td>testID</td>
						<td>010-1234-1234</td>
						<td>2020-01-01</td>
						<td>신청중</td>
						<td><span><i class="fas fa-angle-right"></i>승인</span> <span><i
								class="fas fa-angle-right"></i>반려</span></td>
					</tr>
					<tr>
						<td>123-12-12345</td>
						<td>골목식당</td>
						<td>testID</td>
						<td>010-1234-1234</td>
						<td>2020-01-01</td>
						<td>신청중</td>
						<td><span><i class="fas fa-angle-right"></i>승인</span> <span><i
								class="fas fa-angle-right"></i>반려</span></td>
					</tr>
					<tr>
						<td>123-12-12345</td>
						<td>골목식당</td>
						<td>testID</td>
						<td>010-1234-1234</td>
						<td>2020-01-01</td>
						<td>신청중</td>
						<td><span><i class="fas fa-angle-right"></i>승인</span> <span><i
								class="fas fa-angle-right"></i>반려</span></td>
					</tr> -->
				</table>
			</div>
			<div class="paging_com2">
				<div>
					<a href="#" class="bt"><i class="fas fa-angle-double-left"></i></a>
					<a href="#" class="bt"><i class="fas fa-angle-left"></i></a> <a
						href="#" class="num">1</a> <a href="#" class="num">2</a> <a
						href="#" class="num">3</a> <a href="#" class="bt"><i
						class="fas fa-angle-right"></i></a> <a href="#" class="bt"><i
						class="fas fa-angle-double-right"></i></a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		// 선택 삭제버튼		
		$("div.paging_com button:nth-child(2)").on("click", function() {
			var text = "정말 삭제하시겠습니까?";
			if (confirm(text) == true) {
				//확인
				document.form.submit();
			} else {
				//취소
				return;
			}
		});

		$("#sec_admin_company2 table > tbody > tr > td:nth-child(1) > input[type=checkbox]").on('click', function() {

			var checked = $(this).is(":checked");

			if (checked == true) {
				$(this).closest("tr").css({
					background : "#ffc8c8"
				});
			} else {
				$(this).closest("tr").css({
					background : "white"
				});
			}
		});

		$(".admin_company_btn2 > span:nth-child(1)").on('click', function() {
			$("#cont_section").load("admin/admin_company");

			// admin_company
			console.log("admin_company");
		});
		$(".admin_company_btn2 > span:nth-child(2)").on('click', function() {
			$("#cont_section").load("admin/admin_company2");

			// admin_company2
			console.log("admin_company2");
		});

		// 텍스트에 따라 색 변경하기 (승인/반려/신청중)

		$("#sec_admin_company2 > div:nth-child(1) > table > tbody > tr > td:nth-child(6)").each(function(i, e) {
			console.log($(this).text());
			if ($(this).text() == "승인") {
				$(this).css({
					color : "#008000"
				});
			} else if ($(this).text() == "반려") {
				$(this).css({
					color : "#ff0080"
				});
			} else {
				$(this).css({
					color : "#ff6000"
				});
			}
		});
	});
</script>
</html>