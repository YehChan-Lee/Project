<%@page import="java.util.HashMap"%>
<%@page import="com.javaex.model.VisitVo"%>
<%@page import="com.javaex.model.AdminVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>밥풀 - AdminPage</title>
<link rel="stylesheet"
	href="<c:url value='${path}/res/css/admin/admin.css'/>">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://kit.fontawesome.com/c50e3378bc.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="<c:url value='${path}/res/js/jquery-ui1.js'/>"
	type="text/javascript"></script>
<script src="<c:url value='${path}/res/js/datepicker-ko.js'/>"
	type="text/javascript"></script>
</head>

<body>
	<div class="loader_bg">
		<div class="loader"></div>
	</div>
	<!-- 탑 배너 바-->
	<div id="admin_scollbar">
		<div>
			<a class="sc_loCont" href="admin" target="_self">
				<div id="admin_logo2"
					style="background-image : url(<c:url value='${path}/res/image/admin/babpoolN1.png'/>)"></div>
			</a>

			<div>
				<div class="sc_txt">
					<span>관리자</span>
					<div class="sc_admin_ID">
						<c:out value="${Aadmin_id.admin_id }" ></c:out>
					</div>
				</div>
				<div class="sc_btn">
					<button class="sc_myhome_btn" onclick="location.href='main'">
						<i class="fas fa-home"></i>
					</button>
					<button class="sc_logout_btn">
						<i class="fas fa-sign-out-alt"></i>
					</button>
				</div>
			</div>

		</div>
	</div>
	<div id="admin_top_nav_container">
		<div id="nav_cont">
			<a class="subNav_cont" href="admin" target="_self">
				<div id="admin_logo"
					style="background-image : url(<c:url value='${path}/res/image/admin/babpoolN3.png'/>)"></div>
				<div id="logoName"></div>
			</a>
			<div class="subNav_txt">
				<div>관리자</div>
				<!-- 관리자(ID) -->
				<div class="admin_ID">
					<c:out value="${Aadmin_id.admin_id }" ></c:out>
				</div>
				<div>님 환영합니다.</div>
			</div>
			<div class="subNav_btn">
				<button class="myhome_btn" onclick="location.href='main'">
					<i class="fas fa-home"></i>HOME
				</button>
				<button class="logout_btn">
					<i class="fas fa-sign-out-alt"></i>LOGOUT
				</button>
			</div>
		</div>
	</div>
	<!-- 탑 배너 바 끝-->
	<!-- 컨테이너 -->
	<div id="container">
		
		<div id="cont_sidebar">
			<ul>
				<li class="siti_member">
					<div>
						<i class="far fa-address-card"></i><span>회원 관리</span>
					</div>
				</li>
				<li class="siti_company">
					<div>
						<i class="far fa-building"></i><span>업체 관리</span>
						<div class="counters">${admin_appli_size }</div>
					</div>
				</li>
				<li class="siti_reservation">
					<div>
						<i class="fas fa-angle-down"></i> <i class="far fa-handshake"></i>
						<span>예약 관리</span>
					</div>
					<ul>
						<li>예약 현황</li>

						<!-- <li>예약 취소</li> -->
					</ul>
				</li>
				<li class="siti_number">
					<div>
						<i class="fas fa-angle-down"></i> <i class="fas fa-globe-americas"></i>
						<span>통계 관리</span>
					</div>
					<ul>
						<li>일별 통계</li>
						<li>요일별 통계</li>
						<li>월별 통계</li>
						<!-- <li>성별</li>
						<li>연령 별</li>
						<li>지역 별</li> -->
						<!-- <li>평점</li> -->
						<!-- <li>음식 종류</li> -->
					</ul>
				</li>
				<!-- <li class="siti_ranking">
					<div>
						<i class="fas fa-angle-down"></i> <i class="far fa-chart-bar"></i>
						<span>랭킹 순위</span>
					</div>
					<ul>
						<li>리뷰 순위</li>
						<li>좋아요 순위</li>
						<li>싫어요 순위</li>
					</ul>
				</li> -->
				<li class="siti_notice">
					<div>
						<i class="far fa-calendar-minus"></i><span>공지사항</span>
					</div>
				</li>
			</ul>
		</div>
		<!-- cont_sidebar 끝-->
		<!-- 섹션 -->
		<div id="cont_section">

			<div class="sec_home1">
				<h2>
					<i class="fas fa-arrow-circle-right"></i></i><span>최근 리뷰</span>
				</h2>
				<hr>
				<div>
					<table>
						<tr>

							<th>NO.</th>
							<th>리뷰 내용</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
						<%
							List<AdminVo> Areview_list = (List<AdminVo>) request.getAttribute("Areview_list");
							for (int i = 0; i < Areview_list.size(); i++) {
								AdminVo vo = Areview_list.get(i);
						%>
						<tr>
							<td><%=vo.getReviewVo().getReview_idx()%></td>
							<td><%=vo.getReviewVo().getReview()%></td>
							<td><%=vo.getShopUser().getUser_name()%></td>
							<td><%=vo.getReviewVo().getReview_date()%></td>
						</tr>
						<%
						}
						
						%>
						

					</table>
					<div class="paging">
						<a href="#" class="bt"><i class="fas fa-angle-double-left"></i></a>
						<a href="#" class="bt"><i class="fas fa-angle-left"></i></a> <a
							href="#" class="num">1</a> <a href="#" class="num">2</a> <a
							href="#" class="num">3</a> <a href="#" class="bt"><i
							class="fas fa-angle-right"></i></a> <a href="#" class="bt"><i
							class="fas fa-angle-double-right"></i></a>
						<div></div>
					</div>
					<div class="paging_search">
						<select name="pSea" id="pSea">
							<option value="author" selected="selected">작성자</option>
							<option value="date">등록일</option>
						</select> <input type="text" name="pSea_txt" id="pSea_txt"> <input
							type="submit" value="검색" id="pSea_txt_btn">
					</div>
				</div>
			</div>
			<div class="sec_home2">
				<div class="sec_home2_sts">
					<h2>
						<i class="fas fa-arrow-circle-right"></i></i><span>접속자 통계 요약</span>
					</h2>
					<hr>
					<%
						List<VisitVo> viVo = (List<VisitVo>) request.getAttribute("admin_numerical_total");
						int vivoSize = viVo.size();

						List<VisitVo> viVoToday = (List<VisitVo>) request.getAttribute("admin_numerical_totalToday");
						int viVoTodaySize = viVoToday.size();

						int viVoMonth = (int) request.getAttribute("admin_numerical_totalMonth");
					%>
					<table>
						<tr>
							<th>총 접속자 수</th>
							<td><%=vivoSize%>명</td>
						</tr>
						<tr>
							<th>이달의 접속자 수</th>
							<td><%=viVoMonth%>명</td>
						</tr>
						<tr>
							<th>오늘 접속자 수</th>
							<td><%=viVoTodaySize%>명</td>
						</tr>
						<%
							HashMap<Integer, Object> adminHomeM = (HashMap<Integer, Object>) request.getAttribute("adminHomeM");
							
						%>
					</table>
				</div>
				<!-- 통계 그래프 -->
				<div class="sec_home2_sts2">
					<h2>
						<i class="fas fa-arrow-circle-right"></i></i><span>월별통계 요약</span>
					</h2>
					<hr>
					<div id="sec_home2_gg"></div>
				</div>
			</div>
		</div>
		
		<!-- 섹션 끝-->
	</div>
	<!-- 컨테이너 끝 -->
</body>

<script>
	$(document).ready(function() {
		$(window).load(function() {
			$('.loader_bg').fadeOut();
			$('.loader').fadeOut();
		});
		// 새로고침시 파라미터 전체 제거 
		window.onkeydown = function() {
			var kcode = event.keyCode;
			if(kcode == 116) {
			history.replaceState({}, null, location.pathname);
			}
		}
		
		$("#pSea_txt_btn").on('click', function(){
			if ($(".paging_search").find("input[name='pSea_txt']").val() == '') {
				alert("키워드를 입력하세요");
				return false;
			}
			var url = "${adminReview}";
			url = url + "?pSea=" + $('#pSea').val();
			url = url + "&pSea_txt=" + $('#pSea_txt').val();
			location.href = url;
			console.log(url);
			
		});
		
		$(".siti_reservation, .siti_number, .siti_ranking").children().next().hide();
		$(".siti_reservation>div, .siti_number>div, .siti_ranking>div").on('click', function() {
			$(this).next().slideToggle("fast");
			if ($(this).children(":first").hasClass("fas fa-angle-down")) {
				$(this).children(":first").removeClass(".fas fa-angle-down").addClass(".fas fa-angle-up");
			} else {
				$(this).children(":first").removeClass(".fas fa-angle-up").addClass("fas fa-angle-down");
			}
		});
		$(".sc_logout_btn, .logout_btn").on('click', function() {
			alert("${Aadmin_id.admin_id }님 로그아웃되었습니다.");
			location.href = 'main';
		});
		/*슬라이드 메뉴바 이벤트*/
		$("#cont_sidebar > ul > li.siti_member").on('click', function() {
			$("#cont_section").load("admin/admin_member");
			// 회원 관리
			console.log("member");
			return false;
		});

		$("#cont_sidebar > ul > li.siti_company").on('click', function() {
			$("#cont_section").load("admin/admin_company");
			// 업체 관리
			console.log("company");
			return false;
		});

		$("#cont_sidebar > ul > li.siti_reservation > ul > li:nth-child(1)").on('click', function() {
			$("#cont_section").load("admin/admin_resSitu");
			// 예약 현황
			console.log("resSitu");
			return false;
		});

		$("#cont_sidebar > ul > li.siti_reservation > ul > li:nth-child(2)").on('click', function() {
			$("#cont_section").load("admin/admin_resRegi");
			// 예약 등록
			console.log("resRegi");
			return false;
		});
		$("#cont_sidebar > ul > li.siti_number > ul > li:nth-child(1)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical1");
			// 일별 통계
			console.log("일별 통계");
			return false;
		});
		$("#cont_sidebar > ul > li.siti_number > ul > li:nth-child(2)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical2");
			// 요일별 통계
			console.log("요일별 통계");
			return false;
		});
		$("#cont_sidebar > ul > li.siti_number > ul > li:nth-child(3)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical3");
			// 월별 통계
			console.log("월별 통계");
			return false;
		});
		$("#cont_sidebar > ul > li.siti_number > ul > li:nth-child(4)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical4");
			// 성별 
			console.log("성별 ");
			return false;
		});
		$("#cont_sidebar > ul > li.siti_number > ul > li:nth-child(5)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical5");
			// 연령 별
			console.log("연령 별");
			return false;
		});
		$("#cont_sidebar > ul > li.siti_number > ul > li:nth-child(6)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical6");
			// 지역 별
			console.log("지역 별");
			return false;
		});
		$("#cont_sidebar > ul > li.siti_number > ul > li:nth-child(7)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical7");
			// 음식 종류
			console.log("음식 종류");
			return false;
		});
		$("#cont_sidebar > ul > li.siti_notice").on('click', function() {
			$("#cont_section").load("admin/admin_notice");
			// 공지사항
			console.log("공지사항");
			return false;
		});

		google.charts.load('current', {
			'packages' : ['bar'
			]
		});
		google.charts.setOnLoadCallback(drawStuff);

		$(function() {
			$(window).scroll(function() { //스크롤하면 아래 코드 실행
				var num = $(this).scrollTop(); // 스크롤값

				if (num > 36) { // 스크롤을 36이상 했을 때
					$(".admin_top_nav_container").css({
						visibility : "hidden"
					});
					$("#admin_scollbar").css({
						visibility : "visible",
						position : "fixed",
						width : "100%"
					});

				} else {
					$(".admin_top_nav_container").css({
						visibility : "visible"
					});
					$("#admin_scollbar").css({
						visibility : "hidden",
						position : "absolute",
						width : "99%"
					});
				}
			});
		});

		function drawStuff() {
			var data = new google.visualization.arrayToDataTable([['Move', '월별 통계'
			], ["1월", <%=adminHomeM.get(1) %>
			], ["2월", <%=adminHomeM.get(2) %>
			], ["3월", <%=adminHomeM.get(3) %>
			], ["4월", <%=adminHomeM.get(4) %>
			], ["5월", <%=adminHomeM.get(5) %>
			], ["6월", <%=adminHomeM.get(6) %>
			], ["7월", <%=adminHomeM.get(7) %>
			], ["8월", <%=adminHomeM.get(8) %>
			], ["9월", <%=adminHomeM.get(9) %>
			], ["10월", <%=adminHomeM.get(10) %>
			], ["11월", <%=adminHomeM.get(11) %>
			], ["12월", <%=adminHomeM.get(12) %>
			],
			]);

			var options = {
				width : 730,
				legend : {
					position : 'none'
				},
				chart : {
					title : '',
					subtitle : ''
				},
				axes : {
					x : {
						0 : {
							side : 'bottom',
							label : '월별 통계'
						}
					// Top x-axis.
					}
				},
				bar : {
					groupWidth : "50%"
				}
			};

			var chart = new google.charts.Bar(document.getElementById('sec_home2_gg'));
			// Convert the Classic options to Material options.
			chart.draw(data, google.charts.Bar.convertOptions(options));
		};

	});
</script>
</html>