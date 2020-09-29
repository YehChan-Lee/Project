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

	callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가
	보이면 안됩니다.
	<script type="text/javascript"
		src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
		charset="utf-8"></script>
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
						<a href="list" class="block">
							<div class="img-box block">
								<img src="<c:url value="${path}/res/image/main/hotelfood.jpg"/>">

							</div>
							<div class="discover">
								<span class="discover-btn block"></span> <span
									class="discover-txt block">EXPLORE</span>
							</div>
						</a>
						<div class="v-story-desc-list">
							<p class="v-story-desc-tt">모든 음식점</p>
							<p class="v-story-desc">
								등록된 음식점<br>전체보기
							</p>
						</div>
					</div>
					<div class="slider-item">
						<a href="list?solt=4" class="block">
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
							<p class="v-story-desc-tt">예약수 TOP12</p>
							<p class="v-story-desc">
								믿고 예약하는<br> 12곳의 가게
							</p>
						</div>
					</div>
					<div class="slider-item">
						<a href="list?string_search=%23혼밥" class="block">
							<div class="img-box">
								<img src="<c:url value="${path}/res/image/main/3.png"/>">
							</div>
							<div class="discover">
								<span class="discover-btn block"></span> <span
									class="discover-txt block">EXPLORE</span>
							</div>
						</a>
						<div class="v-story-desc-list">
							<p class="v-story-desc-tt">해시태그</p>
							<p class="v-story-desc">
								혼자먹어도 맛있는 <br>#혼밥
							</p>
						</div>
					</div>
					<div class="slider-item">
						<a href="list?food_type=한식" class="block">
							<div class="img-box">
								<img src="<c:url value="${path}/res/image/main/4.jpg"/>">
							</div>
							<div class="discover">
								<span class="discover-btn block"></span> <span
									class="discover-txt block">EXPLORE</span>
							</div>
						</a>
						<div class="v-story-desc-list">
							<p class="v-story-desc-tt">음식종류</p>
							<p class="v-story-desc">
								한국인이라면<br>한식
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

	var naverLogin = new naver.LoginWithNaverId({
		clientId : "9N2m3BOpk_HOvgVlJP0X",
		callbackUrl : "http://localhost:8088/BabPool/main",
		isPopup : false,
		callbackHandle : true
	/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
	});

	/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
	naverLogin.init();

	/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
	window
			.addEventListener(
					'load',
					function() {
						naverLogin
								.getLoginStatus(function(status) {
									if (status) {
										/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
										var email = naverLogin.user.getEmail();
										if (email == undefined || email == null) {
											alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
											/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
											naverLogin.reprompt();
											return;
										}

										window.location
												.replace("http://"
														+ window.location.hostname
														+ ((location.port == "" || location.port == undefined) ? ""
																: ":"
																		+ location.port)
														+ "localhost:8088/BabPool/main");
										/* 인증이 완료된후 /sample/main.html 페이지로 이동하라는것이다. 본인 페이로 수정해야한다. */
									} else {
										console.log("callback 처리에 실패하였습니다.");
									}
								});
					});

	var naver_id_login = new naver_id_login("9N2m3BOpk_HOvgVlJP0X",
			"http://localhost:8088/BabPool/main"); // 역시 마찬가지로 'localhost'가 포함된 CallBack URL
			 var naver_id_login = new naver_id_login("9N2m3BOpk_HOvgVlJP0X", "http://localhost:8088/BabPool/main"); // 역시 마찬가지로 'localhost'가 포함된 CallBack URL
		        
		        // 접근 토큰 값 출력
		        alert(naver_id_login.oauthParams.access_token);
		        
		        // 네이버 사용자 프로필 조회
		        naver_id_login.get_naver_userprofile("naverSignInCallback()");
		        
		        // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		        function naverSignInCallback() {
		            alert(naver_id_login.getProfileData('email'));
		            alert(naver_id_login.getProfileData('nickname'));
		            alert(naver_id_login.getProfileData('age'));
		        }


</script>

</html>