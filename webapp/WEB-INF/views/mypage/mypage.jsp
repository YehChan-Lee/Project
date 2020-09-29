<%@page import="java.util.ArrayList"%>
<%@page import="com.javaex.model.AllVo"%>
<%@page import="java.util.List"%>
<%@page import="com.javaex.model.ReservationVo"%>
<%@page import="com.javaex.model.ShopUserVo"%>
<%@page import="com.javaex.model.ShopVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<c:url value="${path}/res/css/mypage.css?ver=1"/>"/>
<link rel="stylesheet" href="<c:url value="${path}/res/css/jquery-ui.css"/>"/>
</head>
<body>
<%@include file="../top_bar.jsp" %>
<!-- 마이페이지 -->

<%
List<AllVo> reserveList = (ArrayList<AllVo>)request.getAttribute("reserveList");
List<AllVo> reviewList = (ArrayList<AllVo>)request.getAttribute("reviewList");
List<AllVo> dibsList = (ArrayList<AllVo>)request.getAttribute("dibsList");
%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.4.0/"/></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<link rel="stylesheet" href="<c:url value="${path}/res/css/jquery-ui.css"/>"/>
<script src="<c:url value='${path}/res/js/jquery-ui.js'/>" type="text/javascript"></script>

<div id="timeline">
	<div id="user_timeline">
		<div id="mypage_banner">
			<div id="user_box">
				<div id="user_img">
					<img src="<c:url value="${path}/res/image/user2.png"/>" height="180px"/>
					<%-- <form id="frm" name="frm" action="${path}/mypage/uploadContent" enctype="multipart/form-data" method="post">
    					<label for="file"><img src="<c:url value="${path}/res/image/user2.png"/>" height="180px"/></label>
    					<input multiple="multiple" name="files[]" id="files" type="file" style="width:180px"/>
					</form> --%>
				</div>
				<div id="user_info_box">
					<div id="user_info">
						<div id="user_name">
							<span>${getUser.user_name}</span>
						</div>
						<div class="point">${getUser.point} BP</div>
					</div>
					<div id="situation">
						<a href="">예약 <%=reserveList.size() %></a>
						<a href="">리뷰 <%=reviewList.size() %></a>
						<a href="">찜한 매장 <%=dibsList.size() %></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="content_wrap">
	<div id="nav_shading" class="shading_bg scroll_enable"></div>
	<div id="content" class="mypage">
		<ul id="my_tab">
			<li id="my_reserv" class="my_item active">예약</li>			
			<li id="my_review" class="my_item">리뷰</li>
			<li id="my_dibs" class="my_item">찜</li>
			<li id="my_notice" class="my_item">소식</li>
			<li id="my_setting" class="my_item">설정</li>
		</ul>
		<div id="mypage_import">
			
		</div>
	</div>
	<div id="nalzza">
		<div id="nalzza_title">예약 캘린더</div>
		<div id="datepicker"></div>
	</div>
</div>
	<script>
	  $(function() {
		  
		  mypage_change();
		  
		  var enableDays = ['2020-09-28', '2020-09-27', '2020-08-27'];
          console.log(enableDays);
          function enableAllTheseDays(date) {
            var fDate = $.datepicker.formatDate('yy-mm-dd', date);
            var result = [false, ""];
            $.each(enableDays, function(k, d) {
              if (fDate === d) {
                result = [true, "black"];
              }
            });
            return result;
          }
          
		  $("#datepicker2").datepicker({
		         showOn : "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
		         /* buttonImage: "res/image/admin/calendar.png", // 버튼 이미지 */
		         buttonImage : "res/image/admin/calendar.png", // 버튼 이미지
		         buttonImageOnly : true, // 버튼에 있는 이미지만 표시한다.
		         changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		         changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		         minDate : '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		         maxDate : '0',
		         nextText : '다음 달', // next 아이콘의 툴팁.
		         prevText : '이전 달', // prev 아이콘의 툴팁.
		         numberOfMonths : [1, 1
		         ], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
		         //stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
		         /* yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가. */
		         yearRange : 'c-30:c+0', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		         showButtonPanel : true, // 캘린더 하단에 버튼 패널을 표시한다.
		         gotoCurrent: true,
		         currentText : '오늘 날짜', // 오늘 날짜로 이동하는 버튼 패널
		         closeText : '닫기', // 닫기 버튼 패널
		         dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
		         /* showAnim: "slide", //애니메이션을 적용한다. */
		         showMonthAfterYear : true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
		         dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		         dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일의 한글 형식.
		         monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'
		         ],
		          beforeShowDay: enableAllTheseDays
		      // 월의 한글 형식.

		      });
         /* //모든 datepicker에 대한 공통 옵션 설정
         $.datepicker.setDefaults({
             dateFormat: 'yy-mm-dd' //Input Display Format 변경
             ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
             ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
             ,changeYear: true //콤보박스에서 년 선택 가능
             ,changeMonth: true //콤보박스에서 월 선택 가능                
             ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
             ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
             ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
             ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
             ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
             ,monthNamesShort: ['01','02','03','04','05','06','07','08','09','10','11','12'] //달력의 월 부분 텍스트
             ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
             ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
             ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
             ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
             ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
         }); */

         //input을 datepicker로 선언
         $("#datepicker").datepicker();                    
         
         //From의 초기값을 오늘 날짜로 설정
         $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
         $('#datepicker').datepicker({
        	 beforeShow: function(input) {
                 var i_offset = jQuery(input).offset();      // 클릭된 input의 위치값 체크
                 setTimeout(function(){
                    jQuery("#ui-datepicker-div").css({"left":i_offset});
                   // datepicker의 div의 포지션을 강제로 클릭한 input 위취로 이동시킨다.
                 })
              }
         })

         $(".active").css("color", "#ffa500");
         $("#my_tab>.my_item").mouseenter(function(){
        	$(this).css("cursor","pointer");
         });
         
         $("#my_tab>.my_item").on("click", function(){
        	$(".my_item").css("color", "#000");
        	$(this).addClass("active").siblings().removeClass("active");
        	$(".active").css("color", "#ffa500");
        	mypage_change();
         });
         
         function mypage_change() {
        	 if($("#my_tab>.active")[0] == $("#my_reserv")[0]) {
        		 $("#mypage_import").load("mypage/reservation");
        	 }
        	 else if($("#my_tab>.active")[0] == $("#my_review")[0]) {
        		 $("#mypage_import").load("mypage/review");
        	 }
         	 else if($("#my_tab>.active")[0] == $("#my_dibs")[0]) {
        		 $("#mypage_import").load("mypage/dibs");
        	 }
        	 else if($("#my_tab>.active")[0] == $("#my_notice")[0]) {
        		 $("#mypage_import").load("mypage/notice");
        	 }
        	 else if($("#my_tab>.active")[0] == $("#my_setting")[0]) {
        		 $("#mypage_import").load("mypage/setting");
        	 } 
         }
     });
	  
    </script>
    
<%@include file="../footer.jsp" %>

</body>
</html>