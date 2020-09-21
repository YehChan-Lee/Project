<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="sec_admin_company">
		<h2>
			<i class="fas fa-arrow-circle-right"></i><span>업체 리스트</span>
		</h2>
		<hr />
		<div>
			<span>검색 키워드</span> <select name="com_search" id="com_search">
				<option>사업자 번호</option>
				<option>대표자 명/option>
				<option>이메일</option>
				<option>가게 이름</option>
				<option>가게 전화번호</option>
				<option>가게 주소</option>
				<option>가입 날짜</option>
			</select> <input type="text" />
			<button class="com_btn">
				<i class="fas fa-search"></i>검색
			</button>
		</div>
		<div class="admin_company_btn">
			<span>업체 리스트</span> <span>사업자 승인</span>
		</div>
		<div id="sec_admin_companyLi">
			<div>
				<table>
					<tr>
						<th></th>
						<th>NO.</th>
						<th>사업자 번호</th>
						<th>대표자 명</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>가게 이름</th>
						<th>가게 전화번호</th>
						<th>가게 주소</th>
						<th>가입날짜</th>
						<th>조회수</th>
						<th>별점</th>
						<th>운영시간</th>
						<th>주차기능</th>
					</tr>
					<tr>
						<td><input type="checkbox" name="company_sib" /></td>
						<td>1</td>
						<td>123-12-12345</td>
						<td>testID</td>
						<td>010-0000-0000</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>02-1234-1234</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>1234</td>
						<td>5.0</td>
						<td>00:00~24:00</td>
						<td>주차 가능</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="company_sib" /></td>
						<td>2</td>
						<td>123-12-12345</td>
						<td>testID</td>
						<td>010-0000-0000</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>02-1234-1234</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>1234</td>
						<td>5.0</td>
						<td>00:00~24:00</td>
						<td>주차 가능</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="company_sib" /></td>
						<td>3</td>
						<td>123-12-12345</td>
						<td>testID</td>
						<td>010-0000-0000</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>02-1234-1234</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>1234</td>
						<td>5.0</td>
						<td>00:00~24:00</td>
						<td>주차 가능</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="company_sib" /></td>
						<td>4</td>
						<td>123-12-12345</td>
						<td>testID</td>
						<td>010-0000-0000</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>02-1234-1234</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>1234</td>
						<td>5.0</td>
						<td>00:00~24:00</td>
						<td>주차 가능</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="company_sib" /></td>
						<td>5</td>
						<td>123-12-12345</td>
						<td>testID</td>
						<td>010-0000-0000</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>02-1234-1234</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>1234</td>
						<td>5.0</td>
						<td>00:00~24:00</td>
						<td>주차 가능</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="company_sib" /></td>
						<td>6</td>
						<td>123-12-12345</td>
						<td>testID</td>
						<td>010-0000-0000</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>02-1234-1234</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>1234</td>
						<td>5.0</td>
						<td>00:00~24:00</td>
						<td>주차 가능</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="company_sib" /></td>
						<td>7</td>
						<td>123-12-12345</td>
						<td>testID</td>
						<td>010-0000-0000</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>02-1234-1234</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>1234</td>
						<td>5.0</td>
						<td>00:00~24:00</td>
						<td>주차 가능</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="company_sib" /></td>
						<td>8</td>
						<td>123-12-12345</td>
						<td>testID</td>
						<td>010-0000-0000</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>02-1234-1234</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>1234</td>
						<td>5.0</td>
						<td>00:00~24:00</td>
						<td>주차 가능</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="company_sib" /></td>
						<td>9</td>
						<td>123-12-12345</td>
						<td>testID</td>
						<td>010-0000-0000</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>02-1234-1234</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>1234</td>
						<td>5.0</td>
						<td>00:00~24:00</td>
						<td>주차 가능</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="company_sib" /></td>
						<td>10</td>
						<td>123-12-12345</td>
						<td>testID</td>
						<td>010-0000-0000</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>02-1234-1234</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>1234</td>
						<td>5.0</td>
						<td>00:00~24:00</td>
						<td>주차 가능</td>
					</tr>
				</table>
			</div>
			<div class="paging_com">
				<div>
					<a href="#" class="bt"><i class="fas fa-angle-double-left"></i></a>
					<a href="#" class="bt"><i class="fas fa-angle-left"></i></a> <a
						href="#" class="num">1</a> <a href="#" class="num">2</a> <a
						href="#" class="num">3</a> <a href="#" class="bt"><i
						class="fas fa-angle-right"></i></a> <a href="#" class="bt"><i
						class="fas fa-angle-double-right"></i></a>
				</div>
				<div>
					<button>업체등록</button>
					<button>선택삭제</button>
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

		$("#sec_admin_company table > tbody > tr > td:nth-child(1) > input[type=checkbox]").on('click', function() {

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

		$(".admin_company_btn > span:nth-child(1)").on('click', function() {
			$("#cont_section").load("admin/admin_company");

			// admin_company
			console.log("admin_company");
		});
		$(".admin_company_btn > span:nth-child(2)").on('click', function() {
			$("#cont_section").load("admin/admin_company2");

			// admin_company2
			console.log("admin_company2");
		});
		$("#sec_admin_companyLi > div.paging_com > div:nth-child(2) > button:nth-child(1)").on("click", function() {
			var url = "main"
			window.open(url, "_blank");
		});

	});
</script>
</html>