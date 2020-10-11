<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<div id="sec_admin_numerical2">
		<div>
			<div>일별</div>
			<div>요일별</div>
			<div>월별</div>
		</div>
		<div class="numerical2_cont">
			<h4>
				<i class="fas fa-chart-pie"></i>
				<p>2020년 요일별 접속자 통계</p>
			</h4>
		</div>
		<div class="numer2_sear">
			<select name="numer2_y" id="numer2_y">
				<option>2020년</option>
			</select> <select name="numer2_m" id="numer2_m">
				<option value="">1월</option>
				<option value="">2월</option>
				<option value="">3월</option>
				<option value="">4월</option>
				<option value="">5월</option>
				<option value="">6월</option>
				<option value="">7월</option>
				<option value="">8월</option>
				<option value="">9월</option>
				<option value="" selected="selected">10월</option>
				<option value="">11월</option>
				<option value="">12월</option>
			</select>
			<button>
				<i class="fas fa-search"></i>검색
			</button>
		</div>
		<div id="num2_chart" style="width: 1400px; height: 700px;"></div>
		<div class="num1_tb_info">
			<%@include file="admin_numerical_total.jsp"%>
		</div>
	</div>
</body>
<script>
	google.charts.load('current', {
		'packages' : ['corechart'
		]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = google.visualization.arrayToDataTable([['', ''
		], ['월요일', 11
		], ['화요일', 4
		], ['수요일', 7
		], ['목요일', 4
		], ['금요일', 5
		], ['토요일', 12
		], ['일요일', 16
		]
		]);

		var options = {
			title : ''
		};

		var chart = new google.visualization.PieChart(document.getElementById('num2_chart'));

		chart.draw(data, options);
	}
</script>
<script>
	$(document).ready(function() {
		$("#sec_admin_numerical2 > div:nth-child(1) > div:nth-child(1)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical1");
			// 일별 통계
			console.log("일별 통계");
		});
		$("#sec_admin_numerical2 > div:nth-child(1) > div:nth-child(2)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical2");
			// 요일별 통계
			console.log("요일별 통계");
		});
		$("#sec_admin_numerical2 > div:nth-child(1) > div:nth-child(3)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical3");
			// 월별 통계
			console.log("월별 통계");
		});

		$("#sec_admin_numerical2 > div:nth-child(1) > div:nth-child(1)").hover(function() {
			$(this).css({
				background : "#c8c8c8"
			});
		}, function() {
			$(this).css({
				background : "#e5e5e5"
			})
		});
		$("#sec_admin_numerical2 > div:nth-child(1) > div:nth-child(3)").hover(function() {
			$(this).css({
				background : "#c8c8c8"
			});
		}, function() {
			$(this).css({
				background : "#e5e5e5"
			})
		});
	});
</script>
</html>