<%@page import="com.javaex.model.ReservationVo"%>
<%@page import="com.javaex.model.AllVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='${path}/res/js/jquery-ui.js'/>" type="text/javascript"></script>
<script>
$(document).ready(function(){
	$("#reservation>#contents_box").removeAttr("style");
});
</script>
</head>
<body>
   <%
   List<AllVo> reserveList = (ArrayList<AllVo>)request.getAttribute("reserveList");           
     if(reserveList.size()!=0){
        for(int i=0;i<reserveList.size();i++){
           AllVo vo = reserveList.get(i);
     %>
	  <!-- Media middle -->
		<div class="media mt-3" onclick="location.href='detail?shopidx=<%=vo.getShopVo().getShop_idx()%>'">
			<img src="<c:url value="${path}/res/image/default.png"/>"
				class="align-self-center mr-3" style="width: 150px; border-radius: 10px;">
			<div class="media-body">
				<a id="p_title" href="detail?shopidx=<%=vo.getShopVo().getShop_idx()%>"><%=vo.getShopVo().getShop_title() %></a>
				<p><%=vo.getShopVo().getShop_addr() %></p>
				<p>예약일시&nbsp:&nbsp<%=vo.getReservation().getRes_date()%></p>
				<p>예약인원&nbsp:&nbsp<%=vo.getReservation().getRes_customer()%></p>
			</div>
		</div>
	
	<%
   		}
    } else {
	%>
		<div id="message">
			예약이 없습니다.<br>
			지금 레스토랑에 예약해보시겠어요?
		</div>
		<script>
		$(document).ready(function(){
			$("#reservation>#contents_box").css("text-align", "center").css("background-color", "#fff").css("padding", "150px").css("font-size","17px").css("border-radius", "5px") ;
		});
		</script>     
    <% 
    }
    %>

</body>
</html>