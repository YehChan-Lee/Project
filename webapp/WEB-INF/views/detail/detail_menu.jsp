<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='${path}/res/css/detail_menu.css?ver=1'/>">
<div id="menu_wrap">
<%-- 	<c:if >
	</c:if> --%>
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
</div>