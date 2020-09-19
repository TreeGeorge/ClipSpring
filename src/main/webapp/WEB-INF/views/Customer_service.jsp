<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
    <link rel="stylesheet" href="assets/plugins/bootstrap/bootstrap.min.css">
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <style>
        
        a:hover {
        	text-decoration: none;
        }
        
        .custom {
            background-color: #E61A3F;
            height: 180px;
            position: relative;
            text-align: center;
        }
        
        .custom img {
            display: block;
            height: 100px;
            margin: auto;
        }
        
        .custom a {
            display: inline-block;
            margin-top: 30px;
        }
        
        .custom span {
            display: block;
            width: 100%;
            text-align: center;
            font-weight: bold;
            color: white;
            text-decoration: none;
            margin-top: -20px;
        }
        
        .search {
            width: 90%;
            position: absolute;
            left: 18px;
            top: 155px;
        }
        
        .search img {
            width: 40px;
            height: 40px;
        }
        
        .tab_btn_1 {
            float: left;
            width: 50%;
            text-align: center;
            line-height: 35px;
        }
        
        .tab_btn_1_link {
            border: 1px solid #d5d5d5;
            text-decoration: none;
            background-color: #fff;
            color: #555;
            padding: 15px 25px;
            border-radius: 25px;
        }
        
        .tab_btn_1 a.selected {
            border-radius: 25px;
            padding: 15px 25px;
            border: none;
            background-color: #E61A3F;
            color: white;
            font-weight: bold;
            text-decoration: none;
        }
        
        .tab_panel {
            margin-top: 30px;
        }
        body{
            background-color: #FEE4E9;
        }
    </style>
</head>

<body>
    <div class="custom">
        <a href="home"><img src="assets/img/logo_white.png" alt=""><span>고객센터</span></a>
    </div>
    <div style="background-color: #FEE4E9; height: 50px; position: relative;">

    </div>
    <div class="input-group search">
        <input type="text" class="form-control" placeholder="궁금한 점을 검색해 보세요" style="  height: 50px;">
        <span class="input-group-btn">
                <button class="btn btn-default" style="border-left: none; width:70px; height: 50px; outline:0; background: #fff;"><img  src="assets/img/search_icon_selected.png" alt=""></button>
        </span>

    </div>
    <div style=" padding-top: 15px;">
        <div class="tab">
            <!-- 탭버튼영역 -->
            <ul class="clearfix tab_btn">

                <li class="tab_btn_1" style="font-size: 0.7em; font-weight: bold;">
                    <a class="tab_btn_1_link  selected" href="#tab_page_1">공지사항</a>
                </li>

                <li class="tab_btn_1" style="font-size: 0.7em; font-weight: bold;">
                    <a class="tab_btn_1_link" href="#tab_page_2">자주 찾는 질문</a>
                </li>

            </ul>
        </div>
        <!-- 아코디언 영역 시작 -->
        <div class="tab_panel">
            <div id="tab_page_1">
                <div class="panel-group " id="accordion">
                    <!-- 항목(1) -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"> CLIP 쿠폰 이벤트! </a></h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                                8월 10일부터 9월 25일까지 모든 영화 컨텐츠를 할인 받을 수 있는 3,000 코인 할인 쿠폰을 발급중입니다. <br>
                                앞으로도 많은 이용 부탁드립니다.<br><br> 쿠폰 이용기간 : 9월 25일까지 <br> 주의사항 : 중복해서 지급받으실 수 없습니다.
                            </div>
                        </div>
                    </div>
                    <!-- 항목(2) -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"> CLIP 무료영화 이벤트! </a></h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                무료 영화 소장 이벤트를 진행중입니다. 현재 무료로 소장하실 수 있는 영화는 백두산, 캡틴아메리카, 마녀, Moonlight, 머드라, 1917, Baby Driver, Marjorie Prime 등이 있습니다.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--// 아코디언 영역  끝-->
            <!-- 아코디언 영역 시작 -->
            <div class=" hide" id="tab_page_2">
                <div class="panel-group " id="accordion">
                    <!-- 항목(1) -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour"> [보관함]구매한 콘텐츠가 보이지 않아요 </a></h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body">
                                CLIP에서는 판매 중지된 콘텐츠도 [보관함 > 대여/소장] 메뉴에서 대여/소장 기간이 남아 있는 콘텐츠에 한해 열람이 가능합니다. 콘텐츠를 삭제하지 않았는지 확인해 보시기 바랍니다.
                            </div>
                        </div>
                    </div>
                    <!-- 항목(2) -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive"> [환불]환불 방법 </a></h4>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse">
                            <div class="panel-body">
                                마이페이지에서 구매내역 클릭 후 쿠폰을 사용하지 않은 제품에 한하여 구매한지 7일이 지나지 않은 상품을 구매 취소하시는 경우 환불이 가능합니다.<br> 구매 후 7일이 지난 제품이거나 시청을 한경우, 쿠폰을 사용하여 구매한 제품인경우 환불이 불가합니다.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--// 아코디언 영역  끝-->
    </div>



    <script>
        $(function() {
            $(".tab_btn_1_link").click(function(e) {
                e.preventDefault();
                $(".tab_btn_1_link").not(this).removeClass("selected");
                $(this).addClass("selected");

                var target = $(this).attr("href");
                $(target).removeClass("hide");
                $(".tab_panel>div").not($(target)).addClass("hide");
            })
        })
    </script>
</body>

</html>