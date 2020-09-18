<%@page import="com.javaex.model.NoticeVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<%
	List<NoticeVo> noticeList = (List<NoticeVo>)request.getAttribute("Notice");
	for(int i =0; i<noticeList.size(); i++){
		NoticeVo noticevo = noticeList.get(i);
		%>
	
		<li class="notice_open">
			<div class="notice_title">
				<%=noticevo.getNotice_title() %>
				<span><%=noticevo.getNotice_date() %>
					<img src="<c:url value="${path}/res/image/down.png"/>"/>
				</span>
				<div>
				</div>
			</div>
			<div class="notice_body">
				<%=noticevo.getNotice_content() %>
			</div>
		</li>
	<%
	}
	%>
	</ul>

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

});

</script>
</body>
</html>