<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>

<style type="text/css">
/* 내용에 padding-bottom */
#content {
	padding-bottom: 50px;
}
/* 일간 주간 탑바 */
#top_bar2 {
	background-color: #fff;
	position: sticky;
	top: 40px;
	z-index: 90;
	width: 100%;
	height: 31px;
	border-bottom: 1px solid #b8b8b8;
}
/* topbar 크기 지정 */
#top_bar2 ul {
	width: 85%;
	margin: auto;
}
/*  topbar 일간 주간 정렬 */
#top_bar2 .pull_left2 {
	margin-top: 8px;
	float: left;
	height: 30px;
	width: 15%;
	text-align: center;
	font-size: 0.9em;
	margin-left: 10px;
	font-weight: bold;
	text-decoration: none;
}
/* topbar 선택된 글씨 처리 */
#top_bar2 .selected {
	color: #E61A3F;
}
/* 숨김처리 */
.hide {
	display: none;
}
/* a태그 영화제목 밑줄 제거 */
a {
	text-decoration: none;
	color: #aaa;
}
/* topbar2와 내용 분리 */
.clearfix:after {
	content: "";
	display: block;
	float: none;
	clear: both;
}
/* 영화썸네일 밑줄 */
#movie li {
	border-bottom: 1px solid #eee;
	position: relative;
}
/* 맨 마지막 밑줄 x */
#movie li:last-child {
	border-bottom: 0;
}
/*영화 썸네일안에 글씨*/
#movie li a {
	display: block;
	width: auto;
	padding: 5px;
	color: #222;
	text-decoration: none;
	position: relative;
	display: block;
}

#movie li a .thumb {
	width: 80px;
	height: 130px;
	display: block;
}

#movie .thumb img {
	margin: 3px 0px 3px 3px;
	width: 90px;
	height: 125px;
}

#movie .movie_text {
	display: block;
	width: auto;
	position: absolute;
	left: 110px;
	top: 20px;
	float: left;
}

#movie .movie_text span {
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}
/* 영화 순위 */
#movie .grade {
	font-size: 25px;
	padding-top: 7px;
	padding-bottom: 10px;
	color: #222;
	font-weight: bold;
	font-style: italic;
}
/* 영화 제목 */
#movie .movie_title {
	font-size: 16px;
	font-weight: bold;
	margin-top: 20px;
}
/* 영화 대여 가격 */
#movie .price {
	display: block;
	height: 20px;
	font-size: 14px;
	line-height: 20px;
	color: #ff3253;
	position: absolute;
	top: 65px;
}
/* 영화 순위 up */
#movie .lank_up {
	font-size: 14px;
	display: inline-block;
	text-align: center;
	color: #E61A3F;
	width: 30px;
	margin-right: 5px;
}
/* 영화 순위 down */
#movie .lank_down {
	color: #42ff;
	font-size: 14px;
	display: inline-block;
	text-align: center;
	margin-right: 5px;
}

/* 영화 순위 변동x */
#movie .lank_normal {
	font-size: 20px;
	display: inline-block;
	text-align: center;
	margin-right: 5px;
	color: #aaa;
	font-style: bold;
}
/* 영화 가격 옆 c 코인 이미지 */
#movie .price img {
	width: 14px;
	height: 14px;
	position:relative;
	top:2.5px;
	
}
</style>

</head>

<body>
	<!--전체박스-->
	<div id="container">

		<!--TOP LOGO-->
        <%@ include file="assets/inc/top_logo.jsp" %>

        <!--TOP BAR-->
        <%@ include file="assets/inc/top_bar.jsp" %>

		<!-- TOP BAR2 일간/주간 -->
		<div id="top_bar2">
			<ul class="clearfix2">
				<li class="pull_left2"><a href=".movie_top100_page_day"
					class="movie_top100_page selected">일간</a>
				<li class="pull_left2"><a href=".movie_top100_page_week"
					class="movie_top100_page">주간</a>
			</ul>
		</div>

		<!--페이지별 가변 요소-->

		<!-- 일간 top100 -->
		<!-- <div id="content">
			<div class="movie_top100_page_day up">
				<ul id="movie">
					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample1.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">1</span> <span class="lank_up"
								style="display: inline;">&nbsp;1▲</span> <span
								class="movie_title">백두산</span> <span class="price">대여&nbsp;10,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample3.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">2</span> <span class="lank_down"
								style="display: inline;">&nbsp;1▼</span> <span
								class="movie_title">내이름은칸</span> <span class="price">대여&nbsp;10,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample5.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">3</span> <span class="lank_normal"
								style="display: inline;">&nbsp;-</span> <span
								class="movie_title">MoonLight</span> <span class="price">대여&nbsp;1,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample7.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">4</span> <span class="lank_down"
								style="display: inline;">&nbsp;1▼</span> <span
								class="movie_title">머드라</span> <span class="price">대여&nbsp;2,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample9.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">5</span> <span class="lank_normal"
								style="display: inline;">&nbsp; -</span> <span
								class="movie_title">Baby Driver</span> <span class="price">대여&nbsp;3,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample2.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">6</span> <span class="lank_down"
								style="display: inline;">&nbsp;1▼</span> <span
								class="movie_title">Captain America</span> <span class="price">대여&nbsp;6,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample4.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">7</span> <span class="lank_up"
								style="display: inline;">&nbsp;3▲</span> <span
								class="movie_title">마녀</span> <span class="price">대여&nbsp;7,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample6.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">8</span> <span class="lank_normal"
								style="display: inline;">&nbsp; -</span> <span
								class="movie_title">플로리다 프로젝트</span> <span class="price">대여&nbsp;7,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample8.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">9</span> <span class="lank_up"
								style="display: inline;">&nbsp;1▲</span> <span
								class="movie_title">1917</span> <span class="price">대여&nbsp;8,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample10.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">10</span> <span class="lank_down"
								style="display: inline;">&nbsp;1▼</span> <span
								class="movie_title">Marjorie Prime</span> <span class="price">대여&nbsp;9,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>
				</ul>
			</div>


			<div class="movie_top100_page_week hide up">
				<ul id="movie">
					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample9.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">1</span> <span class="lank_up"
								style="display: inline;">&nbsp;1▲</span> <span
								class="movie_title">Baby Driver</span> <span class="price">대여&nbsp;9,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample8.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">2</span> <span class="lank_down"
								style="display: inline;">&nbsp;1▼</span> <span
								class="movie_title">1917</span> <span class="price">대여&nbsp;5,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample7.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">3</span> <span class="lank_normal"
								style="display: inline;">&nbsp; -</span> <span
								class="movie_title">머드라</span> <span class="price">대여&nbsp;10,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample6.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">4</span> <span class="lank_down"
								style="display: inline;">&nbsp;1▼</span> <span
								class="movie_title">플로리다 프로젝트</span> <span class="price">대여&nbsp;9,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample5.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">5</span> <span class="lank_normal"
								style="display: inline;">&nbsp; -</span> <span
								class="movie_title">MoonLight</span> <span class="price">대여&nbsp;6,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample4.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">6</span> <span class="lank_down"
								style="display: inline;">&nbsp;1▼</span> <span
								class="movie_title">마녀</span> <span class="price">대여&nbsp;4,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample3.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">7</span> <span class="lank_up"
								style="display: inline;">&nbsp;3▲</span> <span
								class="movie_title">내이름은칸</span> <span class="price">대여&nbsp;2,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample2.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">8</span> <span class="lank_normal"
								style="display: inline;">&nbsp; -</span> <span
								class="movie_title">Captain America</span> <span class="price">대여&nbsp;11,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample1.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">9</span> <span class="lank_up"
								style="display: inline;">&nbsp;1▲</span> <span
								class="movie_title">백두산</span> <span class="price">대여&nbsp;2,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>

					<li><a href="Movie_information.jsp"> <span class="thumb"><img
								src="assets/img/sample10.jpg" alt="영화포스터"></span>
							<span class="movie_text"> <span style="display: inline;"
								class="grade">10</span> <span class="lank_down"
								style="display: inline;">&nbsp;1▼</span> <span
								class="movie_title">Marjorie Prime</span> <span class="price">대여&nbsp;1,000<img src="assets/img/coin_icon.png">
							</span>
						</span>
					</a></li>
				</ul>
			</div>
		</div> -->
		<!-- BOT BAR -->
		<%@ include file="assets/inc/bot_bar.jsp" %>
		
	</div>
	<script type="text/javascript">
		$(function() {
			$(".bot_bar_icon").eq(0).attr("src", "assets/img/home_icon_selected.png");
			$(".top_bar_list").eq(2).addClass("selected");
			
			/** 카테고리 버튼의 클릭 처리 */
			$(".movie_top100_page").click(function(e) {
				// 페이지 이동 방지
				e.preventDefault();

				// 클릭된 요소를 제외한 나머지에게 selected 클래스 제거 --> css 적용
				$(".movie_top100_page").not(this).removeClass("selected");

				// 클릭된 요소에게 selected 클래스 적용 --> css 적용
				$(this).addClass("selected");

				var target = $(this).attr("href");
				$(target).removeClass("hide");
				$("#content > div").not($(target)).addClass("hide");

				// 주간, 일간 눌렀을때 페이지 상단으로 이동
				$(window).scrollTop(0);
			});
		}); // end $(function() {})
	</script>
</body>

</html>