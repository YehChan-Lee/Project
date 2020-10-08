<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/JavaScript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="${path}/res/css/signup.css"/>" />
</head>
<body>
	<a id="nav_logo" href="main"> 밥풀 <!-- <img class="logo" src="logo.jpg" width="40px"> -->
	</a>
	<form action="join" method="post" id="form">
		<input type="hidden" name="join_type" value="1">
		<div class="Signupform">
			<h4>이메일(아이디)</h4>
			<span><input type="text" id="email" name="email">
				<div id="emaildiv"></div></span>
			<h4>비밀번호</h4>
			<span><input type="password" class="pwinput" id="pwd1"
				name="pw">
				<div id="passdiv"></div></span>

			<h4>비밀번호 확인</h4>
			<span><input type="password" class="pw2input" id="pwd2">
				<div id="passdiv2"></div></span>

			<h4>이름</h4>
			<span><input type="text" name="name" id="name"></span>
			<h4>생년월일</h4>
			<span>
				<div>
					<input type="text" class="Signupbirth" placeholder="   년(4자)"
						name="bir_year" id="bir_year">
				</div>
				<div class="divselect">
					<select class="Signupbirthselect" name="bir_mon" id="bir_mon">
						<option value="월">월</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
				<div class="divsignup">
					<input type="text" class="Signupbirth2" placeholder="   일"
						name="bir_day" id="bir_day">
				</div>
				<div id="bir_div"></div>
				<div id="bir_div2"></div>
			</span>
			<h4>성별</h4>
			<span> <select class="Signupgender" name="gender" id="gender">
					<option value="남자">남자</option>
					<option value="여자">여자</option>
			</select></span>
			<h4>핸드폰번호</h4>
			<span><input type="text" id="phone" name="phone">
				<div id="phonediv"></div></span>
			<%
				if (request.getParameter("join_type").equals("1")) {
			%>
			<button class="signupdiv" onclick="signupclick()" type="button">가입하기</button>
			<%
				} else {
			%>
			<button class="signupdiv" onclick="signupclick2()" type="button">다음</button>
			<%
				}
			%>

			<div class="loginfooter">
				<ul>
					<li><a href="">이용약관</a></li>
					<li class="loginfooterli"><a href="">개인정보처리방침</a></li>
					<li class="loginfooterli"><a href="">책임의 한계와 법적고지</a></li>
					<li class="loginfooterli"><a href="">회원정보 고객센터</a></li>
				</ul>
			</div>
			<address class="loginaddress">
				<a href="">BABPULL</a> <span>Copyright</span> <span>comstudy21</span>
				<span>All Right Reserved.</span>
			</address>
		</div>

		<div class="buisnessmanform">
			<h4 class="buisnessmannumberh4">사업자 번호</h4>
			<input type="text" class="buisnessmannumber" name="buisness_number"
				id="buisness_number">
			<h4 class="buisnessmanstorenameh4">가게이름</h4>
			<input type="text" class="buisnessmanstorename" name="buisness_name"
				id="buisness_name">
			<h4 class="buisnessmanstoreaddressh4">가게주소</h4>
			<input type="text" class="buisnessmanstoreaddress" readonly
				name="buisness_address" id="buisness_address">
			<div class="buisnessmanstoreaddressfind"
				onclick="openDaumZipAddress()">
				<span class="buisnessmanstoreaddressfindspan">찾기</span>
			</div>
			<input type="text" class="buisnessmanstoreaddress2"
				name="buisness_address_etc" id="buisness_address_etc">

			<h4 class="foodkindsh4">음식종류</h4>
			<select class="foodkindsselect" name="buisness_food_type"
				id="buisness_food_type">
				<option value="한식">한식</option>
				<option value="양식">양식</option>
				<option value="중식">중식</option>
				<option value="일식">일식</option>
				<option value="아시아식">아시아식</option>
				<option value="뷔페">뷔페</option>
				<option value="구이">구이</option>
				<option value="술집">술집</option>
				<option value="카페/베이커리">카페/베이커리</option>
			</select>
			<button class="signupdiv" onclick="signupclick()" type="button">가입하기</button>
			<div class="loginfooter">
				<ul>
					<li><a href="">이용약관</a></li>
					<li class="loginfooterli"><a href="">개인정보처리방침</a></li>
					<li class="loginfooterli"><a href="">책임의 한계와 법적고지</a></li>
					<li class="loginfooterli"><a href="">회원정보 고객센터</a></li>
				</ul>
			</div>
			<address class="loginaddress">
				<a href="">BABPULL</a> <span>Copyright</span> <span>comstudy21</span>
				<span>All Right Reserved.</span>
			</address>
		</div>
	</form>
	<script>
	var check1 = 0, check2 = 0, check3 = 0, check4 = 0, check5 = 0, check6 = 0;
	
     function signupclick() {
        if($('#email').val() == "" || $('#pwd1').val() == "" || $('#pwd2').val() == ""
         		||$('#name').val() == "" || $('#bir_year').val() == ""
                	|| $('#bir_day').val() == "" || $('#phone').val() == ""){
    		 alert('공백값이 존재 할 수 없습니다');
        } else if($('#bir_mon').val() == "월"){
         alert('월을 선택해 주세요');	
     }
         else{
            if(check1 == 1 && check2 == 1 && check3 == 1 && check4 == 1 && check5 == 1 && check6 == 1){
           	 if($("input[type=hidden][name=join_type]").val() == 2){
             	 if($('#buisness_number').val() == "" || $('#buisness_name').val() == ""
            	        	|| $('#buisness_address').val() == "" || $('#buisness_address_etc').val() == ""
            	      		|| $('#buisness_food_type').val() == ""){
             		alert('공백값이 존재 할 수 없습니다');   	
            					  }
             		 else{
            		 document.getElementById('form').submit();
            		} 
           	 }
           	 else{
           		document.getElementById('form').submit();
           	 }
            		 
            	 }
            	 else{
            		 alert('잘못 입력된 값이 존재합니다');
            	 } 
         }
     };
     
     function signupclick2() {
         if($('#email').val() == "" || $('#pwd1').val() == "" || $('#pwd2').val() == ""
      		||$('#name').val() == "" || $('#bir_year').val() == ""
             	|| $('#bir_day').val() == "" || $('#phone').val() == ""){
 			 alert('공백값이 존재 할 수 없습니다');
     		} else if($('#bir_mon').val() == "월"){
    				  alert('월을 선택해 주세요');	
 					 }
          else{
         	 if(check1 == 1 && check2 == 1 && check3 == 1 && check4 == 1 && check5 == 1 && check6 == 1){
         	  $("input[type=hidden][name=join_type]").val("2");
           	  $(".Signupform").hide();
        	  $(".buisnessmanform").show();
         	 }
         	 else{
         		 alert('잘못 입력된 값이 존재합니다');
         	 }
          }
      };
     

        $(function () {
            $('#pwd2').blur(function () {
                var pwd1 = $('#pwd1').val();
                var pwd2 = $('#pwd2').val();
                if (pwd1 != pwd2) {
                    $(this).css({
                        'backgroundImage': 'url(images/잠금3.JPG)',
                        'backgroundPosition': 98 + '%'
                    })
                    $('#passdiv2').text('비밀번호가 일치하지 않습니다').css('display','block');
                    check1 = 0;
                }
                if (pwd1 == pwd2) {
                    $(this).css({
                        'backgroundImage': 'url(images/잠금4.JPG)',
                        'backgroundPosition': 98 + '%'
                    })
                    $('#passdiv2').css('display','none');
                    check1 = 1;
                }
            })
            $('#pwd1').blur(function () {
                var pw = $("#pwd1").val();
                var num = pw.search(/[0-9]/g);
                var eng = pw.search(/[a-z]/ig);
                var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
                if (pw.length < 8 || pw.length > 20) {
                    $(this).css({
                        'backgroundImage': 'url(images/잠금5.JPG)',
                        'backgroundPosition': 98 + '%'
                    })
                    $('#passdiv').text('8자리이상 20자리이하로 입력해주세요').css('display','block');
                    check2 = 0;
                    return false;
                } else if (pw.search(/\s/) != -1) {
                    $(this).css({
                        'backgroundImage': 'url(images/잠금5.JPG)',
                        'backgroundPosition': 98 + '%'
                    })
                    $('#passdiv').text('공백없이 입력해주세요').css('display','block');
                    check2 = 0;
                    return false;
                } else if ((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)) {
                    $(this).css({
                        'backgroundImage': 'url(images/잠금5.JPG)',
                        'backgroundPosition': 98 + '%'
                    })
                    $('#passdiv').text('영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.').css('display','block');
                    check2 = 0;
                    return false;
                } else {
                    $(this).css({
                        'backgroundImage': 'url(images/잠금6.JPG)',
                        'backgroundPosition': 98 + '%'
                    })
                    $('#passdiv').css('display','none');
                    check2 = 1;
                }
            })
               $('#bir_year').blur(function () {
                var bir_year_input = $('#bir_year').val();
                var bir_year = bir_year_input.search(/^\d{4}$/);
                if (bir_year == -1) {
                    $('#bir_div').text('1900 형식으로 입력해주세요').css('display','block');
                    check5 = 0;
                }
                if (bir_year == 0) {
                    $('#bir_div').css('display','none');
                    check5 = 1;
                }
            });
            $('#bir_day').blur(function () {
                var bir_day_input = $('#bir_day').val();
                var bir_day = bir_day_input.search(/^[0-9]*$/);
                if (bir_day == -1) {
                    $('#bir_div2').text('숫자만 입력해 주세요').css('display','block');
                    check6 = 0;
                }
                else if (bir_day == 0) {
                	if(0 < bir_day_input && bir_day_input < 32){
                    $('#bir_div2').css('display','none');
                    check6 = 1;
                	}
                	else{
                		$('#bir_div2').text('1~31 사이의 값만 입력하세요').css('display','block');
                        check6 = 0;
                	}
                }
            });
            $('#phone').blur(function () {
                var phoneinput = $('#phone').val();
                var phone = phoneinput.search(/^\d{3}-\d{4}-\d{4}$/);
                if (phone == -1) {
                    $('#phonediv').text('010-0000-0000 형식으로 입력해주세요').css('display','block');
                    check3 = 0;
                }
                if (phone == 0) {
                    $('#phonediv').css('display','none');
                    check3 = 1;
                }
            });

            $('#email').blur(function () {
                var emailinput = $('#email').val();
                var email = emailinput.search(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);

                if (email == -1) {
                    $('#emaildiv').text('이메일 형식이 올바르지 않습니다').css('display','block');
                    check4 = 0;
                }
                if (email == 0) {
                    $('#emaildiv').css('display','none');
                    check4 = 1;
                }
            });
        });
        
        function openDaumZipAddress() {

        	new daum.Postcode({

        		oncomplete:function(data) {
        			jQuery("#buisness_address").val(data.address);
        			jQuery("#buisness_address_etc").focus();
        			console.log(data);
        		}
        	}).open();

        }
    </script>
</body>
</html>