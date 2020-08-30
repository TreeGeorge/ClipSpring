<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
    <link rel="stylesheet" href="assets/plugins/bootstrap/bootstrap.min.css">
    <script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css">
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <style>
        /* 액션 타이틀 글씨 */
        
        #top_logo h1 {
            height: 0px;
            text-align: center;
            font-size: 18px;
            margin-bottom: 1px;
            margin-top: 8px;
            font-weight: bold;
        }
        /* 액션타이틀 좌측 화살표 이미지*/
        
        #top_logo img {
            height: 25px;
            left: 100px;
            top: 10px;
            margin-bottom: 5px;
            margin-left: 5px;
        }
        
        h4 {
            padding-left: 20px;
            padding-top: 10px;
            font-weight: bold;
        }
        
        .focus_on {
            margin-bottom: 10px;
            margin-left: 20px;
            width: 90%;
            min-height: 160px;
            max-height: 160px;
            border: none;
            resize: none;
        }
        
        .id {
            padding-left: 20px;
            padding-top: 10px;
            font-weight: bold;
        }
        
        #comment {
            margin-bottom: 30px;
        }
        
        .comment_title img {
            width: 20px;
            height: 20px;
        }
        
        .input-group {
            width: 90%;
            margin: auto;
        }
        
        .btn {
            background-color: #E61A3F;
            color: #ffffff;
        }
        
        .btn:focus {
            outline: 0;
            background-color: #E61A3F;
            color: #fff;
        }
        /* 댓글 카운터 */
        
        .counter_box {
            position: relative;
        }
        
        .counter {
            position: absolute;
            bottom: 10px;
            right: 10px;
        }
        
        .comment_plus {
            width: 90%;
            margin: auto;
            position: relative;
            border-bottom: 1px solid #d5d5d5;
            padding: 12px 0;
        }
        
        .user {
            font-weight: bold;
        }
        
        .btn1 {
            position: absolute;
            right: 54px;
            background-color: #fff;
            border: 1px solid #d1d1d1;
            width: 50px;
            height: 20px;
            bottom: 10px;
            font-size: 12px;
        }
        
        .btn2 {
            position: absolute;
            right: 1px;
            background-color: #fff;
            border: 1px solid #d1d1d1;
            width: 50px;
            height: 20px;
            bottom: 10px;
            font-size: 12px;
        }
        
        .comment_plus img {
            width: 15px;
            height: 15px;
        }
        
        .cancel {
            display: inline-block;
            background-image: url(../img/x.png);
            background-size: 20px 20px;
            width: 20px;
            height: 20px;
            position: absolute;
            right: 5px;
            top: 12px;
        }
        
        .timebox {
            font-size: 10px;
            color: #aaa;
        }
        
        .no_movies {
            text-align: center;
            margin-top: 30px;
            margin-bottom: 30px;
        }
        
        .no_movies img {
            display: block;
            margin: auto;
            width: 100px;
            height: 100px;
        }
        
        .no_movies p {
            font-weight: bold;
            padding-top: 10px;
            line-height: 25px;
            font-size: 16px;
        }
    </style>
</head>

<body>
    <!-- 영화제목 탑바 -->
    <%@ include file="assets/inc/top_info.jsp" %>
    <div style="height: 40;"></div>
    <div>
        <!-- 댓글 갯수 -->
        <h4>댓글&nbsp;<span id="cnum">0</span></h4>
        <!-- 댓글입력칸 -->
        <div class="input-group comment_focus">
            <input type="text" class="form-control" placeholder="댓글을 입력해주세요" style=" border-radius: 0; height: 45px;">
            <span class="input-group-btn">
                    <button class="btn btn-default" style="border: 1px solid #E61A3F; border-radius: 0; width:70px; height: 45px;">등록</button>
            </span>

        </div>
        <!-- 댓글포커스시 창크기 확대 -->
        <div class="comment_focus2 hidden" style="margin: auto; width: 90%; border: 1px solid #d5d5d5; ">
            <p class="id">아이디</p>
            <textarea class="focus_on" name="" id="" cols="30" rows="10" placeholder="주제와 무관한 댓글, 악플은 삭제될 수 있습니다."></textarea>
            <div class="input-group" style="width: 100%;">
                <div class="form-control counter_box" style=" border-radius: 0; height: 45px;">
                    <span class="counter"></span>
                </div>
                <span class="input-group-btn">
                        <button class="btn btn-default "  style="border: 1px solid #E61A3F; border-radius: 0; width:70px; height: 45px;" onclick="plus();">등록</button>
                </span>
            </div>

        </div>
    </div>

    <br>
    <br>

    <!-- 댓글생성 -->
    <div id="comment">
        <!-- <div class="comment_plus">
            <p class="user">아이디</p>
            <p class="content">내용</p>
            <div class="timebox">
                <span>시각</span>
                <button class="btn1"><img src="../img/comment_like.png" alt=""></button><button class="btn2"><img src="../img/comment_bad.png" alt=""></button>
            </div>
        </div> -->
        <div class="no_movies hide">
            <img src="assets/img/wish_list_none.png" />
            <p>댓글이 없습니다.</p>
        </div>
    </div>



    <!--footer-->
    <%@ include file="assets/inc/footer.jsp" %>

    <script>
    	$("#top_info_value").html("영화 제목");
        var count = 0;

        function plus() {


            var Now = new Date();
            var NowTime = Now.getFullYear();

            NowTime += '-' + (Now.getMonth() + 1);
            NowTime += '-' + Now.getDate();
            NowTime += ' ' + Now.getHours();
            NowTime += ':' + Now.getMinutes();
            NowTime += ':' + Now.getSeconds();



            var id = $("<p>").html("아이디").addClass("user");
            var content = $("<p>").html($(".focus_on").val());
            var time = $("<span>").html(NowTime);

            var timebox = $("<div>").html("").addClass("timebox");
            var likebtn = $("<button>").html("좋아요").addClass("btn1");
            var hatebtn = $("<button>").html("싫어요").addClass("btn2")
            var tt = timebox.append(time)

            var box = $("<div>").addClass("comment_plus");
            var x = $("<a>").addClass("cancel");
            box.append(id).append(content).append(tt).append(x).append(likebtn).append(hatebtn);


            if (!$(".focus_on").val() || !$(".focus_on").val().trim()) {
               swal({
                    html: "<b>댓글을 입력해 주세요.<b>",
                    confirmButtonColor: "#FF3253",
                    confirmButtonText: "확인",
                })
            } else {
                $("#comment").append(box);
                count++;

                $("#cnum").html(count);
            }
            console.log(count)

        }

        $(document).ready(function() {
            if ($(".comment_plus").length == 0) {
                $(".no_movies").removeClass("hide");
            }
        })


        $(document).click(function(e) {
            console.log($(".comment_plus").length);
            if ($(".comment_plus").length == 0) {
                $(".no_movies").removeClass("hide");
            } else {
                $(".no_movies").addClass("hide");
            }

            if (e.target.className == "cancel") {

                swal({
                    html: "<b>정말 삭제하시겠습니까?</b>",
                    confirmButtonColor: "#FF3253",
                    confirmButtonText: "확인",
                    showCancelButton: true,
                    cancelButtonText: "취소"

                }).then(function(result) {
                    if (result.value) {

                        $(e.target).parent().remove();
                        count--;
                        $("#cnum").html(count);
                    }

                })
            }



            if (e.target == $(".form-control")[0]) {
                $(".comment_focus").addClass("hidden");
                $(".comment_focus2").removeClass("hidden");
            } else if (e.target != $(".focus_on")[0] && e.target != $(".id")[0] && e.target != $(".form-control")[1]) {

                $(".comment_focus").removeClass("hidden");
                $(".comment_focus2").addClass("hidden");
                $(".focus_on").val("");
                $(".counter").html('0/500');
            };

            $(".focus_on").keyup(function(e) {
                var content = $(this).val();
                $(this).height(((content.split("\n").length + 1) * 1.5) + 'em');
                $(".counter").html(content.length + '/500');
                if (content.length > 500) {
                    swal({
                        timer:1500,
                        html:"<div style='font-weight: bold; margin-bottom: 20px;'>500자 이상 입력할 수 없습니다.</div>",
                        type:"error",
                        allowOutsideClick: false,
                        showConfirmButton: false
                    });
                    $(this).val(content.substring(0, 500));
                }
            });
            $(".focus_on").keyup();
        })
    </script>


</body>

</html>