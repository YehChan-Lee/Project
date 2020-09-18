<%@page import="com.javaex.model.ShopVo"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>밥풀 - 카페/베이커리</title>
    
    <link rel="stylesheet" href="<c:url value='${path}/res/css/detail.css?ver=1'/>">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet"href="<c:url value='${path}/res/css/star-rating-svg.css'/>">
    
    <script src="http://code.jquery.com/jquery.js"></script>
</head>

<%@include file="../top_bar.jsp"%>
<body>
    
    <!-- container -->
    <div id="container">
	<%
	ShopVo shopvo = (ShopVo)request.getAttribute("shopOne");
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
                            <span class="name"><%=shopvo.getShop_title() %></span>
                            <span class="info"><%=shopvo.getShop_location() %> · <%=shopvo.getFood_type() %> </span>
                            <div class="count border_radius soft">예약 <%=shopvo.getShop_reserve() %>건/ 리뷰 <%=shopvo.getShop_review() %>건 / 조회 <%=shopvo.getShop_view()%>건 </div>
                            <button class="empty " data-type="poing.restaurants.favorite" data-id="28654">찜하기<i class="icon heart large "></i>
                            </button>
                        </div>
                        <ul class="info_list">
                            <li class="item grade">
                                <div class="name">별점</div>
                                <div class="text">
                                	<div id="star_score"></div>
                                    <div id="shop_score"><span><%=shopvo.getShop_score()%></span></div> 
                                </div>
                            </li>
                            <li class="item">
                                <div class="name">전화번호
                                </div>
                                <div class="text">
                                   <%=shopvo.getShop_phone()%> </div>
                            </li>
                            <li class="item">
                                <div class="name">
                                    	주소
                                </div>
                                <div class="text">
                                    	<%=shopvo.getShop_addr() %></div>
                            </li>
                            <li class="item">
                                <div class="name">
                                   	 영업시간
                                </div>
                                <div class="text">
                                    <%=shopvo.getShop_time() %> </div>
                            </li>
                            <li class="item">
                                <div class="name">휴무일</div>
                                <div class="text"><%=shopvo.getShop_close() %></div>
                            </li>

                            <li class="item">
                                <div class="name">예산</div>
                                <div class="text"><%=shopvo.getBudget() %></div>
                            </li>
                            <li class="item description">
                                <div class="name">한줄 설명</div>
                                <div class="text"><%=shopvo.getShop_comment() %></div>
                            </li>
                        </ul>
                        <div class="slider">
                            <div id="detail_slider">
                                <div class="i_wrap">
                                    <div class="image" data-index="0"
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
                    <li class="item selected" id="info">
                        	<span>정보</span>
                    </li>
                    <li class="item" id="photo">
                        	<span>포토</span>
                    </li>
                    <li class="item" id="review">
                        	<span>리뷰</span>
                    </li>
                    <li class="item" id="menu">
                        	<span>메뉴</span>
                    </li>
                    <li class="item" id="map">
                        	<span>지도</span>
                    </li>
                </ul>
            </div>
            
            <div id="import">
            
            </div>            
            <div id="sidebar_wrap" class="detail">
                <div id="reserve_button" class="sidebar empty">
                    <button id="btnGoReview" class="red_fill border_radius soft">리뷰 쓰러가기</button>
                </div>

                <script>
                	// 버튼 누르면 링크 옮겨지기
                    $("#btnGoReview").on("click", function () {
                        location.href = "";
                    });
                </script>

                <div id="editor_recommend_restaurant" class="sidebar">
                    <div class="title">
                       	 추천 리뷰어
                    </div>
                    <ul class="list">
                        <li class="item">
                            <a class="i_wrap" href="/timeline/236031">
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
                                
                            </div>
                        </li>
                        <li class="item">
                            <a class="i_wrap" href="/timeline/336595">
                                <i class="image border_radius circle"
                                    style="background-image:url(../pics/detail/lee.jpg)"></i>
                            </a>
                            <div class="detail">
                                <div class="name">
                                    <a href="/timeline/336595">박소은</a>
                                </div>
                                <div class="info">
                                    120 리뷰, <span data-type="poing.user.follow" data-id="336595">64</span>
                                </div>
                                
                            </div>
                        </li>
                        <li class="item">
                            <a class="i_wrap" href="/timeline/611090">
                                <i class="image border_radius circle"
                                    style="background-image:url(../pics/detail/lee.jpg)"></i>
                            </a>
                            <div class="detail">
                                <div class="name">
                                    <a href="/timeline/611090">jy</a>
                                </div>
                                <div class="info">
                                    455 리뷰, <span data-type="poing.user.follow" data-id="611090">142</span>
                                </div>
                                
                            </div>
                        </li>
                        <li class="item">
                            <a class="i_wrap" href="/timeline/537740">
                                <i class="image border_radius circle"
                                    style="background-image:url(../pics/detail/lee.jpg)"></i>
                            </a>
                            <div class="detail">
                                <div class="name">
                                    <a href="/timeline/537740">김규철</a>
                                </div>
                                <div class="info">
                                    35 리뷰, <span data-type="poing.user.follow" data-id="537740">14</span>
                                </div>
                                
                            </div>
                        </li>
                        <li class="item">
                            <a class="i_wrap" href="/timeline/599857">
                                <i class="image border_radius circle"
                                    style="background-image:url(../pics/detail/lee.jpg)"></i>
                            </a>
                            <div class="detail">
                                <div class="name">
                                    <a href="/timeline/599857">양정아</a>
                                </div>
                                <div class="info">
                                    67 리뷰, <span data-type="poing.user.follow" data-id="599857">24</span>
                                </div>
                                
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../footer.jsp"%>
	<script src="<c:url value='${path}/res/js/jquery.star-rating-svg.js'/>"></script>
    <script>
        $(document).ready(function(){       			
			 $("#star_score").starRating({
				initialRating :${star},
				starShape : 'rounded',
				useGradient : false,
				activeColor : '#f05e23',
				strokeWidth : 5,
				readOnly : true,
				starSize : 25
			});
				
        	
        	loadPage();
            
            $("#content > ul > li > span").mouseover(function(){
            	$(this).css('cursor','pointer');
            	console.log($(this).parent());
            	console.dir($(this).parent());
            });
            
            
            $("#content > ul > li > span").on("click", function(){
            	$(this).parent().addClass("selected").siblings().removeClass("selected");
                
            	loadPage();
            });
            function loadPage(){
            	
            	if($("#content > ul > .item.selected")[0] == $("#info")[0]) {            		
            		$("#import").load("detail/info.do", {"shopidx" : ${shopidx}});
            	}
            	else if($("#content > ul > .item.selected")[0] == $("#photo")[0]) {
            		$("#import").unload();
            		$("#import").load("detail/photo.do")
            	}
            }
            
            function asyncMovePage(url){
                // ajax option
                var ajaxOption = {
                        url : url,
                        async : true,
                        type : "POST",
                        dataType : "html",
                        cache : false
                };
                
                $.ajax(ajaxOption).done(function(data){
                    // Contents 영역 삭제
                    $('#import').children().remove();
                    // Contents 영역 교체
                    $('#import').html(data);
                });
            }
        });
    </script>
</body>
</html>
