<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
<script
	src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style>
.container {
	padding:0px;
	margin-bottom: 50px;
	width:100%:
}

#top_bar {
	position: static;
	font-size: 14px;
}

.id_box .pull_right {
	float: right;
}

/* a태그에 hover시 밑줄 제거 */
a:hover {
	text-decoration:none;
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

a.toggleCheckbox_top {
	color: black;
}

a.movie_delete {
	position:absolute;
	color:black;
	right: 100px;
}

/* 드롭다운, n개작품 박스 */
.content {
	margin: auto;
	font-weight: bold;
	font-size: 12px;
	height: 35px;
	line-height: 35px;
	border-bottom: 1px solid #d5d5d5;
	padding: 0 10px 0 15px;
	margin-top: 40px;
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
	position:relative;
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

.movie .movie_title {
	display: block;
	position: absolute;
	left: 125px;
	top: 20px;
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

.movie .jangre {
	display: block;
	position: absolute;
	left: 125px;
	top: 50px;
	font-size: 12px;
	line-height: 20px;
	height: 20px;
	color: #aaa;
}

.movie .period {
	display: block;
	position: absolute;
	left: 125px;
	top: 75px;
	font-size: 12px;
	line-height: 20px;
	height: 20px;
	color: #ff3253;
}

.movie_box .free_movie {
	position: relative;
	width: 100%;
	display: block;
	height: 150px;
	text-decoration: none;
	background-color: #fff;
	color: #222;
	box-sizing: border-box;
	border-bottom: 1px solid #eee;
}

.movie img {
	top: 5px;
	width: 100px;
	display: block;
	margin: 5px;
	height: 130px;
	background-color: #eee;
}

#check_box {
	position: absolute;
	right: 20px;
	top: 62.5px;
}

/* 전체선택 체크박스 */
#check_box2 {
	position: absolute;
	top:47px;
	left:90px;
	
}
/* hidden , hide */
.hidden {
	visibility: hidden;
}

.hide {
	display: none;
}
/** 휴지통의 내용물이 없을때 */

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

.wastebasket {
	text-align: center;
	position: fixed;
	bottom: 50px;
	width: 100%;
	line-height: 50px;
	z-index: 100px;
	height: 45px;
}
</style>
</head>

<body>
	<!-- 전체 박스 -->
	<div class="container">
	
		<!-- 카테고리 제목 -->
		<%@ include file="assets/inc/top_info.jsp" %>
	
		<!-- 드롭다운 옵션 -->
		<div class="content clearfix">
			<span class="total"> <span class="click_edit">편집</span>
			</span> 
			<span class="delete_list"> 
			<a class="toggleCheckbox_top hidden">전체선택
			<input id="check_box2" class="hidden" type="checkbox" name="movie_check" />
			</a></span>
			<a class="movie_delete hidden">복원</a>
				<select class="form-control selcls" id="movie_select">
				<option>최신순</option>
				<option>개봉순</option>
				<option>평점순</option>
				<option>판매순</option>
				<option>낮은가격순</option>
			</select>
		</div>
		<!-- 휴지통에 있는 상품이 없을 때 -->
		<div class="no_value hide">
			<img src="assets/img/wish_list_none.png" />
			<div class="text">
				휴지통에 담겨진<br />상품이 없습니다.
			</div>
		</div>
		
		<!-- 휴지통에 들어간 영화 리스트 -->
		<ul class="movie">
			<li class="movie_list wish_content">
			<a href="Movie_information.jsp"> 
			<img src="assets/img/sample7.jpg" alt="영화제목 썸네일">
					<span class="movie_title">머드라</span> 
					<span class="jangre">코믹 <span>| 뭐였지</span></span> 
					<span class="period">2020-09-25</span>
			</a>
			<!-- 편집 클릭시 체크박스 --> 
			<input id="check_box" class="hidden" type="checkbox" name="movie_check" />
			</li>
	
			<li class="movie_list wish_content"><a
				href="Movie_information.jsp"> <img
					src="assets/img/sample4.jpg" alt="영화제목 썸네일">
					<span class="movie_title">마녀</span> <span class="jangre">공포<span>
							| 김다미</span></span> <span class="period">2020-09-25</span>
			</a>
			<!-- 편집 클릭시 체크박스 --> 
			<input id="check_box" class="hidden" type="checkbox" name="movie_check" />
			</li>
			
			
		</ul>
		
		
	
		<!-- BOT BAR -->
		<%@ include file="assets/inc/bot_bar.jsp" %>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
		$("#top_info_value").html("휴지통");
		$(".login_status").eq(1).removeClass("hidden");
	 	$(".login_status").eq(0).addClass("hidden");
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
			
			// 삭제할 제품이 없으면
			if (movie_d.length == 0) {
				swal({
					html : "<b>삭제할 상품이 없습니다.</b>", // 내용
					type : "error", // 종류
					confirmButtonText : "확인", // 확인버튼 표시 문구
					confirmButtonColor : "#ff3253", // 확인버튼 색상
				});
				return false;
			}	
			
			// 확인, 취소버튼에 따른 후속 처리 구현
			swal({
				html : "<b>선택하신 상품을 휴지통에서 복원하시겠습니까?</b>", // 내용
				type : "question", // 종류
				showCancelButton : true, // 취소버튼 표시 여부
				cancelButtonText : "취소",
				confirmButtonText : "확인",
				confirmButtonColor : "#ff3253",
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