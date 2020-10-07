<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜한 리뷰</title>
<script>
$(document).ready(function(){
	$("#reservation>#contents_box").removeAttr("style");
});
</script>
</head>
<body>
<!-- 찜한 리뷰 -->
<%pageContext.setAttribute("sessionid", session.getAttribute("sessionID")); %>
	<div id="review_wrap">
		<div class="review_list">
		<c:choose>
			<c:when test="${!empty reviewList}">
				<c:forEach items="${reviewList}" var="review">
					<div class="review">
						<a class="author" href=""> <span class="thumbnail"
							style="background-image: url(<c:url value="${path}/serverImg/profile/user/${review.shopUser.user_photo}"/>);"></span>
							<div class="info">
								<p class="name">${review.shopUser.user_name}</p>
								<p class="stat">${review.shopUser.review_cnt} 리뷰</p>
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
							<button class="like" id="review_like${review.reviewVo.review_idx}">
								<i class="far fa-thumbs-up"></i>
								<p>좋아요</p>
								<span>${review.reviewVo.like_review}</span>
							</button>
	
							<input type="hidden" name="hate_form"
								value="${review.reviewVo.review_idx}" />
							<button class="hate" id="review_hate${review.reviewVo.review_idx}">
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
				찜한 리뷰가 없습니다.<br>
				지금 리뷰 작성을 해보시겠어요?
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

</body>
<script>
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
</script>
</html>