<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
    <link rel="stylesheet" href="assets/plugins/slick/slick.css">
    <link rel="stylesheet" href="assets/plugins/slick/slick-theme.css">
    <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css">
    <script src="assets/plugins/slick/slick.min.js"></script>
    <script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script src="assets/plugins/starratingsvg/jquery.star-rating-svg.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/plugins/starratingsvg/star-rating-svg.css">
    <link rel="stylesheet" type="text/css" href="assets/plugins/starratingsvg/demo.css">
    <style>
        .m_info1 {
            float: left;
            width: 35%;
            height: 100%;
        }
        
        .m_info1 img {
            width: 95%;
            height: 95%;
        }
        
        .m_info2 {
            float: right;
            width: 65%;
            height: 100%;
        }

        
        .info {
            width: 90%;
            height: 150px;
            margin: auto;
            padding-top: 16px;
        }
        
        a {
            text-decoration: none;
            color: black;
        }
        
        .clearfix:after {
            content: "";
            display: block;
            float: none;
            clear: both;
        }
        
        .btn1 {
            margin-top: 12px;
            height: 30px;
        }
        /*담기와 구매버튼*/
        
        .btn1_1 {
            width: 90%;
            margin: auto;
            font-size: 0.8em;
        }
        /*담기 버튼*/
        
        .btn1_1_1 {
            float: left;
            line-height: 27px;
            width: 22%;
            text-align: center;
            border: 1px solid #E61A3F;
        }
        /*구매버튼*/
        
        .btn1_1_2 {
            float: right;
            line-height: 28px;
            width: 74%;
            text-align: center;
            background-color: #E61A3F;
        }
        /* 좋아요 덧글 관심 공유버튼 감싸는 ul */
        
        .btn2 {
            margin-top: 15px;
            height: 60px;
            background-color: #ECECEC;
        }
        /* 좋아요 덧글 관심 공유버튼 */
        
        .btn2_1 {
            float: left;
            width: 25%;
            border-top: 1px solid #C9C9C9;
            border-bottom: 1px solid #C9C9C9;
        }
        
        .btn2_1 button {
            font-size: 0.6em;
        }
        /*예고편 영화정보 상품정보 탭버튼 감싸는 div*/
        
        .tab_btn {
            width: 100%;
        }
        /*예고편 영화정보 상품정보 탭버튼 */
        
        .tab_btn_1 {
            float: left;
            width: 33.3%;
            text-align: center;
            line-height: 35px;
        }
        /*예고편 영화정보 상품정보 탭 스왑*/
        
        .hide {
            display: none;
        }
        /*예고편 영화정보 상품정보 탭 선택되었을때*/
        
        .tab_btn_1 a.selected {
            background-color: #fff;
            border-bottom: 1px solid white;
            border-left: 1px solid #d5d5d5 !important;
        }
        
        .tab_btn_1 a.none {
            border-left: 0 !important;
        }
        /*영화정보*/
        
        .tab_panel {
            margin-top: 10px;
            margin-bottom: 10px;
            width: 100%;
            font-style: 12px;
        }
        

        
        .bar {
            background: linear-gradient(to bottom, #FBFBFC, #F5F5F7);
            line-height: 35px;
            border-top: 1px solid #d5d5d5;
            border-bottom: 1px solid #d5d5d5;
            padding-left: 10px;
            font-size: 0.7em;
            font-weight: bold;
        }
        
        .slides {
            margin: 10px;
            font-size: 0.6em;
            font-weight: bold;
        }
        
        .slides a {
            display: inline-block;
            width: 100%;
            height: 100%;
        }
        
        .slides img {
            margin: auto;
            margin-bottom: 3px;
        }
        
        .slides span {
            display: block;
            width: 100%;
            text-align: center;
            text-overflow: ellipsis;
			white-space: nowrap;
			overflow: hidden;
        }
        
        .slide_item {
            height: 150px;
        }
        
        .slide_item img {
            width: 90%;
            height: 90%;
        }
        
        .btn1_1_1 a {
            display: inline-block;
            width: 100%;
        }
        
        .btn1_1_2 a {
            display: inline-block;
            width: 100%;
            color: #fff
        }
        
        .btn2 button {
            width: 100%;
            background-color: #fff;
            height: 52px;
            border: none;
            outline: none;
        }
        
        .btn2 img {
            width: 20px;
            height: 20px;
        }
        
        .tab_btn a {
            display: inline-block;
            width: 100%;
            height: 100%;
            border-bottom: 1px solid #d5d5d5;
            border-right: 1px solid #d5d5d5;
            border-left: 1px solid #d5d5d5;
            color: black;
        }
        
        .tab_btn a:first-child,
        .tab_btn a:nth-child(2),
        .tab_btn a:last-child {
            border-left: none;
        }
        
        .tab_btn li:last-child {
            border-right: none;
        }
        
        .tab_btn a span {
            display: block;
            width: 100%;
            height: 100%;
        }
        
        .tab {
            background-color: #F6F6F6;
        }
        
        #tab_page_1 {
            height: 195px;
        }
        #tab_page_2, #tab_page_3{
            width: 90%;
            height: 90%;
            margin:auto;
        }
        
        .m_info2 ul {
            padding-top: 15px;
            padding-left: 10px;
        }
        
        .m_info2 li {
            font-size: 13px;
            line-height: 20px;
            color: #555;
        }
        
        .swal-text {
            background-color: #FEFAE3;
            padding: 17px;
            border: 1px solid #F0E1A1;
            display: block;
            margin: 22px;
            text-align: center;
            color: #61534e;
        }
        
        .none1 {
            border-right: none !important;
        }
       .m_info_content{
        	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
       }

    </style>

</head>

<body>

    <div>
        <!-- 영화정보 -->
        <div class="clearfix info">
            <!-- 영화이미지 -->
            <div class="m_info1">
                <span><img src="${movie_thumbnail}" alt="" id="movie_img" ></span>
            </div>
            <!-- 무비네임 -->
            <div class="m_info2">
                <ul>
                    <li id="movie_name" class="m_info_content" style="font-size: 18px; font-weight:bold">${movie_name}</li>
                    <!-- 평점 및 평점인원 -->
                    <li style="line-height:30px; font-size: 16px; color:#E61A3F">★&nbsp;<span id="grade" style=" font-size: 12px; font-weight: bold;">${movie_star}</span>&nbsp;<span id="rate_people"style="color : black; font-size: 12px;" >${movie_people}</span><span style="color : black; font-size: 12px;">명</span><a id="starbtn" href="" style="color: #E61A3F; font-size: 12px; font-weight: bold;">&nbsp;별점주기></a></li>
                    <!-- 감독 -->
                    <li class="m_info_content">감독&nbsp;<span id="authoer">${movie_director}</span></li>
                    <!-- 주연 -->
                    <li class="m_info_content">주연&nbsp;<span id="actress">${movie_actor }</span></li>
                    <!-- 상영시간 -->
                    <li class="m_info_content">상영시간&nbsp;${movie_runtime}&nbsp;</li>

                </ul>

            </div>
        </div>
    </div>
    <!--담기 구매 버튼-->
    <div class=" btn1">
        <ul class="clearfix btn1_1">
            
        <!-- 담기버튼 -->
            <li class="btn1_1_1">
                <span style="font-weight: bold;"><a id="wish" href="" onclick="return false" ><img  src=""alt="">담기</a></span>
            </li>
            
            <!-- 구매버튼 -->
            <li class="btn1_1_2">
                <span style="font-weight: bold;"><a href="Movie_buy?movieNo=${movie_no}">${movie_type}
                <c:if test="${movie_sale != 0}">
                <span class="price">&nbsp;&nbsp;${movie_sale}코인</span>
                </c:if>
                <c:if test="${movie_sale == 0}">
                <span class="price">&nbsp;&nbsp;무료</span>
                </c:if>               
                </a></span>
            </li>
        </ul>
    </div>
    <!-- 좋아요 덧글 관심 공유 -->
    <div class=" btn2">
        <ul class="clearfix">
            <!-- 좋아요버튼 -->
            <li class="btn2_1">
                <button id="likebtn" type="button"><img  id="likeimg" src="assets/img/like_icon.png" data-img="assets/img/like_icon_after.png"><br><span id="likeCount">${movie_like}</span></button>
            </li>
            <!-- 덧글버튼 -->
            <li class="btn2_1">
                <button type="button" onclick="location.href='Movie_comment?movieNo=${movie_no}'"><img src="assets/img/comment_icon.png"><br><span>댓글</span></button>
            </li>
            <!-- 관심버튼 -->
            <li class="btn2_1">
                <button id="interestbtn" type="button"><img id="interestimg"src="assets/img/interest_icon.png" data-img="assets/img/interest_icon_after.png"><br><span>관심</span></button>
            </li>
            <!-- 공유버튼 -->
            <li class="btn2_1">
                <button type="button"><img id="share" src="assets/img/share_icon.png"><br><span>공유</span></button>
                <!-- 주소 복사를 위한 input태그 -->
                <input id="url" type="hidden" value=""/>
            </li>
        </ul>
    </div>
    <!-- 탭 전체 박스 -->
    <div class="tab">
        <!-- 탭버튼영역 -->
        <ul class="clearfix tab_btn">
            <!-- 예고편탭 -->
            <li class="tab_btn_1" style="font-size: 0.7em; font-weight: bold;">
                <a class="tab_btn_1_link  selected none" href="#tab_page_1">예고편</a>
            </li>
            <!-- 영화정보탭 -->
            <li class="tab_btn_1" style="font-size: 0.7em; font-weight: bold;">
                <a class="tab_btn_1_link" href="#tab_page_2">영화정보</a>
            </li>
            <!-- 상품정보탭 -->
            <li class="tab_btn_1" style="font-size: 0.7em; font-weight: bold;">
                <a class="tab_btn_1_link none1" href="#tab_page_3">상품정보</a>
            </li>
        </ul>
    </div>
   <!-- 내용영역 -->
    <div class="tab_panel">
        <!-- 예고편 -->
        <div id="tab_page_1"><iframe width="100%" height="100%" title="예고편 영상입니다" src="https://www.youtube.com/embed/${movie_preview}"></iframe></div>
        <!-- 영화정보 -->
        <div id="tab_page_2" class="hide">
            <h4 style="font-size:13px;margin-bottom: 10px;">줄거리</h4>
            <p style="font-size:12px; line-height: 20px;">${movie_summary}</p>
        </div>
        <!-- 상품정보 -->
        <div id="tab_page_3" class="hide">
            <h4 style="font-size:13px; margin-bottom: 10px;">요금 및 상품 정보</h4>
            <p style="font-size:12px;line-height: 20px;">이용 안내<br> 환불은 쿠폰을 사용하지 않은 제품에 한하여 시청하지 않았을<br>경우 7일 이내에 마이페이지 구매내역에서 가능합니다.<br><br> 재생가능기간 <br>대여 : 대여 후 7일<br>구매 : 무기한<br><br>가격 <br>${movie_sale}코인<br><br>개봉일<br>${movie_release_date}</p>
        </div>
    </div>
    
    <!-- 하단 바 -->
    <div class="bar"><span>절찬리 할인영화</span></div>
    
    <div>
        <!-- 슬라이드 -->
        <div class="slides">
	        <c:forEach var="item" items="${infoSale}" varStatus="status">
	        	<div class="slide_item">
	            	<a href="Movie_information?movieNo=${item.movie_no}"><img src="${item.thumbnail}" alt="${item.name} 썸네일"><span>${item.name}</span></a>
	        	</div>
			</c:forEach>
        </div>
    </div>
    <div class="bar"><span>이 장르의 인기영화</span></div>
    <div class="slides">
    	<c:forEach var="item" items="${infoCategory}" varStatus="status">
        	<div class="slide_item">
            	<a href="Movie_information?movieNo=${item.movie_no}"><img src="${item.thumbnail}" alt="${item.name} 썸네일"><span>${item.name}</span></a>
        	</div>
		</c:forEach>
    </div>
    <div class="bar"><span>CLIP의 추천영화</span></div>
    <div class="slides">
        <c:forEach var="item" items="${infoRecommend}" varStatus="status">
        	<div class="slide_item">
            	<a href="Movie_information?movieNo=${item.movie_no}"><img src="${item.thumbnail}" alt="${item.name} 썸네일"><span>${item.name}</span></a>
        	</div>
		</c:forEach>
    </div>

    <!-- BOT BAR -->
    <%@ include file="assets/inc/bot_bar.jsp" %>
    <div style="height: 50px;"></div>
    
    <script>
    
    $(function(){
    	//관심등록 여부 판별
    	$.post("interestCommit",{movieNo:"${movie_no}"},function(req){
    		if(req=="8"){
    			return;
    		}else{
    			var tmp = $("#interestimg").attr("src");
                var img = $("#interestimg").data("img");
                $("#interestimg").attr("src", img);
                $("#interestimg").data("img", tmp);
    		}
        })
        //좋아요 여부 판별
        $.post("likeCommit",{movieNo:"${movie_no}"},function(req){
    		if(req=="8"){
    			return;		
    		}else{
    			var tmp = $("#likeimg").attr("src");
                var img = $("#likeimg").data("img");
                $("#likeimg").attr("src", img);
                $("#likeimg").data("img", tmp);
    		}
        })
        
        
    })
    
        var count = "${movie_people}"; //평점을 준 사람
        var rate = 0; // 평점
        var total = "${movie_star}";
        $(function() {
        	$(".bot_bar_icon").eq(0).attr("src", "assets/img/home_icon_selected.png");

            $("#starbtn").click(function(e) { //별점주기 클릭시
                    e.preventDefault(); //링크의 이동 막기
                 $.post("checkStar",{movieNo:"${movie_no}"},function(req){
            		if(req==1){
                    swal({
                        html: "<div style='width:200px;height:100px; margin:auto;'><span class='my-rating-4'></span><span class='live-rating'></span></div>",
                        confirmButtonColor: "#FF3253"
                            //sweetalert 창을 통한 별점기능 생성
                    }).then(function(result) {
                        if (result.value) {
                        	//서버에 저장
                        $.post("insertStar",{movieNo:"${movie_no}",score:rate},function(req){ 
                        	//평점실시간 값 바꿔주기
                        	 $.post("recentstar",{movieNo:"${movie_no}"},function(req){
         						$("#grade").text(req)
             				})
             				//사람수실시간 값 바꿔주기
             				$.post("recentpeople",{movieNo:"${movie_no}"},function(req){
         						$("#rate_people").text(req)
             				})
                        })
                      }
                    });
                    $(".my-rating-4").starRating({ // 별점기능의 CSS 및 기본 속성(사이트에 나와있습니다)
                        initialRating: 0,
                        disableAfterRate: false,
                        starShape: 'rounded',
                        strokeWidth: 0,
                        hoverColor: '#FF3253',
                        ratedColor: '#FF3253',
                        onHover: function(currentIndex, currentRating, $el) { // 별점의 수치화(기본속성)
                            $('.live-rating').text(currentIndex);
                        },
                        onLeave: function(currentIndex, currentRating, $el) {
                            $('.live-rating').text(currentRating);
                            rate = Number(currentRating) // 평점을 수식으로 바꾸어 더해줌
                        }

                    });
                   
            	}else if(req==0){
    			swal({
    				html : "<b>이미 평가를 마친 상품입니다.</b>",
                    type: "error",
                    confirmButtonText: "확인",
                    showCancelButton: false,
                    confirmButtonColor:"#aaa",
                    cancelButtonColor: "#FF3253"
                })
    		}else {
    			swal({
    				html : "<b>로그인이 필요한 서비스입니다.</b>",
                    type: "error",
                    confirmButtonText: "확인",
                    showCancelButton: true,
                    cancelButtonText: "로그인 하기",
                    confirmButtonColor:"#aaa",
                    cancelButtonColor: "#FF3253"
                }).then(function(result) {
                    if (result.dismiss === "cancel") {
                        location.href = "Login";
                    }
                })
    		}
                 })
            		

                }) //별점주기 끝
        })
            $(".slides").slick({
                slidesToShow: 3,
                slidesToScroll: 3,
                dots: true,
                infinite: false,
                arrows: false

            })
            //클래스 줫다뺏다하기 예고편,줄거리,상세정보
            $(".tab_btn_1_link").click(function(e) {
                e.preventDefault();
                $(".tab_btn_1_link").not(this).removeClass("selected");
                $(this).addClass("selected");

                var target = $(this).attr("href");
                $(target).removeClass("hide");
                $(".tab_panel>div").not($(target)).addClass("hide");
            })
			//장바구니담기
            $("#wish").click(function() {
            	$.post("wishListInsert.do",{movieNo:"${movie_no}"},function(req){
            		if(req==1){
            			swal({
            				html : "<b>장바구니에<br>담았습니다.</b>",
                            type: "success",
                            confirmButtonText: "이전",
                            showCancelButton: true,
                            cancelButtonText: "장바구니 보기",
                            confirmButtonColor:"#aaa",
                            cancelButtonColor: "#FF3253"
                        }).then(function(result) {
                            if (result.dismiss === "cancel") {
                                location.href = "Wish_list";
                            }
                        })
            		}else if(req==0){
            			swal({
            				html : "<b>이미 장바구니에<br>담겨있는 상품입니다.</b>",
                            type: "error",
                            confirmButtonText: "확인",
                            showCancelButton: false,
                            confirmButtonColor:"#aaa",
                            cancelButtonColor: "#FF3253"
                        })
            		}else {
            			swal({
            				html : "<b>로그인이 필요한 서비스입니다.</b>",
                            type: "error",
                            confirmButtonText: "확인",
                            showCancelButton: true,
                            cancelButtonText: "로그인 하기",
                            confirmButtonColor:"#aaa",
                            cancelButtonColor: "#FF3253"
                        }).then(function(result) {
                            if (result.dismiss === "cancel") {
                                location.href = "Login";
                            }
                        })
            		}
            	})
                
            })
            
            $("#share").click(function() {

                swal({
                    title: "공유하기",
                    text: location.href,
                    button: true,
                    confirmButtonText:"복사하기",
                    confirmButtonColor:"#FF3253",
                    showCloseButton: true
                })
                   .then(function(result){
                       $("#url").attr("type","text");
                       $("#url").val(location.href);
                       $("#url").select();
                        document.execCommand("Copy");
                        $("#url").attr("type","hidden")
                   
                   })           
            });
           


			//영화 좋아요 개수
            $("#likebtn").click(function(e) {
            	$.post("MovieLikeInsert.do",{movieNo:"${movie_no}"},function(req){
            		if(req==1){
            			//실시간 좋아요 개수 업데이트
            			$.post("recent",{movieNo:"${movie_no}"},function(req){
								$("#likeCount").text(req)
            			})
            			
                        var tmp = $("#likeimg").attr("src");
                        var img = $("#likeimg").data("img");
                        $("#likeimg").attr("src", img);
                        $("#likeimg").data("img", tmp);
            		}else if(req==2){
            			swal({
            				html : "<b>로그인이 필요한 서비스입니다.</b>",
                            type: "error",
                            confirmButtonText: "확인",
                            showCancelButton: true,
                            cancelButtonText: "로그인 하기",
                            confirmButtonColor:"#aaa",
                            cancelButtonColor: "#FF3253"
                        }).then(function(result) {
                            if (result.dismiss === "cancel") {
                                location.href = "Login";
                            }
                        })
            		}else{
                        	$.post("MovieLikeDelete.do",{movieNo:"${movie_no}"},function(req){
                        		//실시간 좋아요 개수 업데이트
                        		$.post("recent",{movieNo:"${movie_no}"},function(req){
								$("#likeCount").text(req)
            			})
                        	})
                        var tmp = $("#likeimg").attr("src");
                        var img = $("#likeimg").data("img");
                        $("#likeimg").attr("src", img);
                        $("#likeimg").data("img", tmp);

            		}
            	})
                
            })
        //관심등록
		$("#interestbtn").click(function() {
            	$.post("interestInsert.do",{movieNo:"${movie_no}"},function(req){
            		if(req==1){
           			
            			swal({
            				html : "<b>관심목록에<br>추가되었습니다.</b>",
                            type: "success",
                            confirmButtonText: "확인",
                            showCancelButton: false,
                            confirmButtonColor:"#aaa",
                            cancelButtonColor: "#FF325"                 
                        })
                        var tmp = $("#interestimg").attr("src");
                        var img = $("#interestimg").data("img");
                        $("#interestimg").attr("src", img);
                        $("#interestimg").data("img", tmp);
            		}else if(req==0){

            			swal({
            				html : "<b>정말 관심목록에서<br>삭제하시겠습니까?</b>",
                            type: "error",
                            confirmButtonText: "확인",
                            showCancelButton: false,
                            confirmButtonColor:"#aaa",
                            cancelButtonColor: "#FF3253"
                        }).then(function(result) {
                        	$.post("interestDelete.do",{movieNo:"${movie_no}"},function(req){

                        	})
                        })
                        var tmp = $("#interestimg").attr("src");
                        var img = $("#interestimg").data("img");
                        $("#interestimg").attr("src", img);
                        $("#interestimg").data("img", tmp);

            		}else {
            			swal({
            				html : "<b>로그인이 필요한 서비스입니다.</b>",
                            type: "error",
                            confirmButtonText: "확인",
                            showCancelButton: true,
                            cancelButtonText: "로그인 하기",
                            confirmButtonColor:"#aaa",
                            cancelButtonColor: "#FF3253"
                        }).then(function(result) {
                            if (result.dismiss === "cancel") {
                                location.href = "Login";
                            }
                        })
            		}
            	})
                
            })


            

 </script>


</body>

</html>