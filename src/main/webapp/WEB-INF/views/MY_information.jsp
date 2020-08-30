<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
<link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css">


<style>
    .header_border{
        border :1px solid #b8b8b8;
        border-left: none;
        border-right: none;
        box-sizing: border-box;
        height: 40px;
    }
    /*기본정보/결제정보 헤더*/
    .info_header{
        font-size: 1.1em;
        font-weight: bold;
        line-height: 39px;
        float: left;        
        width:60%;
    }

    #info_del{
        background-color: #1a1a1a;
        margin-top: 5px;
    }
    
    /*회원정보 박스*/
    .info_group{
        width: 60%;
        float: left;
    }
    /*아이디/이름/성별/생년월일/이메일 헤더*/
    .info_list{
        font-size: 1em;
        font-weight: bold;
        padding: 10px;
        padding-left: 20px;
    }



    /*아이디/이름/성별/생년월일/이메일 내용*/
    .info_item{
        font-size: 0.9em;
        font-weight: 100;
        display: block; 
        margin-top: 3px;
    }

    /*pw변경 버튼 email변경 버튼 공간*/
    .btn_box{
        float: left;
        width: 40%;
        height :52px;
        text-align: center;
    }

    /*pw변경 버튼 email변경 버튼 공백 공간*/
    .space{
        float: left;
        width: 40%;
        height: 156px;
    }
    
    /*정보변경 버튼*/
    .change_btn{
       margin-top: 11px;
        width: 100px;
        height: 30px;
        border:0;
        border-radius: 4px;
        background-color: #FF3253;
        color: #fff;
        font-size: 0.7em;
        font-weight: bold;
    }
    /*회원탈퇴 임시*/
    #delet_session{
        text-align: right;
        margin-top: 15px;
        padding-right:  30px;
        font-size: 0.8em;
    }
    .swal_body{
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
    #swal_pw{
    margin-top: 110px;
    }
/*카드 swal content*/
.card_body{
    padding-top: 70px;
    height: 200px;
    text-align: left;

}
/*카드번호 입력요소 영역*/
.card_box{
    padding-left: 3px;
}

/*카드번호 입력 텍스트 박스*/
.card_input{
    width: 53px;
    line-height: 23px;
    border : 2px solid black;
    border-radius: 4px;
    text-align: center;
}
#swal_pd{
    padding-left: 175px;
}
#cd_pw{
    margin-left: 94px;
}

.submit_box{
    text-align: center;
	
    padding-bottom: 20px;
}

#card_text{
    text-align: center;
    color: #FF3253;
    font-size: 0.7em;
    line-height: 40px;
}
.card_submit{
	   width: 96px;
        height: 40px;
        border:0;
        border-radius: 4px;
        background-color: #FF3253;
        color: #fff;
        font-size: 0.7em;
        font-weight: bold;
}

#email_send_btn{
    margin:10px;
}

#email_key_check_btn{
    margin:10px;
}

#email_text{
 	text-align: center;
    color: #FF3253;
    font-size: 0.7em;
    line-height: 40px;
}

</style>
</head>

<body>
    <!--전체박스-->
    <div id="container">
        <!-- header -->
        <%@ include file="assets/inc/top_info.jsp" %>
        
        <hr style="padding-top: 40px; border : none; margin: 0;">
        <!-- contnet -->
        <div id="content">
            <div class="header_border" style="border-top: none;">
            <p class="info_header">&nbsp;&nbsp;&nbsp;기본 정보</p>
            <div class="btn_box" style="height: 40px;">
            <input type="button" class="change_btn" id="info_del" value="회원탈퇴">
            </div>
            </div>
            <div class="clearfix" style ='padding-top:8px; padding-bottom:8px;'>
                <div class="info_group">
                    <p class="info_list">아이디<br><span class="info_item " >LSB001</span></p>
                    <p class="info_list">이름<br> <span class="info_item">이세빈</span></p>
                    <p class="info_list">성별<br> <span class="info_item">남자</span></p>
                    <p class="info_list">생년월일<br><span class="info_item">0000-00-00</span></p>
                    <p class="info_list">이메일<br> <span class="info_item">qq4323@gmail.com</span></p>
                </div>
                <div class="btn_box"><input type="button" value="비밀번호 변경" class="change_btn" id="pw_change"></div>
                <div class="space"></div>
                <div class="btn_box"><input type="button" value="이메일 변경" class="change_btn" id="email_change"></div>

            </div>
            <div class="header_border">
            <p class="info_header border">&nbsp;&nbsp;&nbsp;결제 정보</p>
            </div>
            <div class="clearfix" style="border-bottom: 1px solid #b8b8b8; padding-top:8px; padding-bottom:8px;">
                <div class="info_group">
                    <p class="info_list">카드<br><span class="info_item">Ezen Card</span></p>
                </div>
                <div class="btn_box"><input type="button" value="카드정보 등록" class="change_btn" id="card_change"></div>
            </div>
        </div>
            <!-- footer -->
          <%@ include file="assets/inc/footer.jsp" %>
          
        <!-- BOT BAR -->
        <%@ include file="assets/inc/bot_bar.jsp" %>
    </div>

    <script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js"></script>
    <script>
   

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
        
        function cardValueCheck(select){
        	for(var i = 0; i<$(".card_input").length; i++){
             	if($(".card_input")[i].value.length != $(".card_input")[i].maxLength){return false;}
             } return true;
        }
        for(var i = 0; i<$(".card_input").length; i++){
         	if($(".card_input")[i].value.length != $(".card_input")[i].maxLength){
         		swal({
         			html : "값을 모두 입력해주세요.",
         			type : "error",
         			timer : 1300,
         			showConfirmButton : false
         		})
         	}
         }
        
        function nextFocus(e){
    		if(e.target.id=='last_num'&&e.target.value.length==4){
    			$("#first_num").focus();
    			return;
    		}
        	if(e.target.value.length == e.target.maxLength){
         		$(e.target).next().focus();
         		console.log($(e.target.id));
         	}
    	}

        
        $("#pw_change").click(function(){
            swal({
                showConfirmButton: true,
                showCancelButton: false,
                confirmButtonColor: "#FF3253",
                confirmButtonText: "<span style='color:#FFFBFC; font-weight:bold'>변경 확인</span>",
                showCloseButton: true,
                allowOutsideClick: false,
                background: '#FFFBFC url(assets/img/logo_swal.png) no-repeat center 10px',
                html:"<input type='password' id='swal_pw' class='swal_body' placeholder='기존 비밀번호'>"+
                    "<input type='password' id='swal_new_pw'class='swal_body' placeholder='새 비밀번호'>"+
                    "<input type='password' id='swal_new_pw_re'class='swal_body' placeholder='비밀번호 확인'>"
            }).then(function(e){
                //값 입력 후 확인버튼 클릭
                if(e.value){
                    var now_pw = $("#swal_pw").val();
                    var new_pw = $("#swal_new_pw").val();
                    var new_pw_re = $("#swal_new_pw_re").val();

                    //post통신하여 로그인되어있는 아이디 LSB001의 비밀번호와 기존비밀번호 입력값이 일치하는지 여부 판단  
                    $.post("api/search_id.do",{user_id:id, user_pw:now_pw,post : "login"},function(req){
                        //기존 비밀번호 입력값이 정상일 경우
                        if(req.result=='1'){
                        	if(new_pw==""){
                        		swal({
                                    html : "<b>새로운 비밀번호를 입력해주세요.</b>",
                                    type : "error",
                                    timer : 1400,
                                    showConfirmButton: false,
                                    allowOutsideClick: false
                                }).then(function(){
                                    //error메시지 표시 후 재실행
                                    $("#pw_change").click();
                                })
                        	}else if(new_pw!=new_pw_re){
                        		swal({
                                    html : "<b>비밀번호가 일치하지 않습니다.</b>",
                                    type : "error",
                                    timer : 1400,
                                    showConfirmButton: false,
                                    allowOutsideClick: false
                                }).then(function(){
                                    //error메시지 표시 후 재실행
                                    $("#pw_change").click();
                                })
                        	}else{
                        		swal({
                        			html: "<b>비밀번호가 변경되었습니다.</b>",
                        			 type : "success",
                                     timer : 1400,
                                     showConfirmButton: false,
                                     allowOutsideClick: false
                                 }).then(function(){
                                	 //location.reload();
                        		})
                        	}
                             
                        }else{
                            //기존 비밀번호가 올바르지 않을 경우
                            swal({
                                html : "<b>기존 비밀번호가 올바르지않습니다.</b>",
                                type : "error",
                                timer : 1400,
                                showConfirmButton: false,
                                allowOutsideClick: false
                            }).then(function(){
                                //error메시지 표시 후 재실행
                                $("#pw_change").click();
                            })
                        }
                    })
                }
            })
        })

        $("#email_change").click(function(){
        	 pw_pass = false; 
        	
             swal({
                showConfirmButton: true,
                showCancelButton: false,
                confirmButtonColor: "#FF3253",
                confirmButtonText: "<span style='color:#FFFBFC; font-weight:bold'>확인</span>",
                showCloseButton: true,
                allowOutsideClick: false,
                background: '#FFFBFC url(assets/img/logo_swal.png) no-repeat center 10px',
                html:"<input type='password' id='swal_pw' class='swal_body' placeholder='비밀번호'>"
            }).then(function(e){
            	if(e.value){
            		var pw = $("#swal_pw").val();
            		$.post('api/search_id.do',{user_id:id, user_pw:pw,post : "login"},function(req){
            			if(req.result=='1'){ pw_pass = true; }
            		})//end post
            		.then(function(){
            			if(pw_pass){
                			swal({
                                showConfirmButton: false,
                                showCancelButton: false,
                                //confirmButtonColor: "#FF3253",
                                //cancelButtonColor: "#FF3253",
                                //confirmButtonText: "<span style='color:#FFFBFC; font-weight:bold'>메일 전송</span>",
                                //cancelButtonText: "<span style='color:#FFFBFC; font-weight:bold'>변경 하기</span>",
                                showCloseButton: true,
                                allowOutsideClick: false,
                                background: '#FFFBFC url(assets/img/logo_swal.png) no-repeat center 10px',
                                html:"<input type='text' id='swal_pw' class='swal_body' placeholder='이메일을 입력해주세요'>"+
                                    "<input type='text' id='swal_new_pw'class='swal_body' placeholder='인증번호를 입력해주세요'>"+
                                    "<p id='email_text'>&nbsp;</p>"+
                                    "<div class='submit_box'>"+
                                    "<input type='button' class='card_submit' value='메일전송' id = email_send_btn>"+"<input id='email_key_check_btn'type='button' class='card_submit' value='변경하기'>"+
                                    "</div>"
                                })
                                
                                $("#email_send_btn").click(function(){
                                	var email_reg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
                                	
                                    if (!$("#swal_pw").val()) {
                                    	 $("#email_text").html("이메일을 입력해주세요."); 
                                    	 $("#swal_pw").focus();
                                   
                                        //이메일 양식이 틀릴시
                                    }else if(!email_reg.test($("#swal_pw").val())) {
                                    	$("#email_text").html("이메일 양식에 맞지 않습니다."); 
                                        $('#swal_pw').val("");
                                       
                                        //정상 값 입력시
                                    } else {
                                        $.post('api/search_id.do', {email : $("#swal_pw").val(), post : "overlap_email"
                                        }, function(req) {
                                            if(req.result!='-1'){
                                            	$("#email_text").html("이미 사용중인 이메일입니다.");
                                                $("#swal_pw").val("");
                                                $("#swal_pw").focus();
                                            }
                                            else{
                                            $("#email_text").html("메일이 발송되었습니다. 인증번호를 입력해 주세요.");
                                            sendEmail($("#swal_pw").val());
                                            console.log(key);
                                            $("#swal_pw").prop('disabled','true');
                                            }
                                        })
                                     }
                                	
                                	//통과시 
                                	// $("#email_text").html("");
                                	//인증 키 메일 송신
                                	//송신 여부 판별용 변수 true
                                })
                                
                                $("#email_key_check_btn").click(function(){
                                	//송신 여부 판별용 변수가 true가 아니라면
                                	if(key=="none"){
                                		$("#email_text").html("메일전송 버튼을 눌러주세요");
                                		return;
                                	}
                                	//인증키 값이 올바르지않다면
                                	if(key!=$("#swal_new_pw").val()){
                                		$("#email_text").html("인증번호가 올바르지 않습니다.");
                                	}else{//인증키 값이 올바르다면
                                		$(".info_item").eq(4).text($(swal_pw).val());
                                		swal({
                                  		  html : "<b>이메일이 변경되었습니다.</b>",
                                  		  type : "success",
                                  		  timer : 1500,
                                  		  allowOutsideClick: false,
                                  		  showConfirmButton : false
	                                  	  }).then(function(){
	                                  		  //location.reload();
	                                  	  })
                                	}
                                })
                                
                                
                                
                		}else{
                            swal({
                                timer:1500,
                                html:"<b>비밀번호가 다릅니다.</b>",
                                type:"error",
                                allowOutsideClick: false,
                                showConfirmButton: false
                            }).then(function(){
                           	 //비밀번호 틀렸다고 알려주고 카드변경 이벤트 재실행
                                $("#email_change").click();
                            })
                        }
            		})
            		
            		
            	}
            	
                
            })
        })

        //카드 변경 클릭
        $("#card_change").click(function(){
        	pw_pass = false; 
        	//비밀번호 입력 swal
            swal({
                showConfirmButton: true,
                showCancelButton: false,
                confirmButtonColor: "#FF3253",
                confirmButtonText: "<span style='color:#FFFBFC; font-weight:bold'>확인</span>",
                showCloseButton: true,
                allowOutsideClick: false,
                background: '#FFFBFC url(assets/img/logo_swal.png) no-repeat center 10px',
                html:"<input type='password' id='swal_pw' class='swal_body' placeholder='비밀번호'>"
            })//end swal
            .then(function(e){
            	//비밀번호 입력 swal에서 확인 누를 시
                if(e.value){
                    var pw = $("#swal_pw").val();
                    var pw_pass = false;
             		
                    //로그인 되어있는 아이디와 비밀번호의 일치 여부검사
                    $.post('api/search_id.do',{user_id:id, user_pw:pw,post : "login"},function(req){
                    	//비밀번호 일치하면 pw_pass -> true;
                        if(req.result == '1'){ pw_pass = true; }
                        }).then(function(){
                        	 //비밀번호 일치할시
                        	 if(pw_pass){
                 
                                 swal({
                                     showConfirmButton: false,
                                     showCancelButton: false,
                                     showCloseButton: true,
                                     allowOutsideClick: false,
                                    
                                     confirmButtonColor: "#FF3253",
                                    
                                     background: '#FFFBFC url(assets/img/logo_swal.png) no-repeat center 10px',
                                     html:"<div class='card_body'>"+
                                     "<form>"+
                                     "<label style='font-weight:bold; font-size:0.8em;'>&nbsp;카드번호</label><br>"+
                                     "<div class='card_box'>"+
                                         "<input type='text' class='card_input' maxlength='4' style='IME-MODE:disabled;' onkeypress='if((event.keyCode<48)||(event.keyCode>57)) event.returnValue=false;'>"+" - "+
                                         "<input type='text' class='card_input' maxlength='4' style='IME-MODE:disabled;' onkeypress='if((event.keyCode<48)||(event.keyCode>57)) event.returnValue=false;'>"+" - "+
                                         "<input type='text' class='card_input' maxlength='4' style='IME-MODE:disabled;' onkeypress='if((event.keyCode<48)||(event.keyCode>57)) event.returnValue=false;'>"+" - "+
                                         "<input type='text' class='card_input' maxlength='4' id='last_num' style='IME-MODE:disabled;' onkeypress='if((event.keyCode<48)||(event.keyCode>57)) event.returnValue=false;'>"+
                                     "</div>"+"<br>"+
                                     "<div class='card_box'>"+
                                         "<label style='font-weight:bold; font-size:0.8em;'>&nbsp;사용기한</label>"+
                                         "<label style='font-weight:bold; font-size:0.8em;' id='swal_pd'>비밀번호</label><br>"+
                                         "<input type='text' class='card_input' placeholder='YY'  maxlength='2' id='first_num' style='IME-MODE:disabled;' onkeypress='if((event.keyCode<48)||(event.keyCode>57)) event.returnValue=false;'>"+" - "+
                                         "<input type='text' class='card_input' placeholder='MM' maxlength='2' style='IME-MODE:disabled;' onkeypress='if((event.keyCode<48)||(event.keyCode>57)) event.returnValue=false;'>"+
                                         "<input type='password' class='card_input' id='cd_pw' maxlength='4' style='IME-MODE:disabled;' onkeypress='if((event.keyCode<48)||(event.keyCode>57)) event.returnValue=false;'>"+
                                     "</div>"+
                                     "<p id='card_text'>&nbsp;</p>"+
                                     "<div class='submit_box'>"+
                                     "<input type='button' class= 'card_submit'id='card_submit_btn' value='확인'>"+
                                     "</div>"+
                                     "</form>"+
                                     "</div>"
                                 })//end swal

                                 $("#card_submit_btn").click(function(){
                                    if(!cardValueCheck($(".card_input"))){
                                             $("#card_text").html("값을 모두 입력해 주세요.");
                                      }else{
                                    	  card_pass = true;
                                 
                                    	  swal({
                                    		  html : "<b>결제정보가 등록되었습니다.</b>",
                                    		  type : "success",
                                    		  timer : 1500,
                                    		  allowOutsideClick: false,
                                    		  showConfirmButton : false
                                    	  }).then(function(){
                                    		  location.reload();
                                    	  })
                                      }
                                 })
                                 
                             }//end if
                             //비밀번호 입력 swal에서 비밀번호 틀릴 시
                             else{
                                 swal({
                                     timer:1500,
                                     html:"<b>비밀번호가 다릅니다.</b>",
                                     type:"error",
                                     allowOutsideClick: false,
                                     showConfirmButton: false
                                 }).then(function(){
                                	 //비밀번호 틀렸다고 알려주고 카드변경 이벤트 재실행
                                     $("#card_change").click();
                                 })
                             }
                        })
                }
            })
           
            $(document).keyup(function(e){
            		nextFocus(e);
             })
             
             /*디버깅용 클릭 이벤트*/
             $(document).click(function(e){
            	 console.log(e.target);
            	
            	
             })
        })
       

        $("#info_del").click(function(){
            swal({
                showConfirmButton: true,
                confirmButtonColor: "#FF3253",
                confirmButtonText: "<span style='color:#FFFBFC; font-weight:bold'>확인</span>",
                showCloseButton: true,
                allowOutsideClick: false,
                html: "<span style='font-weight:bold;'>정말 탈퇴 하시겠습니까?</span><br><br>"+
                "<input type='text' id='del_messege' class='swal_body' placeholder='동의합니다'>",
                type : 'warning'
            })
            .then(function(e){
                if(e.value){
                	if($("#del_messege").val()=="동의합니다"){
                		swal({
                    		  html : "<b>탈퇴되었습니다.</b>",
                    		  type : "warning",
                    		  timer : 1500,
                    		  allowOutsideClick: false,
                    		  showConfirmButton : false
                    	  }).then(function(){
                    		  location.href = "index.jsp";
                    	  })
                	}else{
                		swal({
                    		  html : "<b>잘못 입력하였습니다.</b>",
                    		  type : "error",
                    		  timer : 1500,
                    		  allowOutsideClick: false,
                    		  showConfirmButton : false
                    	  }).then(function(){
                    		  $("#info_del").click();
                    	  })
                	}
                	
                }
               
            })//end then
        })//end del-event

    </script>
</body>
</html>