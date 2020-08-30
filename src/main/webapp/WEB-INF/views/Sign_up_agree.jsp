<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
    <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css">
    <style type="text/css">
    #content{
        margin-top: 75px;
    }

    fieldset{
        border:none;
    }
    .form-horizontal{
        margin: auto;
        width: 360px;
    }
    .form-horizontal legend{
        text-align: center;
        font-size: 2em;
    }

    .form-horizontal hr{
        width:97%;
        margin-top: 30px;
        margin-bottom: 30px;
    }

    .checkbox{
        width: 95%;
        margin: auto;
        margin-bottom: 40px;

    }
    .checkbox input{
        display: inline-block;
        width: 20px;
        height: 20px;
        vertical-align: middle;

    }

    .checkbox span{
        display: inline-block;
        vertical-align: middle;
    }
    .box_header{
        width: 95%;
        background: #FF3253;
        border:1px solid #FF3253;
        padding: 5px;
        color:#fffbfc;
    }
    .box_header input{
        width: 15px;
        height: 15px;
    }
    .text_box{
        width:95%;
        border:1px solid #FF3253;
        height: 100px;
        overflow-y:scroll;
        padding: 5px;
        line-height: 20px;
    }

    .button_box{
        text-align: center;
    }

    .to_submit{
        width: 100px;
        height: 40px;
        line-height: 100%;
        background-color: #FF3253;
        border: 0;
        border-radius: 5px;
        color:#fffbfc;
        margin-bottom: 40px;
    }

</style>
</head>

<body>
    <div id="container">
        <%@ include file="assets/inc/sign_top_bar.jsp" %>

        <div id="content">
            <form class="form-horizontal" id="myform">

                <fieldset>
                    <legend>약관동의</legend>
                    <hr>
                    <div class="form-group">
                        <div class="checkbox">
                            <input id="select_all" type="checkbox" value="">
                            <span>이용약관, 개인정보 수집 및 이용, 프로모션
                                <br>안내 메일 수신(선택)에 모두 동의 합니다.</span>
                            </div>

                            <div class="checkbox">
                                <div class="box_header">
                                    <input name="check" class="must" type="checkbox" value="">
                                    <span>CLIP 이용 약관 동의 (필수)</span>
                                </div>

                                <div class="text_box">여러분을 환영합니다.<br>
                                    CLIP 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.
                                    본 약관은 다양한 클럽 서비스의 이용과 관련하여 CLIP 서비스를
                                    제공하는 CLIP 주식회사(이하 ‘클립’)와 이를 이용하는 CLIP
                                    서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며,
                                    아울러 여러분의 CLIP 서비스 이용에 도움이 될 수 있는
                                    유익한 정보를 포함하고 있습니다.
                                </div>
                            </div>
                            <div class="checkbox">
                                <div class="box_header">
                                   <input name="check" class="must" type="checkbox" value="">
                                   <span>개인정보 수집 및 이용에 대한 안내 (필수)</span>
                               </div>

                               <div class="text_box">정보통신망법 규정에 따라 CLIP에 회원가입
                                신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적,
                                개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여
                                주시기 바랍니다.
                            </div>
                        </div>

                        <div class="checkbox">
                            <input name="check" id="should" type="checkbox" value="">
                            <span>이벤트 등 프로모션 알림 메일 수신 (선택)</span>
                        </div>
                    </div>

                    <!--취소버튼 없애고 다음 버튼만-->
                    <div class="button_box">
                        <input type="button" class="to_submit" value="다음">
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script>
            // 약관 전체 동의 클릭 이벤트
            $("#select_all").click(function(){
                // 전체 동의 체크 박스 클릭시 모든 체크 박스 체크
                if($(this).prop("checked")){
                    $("input[name=check]").prop("checked",true);
                // 전체 동의 체크 박스 해제시 모든 체크 박스 해제
            }else{
                $("input[name=check]").prop("checked",false);
            }
        });
            // 다음 버튼 클릭 이벤트
            $(".to_submit").click(function(){
                var must = false;
                //must클래스를 가진 필수 동의 사항 체크박스 checked속성 검사
                for(var i = 0; i < $("input[class=must]").length; i++){
                    if(!($("input[class=must]")[i].checked)){
                        must = true;
                    }
                }
                //필수 동의 사항 체크안한 경우
                if(must){
                    swal({
	                    html: "<b>CLIP 이용약관과 개인정보수집 및<br>이용에 대한 안내 모두 동의해주세요.</b>",    // 내용
	                    type: "error",  // 종류
	                    confirmButtonText: "확인", // 확인버튼 표시 문구
	                    confirmButtonColor: "#ff3253", // 확인버튼 색상
	                });
                    must = false;
                }
                //필수 동의 사항 체크한 경우
                else{
                    // 메일 수신 동의한 경우 if($("#should")[0].checked){ }

                    $(location).attr('href','Sign_up_information.jsp');
                }
            })
        </script>
    </body>

    </html>