<%@page import="java.util.List"%>
<%@page import="com.javaex.model.ShopVo"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밥풀 - 카페/베이커리</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='${path}/res/css/shoplist.css?ver=1'/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">

<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

</head>
<body>
	<%@include file="top_bar.jsp"%>
	
	<%
		List<ShopVo> shoplist = (ArrayList<ShopVo>) request.getAttribute("shopList");
	%>
	<!--리스트 베너 시작  -->
	<div id="list_banner"
		style="background : url(<c:url value='${path}/res/image/list_banner.png'/>)">
		<div id="banner_wrap">
			<div id="banner_title">카페/베이커리</div>
			<div id="banner_line">───</div>
			<div id="banner_title_eng">CAFE & BAKERY</div>
		</div>
	</div>
	<!--리스트 베너 끝 -->

	<!--목록 시작  -->
	<div id="content_wrap">
		<div id="content_list">
			<!--점포 숫자-->
			<div id="shop_number">
				<p>
					레스토랑 총<span><%=shoplist.size()%></span>개가 검색되었습니다.
				</p>
			</div>
			<!--점포 숫자 끝-->

			<!--목록 정렬 시작  -->
			<div id="shop_sort">
				<ul id="shop_sort_list">
					<li id="sort_star"><span>별점순</spans></li>
					<li id="sort_resv"><span>예약순</span></li>
					<li id="sort_view"><span>조회순</span></li>
				</ul>
			</div>
			<!--목록 정렬 끝 -->

			<!--상점 목록 시작  -->
			<div id="shop_list">
				<%
					for (int i = 0; i < shoplist.size(); i++) {
						ShopVo shopvo = shoplist.get(i);
						if ((i + 1) % 3 == 1) {
				%>
				<div class="shop_first">
					<div class="list_img">
						<a class="img_a" href="detail?shopidx=<%=shopvo.getShop_idx() %>"
							style="background-image: url(<c:url value="${path}/res/image/default.png"/>)">
							<div class="img_top">
								<span>예약 <%=shopvo.getShop_reserve()%> 리뷰 <%=shopvo.getShop_review()%>
									조회수<%=shopvo.getShop_view()%></span> <span class="star_"><i
									class="far fa-star fa-2x"></i></span>
							</div>
							<div class="img_bottom">
								<div class="shop_name"><%=shopvo.getShop_title()%></div>
								<div class="shop_area"><%=shopvo.getShop_location()%></div>
							</div>
						</a>
					</div>
					<div class="shop_desc">
						<div class="shop_star">
							<span class="star_span" id="shop_tmp<%=shopvo.getShop_idx()%>" style="padding:0;display: inline-block;"></span><span
								class="shop_score"><%=shopvo.getShop_score()%>점</span>
						</div>
						<div class="shop_budget"><%=shopvo.getBudget()%></div>
						<div class="shop_comment"><%=shopvo.getShop_comment()%></div>
					</div>
					<div class="review_btn">
						<a class="review_a"
							href="detail?shopidx=<%=shopvo.getShop_idx()%>">리뷰 쓰기</a>
					</div>
				</div>
				<%
					} else {
				%>
				<div class="shop_medium">
					<div class="list_img"
						style="background-image: url(<c:url value="${path}/res/image/default.png"/>)">
						<a class="img_a" href="detail?shopidx=<%=shopvo.getShop_idx()%>"
							style="background-image: url(<c:url value="${path}/res/image/default.png"/>)">
							<div class="img_top">
								<span>예약 <%=shopvo.getShop_reserve()%> 리뷰 <%=shopvo.getShop_review()%>
									조회수<%=shopvo.getShop_view()%></span> <span class="star_"><i
									class="far fa-star fa-2x"></i></span>
							</div>
							<div class="img_bottom">
								<div class="shop_name"><%=shopvo.getShop_title()%></div>
								<div class="shop_area"><%=shopvo.getShop_location()%></div>
							</div>
						</a>
					</div>
					<div class="shop_desc">
						<div class="shop_star">
							<span class="star_span" id="shop_tmp<%=shopvo.getShop_idx()%>" style="padding:0;display: inline-block;"></span><span
								class="shop_score"><%=shopvo.getShop_score()%>점</span>
						</div>
						<div class="shop_budget"><%=shopvo.getBudget()%></div>
						<div class="shop_comment"><%=shopvo.getShop_comment()%></div>
					</div>
					<div class="review_btn">
						<a class="review_a"
							href="detail?shopidx=<%=shopvo.getShop_idx()%>">리뷰 쓰기</a>
					</div>
				</div>
				<%
					}
					}
				%>
			</div>
			<!--상점 목록 끝 -->
			<%@include file="menubar.jsp"%>
			<!--페이지 번호 시작-->
			<div id="page_list">
				<ul>
					<li>1</li>
				</ul>
			</div>
			<!--페이지 번호 끝-->
		</div>
	</div>
	<!--목록 끝  -->
	<%@include file="footer.jsp"%>
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script>
      <c:forEach items="${shopList}" var="shop">
      $("#shop_tmp${shop.shop_idx}").rateYo({
    	  
  		rating :  ${shop.shop_score},
  		starWidth: "20px",
  	    halfStar: true,
  	  	readOnly: true,
  		starSvg : '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>'
  		});  
      </c:forEach>

      $(".star_ > i ").on('click',function (e) {
         e.preventDefault();
         $(this).closest("span").toggleClass("on off")
      });
      
      $("#sort_star").click(function() {
    	  var soltTemp = document.location.href.indexOf("solt");
    	  if(soltTemp == -1){
    		document.location.href += "&solt=1";
    	  } else{
    		  var solt = document.location.href.substring(soltTemp, soltTemp+6);
    		  document.location.href = document.location.href.replace(solt,"solt=1")
    	  }
		});
      
      $("#sort_resv").click(function() {
    	  var soltTemp = document.location.href.indexOf("solt");
    	  if(soltTemp == -1){
    		document.location.href += "&solt=2";
    	  } else{
    		  var solt = document.location.href.substring(soltTemp, soltTemp+6);
    		  document.location.href = document.location.href.replace(solt,"solt=2")
    	  }
		});
      
      $("#sort_view").click(function() {
    	  var soltTemp = document.location.href.indexOf("solt");
    	  if(soltTemp == -1){
    		document.location.href += "&solt=3";
    	  } else{
    		  var solt = document.location.href.substring(soltTemp, soltTemp+6);
    		  document.location.href = document.location.href.replace(solt,"solt=3")
    	  }
		});
</script>
</html>