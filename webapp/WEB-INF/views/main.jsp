<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="${path}/res/css/main.css?ver=10"/>" />
</head>

<body>

	<!-- 모바일에서 화면배율을 디바이스 크기 기준으로 설정 -->
	<!-- 이게 안되면 pc에서의 100px과 모바일에서의 100px이 디바이스 성능에 따라 달라집니다. -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- 제이쿼리 불러오기 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- slick 불러오기 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">

	<!-- AOS 플러그인 -->
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	<!-- 폰트어썸 불러오기 -->
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
		integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
		crossorigin="anonymous">
	<%@ include file="top_bar.jsp"%>
	<div id="main">
		<div id="main_slider">
			<br> <br> <br> <br>
			<!-- 중앙 컨텐츠 3차 visual story -->
			<div class="v-story-wrap con">
				<h2 class="v-story-tt" data-aos="fade-up"></h2>
				<div class="v-story-slider" data-aos="fade-up">
					<div class="slider-item">
						<a href="#" class="block">
							<div class="img-box block">
								<img src="<c:url value="${path}/res/image/main/hotelfood.jpg"/>">

							</div>
							<div class="discover">
								<span class="discover-btn block"></span> <span
									class="discover-txt block">EXPLORE</span>
							</div>
						</a>
						<div class="v-story-desc-list">
							<p class="v-story-desc-tt">DINING TICKET</p>
							<p class="v-story-desc">
								여름엔 호텔! <br>호텔은 여름!
							</p>
						</div>
					</div>
					<div class="slider-item">
						<a href="#" class="block">
							<div class="img-box">
								<img
									src="<c:url value="${path}/res/image/main/restaurant.jpg"/>">
							</div>
							<div class="discover">
								<span class="discover-btn block"></span> <span
									class="discover-txt block">EXPLORE</span>
							</div>
						</a>
						<div class="v-story-desc-list">
							<p class="v-story-desc-tt">예약수 TOP20</p>
							<p class="v-story-desc">
								믿고 예약하는<br> 20곳의 레스토랑
							</p>
						</div>
					</div>
					<div class="slider-item">
						<a href="#" class="block">
							<div class="img-box">
								<img src="<c:url value="${path}/res/image/main/ramen.jpg"/>">
							</div>
							<div class="discover">
								<span class="discover-btn block"></span> <span
									class="discover-txt block">EXPLORE</span>
							</div>
						</a>
						<div class="v-story-desc-list">
							<p class="v-story-desc-tt">DINING TICKET</p>
							<p class="v-story-desc">
								매일 먹어도 좋은 <br>라멘
							</p>
						</div>
					</div>
					<div class="slider-item">
						<a href="#" class="block">
							<div class="img-box">
								<img src="<c:url value="${path}/res/image/main/dining.jpg"/>">
							</div>
							<div class="discover">
								<span class="discover-btn block"></span> <span
									class="discover-txt block">EXPLORE</span>
							</div>
						</a>
						<div class="v-story-desc-list">
							<p class="v-story-desc-tt">CONTEMPORARY DINING</p>
							<p class="v-story-desc">
								셰프의 섬세한 터치 <br> 창의적인 다이닝
							</p>
						</div>
					</div>

				</div>
			</div>

		</div>
		<div id="main_content">
			<%@ include file="main_content.jsp"%>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>

<script>
	// animation on scroll
	AOS.init({
		//once:true,
		duration : 800,
		easing : 'ease',
	});

	// 3차 visual stroy slick 적용
	$('.v-story-slider').slick({
		dots : true,
		arrows : true,
		adaptiveHeight : true,
		centerMode : true,
		centerPadding : '300px',
		autoplay : true,
		autoplaySpeed : 5000,
		pauseOnHover : false,
		responsive : [ {
			breakpoint : 1440,
			settings : {
				centerPadding : '20vw',
			}
		}, {
			breakpoint : 770,
			settings : {
				centerPadding : '0',
				arrows : false,
			}
		}, ],
	}).on('beforeChange', function(event, slick, currentSlide, nextSlide) {
		/*
		if (currentSlide !== nextSlide) {
		    document.querySelectorAll('.slick-center + .slick-cloned').forEach((next) => {
		        // timeout required or Slick will overwrite the classes
		        setTimeout(() => next.classList.add('slick-current', 'slick-center'));
		    });
		}
		 */

		if (currentSlide !== nextSlide) {
			$('.slick-center + .slick-cloned').each(function(index, node) {
				var $node = $(node);

				setTimeout(function() {
					$node.addClass('slick-current');
					$node.addClass('slick-center');
				});
			});
		}
	}); // 이 코드는 slick infinite 가 맨끝에서 다시 처음으로 돌아가거나 할때 트랜지션이 적용되기 위한 코드입니다.
</script>

</html>