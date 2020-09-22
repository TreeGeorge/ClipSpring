<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
	<link rel="stylesheet" href="assets/plugins/datepicker/jquery-ui.min.css">
	<link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css">
	<link rel="stylesheet" href="assets/plugins/ajax/ajax_helper.css">
	<style type="text/css">
		.datepicker-container{
			font-family : 'Nanum Gothic', sans-serif;
		}
		/* content 시작 위치 */
		.content {
			margin-top: 75px;
		}
		/* 폼 제목 */
		.form-horizontal legend {
			text-align: center;
			font-size: 2em;
		}
		/* 제목 구분선 */
		.form-horizontal hr {
			width: 97%;
			margin-top: 30px;
			margin-bottom: 30px;
		}
		/* 폼 테두리 제거 */
		fieldset {
			width: 360px;
			border: none;
		}

		/* 폼 가운데 정렬 및 전체 크기 설정 */
		.form-horizontal {
			margin: auto;
			width: 360px;
		}

		/* 입력요소 크기 설정 */
		.form-horizontal .group {
			width: 90%;
			margin: auto;
		}

		/* 라벨 width값은 각각 직접 할당 */
		.form-horizontal label {
			display: block;
			background-color: #FF3253;
			color: #fffbfc;
			border: 0px;
			border-bottom: none;
			border-radius: 4px 4px 0 0;
			padding: 3px;
			height: 20px;
			line-height: 20px;
			text-align: center;
			margin-top: 15px
		}

		/* text박스 (아이디 / 비밀번호 / 이름 / 이메일 / 생년월일) */
		.form-horizontal input {
			width: 100%;
			height: 35px;
			line-height: 35px;
			padding-top:  3px;
			padding-bottom: 3px;
			border: 1px solid #FF3253;
			border-radius:  0 4px 4px 4px  ;
			box-sizing: border-box;
		}

		/* text박스 설명 (아이디 / 비밀번호) */
		.input_Explanation {
			line-height: 25px;
			font-size: 0.7em;
			color: #E61A3F;
		}

		/* select 박스 (성별) */
		.form-horizontal select {
			width: 100%;
			height: 35px;
			line-height: 35px;
			padding-top:  3px;
			padding-bottom: 3px;
			border: 1px solid #FF3253;
			border-radius:  0 4px 4px 4px  ;
		}

		/* submit 버튼 여백 설정용 박스 */
		.submit_box {
			width: 100%;
			text-align: center;
			padding-top: 60px;
			padding-bottom: 30px;
		}

		/* submit 버튼 */
		#to_submit {
			width: 100px;
			height: 40px;
			line-height: 100%;
			background-color: #b9062d;
			border: 0;
			border-radius: 5px;
			color: #fffbfc;
		}

		/* 버튼을 포함한 입력요소 */
		.form-horizontal .inner_btn {
			float: left;
			width: 70%;
			border-radius: 0px 0px 0px 4px;
			border-right: none;
		}

		/* 입력요소에 포함된 btn */
		.form-horizontal .check_btn {
			float: left;
			width: 30%;
			height:35px;
			box-sizing: border-box;
			background-color: #b9062d;
			border: 0;
			line-height: 100%;
			border-radius: 0 4px 4px 0;
			color: #fffbfc;
			font-size: 0.7em;
			font-weight: 550;
		}

		/*비밀번호 확인*/
		span.hidden {
			visibility: hidden;
		}

	</style>


</head>

<body>

	<div id="container">
		<%@ include file="assets/inc/sign_top_bar.jsp" %>

				<div class="content">
					<!-- 회원 정보 폼 -->
					<form class="form-horizontal">
						<fieldset>
							<legend>회원가입</legend>
							<hr>
							<div class="group">
								<label for="user_id" style="width: 55px">아이디</label>
								<div class="clearfix">
									<input type="text" id="user_id" name="user_id" class="inner_btn"
									value=""> 
									<button class="check_btn"  id="overlap">중복확인</button>
								</div>
								<!-- 설명 -->
								<span id="id_guide" class="input_Explanation hidden">아이디는
								영문과 숫자로 이루어진 5자 이상, 12자 이하여야 합니다.</span> <label for="user_pw"
								style="width: 75px">비밀번호</label> <input type="password"
								name="user_pw" id="user_pw">
								<!-- 설명 -->
								<br>
								<span id="pw_guide" class="input_Explanation hidden">비밀번호는
								8자 이상 16자 이하여야 합니다.</span> <label for="user_pw" style="width: 100px">비밀번호
								확인</label> <input type="password" name="user_pw_re"> <span
								class="input_Explanation hidden" id="pw_re_guide">비밀번호가
							일치하지 않습니다.</span> <label for="user_name" style="width: 45px">이름</label>
							<input type="text" name="user_name" id="user_name"> <span
							class="input_Explanation hidden" id="name_guide">이름이 한글이 아닙니다.</span> <label
							for="birthdate" style="width: 75px">생년월일</label> 
							<input autocomplete="off" type="text" name="birthdate" id="user_birth"> <!-- datepicker -->
							<label for="gender" style="width: 45px">성별</label> 
							<select name="gender" id="user_gender">
								<option value="">&nbsp;성별을 선택해주세요</option>
								<option value="M">&nbsp;남</option>
								<option value="F">&nbsp;여</option>
							</select> <label for="email" style="width: 55px">이메일</label> <input
							type="email" name="email" class="inner_btn" id="email"> 
							<button class="check_btn"  id="send_key">인증번호 받기</button>
							<hr style="border: none; margin-top: 0px; margin-bottom: 7px;">
							<input type="text" name="key_num" class="inner_btn" id="key_num" style='border-radius : 4px 0 0 4px;'>
							<button class="check_btn" 
							id="check_key" >인증번호 확인</button>
							<div class="submit_box">
								<button name="submit" id="to_submit" >가입하기</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<script src="assets/js/jquery-3.5.1.min.js"></script>
		<script src="assets/plugins/validate/jquery.validate.min.js"></script>
		<script src="assets/plugins/validate/additional-methods.min.js"></script>
		<script src="assets/plugins/datepicker/jquery-ui.min.js"></script>
		<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js"></script>
		<script>
			$(function() {
				var id_check = false;
				var pass_id = false;
				var pass_key = false;
				var pass_name = false;
				var key = "123123!@!@#!@#";
				var email_reg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

			//난수 생성
			function createRandomNumber() {
				key = "";
				for(var i = 0; i<6; i++){
					key+=Math.floor(Math.random()* (9 - 0 + 1)) + 0;
				}
				console.log(key);
				return key;///
			}

			//메일 발송
			function sendEmail(email){
				(function(){
					key = createRandomNumber();
					var emailC = {
						host: 'CLIP',
						contents: key,
						target: email
					}

					emailjs.init("user_RKWHiElHFbYxB4cY7IsJ9");
					emailjs.send("clip","template_7SpdbekT",emailC)
					.then(function(response) {
						console.log("SUCCESS. status=%d, text=%s", response.status, response.text);
					}, function(err) {
						console.log("FAILED. error=", err);
					});

				})();
			}
			$(function(){
                $("#user_birth").datepicker({
                    dateFormat: 'yy-mm-dd', //Input Display Format 변경
                    showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                    showMonthAfterYear:true,
                    changeYear: true,
                    changeMonth: true,
                    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
                    dayNamesMin: ['일','월','화','수','목','금','토'],
                    minDate : "-100Y",
                    maxDate : "-14Y"
                });
                
            })
			
			function checkAge(){
					//선택된 날자 값 변수에 저장
					var date = $("input[name=birthdate]").val();

					//만 14세 date객체 생성 및 비교할 양식에 맞게 정제
					var target = new Date();
					var yy = target.getFullYear() - 14;
					var dd = target.getMonth() + 1;
					if(dd<10){ dd = "0" + dd }
						var mm = target.getDate();
					if(mm<10){ mm = "0" + mm }
						target = "" + yy + dd + mm;

					//yyyy-mm-dd -> yyyymmdd
					date = date.replace("-","");
					date = date.replace("-","");

					//비교할 값들을 정수화
					target = parseInt(target);
					date = parseInt(date);

					//14세 미만인경우 true 리턴
					if(date>target){
						return true;
					}
					return false;
			}

			//생년월일 선택
			$("input[name=birthdate]").focusout(function(){
				if(checkAge()){
					$(this).val("");
					swal({
	                    html: "<b>만 14세 이상만 가입 가능합니다.</b>",    // 내용
	                    type: "error",  // 종류
	                    confirmButtonText: "확인", // 확인버튼 표시 문구
	                    confirmButtonColor: "#ff3253", // 확인버튼 색상
	                });
				}
			})

			
				//인증번호 받기 클릭
				$("#send_key").click(function(e) {
					e.preventDefault();
					//이메일 미 입력시
					if (!$("#email").val()) {
						swal({
		                    html: "<b>이메일을 입력해주세요.</b>",    // 내용
		                    type: "error",  // 종류
		                    confirmButtonText: "확인", // 확인버튼 표시 문구
		                    confirmButtonColor: "#ff3253", // 확인버튼 색상
		                });
						//이메일 양식이 틀릴시
					}else if(!email_reg.test($("#email").val())) {
						swal({
		                    html: "<b>이메일 양식에 맞지 않습니다.</b>",    // 내용
		                    type: "error",  // 종류
		                    confirmButtonText: "확인", // 확인버튼 표시 문구
		                    confirmButtonColor: "#ff3253", // 확인버튼 색상
		                });
						$('#email').val("");
						$("#email").focus();
						return false;
						//정상 값 입력시
					} else {
						$.post('emailOverlapCheck.do', {email : $("#email").val()}, 
							function(req) {
								console.log($("#email").val());
							if(req=='1'){
								swal({
				                    html: "<b>중복된 이메일입니다.</b>",    // 내용
				                    type: "error",  // 종류
				                    confirmButtonText: "확인", // 확인버튼 표시 문구
				                    confirmButtonColor: "#ff3253", // 확인버튼 색상
				                });
								$("#email").val("");
							}
							else{
								//email발송
							swal({
			                    html: "<b>이메일 발송 완료</b>",    // 내용
			                    type: "success",  // 종류
			                    confirmButtonText: "확인", // 확인버튼 표시 문구
			                    confirmButtonColor: "#ff3253", // 확인버튼 색상
			                });
							sendEmail($("#email").val());
							$("#email").prop('disabled','true');
							}
						})
					}

				})
				//인증번호 확인 클릭
				$("#check_key").click(function(e) {
					e.preventDefault();
					//값 일치 시
					if ($("#key_num").val() == key) {
						swal({
		                    html: "<b>인증되었습니다.</b>",    // 내용
		                    type: "success",  // 종류
		                    confirmButtonText: "확인", // 확인버튼 표시 문구
		                    confirmButtonColor: "#ff3253", // 확인버튼 색상
		                });
						pass_key = true;
						$("#key_num").prop('disabled','true');
					} //값 불일치 
					else {
						swal({
		                    html: "<b>인증번호가 일치하지 않습니다.</b>",    // 내용
		                    type: "error",  // 종류
		                    confirmButtonText: "확인", // 확인버튼 표시 문구
		                    confirmButtonColor: "#ff3253", // 확인버튼 색상
		                });
					}
				})
				
				//아이디 중복 확인 클릭
				$("#overlap").click(function(e) {
					e.preventDefault();
					var id_val = $("#user_id").val();
					//아이디 미 입력시
					if (id_val == "") {
						swal({
		                    html: "<b>아이디를 입력해주세요.</b>",    // 내용
		                    confirmButtonText: "확인", // 확인버튼 표시 문구
		                    confirmButtonColor: "#ff3253", // 확인버튼 색상
		                });
					}
					// 
					else {
						$.post('idOverlapCheck.do', {id : id_val}, function(req) {
							if(!id_check){
								swal({
				                    html: "<b>아이디 입력 양식을 확인해주세요.</b>",    // 내용
				                    type: "error",  // 종류
				                    confirmButtonText: "확인", // 확인버튼 표시 문구
				                    confirmButtonColor: "#ff3253", // 확인버튼 색상
				                });
							}else if (req != '1') {
								swal({
				                    html: "<b>사용 가능한 아이디 입니다.</b>",    // 내용
				                    type: "success",  // 종류
				                    confirmButtonText: "확인", // 확인버튼 표시 문구
				                    confirmButtonColor: "#ff3253", // 확인버튼 색상
				                });
								pass_id =true;
								$("#user_id").prop('disabled','true');
								
							} else {
								swal({
				                    html: "<b>중복된 아이디 입니다.</b>",    // 내용
				                    type: "error",  // 종류
				                    confirmButtonText: "확인", // 확인버튼 표시 문구
				                    confirmButtonColor: "#ff3253", // 확인버튼 색상
				                });
								pass_id = false;
							}
						})
					}
				})

			//id 양식에 맞지 않을때 가이드 노출
			$('input[name=user_id]').keyup(function() {
				val = $(this).val();
				//영문과 숫자 조합이 아닌경우
				if (!(/^[a-zA-Z0-9]*$/.test(val))) {
					$("#id_guide").removeClass('hidden');
					id_check = false;
				}
				//입력값이 12자보다 많거나 5자 미만인 경우
				else if ($(this).val().length > 12 || $(this).val().length < 5) {
					$("#id_guide").removeClass('hidden');
					id_check = false;
				}
				//정상 값이 입력된 경우
				else {
					$("#id_guide").addClass('hidden');
					id_check = true;
				}

				//최대 입력 길이 제한
				if ($(this).val().length > 20) {
					$(this).val($(this).val().substring(0, 20));
				}
			})

			//비밀번호 양식에 맞지않을때 가이드 노출
			$('input[name=user_pw]').keyup(function() {
				val = $(this).val();
					//입력값이 8자보다 적거나 16자보다 많은 경우
					if ($(this).val().length < 8 || $(this).val().length > 16) {
						$("#pw_guide").removeClass('hidden');
					}
					//정상 값이 입력된 경우
					else {
						$("#pw_guide").addClass('hidden');
					}

					//최대 입력 길이 제한
					if ($(this).val().length > 20) {
						$(this).val($(this).val().substring(0, 20));
					}
				})

			//비밀번호 일치하지 않을때 가이드 노출
			$('input[name=user_pw_re]').keyup(function() {
				//비밀번호와 비밀번호 확인 값이 일치하지 않을 경우
				if (!($(this).val() == $('input[name=user_pw]').val())) {
					$('#pw_re_guide').removeClass('hidden');
				}
				//일치할 경우
				else {
					$("#pw_re_guide").addClass('hidden');
				}

				//최대 입력 길이 제한
				if ($(this).val().length > 20) {
					$(this).val($(this).val().substring(0, 20));
				}

			})

			//이름이 한글이 아닐때 가이드 노출

			$('input[name=user_name]').keyup(function() {
				var val = $(this).val();

				//입력값이 한글이 아닌경우
				if (!(/^[ㄱ-ㅎ가-힣]*$/i.test(val))) {
					$("#name_guide").removeClass('hidden');
				}
				//정상 값이 입력된 경우
				else {
					$("#name_guide").addClass('hidden');
				}

				//이름에
			})

			/** 플러그인의 기본 설정 옵션 추가 */
			jQuery.validator.setDefaults({
				onkeyup : false, // 키보드입력시 검사 안함
				onclick : false, // <input>태그 클릭시 검사 안함
				onfocusout : false, // 포커스가 빠져나올 때 검사 안함
				showErrors : function(errorMap, errorList) { // 에러 발생시 호출되는 함수 재정의
					// 에러가 있을 때만..
					if (this.numberOfInvalids()) {
						// 0번째 에러 메시지에 대한 javascript 기본 alert 함수 사용
						//alert(errorList[0].message);
						// 0번째 에러 발생 항목에 포커스 지정
						//$(errorList[0].element).focus();

						swal({
							title : "에러",
							text : errorList[0].message,
							type : "error"
						}).then(function(result) {
							// 창이 닫히는 애니메이션의 시간이 있으므로,
							// 0.1초의 딜레이 적용 후 포커스 이동
							setTimeout(function() {
								$(errorList[0].element).val('');
								$(errorList[0].element).focus();
							}, 100);
						});
					}
				},
				submitHandler: function(form){
					var id_val = $("#user_id").val();
					var pw_val = $("#user_pw").val();
					var edit_val = "";
					
					var date = new Date();
					var yy = date.getFullYear();
					var dd = date.getMonth() + 1;
					if(dd<10){ dd = "0" + dd }
					var mm = date.getDate();
					if(mm<10){ mm = "0" + mm }
					edit_val = "" + yy+"-" + dd+"-" + mm;
					
					var email_val = $("#email").val();
					var name_val = $("#user_name").val();
					var birth_val = $("#user_birth").val();
					var gender_val = $("#user_gender").val();
					if(!pass_id){
						swal({
		                    html: "<b>아이디 중복검사를 진행해주세요.</b>",    // 내용
		                    type: "error",  // 종류
		                    confirmButtonText: "확인", // 확인버튼 표시 문구
		                    confirmButtonColor: "#ff3253", // 확인버튼 색상
		                });
						return false;
					}
					if(pw_val.indexOf(" ",0)!=-1){
						swal({
		                    html: "<b>비밀번호에 공백이 포함되어있습니다.</b>",    // 내용
		                    type: "error",  // 종류
		                    confirmButtonText: "확인", // 확인버튼 표시 문구
		                    confirmButtonColor: "#ff3253", // 확인버튼 색상
		                });
						return false;
					}
					if(!pass_key){
						swal({
		                    html: "<b>이메일 인증을 진행해주세요.</b>",    // 내용
		                    type: "error",  // 종류
		                    confirmButtonText: "확인", // 확인버튼 표시 문구
		                    confirmButtonColor: "#ff3253", // 확인버튼 색상
		                });
						return false;
					}
					$.post('signUp.do', {id : id_val, name : name_val,
					email : email_val, pw : pw_val, edit: edit_val, birth : birth_val,
					gender : gender_val}, 
					function(){
						//java signUP함수화시키고 1리턴 시켜서 swal포함 시키기
						swal({
                            timer:1500,
                            html:"<div style='font-weight: bold; margin-bottom: 20px;'>회원가입이 완료되었습니다.</div>",
                            type:"success",
                            allowOutsideClick: false,
                            showConfirmButton: false
                        }).then(function(){
							location.href = "Login";
						})
						})
					
					
				}
			});

			/** 유효성 검사 추가 함수 */
			$.validator.addMethod("kor", function(value, element) {
				return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value);
			});
			/** form태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
			$(".form-horizontal").validate({
				/** 입력검사 규칙 */
				rules : {
					// [아이디] 필수 + 알파벳,숫자 조합만 허용
					user_id : {
						required : true,
						alphanumeric : true
					},
					// [비밀번호] 필수 + 글자수 길이 제한
					user_pw : {
						required : true,
						minlength : 8,
						maxlength : 16
					},
					// [비밀번호 확인] 필수 + 특정 항목과 일치
					user_pw_re : {
						required : true,
						equalTo : "input[name=user_pw]"
					},
					// [이름] 필수
					user_name : {
						required : true,
						kor : true
					},
					// [생년월일] 필수 + 날짜 형식 일치 필요
					birthdate : {
						required : true,
						date : true
					},
					//성별
					gender : "required",
					// [이메일] 필수 + 이메일 형식 일치 필요
					email : {
						required : true,
						email : true
					},
					key_num : "required"
				},
				/** 규칙이 맞지 않을 경우의 메시지 */
				messages : {
					user_id : {
						required : "아이디를 입력하세요.",
						alphanumeric : "아이디는 영어,숫자만 입력 가능합니다."
					},
					user_pw : {
						required : "비밀번호를 입력하세요.",
						minlength : "비밀번호는 8글자 이상 입력하셔야 합니다.",
						maxlength : "비밀번호는 최대 16자까지 가능합니다."
					},
					user_pw_re : {
						required : "비밀번호 확인값을 입력하세요.",
						equalTo : "비밀번호 확인이 잘못되었습니다."
					},
					user_name : {
						required : "이름을 입력하세요.",
						kor : "이름은 한글만 입력 가능합니다."
					},
					email : {
						required : "이메일을 입력하세요.",
						email : "이메일 형식이 잘못되었습니다."
					},
					birthdate : {
						required : "생년월일을 입력하세요.",
						date : "생년월일의 형식이 잘못되었습니다."
					},
					gender : {
						required : "성별을 선택해주세요."
					},
					key_num : {
						required :"이메일 인증을 진행해 주세요"
					}
				}
			}); // end validate()
		});
	</script>
</body>

</html>