<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel='stylesheet' type='text/css' href='<c:url value="${path}/res/css/term.css"/>'/>
</head>

<body>
<%@include file="top_bar.jsp"%>
    <div id="banner_wrap">
        <div id="banner" class="image title_only"
            style="background-image:url(https://c1.poing.co.kr/original/images/guide/terms.png)">
            <div class="title_wrap">
                <div class="title">
                </div>
            </div>
            <div class="subtitle">
            </div>
        </div>
    </div>
    <div id="content_wrap">
        <div id="content" class="guide">
            <iframe src="<c:url value="${path}/res/static/privacy.html"/>" style="width:100%;height: 1000px;"></iframe>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</body>
</html>