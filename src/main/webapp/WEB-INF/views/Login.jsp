<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
<link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css">
<link rel="stylesheet" href="assets/plugins/ajax/ajax_helper.css">
<style type="text/css">
* {
	font-family: 'Nanum Gothic', sans-serif;
}

/* logo box */
.logo {
	padding-top: 95px;
	padding-bottom: 30px;
	width: 100%;
	text-align: center;
}

/* logo text */
.logo h1.to_home {
	text-indent: -10000px;
}
/* logo img */
.logo img.to_home {
	width: 250px;
	margin: auto;
	padding-top: 10px;
}

/* login box */
.form_horizontal {
	width: 300px;
	text-align: center;
	margin: auto;
}

/*text box*/
.form_horizontal .form_control {
	width: 275px;
	height: 30px;
	margin: 5px;
	border: 1px solid #000;
	border-radius: 5px;
	text-align: center;
	background-color: #fffbfc;
}

.form_horizontal .form_control:focus {
	background-color: #f0f0f0;
}

/*login button*/
.form_horizontal .to_login {
	width: 280px;
	font-size: 20px;
	font-weight: bold;
	height: 32px;
	background-color: #ff3253;
	border: 0;
	border-radius: 5px;
	color: #fffbfc;
	margin-top: 5px;
}

/* ID background img */
.form_horizontal .id_control {
	background-image: url('assets/img/id_icon_black.png');
	background-position: center left;
	background-repeat: no-repeat;
	background-size: 25px;
}
/* PW background img */
.form_horizontal .pw_control {
	background-image: url('assets/img/pw_icon_black.png');
	background-position: center left;
	background-repeat: no-repeat;
	background-size: 25px;
}
/* link box */
.link {
	width: 350px;
	margin: 20px auto;
	text-align: center;
}

/* link border */
.link span {
	display: inline-block;
	border-right: 1px solid black;
	padding-right: 5px;
	padding-left: 5px;
}

.link span:last-child {
	border-right: none;
}

/* link font */
.link a {
	text-decoration: none;
	font-size: 0.8em;
	color: black;
}
</style>
</head>

<body>
	<!-- content box -->
	<div id="content">
		<!-- logo box -->
		<div class="logo">
			<!-- logo text -->
			<h1 class="to_home">CLIP</h1>
			<!-- logo img -->
			<a href="home"><img src="assets/img/logo.png"
				class="to_home"></a>
		</div>
		<!-- login box -->
		<form name="login" class="form_horizontal" action="login.do" method="post">
			<!-- ID text box -->
			<input type="text" id="user_id" name="user_id" class="form_control id_control"
				placeholder="아이디를 입력하세요"> <br>
			<!-- PW text box -->
			<input type="password" id="user_pw" name="user_pw" class="form_control pw_control"
				placeholder="비밀번호를 입력하세요">
			<!-- login button -->
			<input type="submit" name="to_submit" class="to_login" id="submit_btn" value="로그인">
		</form>
		<!-- page link -->
		<div class="link">
			<span><a href="Search_id_for_email">아이디 찾기&nbsp;</a></span> <span><a
				href="Search_password_for_id">비밀번호 찾기&nbsp;</a></span> <span><a
				href="Sign_up_agree">회원가입</a></span>
		</div>
	</div>
	<!-- BOT BAR -->
	<%@ include file="assets/inc/bot_bar.jsp" %>

	<script src="assets/plugins/validate/jquery.validate.min.js"></script>
	<script src="assets/plugins/validate/additional-methods.min.js"></script>
	<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="assets/plugins/ajax/ajax_helper.js"></script>
	<script>
		$(function(){
			$(".bot_bar_icon").eq(0).attr("src", "assets/img/home_icon.png");
			$("#submit_btn").click(function(e){
				e.preventDefault();
				var id_val = $("#user_id").val();
				var pw_val = $("#user_pw").val();

				if (!id_val || !pw_val) {
					swal({
	                    html: "<b>아이디 또는 비밀번호를 확인해주세요.</b>",    // 내용
	                    type: "error",  // 종류
	                    confirmButtonText: "확인", // 확인버튼 표시 문구
	                    confirmButtonColor: "#ff3253", // 확인버튼 색상
	                });
					return false;
				}

				$.post('login.do',{user_id:id_val, user_pw:pw_val},function(req){
                    if(req == '1'){
                    	$(location).attr('href','home');
                    }else{
                    	swal({
    	                    html: "<b>아이디 또는 비밀번호를 확인해주세요.</b>",    // 내용
    	                    type: "error",  // 종류
    	                    confirmButtonText: "확인", // 확인버튼 표시 문구
    	                    confirmButtonColor: "#ff3253", // 확인버튼 색상
    	                });
                    }
                })
			})

		})
	</script>
</body>
</html>