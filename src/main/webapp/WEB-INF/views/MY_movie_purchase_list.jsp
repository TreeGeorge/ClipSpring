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
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="assets/plugins/sweetalert/sweetalert2.min.css">
<style>
.clear {
	content: "";
	display: block;
	float: none;
	clear: both;
}
/* 드롭다운, n개작품 박스 */
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

.plist {
	border-bottom: 1px solid #d5d5d5;
	padding: 10px;
}

.movies .time {
	color: #E61A3F;
}

/* 영화 가격 옆 c 코인 이미지 */
.plist img {
	width: 14px;
	height: 14px;
	margin-top:-2px;
}

.movie_title {
	font-weight: bold;
 	line-height: 3px;
 	font-size:16px;
 	padding-top:20px;
}

.movies .price {
	font-size: 14px;
	padding-top:5px;
}


.movies .period {
	font-size:12px;
	color:#ff3253;
	padding-top:5px;
}

.total p {
	margin: 0;
}


.selcls {
	border: solid 1px #eee;
	background: none;
	border: none;
	width: 50px;
	height: 25px;
	float: right;
	font-size: 12px;
}

/* 담긴것이 아무것도 없을때 */

.no_movies {
	text-align: center;
}

.no_movies img {
	display: block;
	margin: auto;
	margin-top: 75px;
	width: 100px;
	height: 100px;
}

.no_movies p {
	font-weight: bold;
	padding-top: 10px;
	line-height: 25px;
	font-size: 16px;
}

button:focus {
	outline: 0;
}
/* 정렬기능에서 swal안의 radio박스*/

input[type='radio'] {
	-webkit-appearance: none;
	width: 14px;
	height: 14px;
	border: 1px solid #FF3253;
	border-radius: 50%;
	background: #fff;
}

input[type='radio']:checked {
	border: 5px solid #FF3253;
	outline: none;
}

.cancel {
	border: 2px solid #ff3253;
	background-color: #fff;
	color: #FF3253;
	font-size: 13px;
	font-weight: bold;
	border-radius: 20px;
	margin-top:8px;
}

.no_cancel {
	border: 2px solid #aaa;
	background-color: #fff;
	color: #aaa;
	font-size: 13px;
	font-weight: bold;
	border-radius: 20px;
	margin-top:8px;
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

</style>
</head>

<body>
	<!--전체박스-->
	<div>
	<%@ include file="assets/inc/id_box.jsp" %>
		
	<!--TOP BAR-->
	<%@ include file="assets/inc/my_top_bar.jsp" %>
	
	<!-- 드롭다운 옵션 -->

	<div class="content clearfix">
		<button style="padding: 0;" class="selcls" onclick="sort();">정렬 &#926;</button>
	</div>
	<!--// 드롭다운 끝 -->


	<div class="movies">
		<c:forEach var="item" items="${output}" varStatus="status">
			<div class="plist clear">
				<p class="movie_title">${item.name}</p>
				<button style="display: block;" class="cancel pull-right"
					onclick="return false;">구매취소</button>
				<p class="price">
					${item.price}<img src="assets/img/coin_icon.png">
				</p>
				<p class="period">${item.date}</p>
			</div>
		</c:forEach>
	</div>
	<div class="no_movies hide">
		<img src="assets/img/wish_list_none.png" />
		<p>구입내역이 없습니다.</p>
	</div>
	<div style="height: 50px; padding-bottom: 50px;"></div>


	<!-- BOT BAR -->
	<%@ include file="assets/inc/bot_bar.jsp" %>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script
		src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script>
	$(".top_bar_list").eq(3).addClass("selected")
    $(".bot_bar_icon").eq(3).attr("src", "assets/img/my_page_icon_selected.png");
   
   // 구입내역에 아무것도 없을때
   $(document).ready(function(){
	   if ($(".plist.clear").length==0) {
	      $(".no_movies").removeClass("hide");
	         }
	   })
   
      // 정렬 swal 창
        function sort(){
            swal({
                html:"<h6 style='font-weight:bold;'>상품별보기<h6>"+
                "<input type='radio' style='vertical-align: -3px; ' name='type1' value='' checked>&nbsp;전체</input>"+"&nbsp;&nbsp;&nbsp;"+
                "<input type='radio' style='vertical-align: -3px;' name='type1' value=''>&nbsp;구매</input>"+ "&nbsp;&nbsp;&nbsp;"+
                "<input type='radio' style='vertical-align: -3px;' name='type1' value=''>&nbsp;대여</input>"+"<br><hr>"+
                "<h6 style='font-weight:bold;'>정렬순서<h6>"+
                "<input type='radio' style='vertical-align: -3px;' name='type2' value='' checked>&nbsp;구매순</input>"+"&nbsp;&nbsp;&nbsp;"+
                "<input type='radio' style='vertical-align: -3px;' name='type2' value=''>&nbsp;제목순</input>",
                confirmButtonColor : "#FF3253"
            });   
        }
      

        // 구매취소 버튼 클릭시
        $(".cancel").click(function() {
            var c = $(".cancel pull-right");
            var cancel = $(this)
            // 확인, 취소버튼에 따른 후속 처리 구현
            swal({
                html: "<b>선택하신 상품을 구매 취소하시겠습니까?</b>", // 내용
                type: "question", // 종류
                showCancelButton: true, // 취소버튼 표시 여부
                cancelButtonText:"취소",
                confirmButtonText:"확인",
                confirmButtonColor:"#ff3253",
            }).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
                if (result.value) { // 확인 버튼이 눌러진 경우
                	swal({
                        timer:1500,
                        html:"<div style='font-weight: bold; margin-bottom: 20px;'>구매취소 되었습니다.</div>",
                        type:"success",
                        allowOutsideClick: false,
                        showConfirmButton: false
                    }).then(function(){
                    	$(cancel).parent().remove();
                        if ($(".plist.clear").length==0) {
                            $(".no_movies").removeClass("hide");
                            } else {
                                $(".no_movies").addClass("hide");
                        }
                    })
                }
            });
        }); // end of $(".cancel").click()
	</script>
</body>

</html>