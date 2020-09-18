<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value='${path}/res/css/detail_review.css?ver=1'/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<link rel="stylesheet" href="<c:url value='${path}/res/css/magnific-popup.css'/>">

<script src="http://code.jquery.com/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="<c:url value='${path}/res/js/jquery.magnific-popup.js'/>"></script>
</head>
<body>
	<div id="review_wrap">
		<form action="review_upload" method="post" id="form">
			<div id="review_write_wrap">
				<div id="review_title">리뷰 쓰기</div>
				<ul id="list">
					<li id="list_grade" class="item">
						<div class="list_name">별점</div>
						<div id="star_score">
							<span id="star_span" style="padding:0;"></span> <span class="score"></span> <span
								class="comment"></span>
						</div>
					</li>
					<li id="list_text" class="item text">
						<div class="list_name">리뷰</div> <textarea name="review_area"
							id="review_area" cols="30" rows="10"
							placeholder="매장에 대한 리뷰를 작성해주세요."></textarea>
					</li>
					<li id="list_photo" class="item">
						<div class="list_name">사진 등록</div> <input type="file" />
					</li>
				</ul>
			</div>
			<input type="submit" id="submit" value="리뷰 올리기" />
		</form>
		<div id="sort_wrap">
			<span class="title">리뷰</span>
			<ul class="sort_list">
				<li class="listitem">최신순</li>
				<li class="listitem">인기순</li>
			</ul>
		</div>
		<div class="review_list">
		<c:forEach items="${reviewList}" var="review">
			<div class="review">
				<a class="author" href=""> <span class="thumbnail"
					style="background-image: url(<c:url value="${path}/res/image/user2.png"/>);"></span>
					<div class="info">
						<p class="name">${review.user_email}</p>
						<p class="stat">0 리뷰</p>
					</div>
				</a>
				<hr />
				<div class="star_grade">
					<div class="grade" id="grade" style="padding:0;"></div>
					<div class = "grade_score"></div>
					<div class="grade_comment"></div>
				</div>
				<div class="text">${review.review}</div>
				<div class="photo">					
					<a href="http://farm9.staticflickr.com/8242/8558295633_f34a55c1c6_b.jpg" title="The Cleaner"><img src="http://farm9.staticflickr.com/8242/8558295633_f34a55c1c6_s.jpg" width="75" height="75"></a>
					<a href="http://farm9.staticflickr.com/8382/8558295631_0f56c1284f_b.jpg" title="Winter Dance"><img src="http://farm9.staticflickr.com/8382/8558295631_0f56c1284f_s.jpg" width="75" height="75"></a>
					<a href="http://farm9.staticflickr.com/8225/8558295635_b1c5ce2794_b.jpg" title="The Uninvited Guest"><img src="http://farm9.staticflickr.com/8225/8558295635_b1c5ce2794_s.jpg" width="75" height="75"></a>
					<a href="http://farm9.staticflickr.com/8383/8563475581_df05e9906d_b.jpg" title="Oh no, not again!"><img src="http://farm9.staticflickr.com/8383/8563475581_df05e9906d_s.jpg" width="75" height="75"></a>
					<a href="http://farm9.staticflickr.com/8235/8559402846_8b7f82e05d_b.jpg" title="Swan Lake"><img src="http://farm9.staticflickr.com/8235/8559402846_8b7f82e05d_s.jpg" width="75" height="75"></a>
					<a href="http://farm9.staticflickr.com/8235/8558295467_e89e95e05a_b.jpg" title="The Shake"><img src="http://farm9.staticflickr.com/8235/8558295467_e89e95e05a_s.jpg" width="75" height="75"></a>
					<a href="http://farm9.staticflickr.com/8378/8559402848_9fcd90d20b_b.jpg" title="Who's that, mommy?"><img src="http://farm9.staticflickr.com/8378/8559402848_9fcd90d20b_s.jpg" width="75" height="75"></a>
					<a href="http://farm9.staticflickr.com/8378/8559402848_9fcd90d20b_b.jpg" title="Who's that, mommy?"><img src="http://farm9.staticflickr.com/8378/8559402848_9fcd90d20b_s.jpg" width="75" height="75"></a>
					<a href="http://farm9.staticflickr.com/8378/8559402848_9fcd90d20b_b.jpg" title="Who's that, mommy?"><img src="http://farm9.staticflickr.com/8378/8559402848_9fcd90d20b_s.jpg" width="75" height="75"></a>
					<a href="<c:url value="${path}/res/image/user2.png"/>" title="Who's that, mommy?"><img src="<c:url value="${path}/res/image/user2.png"/>" width="75" height="75"></a>
				</div>
				<div class="action">
					<input type="hidden" value="test@bobpool.com"/>
					<button class="like">					
						<i class="far fa-thumbs-up"></i>
						<p>좋아요</p>
						<span>0</span>
					</button>
					<button class="hate">
						<i class="far fa-thumbs-down"></i>
						<p>싫어요</p>
						<span>0</span>
					</button>
				</div>
			</div>
			</c:forEach>
			
			<div class="review">
				<a class="author" href=""> <span class="thumbnail"
					style="background-image: url(<c:url value="${path}/res/image/user2.png"/>);"></span>
					<div class="info">
						<p class="name">홍길동</p>
						<p class="stat">0 팔로워</p>
					</div>

				</a>
			</div>
		</div>
	</div>
</body>
<script>
	var cur_rating = 0;

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
	    },
		starSvg : '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>'
	});
	
	$("#grade").rateYo({
		rating : 2.5,
		starWidth: "23px",
		halfStar: true,
		readOnly: false,
		onInit: function (rating, rateYoInstance) {
			mk_comment(rating,".grade_comment",".grade_score");
			$("#grade").rateYo("option", "readOnly", true);
		},
		starSvg : '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>'
	});

	$('#submit').click(function(e) {
		e.preventDefault();
		var action = $('#form').attr("action");

		var form_data = {
			star_span : cur_rating,
			review_area : $('#review_area').val()
		};

		$.ajax({
			type : "POST",
			url : action,
			data : form_data,
			success : function(data) {
				if (data == "success") {
					alert("성공");
				}
			},
			error : function() {
				alert("에러발생");
			}
		});
	});
	
	$('.photo').magnificPopup({
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
			tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
			titleSrc: function(item) {
				return item.el.attr('title') + '<small>by Marsel Van Oosten</small>';
			}
		}
	});
	
	$(".action > button").hover(function() {
		$(this).children("p").attr("border-color", "#f05e23");
	});
	$('.like').click(function(){
		console.log($(this).parent("div").children("input").val());
	});
</script>
</html>