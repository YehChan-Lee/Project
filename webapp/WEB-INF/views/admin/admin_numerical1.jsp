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
			</select>
			<select name="numer1_m" id="numer1_m">
				<option value="">1월</option>
				<option value="">2월</option>
				<option value="">3월</option>
				<option value="">4월</option>
				<option value="">5월</option>
				<option value="">6월</option>
				<option value="">7월</option>
				<option value="">8월</option>
				<option value="">9월</option>
				<option value="">10월</option>
				<option value="">11월</option>
				<option value="">12월</option>
			</select>
			<button><i class="fas fa-search"></i>검색</button>
		</div>
		<div id="num1_chart" style="width: 1400px; height: 700px;"></div>
	</div>
</body>
<script>
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = google.visualization.arrayToDataTable([
        ['일별', '일별',],
        
        ['9월 13일', 43],
        ['9월 12일', 36],
        ['9월 11일', 39],
        ['9월 10일', 34],
        ['9월 9일', 32],
        ['9월 8일', 47],
        ['9월 7일', 52],
        ['9월 6일', 41],
        ['9월 5일', 16],
        ['9월 4일', 21],
        ['9월 3일', 13],
        ['9월 2일', 36],
        ['9월 1일', 31],
       
      ]);

      var options = {
       /*  title: 'Population of Largest U.S. Cities', */
        chartArea: {width: '70%'},
        hAxis: {
         /*  title: 'Total Population', */
          minValue: 0
        },
        vAxis: {
         /*  title: 'City' */
        }
      };

      var chart = new google.visualization.BarChart(document.getElementById('num1_chart'));

      chart.draw(data, options);
    }
</script>
</html>