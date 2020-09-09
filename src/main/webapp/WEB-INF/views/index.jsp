<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="assets/plugins/slick/slick.min.js"></script>
<link rel="stylesheet" href="assets/plugins/slick/slick.css">
<link rel="stylesheet" href="assets/plugins/slick/slick-theme.css">
<link rel="stylesheet" href="assets/css/index.css">

</head>

<body>
    <!--전체박스-->
    <div id="container">

        <!--TOP LOGO-->
        <%@ include file="assets/inc/top_logo.jsp" %>

        <!--TOP BAR-->
        <%@ include file="assets/inc/top_bar.jsp" %>

        <!-- 홈 컨텐츠 -->
        <div id="content">

            <!--배너 박스-->
            <div class="banner_box">
                <!-- Swiper -->
                <div class="swiper-container2">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"><a href="Movie_information?movieNo=${recommendMovieNo0}" class="gallbox"><img src="${recommendMovieThumbnail0}" alt="${recommendMovieTitle0} 썸네일"><span class="banner_movie_title" style="background: #FF7688">${recommendMovieTitle0}</span></a></div>
                        <div class="swiper-slide"><a href="Movie_information?movieNo=${recommendMovieNo1}" class="gallbox"><img src="${recommendMovieThumbnail1}" alt="${recommendMovieTitle1} 썸네일"><span class="banner_movie_title" style="background: #FE506B">${recommendMovieTitle1}</span></a></div>
                        <div class="swiper-slide"><a href="Movie_information?movieNo=${recommendMovieNo2}" class="gallbox"><img src="${recommendMovieThumbnail2}" alt="${recommendMovieTitle2} 썸네일"><span class="banner_movie_title" style="background: #FF3253">${recommendMovieTitle2}</span></a></div>
                        <div class="swiper-slide"><a href="Movie_information?movieNo=${recommendMovieNo3}" class="gallbox"><img src="${recommendMovieThumbnail3}" alt="${recommendMovieTitle3} 썸네일"><span class="banner_movie_title" style="background: #B9062D">${recommendMovieTitle3}</span></a></div>
                        <div class="swiper-slide"><a href="Movie_information?movieNo=${recommendMovieNo4}" class="gallbox"><img src="${recommendMovieThumbnail4}" alt="${recommendMovieTitle4} 썸네일"><span class="banner_movie_title" style="background: #8C0120">${recommendMovieTitle4}</span></a></div>
                        <div class="swiper-slide"><a href="Movie_information?movieNo=${recommendMovieNo5}" class="gallbox"><img src="${recommendMovieThumbnail5}" alt="${recommendMovieTitle5} 썸네일"><span class="banner_movie_title" style="background: #FF7688">${recommendMovieTitle5}</span></a></div>
                        <div class="swiper-slide"><a href="Movie_information?movieNo=${recommendMovieNo6}" class="gallbox"><img src="${recommendMovieThumbnail6}" alt="${recommendMovieTitle6} 썸네일"><span class="banner_movie_title" style="background: #FE506B">${recommendMovieTitle6}</span></a></div>
                        <div class="swiper-slide"><a href="Movie_information?movieNo=${recommendMovieNo7}" class="gallbox"><img src="${recommendMovieThumbnail7}" alt="${recommendMovieTitle7} 썸네일"><span class="banner_movie_title" style="background: #FF3253">${recommendMovieTitle7}</span></a></div>
                        <div class="swiper-slide"><a href="Movie_information?movieNo=${recommendMovieNo8}" class="gallbox"><img src="${recommendMovieThumbnail8}" alt="${recommendMovieTitle8} 썸네일"><span class="banner_movie_title" style="background: #B9062D">${recommendMovieTitle8}</span></a></div>
                        <div class="swiper-slide"><a href="Movie_information?movieNo=${recommendMovieNo9}" class="gallbox"><img src="${recommendMovieThumbnail9}" alt="${recommendMovieTitle9} 썸네일"><span class="banner_movie_title" style="background: #8C0120">${recommendMovieTitle9}</span></a></div>
                        <div class="swiper-slide"><a href="Movie_category_sorted.jsp" class="gallbox"><img src="assets/img/more_view_icon.png" alt="더보기 아이콘" class="more_view_icon"><span class="more_text">더보기</span></a></div>
                    </div>
                    <!-- Add Pagination -->
                    <!-- <div class="swiper-pagination"></div> -->
                </div>
            </div>

            <!--쿠폰 박스-->
            <div class="coupon_box">이번달의 쿠폰을 만나보세요!</div>

             <!--추천 카테고리 박스-->
            <div class="movie_box">
                 <!-- 해당 추천 카테고리 링크(ex. 영화와 함께 힐링 여행!) -->
                <a href="Movie_category_sorted?categoryTypeNo=1" class="movie_box_header clearfix">
                <span class="title">손발에 땀이나는 액션 무비!</span><img src="assets/img/right.png" class="right" /></a>
                 <!-- 해당 추천 카테고리 영화 리스트 -->
                <div class="movie_list">
                    <!-- Swiper -->
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
	                        <c:forEach var="item" items="${homeMovieSlider}" varStatus="status"> 
	                    		<div class="swiper-slide"><a href="Movie_information?movieNo=${item.movie_no}" class="gallbox">
	                    		<img src="${item.thumbnail}" alt="${item.name} 썸네일">
	                    		<span class="movie_title">${item.name}</span>
	                    		<span class="type">${item.type}</span>
	                    		<span class="price">${item.price}<img id="coin" src="assets/img/coin_icon.png"/></span>
	                    		<del class="sale">${item.sale}<img id="coin" src="assets/img/coin_icon.png"/></del></a></div>
	                    	</c:forEach>
                        </div>
                    <!-- Add Pagination -->
                    <!-- <div class="swiper-pagination"></div> -->
                    </div>
                </div>
            </div>

            <!-- TOP100 박스 -->
            <div class="top100_box">
                <!-- 해당 추천 카테고리 링크(ex. 영화와 함께 힐링 여행!) -->
                <a href="Movie_top100.jsp" class="movie_box_header clearfix"><span class="title">TOP100</span><img src="assets/img/right.png" class="right" /></a>
                <!-- TOP100 영화 리스트 -->
                <div class="top100_list">
                    <div class="slides">
	                    <c:forEach var="k" begin="0" end="3" step="1">
	                    	<ul class="slide_box">
	                        	<li>
			                        <c:forEach var="i" begin="${k*5}" end="${k*5+4}" step="1" varStatus="status"> 
			                    		<c:set var="MovieNo" value="top100MovieNo${status.index}" />
			                    		<c:set var="MovieTitle" value="top100MovieTitle${status.index}" />
			                    		<c:set var="MovieThumbnail" value="top100MovieThumbnail${status.index}" />
			                    		<c:set var="MovieType" value="top100MovieType${status.index}" />
			                    		<c:set var="MoviePrice" value="top100MoviePrice${status.index}" />
			                    		<a href="Movie_information?movieNo=${requestScope[MovieNo]}">
			                                <img src="${requestScope[MovieThumbnail]}" alt="${requestScope[MovieTitle]} 썸네일">
			                                <span class="lank">${i + 1}</span>
			                                <span class="movie_title">${requestScope[MovieTitle]}</span>
			                                <span class="type">${requestScope[MovieType]}</span>
			                                <span class="price">${requestScope[MoviePrice]}<img id="top100_coin" src="assets/img/coin_icon.png"/></span>
			                                <span id="lank_change" class="lank_change_up">1▲</span>
		                            	</a>
			                    	</c:forEach>
			                    </li>
                        	</ul>
		                </c:forEach>
                    </div>
                </div>
            </div>

            <!-- 할인중인 영화 -->
            <div class="movie_box">
                <!-- 해당 추천 카테고리 링크(ex. 영화와 함께 힐링 여행!) -->
                <a href="Movie_free" class="movie_box_header clearfix"><span class="title">놓치면 후회! 할인중인 영화</span><img src="assets/img/right.png" class="right" /></a>
                <!-- 해당 추천 카테고리 영화 리스트 -->
                <div class="movie_list">
                    <!-- Swiper -->
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <c:forEach var="item" items="${saleMovieSlider}" varStatus="status"> 
	                    		<div class="swiper-slide"><a href="Movie_information?movieNo=${item.movie_no}" class="gallbox">
	                    		<img src="${item.thumbnail}" alt="${item.name} 썸네일">
	                    		<span class="movie_title">${item.name}</span>
	                            <span class="type">${item.type}</span>
	                            <span class="price">${item.price}<img id="coin" src="assets/img/coin_icon.png"/></span>
	                            <del class="sale">${item.sale}<img id="coin" src="assets/img/coin_icon.png"/></del></a></div>
	                    	</c:forEach>
                        </div>
                    <!-- Add Pagination -->
                    <!-- <div class="swiper-pagination"></div> -->
                    </div>
                </div>
            </div>

            <!-- 마블 시네마틱 유니버스 -->
            <div class="movie_box">
                <!-- 해당 추천 카테고리 링크(ex. 영화와 함께 힐링 여행!) -->
                <a href="Movie_category_sorted.jsp" class="movie_box_header clearfix"><span class="title">마블 시네마틱 유니버스</span><img src="assets/img/right.png" class="right" /></a>
                 <!-- 해당 추천 카테고리 영화 리스트 -->
                <div class="movie_list">
                    <!-- Swiper -->
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <c:forEach var="i" begin="0" end="9" step="1" varStatus="status"> 
	                    		<c:set var="MovieNo" value="marvelMovieNo${status.index}" />
	                    		<c:set var="MovieTitle" value="marvelMovieTitle${status.index}" />
	                    		<c:set var="MovieThumbnail" value="marvelMovieThumbnail${status.index}" />
	                    		<c:set var="MovieType" value="marvelMovieType${status.index}" />
	                    		<c:set var="MoviePrice" value="marvelMoviePrice${status.index}" />
	                    		<c:set var="MovieSalePrice" value="marvelMovieSalePrice${status.index}" />
	                    		<div class="swiper-slide"><a href="Movie_information?movieNo=${requestScope[MovieNo]}" class="gallbox"><img
	                            src="${requestScope[MovieThumbnail]}" alt="${requestScope[MovieTitle]} 썸네일"><span class="movie_title">${requestScope[MovieTitle]}</span><span class="type">${requestScope[MovieType]}</span><span class="price">${requestScope[MovieSalePrice]}<img id="coin" src="assets/img/coin_icon.png"/></span><del class="sale">${requestScope[MoviePrice]}<img id="coin" src="assets/img/coin_icon.png"/></del></a></div>
	                    	</c:forEach>
                        </div>
                    <!-- Add Pagination -->
                    <!-- <div class="swiper-pagination"></div> -->
                    </div>
                </div>
            </div>

            <!-- 무료영화 박스 -->
            <div class="free_movie_box">
                <!-- 무료영화 링크 -->
                <a href="Movie_free.jsp" class="movie_box_header clearfix"><span class="title">무료영화</span><img src="assets/img/right.png" class="right" /></a>
                <!-- 무료 영화 리스트 -->
                <div class="free_movie_list">
                    <c:forEach var="i" begin="0" end="2" step="1" varStatus="status"> 
	                    <c:set var="MovieNo" value="freeMovieNo${status.index}" />
	                    <c:set var="MovieTitle" value="freeMovieTitle${status.index}" />
	                    <c:set var="MovieThumbnail" value="freeMovieThumbnail${status.index}" />
	                    <c:set var="MovieAge" value="freeMovieAge${status.index}" />
	                    <c:set var="MovieRuntime" value="freeMovieRuntime${status.index}" />
	                    <c:set var="MovieDate" value="freeMovieDate${status.index}" />
	                    <a href="Movie_information?movieNo=${requestScope[MovieNo]}">
	                        <img src="${requestScope[MovieThumbnail]}" alt="${requestScope[MovieTitle]} 썸네일">
	                        <span class="movie_title">${requestScope[MovieTitle]}</span>
	                        <span class="age">${requestScope[MovieAge]} 관람가<span> | ${requestScope[MovieRuntime]}</span></span>
	                        <span class="free_date">${requestScope[MovieDate]}</span>
                    	</a>
	                </c:forEach>
                </div>
            </div>

            <!-- 원작보다 더 재밌는 영화 -->
            <div class="movie_box">
                <!-- 해당 추천 카테고리 링크(ex. 영화와 함께 힐링 여행!) -->
                <a href="Movie_category_sorted" class="movie_box_header clearfix"><span class="title">원작보다 더 재밌는 영화</span><img src="assets/img/right.png" class="right" /></a>
                 <!-- 해당 추천 카테고리 영화 리스트 -->
                <div class="movie_list">
                    <!-- Swiper -->
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <c:forEach var="i" begin="0" end="9" step="1" varStatus="status"> 
	                    		<c:set var="MovieNo" value="newestMovieNo${status.index}" />
	                    		<c:set var="MovieTitle" value="newestMovieTitle${status.index}" />
	                    		<c:set var="MovieThumbnail" value="newestMovieThumbnail${status.index}" />
	                    		<c:set var="MovieType" value="newestMovieType${status.index}" />
	                    		<c:set var="MoviePrice" value="newestMoviePrice${status.index}" />
	                    		<c:set var="MovieSalePrice" value="newestMovieSalePrice${status.index}" />
	                    		<div class="swiper-slide"><a href="Movie_information?movieNo=${requestScope[MovieNo]}" class="gallbox"><img
	                            src="${requestScope[MovieThumbnail]}" alt="${requestScope[MovieTitle]} 썸네일"><span class="movie_title">${requestScope[MovieTitle]}</span><span class="type">${requestScope[MovieType]}</span><span class="price">${requestScope[MovieSalePrice]}<img id="coin" src="assets/img/coin_icon.png"/></span><del class="sale">${requestScope[MoviePrice]}<img id="coin" src="assets/img/coin_icon.png"/></del></a></div>
	                    	</c:forEach>
                        </div>
                    <!-- Add Pagination -->
                    <!-- <div class="swiper-pagination"></div> -->
                    </div>
                </div>
            </div>

            <!-- 분노의 질주 시리즈 -->
            <div class="movie_box">
                <!-- 해당 추천 카테고리 링크(ex. 영화와 함께 힐링 여행!) -->
                <a href="Movie_category_sorted.jsp" class="movie_box_header clearfix"><span class="title">분노의 질주 시리즈</span><img src="assets/img/right.png" class="right" /></a>
                <!-- 해당 추천 카테고리 영화 리스트 -->
                <div class="movie_list">
                    <!-- Swiper -->
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <c:forEach var="i" begin="0" end="9" step="1" varStatus="status"> 
	                    		<c:set var="MovieNo" value="disneyMovieNo${status.index}" />
	                    		<c:set var="MovieTitle" value="disneyMovieTitle${status.index}" />
	                    		<c:set var="MovieThumbnail" value="disneyMovieThumbnail${status.index}" />
	                    		<c:set var="MovieType" value="disneyMovieType${status.index}" />
	                    		<c:set var="MoviePrice" value="disneyMoviePrice${status.index}" />
	                    		<c:set var="MovieSalePrice" value="disneyMovieSalePrice${status.index}" />
	                    		<div class="swiper-slide"><a href="Movie_information?movieNo=${requestScope[MovieNo]}" class="gallbox"><img
	                            src="${requestScope[MovieThumbnail]}" alt="${requestScope[MovieTitle]} 썸네일"><span class="movie_title">${requestScope[MovieTitle]}</span><span class="type">${requestScope[MovieType]}</span><span class="price">${requestScope[MovieSalePrice]}<img id="coin" src="assets/img/coin_icon.png"/></span><del class="sale">${requestScope[MoviePrice]}<img id="coin" src="assets/img/coin_icon.png"/></del></a></div>
	                    	</c:forEach>
                        </div>
                    <!-- Add Pagination -->
                    <!-- <div class="swiper-pagination"></div> -->
                    </div>
                </div>
            </div>

            <!-- Category List -->
            <div class="category_list">
                <!-- 장르별 카테고리 -->
            	<ul>
	                <c:forEach var="item" items="${HomeCategoryType}" varStatus="status"> 
	                    <li class="clearfix">
		                    <a href="Category_sorted?categoryTypeNo=${item.category_type_no}">
		                        <img class="icon" src="${item.icon}" />
		                        <span class="list">${item.name}</span>
		                        <img src="assets/img/right.png" class="right" />
		                    </a>
	                	</li>
	            	</c:forEach>
                </ul>
                <!-- 더보기 영역 -->
                <div class="more hidden_category">
	                <ul>
	                    <c:forEach var="item" items="${HomeCategoryTypePlus}" varStatus="status"> 
		                    <li class="clearfix">
			                    <a href="Category_sorted?categoryTypeNo=${item.category_type_no}">
			                        <img class="icon" src="${item.icon}" />
			                        <span class="list">${item.name}</span>
			                        <img src="assets/img/right.png" class="right" />
			                    </a>
		                	</li>
		            	</c:forEach>
	                </ul>
                </div>
            </div>
            <div class="category_more"><span class="add">더보기 +</span><span class="remove hidden_category">접기 -</span></div>
        </div>
       


    <!--footer-->
    <%@ include file="assets/inc/footer.jsp" %>

    <!-- BOT BAR -->
    <%@ include file="assets/inc/bot_bar.jsp" %>
</div>
  <script>

    // 영화 박스 슬라이더
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 2.5,   // 보이는 개수
      freeMode: true,       // 자유 이동
    });

    // 배너 박스 슬라이더
    var swiper = new Swiper('.swiper-container2', {
      slidesPerView: 3,     // 보이는 개수
      freeMode: false,      // 자유 이동
    });

    $(function() {
    	$(".bot_bar_icon").eq(0).attr("src", "assets/img/home_icon_selected.png");
    	$(".top_bar_list").eq(0).addClass("selected");
    	
    	for ( var i = 0 ; i < $(".swiper-wrapper .sale").length ; i++ ){
	    	if ($(".swiper-wrapper .sale").eq(i).html() == $(".swiper-wrapper .price").eq(i).html()) {
	    		$(".swiper-wrapper .sale").eq(i).html("")
	    	}
    	}
    	
        // top 100 슬라이더 플러그인
        $(".slides").slick({
            arrows:false,       // 양옆 화살표
            infinite:false      // 무한 모드
        });

        /** 카테고리 더보기 버튼의 클릭 처리 */
        $(".remove").click(function(e) {
            // 페이지 이동 방지
            e.preventDefault();
            // 클릭된 요소를 제외한 나머지에게 selected 클래스 제거 --> css 적용
            $(".add").removeClass("hidden_category")
            // 클릭된 요소에게 selected 클래스 적용 --> css 적용
            $(".remove").addClass("hidden_category");
            $(".more").addClass("hidden_category");
        });

        $(".add").click(function(e) {
            // 페이지 이동 방지
            e.preventDefault();
            // 클릭된 요소를 제외한 나머지에게 selected 클래스 제거 --> css 적용
            $(".remove").removeClass("hidden_category")
            $(".more").removeClass("hidden_category")
            // 클릭된 요소에게 selected 클래스 적용 --> css 적용
            $(".add").addClass("hidden_category");
        });

        // 쿠폰박스 클릭시
        $(".coupon_box").click(function() {
                swal({
                showConfirmButton: true,
                showCancelButton: true,
                confirmButtonColor:  "#FF3253",
                confirmButtonText: "<span style='color:#FFFBFC; font-weight:bold;'>쿠폰 지급받기</span>",
                // cancelButtonColor:  "#FF3253",
                cancelButtonText: "<span style='color:#FFFBFC; font-weight:bold;'>취소</span>",
                html:'<div>' +
                        '<ul class="clear coupon">' +
                            '<li class="pull_left coupon_left">' +
                                '<h4 style="font-weight: bold; margin: 0; height:25px; line-height: 25px;text-overflow: ellipsis;white-space: nowrap;overflow: hidden; font-size:0.9em;">${coupon_name}</h4><span style="display: block; font-size: 12px; color: #aaa; line-height:18px; height:18px;">구매/대여시</span><span style="display: block; font-size: 12px; color: #aaa; line-height:18px; height:18px;">${coupon_date} 까지</span><span style="display:block; font-size: 12px; color: #aaa; line-height:18px; height:18px;">쿠폰 한 장당 1회만 결제 가능</span></li>' +
                            '<li class="pull_left coupon_right"><span style="display: block; margin-top:31px;"><fmt:formatNumber value="${coupon_price}" pattern="#,###" />코인</span><span style="display: block;">할인</span></li>' +
                        '</ul>' +
                    '</div>'
                }).then(function(result){
                    if (result.value) {     // 확인 버튼이 눌러진 경우
                    	$.post('coupon_add_ok.do',{coupon_no: "${coupon_no}"},function(req){
                    		if (req == 1) {
                    			//  swal("쿠폰 지급 성공!", "성공적으로 지급되었습니다.", "success");
                                swal({
                                    timer:1500,
                                    html:"<div style='font-weight: bold; margin-bottom: 20px;'>쿠폰 지급 성공!<br/>성공적으로 지급되었습니다.</div>",
                                    type:"success",
                                    allowOutsideClick: false,
                                    showConfirmButton: false
                                });
                    		} else if (req == 0){
                    			swal({
                                    timer:1500,
                                    html:"<div style='font-weight: bold; margin-bottom: 20px;'>이미 쿠폰이 지급되었습니다.</div>",
                                    type:"error",
                                    allowOutsideClick: false,
                                    showConfirmButton: false
                                })
                    		} else {
                    			$(location).attr('href','Login');
                    		}
                    	});
                    } else if (result.dismiss === "cancel") {   // 취소버튼이 눌러진 경우
                        // swal("취소", "삭제가 취소되었습니다.", "error");
                    }
                })
            });
    }); //end $(function(){})
  </script>
</body>
</html>