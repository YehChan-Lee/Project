<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>footer</title>
<link rel="stylesheet" type="text/css" href="<c:url value="${path}/res/css/footer.css"/>"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script type="text/javascript" src="http://malsup.github.com/jquery.form.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<link rel="stylesheet" href="<c:url value='${path}/res/css/detail_review.css'/>">
</head>
<body>
<!-- footer -->
<div id="footer_wrap">
	<div id="footer_container">
		<div id="footer_logo">
		<a href="">
			밥풀
        </a>
        </div>
		<div id="footer_slogan">
		당신의 탁월한 선택 밥풀<br>
		</div>
		
		<div id="footer_count">
		지금까지 총<span class="foot">${footeruser}</span>명의 사용자가 <span class="foot">${footerreview}</span>개의 정성스런 리뷰를 남기셨고,<br>
		밥풀 예약 서비스를 이용하여 <span class="foot">${footerreserve}</span>번의 식사를 하셨습니다.
		</div>
		
		<div id="footer_explan">
		(주) 밥풀 대표이사: 이예찬 | 박정석 | 서다슬 | 안승우 | 이준영 | 최희만
		<span>|</span>
		사업자등록번호: 1111111<br>
		주소: 서울시 금천구 가산동
		<span>|</span>
		대표번호: 02-111-1111
		<span>|</span>
		이메일: Team1@babpool.com				
		</div>
		
		<div id="info">
			<a href="">밥풀소개</a>
			<a href="term">
			<span>|</span>
			개인정보 취급방침</a>
			<a href="notice?&page=1">
			<span>|</span>
			공지사항</a>
		</div>
	</div>
</body>

</html>