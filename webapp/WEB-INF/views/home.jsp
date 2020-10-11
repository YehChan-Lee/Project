<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script src="http://code.jquery.com/jquery.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="${path}/res/css/home.css?ver=1"/>" />
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
</head>
<script>
	$(document).ready(function() {
		body.click = 0;
		$(".area>.body").click(function(e) {
			e.stopPropagation();
			if (body.click == 0) {
				$(this).closest(".area").children("ul").show();
				body.click = 1;
			} else {
				$(this).closest(".area").children("ul").hide();
				body.click = 0;
			}
		})

		$("html").click(function(e) {
			e.stopPropagation();
			if (body.click == 1) {
				$(".area>.body").closest(".area").children("ul").hide();
				body.click = 0;
			}
		})

	});
</script>
<body>
	<div id="banner"
		style="background-image: url(<c:url value="${path}/res/image/home/new_banner.png"/>)">
		<a href="main" class="homelogo"><img
					src="<c:url value="${path}/res/image/logo.png"/>" height="40px"></a>
		<ul class="homeul">
			<%
				if (session.getAttribute("sessionID") == null) {
			%>
			<li class="homeli nav_login">로그인</li>
			<li class="homeli nav_join">회원가입</li>
			<%
				} else {
			%>
			<li class="homeli" id="nav_logout">로그아웃</li>
			<%
				}
			%>
		</ul>
		<p class="homep">맛있는 발견의 즐거움</p>
		<p class="homep2">최고의 미식 가이드, 밥풀</p>
	</div>

	<div id="content">
		<div id="section main">
			<P>밥풀과 떠나는 국내 미식 투어</P>
			<P>미식의 시작, 밥풀과 함께 하세요.</P>
		</div>
		<div id="body">
			<div id="elements">
				<a href="https://www.naver.com/"><img
					src="<c:url value="${path}/res/image/home/seoul.png"/>"
					class="element1" /> <span class="contentspan1">서울 / 수도권</span><span
					class="contentspanseoul">SEOUL / ARROUND SEOUL</span> </a> <a
					href="https://www.naver.com/"><img
					src="<c:url value="${path}/res/image/home/busan.png"/>"
					class="element2" /> <span class="contentspan2">부산</span><span
					class="contentbusan">BUSAN</span> </a> <a href="https://www.naver.com/"><img
					src="<c:url value="${path}/res/image/home/jeju.png"/>"
					class="element3" /> <span class="contentspan3">제주</span><span
					class="contentjeju">JEJU</span> </a>
			</div>
			<div id="elements2">
				<a href="https://www.naver.com/"><img
					src="<c:url value="${path}/res/image/home/daegu.png"/>"
					class="element4" /> <span class="contentspan4">대구</span><span
					class="contentspandaegu">DAEGU</span> </a> <a
					href="https://www.naver.com/"><img
					src="<c:url value="${path}/res/image/home/daejeon.png"/>"
					class="element5" /> <span class="contentspan5">대전</span><span
					class="contentspandaejeon">DAEJEON</span> </a> <a
					href="https://www.naver.com/"><img
					src="<c:url value="${path}/res/image/home/gwangju.png"/>"
					class="element6" /> <span class="contentspan6">광주</span><span
					class="contentspangwangju">GWANGJU</span> </a> <a
					href="https://www.naver.com/"><img
					src="<c:url value="${path}/res/image/home/jeonju.png"/>"
					class="element7" /> <span class="contentspan7">전주</span><span
					class="contentspanjeonju">JEONJU</span></a>
			</div>


		</div>

		<div id="nav_shading" class="shading_bg scroll_enable"></div>


		<div id="popup_body">
			<div id="naverIdLogin"></div>
			<!-- 로그인 팝업 -->
			<div id="login_body">
				<form action="login" id="form" method="post" name="form"
					class="loginform">
					<input type="hidden" name="login_type" value="2"> <img
						src="<c:url value="${path}/res/image/close.jpg"/>"
						class="popup_close" />
					<h2 class="loginh2">로그인</h2>
					<hr class="loginhr1">
					<input id="email" name="email" placeholder="   Email" type="text">
					<input id="password" name="password" placeholder="   password"
						type="password"> <a href="javascript:%20check_empty()"
						id="submit">로그인</a>
					<div id="pwSearch">비밀번호 찾기</div>
					<div id="idSearch">아이디 찾기</div>

					<div class="logingmail" id="logingmail">G-Mail 로그인</div>

					<hr class="loginhr2">
					<div class="nav_join" id="nav_join">회원가입</div>
				</form>
			</div>

			<!-- 회원가입 팝업 -->
			<div id="join_body">
				<img src="<c:url value="${path}/res/image/close.jpg"/>"
					class="popup_close" />
				<h2 id="join_h2">회원가입</h2>
				<hr id="join_hr">

				<div id="join_gmail">G-Mail로 간편하게 가입하기</div>
				<div id="join_email">이메일로 가입하기</div>
				<span class="loginreadyspan">이미 회원이신가요?</span>
				<hr class="loginhr">
				<div class="nav_login" id="nav_login">로그인</div>
			</div>

			<!-- 회원가입2 팝업 -->
			<div id="join2_body">
				<img src="<c:url value="${path}/res/image/close.jpg"/>"
					class="popup_close" /> <img
					src="<c:url value="${path}/res/image/welcome.png"/>"
					class="firstsignupdivimg"> <span class="firstsignupspan0">밥풀에
					오신걸 환영합니다!</span>
				<hr class="firstsignuphr">
				<div class="firstsignupdiv1">
					<form action="signup" id="join_form" method="post">
						<input type="hidden" name="join_type" value="1">
						<div class="firstsignupdiv2" onclick="join()">
							<img src="<c:url value="${path}/res/image/buisness.png"/>"
								class="firstsignupdiv2img"> <span
								class="firstsignupdiv2span">일반회원</span> <span
								class="firstsignupdiv2span2">일반회원으로 홈페이지 이용하기</span>
						</div>
						<div class="firstsignupdiv3" onclick="join2()">
							<img src="<c:url value="${path}/res/image/profile2.png"/>"
								class="firstsignupdiv3img"> <span
								class="firstsignupdiv2span">사업자 회원</span> <span
								class="firstsignupdiv3span3">사업자회원으로 홈페이지 이용하기</span>
						</div>
					</form>
				</div>
			</div>
			<!-- 아이디 찾기 -->
			<div id="idsearch_body">
				<img src="<c:url value="${path}/res/image/close.jpg"/>"
					class="popup_close" />
				<h2 class="idsearchh2">아이디 찾기</h2>
				<hr id="idsearch_hr">
				<div class="idsearch_body_span">밥풀ID 찾기를 위한 개인정보를 입력해주세요</div>
				<div class="idsearch_body_span2">이름</div>
				<input type="text" class="idsearch_name">
				<div class="idsearch_body_span3">핸드폰 번호</div>
				<input type="text" class="idsearch_phone">
				<div class="finddiv">아이디 찾기</div>
			</div>
			<!-- 비밀번호 찾기 -->
			<div id="passwordsearch_body">
				<img src="<c:url value="${path}/res/image/close.jpg"/>"
					class="popup_close" />
				<h2 class="idsearchh2">비밀번호 찾기</h2>
				<hr id="idsearch_hr">
				<div class="pwsearch_body_span">가입하신 계정의 이메일을 입력해주세요.</div>
				<div class="pwsearch_body_span2">임의로 설정된 새로운 비밀번호가 메일로 전송됩니다</div>
				<input type="text" class="pwsearch_name" placeholder="  Email">
				<div class="finddiv2">비밀번호 찾기</div>
			</div>

		</div>
		<script>
			var lastSearchRequest = 0;
			var loadingTimeout = null;
			/* var auto_complete_cursor = 0; */
			function startLoading() {
				if (loadingTimeout == null) {
					loadingTimeout = setTimeout(function() {
						/* $("#nav_city>ul").hide(); */
						/*$("#nav_search>#nav_recommend").hide(); */
						$("#loadingBox").show();
					}, 1000);
				}
			}
			function endLoading() {
				clearTimeout(loadingTimeout);
				loadingTimeout = null;
				$("#loadingBox").hide();
			}
			window.onbeforeunload = function(e) {
				// check condition
				$("#loadingBox").show();
			};
			$(document).ajaxStart(function() {
				startLoading();
			});
			$(document).ajaxStop(function() {
				if ($.active == 0) {
					endLoading();
				}
			});

			var auto_complete_cursor = 0;

			$(".shading_bg").click(function() {
				$("#nav_city>ul").hide();
				$("#nav_shading.shading_bg").hide();
				$("#nav_area>.box").hide();
				$("#nav_genre>.box").hide();
				$("#nav_search>#nav_recommend").hide();
				$("#popup_body").hide();
				/* auto_complete_cursor = -1; */
			});

			//팝업 닫기
			$(".popup_close").click(function() {
				$("#nav_city>ul").hide();
				$("#nav_shading.shading_bg").hide();
				$("#nav_area>.box").hide();
				$("#nav_genre>.box").hide();
				$("#nav_search>#nav_recommend").hide();
				$("#popup_body").hide();
				$("#nav_btn").siblings().removeClass('focus');
			});

			//로그인 팝업
			$(".nav_login").click(function() {

				$("#join_body").hide();
				$("#join2_body").hide();
				$("#idsearch_body").hide();
				$("#passwordsearch_body").hide();

				$("#login_body").show();
				$("#popup_body").show();
				$("#naverIdLogin").show();
				$("#nav_shading.shading_bg").show();

				$("#nav_btn").siblings().removeClass('focus');

				$('#popup_body').css('width', 404 + 'px');
				$('#popup_body').css('height', 554 + 'px');

				$("#naverIdLogin").css('top', 0);

				$('.popup_close').css('top', -10 + 'vh');
				$('.popup_close').css('left', 80 + '%');

			});

			//회원가입 팝업
			$(".nav_join").click(function() {

				$("#login_body").hide();
				$("#join2_body").hide();
				$("#idsearch_body").hide();
				$("#passwordsearch_body").hide();

				$("#join_body").show();
				$("#popup_body").show();
				$("#naverIdLogin").show();
				$("#nav_shading.shading_bg").show();

				$("#nav_btn").siblings().removeClass('focus');

				$('#popup_body').css('width', 404 + 'px');
				$('#popup_body').css('height', 524 + 'px');

				$("#naverIdLogin").css('top', -200 + 'px');

				$('.popup_close').css('top', -11.85 + 'vh');
				$('.popup_close').css('left', 79.4 + '%');

			});

			//회원가입2 팝업
			$("#join_email").click(function() {

				$("#login_body").hide();
				$("#join_body").hide();
				$("#idsearch_body").hide();
				$("#passwordsearch_body").hide();
				$("#naverIdLogin").hide();

				$("#join2_body").show();
				$("#popup_body").show();
				$("#nav_shading.shading_bg").show();
				$("#nav_btn").siblings().removeClass('focus');

				$('#popup_body').css('width', 404 + 'px');
				$('#popup_body').css('height', 524 + 'px');

				$('.popup_close').css('top', -40 + 'px');
				$('.popup_close').css('left', 92.4 + '%');

			});
			//아이디 찾기 팝업
			$("#idSearch").click(function() {

				$("#login_body").hide();
				$("#join_body").hide();
				$("#join2_body").hide();
				$("#naverIdLogin").hide();
				$("#passwordsearch_body").hide();

				$("#idsearch_body").show();
				$("#popup_body").show();
				$("#nav_shading.shading_bg").show();

				$("#nav_btn").siblings().removeClass('focus');

				$('#popup_body').css('width', 404 + 'px');
				$('#popup_body').css('height', 450 + 'px');

				$('.popup_close').css('top', -40 + 'px');
				$('.popup_close').css('left', 92.4 + '%');

			});
			//비밀번호 찾기 팝업
			$("#pwSearch").click(function() {
				$("#naverIdLogin").hide();
				$("#login_body").hide();
				$("#join_body").hide();
				$("#join2_body").hide();
				$("#idsearch_body").hide();

				$("#passwordsearch_body").show();
				$("#popup_body").show();
				$("#nav_shading.shading_bg").show();

				$("#nav_btn").siblings().removeClass('focus');

				$('#popup_body').css('width', 404 + 'px');
				$('#popup_body').css('height', 350 + 'px');

				$('.popup_close').css('top', -40 + 'px');
				$('.popup_close').css('left', 92.4 + '%');

			});

			//로그인 관련
			function check_empty() {
				if (document.getElementById('email').value == "") {
					alert("이메일을 확인해 주세요!");
				} else if (document.getElementById('password').value == "") {
					alert("비밀번호를 확인해 주세요!");
				} else {
					var action = $('#form').attr("action");

					var form_data = {
						user_id : $('#email').val(),
						user_pw : $('#password').val()
					};

					$.ajax({
						type : "POST",
						url : action,
						data : form_data,
						success : function(data) {
							if (data == "success") {
								window.location.href = "main"
							} else {
								alert("아이디 또는 비밀번호를 잘못 입력하였습니다");
							}
						},
						error : function() {
							alert("에러발생");
						}

					});
				}
			}

			//로그아웃 관련
			$("#nav_logout").on("click", function() {
				location.href = "logout";
			});

			//회원가입 관련
			function join() {
				document.getElementById('join_form').submit();
			}
			function join2() {
				$("input[type=hidden][name=join_type]").val("2");
				document.getElementById('join_form').submit();
			}

			//네이버 로그인 API 관련
			var naverLogin = new naver.LoginWithNaverId({
				clientId : "9N2m3BOpk_HOvgVlJP0X",
				callbackUrl : "http://localhost:8088/hellospring/main",
				isPopup : false, /* 팝업을 통한 연동처리 여부 */
				loginButton : {
					color : "green",
					type : 3,
					height : 60
				}
			/* 로그인 버튼의 타입을 지정 */
			});

			/* 설정정보를 초기화하고 연동을 준비 */
			naverLogin.init();
		</script>

		<%@include file="footer.jsp"%>
</body>
</html>