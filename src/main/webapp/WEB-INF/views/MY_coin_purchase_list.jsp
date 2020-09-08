<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<style type="text/css">
* {
    font-family: 'Nanum Gothic', sans-serif;
}
/*a 밑줄 제거*/
a{
	text-decoration: none;
}

body {
	height: 0;
}

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
/*탭영역 넓이 및 마진오토값*/
#top_bar ul {
	width: 74%;
	margin: auto;
}
/*서브바 이미지 크기설정*/
#top img {
	width: 30px;
	height: 25px;
	margin-top: 10px;
}
/*탭 영역*/
#top_bar .pull_left {
	float: left;
	width: 50%;
	text-align: center;
	height: 39px;
}
/*충전설명 텍스트 색상및 마진값 설정*/
.text {
	margin-top: 9px;
	color: #b8b8b8;
}
.pull_center .cash{
	margin-left: 0;

}
/*폰트 굵기설정*/
#buy_coin_list .pull_center p{
	font-weight: 50px;
	text-align: left;
}

#buy_coin_list {
	min-height:240px;
	margin-top:80px;
	margin-bottom:20px;
}

/*날짜시간 폰트설정*/
#buy_coin_list .pull_center .cash{
	font-size: 20px;
	font-weight: bold;
}
/*폰트값 크기 설정*/
#buy_coin_list .pull_center p{
	font-size: 20px;
    color: #b8b8b8;
}

/*탑바캐쉬리스트 클리어*/
#buy_coin_list_list .clear {
	content: '';
	display: block;
	float: none;
	clear: both;
}
/*코인잔여 글씨 위치설정*/
#buy_coin_list .aharge{
	text-align: left;
	font-weight:10px;
}

#buy_coin_list .pull_center{
	vertical-align:middle;
	display:inline-block;
	width: 100%;
    height: 100px;
    background-color: #ccc;
    margin-top: 10px;
}

#buy_coin_list .font{
	font-size: 10px;
	color: #888888;
}
#buy_coin_list .day{
	font-size: 10px;
	color: #888888;
}
.cash_left{
	margin-left: auto;
}
.clearfix:after {
    clear: both;
    content: "";
    float: none;
    display: block;
}
/*숫자 중간지정*/
.aharge .cash_left{
vertical-align:middle;
line-height: 18px;
}
.buy{
	letter-spacing: -0.5px;
}

.clear {
	content: '';
	display: block;
	float: none;
	clear: both;
}
#buy_coin_list .area_list{
	position: relative;
	width: 100%;
	border-bottom: 1px solid #e5e5e5;
	-webkit-box-sizing: border-box;
	padding: 15px 105px 15px 16px;
}

.str span{
	font-size:20px;
	font-weight: bold;
}
.tab{
	padding: 5px;
	color: #888888;
	font-size: 12px;
	line-height: 15px;
}
#buy_bottom{
	font-weight: 1px;
}
#top_bar .selected {
    display: inline-block;
    color: #E61A3F;
    font-weight: bold;
    border-bottom: 2px solid #E61A3F;
    font-size: 1.1em;
	height: 35px;
}
#top_bar a {
    font-size: 0.9em;
    line-height: 30px;
    color: #b8b8b8;
    font-weight: bold;
    text-decoration: none;
}
#top_bar {
    background-color: #fff;
    width: 100%;
    height: 39px;
    top: 40px;
    border-bottom: 1px solid #b8b8b8;
	position: fixed;
	z-index: 100;
}
.no_list {
	display: block;
	width: auto;
	position: absolute;
	left: 100px;
	top: 27px;
	float: left;
	margin: -18px 0px -10px 5px;
}
.text span {
    display: block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis
}

.text .title {
    font-weight: bold
}

.text .desc {
    font-size: 0.8em;
    line-height: 150%;
}

.text span:first-child {
	font-size: 16px;
	padding-top: -5px;
	padding-bottom: 10px;
	color: #222;
    font-weight: bold;
}

.text span:nth-child(2) {
	font-size: 14px;
	font-weight: bold;
	color: #ccc;
	padding-top: 10px;
}

.text span:last-child {
    padding-top: 40px;
    font-size: 12px;
    background-color: #fff;
    font-size: 12px;
    color: #ccc;
}
.hide 
{
    display: none;
}
.hidden {
    visibility: hidden;
}
  /** 영상리스트의 내용물이 없을때 */
.no_value {
	margin:80px 0 50px 0;
    text-align: center;

}
/* hidden , hide */
.hidden {
    visibility: hidden;
}
button{
	cursor:pointer;
}
.pull_left span{
	margin-top: 4px;
	display: inline-block;
}
.text1{
	margin:10px 25px 10px 25px;
	font-weight:bold;
}
.no_value img {
    width: 100px;
    height: 100px;
    margin-top: 70px;
}
/*코인 크기및색갈 설정*/
.this_number {
    position: absolute;
    top: 0;
    right: 0;
    width: 70px;
    height: 35px;
    margin: 20px 13px 12px 0;
    border: 1px solid #E61A3F;
    border-radius: 3px;
    background-color: #E61A3F;
    font-size: 12px;
    color: #fff;
    letter-spacing: 0px;
    text-align: center;
    letter-spacing: -0.5px;
    font-weight: bold;
}
.no_value .text {
	font-weight: bold;
	padding-top: 10px;
	line-height: 25px;
	font-size: 16px;
}
</style>
</head>

<body>
	<!--전체 박스-->
<div id="container">
		<!--탑 바-->
      <div class="top_info">
         <a href="MY_movie"> <img
            src="assets/img/left.png" alt="뒤로">
         </a><span id="top_info_value">내 코인</span>
      </div>
			<!-- 탭영역 -->
	<div id="top_bar">
		<ul class="clearfix">
			<li class="pull_left"><a href="MY_coin_charge"><span>코인충전</span></a></li>
			<li class="pull_left"><a href="MY_coin_purchase_list"><span class="selected">충전내역</span></a></li>
		</ul>
	</div>
			

		<!-- 캐시충전했을때 추가 되야함 밑으로 -->
		<div class="no_value hide">
			<img src="assets/img/wish_list_none.png" />
			<div class="text1">구매 내역이 없습니다.</div>
		</div>
		
		
	<div id="buy_coin_list" class="clear">
		<ul class="movie">
			<c:forEach var="item" items="${output}" varStatus="status">
				<li class="area_list">
					<span class="this_text">코인 충전<br>
					<!-- 충전한 날짜 시간 -->
					<span id="date" class="font">${item.date}</span><br>
					<!-- 충전한 금액 -->
					<span class="font">금액 <span id="price"><fmt:formatNumber value="${item.price}" pattern="#,###" /></span>원</span>
					</span>
					<!--버튼 -->
					<div id="buy_bottom">
						<button id="coin" name="movie_check" class="this_number">
							구매취소
						</button>
						<input id="buy_coin_list_no" type="hidden" value="${item.buy_coin_list_no}"/>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>	

	<%@ include file="assets/inc/footer.jsp" %>
	
</div>
	
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script>
	
// 삭제 버튼 클릭시
$(function(){
	// 충전리스트가 비었다면
	if(!$(".area_list")[0]) {
		// 충전리스트 빈 화면
		$(".no_value").removeClass("hide");
		$("#buy_coin_list").remove();
	}
	$(".this_number").click(function () {
		var buy_coin_list_no = $(this).next().val();
		// 확인, 취소버튼에 따른 후속 처리 구현
		swal({
			html: "<b>선택하신 코인을 구매취소 하시겠습니까?</b>",  // 내용
			type: "question",     // 종류
			confirmButtonText: "확인",   // 확인버튼 표시 문구
			showCancelButton: true, // 취소버튼 표시 여부
			confirmButtonColor : "#ff3253",
			cancelButtonText: "취소", // 취소버튼 표시 문구
			}).then(function (result) {   // 버튼이 눌러졌을 경우의 콜백 연결
				if (result.value) {     // 확인 버튼이 눌러진 경우
					$.post('coin_delete_ok.do',{buy_coin_list_no: buy_coin_list_no},function(req){
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
				                html:"<div style='font-weight: bold; margin-bottom: 20px;'>구매한지 일주일이 지난 상품은<br>구매 취소가 불가능합니다.</div>",
				                type:"error",
				                allowOutsideClick: false,
				                showConfirmButton: false
				            }).then(function(){
				            	return false;
				            });
			            } else if (req == 3) {
			            	swal({
				                timer:1500,
				                html:"<div style='font-weight: bold; margin-bottom: 20px;'>보유하신 코인이 모자라<br>구매 취소가 불가능합니다.</div>",
				                type:"error",
				                allowOutsideClick: false,
				                showConfirmButton: false
				            }).then(function(){
				            	return false;
				            })
			            }
			        });
				}
			});
		});
	});	
</script>
</body>
<style type="text/css">
		#footer {
			margin-bottom: 0;
		}
</style>

</html>
