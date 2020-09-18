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

p {
 margin: 0;
}
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
	height: 120px;
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
 	line-height: 40px;
 	font-size:16px;
 	height: 30px;
 	width: 80%;
 	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.movies .price {
	font-size: 14px;
	height: 40px;
	line-height: 25px;
}

.movies .period {
	font-size:12px;
	color:#ff3253;
	height: 30px;
	line-height: 20px;
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
	margin-top: 5px;
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
		<!-- 드롭다운 옵션 -->
		<select class="form-control selcls" id="movie_select" name="sort">
			<option value="new">구매순</option>
			<option value="name">가나다순</option>
			<option value="buy">구매상품</option>
			<option value="rent">대여상품</option>
		</select>
	</div>
	<!--// 드롭다운 끝 -->


	<div class="movies">
		<c:forEach var="item" items="${newList}" varStatus="status">
			<c:choose>
				<c:when test="${item.price != 0}">
					<div class="plist clear">
						<p class="movie_title">${item.name}</p>
						<button style="display: block;" class="cancel pull-right"
							onclick="return false;">구매취소</button>
							<input id="buy_movie_list_no" type="hidden" value="${item.buy_movie_list_no}"/>
						<p class="price">
							<fmt:formatNumber value="${item.price}" pattern="#,###" /><img src="assets/img/coin_icon.png">
						</p>
						<p class="period">${item.date}&nbsp;&nbsp;${item.type}</p>
					</div>
				</c:when>
				<c:otherwise>
				<div class="plist clear">
						<p class="movie_title">${item.name}</p>
						<button style="display: block;" class="cancel pull-right"
							onclick="return false;">구매취소</button>
							<input id="buy_movie_list_no" type="hidden" value="${item.buy_movie_list_no}"/>
						<p class="price">
							무료
						</p>
						<p class="period">${item.date}&nbsp;&nbsp;${item.type}</p>
					</div>
				</c:otherwise>
			</c:choose>
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
	<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script>
   $(function(){
	   $(".top_bar_list").eq(3).addClass("selected")
	   $(".bot_bar_icon").eq(3).attr("src", "assets/img/my_page_icon_selected.png");
	   if (!$(".plist.clear")[0]) {
	      $(".no_movies").removeClass("hide");
	   }
   })
   
   // 정렬 기능
		$("select[name='sort']").change(function() {
			
	    	if( $(this).val() == "new" ){
	        	$(".plist").remove();	 
				$(".movies").append().html('<c:forEach var="item" items="${newList}" varStatus="status"><c:choose><c:when test="${item.price != 0}"><div class="plist clear"><p class="movie_title">${item.name}</p><button style="display: block;" class="cancel pull-right" onclick="return false;">구매취소</button><input id="buy_movie_list_no" type="hidden" value="${item.buy_movie_list_no}"/><p class="price"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img src="assets/img/coin_icon.png"></p><p class="period">${item.date}&nbsp;&nbsp;${item.type}</p></div></c:when><c:otherwise><div class="plist clear"><p class="movie_title">${item.name}</p><button style="display: block;" class="cancel pull-right" onclick="return false;">구매취소</button><input id="buy_movie_list_no" type="hidden" value="${item.buy_movie_list_no}"/><p class="price">무료</p><p class="period">${item.date}&nbsp;&nbsp;${item.type}</p></div></c:otherwise></c:choose></c:forEach>');
	        } else if ( $(this).val() == "name" ) {
	        	$(".plist").remove();	 
	        	$(".movies").append().html('<c:forEach var="item" items="${nameList}" varStatus="status"><c:choose><c:when test="${item.price != 0}"><div class="plist clear"><p class="movie_title">${item.name}</p><button style="display: block;" class="cancel pull-right" onclick="return false;">구매취소</button><input id="buy_movie_list_no" type="hidden" value="${item.buy_movie_list_no}"/><p class="price"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img src="assets/img/coin_icon.png"></p><p class="period">${item.date}&nbsp;&nbsp;${item.type}</p></div></c:when><c:otherwise><div class="plist clear"><p class="movie_title">${item.name}</p><button style="display: block;" class="cancel pull-right" onclick="return false;">구매취소</button><input id="buy_movie_list_no" type="hidden" value="${item.buy_movie_list_no}"/><p class="price">무료</p><p class="period">${item.date}&nbsp;&nbsp;${item.type}</p></div></c:otherwise></c:choose></c:forEach>');
		    } else if ( $(this).val() == "buy" ) {
	        	$(".plist").remove();	 
	        	$(".no_movies").addClass("hide");
	        	$(".movies").append().html('<c:forEach var="item" items="${newList}" varStatus="status"><c:choose><c:when test="${item.price != 0 and item.type == \'구매\'}"><div class="plist clear"><p class="movie_title">${item.name}</p><button style="display: block;" class="cancel pull-right" onclick="return false;">구매취소</button><input id="buy_movie_list_no" type="hidden" value="${item.buy_movie_list_no}"/><p class="price"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img src="assets/img/coin_icon.png"></p><p class="period">${item.date}&nbsp;&nbsp;${item.type}</p></div></c:when><c:when test="${item.price == 0 and item.type == \'구매\'}"><div class="plist clear"><p class="movie_title">${item.name}</p><button style="display: block;" class="cancel pull-right" onclick="return false;">구매취소</button><input id="buy_movie_list_no" type="hidden" value="${item.buy_movie_list_no}"/><p class="price">무료</p><p class="period">${item.date}&nbsp;&nbsp;${item.type}</p></div></c:when></c:choose></c:forEach>');
			    if (!$(".plist")[0]) {
					// 영화리스트 빈 화면
					$(".no_movies").removeClass("hide");
				}
			} else if ($(this).val() == "rent" ) {
				$(".plist").remove();	 
				$(".no_movies").addClass("hide");
				$(".movies").append().html('<c:forEach var="item" items="${newList}" varStatus="status"><c:choose><c:when test="${item.price != 0 and item.type == \'대여\'}"><div class="plist clear"><p class="movie_title">${item.name}</p><button style="display: block;" class="cancel pull-right" onclick="return false;">구매취소</button><input id="buy_movie_list_no" type="hidden" value="${item.buy_movie_list_no}"/><p class="price"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img src="assets/img/coin_icon.png"></p><p class="period">${item.date}&nbsp;&nbsp;${item.type}</p></div></c:when><c:when test="${item.price == 0 and item.type == \'대여\'}"><div class="plist clear"><p class="movie_title">${item.name}</p><button style="display: block;" class="cancel pull-right" onclick="return false;">구매취소</button><input id="buy_movie_list_no" type="hidden" value="${item.buy_movie_list_no}"/><p class="price">무료</p><p class="period">${item.date}&nbsp;&nbsp;${item.type}</p></div></c:when></c:choose></c:forEach>');
			    if (!$(".plist")[0]) {
					// 영화리스트 빈 화면
					$(".no_movies").removeClass("hide")
				}
			}
	    	
		});
   
      

        // 구매취소 버튼 클릭시
        $(".cancel").click(function() {
        	var buy_movie_list_no = $(this).next().val();
            // 확인, 취소버튼에 따른 후속 처리 구현
            swal({
                html: "<b>선택하신 상품을 구매 취소하시겠습니까?</b>", // 내용
                type: "question", // 종류
                showCancelButton: true, // 취소버튼 표시 여부
                cancelButtonText:"취소",
                confirmButtonText:"확인",
                confirmButtonColor:"#ff3253",
            }).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
            	if (result.value) {     // 확인 버튼이 눌러진 경우
            		$.post('movie_delete_ok.do',{buy_movie_list_no: buy_movie_list_no},function(req){
			            if (req == 0) {
			            	swal({
					            timer:1500,
					            html:"<div style='font-weight: bold; margin-bottom: 20px;'>구매취소 되었습니다.</div>",
					            type:"success",
					            allowOutsideClick: false,
					            showConfirmButton: false
					        }).then(function(){
					            location.reload();
					        });
			            } else if (req == 1) {
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
				                timer:1500,
				                html:"<div style='font-weight: bold; margin-bottom: 20px;'>이미 시청하신 상품은<br>구매 취소가 불가능합니다.</div>",
				                type:"error",
				                allowOutsideClick: false,
				                showConfirmButton: false
				            }).then(function(){
				            	return false;
				            })
			            } else if (req == 3 ) {
			            	swal({
				                timer:1500,
				                html:"<div style='font-weight: bold; margin-bottom: 20px;'>구매한지 일주일이 지난 상품은<br>구매 취소가 불가능합니다.</div>",
				                type:"error",
				                allowOutsideClick: false,
				                showConfirmButton: false
				            }).then(function(){
				            	return false;
				            });
			            } else if (req == 4) {
			            	swal({
				                timer:1500,
				                html:"<div style='font-weight: bold; margin-bottom: 20px;'>쿠폰을 이용해 구매한 상품은<br>구매 취소가 불가능합니다.</div>",
				                type:"error",
				                allowOutsideClick: false,
				                showConfirmButton: false
				            }).then(function(){
				            	return false;
				            });
			            }
		        	});
				}
            });
        }); // end of $(".cancel").click()
	</script>
</body>

</html>