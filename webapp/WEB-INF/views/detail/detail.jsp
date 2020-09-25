<%@page import="com.javaex.model.ReservationVo"%>
<%@page import="com.javaex.model.ShopUserVo"%>
<%@page import="com.javaex.model.ShopVo"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>밥풀 - 카페/베이커리</title>

<link rel="stylesheet" href="<c:url value='${path}/res/css/detail.css?ver=1'/>">
<link rel="stylesheet" href="<c:url value='${path}/res/css/bootstrap.min.css'/>">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">

<script src="http://code.jquery.com/jquery.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

</head>

<%@include file="../top_bar.jsp"%>
<body>

	<!-- container -->
	<div id="container">
		<%
			ShopVo shopvo = (ShopVo) request.getAttribute("shopOne");
			pageContext.setAttribute("id", session.getAttribute("sessionID"));
			pageContext.setAttribute("star", shopvo.getShop_score());
			pageContext.setAttribute("shopidx", shopvo.getShop_idx());
			%>

		<!-- 상단에 배너가 있는 레이아웃 -->
		<div id="banner_wrap">
			<div id="banner" class="restaurant_detail">
				<div class="i_wrap background">
					<div class="film"></div>
					<img src="<c:url value='${path}/res/image/walkerhill.jpg'/>" alt="">
				</div>
				<div class="inner_wrap">
					<div class="inner">
						<div class="title">
							<span class="name"><%=shopvo.getShop_title()%></span> <span
								class="info"><%=shopvo.getShop_location()%> · <%=shopvo.getFood_type()%>
							</span>
							<div class="count border_radius soft">
								예약
								<%=shopvo.getShop_reserve()%>건/ 리뷰
								<%=shopvo.getShop_review()%>건 / 조회
								<%=shopvo.getShop_view()%>건
							</div>
							<button class="empty " data-type="poing.restaurants.favorite"
								data-id="28654">
								찜하기<i class="icon heart large "></i>
							</button>
						</div>
						<ul class="info_list">
							<li class="item grade">
								<div class="name">별점</div>
								<div class="text">
									<div id="star_score"></div>
									<div id="shop_score">
										<span><%=shopvo.getShop_score()%></span>
									</div>
								</div>
							</li>
							<li class="item">
								<div class="name">전화번호</div>
								<div class="text">
									<%=shopvo.getShop_phone()%>
								</div>
							</li>
							<li class="item">
								<div class="name">주소</div>
								<div class="text" id="shop_addr">
									<%=shopvo.getShop_addr()%></div>
							</li>
							<li class="item">
								<div class="name">영업시간</div>
								<div class="text">
									<%=shopvo.getShop_time()%>
								</div>
							</li>
							<li class="item">
								<div class="name">휴무일</div>
								<div class="text"><%=shopvo.getShop_close()%></div>
							</li>

							<li class="item">
								<div class="name">예산</div>
								<div class="text"><%=shopvo.getBudget()%></div>
							</li>
							<li class="item description">
								<div class="name">한줄 설명</div>
								<div class="text"><%=shopvo.getShop_comment()%></div>
							</li>
						</ul>
						<div class="slider">
							<div id="detail_slider">
								<div class="i_wrap">
									<div class="image" data-index="0" id="shop_photo"
										style="width:319px; height:213px; background-image:url(<c:url value='${path}/res/image/walkerhill1.jpg'/>)"
										title="양재해장국 매장 이미지"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script>/*$.ajax({url: '/restaurant/AjaxRestaurantInfo', type:'POST', data:{id:"28654", t:true} });*/</script>
		</div>
		<div id="content_wrap">
			<div id="content" class="detail review">
				<ul class="tab">
					<li class="item selected" id="info"><span>정보</span></li>
					<li class="item" id="photo"><span>포토</span></li>
					<li class="item" id="review"><span>리뷰</span></li>
					<li class="item" id="menu"><span>메뉴</span></li>
					<li class="item" id="map"><span>지도</span></li>
				</ul>
			</div>

			<div id="detail_content">
				<div id="import"></div>
				<div id="naverMap"></div>
			</div>
			<div id="sidebar_wrap" class="detail">
				<div class="container">

					<!-- Button to Open the Modal -->
					<%if (session.getAttribute("sessionID") == null) { %>
					<button type="button" class="btn btn-primary" onclick="loginPopUp()"
					id="reservation_btn">예약 하기</button>
						<% } else{ %>
					<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal" id="reservation_btn">예약 하기</button>
					<% } %>
					<!-- The Modal -->
					<div class="modal fade" id="myModal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">예약하기</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body" id="modal-body">
									<form action="reservation" method="post" class="a">
										<div class="shop_title_detail_div">가게 이름</div>
										<input type="text" class="shop_title_detail" name="shop_title" value="<%=shopvo.getShop_title()%>" readonly="readonly">
										<div class="res_date_detail_div">예약 날짜</div>
										<select class="res_date_detail" name="res_year">
											<option value="2020">2020
											<option value="2021">2021
											<option value="2022">2022
											<option value="2023">2023
											<option value="2024">2024
											<option value="2025">2025
											<option value="2026">2026
											<option value="2027">2027
											<option value="2028">2028
											<option value="2029">2029
											<option value="2030">2030
										</select>
										<div class="res_date_detail_div2">년</div>
										<select class="res_date_detail2" name="res_month">
											<option value="01">1
											<option value="02">2
											<option value="03">3
											<option value="04">4
											<option value="05">5
											<option value="06">6
											<option value="07">7
											<option value="08">8
											<option value="09">9
											<option value="10">10
											<option value="11">11
											<option value="12">12
										</select>
										<div class="res_date_detail_div3">월</div>
										<select class="res_date_detail3" name="res_date">
											<option value="01">1
											<option value="02">2
											<option value="03">3
											<option value="04">4
											<option value="05">5
											<option value="06">6
											<option value="07">7
											<option value="08">8
											<option value="09">9
											<option value="10">10
											<option value="11">11
											<option value="12">12
											<option value="13">13
											<option value="14">14
											<option value="15">15
											<option value="16">16
											<option value="17">17
											<option value="18">18
											<option value="19">19
											<option value="20">20
											<option value="21">21
											<option value="22">22
											<option value="23">23
											<option value="23">24
											<option value="23">25
											<option value="23">26
											<option value="23">27
											<option value="23">28
											<option value="23">29
											<option value="23">30
											<option value="23">31
										</select>
										<div class="res_date_detail_div4">일</div>
										<div class="res_time_detail_div">예약 시간</div>
										<select class="res_time_detail" name="res_hour">
											<option value="00">0
											<option value="01">1
											<option value="02">2
											<option value="03">3
											<option value="04">4
											<option value="05">5
											<option value="06">6
											<option value="07">7
											<option value="08">8
											<option value="09">9
											<option value="10">10
											<option value="11">11
											<option value="12">12
											<option value="13">13
											<option value="14">14
											<option value="15">15
											<option value="16">16
											<option value="17">17
											<option value="18">18
											<option value="19">19
											<option value="20">20
											<option value="21">21
											<option value="22">22
											<option value="23">23
										</select>
										<div class="res_time_detail_div2">시</div>
										<select class="res_time_detail2" name="res_min">
											<option value="00">00
											<option value="10">10
											<option value="20">20
											<option value="30">30
											<option value="40">40
											<option value="50">50
										</select>
										<div class="res_time_detail_div3">분</div>
										<div class="res_customer_detail_div">예약 인원</div>
										<input type="text" class="res_customer_detail" name="res_customer">
										<div class="res_customer_detail_div2">명</div>
										<div class="rev_phone_div">예약자 핸드폰 번호</div>
										<input type="text" class="rev_phone" name="rev_phone">
										<input type="submit" value="예약하기" class="reservation_submit">
									</form>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>

							</div>
						</div>
					</div>

				</div>
				<div id="editor_recommend_restaurant" class="sidebar">
					<div class="title">추천 리뷰어</div>
					<ul class="list">
						<li class="item"><a class="i_wrap" href="/timeline/236031">
								<i class="image border_radius circle"
								style="background-image:url(<c:url value="${path}/res/image/lee.jpg"/>)"></i>
						</a>
							<div class="detail">
								<div class="name">
									<a href="/timeline/236031">이수진</a>
								</div>
								<div class="info">
									101 리뷰, <span data-type="poing.user.follow" data-id="236031">113</span>
								</div>

							</div></li>
						<li class="item"><a class="i_wrap" href="/timeline/336595">
								<i class="image border_radius circle"
								style="background-image: url(<c:url value="${path}/res/image/lee.jpg"/>)"></i>
						</a>
							<div class="detail">
								<div class="name">
									<a href="/timeline/336595">박소은</a>
								</div>
								<div class="info">
									120 리뷰, <span data-type="poing.user.follow" data-id="336595">64</span>
								</div>

							</div></li>
						<li class="item"><a class="i_wrap" href="/timeline/611090">
								<i class="image border_radius circle"
								style="background-image: url(<c:url value="${path}/res/image/lee.jpg"/>)"></i>
						</a>
							<div class="detail">
								<div class="name">
									<a href="/timeline/611090">jy</a>
								</div>
								<div class="info">
									455 리뷰, <span data-type="poing.user.follow" data-id="611090">142</span>
								</div>

							</div></li>
						<li class="item"><a class="i_wrap" href="/timeline/537740">
								<i class="image border_radius circle"
								style="background-image: url(<c:url value="${path}/res/image/lee.jpg"/>)"></i>
						</a>
							<div class="detail">
								<div class="name">
									<a href="/timeline/537740">김규철</a>
								</div>
								<div class="info">
									35 리뷰, <span data-type="poing.user.follow" data-id="537740">14</span>
								</div>

							</div></li>
						<li class="item"><a class="i_wrap" href="/timeline/599857">
								<i class="image border_radius circle"
								style="background-image: url(<c:url value="${path}/res/image/lee.jpg"/>)"></i>
						</a>
							<div class="detail">
								<div class="name">
									<a href="/timeline/599857">양정아</a>
								</div>
								<div class="info">
									67 리뷰, <span data-type="poing.user.follow" data-id="599857">24</span>
								</div>

							</div></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
	<script type="text/javascript"src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cyozvucbzs&submodules=geocoder"></script>

	<script>
        $(document).ready(function(){  
        	$('.action > button').click(function () {
        		var tmp = '${id}';
    			if( tmp = null){
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
    			}else{
    				alert("로그인되어있슴")
    			}
    		})
        	
        	$("#star_score").rateYo({
    			rating : ${shopOne.shop_score},
    			starWidth: "23px",
    			halfStar: true,
    			readOnly: true,
    			onInit: function (rating, rateYoInstance) {
    				/* mk_comment(rating,"#grade_comment${review.shopUser.user_idx}","#grade_score${review.shopUser.user_idx}");
    				$("#grade${review.shopUser.user_idx}").rateYo("option", "readOnly", true); */
    			},
    			starSvg : '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>'
    		});        	
        	
            $("#content > ul > li > span").mouseover(function(){
            	$(this).css('cursor','pointer');
            });
            
            
            $("#content > ul > li > span").on("click", function(){
            	$(this).parent().addClass("selected").siblings().removeClass("selected");
                
            	loadPage();
            });
            
            $("#import").load("detail/info.do", {
            	"shopidx" : ${shopidx}
            });
            
            function loadPage(){
            	
            	if($("#content > ul > .item.selected")[0] == $("#info")[0]) {
            		$("#naverMap").hide();
            		$("#import").unload();
            		$("#import").load("detail/info.do", {"shopidx" : ${shopidx}});
            		$("#import").show();
            	}
            	else if($("#content > ul > .item.selected")[0] == $("#photo")[0]) {
            		$("#naverMap").hide();
            		$("#import").unload();
            		$("#import").load("detail/photo.do")
            		$("#import").show();
            	}
				else if($("#content > ul > .item.selected")[0] == $("#review")[0]){
					$("#naverMap").hide();
					$("#import").unload();
            		$("#import").load("detail/review.do",{
            			"shopidx" : ${shopidx},
            			"shopId" : "${shopOne.shop_id}"
            		});
            		$.getScript("<c:url value='${path}/res/js/jquery.magnific-popup.js'/>");
            		$("#import").show();
            		
            	}
            	else if($("#content > ul > .item.selected")[0] == $("#menu")[0]){
            		$("#naverMap").hide();
            		$("#import").unload();
            		$("#import").load("detail/menu.do")
            		$("#import").show();
            	}
            	else if($("#content > ul > .item.selected")[0] == $("#map")[0]){
            		$("#import").hide();
            		$("#import").unload();
            		$("#naverMap").show();
            	} 
            }
            
            //지도 관련
            var shop_addr = "${shopOne.shop_addr}".substring(0,"${shopOne.shop_addr}".indexOf("|"))
            if(shop_addr == ""){
               shop_addr = "${shopOne.shop_addr}"
                   contentString = [
                       '<div class="marker_tooltip">',
                       '   <h3>${shopOne.shop_title}</h3>',
                       '   <p><i1>'+shop_addr+'</i1>',
                       '       <img src="<c:url value='${path}/res/image/walkerhill1.jpg'/>" width="100" height="100"  /><br/>',
                       '       <i2>${shopOne.shop_phone} | ${shopOne.shop_time} | ${shopOne.shop_close}<br/></i2>',
                       '   </p>',
                       '</div>'
                      ].join('');
            }else{
                contentString = [
                    '<div class="marker_tooltip">',
                    '   <h3>${shopOne.shop_title}</h3>',
                    '   <p><i1>'+shop_addr+'<br>'+"${shopOne.shop_addr}".substring("${shopOne.shop_addr}".indexOf("|")+1)+'<br/></i1>',
                    '       <img src="<c:url value='${path}/res/image/walkerhill1.jpg'/>" width="100" height="100"  /><br/>',
                    '       <i2>${shopOne.shop_phone} | ${shopOne.shop_time} | ${shopOne.shop_close}<br/></i2>',
                    '   </p>',
                    '</div>'
                   ].join('');
            }
            var shop_position = new naver.maps.LatLng(37.5666805, 126.9784147),
             map = new naver.maps.Map('naverMap', {
                 center: shop_position,
                 zoom: 15
             }),
             marker = new naver.maps.Marker({
                 map: map,
                 position: shop_position,
             });
             naver.maps.Service.geocode({
                 address: shop_addr
             }, function(status, response) {
                 if (status !== naver.maps.Service.Status.OK) {
                     return alert('지도데이터를 불러올수 없습니다!')
                 }

                 var result = response.result, items = result.items;
                 if(items.length == 0){
                    $("#map").click(function () {
                       alert('지도데이터를 불러올수 없습니다!')
                  })
                 }else{
                 shop_position = new naver.maps.LatLng(items[0].point.y, items[0].point.x)
                 map.setCenter(shop_position)
                 map.setZoom(15)
                 marker.setPosition(shop_position)
                 marker.setMap(map)
                var infowindow = new naver.maps.InfoWindow({
                   content: contentString
                   });
                   
                   naver.maps.Event.addListener(marker, "click", function(e) {
                   if (infowindow.getMap()) {
                       infowindow.close();
                   } else {
                       infowindow.open(map, marker);
                   }
                   }); 
                 }
             });

                 //지도관련 끝
        
		$('.reservation_submit').click(function(e) {
			e.preventDefault();
			var action = $('.a').attr("action");
			
			var form_data = {
				
					shop_id : "${shopOne.shop_id}",
					res_customer : $(".res_customer_detail").val(),
					shop_title : $(".shop_title_detail").val(),
					rev_phone : $(".rev_phone").val(),
					res_date : $(".res_date_detail").val() + "-" + $(".res_date_detail2").val() + "-" + 
					$(".res_date_detail3").val() +" "+  $(".res_time_detail").val() + ":" + $(".res_time_detail2").val()
					
				};
		
			$.ajax({
				type : "POST",
				url : action,
				data : form_data,
				success : function(data) {
				
				},
				error : function() {
					
				}
		
			});
		});      
}); 
        //로그인 팝업 관련
		function loginPopUp(){
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
	    }
>>>>>>> branch 'master' of https://github.com/wnsdud8139/Project.git
    </script>
 
</body>
</html>
