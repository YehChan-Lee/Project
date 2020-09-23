<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value='${path}/res/css/filters.css'/>">
<script src="<c:url value='${path}/res/js/md5.js'/>"></script>
<!-- <script src="http://code.jquery.com/jquery.js"></script> -->
<script>
	$(document).ready(function() {
		/* /* $('.section_price').on('click', function() {
			$('.filters_popup', this).hide();
			$('.filters_popup', this).show().css("visibility","visible");
		}); */
		
 		$(".confirm_btn").click(function(e) {
			$("#nav_city>ul").hide();
			$("#nav_shading.shading_bg").hide();
			$("#nav_area>.box").hide();
			$("#nav_genre>.box").hide();
			$("#nav_search>#nav_recommend").hide();
			$("#popup_body").hide();
			$("#nav_btn").siblings().removeClass('focus');
			$(".section_price").siblings().removeClass('is-open');
			$(".filters_popup").hide();
			$('#nav_wrap').css('z-index', 100);
			e.stopPropagation();
		});	 
		
		$(".section_place").click(function(e) {
			if ($("#nav_area").attr("class").indexOf("focus") == -1) {
				$("#nav_city>ul").hide();
				$("#nav_genre>.box").hide();
				$(".filters_popup").hide();
				$('#nav_wrap').css('z-index', 100);
				
				$('#nav_area>.box').show();
				// focus주고 형제들은 focus지우기
				$("#nav_area").addClass('focus').siblings().removeClass('focus');
				
				$(".section_add_info").addClass('is-open').siblings().removeClass('is-open');
				
				// 배경 어둡게
				$("#nav_shading.shading_bg").show();	
			} else {
				$("#nav_btn").siblings().removeClass('focus');
			}
			e.stopPropagation();
		});
		
		$(".section_genre").click(function(e) {
			if ($("#nav_genre").attr("class").indexOf("focus") == -1) {
				$("#nav_city>ul").hide();
				$("#nav_area>.box").hide();
				$(".filters_popup").hide();
				$('#nav_wrap').css('z-index', 100);
				
				$('#nav_genre>.box').show();
				// focus주고 형제들은 focus지우기
				$("#nav_genre").addClass('focus').siblings().removeClass('focus');
				
				$(".section_add_info").addClass('is-open').siblings().removeClass('is-open');
				
				// 배경 어둡게
				$("#nav_shading.shading_bg").show();
			} else {
				$("#nav_btn").siblings().removeClass('focus');
			}
			e.stopPropagation();
		});

		$(".section_price").click(function(e) {
			$(".filters_popup").hide();
			
			$("#nav_area>.box").hide();
			$("#nav_genre>.box").hide();
			$("#nav_search>#nav_recommend").hide();
			$("#popup_body").hide();
			
			$('.section_price>.filters_popup').show();
			$('#nav_wrap').css('z-index', 30);
			// focus주고 형제들은 focus지우기
			$(this).addClass('is-open').siblings().removeClass('is-open');
			// 배경 어둡게
			$(".shading_bg").show();
			e.stopPropagation();
		}).on('click', '.filters', function(e) {
			e.stopPropagation();
		});

		$(".section_add_info").click(function(e) {
			$(".filters_popup").hide();
			
			$("#nav_area>.box").hide();
			$("#nav_genre>.box").hide();
			$("#nav_search>#nav_recommend").hide();
			$("#popup_body").hide();
			
			$('.section_add_info>.filters_popup').show();
			$('#nav_wrap').css('z-index', 30);
			// focus주고 형제들은 focus지우기
			$(this).addClass('is-open').siblings().removeClass('is-open');
			// 배경 어둡게
			$(".shading_bg").show();
			e.stopPropagation();
		}).on('click', '.filters', function(e) {
			e.stopPropagation();
		});

		$(".section_table").click(function(e) {
			$(".filters_popup").hide();
			
			$("#nav_area>.box").hide();
			$("#nav_genre>.box").hide();
			$("#nav_search>#nav_recommend").hide();
			$("#popup_body").hide();
			
			$('.section_table>.filters_popup').show();
			$('#nav_wrap').css('z-index', 30);
			// focus주고 형제들은 focus지우기
			$(this).addClass('is-open').siblings().removeClass('is-open');
			// 배경 어둡게
			$(".shading_bg").show();
			e.stopPropagation();
		}).on('click', '.filters', function(e) {
			e.stopPropagation();
		});

		$(".section_liquor").click(function(e) {
			$(".filters_popup").hide();
			
			$("#nav_area>.box").hide();
			$("#nav_genre>.box").hide();
			$("#nav_search>#nav_recommend").hide();
			$("#popup_body").hide();
			
			$('.section_liquor>.filters_popup').show();
			$('#nav_wrap').css('z-index', 30);
			// focus주고 형제들은 focus지우기
			$(this).addClass('is-open').siblings().removeClass('is-open');
			// 배경 어둡게
			$(".shading_bg").show();
			e.stopPropagation();
		}).on('click', '.filters', function(e) {
			e.stopPropagation();
		});
		
		/* 팝업 데이터 쓰기 */
		$('.section_price > div.filters_popup > ul > li > input').change(function() {
			console.log(this);
		$(this).parent().siblings().find(">input").prop('checked',false);

		var dpValue = $(this).next("label").text() + " (2인 기준)";
		if ($(this).is(":checked") === false || $(this).attr('id') == 'price_all')
			dpValue = "예산 (2인 기준)";

		$(".section_price > span").html(dpValue);
		});
		/**/
		$('.section_add_info > .filters_popup > ul > li > input:not([id$=all])').change(function() {
			var state = $(this).is(":checked");
            var id = $(this).val();
			var str = $(this).next("label").text();
			
			if(state) {
				$("#add_info_sel_list").append("<li data-id='"+md5(id)+"'><span>"+str+"</span>"+
				"<div class='iconDelete' style='background-image: url(<c:url value="${path}/res/image/menubar/deleteBtn.png"/>)'></div>"+"</li>");
			} else {
				$("li[data-id="+md5(id)+"]").remove();
			};
		
			var length = $(this).closest("ul").find("input:checked:not([id$=all])").length;
			
			if( length === 0 ) {
				length = "부가 정보";
			} else {
				length += "개 선택";
			}
			
			$(".section_add_info > span").html(length);
		});	
		/**/
		$('.section_table > .filters_popup > ul > li > input:not([id$=all])').change(function() {
			var state = $(this).is(":checked");
            var id = $(this).val();
			var str = $(this).next("label").text();
			
			if(state) {
				$("#table_sel_list").append("<li data-id='"+md5(id)+"'><span>"+str+"</span>"+
				"<div class='iconDelete' style='background-image: url(<c:url value="${path}/res/image/menubar/deleteBtn.png"/>)'></div>"+"</li>");
			} else {
				$("li[data-id="+md5(id)+"]").remove();
			};
			
			var length = $(this).closest("ul").find("input:checked:not([id$=all])").length;
			if( length === 0 ) {
				length = "테이블 종류";
			} else {
				length += "개 선택";
			}
			
			$(".section_table > span").html(length);
		
		});	
		/**/
		$('.section_liquor > .filters_popup > ul > li > input:not([id$=all])').change(function() {
			var state = $(this).is(":checked");
            var id = $(this).val();
			var str = $(this).next("label").text();
			
			if(state) {
				$("#liquor_sel_list").append("<li data-id='"+md5(id)+"'><span>"+str+"</span>"+
				"<div class='iconDelete' style='background-image: url(<c:url value="${path}/res/image/menubar/deleteBtn.png"/>)'></div>"+"</li>");
			} else {
				$("li[data-id="+md5(id)+"]").remove();
			};
		
			var length = $(this).closest("ul").find("input:checked:not([id$=all])").length;
			if( length === 0 ) {
				length = "판매 주류 정보";
			} else {
				length += "개 선택";
			}
			
			$(".section_liquor > span").html(length);
		});	
		/* #filter_sidebar > div.filters > div.section_add_info.is-open > div.filters_popup > ul > li:nth-child(1) > label */
		/* div.section:not(.price)>div.filter-popup>div.body>ul>li>input:not([id$=all])" */
		/* #filter_sidebar > div.filters > div.section_table.is-open > div.filters_popup > ul > li:nth-child(2) > label */
		 /* > div.filters_popup > ul > li > input:not([id$=all]) */
		$("#filter_sidebar > div.filters div.filters_popup > ul > li > input:not([id$=all])").change(function() {
            var all = $(this).closest("ul").find("li:first-of-type>input");
            var siblings = $(this).closest("ul").children(":not(:first-of-type)");
            var checked = siblings.children("input:checked").length;

            all.prop('checked', (checked == siblings.length));
		});
		// select all
		$("div.filter_popup>ul>li>input:not([id$=all])").change(function() {
			console.log("all");
            var all = $(this).closest("ul").find("li:first-of-type>input");
            var siblings = $(this).closest("ul").children(":not(:first-of-type)");
            var checked = siblings.children("input:checked").length;

            all.prop('checked', (checked == siblings.length));
        });	
		
		// selected_list delete
		$("ul#add_info_sel_list").delegate("li", "click", function(e){
			e.stopPropagation();
			$("input#" + $(this).data('id')).prop("checked", false).change();
		});
		
		// selected_list delete
		$("ul#table_sel_list").delegate("li", "click", function(e){
			e.stopPropagation();
			$("input#" + $(this).data('id')).prop("checked", false).change();
		});
		
		// selected_list delete
		$("ul#liquor_sel_list").delegate("li", "click", function(e){
			e.stopPropagation();
			$("input#" + $(this).data('id')).prop("checked", false).change();
		});
		
		/* 예산 전체 클릭 라디오 */
		$('#price_all').on('click', function(e) {
			console.log("!");
		});
		/* 체크박스 전체 클릭 */
		$('#additional_all').change(function() {
			var state = $(this).is(":checked");
			var siblings = $(this).closest('ul').find('li').siblings();
			
			if(state) {
				siblings = siblings.filter(function() {
					return $('input:not(:checked)', this).length == 1;
				});
			} else {
				siblings = siblings.filter(function() {
                    return $('input:checked', this).length == 1;
			});
				
			}
			siblings.children("input").prop('checked', state).change();
		});
		
		$('#table_all').on('click', function(e) {
			var state = $(this).is(":checked");
			var siblings = $(this).closest('ul').find('li').siblings();
			
			if(state) {
				siblings = siblings.filter(function() {
					return $('input:not(:checked)', this).length == 1;
				});
			} else {
				siblings = siblings.filter(function() {
                    return $('input:checked', this).length == 1;
			});
				
			}
			siblings.children("input").prop('checked', state).change();
		});
		
		$('#liquor_all').on('click', function(e) {
			var state = $(this).is(":checked");
			var siblings = $(this).closest('ul').find('li').siblings();
			
			if(state) {
				siblings = siblings.filter(function() {
					return $('input:not(:checked)', this).length == 1;
				});
			} else {
				siblings = siblings.filter(function() {
                    return $('input:checked', this).length == 1;
			});
				
			}
			siblings.children("input").prop('checked', state).change();
		});
		
	});
</script>
</head>
<body>
	<!-- 우측 메뉴바 -->
	<!-- 필터 사이드 바 -->
	<form action="list">
	<div id="filter_sidebar">
		<div class="filters">
			<!-- 필터 타이틀 -->
			<div class="section_title">필터로 더 자세하게 검색</div>
			<!-- 필터 지역 선택 -->
			<div class="section_place">
				<div class="filters_img"
					style="background-image: url(<c:url value="${path}/res/image/menubar/place.png"/>)"></div>
				<span>지역 선택</span>
			</div>
			<!-- 필터 음식 종류 -->
			<div class="section_genre">
				<div class="filters_img"
					style="background-image: url(<c:url value="${path}/res/image/menubar/spoon.png"/>)"></div>
				<span>음식 종류</span>
			</div>
			<!-- 필터  예산(2인 기준)-->
			<div class="section_price">
				<div class="filters_img"
					style="background-image: url(<c:url value="${path}/res/image/menubar/wallet.png"/>)"></div>
				<span>예산(2인 기준)</span>

				<div class="filters_popup">
					<div class="filter-bg"></div>
					<div class="popup_title">예산 (2인 기준)</div>
					<ul>
						<li><input type="radio" id="price_all"
							checked> <label for="price_all">전체</label></li>
						<li><input type="radio" data-val="$" name="price_list" value="101"
							id="38b3eff8baf56627478ec76a704e9b52"> <label
							for="38b3eff8baf56627478ec76a704e9b52">5만원 미만</label></li>
						<li><input type="radio" data-val="$$" name="price_list" value="102"
							id="ec8956637a99787bd197eacd77acce5e"> <label
							for="ec8956637a99787bd197eacd77acce5e">5-10만원</label></li>
						<li><input type="radio" data-val="$$$" name="price_list" value="103"
							id="6974ce5ac660610b44d9b9fed0ff9548"> <label
							for="6974ce5ac660610b44d9b9fed0ff9548">10-16만원</label></li>
						<li><input type="radio" data-val="$$$$" name="price_list" value="104"
							id="c9e1074f5b3f9fc8ea15d152add07294"> <label
							for="c9e1074f5b3f9fc8ea15d152add07294">16만원 이상</label></li>
					</ul>
					<button type="button" class="confirm_btn">확인</button>
				</div>
			</div>
			<!-- 필터 부가 정보 -->
			<div class="section_add_info">
				<div class="filters_img"
					style="background-image: url(<c:url value="${path}/res/image/menubar/cup.png"/>)"></div>
				<span>부가 정보</span>
				<ul class="selected_list" id="add_info_sel_list"></ul>
				<div class="filters_popup">
					<div class="filter-bg"></div>
					<div class="popup_title">부가 정보</div>
					<ul>
						<li><input type="checkbox" id="additional_all"><label
							for="additional_all">전체 선택</label></li>
						<li><input type="checkbox"
							id="757b505cfd34c64c85ca5b5690ee5293" value="201" name="add_info"><label
							for="757b505cfd34c64c85ca5b5690ee5293">늦은 저녁에도 영업을 하는</label></li>
						<li><input type="checkbox"
							id="854d6fae5ee42911677c739ee1734486" value="202" name="add_info"><label
							for="854d6fae5ee42911677c739ee1734486">단체석이 있는</label></li>
						<li><input type="checkbox"
							id="e2c0be24560d78c5e599c2a9c9d0bbd2" value="203" name="add_info"><label
							for="e2c0be24560d78c5e599c2a9c9d0bbd2">데이트 하기 좋은</label></li>
						<li><input type="checkbox"
							id="274ad4786c3abca69fa097b85867d9a4" value="204" name="add_info"><label
							for="274ad4786c3abca69fa097b85867d9a4">비즈니스 미팅에 어울리는</label></li>
						<li><input type="checkbox"
							id="eae27d77ca20db309e056e3d2dcd7d69" value="205" name="add_info"><label
							for="eae27d77ca20db309e056e3d2dcd7d69">룸이 준비되어 있는</label></li>
						<li><input type="checkbox"
							id="7eabe3a1649ffa2b3ff8c02ebfd5659f" value="206" name="add_info"><label
							for="7eabe3a1649ffa2b3ff8c02ebfd5659f">런치 메뉴가 있는</label></li>
						<li><input type="checkbox"
							id="69adc1e107f7f7d035d7baf04342e1ca" value="207" name="add_info"><label
							for="69adc1e107f7f7d035d7baf04342e1ca">브런치 메뉴가 있는</label></li>
						<li><input type="checkbox"
							id="091d584fced301b442654dd8c23b3fc9" value="208" name="add_info"><label
							for="091d584fced301b442654dd8c23b3fc9">야외 테라스 자리가 있는</label></li>
						<li><input type="checkbox"
							id="b1d10e7bafa4421218a51b1e1f1b0ba2" value="209" name="add_info"><label
							for="b1d10e7bafa4421218a51b1e1f1b0ba2">전문 소믈리에가 있는</label></li>
						<li><input type="checkbox"
							id="6f3ef77ac0e3619e98159e9b6febf557" value="210" name="add_info"><label
							for="6f3ef77ac0e3619e98159e9b6febf557">베이비 시트가 준비되어 있는</label></li>
						<li><input type="checkbox"
							id="eb163727917cbba1eea208541a643e74" value="211" name="add_info"><label
							for="eb163727917cbba1eea208541a643e74">코르키지가 가능한</label></li>
						<li><input type="checkbox"
							id="1534b76d325a8f591b52d302e7181331" value="212" name="add_info"><label
							for="1534b76d325a8f591b52d302e7181331">24시간 영업을 하는</label></li>
					</ul>
					<button type="button" class="confirm_btn">확인</button>
				</div>
			</div>
			<!-- 필터 테이블 종류 -->
			<div class="section_table">
				<div class="filters_img"
					style="background-image: url(<c:url value="${path}/res/image/menubar/table.png"/>)"></div>
				<span>테이블 종류</span>
				<ul class="selected_list" id="table_sel_list"></ul>

				<div class="filters_popup">
					<div class="filter-bg"></div>
					<div class="popup_title">테이블 종류</div>
					<ul>
						<li><input type="checkbox" id="table_all"><label
							for="table_all">전체 선택</label></li>
						<li><input type="checkbox"
							id="34ed066df378efacc9b924ec161e7639" value="301" name="table_type"><label
							for="34ed066df378efacc9b924ec161e7639">홀 테이블</label></li>
						<li><input type="checkbox"
							id="577bcc914f9e55d5e4e4f82f9f00e7d4" value="302" name="table_type"><label
							for="577bcc914f9e55d5e4e4f82f9f00e7d4">바 테이블</label></li>
						<li><input type="checkbox"
							id="11b9842e0a271ff252c1903e7132cd68" value="303" name="table_type"><label
							for="11b9842e0a271ff252c1903e7132cd68">룸 테이블</label></li>
						<li><input type="checkbox"
							id="37bc2f75bf1bcfe8450a1a41c200364c" value="304" name="table_type"><label
							for="37bc2f75bf1bcfe8450a1a41c200364c">좌식 테이블</label></li>
					</ul>
					<button type="button" class="confirm_btn">확인</button>
				</div>
			</div>
			<!-- 필터 판매 주류 종류 -->
			<div class="section_liquor">
				<div class="filters_img"
					style="background-image: url(<c:url value="${path}/res/image/menubar/cocktail.png"/>)"></div>
				<span>판매 주류 종류</span>
				<ul class="selected_list" id="liquor_sel_list"></ul>

				<div class="filters_popup">
					<div class="filter-bg"></div>
					<div class="popup_title">판매 주류 종류</div>
					<ul>
						<li><input type="checkbox" id="liquor_all"><label
							for="liquor_all">전체 선택</label></li>
						<li><input type="checkbox"
							id="816b112c6105b3ebd537828a39af4818" value="401" name="alcohol_type"><label
							for="816b112c6105b3ebd537828a39af4818">소주</label></li>
						<li><input type="checkbox"
							id="69cb3ea317a32c4e6143e665fdb20b14" value="402" name="alcohol_type"><label
							for="69cb3ea317a32c4e6143e665fdb20b14">맥주</label></li>
						<li><input type="checkbox"
							id="bbf94b34eb32268ada57a3be5062fe7d" value="403" name="alcohol_type"><label
							for="bbf94b34eb32268ada57a3be5062fe7d">전통주</label></li>
						<li><input type="checkbox"
							id="4f4adcbf8c6f66dcfc8a3282ac2bf10a" value="404" name="alcohol_type"><label
							for="4f4adcbf8c6f66dcfc8a3282ac2bf10a">일본술</label></li>
						<li><input type="checkbox"
							id="bbcbff5c1f1ded46c25d28119a85c6c2" value="405" name="alcohol_type"><label
							for="bbcbff5c1f1ded46c25d28119a85c6c2">양주</label></li>
						<li><input type="checkbox"
							id="8cb22bdd0b7ba1ab13d742e22eed8da2" value="406" name="alcohol_type"><label
							for="8cb22bdd0b7ba1ab13d742e22eed8da2">와인</label></li>
						<li><input type="checkbox"
							id="f4f6dce2f3a0f9dada0c2b5b66452017" value="407" name="alcohol_type"><label
							for="f4f6dce2f3a0f9dada0c2b5b66452017">고량주</label></li>
						<li><input type="checkbox"
							id="0d0fd7c6e093f7b804fa0150b875b868" value="408" name="alcohol_type"><label
							for="0d0fd7c6e093f7b804fa0150b875b868">칵테일</label></li>
					</ul>
					<button type="button" class="confirm_btn">확인</button>
				</div>
			</div>
			<!-- 필터 주차 기능 -->
			<div class="section_parking">
				<div class="filters_img"
					style="background-image: url(<c:url value="${path}/res/image/menubar/car.png"/>)"></div>
				<input type="checkbox" id="parking_ckb" value="1" name="parking_available"> <label
					for="parking_ckb">주차 가능</label>
			</div>
		</div>
		<!-- 필터 레스토랑 검색 버튼 -->
		<input type="submit" class="serch_btn" value="레스토랑 검색">
	</div>
	</form>
</body>
</html>