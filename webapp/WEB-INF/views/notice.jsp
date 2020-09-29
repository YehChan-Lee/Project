<%@page import="java.util.Map"%>
<%@page import="com.javaex.model.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="<c:url value="${path}/res/css/notice.css?ver=1"/>"/>
</head>
<body>
<%@include file="top_bar.jsp" %>

<!-- 공지사항 -->
<div id="notice_banner">
	<img src="<c:url value="${path}/res/image/notice.png"/>"/>
</div>

<h1 class="notice_title">공지사항</h1>
	<ul id="notice_list">
	<c:choose>
		<c:when test="${!empty noticeList}">
			<c:forEach items="${noticeList}" var="notice">
				<li class="notice_open">
					<div class="notice_title">
						${notice.notice_title}
						<span>${notice.notice_date}
							<img src="<c:url value="${path}/res/image/down.png"/>"/>
						</span>
						<div>
						</div>
					</div>
					<div class="notice_body">
						${notice.notice_content}
					</div>
				</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div id="no_notice">등록된 글이 없습니다.</div>
		</c:otherwise>
	</c:choose>
	</ul>
	<!-- pagination{s} -->
	<div id="container">
	  <ul id="pagination">
	  	<li class="page-item"><a class="page-link" href="/BabPool/notice?page=1">&laquo;</a></li>
	  	<li id="precli" class="page-item"><a class="page-link" href="">&lsaquo;</a></li>
  		<c:forEach begin="${pagination.begin}" end="${pagination.end}" var="idx">
		    <li id="first" class="page-item" value="${idx}">
		    <a class="page-link" href="/BabPool/notice?page=${idx}">${idx}</a></li>
    	</c:forEach>
	    <li id="nextcli" class="page-item"><a class="page-link" href="">&rsaquo;</a></li>
	    <li class="page-item"><a class="page-link" href="/BabPool/notice?page=${noticeList}">&raquo;</a></li>
	  </ul>
	</div>
	<!-- pagination{e} -->
<%@include file="footer.jsp" %>
<script src="http://code.jquery.com/jquery.js"></script>
<script>

$(document).ready(function(){	
	$("#notice_list>.notice_open").click(function(e){		
		if($(this).children(".notice_body").css("display") == "none") {
			
			$(".notice_body").hide();
			$("#notice_list>.notice_open").children(".notice_title").children("span").children("img").attr('src', '<c:url value="${path}/res/image/down.png"/>');
			
			$(this).children(".notice_body").show();
			$(this).children(".notice_title").children("span").children("img").attr('src', '<c:url value="${path}/res/image/up.png"/>');
		}
		else {
			$(this).children(".notice_body").hide();
			$(this).children(".notice_title").children("span").children("img").attr('src', '<c:url value="${path}/res/image/down.png"/>');
		}
			e.stopPropagation();
		});
	
	/* function Request(){
	       var requestParam ="";
	       
	      //getParameter function
	      this.getParameter = function(param){
	           //현재 주소를 decoding
	           var url = unescape(location.href); 
	           //파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다. 
	           var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&"); 
	           
	           for(var i = 0 ; i < paramArr.length ; i++){
	              var temp = paramArr[i].split("="); //파라미터 변수명을 담음
	           
	              if(temp[0].toUpperCase() == param.toUpperCase()){
	                // 변수명과 일치할 경우 데이터 삽입
	                requestParam = paramArr[i].split("=")[1]; 
	                break;
	              }
	           }
	           return requestParam;
	       }
	   }

	   // Request 객체 생성
	   var request = new Request();
	   // test 라는 파라메터 값을 얻기
	   var pageNo = parseInt(request.getParameter("page"));

	   console.log(pageNo);
	   
	   changeNo();
	   
	   function changeNo(){
	      if(pageNo < 10) {
	         var pageNoEdit1 = pageNo + 2;
	         $("#pagination li:nth-child("+pageNoEdit1+")").addClass("lifirst").siblings().removeClass("lifirst");
	      } else {
	         var pageNoEdit2 = (pageNo % 10) + 2;
	         $("#pagination li:nth-child("+pageNoEdit2+")").addClass("lifirst").siblings().removeClass("lifirst");
	      }
	      $(".lifirst").css("background-color", "#ffa500").css("font-weight","600").children().css("color","#fff");
	   } */
	
	var nextpage = $("#first").val() + 10;
	var prepage = $("#first").val();
	/* if(prepage<=10){
		prepage=10;
	} */
	$("#nextcli").on("click", function(){
		$(this).children("a").attr("href", "/BabPool/notice?pageclick=${pagination.begin}&&state=increse&&page="+nextpage);
	});
	$("#precli").on("click", function(){
		$(this).children("a").attr("href", "/BabPool/notice?pageclick=${pagination.begin}&&state=decrease&&page="+prepage);
	});
});
</script>
</body>
</html>