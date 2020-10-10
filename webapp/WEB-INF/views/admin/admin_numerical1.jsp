<%@page import="java.util.ArrayList"%>
<%@page import="com.javaex.model.VisitDayVo"%>
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
	<%-- <%
		ArrayList<Object> day = (ArrayList<Object>)request.getAttribute("admin_numerical1_day");
		
	%> --%>


	<div id="sec_admin_numerical1">
		<div>
			<div>일별</div>
			<div>요일별</div>
			<div>월별</div>
		</div>
		<div class="numerical1_cont">
			<h4>
				<i class="fas fa-chart-bar"></i>
				<p>2020년 9월 일별 접속자 통계</p>
			</h4>
		</div>
		<div class="numer1_sear">
			<select name="numer1_y" id="numer1_y">
				<option>2020년</option>
			</select> <select name="numer1_m" id="numer1_m">
				<option value="01">1월</option>
				<option value="02">2월</option>
				<option value="03">3월</option>
				<option value="04">4월</option>
				<option value="05">5월</option>
				<option value="06">6월</option>
				<option value="07">7월</option>
				<option value="08">8월</option>
				<option value="09">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
			<button>
				<i class="fas fa-search"></i>검색
			</button>
		</div>
		<div id="num1_chart" style="width: 1400px; height: 700px;"></div>

		<div class="num1_tb_info">
			<%@include file="admin_numerical_total.jsp"%>

		</div>
	</div>
</body>
<script>
	google.charts.load('current', {
		packages : ['corechart', 'bar'
		]
	});
	google.charts.setOnLoadCallback(drawBasic);

	function drawBasic() {

		var data = google.visualization.arrayToDataTable([['일별', '일별',
		],
		['31일', ${admin_numerical1_day.get(30) }],
		['30일', ${admin_numerical1_day.get(29) }],
		['29일', ${admin_numerical1_day.get(28) }],
		['28일', ${admin_numerical1_day.get(27) }],
		['27일', ${admin_numerical1_day.get(26) }],
		['26일', ${admin_numerical1_day.get(25) }],
		['25일', ${admin_numerical1_day.get(24) }],
		['24일', ${admin_numerical1_day.get(23) }],
		['23일', ${admin_numerical1_day.get(22) }],
		['22일', ${admin_numerical1_day.get(21) }],
		['21일', ${admin_numerical1_day.get(20) }],
		['20일', ${admin_numerical1_day.get(19) }],
		['19일', ${admin_numerical1_day.get(18) }],
		['18일', ${admin_numerical1_day.get(17) }],
		['17일', ${admin_numerical1_day.get(16) }],
		['16일', ${admin_numerical1_day.get(15) }],
		['15일', ${admin_numerical1_day.get(14) }],
		['14일', ${admin_numerical1_day.get(13) }],
		['13일', ${admin_numerical1_day.get(12) }],
		['12일', ${admin_numerical1_day.get(11) }],
		['11일', ${admin_numerical1_day.get(10) }],
		['10일',${admin_numerical1_day.get(9) }],
		['9일', ${admin_numerical1_day.get(8) }],
		['8일', ${admin_numerical1_day.get(7) }],
		['7일', ${admin_numerical1_day.get(6) }],
		['6일', ${admin_numerical1_day.get(5) }],
		['5일', ${admin_numerical1_day.get(4) }],
		['4일', ${admin_numerical1_day.get(3) }],
		['3일', ${admin_numerical1_day.get(2) }],
		['2일', ${admin_numerical1_day.get(1) }],
		['1일', ${admin_numerical1_day.get(0) }],
		]);

		var options = {
			/*  title: 'Population of Largest U.S. Cities', */
			chartArea : {
				width : '70%'
			},
			hAxis : {
				/*  title: 'Total Population', */
				minValue : 0
			},
			vAxis : {
			/*  title: 'City' */
			}
		};

		var chart = new google.visualization.BarChart(document.getElementById('num1_chart'));

		chart.draw(data, options);
	}
</script>
<script>
	$(document).ready(function() {
		
		
		$("#sec_admin_numerical1 > div.numer1_sear > button").on('click',function(){
			var info = $("#numer1_m").val();
			
			$.ajax({
	            type : "get",
	            url : "admin/admin_numerical1_chart",
	            dataType : "text",
	            data: {info},
	            error : function(){
	            	alert("에러발생");
	            },
	            success : function(){
	            	alert("성공");
	            	$("#num1_chart").load("admin/admin_numerical1_chart");
	            	
	            }
		 	});
		})
		 
		
		
		$("#sec_admin_numerical1 > div:nth-child(1) > div:nth-child(1)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical1");
			// 일별 통계
			console.log("일별 통계");
		});
		$("#sec_admin_numerical1 > div:nth-child(1) > div:nth-child(2)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical2");
			// 요일별 통계
			console.log("요일별 통계");
		});
		$("#sec_admin_numerical1 > div:nth-child(1) > div:nth-child(3)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical3");
			// 월별 통계
			console.log("월별 통계");
		});

		$("#sec_admin_numerical1 > div:nth-child(1) > div:nth-child(2)").hover(function() {
			$(this).css({
				background : "#c8c8c8"
			});
		}, function() {
			$(this).css({
				background : "#e5e5e5"
			})
		});
		$("#sec_admin_numerical1 > div:nth-child(1) > div:nth-child(3)").hover(function() {
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