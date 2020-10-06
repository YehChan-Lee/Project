<%@page import="com.javaex.model.AdminVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="sec_admin_resSitu">
		<h2>
			<i class="fas fa-arrow-circle-right"></i><span>예약 현황</span>
		</h2>
		<hr />
		<div>
			<div class="resSituRdo">
				<input type="radio" name="rsRdo" value="전체" />전체 <input
					type="radio" name="rsRdo" value="예약중" />예약중 <input type="radio"
					name="rsRdo" value="결제완료" />결제완료 <span> | </span>
			</div>
			<span>검색 키워드</span>
			<div>
				<select name="resSitu_search" id="resSitu_search">
					<option>예약자</option>
					<option>사업자 번호</option>
					<option>가게이름</option>
					<option>예약 날짜</option>
					<option>결제 날짜</option>
				</select> <input type="text" />
				<button class="resSitu_btn">
					<i class="fas fa-search"></i>검색
				</button>
			</div>
		</div>
		<div id="sec_admin_resSitu">
			<div>
				<table>
					<tr>
						<th></th>
						<th>NO.</th>
						<th>결제유무</th>
						<th>예약 번호</th>
						<th>사용자 이름</th>
						<th>가게 이름</th>
						<th>가게 사업자번호</th>
						<th>가게 주소</th>
						<th>예약 날짜</th>
						<th>예약 인원</th>
						<th>음식 예약</th>
						<th>결제 날짜</th>
					</tr>
					<c:forEach items="${AresSitu_list}" var="AresSitu" begin="0"
						step="1">
						<tr>
							<c:set var="i" value="${i + 1}" />
							<c:set var="food"
								value="${AresSitu.getReserveOrder().getFood_name()}" />
							<td><input type="checkbox" name="resSitu_sib" />
							<td>${i}</td>
							<td>${AresSitu.getReserveOrder().getIs_pay()}</td>
							<td>${AresSitu.getReservation().getReserve_idx()}</td>
							<td>${AresSitu.getReservation().getRes_name()}</td>
							<td>${AresSitu.getShopVo().getShop_title()}</td>
							<td>${AresSitu.getShopVo().getShop_id()}</td>
							<td>${AresSitu.getShopVo().getShop_addr()}</td>
							<td>${AresSitu.getReservation().getRes_date()}</td>
							<td>${AresSitu.getReservation().getRes_customer()}</td>
							<td><a href="#"> <c:choose>
										<c:when test="${empty food }">
											<c:out value=""></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="예약 확인"></c:out>
										</c:otherwise>
									</c:choose>
							</a></td>
							<td>${AresSitu.getReserveOrder().getPay_date()}</td>
						</tr>
					</c:forEach>
					<%-- <%
						List<AdminVo> AresSitu_list = (List<AdminVo>)request.getAttribute("AresSitu_list");
						for(int i = 0; i< AresSitu_list.size(); i++){
							AdminVo vo = AresSitu_list.get(i);
					%> --%>
					<%--  <c:choose>
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
   </c:choose> --%>

					<!-- <tr> -->
					<%-- <td><input type="checkbox" name="resSitu_sib" /></td>
						<td><%=i+1 %></td>
						<td><%=vo.getReserveOrderVo().getIs_pay() %></td>
						<td><%=vo.getReservation().getReserve_idx() %></td>
						<td><%=vo.getReservation().getRes_name() %></td>
						<td><%=vo.getShopVo().getShop_title()%></td>
						<td><%=vo.getShopVo().getShop_id()%></td>
						<td><%=vo.getShopVo().getShop_addr()%></td>
						<td><%=vo.getReservation().getRes_date()%></td>
						<td><%=vo.getReservation().getRes_customer()%></td> --%>
					<!-- 	<td><a href="#"> -->


					<%--  <c:forEach items="${AresSitu_list}" var="AresSitu">
							<td>${AresSitu.getReserveOrderVo().getIs_pay()}</td>
						
						</c:forEach> --%>
					<%-- 	<c:set var="food" value="<%=vo.getReserveOrderVo().getFood_name()%>"/>
						<c:out value="<%=vo.getReserveOrderVo().getFood_name()%>"></c:out>
						<c:out value="${food}"></c:out>
						<c:choose>
							<c:when test="${food.equals('')}">
							미예약
							</c:when>
							<c:otherwise>
							예약
							</c:otherwise>
						</c:choose>
						<td><%=vo.getReserveOrderVo().getPay_date()%></td> --%>
					<!-- 	</a></td>
					</tr> -->
					<%-- <%
						}
					%> --%>

					<!-- <tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
				<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
				<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
				<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="resSitu_sib" /></td>
						<td>1</td>
						<td>결제완료</td>
						<td>testID</td>
						<td>test@test.com</td>
						<td>가게 이름</td>
						<td>123-12-12345</td>
						<td>금천구 어딘가에~</td>
						<td>2020-01-01</td>
						<td>3명</td>
						<td>햄버거</td>
						<td>2020-01-01</td>
					</tr> -->
				</table>
			</div>
			<div class="paging_resSitu">
				<div>
					<a href="#" class="bt"><i class="fas fa-angle-double-left"></i></a>
					<a href="#" class="bt"><i class="fas fa-angle-left"></i></a> <a
						href="#" class="num">1</a> <a href="#" class="num">2</a> <a
						href="#" class="num">3</a> <a href="#" class="bt"><i
						class="fas fa-angle-right"></i></a> <a href="#" class="bt"><i
						class="fas fa-angle-double-right"></i></a>
				</div>
				<div>
					<button>선택삭제</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#sec_admin_resSitu > div:nth-child(1) > table > tbody > tr > td > a ").on("click", function() {
			/* #sec_admin_resSitu > div:nth-child(1) > table > tbody > tr:nth-child(2) > td:nth-child(4) */
			var info = $(this).closest("tr").children("td:nth-child(4)").text();
			console.log("예약번호 : " + info);
			var url = "admin_resSitu_info?idx=" + info;
			window.open(url, "예약 현황 정보", "height=700, width=1200, top=100, left=300", "_blank");
		});
	});
</script>
</html>