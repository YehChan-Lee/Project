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
		<c:when test="${!empty pageList}">
			<c:forEach items="${pageList}" var="notice">
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
			<div>등록된 글이 없습니다.</div>
		</c:otherwise>
	</c:choose>
	</ul>
	<!-- pagination{s} -->
	<div id="page_btn">
	  <ul id="pagination">
	    <c:if test="${pageMaker.prev}">
	    	<li>
	    	<a href="notice${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li id="_page" class="${pageMaker.cri.page == idx? 'active':''}">
	    	<a href="notice${pageMaker.makeQuery(idx)}">${idx}</a></li>
	    </c:forEach>
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li><a href="notice${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a></li>
	    </c:if> 
	  </ul>
	</div>
	<!-- UriComponents 안쓸 경우 -->
	<%-- <form id="pagingFrm" name="pagingForm">
		<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cri.page}">
		<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.perPageNum}">
	</form> --%>
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
	
	$(".active").css("background-color", "#ffa500").css("font-weight","600").children().css("color","#fff");
	
/* 	$("#pagination li a").on("click", function(event){
		event.preventDefault();
		
		var targetPage = $(this).attr("href");
		var listPageForm = $("pagingFrm");
		pagingFrm.find("[name='page']").val(targetPage);
		pagingFrm.attr("action","/notice").attr("method", "get");
		pagingFrm.submit();
	}) */

});
</script>
</body>
</html>