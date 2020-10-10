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
	
	<div id="sec_admin_numerical3">
		<div>
			<div>일별</div>
			<div>요일별</div>
			<div>월별</div>
		</div>
		<div class="numerical3_cont">
			<h4>
				<i class="fas fa-chart-pie"></i>
				<p>2020년 월별 접속자 통계</p>
			</h4>
		</div>
		<div class="numer3_sear">
			<select name="numer3_y" id="numer3_y">
				<option value="2020" selected="selected">2020년</option>
			</select>
			
			<button>
				<i class="fas fa-search"></i>검색
			</button>
		</div>
		<div id="num3_chart" style="width: 1400px; height: 700px;"></div>
		<div class="num1_tb_info">
			<%@include file="admin_numerical_total.jsp"%>
		</div>
	</div>
</body>
<script>
google.charts.load('current', {'packages':['bar']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['월별', '조회수'],
    ['1월', 11],
    ['2월', 14],
    ['3월', 18],
    ['4월', 34],
    ['5월', 42],
    ['6월', 31],
    ['7월', 37],
    ['8월', 39],
    ['9월', 48],
    ['10월', 52],
    ['11월', 58],
    ['12월', 53]
  ]);

  var options = {
    chart: {
      title: ''
      
    }
  };

  var chart = new google.charts.Bar(document.getElementById('num3_chart'));

  chart.draw(data, google.charts.Bar.convertOptions(options));
}
</script>
<script>
	$(document).ready(function(){
		
		$("div.numer3_sear > button").on('click', function(){
			/* if ($(".paging_search").find("input[name='pSea_txt']").val() == '') {
				alert("키워드를 입력하세요");
				return false;
			} */
			var url = "${admin_numerical3}";
			url = url + "?numer3_y=" + $('.numer3_y').val();
			location.href = url;
			console.log(url);
			alert("!!1");
		});
		
		$("#sec_admin_numerical3 > div:nth-child(1) > div:nth-child(1)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical1");
			// 일별 통계
			console.log("일별 통계");
		});
		$("#sec_admin_numerical3 > div:nth-child(1) > div:nth-child(2)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical2");
			// 요일별 통계
			console.log("요일별 통계");
		});
		$("#sec_admin_numerical3 > div:nth-child(1) > div:nth-child(3)").on('click', function() {
			$("#cont_section").load("admin/admin_numerical3");
			// 월별 통계
			console.log("월별 통계");
		});
		
		$("#sec_admin_numerical3 > div:nth-child(1) > div:nth-child(1)").hover(function(){
			$(this).css({
				background:"#c8c8c8"
			});
		}, function(){
			$(this).css({
				background:"#e5e5e5"
			})
		});
		$("#sec_admin_numerical3 > div:nth-child(1) > div:nth-child(2)").hover(function(){
			$(this).css({
				background:"#c8c8c8"
			});
		}, function(){
			$(this).css({
				background:"#e5e5e5"
			})
		});
	});
</script>
</html>