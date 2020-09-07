<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
    <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css">
    <style type="text/css">
    /* 콘텐츠 시작 for top_bar */
    #content{
        padding-top: 75px;
    }
    /*폼 테두리 제거*/
    fieldset{
        border:none;
    }
    /*폼 전체 크기*/
    .form-horizontal{
        margin: auto;
        width: 360px;
    }
    /*폼 제목*/
    .form-horizontal legend{
        text-align: center;
        font-size: 2em;
    }

    /*폼 제목 구분선*/
    .form-horizontal hr{
        width:97%;
        margin-top: 30px;
        margin-bottom: 30px;
    }

    /*페이지 설명*/
    .form-horizontal p{
        text-align: center;
        font-size: 1.2em;
    }

    .form-horizontal .form-group{
        margin: 40px auto;
        width: 90%;
    }

    .form-horizontal .form-group label{
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

   .form-horizontal input {
    width: 100%;
    height: 35px;
    line-height: 35px;
    padding-top: 3px;
    padding-bottom: 3px;
    border: 1px solid #FF3253;
    border-radius:  0 4px 4px 4px  ;
    box-sizing: border-box;
}

/* 버튼을 포함한 입력요소 */
.form-horizontal .inner_btn {
    float: left;
    width: 70%;
    border-radius: 4px 0px 0px 4px;
    border-right: none;
}

/* 입력요소에 포함된 btn */
.form-horizontal .check_btn {
    float: left;
    width: 30%;
    box-sizing: border-box;
    background-color: #b9062d;
    line-height: 100%;
    border: 0;
    border-radius: 0 4px 4px 0;
    color: #fffbfc;
    font-size: 0.8em;
    font-weight: 550;
}

/* 메일 발송 버튼 */
#send_btn{
    background-color:  #b9062d;
    border-radius: 4px;
    border: 0px;
    width: 50%;
    color: #fffbfc;
}

#next_box{
    margin: auto;
    text-align: center;
}
#to_submit{
    margin-top: 30px;
    background-color:#b9062d;
    line-height: 100%;
    border-radius: 4px;
    border: 0px;
    width: 100px;
    color: #fffbfc;
}

#email_guide{
    text-align: left;
    font-size: 0.7em;
    position: relative;
	top:3px;
}

#email_miss_header {
    display: block;
    width:90%;
    font-size: 20px;
    height: 40px;
    border-bottom: 1px solid #e1e1e1;
    margin:auto;
    margin-bottom: 12px;
}

#email_miss{
    display: block;
    width: 95%;
    font-size: 16px;
    margin: auto;
}

#swal_box{
    text-align: center;
    margin: auto;
}

.input_Explanation {
    line-height: 25px;
    font-size: 0.7em;
    color: #E61A3F;
}

.hidden {
    visibility: hidden;
}


#swal_pw{
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

#swal_pw_re{
    display: block;
    width: 100%;
    background-color: #FFFBFC;
    height: 40px;
    border: 2px solid black;
    line-height: 40px;
    margin-top: 5px;
    border-radius: 10px;
    text-align: center;
}



</style>
</head>

<body>

    <div id="container">
        <%@ include file="assets/inc/sign_top_bar.jsp" %>

        <div id="content">
            <form class="form-horizontal" id="myform">

                <fieldset>
                    <legend>비밀번호 찾기</legend>
                    <hr>
                    <p style="line-height: 21px;">가입하실 때 본인확인<br>하셨던
                       이메일 주소와 일치해야<br>인증번호를
                   받을 수 있습니다.</p>
                   <div id="id_box"class="form-group">
                    <label for="user_name" style="width: 45px">이름</label>
                    <input type="text" name="user_name" id="user_name" >
                    <span class="input_Explanation hidden" id="name_guide">이름이 한글이 아닙니다.</span>
                </div>
                <div id="email_box"class="form-group">
                    <label for="email" style="width: 55px">이메일</label> <input
                    type="email" name="email" class="inner_btn" id="email" style='border-radius: 0px 0px 0px 4px;'> <input
                    type="button" class="check_btn" value="인증번호 받기" id="send_key">
                    <hr style="border: none; margin-top: 0px; margin-bottom: 7px;">
                    <input type="text" name="key_num" class="inner_btn" id="key_num">
                    <input type="button" class="check_btn" value="인증번호 확인"
                    id="check_key">
                    <br>
                    <span id="email_guide">인증번호가 오지 않나요?</span>

                </div>
                <div id="next_box"class="form-group">
                    <div class="submit_box">
                        <input type="submit" name="submit" id="to_submit" value="다음">
                    </div>
                </div>

            </fieldset>
        </form>
    </div>
</div>
<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js"></script>
<script>
	var sessionID = "${id_check}";
    var email_reg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
            var key = "3122311#@@#3";//메일 인증번호 난수
            var isSend = false;//메일 보냈는지 체크
            var pass_key = false;
        //난수 생성 함수
        function createRandomNumber() {
            key = "";
            for(var i = 0; i<6; i++){
                key+=Math.floor(Math.random()* 10);
            }
            	console.log(key);
                return key;///
            }

            //이메일 전송 함수
            function sendEmail(email){(function(){
                key = createRandomNumber();
                var emailC = {
                    host: "CLIP",//제목
                    contents: key,//내용
                    target: email//수신자
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
        //이메일 인증 가이드 메시지 박스
        $("#email_guide").click(function(){
           swal({
            html:
            "<div id='swal_box'>"+
            "<span id='email_miss_header'>인증메일이 오지 않나요?</span>"+
            "<span id='email_miss'>발송한 메일이 스팸"+
            " 메일로<br>분류된 것은 아닌지 확인해 주세요.<br> "+
            "스팸 메일함에도 메일이 없다면,<br>다시 한번 인증번호"+
            " 받기를 눌러주세요</span>"+
            "</div>",
            showConfirmButton: false,
            showCancelButton: true,
            cancelButtonColor: "#FF3253",
            cancelButtonText: "확인"
        });
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
        });

        //인증번호 발송 버튼 클릭
        $("#send_key").click(function() {
            var name_val = $("#user_name").val();
            var email_val = $("#email").val();
            //이메일 입력 안할시
            if (!$("#email").val()) {
                swal({
                    html: "<b>이메일을 입력해주세요.</b>",    // 내용
                    type: "error",  // 종류
                    confirmButtonText: "확인", // 확인버튼 표시 문구
                    confirmButtonColor: "#ff3253", // 확인버튼 색상
                });
                //이메일 양식에 맞지 않을때
            }else if (!email_reg.test($("#email").val())) {
                swal({
                    html: "<b>이메일 양식에 맞지 않습니다.</b>",    // 내용
                    type: "error",  // 종류
                    confirmButtonText: "확인", // 확인버튼 표시 문구
                    confirmButtonColor: "#ff3253", // 확인버튼 색상
                });
                $('#email').val("");
                $("#email").focus();
                return false;
                //이메일 양식에 맞는 값 입력시
            } else {
                //post통신
                $.post('searchUserToChangePW.do',{name:name_val, email:email_val, id:sessionID},function(req){
                    //입력받은 이름과 이메일이 회원정보와 일치할 경우
                    if(req == '1'){
                        swal({
                            html: "<b>이메일 발송 완료</b>",    // 내용
                            type: "success",  // 종류
                            confirmButtonText: "확인", // 확인버튼 표시 문구
                            confirmButtonColor: "#ff3253", // 확인버튼 색상
                        });
                        sendEmail($("#email").val());
                        isSend = true;//이메일 발송
                        $("#email").prop('disabled','true');
                    //인증번호 타이머 구현해야함
                }else{
                    //입력받은 이름과 이메일이 회원정보와 일치하지 않는 경우
                  swal({
                      html: "<b>아이디와 이름이 가입하셨던 이메일과 일치해야합니다.</b>",    // 내용
                      type: "error",  // 종류
                      confirmButtonText: "확인", // 확인버튼 표시 문구
                      confirmButtonColor: "#ff3253", // 확인버튼 색상
                  });
               }
                })

            }

        })
        //인증 번호 확인 버튼 클릭
        $("#check_key").click(function() {
            //인증번호가 일치할 경우
            if($("#key_num").val() == key) {
                swal({
                    html: "<b>인증되었습니다.</b>",    // 내용
                    type: "success",  // 종류
                    confirmButtonText: "확인", // 확인버튼 표시 문구
                    confirmButtonColor: "#ff3253", // 확인버튼 색상
                });
                pass_key = true;
                $("#key_num").prop('disabled','true');
                //인증번확 일치하지 않는 경우
            } else {
                swal({
                    html: "<b>인증번호가 일치하지 않습니다.</b>",    // 내용
                    type: "error",  // 종류
                    confirmButtonText: "확인", // 확인버튼 표시 문구
                    confirmButtonColor: "#ff3253", // 확인버튼 색상
                });
            }
        });
        //submit처리될때 컨펌창으로 조회된 정보 띄우고
        //버튼 각각 로그인 페이지랑 비밀번호찾기로 연결
        $("#to_submit").click(function(e){
            e.preventDefault();
                 var email_val = $("#email").val();
                 var name = $('input[name=user_name]');
                 if(!/^[가-힣]*$/i.test(name.val())
                         ||!name.val()){
                         swal({
                             html: "<b>이름이 잘못되었습니다.</b>",    // 내용
                             type: "error",  // 종류
                             confirmButtonText: "확인", // 확인버튼 표시 문구
                             confirmButtonColor: "#ff3253", // 확인버튼 색상
                         });
                     name.val("");
                 }else if(!isSend){
                     swal({
                         html: "<b>인증번호 받기를 클릭해주세요.</b>",    // 내용
                         type: "error",  // 종류
                         confirmButtonText: "확인", // 확인버튼 표시 문구
                         confirmButtonColor: "#ff3253", // 확인버튼 색상
                     });
                 }else if(!pass_key){
                     swal({
                         html: "<b>인증번호 확인을 클릭해주세요.</b>",    // 내용
                         type: "error",  // 종류
                         confirmButtonText: "확인", // 확인버튼 표시 문구
                         confirmButtonColor: "#ff3253", // 확인버튼 색상
                     });
                 }else{

            swal({

                showConfirmButton: true,
                showCancelButton: false,
                confirmButtonColor: "#FF3253",
                confirmButtonText: "<span style='color:#FFFBFC; font-weight:bold'>변경 확인</span>",
                showCloseButton: true,
                allowOutsideClick: false,
                background: '#FFFBFC url(assets/img/logo_swal.png) no-repeat center 10px',
                html:"<input type='password' id='swal_pw' class='swal_body' placeholder='새 비밀번호'>"+
                    "<input type='password' id='swal_pw_re'class='swal_body' placeholder='비밀번호 확인'>"



            }).then(function(e){
                var pw = $("#swal_pw").val();//비밀번호
                var re = $("#swal_pw_re").val();//비밀번호 확인

                if(e.value){//변경 확인 버튼 눌림
                    if(!pw||!re){//비밀번호와 비밀번호 확인 둘중 하나라도 공란
                        swal({
                            showConfirmButton:false,
                            type:'error',
                            html: "<b>비밀번호를 입력해주세요.</b>",
                            timer: 1500
                        }).then(function(){
                            $("#to_submit").click();//비밀번호 변경 alert창 재실행
                        })

                    }else if(pw.length < 8 || pw.length > 16) {//입력값 길이 불만족
                        swal({
                            html : "<b>비밀번호는 8자 이상 16자 이하여야합니다.</b>",
                            type : "error",
                            timer : 2000,
                            showConfirmButton:false
                        }).then(function(){
                            $("#to_submit").click();//비밀번호 변경 alert창 재실행
                        })
                    }else if(pw != re){//비밀번호와 비밀번호 확인 불일치
                        swal({
                            html : "<b>비밀번호가 일치하지 않습니다.</b>",
                            type : "error",
                            showConfirmButton : false,
                            timer : 1500
                        }).then(function(){
                            $("#to_submit").click();//비밀번호 변경 alert창 재실행
                        })
                    }else if(pw.indexOf(" ",0)!=-1){
						swal({
							html : "<b>비밀번호에 공백이 포함되어있습니다.</b>",
							type : "error",
							showConfirmButton : false,
							timer : 1500
							}).then(function(){
	                            $("#to_submit").click();//비밀번호 변경 alert창 재실행
	                        })
                    }else{//비밀번호 변경 실행
                    	$.post("searchpwToChange.do",{pw:pw},function(){
                			swal({
                    			html: "<b>비밀번호가 변경되었습니다.</b>",
                    			 type : "success",
                                 timer : 1400,
                                 showConfirmButton: false,
                                 allowOutsideClick: false
                             }).then(function(){
                            	 $(location).attr('href','Login');
                    		})
                		})
                }
                }

            })



        
    		}
        })



            </script>
        </body>

        </html>