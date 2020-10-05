<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:forEach items="${reviewList}" var="review">
	<div class="review">
	<%-- <div class="del">
		<input type="hidden" id="h_reviewIdx${review.reviewVo.review_idx}" value="${review.reviewVo.review_idx}"/>
		<input type="hidden" id="h_user_email${review.reviewVo.review_idx}" value="${review.reviewVo.user_email}"/>
		<i class="fas fa-times" style="color:lightgray" id="del${review.reviewVo.review_idx}"></i>
	</div>  --%>
		<a class="author" href=""> <span class="thumbnail"
			style="background-image: url(<c:url value="${path}/res/image/user2.png"/>);"></span>
			<div class="info">
				<p class="name">${review.shopUser.user_name}</p>
				<p class="stat">리뷰 ${review.shopUser.review_cnt}</p>
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
		<div class="photo" id="photo${review.reviewVo.review_idx}">
			<c:forTokens items="${review.reviewVo.review_photo}" var="img"
				delims="/" varStatus="i">
				<a href="<c:url value='${path}/serverImg/review/${img}'/>">
				<img src="<c:url value='${path}/serverImg/review/${img}'/>" width="75"
					height="75"></a>
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
<%pageContext.setAttribute("shopId", request.getParameter("shopId"));%>
<script>
	/* 버튼 색상변경 */
	if(id != null){
		<c:forEach items="${likeList}" var="obj" >
			$('#review_like${obj.review_idx}').attr("style","color:#f05e23;border-color:#f05e23;").children("p").attr("style", "border-color:#f05e23");
		</c:forEach>
	
		<c:forEach items="${hateList}" var="obj" >
			$('#review_hate${obj.review_idx}').attr("style","color:#f05e23;border-color:#f05e23;").children("p").attr("style", "border-color:#f05e23");
		</c:forEach>	
	}
	/* 리뷰  별점*/
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
	
	/* 좋아요 버튼 */
	<c:forEach items="${reviewList}" var="review">	
	$("#review_like${review.reviewVo.review_idx}").click(function () {
		$.ajax({
			type : "POST",
			url : "review/like",
			dataType : "json",
			data: {
				reviewIdx : ${review.reviewVo.review_idx},
				shopId : "${shopId}"
			},
			success:function(data) {
				if(data.isLike == "true"){
					alert("이미 좋아요를 누르셨습니다.");
				}else if(data.isLike == "false"){
					$('#review_like${review.reviewVo.review_idx}').children("span").replaceWith("<span>"+data.like+"</span>");
					$('#review_like${review.reviewVo.review_idx}').attr("style","color:#f05e23;border-color:#f05e23;").children("p").attr("style", "border-color:#f05e23");
				}else if(data.islogin == "false"){
					idcheck();
				}					
			},
			error : function() {
				alert("에러발생");
			}

		});
	});
	</c:forEach>
	
	/* 싫어요 버튼 */
	<c:forEach items="${reviewList}" var="review">	
	$("#review_hate${review.reviewVo.review_idx}").click(function () {			
		$.ajax({
			type : "POST",
			url : "review/hate",
			dataType : "json",
			data: {
				reviewIdx : ${review.reviewVo.review_idx},
				shopId : "${shopId}"
			},
			success : function(data) {
				if(data.isHate == "true"){
					alert("이미 싫어요를 누르셨습니다.");
				}else if(data.isHate == "false"){
					$('#review_hate${review.reviewVo.review_idx}').children("span").replaceWith("<span>"+data.hate+"</span>");
					$('#review_hate${review.reviewVo.review_idx}').attr("style","color:#f05e23;border-color:#f05e23;").children("p").attr("style", "border-color:#f05e23");
				}else if(data.islogin == "false"){
					/* alert("로그인 후 시도하세요"); */
					idcheck();				
				}					
			},
			error : function() {
				alert("에러발생");
			}

		});			
	});	
	/* 이미지 팝업 */
	$('#photo${review.reviewVo.review_idx}').magnificPopup({
		delegate: 'a',
		type: 'image',
		tLoading: 'Loading image #%curr%...',
		mainClass: 'mfp-img-mobile',
		gallery: {
			enabled: true,
			navigateByImgClick: true,
			preload: [0,1] // Will preload 0 - before current, and 1 after the current image
		},
		image: {
			tError: '<a href="%url%">The image #%curr%</a> could not be loaded.'
		}
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
					$(".review_list").load("detail/reviewList", {shopId : "${shopId}",sort : "new"});
				}
			},
			error : function() {
				alert("에러발생");
			}
		});
	})
	</c:forEach>
	function idcheck(){
		$("#join_body").hide();
		$("#join2_body").hide();
		$("#idsearch_body").hide();
		$("#passwordsearch_body").hide();
	
		$("#login_body").show();
		$("#popup_body").show();
		$("#naverIdLogin").show();
		$("#nav_shading.shading_bg").show();
	
		$("#nav_btn").siblings().removeClass('focus');
	
		$('#popup_body').css('width', 404 + 'px');
		$('#popup_body').css('height', 554 + 'px');
	
		$("#naverIdLogin").css('top', 0);
	
		$('.popup_close').css('top', -90 + 'px');
		$('.popup_close').css('left', 80 + '%');
	}
</script>
