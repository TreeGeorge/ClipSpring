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
<style type="text/css">
html {
	background-color: rgb(231, 231, 231);
}

a {
	text-decoration: none;
}

.content_box {
	width: 90%;
	margin: auto;
}

h5 {
	margin: 20px 0 5px 0;
}

.white_box {
	position: relative;
	border: 1px solid red;
	padding: 5px;
	background: #fff;
}

.white_box span {
	position: absolute;
	right: 10px
}

.password {
	box-sizing: border-box;
	border: 1px solid #E61A3F;
	width: 100%;
	margin: auto;
	line-height: normal; /* line-height 초기화 */
	padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
	outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */
	appearance: none;
}

.cancel {
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

.logo_pay {
	line-height: 30px
}

.white_box div {
	height: 30px;
    line-height: 30px;
    width: 60%;
    text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.movie_title {
	height: 30px;
	line-height: 30px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.agree {
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
</head>

<body>
	<!--전체박스-->
	<div id="container">

		<!--탑 바-->
		<%@ include file="assets/inc/top_info.jsp"%>

		<div class="content_box" style="margin-top: 60px;">
			<div class="movie_title">${movie_title}</div>
			<div>
				<c:choose>
					<c:when test="${price != 0}">
						<fmt:formatNumber value="${price}" pattern="#,###" />코인
					</c:when>
					<c:otherwise>
						무료 이벤트 제품입니다.
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class="content_box">
			<h5>구매정보</h5>
			<div class="white_box">
				<div>보유코인
					<span>
						<fmt:formatNumber value="${user_coin}" pattern="#,###" />코인
					</span>
				</div>
				<div>부족한 코인
					<span>
						<c:choose>
							<c:when test="${price - user_coin < 0}">
								0코인
							</c:when>
							<c:otherwise>
								<fmt:formatNumber value="${price - user_coin}" pattern="#,###" />코인
							</c:otherwise>
						</c:choose>
					</span>
				</div>
			</div>
		</div>

		<div class="content_box">
			<h5>쿠폰적용</h5>
			<div class="white_box">
				<div>
					<span>선택안함 
						<input id="coin" class="white_box" name="coin" type="radio" checked />
					</span>
				</div>
				<c:forEach var="item" items="${coupon}" varStatus="status">
					<div>${item.name}
						<span><fmt:formatNumber value="${item.price}" pattern="#,###" />코인
						<input id="coin" class="white_box" name="coin" type="radio" value="${item.user_coupon_no}" />
						<input type="hidden" name="price" value="${item.price}" />
						</span>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="content_box">
			<h5>충전 코인</h5>
			<div class="white_box">
				<div>충전할 코인
					<span id="total_charge_coin">
						<c:choose>
							<c:when test="${price - user_coin < 0}">
								0코인
							</c:when>
							<c:otherwise>
								<fmt:formatNumber value="${price - user_coin}" pattern="#,###" />코인
							</c:otherwise>
						</c:choose>
					</span>
				</div>
			</div>
		</div>

		<div class="content_box">
			<h5>비밀번호 확인</h5>
				<input type="password" class="password" placeholder="비밀번호 확인" id="password" name="password" />
			<div class="agree">
				<input id="agree" name="agree" type="checkbox" class="check_char" />
				위 구매조건 확인 및 결제 진행 동의
			</div>

			<div id="footer">
				<p class="tab">&#8226;콘텐츠 결제를 위해 CLIP코인이 필요합니다</p>
				<p class="tab">&#8226;코인은 CLIP에서 영화 컨텐츠 구매시 사용하는결제수단입니다.</p>
				<p class="tab">&#8226;충전한 코인은 'MY > 코인충전 > 충전내역'에서 확인할 수 있으며,
				<p class="tab">&nbsp;&nbsp;&nbsp;환불은결제하신 수단으로 환불됩니다</p>
				<p class="tab">&#8226;코인의 가격은 부가가치세가 포함된 가격입니다</p>


				<div class="box">
					<button class="cancel" type="button">취소</button>
					<button class="pay_end" type="button">구매하기</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">

		$(function() {
			var user_coupon_no = 0;
			var coupon_price = 0;
			var total_price = ${price - user_coin};
			var final_price = ${price};
			$("input[name='coin']").change(function() {
				user_coupon_no = parseInt($("input[name='coin']:checked").val());
				coupon_price = parseInt($("input[name='coin']:checked").next().val());
				var text;
				if (${price - user_coin} - coupon_price < 0) {
					$("#total_charge_coin").text("0코인");
				} else if (!coupon_price) {
					if (${price - user_coin} < 0) {
						$("#total_charge_coin").text("0코인");
					} else {
						text = ${price - user_coin} + "";
						$("#total_charge_coin").text(text.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "코인");
					}
				} else {
					text = (${price - user_coin} - coupon_price) + "";
					$("#total_charge_coin").text(text.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "코인");
				}
				total_price = ${price - user_coin} - coupon_price;
				final_price = ${price} - coupon_price;
				if (final_price < 0) {
					final_price = 0;
				}
			});
			
			$(".pay_end").click(function() {
				var pw_val = $("#password").val();
				if (!pw_val) {
					swal({
						html : "<b>비밀번호를 입력해주세요.</b>", // 내용
						type : "error", // 종류
						confirmButtonText : "확인", // 확인버튼 표시 문구
						confirmButtonColor : "#ff3253", // 확인버튼 색상
					});
					return false;
				}

				$.post("pwCheck.do", {pw : pw_val}, function(req) {
					if (req == 0) {
						swal({
							html : "<b>비밀번호가 틀렸습니다.</b>", // 내용
							type : "error", // 종류
							confirmButtonText : "확인", // 확인버튼 표시 문구
							confirmButtonColor : "#ff3253",
							showCancelButton : false, // 취소버튼 표시 여부
						}).then(function() {
							$("#password").val("");
							$("#password").focus();
						})
						return false;
					} else {
						//약관동의 여부 확인
						if (!$("#agree").is(":checked")) {
							swal({
								html : "<b>약관을 동의해 주세요.</b>", // 내용
								type : "error", // 종류
								confirmButtonText : "확인", // 확인버튼 표시 문구
								confirmButtonColor : "#ff3253",
								showCancelButton : false, // 취소버튼 표시 여부
							})
							return false;
						}
						
						if (total_price > 0) {
							swal({
								html : "<b>보유하신 코인이 부족합니다.<br>코인을 충전하러 가시겠습니까?</b>",// 내용
								type : "error", // 종류
								confirmButtonText : "확인", // 확인버튼 표시 문구
								confirmButtonColor : "#ff3253",
								showCancelButton : true, // 취소버튼 표시 여부
								cancelButtonText : "취소"
							}).then(function(result) {
								if (result.value) {
									$(location).attr('href', 'Coin_charge?check=1');
								}
							})
							return false;
						}
						
						$.post('movie_add_check.do', {movieNo:"${movie_no}"}, function(req){
							if (req == 1) {
								swal({
						            timer:1500,
						            html:"<div style='font-weight: bold; margin-bottom: 20px;'>이미 보유중인 영화는<br>구매하실 수 없습니다.</div>",
						            type:"error",
						            allowOutsideClick: false,
						            showConfirmButton: false
						        }).then(function(){
						            history.back();
						        });
							} else if (req == 0) {
								if (user_coupon_no) {
									$.post('use_coupon_check.do', {user_coupon_no: user_coupon_no, coupon_price: coupon_price}, function(req) {
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
											return false;
										} else if (req == 0) {
											swal({
												html : "<b>쿠폰을 사용하시겠습니까?</b>", // 내용
												type : "question", // 종류
												showCancelButton : true, // 취소버튼 표시 여부
												cancelButtonText : "취소",
												confirmButtonText : "확인",
												confirmButtonColor : "#ff3253",
											}).then(function(result) {
												if (result.value) {
													$.post('use_coupon_movie_add_ok.do',{movieNo:"${movie_no}", price: final_price},function(){
														$.post('use_coupon_ok.do', {user_coupon_no: user_coupon_no}, function(){});
														swal({
												            timer:1500,
													        html:"<div style='font-weight: bold; margin-bottom: 20px;'>성공적으로 구매되었습니다.</div>",
												            type:"success",
												            allowOutsideClick: false,
												            showConfirmButton: false
												        }).then(function(){
												        	$(location).attr('href','MY_movie');
												        });
													});
												} else {
													return false;
												}
											});
										} 
									});
								} else {
									$.post('movie_add_ok.do',{movieNo:"${movie_no}", price: final_price},function(){
										swal({
								            timer:1500,
									        html:"<div style='font-weight: bold; margin-bottom: 20px;'>성공적으로 구매되었습니다.</div>",
								            type:"success",
								            allowOutsideClick: false,
								            showConfirmButton: false
								        }).then(function(){
								        	$(location).attr('href','MY_movie');
								        });
									});
								}
							}
						});
					}
				});
			});
		}); //.pay_end(end)
		
		$(".cancel").click(function(){
			history.back();
		})
		
	</script>

</body>
</html>