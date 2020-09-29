<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">


<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="${path}/res/css/main_content.css?ver=3"/>" />
</head>
<body>
	<div class="benefit">
		<span class="epicureanspan">함께 즐기고 싶은 혜택</span>
		<div class="epicureandiv">
			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit1.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">밥풀예약수 TOP 20 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">포잉 사용자들이 가장 사랑한 레스토랑</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit2.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">스시오마카세 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">미들급 스시야부터 하이엔드 스시야까지</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit3.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">스테이크 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">육향이 남다른 스테이크를 즐겨보세요</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit4.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">컨템퍼러리 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">셰프의 섬세한 터치가 가미된 창의적인 다이닝</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit5.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">양식 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">이탈리안부터 프렌치까지. 데이트하기 좋은 곳</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit6.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">일식 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">가이세키 요리부터 쿠시아게 오마카세까지</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit7.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">중식 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">중화요리의 전설, 환상적인 불맛</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit8.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">한식 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">한식의 다채로운 변주를 경험해보세요</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/benefit9.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">한우 | 다이닝 티켓</div>
					<div class="epicureandiv3div2">숙성 한우 등심부터 추억의 로스구이까지</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="">더보기 ></a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="epicurean">
		<span class="epicureanspan">미식가를 위한</span>
		<div class="epicureandiv">
			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/epicurean.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">간판없는 가게</div>
					<div class="epicureandiv3div2">간판 없이, 조용한 손님의 발길을 끄는 숨겨진 보석
						같은곳을 소개합니다</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23조용한">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/spicy.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">매운 음식</div>
					<div class="epicureandiv3div2">중독성 강한, 입안 가득 차오르는 매운맛을 소개합니다.
					</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23매운">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/raman.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">라멘 먹고 갈래요?</div>
					<div class="epicureandiv3div2">지역에 따라 다른 특성을 가진 일본 라멘.</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23라멘">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/wodong.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">우동의 매력</div>
					<div class="epicureandiv3div2">지역마다 각기 다른 매력을 가진 우동. 각지의 맛있는 
					우동을 소개합니다.</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23우동">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/chinafood.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">전혀 다른 중국집</div>
					<div class="epicureandiv3div2">환상적인 분위기가 가득한 중식 다이닝 바에서 먹고,
						마시며, 즐기다!</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23중국집">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/restaurant.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">하늘 아래,뷰가 좋은 레스토랑</div>
					<div class="epicureandiv3div2">한적한 낮과 화려한 밤을 모두 감상할 수 있는 뷰가
						좋은 레스토랑</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23레스토랑">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/hotfood.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">뜨거운 것이 좋아</div>
					<div class="epicureandiv3div2">겨울의 시작, 뜨끈한 국물의 모츠나베와 불판 위의
						징키스칸을 만나다.</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23뜨거운">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/Sandwich.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">세상의 모든 샌드위치</div>
					<div class="epicureandiv3div2">근사한 재료가 아니더라도, 무한한 변형이 가능한
						샌드위치. 세계의 다양한 샌드위치를 만나볼까요?</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23샌드위치">더보기 ></a>
					</div>
				</div>
			</div>

			<div class="epicureandiv1">
				<div class="epicureandiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/healthfood.png"/>"
						class="epicureandiv2img">
				</div>
				<div class="epicureandiv3">
					<div class="epicureandiv3div">더위를 이기는,요즘 보양식</div>
					<div class="epicureandiv3div2">지겨운 보양식은 그만! 삼계탕이 지겨울 때 찾는 요즘의
						이색 보양식.</div>
					<hr class="epicureandiv3hr">
					<div class="epicureandiv3div3">
						<a href="list?string_search=%23보양식">더보기 ></a>
					</div>
				</div>
			</div>
		</div>
	</div>


<%-- <div class="circle">
      <span class="circlespan">뭐로 할까요?</span>
      <div class=circlediv>
         <div class="circlediv1">

            <div class="circlediv2">
               <img
                  src="<c:url value="${path}/res/image/main_content/chef1.png"/>"
                  class="circleimg">
               <div class="circlediv3">후덕죽</div>
               <div class="circlediv4">허우 / Chef</div>
            </div>
            <div class="circlediv2">
               <img
                  src="<c:url value="${path}/res/image/main_content/chef2.png"/>"
                  class="circleimg">
               <div class="circlediv3">임재원</div>
               <div class="circlediv4">르 챔버 / Bartender</div>
            </div>
            <div class="circlediv2">
               <img
                  src="<c:url value="${path}/res/image/main_content/chef3.png"/>"
                  class="circleimg">
               <div class="circlediv3">조셉 리저우드</div>
               <div class="circlediv4">레스토랑 에빗 / Chef</div>
            </div>
            <div class="circlediv2">
               <img
                  src="<c:url value="${path}/res/image/main_content/chef8.png"/>"
                  class="circleimg">
                  <div class="circlediv3">권우중</div>
               <div class="circlediv4">권숙수 / CHEF</div>
            </div>


            <div class="circlediv2">
               <img
                  src="<c:url value="${path}/res/image/main_content/chef4.png"/>"
                  class="circleimg">
                     <div class="circlediv3">이 준</div>
               <div class="circlediv4">스와니예, 도우룸 / CHEF</div>
            </div>
            <div class="circlediv2">
               <img
                  src="<c:url value="${path}/res/image/main_content/chef5.png"/>"
                  class="circleimg">
                        <div class="circlediv3">옥동식</div>
               <div class="circlediv4">옥동식 / CHEF</div>
            </div>
            <div class="circlediv2">
               <img
                  src="<c:url value="${path}/res/image/main_content/chef6.png"/>"
                  class="circleimg">
                           <div class="circlediv3">피에르가니에르</div>
               <div class="circlediv4">피에르가니에르 / CHEF</div>
            </div>
            <div class="circlediv2">
               <img
                  src="<c:url value="${path}/res/image/main_content/chef7.png"/>"
                  class="circleimg">
                           <div class="circlediv3">울프강</div>
               <div class="circlediv4">울프강스테이크하우스 / CEO</div>
            </div>

         </div>



      </div>

   </div> --%>

	<div class="category">
		<span class="categoryspan">카테고리별</span>
		<div class="category0">
			<div class="categorydiv" onclick ="window.location.href='location';">
				<img
					src="<c:url value="${path}/res/image/main_content/popularity.jpg"/>">
				<div class="categorydiv2">주요 지역별</div>
			</div>

			<div class="categorydiv" onclick ="window.location.href='food';">
				<img src="<c:url value="${path}/res/image/main_content/food.jpg"/>">
				<div class="categorydiv2">음식 종류별</div>
			</div>

			<div class="categorydiv" onclick ="window.location.href='hashTag';">
				<img src="<c:url value="${path}/res/image/main_content/around.jpg"/>">
				<div class="categorydiv2">해시태그</div>
			</div>

		</div>
	</div>








	<div class="review">
		<span class="reviewspan">실시간 리뷰</span>
		<div class="reviewdiv">
			<div class="reviewdiv1">
				<div class="reviewdiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/coffie.jpg"/>"
						class="reviewdiv2img">
					<div class="review_img_div">
						스타벅스<br> 서울 > 구로구
					</div>
				</div>
				<div class="reviewdiv3">
					<img
						src="<c:url value="${path}/res/image/main_content/profile.png"/>"
						class="profile">
					<div class="info">
						<div class="infoname">이준영</div>
						<div class="infocount">리뷰수1,팔로워20</div>
						<div class="infostar"></div>
						<div class="infograde">
							<span class="infogradespan">3.5점</span>
						</div>
						<div class="infopreview">
							<span class="reviewspan2">지인들이랑 커피 마셧는데 꿀맛이네여 꼭한번 여기서
								마셔보세요 !~</span>
						</div>
						<div class="infodetail">
							<a href="http://localhost:8080/hellospring/views/main.jsp"><span>더보기</span></a>
						</div>
					</div>
				</div>
			</div>

			<div class="reviewdiv1">
				<div class="reviewdiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/sushikana.png"/>"
						class="reviewdiv2img">
					<div class="review_img_div">
						스시카나<br> 서울 > 강남구 · 일식
					</div>
				</div>
				<div class="reviewdiv3">
					<img
						src="<c:url value="${path}/res/image/main_content/profile.png"/>"
						class="profile">
					<div class="info">
						<div class="infoname">박정석</div>
						<div class="infocount">리뷰수27,팔로워500</div>
						<div class="infostar"></div>
						<div class="infograde">
							<span class="infogradespan">4.0점</span>
						</div>
						<div class="infopreview">
							<span class="reviewspan2">좋은 시간 보내고 갑니다! 맛있는 한끼 감사합니다 :)</span>
						</div>
						<div class="infodetail">
							<a href="http://localhost:8080/hellospring/views/main.jsp"><span>더보기</span></a>
						</div>
					</div>
				</div>
			</div>

			<div class="reviewdiv1">
				<div class="reviewdiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/deokhuseonsaeng.png"/>"
						class="reviewdiv2img">
					<div class="review_img_div">
						덕후선생<br> 청담동 · 중식
					</div>
				</div>
				<div class="reviewdiv3">
					<img
						src="<c:url value="${path}/res/image/main_content/profile.png"/>"
						class="profile">
					<div class="info">
						<div class="infoname">이예찬</div>
						<div class="infocount">리뷰수4,팔로워24</div>
						<div class="infostar"></div>
						<div class="infograde">
							<span class="infogradespan">4.0점</span>
						</div>
						<div class="infopreview">
							<span class="reviewspan2">모던눌랑처럼 어두운 조명, 높은 층고와 같은 컨셉이 확실히
								있는 식당. 요리의 단가가 낮고 포션이 적어 다양하게 맛볼 수 있는게 장점. 베이징덕도 나쁘진 않지만 다른 요리들을
								더 추천하고 싶음.</span>
						</div>
						<div class="infodetail">
							<a href="http://localhost:8080/hellospring/views/main.jsp"><span>더보기</span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="reviewdiv1">
				<div class="reviewdiv2">
					<img src="<c:url value="${path}/res/image/main_content/ju.png"/>"
						class="reviewdiv2img">
					<div class="review_img_div">
						주<br> 서래마을 · 중식
					</div>
				</div>
				<div class="reviewdiv3">
					<img
						src="<c:url value="${path}/res/image/main_content/profile.png"/>"
						class="profile">
					<div class="info">
						<div class="infoname">서다슬</div>
						<div class="infocount">리뷰수9,팔로워6</div>
						<div class="infostar"></div>
						<div class="infograde">
							<span class="infogradespan">4.5점</span>
						</div>
						<div class="infopreview">
							<span class="reviewspan2">동네맛집 주. 탕수육은 말할 것도 없구요. 식사 주문 시
								두개로 나눠달라고 하여 쉐어하는 건 저의 꿀팁! 예를 들어 2명이 식사하러 가서 탕수육 하나에 짬뽕 하나를 시킬
								때, 짬뽕 하나를 둘로 나눠주세요 라고 하면 둘이 먹기에 최고의 조합+양입니다 !</span>
						</div>
						<div class="infodetail">
							<a href="http://localhost:8080/hellospring/views/main.jsp"><span>더보기</span></a>
						</div>
					</div>
				</div>
			</div>

			<div class="reviewdiv1">
				<div class="reviewdiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/hyeonghuntendong.png"/>"
						class="reviewdiv2img">
					<div class="review_img_div">
						형훈텐동<br> 경기 > 수원시 · 일식
					</div>
				</div>
				<div class="reviewdiv3">
					<img
						src="<c:url value="${path}/res/image/main_content/profile.png"/>"
						class="profile">
					<div class="info">
						<div class="infoname">안승우</div>
						<div class="infocount">리뷰수99,팔로워4</div>
						<div class="infostar"></div>
						<div class="infograde">
							<span class="infogradespan">3.0점</span>
						</div>
						<div class="infopreview">
							<span class="reviewspan2">압구정점에서도 먹어봤는데 맛의 차이는 없어요 약간 느끼해서
								토마토랑 드시는거 추천합니다!</span>
						</div>
						<div class="infodetail">
							<a href="http://localhost:8080/hellospring/views/main.jsp"><span>더보기</span></a>
						</div>
					</div>
				</div>
			</div>

			<div class="reviewdiv1">
				<div class="reviewdiv2">
					<img
						src="<c:url value="${path}/res/image/main_content/ottelduseu.png"/>"
						class="reviewdiv2img">
					<div class="review_img_div">
						오뗄두스<br> 서래마을 · 카페/베이커리
					</div>
				</div>
				<div class="reviewdiv3">
					<img
						src="<c:url value="${path}/res/image/main_content/profile.png"/>"
						class="profile">
					<div class="info">
						<div class="infoname">최희만</div>
						<div class="infocount">리뷰수12,팔로워35</div>
						<div class="infostar"></div>
						<div class="infograde">
							<span class="infogradespan">4.5점</span>
						</div>
						<div class="infopreview">
							<span class="reviewspan2">에끌레어 여기보다 맛있는 데 있으면 알려주실래요? 동네
								디저트집 오뗄두스 1위 / 줄리에뜨 2위</span>
						</div>
						<div class="infodetail">
							<a href="http://localhost:8080/hellospring/views/main.jsp"><span>더보기</span></a>
						</div>
					</div>
				</div>
			</div>


		</div>

	</div>
</body>
<script>
	$('.reviewdiv').slick({
		infinite : true,
		slidesToShow : 3,
		slidesToScroll : 3
	});

	$('.epicureandiv').slick({
		infinite : true,
		slidesToShow : 3,
		slidesToScroll : 3
	});
	$('.circlediv1').slick({
		infinite : true,
		slidesToShow : 4,
		slidesToScroll : 4
	});	
	
    $(".infostar").rateYo({  	  
		rating :  3,
		starWidth: "20px",
	    halfStar: true,
	  	readOnly: true,
		starSvg : '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>'
		});  
</script>
</html>