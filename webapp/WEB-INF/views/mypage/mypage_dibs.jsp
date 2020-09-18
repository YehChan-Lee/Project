<%@page import="java.util.ArrayList"%>
<%@page import="com.javaex.model.AllVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>Insert title here</title>
=======
>>>>>>> 3cfb1ad5ada02fe4bd84ef55304a245d168aba95
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="<c:url value='${path}/res/js/jquery-ui.js'/>" type="text/javascript"></script>
<script src="<c:url value='${path}/res/js/jquery.rateyo.min.js'/>" type="text/javascript"></script>
<<<<<<< HEAD
=======

>>>>>>> 3cfb1ad5ada02fe4bd84ef55304a245d168aba95
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>

<div id="reservation" class="body empty">
	<div id="reserve_filter">
		<ul>
			<li>찜한 매장</li>
		</ul>
	</div>
	<%
	   List<AllVo> dibsList = (ArrayList<AllVo>)request.getAttribute("dibsList"); 
	%>
         <%            
            for(int i=0;i<dibsList.size();i++){
               AllVo vo = dibsList.get(i);
               if(i%3 == 0){
         %>
         <div id="shop_list">
            <div class="shop_first">
               <div class="list_img">
                  <a class="img_a" href="detail?shopidx=<%=vo.getShopVo().getShop_idx() %>" style="background-image: url(<c:url value="${path}/res/image/default.png"/>)">
                     <div class="img_top">
<<<<<<< HEAD
                        <span>예약 <%=vo.getShopVo().getShop_reserve() %> 리뷰 <%=vo.getShopVo().getShop_review() %> 조회수 <%=vo.getShopVo().getShop_view() %></span>
=======
                        <span>예약 <%=vo.getShopVo().getShop_reserve() %> 리뷰 <%=vo.getShopVo().getShop_view() %> 조회수 <%=vo.getShopVo().getShop_view() %></span>
>>>>>>> 3cfb1ad5ada02fe4bd84ef55304a245d168aba95
                        <span class="star_"><i class="far fa-star fa-2x"></i></span>      
                     </div>
                     <div class="img_bottom">
                        <div class="shop_name"> <%=vo.getShopVo().getShop_title() %></div>
                        <div class="shop_area"> <%=vo.getShopVo().getShop_location() %></div>
                     </div>
                  </a>
               </div>
               <div class="shop_desc">
                  <div class="shop_star">
                  <span class="star_span" id="shop_tmp<%=vo.getShopVo().getShop_idx()%>" style="padding:0;display: inline-block;"></span>
                  <span class="shop_score"><%=vo.getShopVo().getShop_score()%>점</span>
                  </div>
                  <div class="shop_budget"> <%=vo.getShopVo().getBudget() %></div>
                  <div class="shop_comment"> <%=vo.getShopVo().getShop_comment() %></div>
               </div>
               <div class="review_btn">
                  <a class="review_a" href="detail?shopidx= <%=vo.getShopVo().getShop_idx() %>">리뷰 쓰기</a>
               </div>
            </div>
            <%
               }else{ 
            %>
            <div class="shop_medium">
               <div class="list_img" style="background-image: url(<c:url value="${path}/res/image/default.png"/>)">
                  <a class="img_a" href="detail?shopidx=<%=vo.getShopVo().getShop_idx() %>" style="background-image: url(<c:url value="${path}/res/image/default.png"/>)">
                     <div class="img_top">
<<<<<<< HEAD
                        <span>예약 <%=vo.getShopVo().getShop_reserve() %> 리뷰 <%=vo.getShopVo().getShop_review() %> 조회수 <%=vo.getShopVo().getShop_view() %></span>
=======
                        <span>예약 <%=vo.getShopVo().getShop_reserve() %> 리뷰 <%=vo.getShopVo().getShop_view() %> 조회수 <%=vo.getShopVo().getShop_view() %></span>
>>>>>>> 3cfb1ad5ada02fe4bd84ef55304a245d168aba95
                        <span class="star_"><i class="far fa-star fa-2x"></i></span>      
                     </div>
                     <div class="img_bottom">
                        <div class="shop_name"><%=vo.getShopVo().getShop_title() %></div>
                        <div class="shop_area"> <%=vo.getShopVo().getShop_location() %></div>
                     </div>
                  </a>
               </div>
               <div class="shop_desc">
                  <div class="shop_star">
                  <span class="star_span" id="shop_tmp<%=vo.getShopVo().getShop_idx()%>" style="padding:0;display: inline-block;"></span>
                  <span class="shop_score"><%=vo.getShopVo().getShop_score()%>점</span>
                  </div>
                  <div class="shop_budget"><%=vo.getShopVo().getBudget() %></div>
                  <div class="shop_comment"> <%=vo.getShopVo().getShop_comment() %></div>
               </div>
               <div class="review_btn">
                  <a class="review_a" href="detail?shopidx=<%=vo.getShopVo().getShop_idx() %>">리뷰 쓰기</a>
               </div>
            </div>
            <%
               }
            }
            %>             
         </div>
</div>
<<<<<<< HEAD

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
=======
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
>>>>>>> 3cfb1ad5ada02fe4bd84ef55304a245d168aba95
</script>
</body>
</html>