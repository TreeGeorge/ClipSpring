<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.top_info {
   	position: fixed;
    top: 0;
    width: 100%;
    height: 40px;
    border-bottom: 1px solid #b8b8b8;
    text-align: center;
    line-height: 40px;
    box-sizing: border-box;
    font-size: 18px;
    font-weight: bold;
    background-color: #fff;
    z-index: 100;
}

.top_info img {
    display: block;
    position: absolute;
    float: left;
    height: 26px;
    width: 26px;
    margin: 7px;
}

.container {
	padding:0px;
	margin-bottom: 50px;
	width:100%;
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

.movie_delete {
	position: absolute;
    color: #222;
    right: 110px;
    display: block;
    border: 1px solid #d5d5d5;
    width: 40px;
    height: 22px;
    bottom: 6px;
    text-align: center;
    line-height: 22px;
}

/* 드롭다운, n개작품 박스 */
.content {
	font-weight: bold;
	font-size: 12px;
	height: 35px;
	line-height: 35px;
	border-bottom: 1px solid #d5d5d5;
	padding: 0 10px 0 15px;
	margin-top: 40px;
	position: relative;
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
	position: relative;
}

.movie .movie_item {
	display: block;
	width: auto;
	padding: 10px;
	color: #222;
	text-decoration: none;
	position: relative;
	display: block;
	width: 85%;
}

.movie li .thumb {
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

.movie .movie_title {
	font-size: 16px;
	color: #222;
	font-weight: bold;
	width: 180px;
}

.movie .time {
	font-size: 14px;
	color: #aaa;
	margin-top: 2px;
}

.movie .period {
	margin-top: 30px;
	font-size: 12px;
	background-color: #fff;
	font-size: 12px;
	color: #ff3253;
}
.movie .type {
	margin-top: 3px;
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
	top: 67px;
	margin: 0;
}
/* 전체선택 체크박스 */
#check_box2 {
	position: absolute;
	top: 11px;
	left: 90px;
	margin: 0;
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
		<div class="top_info">
			<a href="MY_movie">
				<img src="assets/img/left.png" alt="뒤로">
			</a>
			<span id="top_info_value">휴지통</span>
		</div>
	
		<!-- 드롭다운 옵션 -->
		<div class="content clearfix">
			<span class="total">
				<span class="click_edit">편집</span>
			</span> 
			<span class="delete_list"> 
				<span class="toggleCheckbox_top hidden">전체선택
					<input id="check_box2" class="hidden" type="checkbox" name="check_all" />
				</span>
				<span class="movie_delete hidden">복원</span>
			</span>
			
			<select class="form-control selcls" id="movie_select" name="sort">
				<option value="new">구매순</option>
				<option value="name">가나다순</option>
				<option value="buy">구매상품</option>
				<option value="rent">대여상품</option>
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
		<c:forEach var="item" items="${newList}" varStatus="status">
				<c:choose>
					<c:when test="${item.type == '대여' and item.is_delete == 'Y'}">
						<li class="movie_list">
							<a href="Movie_information?movieNo=${item.movie_no}" class="movie_item">
								<span class="thumb">
									<img src="${item.thumbnail}" alt="${item.name} 포스터">
								</span>
								<span class="movie_text">
									<span class="movie_title">${item.name}</span>
									<span class="time">${item.runtime} | ${item.age}</span>
									<span class="type">${item.type}</span>
									<span class="period">${item.end_date} 까지</span>
								</span>
							</a>
							<input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" />
						</li>
					</c:when>
					<c:when test="${item.type == '구매' and item.is_delete == 'Y'}">
						<li class="movie_list">
							<a href="Movie_information?movieNo=${item.movie_no}" class="movie_item">
								<span class="thumb">
									<img src="${item.thumbnail}" alt="${item.name} 포스터">
								</span>
								<span class="movie_text">
									<span class="movie_title">${item.name}</span>
									<span class="time">${item.runtime} | ${item.age}</span>
									<span class="type">${item.type}</span>
								</span>
							</a>
							<input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" />
						</li>
					</c:when>
				</c:choose>
			</c:forEach>
		</ul>
		
		
	
		<!-- BOT BAR -->
		<%@ include file="assets/inc/bot_bar.jsp" %>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
	 	$(".bot_bar_icon").eq(3).attr("src","assets/img/my_page_icon_selected.png");
	 	if (!$(".movie_list")[0]) {
			// 영화리스트 빈 화면
			$(".no_value").removeClass("hide")
			$(".delete_list").addClass("hide");
			$(".movie_delete").addClass('hide');
			$(".click_edit").addClass('hide');
		}
		var isCheck = 2;
		// 편집 버튼의 클릭 처리 
		$(".click_edit").click(function(e) {

			// check 박스의 첫번째 인덱스의 classname이 hidden이면
			if ($("input[name=check_all]")[0].className == 'hidden') {
				// 편집 버튼 클릭시, hidden 해놨던 checkbox클래스를 remove
				$("input[name=movie_check]").removeClass('hidden');
				$("input[name=check_all]").removeClass('hidden');
				$(".movie_delete").removeClass('hidden');
				$(".toggleCheckbox_top").removeClass('hidden');
				return;
			}
			// check 박스에 hidden 클래스를 추가
			$("input[name=movie_check]").addClass('hidden');
			$("input[name=check_all]").addClass('hidden');
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
		
		// 정렬 기능
		$("select[name='sort']").change(function() {
			
	    	if( $(this).val() == "new" ){
	        	$(".movie_list").remove();	 
				$(".movie").append().html('<c:forEach var="item" items="${newList}" varStatus="status"><c:choose><c:when test="${item.type == \'대여\' and item.is_delete == \'Y\'}"><li class="movie_list"><div class="movie_item"><span class="thumb"><img src="${item.thumbnail}" alt="${item.name} 포스터"></span><span class="movie_text"><span class="movie_title">${item.name}</span><span class="time">${item.runtime} | ${item.age}</span><span class="type">${item.type}</span><span class="period">${item.end_date} 까지</span></span></div><input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" /></li></c:when><c:when test="${item.type == \'구매\' and item.is_delete == \'Y\'}"><li class="movie_list"><div class="movie_item"><span class="thumb"><img src="${item.thumbnail}" alt="${item.name} 포스터"></span><span class="movie_text"><span class="movie_title">${item.name}</span><span class="time">${item.runtime} | ${item.age}</span><span class="type">${item.type}</span></span></div><!-- 편집 클릭시 체크박스 --><input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" /></li></c:when></c:choose></c:forEach>')
	        } else if ( $(this).val() == "name" ) {
	        	$(".movie_list").remove();	 
	        	$(".movie").append().html('<c:forEach var="item" items="${nameList}" varStatus="status"><c:choose><c:when test="${item.type == \'대여\' and item.is_delete == \'Y\'}"><li class="movie_list"><div class="movie_item"><span class="thumb"><img src="${item.thumbnail}" alt="${item.name} 포스터"></span><span class="movie_text"><span class="movie_title">${item.name}</span><span class="time">${item.runtime} | ${item.age}</span><span class="type">${item.type}</span><span class="period">${item.end_date} 까지</span></span></div><input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" /></li></c:when><c:when test="${item.type == \'구매\' and item.is_delete == \'Y\'}"><li class="movie_list"><div class="movie_item"><span class="thumb"><img src="${item.thumbnail}" alt="${item.name} 포스터"></span><span class="movie_text"><span class="movie_title">${item.name}</span><span class="time">${item.runtime} | ${item.age}</span><span class="type">${item.type}</span></span></div><!-- 편집 클릭시 체크박스 --><input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" /></li></c:when></c:choose></c:forEach>')
		    } else if ( $(this).val() == "buy" ) {
	        	$(".movie_list").remove();	 
	        	$(".no_value").addClass("hide");
				$(".delete_list").removeClass("hide");
				$(".movie_delete").removeClass('hide');
				$(".click_edit").removeClass('hide');
				$(".movie").append().html('<c:forEach var="item" items="${newList}" varStatus="status"><c:if test="${item.type == \'구매\' and item.is_delete == \'Y\'}"><li class="movie_list"><div class="movie_item"><span class="thumb"><img src="${item.thumbnail}" alt="${item.name} 포스터"></span><span class="movie_text"><span class="movie_title">${item.name}</span><span class="time">${item.runtime} | ${item.age}</span><span class="type">${item.type}</span></span></div><!-- 편집 클릭시 체크박스 --><input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" /></li></c:if></c:forEach>');
				if (!$(".movie_list")[0]) {
					// 영화리스트 빈 화면
					$(".no_value").removeClass("hide")
					$(".delete_list").addClass("hide");
					$(".movie_delete").addClass('hide');
					$(".click_edit").addClass('hide');
				}
			} else if ($(this).val() == "rent" ) {
				$(".movie_list").remove();	 
				$(".no_value").addClass("hide");
				$(".delete_list").removeClass("hide");
				$(".movie_delete").removeClass('hide');
				$(".click_edit").removeClass('hide');
				$(".movie").append().html('<c:forEach var="item" items="${newList}" varStatus="status"><c:if test="${item.type == \'대여\' and item.is_delete == \'Y\'}"><li class="movie_list"><div class="movie_item"><span class="thumb"><img src="${item.thumbnail}" alt="${item.name} 포스터"></span><span class="movie_text"><span class="movie_title">${item.name}</span><span class="time">${item.runtime} | ${item.age}</span><span class="type">${item.type}</span><span class="period">${item.end_date} 까지</span></span></div><!-- 편집 클릭시 체크박스 --><input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" /></li></c:if></c:forEach>');
				if (!$(".movie_list")[0]) {
					// 영화리스트 빈 화면
					$(".no_value").removeClass("hide")
					$(".delete_list").addClass("hide");
					$(".movie_delete").addClass('hide');
					$(".click_edit").addClass('hide');
				}
			}
	    	
		});

		// 삭제 버튼 클릭시
		$(".movie_delete").click(function() {
			var movie_d = $("input[name=movie_check]:checked");
			
			// 삭제할 제품이 없으면
			if (movie_d.length == 0) {
				swal({
					html : "<b>복원할 상품이 없습니다.</b>", // 내용
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
					for ( var i = 0 ; i < $("input:checkbox[name=movie_check]").length ; i++ ) {
						if ($("input:checkbox[name=movie_check]").eq(i).is(":checked") == true) {
							var buy_movie_list_no = parseInt($("input:checkbox[name=movie_check]").eq(i).val());
							$.post('movie_status_change.do', {buy_movie_list_no: buy_movie_list_no},function(req){
								if (req == 1) {
									swal({
							            timer:1500,
							            html:"<div style='font-weight: bold; margin-bottom: 20px;'>개짓거리 하지 마십쇼 휴먼</div>",
							            type:"error",
							            allowOutsideClick: false,
							            showConfirmButton: false
							        }).then(function(){
							            location.reload();
							        });
								}
							});
						}
					}
					swal({
			            timer:1500,
			            html:"<div style='font-weight: bold; margin-bottom: 20px;'>복원 되었습니다.</div>",
			            type:"success",
			            allowOutsideClick: false,
			            showConfirmButton: false
			        }).then(function(){
			            location.reload();
			        });
				}
			});
		}); // end $(".movie_delete").click()
	</script>

</body>

</html>