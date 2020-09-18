<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="sec_admin_resSitu">
		<h2>
			<i class="fas fa-arrow-circle-right"></i><span>예약 현황</span>
		</h2>
		<hr />
		<div>
			<div class="resSituRdo">
				<input type="radio" name="rsRdo" value="전체" />전체 <input type="radio"
					name="rsRdo" value="예약중" />예약중 <input type="radio" name="rsRdo"
					value="결제완료" />결제완료 <span> | </span>
			</div>
			<span>검색 키워드</span>
			<div>
				<select name="resSitu_search" id="resSitu_search">
					<option>예약자</option>
					<option>사업자 번호</option>
					<option>가게이름</option>
					<option>예약 날짜</option>
					<option>결제 날짜</option>
				</select> <input type="text" />
				<button class="resSitu_btn">
					<i class="fas fa-search"></i>검색
				</button>
			</div>
		</div>
		<div id="sec_admin_resSitu">
			<div>
				<table>
					<tr>
						<th></th>
						<th>NO.</th>
						<th>결제유무</th>
						<th>사용자 이름</th>
						<th>사용자 이메일</th>
						<th>가게 이름</th>
						<th>가게 사업자번호</th>
						<th>가게 주소</th>
						<th>예약 날짜</th>
						<th>예약 인원</th>
						<th>음식 메뉴</th>
						<th>결제 날짜</th>
					</tr>
					<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
				<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
				<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
				<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
				</table>
			</div>
			<div class="paging_resSitu">
				<div>
					<a href="#" class="bt"><i class="fas fa-angle-double-left"></i></a>
					<a href="#" class="bt"><i class="fas fa-angle-left"></i></a> <a
						href="#" class="num">1</a> <a href="#" class="num">2</a> <a
						href="#" class="num">3</a> <a href="#" class="bt"><i
						class="fas fa-angle-right"></i></a> <a href="#" class="bt"><i
						class="fas fa-angle-double-right"></i></a>
				</div>
				<div>
					<button>선택삭제</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>