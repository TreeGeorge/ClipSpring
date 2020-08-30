<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
    <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css">
    <style type="text/css">
        /* 콘텐츠 시작 for top_bar */
        
        #content {
            padding-top: 75px;
        }
        /*폼 테두리 제거*/
        
        fieldset {
            border: none;
        }
        /*폼 전체 크기*/
        
        .form-horizontal {
            margin: auto;
            width: 360px;
        }
        /*폼 제목*/
        
        .form-horizontal legend {
            text-align: center;
            font-size: 2em;
        }
        /*폼 제목 구분선*/
        
        .form-horizontal hr {
            width: 97%;
            margin-top: 30px;
            margin-bottom: 30px;
        }
        /*페이지 설명*/
        
        .form-horizontal p {
            text-align: center;
            font-size: 1.2em;
        }
        /* 입력요소별 여백 구분 박스 */
        
        .form-horizontal .form-group {
            margin: 40px auto;
            width: 90%;
        }
        /* 입력요소 라벨 */
        
        .form-horizontal .form-group label {
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
        /* 입력요소 입력란 */
        
        .form-horizontal input {
            width: 100%;
            height: 35px;
            line-height: 35px;
            padding-top: 3px;
            padding-bottom: 3px;
            border: 1px solid #FF3253;
            border-radius: 0 4px 4px 4px;
            box-sizing: border-box;
        }
        /* next 버튼 박스 */
        
        #next_box {
            margin: auto;
            text-align: center;
        }
        /* next 버튼 */
        
        #to_submit {
            margin-top: 30px;
            background-color: #b9062d;
            line-height: 100%;
            border-radius: 4px;
            border: 0px;
            width: 100px;
            color: #fffbfc;
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
                    <p style="line-height: 21px;">비밀번호를 찾고자 하는
                        <br>아이디를 입력해 주세요.</p>

                    <div id="email_box" class="form-group">
                        <label for="user_id" style="width: 55px">아이디</label> <input type="text" name="user_id" id="user_id">
                    </div>
                    <div id="next_box" class="form-group">
                        <div class="submit_box">
                            <input type="submit" name="submit" id="to_submit" value="다음">
                        </div>
                    </div>

                </fieldset>
            </form>
        </div>
    </div>
    <script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script>
        //다음 버튼 클릭
        $("#to_submit").click(function(e) {
                //페이지 이동 방어
                e.preventDefault();
                var id_val = $("#user_id").val();
                //post통신
                if (!id_val) {
                    swal({
                        html: "<b>아이디를 입력하세요.</b>",    // 내용
                        type: "error",  // 종류
                        confirmButtonText: "확인", // 확인버튼 표시 문구
                        confirmButtonColor: "#ff3253", // 확인버튼 색상
                    });
                } else {
                    $.post('api/search_id.do', {
                            user_id: id_val,
                            post: "idCheck"
                        }, function(req) {
                            //아이디 검색될시
                            if (req.result == '1') {
                                location.href = 'Search_password_for_email.jsp';
                            } else { //일치하는 아이디 없는 경우
                                swal({
                                    html: "<b>일치하는 아이디가 없습니다.</b>",    // 내용
                                    type: "error",  // 종류
                                    confirmButtonText: "확인", // 확인버튼 표시 문구
                                    confirmButtonColor: "#ff3253", // 확인버튼 색상
                                });
                            } //end if-else
                        }) //end post
                } //end if-else
            }) //end sumit_btn click event
    </script>
</body>

</html>