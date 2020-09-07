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
<link rel="stylesheet" href="assets/css/top_info.css">
<style type="text/css">

/* a태그 밑줄 제거*/
a {
	text-decoration: none;
}

.top_bar_cash .area_card {
    position: relative;
    width: 100%;
    height : 40px;
    line-height : 40px;
    /* border-bottom: 1px solid #888; */
    -webkit-box-sizing: border-box;
    padding-left: 10px;
}

.this_number {
	letter-spacing: -0.5px;
	position: absolute;
	right: 20px;
}

.this_textbox {
	letter-spacing: -0.5px;
	right: 10px;
	position: absolute;
	width: 75px;
}

.incharge img {
	margin-top: 10px;
	width: 50px;
}

.inpo { 
	border-bottom: 1px solid #888;
	height : 35px;
	line-height : 35px;
	width : 100%;
	background : url('assets/img/Orinfor.png') 10px center no-repeat;
	background-size: 25px;
}



.inpo1 {
	border-bottom: 1px solid #888;
	margin-bottom: 10px;
	padding-bottom: 5px;
}

.inpo1 img {
	width: 25px;
}


.Opinformation {
	padding-top : 40px;
	margin-bottom: 5px;
}

.tbody {
	width : 95%;
	margin : auto;
}

.background {
	widht: 85%;
	margin-top: 20px;
}

.background img {
	width: 25px;
}

.background p {
	margin-bottom: 10px;
}

.set_payment {
    width : 100%;
    box-sizing : border-box;
    height: 35px;
    line-height: normal; /* line-height 초기화 */
    font-family: inherit; /* 폰트 상속 */
    border: 1px solid #999;
    outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */
    -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */
    appearance: none;
}

.tfoot {
	width: 95%;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
}

.tfoot_text {
	width: auto;
	height: 40px;
	margin: 5px 20px 0px 0;
}
.tfoot_text span{
	float:right;
	font-size: 10px;

}

.buy_information {
	border: 1px solid #333;
	width: 100%;
	position: relative;
	-webkit-box-sizing: border-box;
	padding: 15px 100px 15px 16px;
	border-color: #E61A3F;
	background-color: #FE506B;
	border-radius: 10px;
	color: #fff;
	font-weight: bold;
	
}

.coupon2 {
	position: absolute;
	top: 0;
	right: 15px;
	margin: 15px 13px 24px 0;
}
.tfoot_text a{
font-size:10px;
	}

.pay_end {
	width: 100%;
	border : 0px;
	background-color: #E61A3F;
	height: 50px;
	text-align: center;
	border-radius: 10px;
	font-size : 1em;
	font-weight : bold;
	color: #fff;
}

.incharge {
	dlsplay: inline;
	width: auto;
}

.time {
	right: 100px;
}

.movie_text {
	position: absolute;
	
}

.movie_text1 {
	position: absolute;
	margin: 5px 0 0 5px;
	
}

#password {
	border: 1px solid #E61A3F;
	height: auto; /* 높이값 초기화 */
	line-height: normal; /* line-height 초기화 */
	padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
	outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */
	-webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */
}

#custom_payment {
	margin-right: 10px;
    border: 1px solid #E61A3F;
    height: auto; /* 높이값 초기화 */
    line-height: normal; /* line-height 초기화 */
    padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
    outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */
    -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */
}

input {
	color: -internal-light-dark(red, red);
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
#check{
    margin-top : 8px;
}
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

	<div id="container">
		<!--탑 바-->
		<%@ include file="assets/inc/top_info.jsp" %>
	<div id="" class="Opinformation">
		<div class="inpo" >
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문상품정보
		</div>
		
		<br>
		<span class="img_r"> 
	
		<img src="assets/img/coin_charge.png" width="16"
			height="16"  style='padding-left : 10px;'/> 
			
			<span class="movie_text"> 충전 금액 선택 </span>

		</span>
	</div>


	<div class="top_bar_cash" class="clear">
		<ul>
			<!--1,000코인~100,000코인 충전 클릭-->

			<!-- 체크박스 or 라디오 박스 중에 하나정하고 하나만 체크되게 설정 -->
			<!-- 라디오 박스 체크 시 총결제 금액 자동으로 바껴야함 -->
			<li class="area_card"><input id="coinbox" class="coupon"
				name="coin" type="radio" /><span class="this_text"> 1,000원</span> <b
				class="this_number">1,100코인</b></li>


			<li class="area_card"><input id="coinbox1" class="coupon"
				name="coin" type="radio" /><span class="this_text"> 5,000원</span> <b
				class="this_number">5,500코인</b></li>

			<li class="area_card"><input id="coinbox2" class="coupon"
				name="coin" type="radio" /><span class="this_text"> 10,000원</span>
				<b class="this_number">11,000코인</b></li>

			<li class="area_card"><input id="coinbox3" class="coupon"
				name="coin" type="radio" /><span class="this_text"> 50,000원</span>
				<b class="this_number">55,000코인</b></li>

			<li class="area_card"><input id="coinbox4" class="coupon"
				name="coin" type="radio" /><span class="this_text"> 100,000원</span>
				<b class="this_number">110,000코인</b></li>

			<li class="area_card">
				<!-- 문자열 입력하면 얼럴창 도는 문자열 입력값 사라짐 --> <input id="coinbox5"
				class="coupon" name="coin" type="radio" /> <span id="coin_won"
				class="this_number1">금액(100원~500,000원)</span> <input type="number"
				class="this_textbox" name="coinpay" placeholder="100"
				id="custom_payment" disabled/>
			</li>
		</ul>
	</div>
	<div style="width:95%; margin:auto; color: #aaa; font-size: 12px; margin-top: 10px; text-align: center;">결제하신 금액의 10%의 코인을 추가로 받으실 수 있습니다.</div>
	<!-- 상단 부분 끝 -->


	<!-- 중단 부분 시작 -->
	<div class="tbody">
		<div class="background">
			<img src="assets/img/Payment.png" /><span
				class="movie_text1">결제수단</span>
			<hr />
			<!-- 계좌번호 비밀번호랑 카드번호 비밀번호 다르게 설정 -->
			<p>
				<input type="radio" id="paybox1" name="pay" class="coupon"
					value="card" checked /> <label>${card_no}</label>
			</p>
			<hr />
		</div>


		<div class="coin_text">
			<!-- 현 아이디 비밀번호 입력 하고 결제하기 눌렀을때 아니면 얼럴 맞으면 마이페이지 이동-->
			<br>
			<p class="text">비밀번호 입력</p>
			<br> <input type="password" class="set_payment"
				placeholder="직접입력" id="password" />
		</div>
		
		<input id="check" name="Conditions" class="coupon1"
						type="checkbox"/> 위 구매조건 확인 및 결제 진행 동의

	</div>
	
	<div class="tfoot">
			<div class="buy_information">
				<!-- 라디오 박스 체크 시 총결제 금액 자동으로 바껴야함 -->
				<p class="this_text">총 결제금액</p>
				<span class="coupon2">1,000원</span>
			</div>
			<br>
			<div class="Payment">
				<!-- 결제가 되면 마이페이지로 이동 실패시 alert(사유) 페이지 이동 x 
			위 체크 박스 체크 되있으면 결제되고 마이페이지 안되있으면 alert(사유) & 포커스 (그위치로 이동)-->
				<input class="pay_end" type="button" value="결제하기" /><br>
			</div>
		</div>
</div>
	<!-- 하단 부분 끝 -->
	<!-- 제이쿼리 시작 -->
	<script>
		$(function() {
			$("input:radio[name='coin']").eq(${check}).prop("checked", true);
			$(".coupon2").html($("input:radio[name='coin']:checked").next().text());
			$("#top_info_value").html("코인 결제하기");
			
			$("#coinbox").click(function() {
				$("input[name=coinpay]").prop("disabled", true);
				var chk1000 = $("#coinbox").is(":checked");
				if (chk1000) {
					$(".coupon2").html("1,000"+"원");
				}
			}) // 1000
			
			$("#coinbox1").click(function() {
				$("input[name=coinpay]").prop("disabled", true);
				var chk5000 = $("#coinbox1").is(":checked");
				if (chk5000) {
					$(".coupon2").html("5,000"+"원");
				}
			}) // 5000
			
			$("#coinbox2").click(function() {
				$("input[name=coinpay]").prop("disabled", true);
				var chk10000 = $("#coinbox2").is(":checked");
				if (chk10000) {
					$(".coupon2").html("10,000"+"원");
				}
			}) // 10000
			
			$("#coinbox3").click(function() {
				$("input[name=coinpay]").prop("disabled", true);
				var chk50000 = $("#coinbox3").is(":checked");
				if (chk50000) {
					$(".coupon2").html("50,000"+"원");
				}
			}) // 50000
			
			$("#coinbox4").click(function() {
				$("input[name=coinpay]").prop("disabled", true);
				var chk100000 = $("#coinbox4").is(":checked");
				if (chk100000) {
					$(".coupon2").html("100,000"+"원");
				}
			})	// 100000
			
			$("#coinbox5").click(function() {
				$("input[name=coinpay]").prop("disabled", false);
				$(".coupon2").html("100"+"원");
				$(".this_textbox").val(100);
				$(".this_textbox").on("propertychange change keyup paste input",function() { 
					 var currentVal = $(".this_textbox").val();
					  if(currentVal) {
						  $(".coupon2").html(currentVal.substring(0,6).replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
					   }
					  if( $(this).val(currentVal.substring(0,6)) && currentVal>500000){
							swal({
								html : "<b>최대 50만원까지 결제할수있습니다.</b>", // 내용
								type : "error", // 종류
								confirmButtonText : "확인", // 확인버튼 표시 문구
								confirmButtonColor : "#ff3253",
								showCancelButton : false, // 취소버튼 표시 여부
							}).then(function(){
								$("#custom_payment").val("");
								$("#custom_payment").focus();
								$(".coupon2").html("원");
							})
							return;
					  } 
				})
			})	// 직접입력
			
			$(".pay_end").click(function() {
				var chk1 = $("#check").is(":checked");
				var pw_val = $("#password").val();
				var price = parseInt($(".coupon2").text().replace(",","").replace("원",""));
				
				//비밀번호 확인 여부
				if (!pw_val) {
					swal({
						html : "<b>비밀번호를 입력해주세요.</b>", // 내용
						type : "error", // 종류
						confirmButtonText : "확인", // 확인버튼 표시 문구
						confirmButtonColor : "#ff3253",
						showCancelButton : false, // 취소버튼 표시 여부
					}).then(function(){
						$("#password").val("");
						$("#password").focus();
					})
					return false;
				}
				$.post("pwCheck.do", {pw: pw_val}, function(req) {
					if(req == 0){
						swal({
							html : "<b>비밀번호가 틀렸습니다.</b>", // 내용
							type : "error", // 종류
							confirmButtonText : "확인", // 확인버튼 표시 문구
							confirmButtonColor : "#ff3253",
							showCancelButton : false, // 취소버튼 표시 여부
						}).then(function(){
							$("#password").val("");
							$("#password").focus();
						})
						return false;
					} else {
						//약관동의 여부 확인
						if (!chk1) {
							swal({
								html : "<b>약관을 동의해 주세요.</b>", // 내용
								type : "error", // 종류
								confirmButtonText : "확인", // 확인버튼 표시 문구
								confirmButtonColor : "#ff3253",
								showCancelButton : false, // 취소버튼 표시 여부
							})
							return false;
						}
						
						if ($("#coinbox5").is(":checked")) {
							var currentVal = $(".this_textbox").val();
							
							var math = Math.round((currentVal%100) * 100 == 0);
						 	if(!math){
								swal({
									html : "<b>최소 입력단위는 100원입니다.</b>", // 내용
									type : "error", // 종류
									confirmButtonText : "확인", // 확인버튼 표시 문구
									confirmButtonColor : "#ff3253",
									showCancelButton : false, // 취소버튼 표시 여부
								}).then(function(){
									$("#custom_payment").val("");
									$("#custom_payment").focus();
									$(".coupon2").html("원");
								})
								return false;
						 	}
						 	var test = parseInt($(".this_textbox").val())
							if(!currentVal || !test){
								 swal({
									html : "<b>금액을 입력해주세요.</b>", // 내용
									type : "error", // 종류
									confirmButtonText : "확인", // 확인버튼 표시 문구
									confirmButtonColor : "#ff3253",
									showCancelButton : false, // 취소버튼 표시 여부
								}).then(function(){
									$("#custom_payment").val("");
									$("#custom_payment").focus();
									$(".coupon2").html("원");
								})
								return false;
							}
						}
						
						$.post('card_check.do', {card_no: "${card_no}"}, function(req){
							if(req == 0) {
								swal({
					                timer:1500,
					                html:"<div style='font-weight: bold; margin-bottom: 20px;'>등록된 카드가 없습니다.<br>카드정보를 등록해 주세요.</div>",
					                type:"error",
					                allowOutsideClick: false,
					                showConfirmButton: false
					            }).then(function(){
					            	swal({
									    showConfirmButton: true,
									    showCancelButton: false,
									    confirmButtonColor: "#FF3253",
									    confirmButtonText: "<span style='color:#FFFBFC; font-weight:bold'>확인</span>",
									    showCloseButton: true,
									    allowOutsideClick: false,
									    background: '#FFFBFC url(assets/img/logo_swal.png) no-repeat center 10px',
										html : "<input type='password' id='swal_pw' class='swal_body' placeholder='비밀번호를 입력해주세요.'>"
									}).then(function(e) {
										var pw = $("#swal_pw").val(); //비밀번호
										if (e.value) { // 확인 버튼 눌림
											if (!pw) { //비밀번호 공란
												swal({
													showConfirmButton : false,
													type : 'error',
													html : "<b>비밀번호를 입력해주세요.</b>",
													timer : 1500
												}).then(function() {
													$(".id_btn_my").click(); //비밀번호 확인 alert창 재실행
												}) 
											} else {	
												$.post("pwCheck.do",{pw:pw},function(req){
													if (req!="1") {
														swal({
															showConfirmButton : false,
															type : 'error',
															html : "<b>비밀번호가 틀렸습니다.</b>",
															timer : 1500
														}).then(function() {
															$(".id_btn_my").click(); //비밀번호 확인 alert창 재실행
														})
													} else { //비밀번호 입력완료
														$(location).attr('href','MY_information');
													}
												});
											}
										}
									});
					            });
							} else {
								$.post('coin_add_ok.do',{price: price},function(){
									swal({
							            timer:1500,
							            html:"<div style='font-weight: bold; margin-bottom: 20px;'>코인 구매에 성공하셨습니다.</div>",
							            type:"success",
							            allowOutsideClick: false,
							            showConfirmButton: false
							        }).then(function(){
							        	location.href = document.referrer; 
							        });
					            });
							}
						});
					}
				})
			})
		}); // $(function(){}) end
	</script>
</body>
</html>