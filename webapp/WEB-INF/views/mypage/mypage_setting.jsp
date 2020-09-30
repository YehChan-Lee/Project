<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<c:url value="${path}/res/css/mypage.css"/>"/>

</head>
<body>

<div id="setting" class="body empty">
	<table>
		<caption>기본 정보</caption>
		<tbody>
			<tr>
				<td class="setting_title">이름</td>
				<td class="setting_value">
					<span>사용자</span>
					<button type="button" tabindex="-1">변경하기</button>
					<form action="">
						<input type="text" name="web_name" value="사용자"/>
						<button type="submit" tabindex="-1">변경</button>
					</form>
				</td>
			</tr>
			<tr>
				<td class="setting_title">예약자명</td>
				<td class="setting_value">
					<span>사용자</span>
					<button type="button" tabindex="-1">변경하기</button>
					<form action="">
						<label>
							<span>새 예약자명</span>
							<input type="text" name="web_name" value="사용자"/>
						</label>
						<button type="submit" tabindex="-1">변경</button>
					</form>
				</td>
			</tr>
			<tr>
				<td class="setting_title">전화번호</td>
				<td class="setting_value">
					<span></span>
					<button type="button" tabindex="-1">변경하기</button>
					<form action="">
						<label>
							<span>새 전화번호</span>
							<input type="text" name="phone"/>
						</label>
						<button type="submit" tabindex="-1">인증번호 전송</button>
						<label for="">
							<span>인증번호</span>
							<input class="confirm" type="text" name="sms_code"/>
						</label>
						<button type="submit" tabindex="-1">확인</button>
						<input type="hidden" name="current_phone" value=""/>
						<input type="hidden" name="type" value="phone"/>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
	<table id="privacy">
		<caption>알림/프라이버시</caption>
		<tbody>
			<tr>
				<td class="setting_title" rowspan="2">알림 설정</td>
				<td class="setting_value" data-target="notification">
					<div id="setting_full">
						<div class="setting_option">
							<span>푸시 수신동의(테마 업데이트)</span>
							<input id="theme_update_on" name="theme_update" type="radio" value="1"/>
							<label for="theme_update_on">동의함</label>
							<input id="theme_update_off" name="theme_update" type="radio" value="1"/>
							<label for="theme_update_off">동의 안함</label>
						</div>
						<p class="setting_description">예약/거래정보와 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.</p>
					</div>
					<div class="setting_detail">
						<div class="setting_option">
							<span>내 리뷰-좋아요</span>
							<div>
								<input id="like_review_on" name="like_review" type="radio" value="1"/>
								<label for="like_review_on">ON</label>
								<input id="like_review_off" name="like_review" type="radio" checked value="0"/>
								<label for="like_review_off">OFF</label>
							</div>
						</div>
						<div class="setting_option">
							<span>내 리뷰-코멘트</span>
							<div>
								<input id="comment_review_on" name="comment_review" type="radio" value="1"/>
								<label for="comment_review_on">ON</label>
								<input id="comment_review_off" name="comment_review" type="radio" checked value="0"/>
								<label for="comment_review_off">OFF</label>
							</div>
						</div>
						<div class="setting_option">
							<span>내 리뷰-찜하기</span>
							<div>
								<input id="selection_review_on" name="selection_review" type="radio" value="1"/>
								<label for="selection_review_on">ON</label>
								<input id="selection_review_off" name="selection_review" type="radio" checked value="0"/>
								<label for="selection_review_off">OFF</label>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="setting_value" data-target="notification">
					<div id="setting_full">
						<div class="setting_option">
							<span>제 3자 마케딩 활용 동의</span>
							<input id="marketing_on" name="marketing" type="radio" value="1"/>
							<label for="marketing_on">동의함</label>
							<input id="marketing_off" name="marketing" type="radio" checked value="0"/>
							<label for="marketing_off">동의 안함</label>
						</div>
					</div>
					<div>
						<p class="setting_title">이벤트 알림 서비스</p>
						<p class="setting_description">예약/거래정보와 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.</p>
					</div>
					<div class="setting_detail">
						<div class="setting_option">
							<span>SMS 수신동의</span>
							<div>
								<input id="sms_on" name="sms" type="radio" value="1"/>
								<label for="sms_on">동의함</label>
								<input id="sms_off" name="sms" type="radio" checked value="0"/>
								<label for="sms_off">동의 안함</label>
							</div>
						</div>
						<div class="setting_option">
							<span>이메일 수신동의</span>
							<div>
								<input id="email_on" name="email" type="radio" value="1"/>
								<label for="email_on">동의함</label>
								<input id="email_off" name="email" type="radio" checked value="0"/>
								<label for="email_off">동의 안함</label>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="setting_title">정보공개설정</td>
				<td class="setting_value" data-target="setting">
					<div class="setting_detail">
						<div class="setting_option">
							<span>내 리뷰</span>
							<div>
								<input id="expose_review_on" name="expose_review" type="radio" value="1"/>
								<label for="expose_review_on">전체 공개</label>
								<input id="expose_review_off" name="expose_review" type="radio" checked value="0"/>
								<label for="expose_review_off">나만 보기</label>
							</div>
						</div>
						<div class="setting_option">
							<span>찜한 리뷰</span>
							<div>
								<input id="expose_selection_review_on" name="expose_selection_review" type="radio" value="1"/>
								<label for="expose_selection_review_on">전체 공개</label>
								<input id="expose_selection_review_off" name="expose_selection_review" type="radio" checked value="0"/>
								<label for="expose_selection_review_off">나만 보기</label>
							</div>
						</div>
						<div class="setting_option">
							<span>찜한 매장</span>
							<div>
								<input id="expose_favorite_place_on" name="expose_favorite_place" type="radio" value="1"/>
								<label for="expose_favorite_place_on">전체 공개</label>
								<input id="expose_favorite_place_off" name="expose_favorite_place" type="radio" checked value="0"/>
								<label for="expose_favorite_place_off">나만 보기</label>
							</div>
						</div>
					</div>
					<p class="setting_description">예약 내역은 나와 해당 예약 참석자만 볼 수 있어요!</p>
				</td>
			</tr>
		</tbody>
	</table>
	<a href="" id="leave">회원 탈퇴</a>
</div>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(".setting_value>button").on('click', function(){
	if($(this).siblings("form").css("display") == "none"){
		/* $("#setting.body>table>tbody>tr>.setting_value>form").show(); */
		$(this).siblings("form").show();
		
		/* $(this).attr('button', '변경취소'); */
		/* <button type="button" tabindex="-1">변경하기</button> */
	} else {
		/* $("#setting.body>table>tbody>tr>.setting_value>form").hide(); */
		$(this).siblings("form").hide();
	}
});

/* $("#notice_list>.notice_open").click(function(e){		
	if($(this).children(".notice_body").css("display") == "none") {
		$(".notice_body").hide();
		$(this).children(".notice_body").show();
		$(this).children(".notice_title").children("span").children("img").attr('src', '<c:url value="${path}/res/image/up.png"/>');
		/* $("#notice_list .notice_title>span>img").attr('src', '<c:url value="${path}/res/image/up.png"/>');
	}
	else {
		$(this).children(".notice_body").hide();
		$("#notice_list .notice_title>span>img").attr('src', '<c:url value="${path}/res/image/down.png"/>');
	}
	e.stopPropagation();
});	 */
</script>
</body>
</html>