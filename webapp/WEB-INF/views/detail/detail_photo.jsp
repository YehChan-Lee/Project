<%@page import="com.javaex.model.ShopVo"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="${path}/res/css/detail_photo.css?ver=1"/>" />
</head>
<body>

	<div id="wrapper">
		<div id="slider-wrap">
			<ul id="slider">
			 <c:forTokens items="${ShopSubPhoto}" var="img"
				delims="/" varStatus="i">
				<li>
					<div>
						<h3></h3>
						<span>Sub-title #1</span>
					</div>
				
				<img src="<c:url value='${path}/serverImg/shopsubimg/${img}'/>"
					>
		
				</li>
	</c:forTokens>
				
			</ul>

			<!--controls-->
			<div class="btns" id="next">
				<i class="fa fa-arrow-right"></i>
			</div>
			<div class="btns" id="previous">
				<i class="fa fa-arrow-left"></i>
			</div>
			<div id="counter"></div>

			<div id="pagination-wrap">
				<ul>
				</ul>
			</div>
			<!--controls-->
		</div>
	</div>
</body>
<script>
	var pos = 0;
	var totalSlides = $('#slider-wrap ul li').length;
	var sliderWidth = $('#slider-wrap').width()-130;
	$(document).ready(function() {
		$('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

		//next slide    
		$('#next').click(function() {
			slideRight();
		});

		//previous slide
		$('#previous').click(function() {
			slideLeft();
		});

		/* //automatic slider
		var autoSlider = setInterval(slideRight, 3000); */

		//for each slide 
		$.each($('#slider-wrap ul li'), function() {
			//create a pagination
			var li = document.createElement('li');
			$('#pagination-wrap ul').append(li);
		});

		//counter
		countSlides();

		//pagination
		pagination();
		
		//hide/show controls/btns when hover
		//pause automatic slide when hover
		 $('#slider-wrap').hover(function() {
			$(this).addClass('active');			
		}, function() {
			$(this).removeClass('active');
		}); 

	});//DOCUMENT READY

	function slideLeft() {
		pos--;
		if (pos == -1) {
			pos = totalSlides - 1;
		}
		$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

		//*> optional
		countSlides();
		pagination();
	}

	function slideRight() {
		pos++;
		if (pos == totalSlides) {
			pos = 0;
		}
		$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

		//*> optional 
		countSlides();
		pagination();
	}
	function countSlides() {
		$('#counter').html(pos + 1 + ' / ' + totalSlides);
	}

	function pagination() {
		$('#pagination-wrap ul li').removeClass('active');
		$('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
	}
</script>
</html>