<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="assets/css/top_info.css">
<style type="text/css">
* {
    font-family: 'Nanum Gothic', sans-serif;
}
/*a 밑줄 제거*/
a{
	text-decoration: none;
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
#top_bar_movie .pull_center p{
	font-weight: 50px;
	text-align: left;
}

/*날짜시간 폰트설정*/
#top_bar_movie .pull_center .cash{
	font-size: 20px;
	font-weight: bold;
}
/*폰트값 크기 설정*/
#top_bar_movie .pull_center p{
	font-size: 20px;
    color: #b8b8b8;
}

/*탑바캐쉬리스트 클리어*/
#top_bar_movie_list .clear {
	content: '';
	display: block;
	float: none;
	clear: both;
}
/*코인잔여 글씨 위치설정*/
#top_bar_movie .aharge{
	text-align: left;
	font-weight:10px;
}
/*이용약관 컬러및 폰트사이즈 설정*/
.footer ul {
	color: #b8b8b8;
	font-size: 10px;
}
.movie{
	min-height:240px;
	margin-top:70px;
}
#top_bar_movie .pull_center{
	vertical-align:middle;
	display:inline-block;
	width: 100%;
    height: 100px;
    background-color: #ccc;
    margin-top: 10px;
}

#top_bar_movie .font{
	font-size: 10px;
	color: #888888;
}
#top_bar_movie .day{
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
#top_bar_movie .area_list{
	position: relative;
	width: 100%;
	border-bottom: 1px solid #e5e5e5;
	-webkit-box-sizing: border-box;
	padding: 15px 105px 15px 16px;
}
#footer p{
	color: #888888;
	padding:0 0 0 11px;
	width: 350px;
    margin: auto;
	font-size: 0.7em;
	line-height: 18px;
}
.str span{
	font-size:20px;
	font-weight: bold;
}
.tab{
	padding: 5px;
	color: #888888;
	font-size: 12px;
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
         <a href="MY_movie.jsp"> <img
            src="assets/img/left.png" alt="뒤로">
         </a><span id="top_info_value">내 코인</span>
      </div>

			<hr />
			<!-- 탭영역 -->
			<div id="top_bar">
		<ul class="clearfix">
			<li class="pull_left"><a href="MY_coin_charge.jsp"><span>코인충전</span></a></li>
			<li class="pull_left"><a href="MY_coin_purchase_list.jsp"><span class="selected">충전내역</span></a></li>
		</ul>
	</div>
			

		<!-- 캐시충전했을때 추가 되야함 밑으로 -->
		<div class="no_value hide">
			<img src="assets/img/wish_list_none.png" />
			<div class="text1">구매 내역이 없습니다.</div>
		</div>
		
		
	<div id="top_bar_movie" class="clear">
		<ul class="movie">
			<li class="area_list">
					<span class="this_text">코인 충전<br>
					<!-- 충전한 날짜 시간 -->
					<span class="font">2020.07.31 19:20</span><br>
					<!-- 충전한 금액 -->
					<span class="font">금액 600원</span></span>
					<!--버튼 -->
					 <div id="buy_bottom">
						<button id="coin" name="movie_check" class="this_number">
						<!-- class="area_button_openCashPurchasePopup(soncash_1000_npay,1000.0)" -->
							구매취소
						</button>
					</div>
			</li>
		</ul>
	</div>	


	<!--하단 이용약관-->
	
		<div id="footer" class="str">
		
			<br><span> &nbsp;이용안내</span><br><br>
			<div class="tab">
			&#8226;충전된 코인은 클립 에서 이용 가능합니다
			</div>
			<div class="tab">
			&#8226;직접 입력한 충전 금액은 100~500,000 코인<br/>
			&nbsp;&nbsp;&nbsp;사이로 충전 가능하며,
			<br/>&nbsp;&nbsp;&nbsp;카드사별 결제 한도가 코인 충전 한도와 다를수 
			<br/>&nbsp;&nbsp;&nbsp;있습니다
			</div>
			<div class="tab">
			&#8226;충전한 코인은 'MY > 코인충전 > 충전내역' 에서 
			<br/>&nbsp;&nbsp;&nbsp;확인할 수 있습니다
			</div>
			<div class="tab">
			&#8226;코인의 가격은 부가가치세가 포함된 가격입니다
			</div>
			
		</div>
</div>
	
<script src="assets/js/jquery.min.js"></script>

<script>
	
// 삭제 버튼 클릭시
$(function(){
$(".this_number").click(function () {
	var movie_e = $(this)
	var value1="";
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
			swal({
                timer:1500,
                html:"<div style='font-weight: bold; margin-bottom: 20px;'>구매취소 되었습니다.</div>",
                type:"success",
                allowOutsideClick: false,
                showConfirmButton: false
            }).then(function(){
            	$(movie_e).parent().parent().remove();
    			if(!$(".area_list")[0]) {  
    				$("#top_bar_movie").remove(); 
    			} 
            	// 충전리스트가 비었다면
    			if(!$(".area_list")[0]) {
    				// 충전리스트 빈 화면
    				$(".no_value").removeClass("hide");
    				$("#top_bar_movie").removeClass("hide");
    				$(".area_list").addClass("hide");
    			}
            })
			}
		});
	});	
});//삭제버튼 end
</script>
</body>

</html>
