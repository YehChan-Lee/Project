
<%@page import="com.javaex.model.ShopVo"%>
<%@page import="com.javaex.controller.ListController"%>
<%@page import="java.util.List"%>
<%@page import="com.javaex.model.ReservationVo"%>
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
	href="<c:url value="${path}/res/css/top_bar.css?ver=1"/>" />
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
</head>
<body>

	<!-- body wrap -->
	<div id="wrap" class="">
		<!-- header -->
		<!-- <div id="header"> -->

		<!-- navgation -->
		<div id="nav_wrap_shading"></div>
		<div id="nav_wrap" class="fixed">
			<!-- <div class="container_wrap"> -->
			<div id="nav_container" class="fixed">
				<div id="nav_shading" class="shading_bg scroll_enable"></div>
				<!-- logo section -->
				<a id="nav_logo" href="main"><img
					src="<c:url value="${path}/res/image/logo.png"/>" height="40px">
				</a>
				<%-- 				<div id="nav_city">
					<span>서울 / 수도권</span> <img
						src="<c:url value="${path}/res/image/arrow_w.png"/>" height="15px"
						width="15px">
					<ul>
						<li data-city="seoul" data-enable="true">서울 / 수도권</li>
						<li data-city="busan" data-enable="true">부산</li>
						<li data-city="jeju" data-enable="true">제주</li>
						<li data-city="daegu" data-enable="true">대구</li>
						<li data-city="daejeon" data-enable="true">대전 / 세종</li>
						<li data-city="gwangju" data-enable="true">광주</li>
						<li data-city="jeonju" data-enable="false">전주</li>
						<li data-city="ulsan" data-enable="false">울산</li>
					</ul>
				</div> --%>

				<!-- area search section -->
				<form action="list">
					<div id="nav_area" class="search sel">
						<div class="input">
							<div class="selected">지역 선택</div>
							<img src="<c:url value="${path}/res/image/arrow_y.png"/>"
								height="15px">
						</div>
						<div class="box">
							<ul class="district">
								<!-- <li data-dist="popularity">인기지역<span>></span></li> -->
								<li data-dist="seoul">서울<span>></span></li>
								<li data-dist="incheon">인천<span>></span></li>
								<li data-dist="gyeonggi">경기<span>></span></li>
							</ul>
							<div class="neighborhood">
								<!--<ul class="content scroll" data-dist="popularity">
									<li><input type="checkbox" value="1892" id="popularity01">
										<label for="popularity01">가로수길</label></li>
									<li><input type="checkbox" value="1896" id="popularity02">
										<label for="popularity02">강남역</label></li>
									<li><input type="checkbox" value="1900" id="popularity03">
										<label for="popularity03">건대</label></li>
									<li><input type="checkbox" value="1904" id="popularity04">
										<label for="popularity04">경리단길</label></li>
									<li><input type="checkbox" value="1908" id="popularity05">
										<label for="popularity05">광화문</label></li>
									<li><input type="checkbox" value="1912" id="popularity06">
										<label for="popularity06">남양주</label></li>
									<li><input type="checkbox" value="1916" id="popularity07">
										<label for="popularity07">대학로</label></li>
									<li><input type="checkbox" value="1920" id="popularity08">
										<label for="popularity08">망원</label></li>
									<li><input type="checkbox" value="1924" id="popularity09">
										<label for="popularity09">명동</label></li>
									<li><input type="checkbox" value="1928" id="popularity10">
										<label for="popularity10">문래</label></li>
									<li><input type="checkbox" value="1932" id="popularity11">
										<label for="popularity11">북촌</label></li>
									<li><input type="checkbox" value="2016" id="popularity12">
										<label for="popularity12">분당</label></li>
									<li><input type="checkbox" value="1936" id="popularity13">
										<label for="popularity13">상수</label></li>
									<li><input type="checkbox" value="1944" id="popularity14">
										<label for="popularity14">샤로수길</label></li>
									<li><input type="checkbox" value="1948" id="popularity15">
										<label for="popularity15">서래마을</label></li>
									<li><input type="checkbox" value="1952" id="popularity16">
										<label for="popularity16">서촌</label></li>
									<li><input type="checkbox" value="1956" id="popularity17">
										<label for="popularity17">성수</label></li>
									<li><input type="checkbox" value="1960" id="popularity18">
										<label for="popularity18">송도</label></li>
									<li><input type="checkbox" value="1964" id="popularity19">
										<label for="popularity19">압구정</label></li>
									<li><input type="checkbox" value="1968" id="popularity20">
										<label for="popularity20">양재</label></li>
									<li><input type="checkbox" value="1972" id="popularity21">
										<label for="popularity21">양평</label></li>
									<li><input type="checkbox" value="1976" id="popularity22">
										<label for="popularity22">여의도</label></li>
									<li><input type="checkbox" value="1980" id="popularity23">
										<label for="popularity23">연남</label></li>
									<li><input type="checkbox" value="1984" id="popularity24">
										<label for="popularity24">을지로</label></li>
									<li><input type="checkbox" value="1988" id="popularity25">
										<label for="popularity25">이태원</label></li>
									<li><input type="checkbox" value="1992" id="popularity26">
										<label for="popularity26">익선동</label></li>
									<li><input type="checkbox" value="1996" id="popularity27">
										<label for="popularity27">인사동</label></li>
									<li><input type="checkbox" value="2000" id="popularity28">
										<label for="popularity28">일산</label></li>
									<li><input type="checkbox" value="2004" id="popularity29">
										<label for="popularity29">잠실</label></li>
									<li><input type="checkbox" value="2008" id="popularity30">
										<label for="popularity30">종로</label></li>
									<li><input type="checkbox" value="2012" id="popularity31">
										<label for="popularity31">청담동</label></li>
									<li><input type="checkbox" value="2020" id="popularity32">
										<label for="popularity32">한남동</label></li>
									<li><input type="checkbox" value="1940" id="popularity33">
										<label for="popularity33">합정</label></li>
									<li><input type="checkbox" value="2024" id="popularity34">
										<label for="popularity34">해방촌</label></li>
									<li><input type="checkbox" value="2028" id="popularity35">
										<label for="popularity35">홍대</label></li>
								</ul> -->
								<ul class="content scroll" data-dist="seoul">
									<li><input type="checkbox" value="강남구" name="shop_addr"
										id="seoul01"> <label for="seoul01">강남구</label></li>
									<li><input type="checkbox" value="강동구" name="shop_addr"
										id="seoul02"> <label for="seoul02">강동구</label></li>
									<li><input type="checkbox" value="강북구" name="shop_addr"
										id="seoul03"> <label for="seoul03">강북구</label></li>
									<li><input type="checkbox" value="강서구" name="shop_addr"
										id="seoul04"> <label for="seoul04">강서구</label></li>
									<li><input type="checkbox" value="관악구" name="shop_addr"
										id="seoul05"> <label for="seoul05">관악구</label></li>
									<li><input type="checkbox" value="광진구" name="shop_addr"
										id="seoul06"> <label for="seoul06">광진구</label></li>
									<li><input type="checkbox" value="구로구" name="shop_addr"
										id="seoul07"> <label for="seoul07">구로구</label></li>
									<li><input type="checkbox" value="금천구" name="shop_addr"
										id="seoul08"> <label for="seoul08">금천구</label></li>
									<li><input type="checkbox" value="노원구" name="shop_addr"
										id="seoul09"> <label for="seoul09">노원구</label></li>
									<li><input type="checkbox" value="도봉구" name="shop_addr"
										id="seoul10"> <label for="seoul10">도봉구</label></li>
									<li><input type="checkbox" value="동대문구" name="shop_addr"
										id="seoul11"> <label for="seoul11">동대문구</label></li>
									<li><input type="checkbox" value="동작구" name="shop_addr"
										id="seoul12"> <label for="seoul12">동작구</label></li>
									<li><input type="checkbox" value="마포구" name="shop_addr"
										id="seoul13"> <label for="seoul13">마포구</label></li>
									<li><input type="checkbox" value="서대문구" name="shop_addr"
										id="seoul14"> <label for="seoul14">서대문구</label></li>
									<li><input type="checkbox" value="서초구" name="shop_addr"
										id="seoul15"> <label for="seoul15">서초구</label></li>
									<li><input type="checkbox" value="성동구" name="shop_addr"
										id="seoul16"> <label for="seoul16">성동구</label></li>
									<li><input type="checkbox" value="성북구" name="shop_addr"
										id="seoul17"> <label for="seoul17">성북구</label></li>
									<li><input type="checkbox" value="송파구" name="shop_addr"
										id="seoul18"> <label for="seoul18">송파구</label></li>
									<li><input type="checkbox" value="양천구" name="shop_addr"
										id="seoul19"> <label for="seoul19">양천구</label></li>
									<li><input type="checkbox" value="영등포구" name="shop_addr"
										id="seoul20"> <label for="seoul20">영등포구</label></li>
									<li><input type="checkbox" value="용산구" name="shop_addr"
										id="seoul21"> <label for="seoul21">용산구</label></li>
									<li><input type="checkbox" value="은평구" name="shop_addr"
										id="seoul22"> <label for="seoul22">은평구</label></li>
									<li><input type="checkbox" value="종로구" name="shop_addr"
										id="seoul23"> <label for="seoul23">종로구</label></li>
									<li><input type="checkbox" value="중구" name="shop_addr"
										id="seoul24"> <label for="seoul24">중구</label></li>
									<li><input type="checkbox" value="중랑구" name="shop_addr"
										id="seoul25"> <label for="seoul25">중랑구</label></li>
								</ul>
								<ul class="content scroll" data-dist="incheon">
									<li><input type="checkbox" value="강화군" name="shop_addr"
										id="incheon01"> <label for="incheon01">강화군</label></li>
									<li><input type="checkbox" value="남동구" name="shop_addr"
										id="incheon02"> <label for="incheon02">남동구</label></li>
									<li><input type="checkbox" value="미추홀구" name="shop_addr"
										id="incheon03"> <label for="incheon03">미추홀구</label></li>
									<li><input type="checkbox" value="부평구" name="shop_addr"
										id="incheon04"> <label for="incheon04">부평구</label></li>
									<li><input type="checkbox" value="서구" name="shop_addr"
										id="incheon05"> <label for="incheon05">서구</label></li>
									<li><input type="checkbox" value="연수구" name="shop_addr"
										id="incheon06"> <label for="incheon06">연수구</label></li>
									<li><input type="checkbox" value="중구" name="shop_addr"
										id="incheon07"> <label for="incheon07">중구</label></li>
								</ul>
								<ul class="content scroll" data-dist="gyeonggi">
									<li><input type="checkbox" value="가평군" name="shop_addr"
										id="gyeonggi01"> <label for="gyeonggi01">가평군</label></li>
									<li><input type="checkbox" value="고양시" name="shop_addr"
										id="gyeonggi02"> <label for="gyeonggi02">고양시</label></li>
									<li><input type="checkbox" value="과천시" name="shop_addr"
										id="gyeonggi03"> <label for="gyeonggi03">과천시</label></li>
									<li><input type="checkbox" value="광명시" name="shop_addr"
										id="gyeonggi04"> <label for="gyeonggi04">광명시</label></li>
									<li><input type="checkbox" value="광주시" name="shop_addr"
										id="gyeonggi05"> <label for="gyeonggi05">광주시</label></li>
									<li><input type="checkbox" value="군포시" name="shop_addr"
										id="gyeonggi06"> <label for="gyeonggi06">군포시</label></li>
									<li><input type="checkbox" value="김포시" name="shop_addr"
										id="gyeonggi07"> <label for="gyeonggi07">김포시</label></li>
									<li><input type="checkbox" value="남양주시" name="shop_addr"
										id="gyeonggi08"> <label for="gyeonggi08">남양주시</label></li>
									<li><input type="checkbox" value="동두천시" name="shop_addr"
										id="gyeonggi09"> <label for="gyeonggi09">동두천시</label></li>
									<li><input type="checkbox" value="성남시" name="shop_addr"
										id="gyeonggi10"> <label for="gyeonggi10">성남시</label></li>
									<li><input type="checkbox" value="수원시" name="shop_addr"
										id="gyeonggi11"> <label for="gyeonggi11">수원시</label></li>
									<li><input type="checkbox" value="시흥시" name="shop_addr"
										id="gyeonggi12"> <label for="gyeonggi12">시흥시</label></li>
									<li><input type="checkbox" value="안산시" name="shop_addr"
										id="gyeonggi13"> <label for="gyeonggi13">안산시</label></li>
									<li><input type="checkbox" value="안성시" name="shop_addr"
										id="gyeonggi14"> <label for="gyeonggi14">안성시</label></li>
									<li><input type="checkbox" value="안양시" name="shop_addr"
										id="gyeonggi15"> <label for="gyeonggi15">안양시</label></li>
									<li><input type="checkbox" value="양주시" name="shop_addr"
										id="gyeonggi16"> <label for="gyeonggi16">양주시</label></li>
									<li><input type="checkbox" value="양평군" name="shop_addr"
										id="gyeonggi17"> <label for="gyeonggi17">양평군</label></li>
									<li><input type="checkbox" value="여주시" name="shop_addr"
										id="gyeonggi18"> <label for="gyeonggi18">여주시</label></li>
									<li><input type="checkbox" value="연천군" name="shop_addr"
										id="gyeonggi19"> <label for="gyeonggi19">연천군</label></li>
									<li><input type="checkbox" value="오산시" name="shop_addr"
										id="gyeonggi20"> <label for="gyeonggi20">오산시</label></li>
									<li><input type="checkbox" value="용인시" name="shop_addr"
										id="gyeonggi21"> <label for="gyeonggi21">용인시</label></li>
									<li><input type="checkbox" value="의왕시" name="shop_addr"
										id="gyeonggi22"> <label for="gyeonggi22">의왕시</label></li>
									<li><input type="checkbox" value="의정부시" name="shop_addr"
										id="gyeonggi23"> <label for="gyeonggi23">의정부시</label></li>
									<li><input type="checkbox" value="이천시" name="shop_addr"
										id="gyeonggi24"> <label for="gyeonggi24">이천시</label></li>
									<li><input type="checkbox" value="파주시" name="shop_addr"
										id="gyeonggi25"> <label for="gyeonggi25">파주시</label></li>
									<li><input type="checkbox" value="평택시" name="shop_addr"
										id="gyeonggi26"> <label for="gyeonggi26">평택시</label></li>
									<li><input type="checkbox" value="포천시" name="shop_addr"
										id="gyeonggi27"> <label for="gyeonggi27">포천시</label></li>
									<li><input type="checkbox" value="하남시" name="shop_addr"
										id="gyeonggi28"> <label for="gyeonggi28">하남시</label></li>
								</ul>
							</div>
							<button class="confirm_red" type="button">확인</button>
						</div>
					</div>
					<!-- genre search section -->
					<div id="nav_genre" class="search sel">
						<div class="input">
							<div class="selected">음식 종류 선택</div>
							<img src="<c:url value="${path}/res/image/arrow_y.png"/>"
								height="15px">
						</div>
						<div class="box">
							<ul class="foods content">
								<li><input type="checkbox" value="한식" name="food_type"
									id="8"><label for="8">한식</label></li>
								<li><input type="checkbox" value="양식" name="food_type"
									id="11"><label for="11">양식</label></li>
								<li><input type="checkbox" value="중식" name="food_type"
									id="23"><label for="23">중식</label></li>
								<li><input type="checkbox" value="일식" name="food_type"
									id="12"><label for="12">일식</label></li>
								<li><input type="checkbox" value="아시아식" name="food_type"
									id="55"><label for="55">아시아식</label></li>
								<li><input type="checkbox" value="뷔페" name="food_type"
									id="24"><label for="24">뷔페</label></li>
								<li><input type="checkbox" value="구이" name="food_type"
									id="25"><label for="25">구이</label></li>
								<li><input type="checkbox" value="술집" name="food_type"
									id="9"><label for="9">술집</label></li>
								<li><input type="checkbox" value="카페/베이커리" name="food_type"
									id="59"><label for="59">카페/베이커리</label></li>
							</ul>
							<button class="confirm_red" type="button">확인</button>
						</div>
					</div>

					<!-- keyword search section -->
					<div id="nav_search" class="search box">
						<div id="search_img_box">
							<img src="<c:url value="${path}/res/image/loupe_g.png"/>"
								width="20px" height="20px">
						</div>
						<input type="text" class="border_radius soft" value=""
							name="string_search" autocomplete="off">

						<!-- <img id="nav_loader" src="https://c1.poing.co.kr/original/images/nav_loader.gif"> -->

						<!-- recommend section -->
						<div id="nav_recommend" class="border_radius soft">
							<!-- 							<ul class="keyword">
								<li class="title">인기 검색어</li>
								<li class="item" id="search1"><i class="icon number1"></i>
									<span class="area">스시</span></li>
								<li class="item" id="search2"><i class="icon number2"></i>
									<span class="area">한식</span></li>
								<li class="item" id="search3"><i class="icon number3"></i>
									<span class="area">수도권</span></li>
							</ul> -->
							<ul class="recent">
								<li class="title">최근 본 매장</li>
								<%
									if (session.getAttribute("sessionID") == null) {
								%>
								<p style="height: 58px">로그인 시 최근 본 매장이 표시됩니다</p>
								<p>해시태그를 통해서도 검색 가능합니다</p>
								<%
									} else if (session.getAttribute("shop_title") == null) {
								%>
								<p>최근 본 매장이 없습니다</p>
								<p>해시태그를 통해 검색해 보세요!</p>
								<%
									} else {
								%>
								<a href="detail?shopidx=<%=session.getAttribute("shop_idx")%>"><li>
										<p><%=session.getAttribute("shop_title")%></p>
										<p><%=session.getAttribute("food_type")%></p>
										<p><%=session.getAttribute("shop_addr")%></p>
								</li></a>
								<%
									}
								%>
							</ul>
						</div>

						<!-- auto_complete section -->
						<!-- <div id="nav_auto_complete" class="border_radius soft"></div> -->
					</div>
					<input type="submit" value="검색" id="nav_btn" class="search">
				</form>

				<!-- account section 로그인 전-->
				<%
					if (session.getAttribute("sessionID") == null) {
					pageContext.setAttribute("shop_id", "");
				%>
				<div id="nav_account">
					<div id="nav_guest">
						<span class="nav_login" style="cursor: pointer;">로그인</span>
						&nbsp;|&nbsp; <span class="nav_join" style="cursor: pointer;">회원가입</span>
					</div>
				</div>
				<%
					} else {
				%>
				<!-- account section 로그인 후-->
				<div id="nav_account2">
					<div id="nav_notice" class="underline">
						<img src="<c:url value="${path}/res/image/bell.png"/>"
							height="33px">
					</div>
					<div id="nav_notice_list" class="border_radius soft">
						<div id="nav_notice_list_tab">
							소식 <span> <span> <span id="nav_mynews_btn">내
										소식</span>
							</span> <span> <span id="nav_news_btn">밥풀 알림</span>
							</span>
							</span>
						</div>
						<div id="nav_notice_list_content">
							<div id="nav_mynews_list">
								<div class="item blank">
									<div class="thumbnail">
										<div class="image border_radius">
											<img src="<c:url value="${path}/res/image/user2.png"/>"
												height="40px" />
										</div>
									</div>
									<div class="message">내 소식이 없습니다.</div>
								</div>
								<div id="nav_news_list"></div>
							</div>
							<div id="nav_notice_list_all">모든 소식보기</div>
						</div>
					</div>

					<div id="nav_profile">
						<%
							if (session.getAttribute("is_owner").equals("0")) {
						%>
						<a href="mypage"> <img
							src="<c:url value="${path}/res/image/user2.png"/>" height="32px">
						</a>
						<%
							} else {
						pageContext.setAttribute("shop_id", session.getAttribute("shop_id"));
						%>
						<a href="buisnessmypage"> <img
							src="<c:url value="${path}/res/image/user2.png"/>" height="32px">
						</a>
						<%
							}
						%>
						<div id="nav_profile_list" class="border_radius soft">
							<div class="item" data-link="">예약</div>
							<div class="item" data-link="">설정</div>
							<div id="nav_logout" class="item">로그아웃</div>
						</div>
					</div>
				</div>
				<%
					}
				%>
				<!-- account section 끝-->
			</div>
		</div>
	</div>
	<!-- </div> -->

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
		<form action="findemail" method="post">
			<div id="idsearch_body">
				<img src="<c:url value="${path}/res/image/close.jpg"/>"
					class="popup_close" />
				<h2 class="idsearchh2">아이디 찾기</h2>
				<hr id="idsearch_hr">
				<div class="idsearch_body_span">밥풀ID 찾기를 위한 개인정보를 입력해주세요</div>
				<div class="idsearch_body_span2">이름</div>
				<input type="text" class="idsearch_name" name="find_email">
				<div class="idsearch_body_span3">핸드폰 번호</div>
				<input type="text" class="idsearch_phone" name="find_phone">
				<input type="submit" class="finddiv" value="아이디 찾기">
			</div>
		</form>
		<!-- 비밀번호 찾기 -->
		<div id="passwordsearch_body">
			<img src="<c:url value="${path}/res/image/close.jpg"/>"
				class="popup_close" />
			<h2 class="idsearchh2">비밀번호 찾기</h2>
			<hr id="idsearch_hr">
			<div class="pwsearch_body_span">가입하신 계정의 이메일을 입력해주세요.</div>
			<div class="pwsearch_body_span2">임의로 설정된 새로운 비밀번호가 메일로 전송됩니다</div>
			<div class="repassword_span">비밀번호를 재설정 해주세요</div>
			<input type="text" class="pwsearch_name" placeholder="  Email">
			<input type="text" class="email_number">
			<button class="email_number_submit" onclick="passclick2();">인증</button>
				<div class="finddiv2" onclick="passclick();">비밀번호 찾기</div>
			
			
				<input type="text" class="repassword" name="repassword"  placeholder="  비밀번호 입력"> 
				<input type="text" class="repassword2" name="repassword2" placeholder="  비밀번호 확인"> 
				<input type="submit" class="repassword_submit" value="비밀번호 재설정" onclick="password_update();">
			
		
		</div>

	</div>

	<i id="loadingBox" class="image"
		style="display:none; 
        z-index:10000; 
        position:fixed; 
        top:0px; 
        left:0px;
        width:100%; 
        height:100%; 
        background: url(<c:url value="${path}/res/image/loading.gif"/>) no-repeat center center black; 
        opacity:0.6;
        filter: alpha(opacity=60);"></i>

	<script src="http://code.jquery.com/jquery.js"></script>
	<script>
		// 아이디 찾기 
		$('.finddiv').click(function(e) {
			idSearch()
			e.preventDefault();
			//console.log($(".idsearch_name").val(), $(".idsearch_phone").val())
		});

		function password_update() {
			$.ajax({
				type : "POST",
				url : "pwupdate",
				data : {
					pwsearch_email : $(".pwsearch_name").val(),
					repassword :  $(".repassword").val(),
					repassword2 : $(".repassword2").val()
				},
				success : function(data) {
					if (data == "success") {
						alert("변경완료");
						window.location.reload()
					} else if (data == "fail") {
						alert("두 비밀번호가 일치하지 않습니다")
						$(".repassword").val("");
						$(".repassword2").val("");
					}
				},
				error : function() {
				}
			});
		}
		
		function passclick2() {
			$.ajax({
				type : "POST",
				url : "pwSearch2",
				data : {
					email_number : $(".email_number").val()
				},
				success : function(data) {
					if (data == "fail") {
						alert("인증번호가 다릅니다")
					} else {
						alert("인증에 성공하였습니다");

						$('.pwsearch_body_span').css('display', 'none');
						$('.pwsearch_body_span2').css('display', 'none');
						$('.pwsearch_name').css('display', 'none');
						$('.email_number').css('display', 'none');
						$('.email_number_submit').css('display', 'none');
						$('.repassword_span').css('display', 'inline-block');
						$('.repassword').css('display', 'inline-block');
						$('.repassword2').css('display', 'inline-block');
						$('.repassword_submit').css('display', 'inline-block');
						
					}
				},
				error : function() {
				}
			});
		}

		function passclick() {
			$.ajax({
				type : "POST",
				url : "pwSearch",
				data : {
					pwsearch_email : $(".pwsearch_name").val()
				},
				success : function(data) {
					if (data == "fail") {
						alert("입력된 정보로 가입하신 아이디가 없습니다.")
					} else {
						$('.email_number').css('display', 'inline-block');
						$('.email_number_submit')
								.css('display', 'inline-block');
						$('.finddiv2').css('display', 'none');
				
						alert("인증번호는 : " + data)
					}
				},
				error : function() {
				}
			});
		}

		function idSearch() {
			var form_data = {
				find_email : $(".idsearch_name").val(),
				find_phone : $(".idsearch_phone").val()
			};
			$.ajax({
				type : "POST",
				url : "idSearch",
				data : form_data,
				success : function(data) {
					if (data == "fail") {
						alert("입력된 정보로 가입하신 아이디가 없습니다.")
					} else {
						alert("회원님의 아이디는 : " + data)
					}
				},
				error : function() {

				}

			});
		}

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

		$('#submit').click(function(e) {
			e.preventDefault();
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
					} else if (data == "admin") {
						window.location.href = "admin"
					} else {
						alert("로그인 또는 비밀번호를 잘못 입력하였습니다");
					}
				},
				error : function() {
					alert("에러발생");
				}

			});
		});

		//알림기능 관련
		if (window.Notification) {
			Notification.requestPermission();
		}
		function notify() {
			if (Notification.permission !== 'granted') {
				alert('알림기능을 허용 해주세요');
			} else {
				var notification = new Notification('새로운 알림이 존재합니다!', {
					icon : '<c:url value="${path}/res/image/babpoolR4.png"/>',
					body : '예약건이 추가되었습니다',
				});

				/*                 notification.onclick = function () {
				 window.location.href = "main"
				 }; */
				$("#nav_notice>img").attr("src",
						'<c:url value="${path}/res/image/bell2.png"/>');
				$('.message').html(
						'<a href="buisnessmypage">새로운 예약건이 존재합니다!</a>');
			}
		}
		if ("${shop_id}" != "") {
			setInterval(function() {
				alert1();
			}, 5000)
		}
		function alert1() {
			$.ajax({
				type : "POST",
				url : "alert",
				data : {
					shop_id : "${shop_id}"
				},
				success : function(data) {
					if (data == "exist") {
						notify();
					}
				}
			});
		}
		//알림기능 관련 끝

		var auto_complete_cursor = 0;
		/* search box */
		var query = {
			'place_area' : [],
			'food_types' : []
		};
		$(".shading_bg, .confirm_red").click(function(e) {
			$("#nav_city>ul").hide();
			$("#nav_shading.shading_bg").hide();
			$("#nav_area>.box").hide();
			$("#nav_genre>.box").hide();
			$("#nav_search>#nav_recommend").hide();
			$("#popup_body").hide();
			$('.repassword_span').css('display', 'none');
			$('.repassword').css('display', 'none');
			$('.repassword2').css('display', 'none');
			$('.repassword_submit').css('display', 'none');
			$('.email_number_submit').css('display', 'none');
			$('.email_number').css('display', 'none');
			$('.email_number_submit').css('display', 'none');
			$('.pwsearch_body_span').css('display', 'inline-block');
			$('.pwsearch_body_span2').css('display', 'inline-block');
			$('.pwsearch_name').css('display', 'inline-block');
			$('.finddiv2').css('display', 'inline-block');
			$("#nav_btn").siblings().removeClass('focus');
			$(".section_price").siblings().removeClass('is-open');
			$(".filters_popup").hide();
			$('#nav_wrap').css('z-index', 100);
			$(".pwsearch_name").val("");
			e.stopPropagation();
			/* auto_complete_cursor = -1; */
		});

		$(".search").click(function() {
			if ($(this).attr("class").indexOf("focus") != -1) {
				$("#nav_city>ul").hide();
				$("#nav_shading.shading_bg").hide();
				$("#nav_area>.box").hide();
				$("#nav_genre>.box").hide();
				$("#nav_search>#nav_recommend").hide();
				$("#popup_body").hide();
				$('#nav_wrap').css('z-index', 100);
			}
		});

		$("#nav_city>ul").hide();
		$("#nav_city").click(function(e) {
			$(this).children("ul").toggle();
			e.stopPropagation();
		});
		// 도시 선택 시 바뀜
		$("#nav_city>ul>li").mousedown(function() {
			if ($(this).attr('data-enable') == 'true')
				location.href = "/" + $(this).attr('data-city');
			else {
				$("#nav_city>ul").hide();
				alert("서비스 준비중입니다. 곧 다양한 혜택으로 찾아뵙겠습니다.");
			}
		});
		// toggle box
		$("#nav_area").click(function(e) {
			if ($(this).attr("class").indexOf("focus") == -1) {
				$("#nav_city>ul").hide();
				$('#nav_area>.box').show();
				// focus주고 형제들은 focus지우기
				$(this).addClass('focus').siblings().removeClass('focus');
				// 배경 어둡게
				$("#nav_shading.shading_bg").show();
			} else {
				$("#nav_btn").siblings().removeClass('focus');
			}
			e.stopPropagation();
		}).on('click', '.box', function(e) {
			e.stopPropagation();
		});

		$("#nav_genre").click(function(e) {
			if ($(this).attr("class").indexOf("focus") == -1) {
				$("#nav_city>ul").hide();
				$('#nav_genre>.box').show();
				// focus주고 형제들은 focus지우기
				$(this).addClass('focus').siblings().removeClass('focus');
				// 배경 어둡게
				$("#nav_shading.shading_bg").show();
			} else {
				$("#nav_btn").siblings().removeClass('focus');
			}
			e.stopPropagation();
		}).on('click', '.box', function(e) {
			e.stopPropagation();
		});

		// change district
		$("#nav_area>.box>.district>li")
				.click(
						function() {

							// 지역 선택에서 선택 시 옆에 나타나기
							var dist = $(this).data('dist');
							// selected클래스 추가. 형제들은 클래스 제거
							$(this).addClass('selected').siblings()
									.removeClass('selected');
							$(
									"#nav_area>.box>.neighborhood>ul[data-dist="
											+ dist + "]").addClass("selected")
									.siblings().removeClass('selected');
						});

		// active area/genre checkbox
		$(
				"#nav_area>.box>.neighborhood>.content>li, #nav_genre>.box>.content>li")
				.click(function(e) {
					if (e.target.tagName === "LI")
						$(this).children("input").click();
				});
		// search section
		$("#nav_search>#nav_recommend").hide();
		$("#nav_search>input").click(function(e) {
			$("#nav_city>ul").hide();
			$("#nav_search>#nav_recommend").show();
			$("#nav_shading.shading_bg").show();
			$("#nav_search").addClass('focus').siblings().removeClass('focus');
			e.stopPropagation();
		}).on('click', '#nav_recommend', function(e) {
			e.stopPropagation();
		});

		/* 		$("#search1").click(function() {
		 $("input[type=text][name=string_search]").val("스시");
		 });
		 $("#search2").click(function() {
		 $("input[type=text][name=string_search]").val("한식");
		 });
		 $("#search3").click(function() {
		 $("input[type=text][name=string_search]").val("수도권");
		 }); */

		// 지역 체크시 글자 바꾸기
		$("#nav_area>.box>.neighborhood input").change(
				function() {
					var title = $(this).next("label").text();
					var hash = $(this).attr('id');
					var id = $(this).val();
					var state = $(this).prop('checked');
					var text = "지역 선택";

					$("#nav_area>.box>.neighborhood input[id^=" + hash + "]")
							.prop('checked', state).parent().toggleClass(
									'selected', state);

					if (state)
						query['place_area'].push(title);
					else
						query['place_area'].splice(query['place_area']
								.indexOf(title), 1);

					if (query['place_area'].length > 0) {
						var over = false;
						var len = 0;
						text = [];

						for (var i = 0; i < query['place_area'].length; ++i) {
							var label = query['place_area'][i];
							if (len + label.length < 8) {
								text.push(label);
								len += label.length;
							} else {
								over = true;
								break;
							}
						}

						text = text.join(',');
						if (over)
							text += "외 " + (query['place_area'].length - i)
									+ "개";
					}
					$("#nav_area>.input>.selected").text(text);
					$(this).parent().toggleClass('selected', state);
				});

		// 음식 종류 선택시 글자 변환
		$("#nav_genre>.box>.foods input").change(
				function() {
					var title = $(this).next("label").text();
					var hash = $(this).attr('id');
					var id = $(this).val();
					var state = $(this).prop('checked');
					var text = "지역 선택";

					$("#nav_genre>.box>.neighborhood input[id^=" + hash + "]")
							.prop('checked', state).parent().toggleClass(
									'selected', state);

					if (state)
						query['food_types'].push(title);
					else
						query['food_types'].splice(query['food_types']
								.indexOf(title), 1);

					if (query['food_types'].length > 0) {
						var over = false;
						var len = 0;
						text = [];

						for (var i = 0; i < query['food_types'].length; ++i) {
							var label = query['food_types'][i];
							if (len + label.length < 8) {
								text.push(label);
								len += label.length;
							} else {
								over = true;
								break;
							}
						}

						text = text.join(',');
						if (over)
							text += "외 " + (query['food_types'].length - i)
									+ "개";
					}
					$("#nav_genre>.input>.selected").text(text);
					$(this).parent().toggleClass('selected', state);
				});

		//팝업 닫기
		$(".popup_close").click(function() {
			$("#nav_city>ul").hide();
			$("#nav_shading.shading_bg").hide();
			$("#nav_area>.box").hide();
			$("#nav_genre>.box").hide();
			$("#nav_search>#nav_recommend").hide();
			$("#popup_body").hide();
			$('.repassword_span').css('display', 'none');
			$('.repassword').css('display', 'none');
			$('.repassword2').css('display', 'none');
			$('.repassword_submit').css('display', 'none');
			$('.email_number_submit').css('display', 'none');
			$('.email_number').css('display', 'none');
			$('.email_number_submit').css('display', 'none');
			$('.pwsearch_body_span').css('display', 'inline-block');
			$('.pwsearch_body_span2').css('display', 'inline-block');
			$('.pwsearch_name').css('display', 'inline-block');
			$('.finddiv2').css('display', 'inline-block');
			$("#nav_btn").siblings().removeClass('focus');
			$(".pwsearch_name").val("");
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

			$('.popup_close').css('top', -90 + 'px');
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

			$('.popup_close').css('top', -108 + 'px');
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

			$('.popup_close').css('top', -39 + 'px');
			$('.popup_close').css('left', 92.4 + '%');

		});
		//아이디 찾기 팝업
		$("#idSearch").click(function() {

			$("#login_body").hide();
			$("#join_body").hide();
			$("#join2_body").hide();
			$("#naverIdLogin").hide();
			$("#passwordsearch_body").hide();
			$("#password_reset_body").hide();
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
				document.getElementById('form').submit();
			}
		}

		//회원가입 관련
		function join() {
			document.getElementById('join_form').submit();
		}
		function join2() {
			$("input[type=hidden][name=join_type]").val("2");
			document.getElementById('join_form').submit();
		}

		// notice section
		$("#nav_notice>img").click(
				function(e) {
					$("#nav_notice_list").toggle();
					$("#nav_notice_list").addClass('focus').siblings()
							.removeClass('focus');
					$("#nav_notice>img").attr("src",
							'<c:url value="${path}/res/image/bell.png"/>');
					setTimeout(function() {
						$('.message').text('내 소식이 없습니다.');
					}, 5000);
					e.stopPropagation();
				}).on('click', '#nav_notice', function(e) {
			e.stopPropagation();
		});

		$("#nav_mynews_btn").click(function() {
			$("#nav_mynews_btn").addClass("selected");
			$("#nav_news_btn").removeClass("selected");
			$("#nav_news_list").hide();

			if ($("#nav_mynews_list").html() == "") {

			} else
				$("#nav_mynews_list").show();
		});

		$("#nav_news_btn").click(function() {
			$("#nav_news_btn").addClass("selected");
			$("#nav_mynews_btn").removeClass("selected");
			$("#nav_mynews_list").hide();

			if ($("#nav_news_list").html() == "") {

			} else
				$("#nav_poingnews_list").show();
		});

		$("#nav_notice_list_all").click(function() {
			location.href = "";
		});

		// profile section
		$("#nav_profile").mouseenter(function() {
			$("#nav_notice_list").hide();
			$("#nav_profile_list").show();
		});

		$("#nav_profile").mouseleave(function() {
			$("#nav_profile_list").hide();
		});

		/* $("#nav_profile").mouseout(function () {
		
			$("#nav_profile_list").hide();
			
		}); */

		$("#nav_profile_list>.item").click(function() {
			var link = $(this).data("link");

			if (typeof link == "string") {
				location.href = link;
			}
		});

		$("#nav_logout").on("click", function() {
			location.href = "logout";
		});

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

		_
	</script>

</body>
</html>