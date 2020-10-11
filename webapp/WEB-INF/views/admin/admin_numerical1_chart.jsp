<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="numChart" style="width: 1400px; height: 700px;"></div>
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

		var chart = new google.visualization.BarChart(document.getElementById('numChart'));

		chart.draw(data, options);
	}
</script>
</html>