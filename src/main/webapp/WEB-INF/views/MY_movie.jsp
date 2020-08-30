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
.container {
	padding:0px;
	margin-bottom:95px;
}

.clear {
	content: "";
	display: block;
	float: none;
	clear: both;
}

.content .delete_list {
	padding-left: 5px;
}

.content .movie_delete {
	position:absolute;
	color:black;
	right: 100px;
}

.content {
	font-weight: bold;
	font-size: 12px;
	height: 35px;
	line-height: 35px;
	border-bottom: 1px solid #d5d5d5;
	padding: 0 10px 0 15px;
	position:relative;
}

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
	position:relative;
}

.movie li a {
	display: block;
	width: auto;
	padding: 10px;
	color: #222;
	text-decoration: none;
	position: relative;
	display: block;
	width:85%;
}

.movie li a .thumb {
	width: 85px;
	height: 125px;
	display: block;
}

.movie img {
	width: 85px;
	height: 125px;
}

.movie .movie_text {
	display: block;
	width: auto;
	position: absolute;
	left: 105px;
	top: 15px;
	float: left;
}

.movie .movie_text span {
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

.movie .movie_text .desc {
	font-size: 0.8em;
	line-height: 150%;
}

.movie .movie_title {
	font-size: 16px;
	padding-top: 5px;
	padding-bottom: 10px;
	color: #222;
	font-weight: bold;
}

.movie .time {
	font-size: 12px;
	color: #aaa;
	margin-top:-5px;
}

.movie .period {
	padding-top: 10px;
	font-size: 12px;
	background-color: #fff;
	font-size: 12px;
	color: #ff3253;
	padding-left: 10px;
}
/* 영화 남은기간 아이콘 */
.movie .period img {
	width: 20px;
	height: 20px;
	margin-left: -10px;
	margin-top: -5px;
}
/* 체크박스 */
#check_box {
	position: absolute;
	right: 20px;
	top: 62.5px;

}
/* 전체선택 체크박스 */
#check_box2 {
	position: absolute;
	top:11px;
	left:90px;
	
}

/* a태그에 hover시 밑줄 제거 */
a:hover {
	text-decoration:none;
}


input[type=checkbox] {
	margin:auto;
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
	display: block;
	height: 45px;
	width: 100%;
	text-decoration: none;
	color: #fff;
	line-height: 45px;
	text-align: center;
	padding: 0;
	margin: auto;
	background-color: #E61A3F;
	font-weight: bold;
	position: fixed;
	bottom: 50px;
	z-index: 100px;
	line-height: 45px;
}

.delete_list a {
	color: black;
}
/** 영상리스트의 내용물이 없을때 */
.no_value {
	height: 300px;
	text-align: center;
}

.no_value img {
	display: block;
	margin: auto;
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

#bot_bar {
	padding-bottom:50px;
}

</style>
</head>

<body>
	<!-- 전체 컨테이너박스 -->
	<div class="container">
		<%@ include file="assets/inc/id_box.jsp" %>
		
		<!--TOP BAR-->
		<%@ include file="assets/inc/my_top_bar.jsp" %>
	
		<!-- 편집 , 전체선택 -->
		<div class="content clearfix">
			<span class="total"> 
			<span class="click_edit">편집</span>
			</span> 
			<span class="delete_list"> 
			<a class="toggleCheckbox_top hidden">전체선택
			<input id="check_box2" class="hidden" type="checkbox" name="movie_check" />
			</a>
			<a class="movie_delete hidden">삭제</a>
			</span> 
			
			
		<!-- 드롭다운 옵션 -->
			<select class="form-control selcls" id="movie_select">
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
				영화목록에 담겨진<br />상품이 없습니다.
			</div>
		</div>
	
		<!-- 내영상 목록에 담긴 영화 -->
			<ul class="movie">
			
				<li class="movie_list wish_content">
				<a href="Movie_information.jsp"> <span class="thumb">
				<img src="assets/img/sample6.jpg" alt="영화포스터"></span>
						<span class="movie_text"> 
						<span class="movie_title">플로리다 프로젝트</span> 
						<span class="time">120분</span> <span class="period">
						<img src="assets/img/freecalendal.png"> 2020-09-25</span>
					</span>
				</a>
					<!-- 편집 클릭시 체크박스 --> 
					<input id="check_box" class="hidden"type="checkbox" name="movie_check" />
				</li>
		
				<li class="movie_list wish_content"><a
					href="Movie_information.jsp"> <span class="thumb"><img
							src="assets/img/sample9.jpg" alt="영화포스터"></span>
						<span class="movie_text"> <span class="movie_title">Baby
								Driver</span> <span class="time">110분</span> <span class="period"><img
								src="assets/img/freecalendal.png"> 2020-09-24</span>
					</span>
				</a>
				<!-- 편집 클릭시 체크박스 --> 
				<input id="check_box" class="hidden"
						type="checkbox" name="movie_check" />
				</li>
				
				<li class="movie_list wish_content"><a
					href="Movie_information.jsp"> <span class="thumb"><img
							src="assets/img/sample12.jpg" alt="영화포스터"></span>
						<span class="movie_text"> <span class="movie_title">하울의 움직이는 성</span> <span class="time">130분</span> <span class="period"><img
								src="assets/img/freecalendal.png"> 2020-09-23</span>
					</span>
				</a>
				<!-- 편집 클릭시 체크박스 --> 
				<input id="check_box" class="hidden"
						type="checkbox" name="movie_check" />
				</li>
				
				<li class="movie_list wish_content"><a
					href="Movie_information.jsp"> <span class="thumb"><img
							src="assets/img/sample15.jpg" alt="영화포스터"></span>
						<span class="movie_text"> <span class="movie_title">아바타</span> <span class="time">150분</span> <span class="period"><img
								src="assets/img/freecalendal.png"> 2020-09-20</span>
					</span>
				</a>
				<!-- 편집 클릭시 체크박스 --> 
				<input id="check_box" class="hidden"
						type="checkbox" name="movie_check" />
				</li>
				
				<li class="movie_list wish_content"><a
					href="Movie_information.jsp"> <span class="thumb"><img
							src="assets/img/sample16.jpg" alt="영화포스터"></span>
						<span class="movie_text"> <span class="movie_title">어벤져스 : 인피니티 워</span> <span class="time">190분</span> <span class="period"><img
								src="assets/img/freecalendal.png"> 2020-09-12</span>
					</span>
				</a>
				<!-- 편집 클릭시 체크박스 --> 
				<input id="check_box" class="hidden"
						type="checkbox" name="movie_check" />
				</li>
				
			</ul>
			<!--  영화 목록 끝 -->
		
		<!-- 휴지통 버튼 -->
		<div class="wastebasket">
			<a href="MY_movie_remove.jsp">휴지통으로 바로가기</a>
		</div>
	
		<!-- BOT BAR -->
		<%@ include file="assets/inc/bot_bar.jsp" %>
	
	</div>


	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
	$(".top_bar_list").eq(0).addClass("selected")
	$(".bot_bar_icon").eq(3).attr("src", "assets/img/my_page_icon_selected.png");
	    var isCheck = 2;
        // 편집 버튼의 클릭 처리 
        $(".click_edit").click(function(e) {

            // check 박스의 첫번째 인덱스의 classname이 hidden이면
            if ($("input[name=movie_check]")[0].className == 'hidden') {
                // 편집 버튼 클릭시, hidden 해놨던 checkbox클래스를 remove
                $("input[name=movie_check]").removeClass('hidden');
                $(".movie_delete").removeClass('hidden');
                $(".toggleCheckbox_top").removeClass('hidden');
                return;
            }
            // check 박스에 hidden 클래스를 추가
            $("input[name=movie_check]").addClass('hidden');
            $(".movie_delete").addClass('hidden');
            $(".toggleCheckbox_top").addClass('hidden');
        });

        // 전체선택 클릭 이벤트
        $("#check_box2").click(function() {
            // 전체선택 클릭시 모든 체크 박스 체크
            if (isCheck % 2 == 0) {
                $("input[name=movie_check]").prop("checked", true);
            } else {
                $("input[name=movie_check]").prop("checked", false);
            }
            isCheck++;
        }); // end $("#check_box2").click();

        // 삭제 버튼 클릭시
        $(".movie_delete").click(function() {
            var movie_d = $("input[name=movie_check]:checked");
            // 확인, 취소버튼에 따른 후속 처리 구현
            swal({
                   html: "<b>선택하신 상품을 내영상에서 삭제하시겠습니까?</b>", // 내용
                   type: "question", // 종류
                   showCancelButton: true, // 취소버튼 표시 여부
                   cancelButtonText:"취소",
                   confirmButtonText:"확인",
                   confirmButtonColor:"#ff3253",
            }).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
                if (result.value) { // 확인 버튼이 눌러진 경우
                    // 선택된 상품 삭제
                    movie_d.parent().remove();
                    // 영화리스트가 비었다면
                    if (!$(".movie_list")[0]) {
                        // 영화리스트 빈 화면
                        $(".no_value").removeClass("hide")
                        $(".delete_list").addClass("hide");
                        $(".movie_delete").addClass('hide');
                        $(".click_edit").addClass('hide');
                    }
                }
            });
        }); // end $(".movie_delete").click()
	</script>
</body>

</html>