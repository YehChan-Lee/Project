<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="<c:url value='${path}/res/css/magnific-popup.css'/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<link rel="stylesheet" href="<c:url value='${path}/res/css/detail_review.css?ver=1'/>">
</head>
<body>
<%pageContext.setAttribute("sessionid", session.getAttribute("sessionID")); %>
	<div id="review_wrap">
		<form action="review_upload" method="post" id="review_upload"
			enctype="multipart/form-data">
			<div id="review_write_wrap">
				<div id="review_title">리뷰 쓰기</div>
				<ul id="list">
					<li id="list_grade" class="item">
						<div class="list_name">별점</div>
						<div id="star_score">
							<span id="star_span" style="padding: 0; vertical-align: super"></span>
							<span class="score"></span> <span class="comment"></span>
						</div> <input type="hidden" id="hidden_grade" name="hidden_grade" />
					</li>
					<li id="list_text" class="item text">
						<div class="list_name">리뷰</div> <textarea name="review_area"
							id="review_area" cols="30" rows="10"
							placeholder="매장에 대한 리뷰를 작성해주세요."></textarea>
					</li>
					<li id="list_photo" class="item">
						<div class="list_name">사진 등록</div> <input type="file"
						name="inputImage" accept="image/png,image/jpeg,image/jpg"
						multiple="multiple" />
					</li>
				</ul>
			</div>
			<input type="submit" id="review_submit" value="리뷰 올리기" />
		</form>
		<div id="sort_wrap">
			<span class="title">리뷰</span>
			<ul class="sort_list">
				<li class="listitem" id="new">최신순</li>
				<li class="listitem" id="popular">인기순</li>
			</ul>
		</div>
		<div class="review_list"></div>
	</div>
</body>
<script>
 
	var cur_rating = 0;	
	var id = '${sessionid}';
	$(".review_list").load("detail/reviewList", {shopId : "${shopId}",sort : "new"});
	
	if(id != null){
		<c:forEach items="${likeList}" var="obj" >
			$('#review_like${obj.review_idx}').attr("style","color:#f05e23;border-color:#f05e23;").children("p").attr("style", "border-color:#f05e23");
		</c:forEach>
	
		<c:forEach items="${hateList}" var="obj" >
			$('#review_hate${obj.review_idx}').attr("style","color:#f05e23;border-color:#f05e23;").children("p").attr("style", "border-color:#f05e23");
		</c:forEach>	
	}
	
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

	$("#star_span").rateYo({
		rating : 0,
		starWidth: "23px",
	    halfStar: true,
	    onChange: function (rating, rateYoInstance) {	    	 
	    	mk_comment(rating,".comment",".score");
	    },
	    onSet: function (rating, rateYoInstance) {
	    	cur_rating = rating;
	    	$("#hidden_grade").attr("value",rating);
	    },
		starSvg : '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>'
	});	
	var option = {
		type : "POST",
		url : "review_upload",
		data : {shopId : "${shopId}"},
		success:function(data){
			if(data == "success"){
				$(".review_list").unload();
				$(".review_list").load("detail/reviewList?sort=new", {shopId : "${shopId}"});
			}else if(data == "notLogin"){
				idcheck();
			}else if(data == "reviewinput"){
				alert("별점이나 내용을 입력해주세요.");
			}
		},
	  error : function(data, status, err) {
	   alert('에러발생 리뷰 업로드 실패');
	  }
	} 
	
	$('#review_upload').submit(function () {
		$(this).ajaxSubmit(option);
		return false;
	});				
		
	$(".action > button").hover(function() {
		$(this).children("p").attr("border-color", "#f05e23");
	});
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
		$('#popup_body').css('height', 472 + 'px');

		$("#naverIdLogin").css('top', 0);

		$('.popup_close').css('top', -50 + 'px');
		$('.popup_close').css('left', 80 + '%');
	}
	$(".sort_list > .listitem").click(function () {
		if($(this).attr("id") == "new"){
			$(".review_list").unload();
			$(".review_list").load("detail/reviewList?sort=new", {shopId : "${shopId}"});
		}else{
			$(".review_list").unload();		
			$(".review_list").load("detail/reviewList?sort=popular", {shopId : "${shopId}"}); 
		}
	})
</script>

</html>