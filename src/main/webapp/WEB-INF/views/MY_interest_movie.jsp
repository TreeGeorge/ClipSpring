<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
<script
	src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<style>
.clear {
	content: "";
	display: block;
	float: none;
	clear: both;
}

.content .delete_list {
	padding-left: 5px;
}

.content {
	font-weight: bold;
	font-size: 12px;
	height: 35px;
	line-height: 35px;
	border-bottom: 1px solid #d5d5d5;
	padding: 0 10px 0 15px;
}

/* n개작품 left */
.total {
	float: left;
	display: block;
}

/* 드랍다운 css */
.selcls {
	padding: 2px;
	border: solid 1px #eee;
	outline: 0;
	background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF),
		color-stop(4%, #fff), to(#FFFFFF));
	background: -moz-linear-gradient(top, #FFFFFF, #fff 1px, #FFFFFF 25px);
	box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	-moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	width: 85px;
	height: 28px;
	float: right;
	margin-top: 3px;
	font-size: 12px;
}

/** 영화 목록 **/
.movie {
	margin: 0px;
	padding: 0px;
}

.movie li {
	border-bottom: 1px solid #eee;
	margin: 0px;
	padding: 0px;
}

.movie li a {
	display: block;
	width: 85%;
	padding: 10px;
	color: #222;
	text-decoration: none;
	position: relative;
	display: block;
}

.movie a {
	padding-left: -10px;
}

.movie li a .thumb {
	width: 80px;
	height: 125px;
	display: block;
}

.movie img {
	width: auto;
	height: 125px;
}

.movie .movie_title {
	display: block;
	position: absolute;
	left: 105px;
	top: 30px;
	font-weight: bold;
	font-size: 16px;
	width: 50%;
	height: 30px;
	line-height: 30px;
	display: block;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	text-align: left;
}

.movie .age {
	display: block;
	position: absolute;
	left: 105px;
	top: 60px;
	font-size: 12px;
	line-height: 20px;
	height: 20px;
	color: #aaa;
}

.movie .act {
	display: block;
	position: absolute;
	left: 105px;
	top: 80px;
	font-size: 12px;
	line-height: 20px;
	height: 20px;
	color: #ff3253;
}

/* hidden , hide */
.hidden {
	visibility: hidden;
}

.hide {
	display: none;
}

/* 휴지통 버튼 */
.wastebasket a {
	display: inline-block;
	height: 45px;
	width: 100%;
	text-decoration: none;
	color: #eee;
	box-sizing: border-box;
	line-height: 45px;
	border: 1px solid #b8b8b8;
	text-align: center;
	padding: 0;
	margin: auto;
	background-color: #E61A3F;
	font-weight: bold;
}

/* 휴지통 글씨 */
.wastebasket {
	text-align: center;
	position: fixed;
	bottom: 50px;
	width: 100%;
	line-height: 50px;
	z-index: 100px;
	height: 45px;
}

/** 영상리스트의 내용물이 없을때 */
.no_value {
	height: 300px;
	text-align: center;
}

.no_value img {
	width: 100px;
	height: 100px;
	margin-top: 70px;
}

.no_value .text {
	font-weight: bold;
	padding-top: 10px;
	line-height: 25px;
	font-size: 16px;
}

.star {
	background: url(assets/img/star2.png) no-repeat;
	float: right;
	padding-right: 10px;
	position: relative;
	top: -85px;
	z-index: 10px;
}

.star img {
	width: 25px;
	height: 25px;
}

/** 스윗 얼럴 css */
#swal_pw {
	display: block;
	width: 100%;
	background-color: #FFFBFC;
	height: 40px;
	border: 2px solid black;
	line-height: 40px;
	margin-top: 110px;
	border-radius: 10px;
	text-align: center;
}

.container {
	padding:0px;
	margin-bottom:50px;
}
</style>
</head>

<body>
	<!--전체박스-->
	<div class="container">
		<%@ include file="assets/inc/id_box.jsp" %>
		
		<!--TOP BAR-->
		<%@ include file="assets/inc/my_top_bar.jsp" %>
		<!-- 드롭다운 옵션 -->
		<div class="content clearfix">
			<span class="delete_list"> <a class="toggleCheckbox_top hidden">전체선택</a>
				<a class="movie_delete hidden">삭제</a></span> <select
				class="form-control selcls" id="movie_select">
				<option>최신순</option>
				<option>개봉순</option>
				<option>평점순</option>
				<option>판매순</option>
				<option>낮은가격순</option>
			</select>
		</div>
		<!-- 영화목록에 담긴 상품이 아무것도 없을 떄 -->
		<div class="no_value hide">
			<img src="assets/img/wish_list_none.png" />
			<div class="text">
				관심영화 목록에 담겨진<br />상품이 없습니다.
			</div>
		</div>
	
		<ul class="movie">
			<li class="movie_list wish_content"><a
				href="Movie_information.jsp"> <img
					src="assets/img/sample7.jpg" alt="영화제목 썸네일">
					<span class="movie_title">머드라</span> <span class="age">전체 관람가<span>
							| 80분</span></span> <span class="act">머였지</span>
			</a> <!-- 편집 클릭시 체크박스 -->
				<div class="star">
					<img src="assets/img/star2.png"
						alt="interest_button">
				</div></li>
				
					<li class="movie_list wish_content"><a
				href="Movie_information.jsp"> <img
					src="assets/img/sample4.jpg" alt="영화제목 썸네일">
					<span class="movie_title">마녀</span> <span class="age">전체 관람가<span>
							| 80분</span></span> <span class="act">김다미</span>
			</a> <!-- 편집 클릭시 체크박스 -->
				<div class="star">
					<img src="assets/img/star2.png"
						alt="interest_button">
				</div></li>
				
				<li class="movie_list wish_content"><a
				href="Movie_information.jsp"> <img
					src="assets/img/sample1.jpg" alt="영화제목 썸네일">
					<span class="movie_title">백두산</span> <span class="age">19세 관람가<span>
							| 100분</span></span> <span class="act">수지</span>
			</a> <!-- 편집 클릭시 체크박스 -->
				<div class="star">
					<img src="assets/img/star2.png"
						alt="interest_button">
				</div></li>
				
				<li class="movie_list wish_content"><a
				href="Movie_information.jsp"> <img
					src="assets/img/sample12.jpg" alt="영화제목 썸네일">
					<span class="movie_title">하울의 움직이는 성</span> <span class="age">전체 관람가<span>
							| 120분</span></span> <span class="act">하울</span>
			</a> <!-- 편집 클릭시 체크박스 -->
				<div class="star">
					<img src="assets/img/star2.png"
						alt="interest_button">
				</div></li>
				
				<li class="movie_list wish_content"><a
				href="Movie_information.jsp"> <img
					src="assets/img/sample16.jpg" alt="영화제목 썸네일">
					<span class="movie_title">어벤져스 : 인피니티 워</span> <span class="age">15세 관람가<span>
							| 90분</span></span> <span class="act">토니 스타크</span>
			</a> <!-- 편집 클릭시 체크박스 -->
				<div class="star">
					<img src="assets/img/star2.png"
						alt="interest_button">
				</div></li>
				
				
		</ul>
	
		<!-- BOT BAR -->
		<%@ include file="assets/inc/bot_bar.jsp" %>
	
	</div>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
	$(".top_bar_list").eq(1).addClass("selected")
	$(".bot_bar_icon").eq(3).attr("src", "assets/img/my_page_icon_selected.png");
					
        // 체크 버튼 클릭시
        $(".star").click(function() {
            var movie_d = $(".star");
            var star = $(this)
            // 확인, 취소버튼에 따른 후속 처리 구현
            swal({
                html: "<b>선택하신 상품을 관심영화에서 삭제하시겠습니까?</b>", // 내용
                type: "question", // 종류
                showCancelButton: true, // 취소버튼 표시 여부
                cancelButtonText:"취소",
                confirmButtonText:"확인",
                confirmButtonColor:"#ff3253",
            }).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
                if (result.value) { // 확인 버튼이 눌러진 경우
                    console.log($(this))
                    $(star).parent().remove();
                    if (!$(".movie_list")[0]) {
                        // 지우고 난 후 빈화면
                        $(".no_value").removeClass("hide")
                        $(".delete_list").addClass("hide");
                    }
                }
            });
        }); // end $("input[name=movie_check]").click()

        /* 별모양 클릭시 삭제버튼 구현 */
        $(".star").click(function() {
            // 별모양의 부모를 지움
        }); // end $(".star").click()

         
	</script>
</body>

</html>