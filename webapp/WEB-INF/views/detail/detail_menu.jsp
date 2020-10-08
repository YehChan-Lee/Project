<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='${path}/res/css/detail_menu.css?ver=1'/>">

<div id="menu_wrap">
<c:choose>
	<c:when test="${!empty shopMenu}">
	<table class="menutable">
    <thead>
      <tr>
        <th>이름</th>
        <th>가격</th>
        <th>음식 설명</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${shopMenu}" var="menu">
      <tr>
        <td>${menu.food_name}</td>
        <td>${menu.food_price}</td>
        <td>${menu.food_info}</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  </c:when>

	<c:otherwise>
		<div id="message">
			사장님이 메뉴를 안적으셨어요.<br> 사장님께 말해볼께요
		</div>
		<script>
				$("#message").css("color", "lightgray").css("text-align", "center").css("background-color", "#fff").css("padding", "150px").css("font-size","17px").css("border-radius", "5px").css("font-family","'Noto Sans KR', sans-serif").css("font-weight", "500") ;
			
			</script>
	</c:otherwise>
</c:choose>
</div>