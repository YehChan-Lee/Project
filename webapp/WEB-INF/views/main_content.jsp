<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">


<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="${path}/res/css/main_content.css?ver=3"/>" />
</head>
<body>
	<div class="benefit">
		<span class="epicureanspan">함께 즐기고 싶은 혜택</span>
		<div class="epicureandiv">
			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit1.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">밥풀예약수 TOP 20 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">포잉 사용자들이 가장 사랑한 레스토랑</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit2.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">스시오마카세 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">미들급 스시야부터 하이엔드 스시야까지</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit3.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">스테이크 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">육향이 남다른 스테이크를 즐겨보세요</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit4.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">컨템퍼러리 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">셰프의 섬세한 터치가 가미된 창의적인 다이닝</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit5.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">양식 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">이탈리안부터 프렌치까지. 데이트하기 좋은 곳</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit6.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">일식 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">가이세키 요리부터 쿠시아게 오마카세까지</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit7.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">중식 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">중화요리의 전설, 환상적인 불맛</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit8.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">한식 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">한식의 다채로운 변주를 경험해보세요</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit9.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">한우 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">숙성 한우 등심부터 추억의 로스구이까지</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="epicurean">
		<span class="epicureanspan">미식가를 위한</span>
		<div class="epicureandiv">
			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/epicurean.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">간판없는 가게</div>
					<div class="epicureandiv3div2">간판 없이, 조용한 손님의 발길을 끄는 숨겨진 보석
						같은곳을 소개합니다</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23조용한">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/spicy.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">매운 음식</div>
					<div class="epicureandiv3div2">중독성 강한, 입안 가득 차오르는 매운맛을 소개합니다.
					</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23매운">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/raman.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">라멘 먹고 갈래요?</div>
					<div class="epicureandiv3div2">지역에 따라 다른 특성을 가진 일본 라멘.</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23라멘">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/wodong.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">우동의 매력</div>
					<div class="epicureandiv3div2">지역마다 각기 다른 매력을 가진 우동. 각지의 맛있는 
					우동을 소개합니다.</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23우동">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/chinafood.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">전혀 다른 중국집</div>
					<div class="epicureandiv3div2">환상적인 분위기가 가득한 중식 다이닝 바에서 먹고,
						마시며, 즐기다!</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23중국집">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/restaurant.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">하늘 아래,뷰가 좋은 레스토랑</div>
					<div class="epicureandiv3div2">한적한 낮과 화려한 밤을 모두 감상할 수 있는 뷰가
						좋은 레스토랑</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23레스토랑">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/hotfood.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">뜨거운 것이 좋아</div>
					<div class="epicureandiv3div2">겨울의 시작, 뜨끈한 국물의 모츠나베와 불판 위의
						징키스칸을 만나다.</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23뜨거운">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/Sandwich.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">세상의 모든 샌드위치</div>
					<div class="epicureandiv3div2">근사한 재료가 아니더라도, 무한한 변형이 가능한
						샌드위치. 세계의 다양한 샌드위치를 만나볼까요?</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23샌드위치">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/healthfood.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">더위를 이기는,요즘 보양식</div>
					<div class="epicureandiv3div2">지겨운 보양식은 그만! 삼계탕이 지겨울 때 찾는 요즘의
						이색 보양식.</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23보양식">더보기 ></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="category">
		<span class="categoryspan">카테고리별</span>
		<div class="category0">
			<div class="categorydiv" onclick ="window.location.href='location';">
				<img
					src="<c:url value="${path}/res/image/main_content/popularity.jpg"/>">
				<div class="categorydiv2">주요 지역별</div>
			</div>

			<div class="categorydiv" onclick ="window.location.href='food';">
				<img src="<c:url value="${path}/res/image/main_content/food.jpg"/>">
				<div class="categorydiv2">음식 종류별</div>
			</div>

			<div class="categorydiv" onclick ="window.location.href='hashTag';">
				<img src="<c:url value="${path}/res/image/main_content/around.jpg"/>">
				<div class="categorydiv2">해시태그</div>
			</div>

		</div>
	</div>

	<div class="review">
		<span class="reviewspan">실시간 리뷰</span>
		<div class="reviewdiv">
			<c:forEach items="${reviewList}" var="review">
			<div class="reviewdiv1">
				<div class="reviewdiv2">
					<img src="<c:url value="${path}/res/image/main_content/coffie.jpg"/>"
						class="reviewdiv2img">
					<div class="review_img_div">
						${review.shopVo.shop_title}<br> ${review.shopVo.shop_location}
					</div>
				</div>
				<div class="reviewdiv3">
					<img
						src="<c:url value="${path}/serverImg/profile/user/${review.shopUser.user_photo}"/>"
						class="profile">
					<div class="info">
						<div class="infoname">${review.shopUser.user_name}</div>
						<div class="infocount">리뷰수 ${review.shopUser.review_cnt}</div>
						<div class="infostar" id="info_star${review.reviewVo.review_idx}"></div>
						<div class="infograde">
							<span class="infogradespan">${review.reviewVo.review_score}점</span>
						</div>
						<div class="infopreview">
							<span class="reviewspan2">${review.reviewVo.review}</span>
						</div>
						<div class="infodetail">
							<a href="http://localhost:8088/BabPool/detail?shopidx=${review.shopVo.shop_idx}"><span style="position: relative;bottom : 3px;right : -2px;">더보기</span></a>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>

	</div>
</body>
<script>
	$('.reviewdiv').slick({
		infinite : true,
		slidesToShow : 3,
		slidesToScroll : 3
	});

	$('.epicureandiv').slick({
		infinite : true,
		slidesToShow : 3,
		slidesToScroll : 3
	});
	$('.circlediv1').slick({
		infinite : true,
		slidesToShow : 4,
		slidesToScroll : 4
	});	
	$(document).ready(function () {
		<c:forEach items="${reviewList}" var="review">
	    $("#info_star${review.reviewVo.review_idx}").rateYo({  	  
			rating :  "${review.reviewVo.review_score}",
			starWidth: "20px",
		    halfStar: true,
		  	readOnly: true,
		  	onInit: function (rating, rateYoInstance) {
				console.log(rating)
			},
			starSvg : '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>'
			});  
	    </c:forEach>
	})
	
</script>
</html>