<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<style>
.id_box {
	width: 90%;
	margin: auto;
	padding-top: 30px;
	height: 100px;
}

.id_box p {
	font-size: 20px;
	font-weight: bold;
	float: left;
	padding-top: 10px;
}

.id_box2 {
	font-size: 13px;
	font-weight: bold;
	width: 90%;
	margin: auto;
	height: 70px;
}

.id_box2 a {
	text-decoration: none;
	color: #E61A3F;
}

.id_btn_my {
	background-color: #FF3253;
	border: none;
	border-radius: 15px;
	color: white;
	padding: 5px 10px;
	font-size: 12px;
	width: 80px;
}

.id_btn_out {
	background-color: #FF3253;
	border: none;
	border-radius: 15px;
	color: white;
	padding: 5px 10px;
	font-size: 12px;
	width: 80px;
}

button:focus {
	outline: 0;
}

.id_box .pull_right {
	float: right;
}

.clear {
	content: "";
	display: block;
	float: none;
	clear: both;
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
<div class="id_box clear">
			<p id="user_id">${id}</p>
			<ul style="height: 20px;">
				<li class="pull_right"><button class="id_btn_my">내정보보기</button></li>
			</ul>
			<ul>
				<li class="pull_right"><button class="id_btn_out">로그아웃</button></li>
			</ul>
		</div>
		<div class="id_box2">
			<span>보유코인&nbsp;</span><span>${user_coin}코인</span> <a href="MY_coin_charge">충전하기 ></a>
</div>
<script>
//내 정보보기 클릭시 얼럴창
$(".id_btn_my").click(function() {
	var sessionPw = ${pw};
	
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
										$(".id_btn_my").click(); //비밀번호 변경 alert창 재실행
									})

								} else if (pw != sessionPw) {
									swal({
										showConfirmButton : false,
										type : 'error',
										html : "<b>비밀번호가 틀렸습니다.</b>",
										timer : 1500
									}).then(function() {
										$(".id_btn_my").click(); //비밀번호 변경 alert창 재실행
									})
								} else { //비밀번호 입력완료
									location.replace("MY_information");
									//location.href = "MY_information";
								}
							}
						})
					});
	// 로그아웃 버튼 클릭시 Login 페이지로 이동
	$(".id_btn_out").click(function() {
		swal({
			showConfirmButton : true,
			showCancelButton : true,
			cancelButtonText : "취소",
			confirmButtonText : "확인",
			confirmButtonColor : "#ff3253",
			type : 'question',
			html : "로그아웃 하시겠습니까?",
		}).then(function(result) {
			if (result.value) {
				location.href = "home"
			}
		});
	});
</script>