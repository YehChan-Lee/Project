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
<link rel="stylesheet"
	href="<c:url value="${path}/res/css/jquery-ui1.css"/>" />
</head>
<body>
	<div id="sec_admin_member">
		<h2>
			<i class="fas fa-arrow-circle-right"></i><span>회원 검색</span>
		</h2>
		<hr />
		<form action="" method="get" class="memSear_form">
			<table>
				<tr>
					<th>검색 키워드</th>
					<td><select name="mem_search" id="mem_search">
							<option>이름</option>
							<option>아이디</option>
							<option>이메일</option>
							<option>휴대폰</option>
							<option>전화번호</option>
							<option>주소</option>
					</select> <input type="text" /></td>
					<th>성별</th>
					<td><input type="radio" name="gen_sea" id="gen_man"
						value="man" checked="checked" /><label for="gen_man">남자</label> <input
						type="radio" name="gen_sea" id="gen_woman" value="woman" /><label
						for="gen_woman">여자</label></td>
					<th>사업자 여부</th>
					<td><input type="radio" name="Business_sea" id="Business_o"
						value="사업자가입" checked="checked" /><label for="Business_o">가입</label>
						<input type="radio" name="Business_sea" id="Business_x"
						value="사업자미가입" /><label for="Business_x">미가입</label></td>
					<th>가입일</th>
					<td><input type="text" id="datepicker1" autocomplete="off"/> <span>~</span> <input
						type="text" id="datepicker2" autocomplete="off"/></td>
				</tr>
			</table>
			<div>
				<button type="button" class="mem_btnEraser">
					<i class="fas fa-undo-alt"></i>초기화
				</button>
				<button type="submit" class="mem_btn">
					<i class="fas fa-search"></i>검색
				</button>
			</div>
		</form>
		<div id="sec_admin_member2">
			<h2>
				<i class="fas fa-arrow-circle-right"></i><span>회원 리스트</span>
			</h2>
			<hr />
			<table>
				<tr>
					<th><input type="checkbox" name="chk_all" /></th>
					<th>NO.</th>
					<th>이름</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>가입날짜</th>
					<th>사업자여부</th>
					<th>포인트</th>
				</tr>
				<%
				List<AdminVo> Amember_list = (List<AdminVo>)request.getAttribute("Amember_list");
				for(int i = 0; i< Amember_list.size(); i++){
					AdminVo vo = Amember_list.get(i);
					
				%>
				<tr>
					<td><input type="checkbox" name="chk_sib" /></td>
					<td><%=vo.getShopUser().getUser_idx() %></td>
					<td><%=vo.getShopUser().getUser_name() %></td>
					<td><%=vo.getShopUser().getUser_gender() %></td>
					<td><%=vo.getShopUser().getUser_birth() %></td>
					<td><%=vo.getShopUser().getUser_phone() %></td>
					<td><%=vo.getShopUser().getUser_email() %></td>
					<td><%=vo.getShopUser().getSign_date() %></td>
					<td><%=vo.getShopUser().getIs_owner() %></td>
					<td><%=vo.getShopUser().getPoint() %></td>
				</tr>
				<%
				}
				%>
			<!-- 	<tr>
					<td><input type="checkbox" name="chk_sib" /></td>
					<td>2</td>
					<td>테스트</td>
					<td>남자</td>
					<td>2000-01-01</td>
					<td>010-0000-0000</td>
					<td>test@test.com</td>
					<td>2000-12-31</td>
					<td>가입</td>
					<td>3000</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="chk_sib" /></td>
					<td>3</td>
					<td>테스트</td>
					<td>남자</td>
					<td>2000-01-01</td>
					<td>010-0000-0000</td>
					<td>test@test.com</td>
					<td>2000-12-31</td>
					<td>가입</td>
					<td>3000</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="chk_sib" /></td>
					<td>4</td>
					<td>테스트</td>
					<td>남자</td>
					<td>2000-01-01</td>
					<td>010-0000-0000</td>
					<td>test@test.com</td>
					<td>2000-12-31</td>
					<td>가입</td>
					<td>3000</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="chk_sib" /></td>
					<td>5</td>
					<td>테스트</td>
					<td>남자</td>
					<td>2000-01-01</td>
					<td>010-0000-0000</td>
					<td>test@test.com</td>
					<td>2000-12-31</td>
					<td>가입</td>
					<td>3000</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="chk_sib" /></td>
					<td>6</td>
					<td>테스트</td>
					<td>남자</td>
					<td>2000-01-01</td>
					<td>010-0000-0000</td>
					<td>test@test.com</td>
					<td>2000-12-31</td>
					<td>가입</td>
					<td>3000</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="chk_sib" /></td>
					<td>7</td>
					<td>테스트</td>
					<td>남자</td>
					<td>2000-01-01</td>
					<td>010-0000-0000</td>
					<td>test@test.com</td>
					<td>2000-12-31</td>
					<td>가입</td>
					<td>3000</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="chk_sib" /></td>
					<td>8</td>
					<td>테스트</td>
					<td>남자</td>
					<td>2000-01-01</td>
					<td>010-0000-0000</td>
					<td>test@test.com</td>
					<td>2000-12-31</td>
					<td>가입</td>
					<td>3000</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="chk_sib" /></td>
					<td>9</td>
					<td>테스트</td>
					<td>남자</td>
					<td>2000-01-01</td>
					<td>010-0000-0000</td>
					<td>test@test.com</td>
					<td>2000-12-31</td>
					<td>가입</td>
					<td>3000</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="chk_sib" /></td>
					<td>10</td>
					<td>테스트</td>
					<td>남자</td>
					<td>2000-01-01</td>
					<td>010-0000-0000</td>
					<td>test@test.com</td>
					<td>2000-12-31</td>
					<td>가입</td>
					<td>3000</td>
				</tr> -->
			</table>
			<div class="paging_mem">
				<div>
					<a href="#" class="bt"><i class="fas fa-angle-double-left"></i></a>
					<a href="#" class="bt"><i class="fas fa-angle-left"></i></a> <a
						href="#" class="num">1</a> <a href="#" class="num">2</a> <a
						href="#" class="num">3</a> <a href="#" class="bt"><i
						class="fas fa-angle-right"></i></a> <a href="#" class="bt"><i
						class="fas fa-angle-double-right"></i></a>
				</div>
				<div>
					<button>회원등록</button>
					<button>선택삭제</button>
				</div>
			</div>
		</div>
</body>
<script>
	$(document).ready(function() {
		$("#datepicker1").datepicker({
			showOn : "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
			/* buttonImage: "res/image/admin/calendar.png", // 버튼 이미지 */
			buttonImage : "res/image/admin/calendar.png", // 버튼 이미지
			buttonImageOnly : true, // 버튼에 있는 이미지만 표시한다.
			changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			minDate : '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
			maxDate : '0',
			nextText : '다음 달', // next 아이콘의 툴팁.
			prevText : '이전 달', // prev 아이콘의 툴팁.
			numberOfMonths : [1, 1
			], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
			//stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
			/* yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가. */
			yearRange : 'c-30:c+0', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			showButtonPanel : true, // 캘린더 하단에 버튼 패널을 표시한다. 
			currentText : '오늘날짜', // 오늘 날짜로 이동하는 버튼 패널 
			
			closeText : '닫기', // 닫기 버튼 패널
			dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
			/* showAnim: "slide", //애니메이션을 적용한다. */
			showMonthAfterYear : true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
			dayNamesMin : ['월', '화', '수', '목', '금', '토', '일'
			], // 요일의 한글 형식.
			monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'
			]
		
		// 월의 한글 형식.

		});
		$("#datepicker2").datepicker({
			showOn : "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
			/* buttonImage: "res/image/admin/calendar.png", // 버튼 이미지 */
			buttonImage : "res/image/admin/calendar.png", // 버튼 이미지
			buttonImageOnly : true, // 버튼에 있는 이미지만 표시한다.
			changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			minDate : '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
			maxDate : '0',
			nextText : '다음 달', // next 아이콘의 툴팁.
			prevText : '이전 달', // prev 아이콘의 툴팁.
			numberOfMonths : [1, 1
			], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
			//stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
			/* yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가. */
			yearRange : 'c-30:c+0', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			showButtonPanel : true, // 캘린더 하단에 버튼 패널을 표시한다.
			gotoCurrent: true,
			currentText : '오늘 날짜', // 오늘 날짜로 이동하는 버튼 패널
			closeText : '닫기', // 닫기 버튼 패널
			dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
			/* showAnim: "slide", //애니메이션을 적용한다. */
			showMonthAfterYear : true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
			dayNamesMin : ['월', '화', '수', '목', '금', '토', '일'
			], // 요일의 한글 형식.
			monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'
			]
		// 월의 한글 형식.

		});

		/* $.datepicker._gotoToday = function(d) { 
		    $(d).datepicker('setDate', new Date()).datepicker('hide').blur(); 
		}; */
		
		// 초기화/검색 버튼
		$(".mem_btnEraser").on('click', function() {
			$("#mem_search option:eq(0)").prop("selected", true);
			$("#sec_admin_member > form > table > tbody > tr > td:nth-child(2) > input[type=text]").val("");
			$("#gen_man").prop("checked", true);
			$("#Business_o").prop("checked", true);
			$("#datepicker1").val("");
			$("#datepicker2").val("");
		});

		// 회원 리스트 체크박스		
		$("#sec_admin_member2 > table tr:nth-child(1) > th:nth-child(1) ").find("input[name='chk_all']").on('click', function() {
			var all_state = $("#sec_admin_member2 > table tr:nth-child(1) > th:nth-child(1) > input[type=checkbox]").is(":checked");
			var siblings = $("#sec_admin_member2 > table tr:not(:nth-child(1)) >td").find("input[name='chk_sib']");
			var siblings_chk = $("#sec_admin_member2 > table tr:not(:nth-child(1)) >td").find("input[name='chk_sib']:checked");
			var checked = siblings_chk.length;

			if (all_state) {
				if (siblings.length !== checked) {
					siblings.prop('checked', true);
				}
			} else {
				siblings.prop('checked', false);
			}

		});

		$("#sec_admin_member2 > table tr input[name='chk_sib']").change(function() {
			var all = $("#sec_admin_member2 > table tr:nth-child(1) > th:nth-child(1) ").find("input[name='chk_all']");
			var siblings = $("#sec_admin_member2 > table tr:not(:nth-child(1)) >td").find("input[name='chk_sib']");
			var siblings_chk = $("#sec_admin_member2 > table tr:not(:nth-child(1)) >td").find("input[name='chk_sib']:checked");
			var checked = siblings_chk.length;

			if (siblings.length !== checked) {
				all.prop('checked', false);
			} else {
				all.prop('checked', true);
			}
		});
		// 회원 리스트 체크박스 끝

		// 등록 버튼
		$("#sec_admin_member2 > div > div:nth-child(2) > button:nth-child(1)").on('click', function() {
			var url = "main"
			window.open(url, "_blank");
		});

		// 삭제 버튼
		$("#sec_admin_member2 > div > div:nth-child(2) > button:nth-child(2)").on('click', function() {
			alert("삭제버튼");
		});
	});
</script>
</html>