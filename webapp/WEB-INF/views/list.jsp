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
<title>밥풀 - 목록</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='${path}/res/css/shoplist.css?ver=1'/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">

<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

</head>
<body>
	<%@include file="top_bar.jsp"%>

	<%
		List<ShopVo> shoplist = (ArrayList<ShopVo>) request.getAttribute("shopList");
		pageContext.setAttribute("sort", request.getParameter("shopListCnt"));
		String bannerText = null;
		if(request.getParameter("food_type") != null && request.getParameter("location") == null){
			String[] typearr = request.getParameterValues("food_type");
			if(typearr.length > 1){
				bannerText = "검색";
			}else{
				bannerText = request.getParameter("food_type");
			}
		}else if(request.getParameter("food_type") == null && request.getParameter("location") != null){
			bannerText = request.getParameter("location");
		}else{
			bannerText = "검색";
		}
		String bannertxt = bannerText.replace("/", "");
		pageContext.setAttribute("banner", bannertxt);
	%>
	<!--리스트 베너 시작  -->
	<div id="list_banner"
		style="background-size:cover;background-repeat:no-repeat;background-image : url(<c:url value='${path}/res/image/banner/${banner}.png'/>);">
		<div id="banner_wrap">
			<div id="banner_title"><%=bannerText%></div>
			<div id="banner_line">───</div>
		</div>
	</div>
	<!--리스트 베너 끝 -->

	<!--목록 시작  -->
	<div id="content_wrap">
		<div id="content_list">
			<!--점포 숫자-->
			<div id="shop_number">
				<p>
					레스토랑 총<span>${shopListCnt}</span>개가 검색되었습니다.
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
						pageContext.setAttribute("photo", "default.png");
						if (shopvo.getShop_photo() != null) {
							pageContext.setAttribute("photo", shopvo.getShop_photo());
						} 
						if ((i + 1) % 3 == 1) {
				%>
				<div class="shop_first">
					<div class="list_img">
					<c:forTokens items="${photo}" delims="/" var="img">
						<a class="img_a" href="detail?shopidx=<%=shopvo.getShop_idx() %>"
							style="background-image: url('<c:url value="${path}/serverImg/shopimg/${img}"/>')">
							<div class="img_top">
								<span>예약 <%=shopvo.getShop_reserve()%> 리뷰 <%=shopvo.getShop_review()%>
									조회수<%=shopvo.getShop_view()%></span> <span class="star_"
									id="star_<%=shopvo.getShop_idx()%>"> <i
									class="far fa-star fa-2x"></i> <input type="hidden"
									id="hidden_<%=shopvo.getShop_idx()%>"
									value="<%=shopvo.getShop_id()%>" />
								</span>
							</div>
							<div class="img_bottom">
								<div class="shop_name"><%=shopvo.getShop_title()%></div>
								<div class="shop_area"><%=shopvo.getShop_location()%></div>
							</div>
						</a>
							</c:forTokens>
					</div>
					<div class="shop_desc">
						<div class="shop_star">
							<span class="star_span" id="shop_tmp<%=shopvo.getShop_idx()%>"
								style="padding: 0; display: inline-block;"></span><span
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
					<div class="list_img">
						<c:forTokens items="${photo}" delims="/" var="img">
						<a class="img_a" href="detail?shopidx=<%=shopvo.getShop_idx() %>"
							style="background-image: url('<c:url value="${path}/serverImg/shopimg/${img}"/>')">
							<div class="img_top">
								<span>예약 <%=shopvo.getShop_reserve()%> 리뷰 <%=shopvo.getShop_review()%>
									조회수<%=shopvo.getShop_view()%></span> <span class="star_"
									id="star_<%=shopvo.getShop_idx()%>"> <i
									class="far fa-star fa-2x"></i> <input type="hidden"
									id="hidden_<%=shopvo.getShop_idx()%>"
									value="<%=shopvo.getShop_id()%>" />
								</span>
							</div>
							<div class="img_bottom">
								<div class="shop_name"><%=shopvo.getShop_title()%></div>
								<div class="shop_area"><%=shopvo.getShop_location()%></div>
							</div>
						</a>
							</c:forTokens>
					</div>
					<div class="shop_desc">
						<div class="shop_star">
							<span class="star_span" id="shop_tmp<%=shopvo.getShop_idx()%>"
								style="padding: 0; display: inline-block;"></span><span
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
			<div id="paging"></div>
			<!--페이지 번호 끝-->
		</div>
	</div>
	<!--목록 끝  -->
	<%
		if (request.getParameter("page") != null) {
			pageContext.setAttribute("curpage", request.getParameter("page"));
		} else {
			pageContext.setAttribute("curpage", 1);
		}
	pageContext.setAttribute("sort", request.getParameter("solt"));
	%>
</body>
<%@include file="footer.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
	
<script>
	var sort = "${sort}";
	if(sort == '1'){
		$("#sort_sort_list").attr("style","color:#444");
		$("#sort_star").attr("style","color:#f05e23");
	}else if(sort =='2'){
		$("#sort_sort_list").attr("style","color:#444");
		$("#sort_resv").attr("style","color:#f05e23");
	}else if(sort =='3'){
		$("#sort_sort_list").attr("style","color:#444");
		$("#sort_view").attr("style","color:#f05e23");
	}
	
/* 버튼 색상변경 */
 	var user_id = null;
 	user_id = "${sessionID}";
	if(user_id != null){
		<c:forEach items="${dibList}" var="obj" >
			$('#star_${obj.shop_idx}').attr("style","color:#f05e23;");
		</c:forEach>	
	}
      <c:forEach items="${shopList}" var="shop">
      $("#shop_tmp${shop.shop_idx}").rateYo({
    	  
  		rating :  ${shop.shop_score},
  		starWidth: "20px",
  	    halfStar: true,
  	  	readOnly: true,
  		starSvg : '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>'
  		});  
      </c:forEach>
      
	<c:forEach items="${shopList}" var="shop">
      $("#star_${shop.shop_idx} > i").on('click',function (e) {
         e.preventDefault();
         $.ajax({
 			type : "POST",
 			url : "list/dib",
 			data: {
 				starClass : $(this).attr("class"),
 				shopId :$("#hidden_${shop.shop_idx}").val(),
 				shopIdx : ${shop.shop_idx}
 			},
 			success : function(data) {
 				if(data == "success"){
 					alert("success");
 				}else if(data == "adddib"){
 					$('#star_${shop.shop_idx}').attr("style","color:#f05e23;");
 				}else if(data == "deldib"){
 					$('#star_${shop.shop_idx}').attr("style","color:white;");
 				}else if(data == "nologin"){
 					/* alert("로그인 후 시도하세요"); */
 					idcheck();				
 				}else{
 				}			
 			},
 			error : function() {
 				alert("에러발생");
 			}

 		});			
         $(this).closest("span").toggleClass("off")
      });
      </c:forEach>
      
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
      
      var totalData = ${shopListCnt};    // 총 데이터 수
      var dataPerPage = 12;    // 한 페이지에 나타낼 데이터 수
      var pageCount = 10;        // 한 화면에 나타낼 페이지 수
      if(totalData/dataPerPage <10){
    	  pageCount = Math.ceil(totalData/dataPerPage);
      }      
      function paging(totalData, dataPerPage, pageCount, currentPage){
          
          
          var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
          var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹
          
          
          var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
          if(last > totalPage)
              last = totalPage;
          var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
          var next = last+1;
          var prev = first-1;
          
          var $pingingView = $("#paging");
          
          var html = "";
          var url = document.location.href;
          var editurl = "";
          if(url.indexOf("page") != -1){
	         	 editurl = url.substring(url.indexOf("?"),url.indexOf("&page="));
	         	 editurl +="&page="
	          }else{
	        	  editurl = url.substring(url.indexOf("?")) + "&page="
	           }
          if(prev > 0)   {    
              html += "<a href='list"+editurl  + (Number(${curpage})-10) + "' id='prev'><</a> ";	         
          }
          for(var i=first; i <= last; i++){        	 
              html += "<a href='list"+editurl + i + "'" +" id=" + i + ">" + i + "</a> ";
          }
          
          if(last < totalPage)
              html += "<a href='list"+editurl+(Number(${curpage})+10) + "' id='next'>></a>";
          
          $("#paging").html(html);    // 페이지 목록 생성
          $("#paging a").css("color", "black");
          $("#paging a#" + currentPage).css({"text-decoration":"none", 
                                             "color":"red", 
                                             "font-weight":"bold"});    // 현재 페이지 표시
          var cur = 0;               
          $("#paging a").click(function(){
        	  
        	  var $item = $(this);
              var $id = $item.attr("id");
              cur = ${curpage};
              if(cur == null){
            	  cur = 1;
              }else{
            	  cur = ${curpage};
              }
              var selectedPage = ${curpage};
              
              if($id == "next")    selectedPage = next;
              if($id == "prev")    selectedPage = prev;
              
              paging(totalData, dataPerPage, pageCount, selectedPage);
          });
                                             
      }
      
      $("document").ready(function(){        
          paging(totalData, dataPerPage, pageCount, ${curpage});
      });
      
      function idcheck(){
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
  		$('#popup_body').css('height', 472 + 'px');
  	
  		$("#naverIdLogin").css('top', 0);
  	
  		$('.popup_close').css('top', -50 + 'px');
  		$('.popup_close').css('left', 80 + '%');
  	}

      
</script>
</html>