<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<script>
$(document).ready(function(){	
	$("#reservation>#contents_box").removeAttr("style");
	
	<c:forEach items="${reviewList}" var="review">
	$("#grade${review.reviewVo.review_idx}").rateYo({
		rating : ${review.reviewVo.review_score},
		starWidth: "23px",
		halfStar: true,
		readOnly: false,
		onInit: function (rating, rateYoInstance) {
			mk_comment(rating,"#grade_comment${review.reviewVo.review_idx}","#grade_score${review.reviewVo.review_idx}");
			$("#grade${review.reviewVo.review_idx}").rateYo("option", "readOnly", true);
		},
		starSvg : '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>'
	});
	</c:forEach>

	/* x버튼 */
	<c:forEach items="${reviewList}" var="review">	
	$("#del${review.reviewVo.review_idx}").click(function () {
		$.ajax({
			type : "POST",
			url : "review/del",
			data : {
				delIdx : $("#h_reviewIdx${review.reviewVo.review_idx}").val(),
				delEmail : $("#h_user_email${review.reviewVo.review_idx}").val()
			},
			success : function(data) {
				if(data == "nologin"){
					idcheck()
				}else if(data == "delFail"){
					alert("삭제 권한 없음")
				}else if(data == "success"){
					$("#contents_box").load("mypage/review2", {shopId : "${shopId}"});
					 $.getScript("https://kit.fontawesome.com/a076d05399.js");
					 $.getScript("https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js");
				}
			},
			error : function() {
				alert("에러발생");
			}
		});
	})
	</c:forEach>

	function mk_comment(currentIndex,div,score) {
		$(score).text(currentIndex + "점");
		if (currentIndex == 0.5) {
			$(div).text("최악이에요 다시는 오고싶지 않아요.");
		} else if (currentIndex == 1) {
			$(div).text("실망이에요. 집에서 먹는게 나을뻔 했어요.");
		} else if (currentIndex == 1.5) {
			$(div).text("맛,분위기,서비스 ... 전부 별로였어요.");
		} else if (currentIndex == 2) {
			$(div).text("평균이하! 이정도 레스토랑은 어디든 있어요.");
		} else if (currentIndex == 2.5) {
			$(div).text("다 괜찮은데 조금 아쉬워요.");
		} else if (currentIndex == 3) {
			$(div).text("보통이에요.이정도면 괜찮아요.");
		} else if (currentIndex == 3.5) {
			$(div).text("평균 이상! 한 번 쯤은 다시 올 것 같아요.");
		} else if (currentIndex == 4) {
			$(div).text("인상적이네요. 추천하고싶어요");
		} else if (currentIndex == 4.5) {
			$(div).text("오랫동안 기억에 남을거 같아요!");
		} else if (currentIndex == 5) {
			$(div).text("완벽! 더이상 할말이 없어요.");
		}
	}
	
});
</script>

	<!-- 내가 쓴 리뷰 -->
	<%
		pageContext.setAttribute("sessionid", session.getAttribute("sessionID"));
	%>
	<div id="review_wrap">
		<div class="review_list">
			<c:choose>
				<c:when test="${!empty reviewList}">
					<c:forEach items="${reviewList}" var="review">
						<div class="review">
							<div class="del" style="display: inline-block;float: right;">
								<input type="hidden" 
									id="h_reviewIdx${review.reviewVo.review_idx}"
									value="${review.reviewVo.review_idx}" /> <input type="hidden"
									id="h_user_email${review.reviewVo.review_idx}"
									value="${review.reviewVo.user_email}" /> <i
									class="fas fa-times" style="color: lightgray"
									id="del${review.reviewVo.review_idx}"></i>
							</div>
							<a class="author" href=""> <span class="thumbnail"
								style="background-image: url(<c:url value="${path}/serverImg/profile/user/${review.shopUser.user_photo}"/>);"></span>
								<div class="info">
									<p class="name">${review.shopUser.user_name}</p>
									<p class="stat">${review.shopUser.review_cnt}리뷰</p>
								</div>
							</a>
							<hr />
							<div class="star_grade">
								<div class="grade" id="grade${review.reviewVo.review_idx}"
									style="padding: 0;"></div>
								<div class="grade_score"
									id="grade_score${review.reviewVo.review_idx}"></div>
								<div class="grade_comment"
									id="grade_comment${review.reviewVo.review_idx}"></div>
							</div>
							<div class="text">${review.reviewVo.review}</div>
							<div class="photo">
								<c:forTokens items="${review.reviewVo.review_photo}" var="img"
									delims="/">
									<a href="<c:url value='${path}/serverImg/review/${img}'/>"
										title="Picture"><img
										src="<c:url value='${path}/serverImg/review/${img}'/>"
										width="75" height="75"></a>
								</c:forTokens>
							</div>

							<div class="action">
								<input type="hidden" name="like_form"
									value="${review.reviewVo.review_idx}" />
								<button class="like"
									id="review_like${review.reviewVo.review_idx}">
									<i class="far fa-thumbs-up"></i>
									<p>좋아요</p>
									<span>${review.reviewVo.like_review}</span>
								</button>

								<input type="hidden" name="hate_form"
									value="${review.reviewVo.review_idx}" />
								<button class="hate"
									id="review_hate${review.reviewVo.review_idx}">
									<i class="far fa-thumbs-down"></i>
									<p>싫어요</p>
									<span>${review.reviewVo.hate_review}</span>
								</button>
							</div>

						</div>
					</c:forEach>
				</c:when>

				<c:otherwise>
					<div id="message">
						작성한 리뷰가 없습니다.<br> 지금 리뷰 작성을 해보시겠어요?
					</div>
					<script>
			$(document).ready(function(){
				$("#message").css("text-align", "center").css("background-color", "#fff").css("padding", "150px").css("font-size","17px").css("border-radius", "5px") ;
			});
			</script>
				</c:otherwise>
			</c:choose>
		</div>
	</div>