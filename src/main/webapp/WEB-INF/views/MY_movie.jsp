<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp"%>
<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<style>
.container {
	padding: 0px;
	width: 100%;
	margin-bottom: 95px;
}

.clear {
	content: "";
	display: block;
	float: none;
	clear: both;
}

.content .delete_list {
	display: block;
    width: 50px;
    float: left;
}

.content .movie_delete {
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

.content {
	font-weight: bold;
	font-size: 12px;
	height: 35px;
	line-height: 35px;
	border-bottom: 1px solid #d5d5d5;
	padding: 0 10px 0 15px;
	position: relative;
}

.total {
	float: left;
	display: block;
	width: 30px;
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
	height: 27px;
	float: right;
	margin-top: 4px;
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
	text-overflow: ellipsis;
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
}
/* 전체선택 체크박스 */
#check_box2 {
	position: absolute;
    top: 11.5px;
    left: 95px;
}

/* a태그에 hover시 밑줄 제거 */
a:hover {
	text-decoration: none;
}

input[type=checkbox] {
	margin: auto;
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
	padding-bottom: 50px;
}
</style>
</head>

<body>
	<!-- 전체 컨테이너박스 -->
	<div class="container">
		<%@ include file="assets/inc/id_box.jsp"%>

		<!--TOP BAR-->
		<%@ include file="assets/inc/my_top_bar.jsp"%>

		<!-- 편집 , 전체선택 -->
		<div class="content clearfix">
			<span class="total">
				<span class="click_edit">편집</span>
			</span> 
			<span class="delete_list">
				<span class="toggleCheckbox_top hidden">전체선택
					<input id="check_box2" class="hidden" type="checkbox" name="check_all" />
				</span>
				<span class="movie_delete hidden">삭제</span>
			</span>

			<!-- 드롭다운 옵션 -->
			<select class="form-control selcls" id="movie_select" name="sort">
				<option value="new">구매순</option>
				<option value="name">가나다순</option>
				<option value="buy">구매상품</option>
				<option value="rent">대여상품</option>
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
			<c:forEach var="item" items="${newList}" varStatus="status">
				<c:choose>
					<c:when test="${item.type == '대여' and item.is_delete == 'N'}">
						<li class="movie_list">
							<div class="movie_item">
								<span class="thumb">
									<img src="${item.thumbnail}" alt="${item.name} 포스터">
								</span>
								<span class="movie_text">
									<span class="movie_title">${item.name}</span>
									<span class="time">${item.runtime} | ${item.age}</span>
									<span class="type">${item.type}</span>
									<span class="period">${item.end_date} 까지</span>
								</span>
							</div>
							<input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" />
						</li>
					</c:when>
					<c:when test="${item.type == '구매' and item.is_delete == 'N'}">
						<li class="movie_list">
							<div class="movie_item">
								<span class="thumb">
									<img src="${item.thumbnail}" alt="${item.name} 포스터">
								</span>
								<span class="movie_text">
									<span class="movie_title">${item.name}</span>
									<span class="time">${item.runtime} | ${item.age}</span>
									<span class="type">${item.type}</span>
								</span>
							</div>
							<!-- 편집 클릭시 체크박스 -->
							<input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" />
						</li>
					</c:when>
				</c:choose>
			</c:forEach>
		</ul>
		<!--  영화 목록 끝 -->

		<!-- 휴지통 버튼 -->
		<div class="wastebasket">
			<a href="MY_movie_remove">휴지통으로 바로가기</a>
		</div>

		<!-- BOT BAR -->
		<%@ include file="assets/inc/bot_bar.jsp"%>

	</div>


	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
		$(".top_bar_list").eq(0).addClass("selected");
		$(".bot_bar_icon").eq(3).attr("src",
				"assets/img/my_page_icon_selected.png");
		view()
		function view(){
			// 시청할지, 시청했으면 이어보기
			$(".movie_item").click(function() {
				var buy_movie_list_no = parseInt($(this).next().val());
				$.post('movie_watch_check.do', {buy_movie_list_no: buy_movie_list_no}, function(req) {
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
					} else if (req == 2) {
						swal({
							html : "<b>이미 시청하신 상품입니다.<br>이어서 시청하시겠습니까?</b>", // 내용
							type : "question", // 종류
							showCancelButton : true, // 취소버튼 표시 여부
							cancelButtonText : "취소",
							confirmButtonText : "확인",
							confirmButtonColor : "#ff3253",
						}).then(function(result) {
							if (result.value) {
								swal({
									html : "<b>영상 재생중....(영상 미구현)</b>", // 내용
									type : "success", // 종류
									confirmButtonText : "확인",
									confirmButtonColor : "#ff3253"
								});
							}
						});
					} else if (req == 3) {
						swal({
				            timer:1500,
				            html:"<div style='font-weight: bold; margin-bottom: 20px;'>대여 기간이 지난 상품입니다.</div>",
				            type:"error",
				            allowOutsideClick: false,
				            showConfirmButton: false
				        }).then(function(){
				            location.reload();
				        });
					} else if (req == 0) {
						swal({
							html : "<b>영상을 시청하시겠습니까?<br>주의! 시청시 환불이 불가능합니다.</b>", // 내용
							type : "question", // 종류
							showCancelButton : true, // 취소버튼 표시 여부
							cancelButtonText : "취소",
							confirmButtonText : "확인",
							confirmButtonColor : "#ff3253",
						}).then(function(result) {
							if (result.value) {
								$.post('movie_watch.do', {buy_movie_list_no: buy_movie_list_no}, function() {
									swal({
										html : "<b>영상 재생중....(영상 미구현)</b>", // 내용
										type : "success", // 종류
										confirmButtonText : "확인",
										confirmButtonColor : "#ff3253"
									});
								});
							}
						});
					}
				});
			});
		}
		function exist_movie() {
			$(".movie_list").remove();	 
			$(".no_value").addClass("hide");
			$(".delete_list").removeClass("hide");
			$(".movie_delete").removeClass('hide');
			$(".click_edit").removeClass('hide');
		}
		
		function no_movie() {
			if (!$(".movie_list")[0]) {
				// 영화리스트 빈 화면
				$(".no_value").removeClass("hide")
				$(".delete_list").addClass("hide");
				$(".movie_delete").addClass('hide');
				$(".click_edit").addClass('hide');
			}
		}
		
		no_movie();
		
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
	    		exist_movie()	 
				$(".movie").append().html('<c:forEach var="item" items="${newList}" varStatus="status"><c:choose><c:when test="${item.type == \'대여\' and item.is_delete == \'N\'}"><li class="movie_list"><div class="movie_item"><span class="thumb"><img src="${item.thumbnail}" alt="${item.name} 포스터"></span><span class="movie_text"><span class="movie_title">${item.name}</span><span class="time">${item.runtime} | ${item.age}</span><span class="type">${item.type}</span><span class="period">${item.end_date} 까지</span></span></div><input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" /></li></c:when><c:when test="${item.type == \'구매\' and item.is_delete == \'N\'}"><li class="movie_list"><div class="movie_item"><span class="thumb"><img src="${item.thumbnail}" alt="${item.name} 포스터"></span><span class="movie_text"><span class="movie_title">${item.name}</span><span class="time">${item.runtime} | ${item.age}</span><span class="type">${item.type}</span></span></div><!-- 편집 클릭시 체크박스 --><input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" /></li></c:when></c:choose></c:forEach>');
				no_movie();
	        } else if ( $(this).val() == "name" ) {
	        	exist_movie()
	        	$(".movie").append().html('<c:forEach var="item" items="${nameList}" varStatus="status"><c:choose><c:when test="${item.type == \'대여\' and item.is_delete == \'N\'}"><li class="movie_list"><div class="movie_item"><span class="thumb"><img src="${item.thumbnail}" alt="${item.name} 포스터"></span><span class="movie_text"><span class="movie_title">${item.name}</span><span class="time">${item.runtime} | ${item.age}</span><span class="type">${item.type}</span><span class="period">${item.end_date} 까지</span></span></div><input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" /></li></c:when><c:when test="${item.type == \'구매\' and item.is_delete == \'N\'}"><li class="movie_list"><div class="movie_item"><span class="thumb"><img src="${item.thumbnail}" alt="${item.name} 포스터"></span><span class="movie_text"><span class="movie_title">${item.name}</span><span class="time">${item.runtime} | ${item.age}</span><span class="type">${item.type}</span></span></div><!-- 편집 클릭시 체크박스 --><input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" /></li></c:when></c:choose></c:forEach>')
	        	no_movie();
		    } else if ( $(this).val() == "buy" ) {
		    	exist_movie()
				$(".movie").append().html('<c:forEach var="item" items="${newList}" varStatus="status"><c:if test="${item.type == \'구매\' and item.is_delete == \'N\'}"><li class="movie_list"><div class="movie_item"><span class="thumb"><img src="${item.thumbnail}" alt="${item.name} 포스터"></span><span class="movie_text"><span class="movie_title">${item.name}</span><span class="time">${item.runtime} | ${item.age}</span><span class="type">${item.type}</span></span></div><!-- 편집 클릭시 체크박스 --><input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" /></li></c:if></c:forEach>');
				no_movie();
			} else if ($(this).val() == "rent" ) {
				exist_movie()
				$(".movie").append().html('<c:forEach var="item" items="${newList}" varStatus="status"><c:if test="${item.type == \'대여\' and item.is_delete == \'N\'}"><li class="movie_list"><div class="movie_item"><span class="thumb"><img src="${item.thumbnail}" alt="${item.name} 포스터"></span><span class="movie_text"><span class="movie_title">${item.name}</span><span class="time">${item.runtime} | ${item.age}</span><span class="type">${item.type}</span><span class="period">${item.end_date} 까지</span></span></div><!-- 편집 클릭시 체크박스 --><input id="check_box" class="hidden" type="checkbox" name="movie_check" value="${item.buy_movie_list_no}" /></li></c:if></c:forEach>');
				no_movie();
			}
	    	view()
		});
		
		// 삭제 버튼 클릭시
		$(".movie_delete").click(function() {
				// 삭제할 제품이 없으면
				if (!$("input[name=movie_check]:checked").length) {
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
				html : "<b>선택하신 상품을 휴지통으로 보내시겠습니까?</b>", // 내용
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
			            html:"<div style='font-weight: bold; margin-bottom: 20px;'>삭제 되었습니다.</div>",
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