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

<style type="text/css">
/*a태그 밑줄 제거*/
a {
	text-decoration: none;
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
#top_bar_cash .pull_center {
	text-align: center;
	background-color: #e5e5e5;
	padding: 20px;
	margin-top: 79px;
}
/* 폰트값 크기 설정 */
#top_bar_cash .pull_center p {
	font-weight: 50px;
}

/*코인이미지 크기지정*/
#top_bar_cash .pull_center img {
	margin: 0;
	width: 20px;
}
/*폰트 크기설정*/
#top_bar_cash .pull_center span {
	font-size: 20px;
}

#top_bar_cash_list .clear {
	content: '';
	display: block;
	float: none;
	clear: both;
}
/*area_card 크기설정*/
#top_bar_cash .area_card {
	position: relative;
	width: 100%;
	border-bottom: 1px solid #e5e5e5;
	-webkit-box-sizing: border-box;
	padding: 15px 105px 15px 16px;
}

#top_bar {
	display: inline-block;
	border: #b8b8b8;
	background-color: #fff;
	width: 100%;
	height: 39px;
	top: 40px;
	border-bottom: 1px solid #b8b8b8;
	position: fixed;
}

#top_bar .selected {
	display: inline-block;
	color: #E61A3F;
	font-weight: bold;
	border-bottom: 2px solid #E61A3F;
	font-size: 1.1em;
	height: 39px;
}
/*탭영역 넓이 및 마진오토값*/
#top_bar ul {
	width: 74%;
	margin: auto;
}
/*탭 영역*/
#top_bar .pull_left {
	float: left;
	height: 39px;
	width: 50%;
	text-align: center;
}

#top_bar a {
	font-size: 0.9em;
	line-height: 39px;
	color: #b8b8b8;
	font-weight: bold;
	text-decoration: none;
}
/*코인 이미지 지정*/
.area_card  img {
	margin-top: 1px;
	width: 30px;
	height: 20px;
}

/*폰트 크기설정*/

/*충전설명 텍스트 색상및 마진값 설정*/
.text {
	margin-top: 9px;
	color: #888888;
}

/*area_card 크기설정*/

/*숫자 글씨 간격*/
.this_number {
	letter-spacing: -0.5px;
}

/*코인 크기및색갈 설정*/
#coin {
	position: absolute;
	top: 0;
	right: 0;
	width: 70px;
	height: 35px;
	margin: 6px 13px 0px 0;
	border: 1px solid #E61A3F;
	border-radius: 3px;
	background-color: #E61A3F;
	font-size: 12px;
	color: #fff;
	letter-spacing: 0px;
	text-align: center;
	line-height: 35px;
}

/*숫자 중간지정*/
.area_card .this_text {
	vertical-align: middle;
	line-height: 10px;
	font-weight: bold;
}

#footer p {
	color: #888888;
	padding: 0 0 0 11px;
	width: 350px;
	margin: auto;
	font-size: 0.7em;
	line-height: 18px;
}

.pull_left a {
	color: #888888;
}

.str span {
	font-size: 20px;
	font-weight: bold;
}

.tab {
	font-size: 12px;
	padding: 5px;
	color: #888888;
}

/*탭 영역 마감제*/
.clearfix:after {
	clear: both;
	content: "";
	float: none;
	display: block;
}

/*탭영역 넓이 및 마진오토값*/
.area_card img {
	content: "";
	display: inline-block;
	width: 18px;
	height: 18px;
	margin: 0 5px 0 0;
	background-size: 18px 18px;
	-webkit-background-size: 18px 18px;
	vertical-align: middle;
}

.area_card1 img {
	content: "";
	display: inline-block;
	width: 18px;
	height: 18px;
	margin: 0 5px 0 0;
	background-size: 18px 18px;
	-webkit-background-size: 18px 18px;
	vertical-align: middle;
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

	</div>

	<!-- 탭영역 -->
	<div id="top_bar">
		<ul class="clearfix">
			<li class="pull_left"><a href="MY_coin_charge"><span
					class="selected">코인충전</span></a></li>
			<li class="pull_left"><a href="MY_coin_purchase_list"><span>충전내역</span></a></li>
		</ul>
	</div>

	<div id="top_bar_cash" class="clear">
		<div class="pull_center">
			<div class="area_card1">
				<ul>
					<!--코인잔여 보여주는 곳-->
					<li>
						<p style="font-weight: bold;">보유코인</p> <br /> <img
						src="assets/img/coin.png" alt="코인" /><span>&nbsp;${user_coin}코인</span>
					</li>

				</ul>
			</div>
		</div>
		<div>
			<ul>
				<!--1,000코인~100,000코인 충전 클릭-->
				<li>
					<div class="area_card">
						<img src="assets/img/coin.png" /><span
							class="this_text"> 1,100코인</span> <a href="Coin_charge.jsp"
							id="coin"
							class="area_button_openCashPurchasePopup(soncash_1000_npay,1000.0)">
							<strong class="this_number">1,000원</strong>
						</a>
					</div>
				</li>

				<li class="area_card"><img
					src="assets/img/coin.png" alt="코인" /><span
					class="this_text"> 5,500코인</span> <a href="Coin_charge.jsp"
					id="coin"
					class="area_button_openCashPurchasePopup(soncash_1000_npay,1000.0)">
						<strong class="this_number">5,000원</strong>
				</a></li>
				<li class="area_card"><img
					src="assets/img/coin.png" alt="코인" /><span
					class="this_text"> 11,000코인</span> <a href="Coin_charge.jsp"
					id="coin"
					class="area_button_openCashPurchasePopup(soncash_1000_npay,1000.0)">
						<strong class="this_number">10,000원</strong>
				</a></li>

				<li class="area_card"><img
					src="assets/img/coin.png" alt="코인" /><span
					class="this_text"> 55,000코인</span> <a href="Coin_charge.jsp"
					id="coin"
					class="area_button_openCashPurchasePopup(soncash_1000_npay,1000.0)">
						<strong class="this_number">50,000원</strong>
				</a></li>

				<li class="area_card"><img
					src="assets/img/coin.png" alt="코인" /><span
					class="this_text"> 110,000코인</span> <a href="Coin_charge.jsp"
					id="coin"
					class="area_button_openCashPurchasePopup(soncash_1000_npay,1000.0)">
						<strong class="this_number">100,000원</strong>
				</a></li>
			</ul>
		</div>
	</div>
	<!--하단 이용안내-->

	<div id="footer" class="str">

		<br> <span> &nbsp;이용안내</span><br> <br>

		<div class="tab">&#8226;충전된 코인은 클립 에서 이용 가능합니다</div>

		<div class="tab">
			&#8226;직접 입력한 충전 금액은 1,000~500,000 원<br /> &nbsp;&nbsp;&nbsp;사이로 충전
			가능하며, <br />&nbsp;&nbsp;&nbsp;카드사별 결제 한도가 코인 충전 한도와 다를수 <br />&nbsp;&nbsp;&nbsp;있습니다
		</div>

		<div class="tab">
			&#8226;충전한 코인은 'MY > 코인충전 > 충전내역' 에서 <br />&nbsp;&nbsp;&nbsp;확인할 수
			있습니다
		</div>

		<div class="tab">&#8226;코인의 가격은 부가가치세가 포함된 가격입니다</div>
	</div>


</body>
</html>