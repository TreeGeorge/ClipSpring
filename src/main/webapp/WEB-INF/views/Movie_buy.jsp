<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<style type="text/css">
* {
	font-family: 'Nanum Gothic', sans-serif;
}
/*탑 로고 크기*/
#top_logo {
	background-color: white;
	position: fixed;
	z-index: 100;
	width: 100%;
	border-bottom: 1px solid #575757;
	top: 0;
	left: 0;
}
/* 액션 타이틀 글씨 */
#top_logo h1 {
	height: 0px;
	text-align: center;
	font-size: 18px;
	margin-bottom: 1px;
	margin-top: 8px;
}
/* 액션타이틀 좌측 화살표 이미지*/
#top_logo img {
	background: url(assets/img/left.png) no repeat;
	height: 25px;
	left: 100px;
	top: 10px;
	margin-bottom: 5px;
	margin-left: 5px;
}

html {
	background-color: rgb(231, 231, 231);
}

a {
	text-decoration: none;
}

.movie_name {
	margin-top: 70px;
}

.couponbox_first {
	width: 90%;
	margin: auto;
}

.couponbox_first h5 {
	margin: 20px 0 5px 0;
}

.couponbox_first p {
	margin: 0 0 10px 0;
}

.coupon {
	position: relative;
	border: 1px solid red;
	padding: 5px;
	background: #fff;
}

.coupun_radio {
	margin: 0;
}

.coupon span {
	position: absolute;
	right: 10px
}

.passworld {
	width: 90%;
	margin: auto;
}

#tbody h5 {
	margin: 20px 0 5px 0;
}

.set_payment {
	border: 1px solid #E61A3F;
	width: 95%; /* 원하는 너비 설정 */
	height: auto; /* 높이값 초기화 */
	line-height: normal; /* line-height 초기화 */
	padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
	font-family: inherit; /* 폰트 상속 */
	outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */
	-webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */
	appearance: none;
}

.pay_end1 {
	width: 45%;
	border: 1px solid #333;
	background-color: #FF7688;
	margin: auto;
	height: 40px;
	float: left;
	text-align: center;
	border-radius: 10px;
	padding: 10px 50px 10px 50px;
	color: #ffffff;
	font-weight: bold;
	border: 0;
}

.pay_end {
	width: 45%;
	border: 1px solid #333;
	background-color: #E61A3F;
	margin: auto;
	height: 40px;
	float: right;
	text-align: center;
	border-radius: 10px;
	padding: 10px 45px 10px 45px;
	color: #ffffff;
	font-weight: bold;
	border: 0;
}

.box {
	height: 55px;
}

.Conditions {
	margin-bottom: 15px;
}

.tab {
	margin-bottom: 10px;
	font-size: 9px;
}

#naver span {
	font-size: 14px;
}

input[type="radio" i] {
	margin: 1px 0 0 5px;
}

.coupun_radio {
	content: '';
	display: inline;
	float: right;
	clear: both;
}

.logo_pay {
	line-height: 30px
}

.coupon div {
	margin: 10px 0 10px 0;
}
</style>
</head>

<body>
	<!--전체박스-->
	<div id="container">
		<!--상단바 이름-->

		<div id="container">
			<!--탑 바-->
			<%@ include file="assets/inc/top_info.jsp" %>

		</div>


		<div id="movie" class="movie_name">
			<div class="couponbox_first">
				<div class="coupon1">
					<p>[영화] 어벤져스 : 엔드게임 </p>
					<p>
						<span id="coin_first">10,000</span>코인
					</p>
				</div>
			</div>

			<div class="couponbox_first">
				<h5>구매정보</h5>
				<div class="couponbox">
					<div class="coupon">
						<div>
							<!-- 7천원 보유 -->
							보유코인<span id="coin_info">7,000코인</span>
						</div>
						<div>
							부족한 코인<span id="coin_insufficient">3,000코인</span>
						</div>
					</div>
				</div>
			</div>

			<div class="couponbox_first">
				<h5>쿠폰적용</h5>
				<div class="couponbox">
					<div class="coupon">
						<div>
							 &nbsp;<span class="coupun_radio"> 선택안함<input id="no_coin"
								class="coupon" name="coin" type="radio" checked />
							</span>
						</div>
						<div>
							보유한 쿠폰<span id="coin_coupon" class="coupun_radio"> 3,000코인<input
								id="coin" class="coupon" name="coin" type="radio" />
							</span>
						</div>
						<div>
							보유한 쿠폰<span id="coin_coupon" class="coupun_radio"> 2,000코인<input
								id="coin1" class="coupon" name="coin" type="radio" />
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="couponbox_first">
				<h5>충전 코인</h5>
				<div class="couponbox">
					<div class="coupon">
						<div>
							충전할 코인<span id="coin_charge">3,000코인</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 상위 박스 end -->
	</div>

	<div id="tbody" class="passworld">
		<h5>비밀번호 확인</h5>
		<!-- 비밀번호 입력 하고 현재 아이디와 비밀번호가 맞는지 확인 -->
		<div class="pass">
			<form id="" name="form">
				<input type="password" class="set_payment" placeholder="비밀번호 확인"
					id="custom_payment" name="pw_re" />
			</form>
		</div>
		<div class="Conditions">
			<form id="naver" name="frmJoin" style="margin-top: 7px;">
				<a><input id="check" name="Conditions" type="checkbox"
					class="check_char" /> <span>위 구매조건 확인 및 결제 진행 동의</span></a>
			</form>
		</div>



		<!--하단 이용안내-->

		<div id="footer" class="str">

			<p class="tab">&#8226;콘텐츠 결제를 위해 CLIP코인이 필요합니다</p>
			<p class="tab">&#8226;코인은 CLIP에서 영화 컨텐츠 구매시 사용하는결제수단입니다.</p>
			<p class="tab">&#8226;충전한 코인은 'MY > 코인충전 > 충전내역'에서확인할 수
				있으며,환불은결제하신</p>
			<p class="tab">&nbsp;&nbsp;&nbsp;수단으로 환불됩니다</p>
			<p class="tab">&#8226;코인의 가격은 부가가치세가 포함된 가격입니다</p>


			<div class="box">
				<a href="#" onclick="history.back(); return false;" id="coin"> <input
					class="pay_end1" type="button" value="취소" /></a> <input class="pay_end"
					type="button" value="구매하기" />
			</div>
		</div>
	</div>


	<!-- 비밀번호 확인 -->
	<script type="text/javascript">
	/* 비밀번호 확인 */
	$(function() {
		$("#top_info_value").html("영화 결제하기");
		
		$(".pay_end").click(function() {
            var chk1 = document.frmJoin.Conditions.checked;
            var pw_val = $("#custom_payment").val();
            if (!pw_val) {
				swal({
                        html: "<b>비밀번호를 입력해주세요.</b>",    // 내용
                        type: "error",  // 종류
                        confirmButtonText: "확인", // 확인버튼 표시 문구
                        confirmButtonColor: "#ff3253", // 확인버튼 색상
                });
				return false;
			}
			if(pw_val != "master001"){
				swal({
                        html: "<b>비밀번호가 틀렸습니다.</b>",    // 내용
                        type: "error",  // 종류
                        confirmButtonText: "확인", // 확인버튼 표시 문구
                        confirmButtonColor: "#ff3253", // 확인버튼 색상
                });
				return false;
			}//비밀번호 틀렷을때
			//약관동의 여부 확인
            if (!chk1) {
                swal({
                        html: "<b>약관을 동의해 주세요.</b>",    // 내용
                        type: "error",  // 종류
                        confirmButtonText: "확인", // 확인버튼 표시 문구
                        confirmButtonColor: "#ff3253", // 확인버튼 색상
                });
                return false;
            }
            
            var novalue = $("#no_coin").is(":checked");
            var chkcoupon = $("#coin1").is(":checked");
			if(chkcoupon || novalue){
		    swal({
                html: "<b>보유하신 코인이 부족합니다.<br>코인을 충전하러 가시겠습니까?</b>",// 내용
                type : "error", // 종류
                confirmButtonText : "확인", // 확인버튼 표시 문구
                confirmButtonColor : "#ff3253",
                showCancelButton : true, // 취소버튼 표시 여부
                cancelButtonText : "취소"
            	}).then(function(result) {
            		if (result.value) {
            			$(location).attr('href', 'Coin_charge');
            		}
            	})
            return false;
			}

            $(location).attr('href', 'MY_movie.jsp');

        })
}); //.pay_end(end)
		$(function() {
			$("#coin").click(function() {
				var chkcoupon = $("#coin").is(":checked");
				if (chkcoupon) {
					$("#coin_charge").html("0"+"코인");
				}
			})
		});//3000원 쿠폰적용
		$(function() {
			$("#coin1").click(function() {
				var chkcoupon = $("#coin1").is(":checked");
				if (chkcoupon) {
					$("#coin_charge").html("1,000"+"코인");
				}
				
			})
			
		});//2000원 쿠폰적용

		$(function() {
			$("#no_coin").click(function() {
				var chkno = $("#no_coin").is(":checked");
				if (chkno) {
					$("#coin_charge").html("3,000"+"코인");
				}
			})
		});//쿠폰 선택안함
		
		
	
	</script>

</body>
</html>