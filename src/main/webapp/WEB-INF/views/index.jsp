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
                       <c:forEach var="item" items="${RecommandMovieSlider}" varStatus="status">
                           <div class="swiper-slide"><a href="Movie_information?movieNo=${item.movie_no}" class="gallbox">
                            <img src="${item.thumbnail}" alt="${item.name} 썸네일">
                           <span class="banner_movie_title" style="background: ${color[status.count-1]}">${item.name}</span></a></div> 
                       </c:forEach>
           
                        <div class="swiper-slide"><a href="Movie_category_sorted?categoryTypeNo=1001" class="gallbox">
                        <img src="assets/img/more_view_icon.png" alt="더보기 아이콘" class="more_view_icon">
                        <span class="more_text">더보기</span></a></div>
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
                	<span class="title">손발에 땀이나는 액션 무비!</span><img src="assets/img/right.png" class="right" />
                </a>
                 <!-- 해당 추천 카테고리 영화 리스트 -->
                <div class="movie_list">
                    <!-- Swiper -->
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                           <c:forEach var="item" items="${actionMovieSlider}" varStatus="status"> 
                             <div class="swiper-slide">
	                             <a href="Movie_information?movieNo=${item.movie_no}" class="gallbox">
	                             <img src="${item.thumbnail}" alt="${item.name} 썸네일">
	                             <span class="movie_title">${item.name}</span>
	                             <span class="type">${item.type}</span>
	                             <c:if test="${item.sale != 0}">
		                         	<span class="price"><fmt:formatNumber value="${item.sale}" pattern="#,###" /><img id="coin" src="assets/img/coin_icon.png"/></span>
		                         	<del class="sale"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img id="coin" src="assets/img/coin_icon.png"/></del>
		                         </c:if>
		                         <c:if test="${item.sale == 0}">
		                         	<span class="price">무료</span>
		                         	<del class="sale">무료</del>
		                         </c:if>
                             	 </a>
                             </div>
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
                <a href="Movie_top100" class="movie_box_header clearfix"><span class="title">TOP100</span><img src="assets/img/right.png" class="right" /></a>
                <!-- TOP100 영화 리스트 -->
                <div class="top100_list">
                    <div class="slides">
                    	<ul class="slide_box">
                            <li>
                              	<c:forEach var="item" items="${dayList}" varStatus="status">
                              		<c:if test="${status.count <= 5}">
	                                   	<a href="Movie_information?movieNo=${item.movie_no}">
	                                        <img src="${item.thumbnail}" alt="${item.name} 썸네일">
	                                        <span class="lank">${status.count}</span>
	                                        <span class="movie_title">${item.name}</span>
	                                        <span class="type">${item.type}</span>
	                                        <c:if test="${item.price != 0}">
	                                        	<span class="price"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img id="top100_coin" src="assets/img/coin_icon.png"/></span>
	                                        </c:if>
	                                        <c:if test="${item.price == 0}">
	                                        	<span class="price">무료</span>
	                                        </c:if>
	                                   		<c:choose>
												<c:when test="${dailyRank[status.count-1] < 0 }">
													<span class="lank_change_down">&nbsp;${Math.abs(dailyRank[status.count-1])}▼</span>
												</c:when>
												<c:when test="${dailyRank[status.count-1] == 999 }">
													<span class="lank_change_new">&nbsp;new!</span>
												</c:when>
												<c:when test="${dailyRank[status.count-1] > 0}">
													<span class="lank_change_up">&nbsp;${dailyRank[status.count-1]}▲</span>
												</c:when>
												<c:otherwise>
													<span class="lank_change_no">&nbsp;-</span>
												</c:otherwise>
											</c:choose>
	                                   	</a>
                                    </c:if>
                            	</c:forEach>
                        	</li>
                    	</ul>
                    	<ul class="slide_box">
                            <li>
                              	<c:forEach var="item" items="${dayList}" varStatus="status">
                              		<c:if test="${status.count <= 10 and status.count > 5}">
	                                   	<a href="Movie_information?movieNo=${item.movie_no}">
	                                        <img src="${item.thumbnail}" alt="${item.name} 썸네일">
	                                        <span class="lank">${status.count}</span>
	                                        <span class="movie_title">${item.name}</span>
	                                        <span class="type">${item.type}</span>
	                                        <c:if test="${item.price != 0}">
	                                        	<span class="price"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img id="top100_coin" src="assets/img/coin_icon.png"/></span>
	                                        </c:if>
	                                        <c:if test="${item.price == 0}">
	                                        	<span class="price">무료</span>
	                                        </c:if>
	                                   		<c:choose>
												<c:when test="${dailyRank[status.count-1] < 0 }">
													<span class="lank_change_down">&nbsp;${Math.abs(dailyRank[status.count-1])}▼</span>
												</c:when>
												<c:when test="${dailyRank[status.count-1] == 999 }">
													<span class="lank_change_new">&nbsp;new!</span>
												</c:when>
												<c:when test="${dailyRank[status.count-1] > 0}">
													<span class="lank_change_up">&nbsp;${dailyRank[status.count-1]}▲</span>
												</c:when>
												<c:otherwise>
													<span class="lank_change_no">&nbsp;-</span>
												</c:otherwise>
											</c:choose>
	                                   	</a>
                                    </c:if>
                            	</c:forEach>
                        	</li>
                    	</ul>
                    	<ul class="slide_box">
                            <li>
                              	<c:forEach var="item" items="${dayList}" varStatus="status">
                              		<c:if test="${status.count <= 15 and status.count > 10}">
	                                   	<a href="Movie_information?movieNo=${item.movie_no}">
	                                        <img src="${item.thumbnail}" alt="${item.name} 썸네일">
	                                        <span class="lank">${status.count}</span>
	                                        <span class="movie_title">${item.name}</span>
	                                        <span class="type">${item.type}</span>
	                                        <c:if test="${item.price != 0}">
	                                        	<span class="price"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img id="top100_coin" src="assets/img/coin_icon.png"/></span>
	                                        </c:if>
	                                        <c:if test="${item.price == 0}">
	                                        	<span class="price">무료</span>
	                                        </c:if>
	                                   		<c:choose>
												<c:when test="${dailyRank[status.count-1] < 0 }">
													<span class="lank_change_down">&nbsp;${Math.abs(dailyRank[status.count-1])}▼</span>
												</c:when>
												<c:when test="${dailyRank[status.count-1] == 999 }">
													<span class="lank_change_new">&nbsp;new!</span>
												</c:when>
												<c:when test="${dailyRank[status.count-1] > 0}">
													<span class="lank_change_up">&nbsp;${dailyRank[status.count-1]}▲</span>
												</c:when>
												<c:otherwise>
													<span class="lank_change_no">&nbsp;-</span>
												</c:otherwise>
											</c:choose>
	                                   	</a>
                                    </c:if>
                            	</c:forEach>
                        	</li>
                    	</ul>
                    	<ul class="slide_box">
                            <li>
                              	<c:forEach var="item" items="${dayList}" varStatus="status">
                              		<c:if test="${status.count <= 20 and status.count > 15}">
	                                   	<a href="Movie_information?movieNo=${item.movie_no}">
	                                        <img src="${item.thumbnail}" alt="${item.name} 썸네일">
	                                        <span class="lank">${status.count}</span>
	                                        <span class="movie_title">${item.name}</span>
	                                        <span class="type">${item.type}</span>
	                                        <c:if test="${item.price != 0}">
	                                        	<span class="price"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img id="top100_coin" src="assets/img/coin_icon.png"/></span>
	                                        </c:if>
	                                        <c:if test="${item.price == 0}">
	                                        	<span class="price">무료</span>
	                                        </c:if>
	                                   		<c:choose>
												<c:when test="${dailyRank[status.count-1] < 0 }">
													<span class="lank_change_down">&nbsp;${Math.abs(dailyRank[status.count-1])}▼</span>
												</c:when>
												<c:when test="${dailyRank[status.count-1] == 999 }">
													<span class="lank_change_new">&nbsp;new!</span>
												</c:when>
												<c:when test="${dailyRank[status.count-1] > 0}">
													<span class="lank_change_up">&nbsp;${dailyRank[status.count-1]}▲</span>
												</c:when>
												<c:otherwise>
													<span class="lank_change_no">&nbsp;-</span>
												</c:otherwise>
											</c:choose>
	                                   	</a>
                                    </c:if>
                            	</c:forEach>
                        	</li>
                    	</ul>
                    </div>
                </div>
            </div>

            <!-- 할인중인 영화 -->
            <div class="movie_box">
                <!-- 해당 추천 카테고리 링크(ex. 영화와 함께 힐링 여행!) -->
                <a href="Movie_category_sorted?categoryTypeNo=1000" class="movie_box_header clearfix"><span class="title">놓치면 후회! 할인중인 영화</span><img src="assets/img/right.png" class="right" /></a>
                <!-- 해당 추천 카테고리 영화 리스트 -->
                <div class="movie_list">
                    <!-- Swiper -->
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
	                        <c:forEach var="item" items="${saleMovieSlider}" varStatus="status"> 
                             <div class="swiper-slide">
	                             <a href="Movie_information?movieNo=${item.movie_no}" class="gallbox">
	                             <img src="${item.thumbnail}" alt="${item.name} 썸네일">
	                             <span class="movie_title">${item.name}</span>
	                             <span class="type">${item.type}</span>
	                             <c:if test="${item.sale != 0}">
		                         	<span class="price"><fmt:formatNumber value="${item.sale}" pattern="#,###" /><img id="coin" src="assets/img/coin_icon.png"/></span>
		                         	<del class="sale"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img id="coin" src="assets/img/coin_icon.png"/></del>
		                         </c:if>
		                         <c:if test="${item.sale == 0}">
		                         	<span class="price">무료</span>
		                         	<del class="sale">무료</del>
		                         </c:if>
                             	 </a>
                             </div>
                          </c:forEach>
                        </div>
                    <!-- Add Pagination -->
                    <!-- <div class="swiper-pagination"></div> -->
                    </div>
                </div>
            </div>

            <!-- 마동석 출연 영화 -->
            <div class="movie_box">
                <!-- 해당 추천 카테고리 링크(ex. 영화와 함께 힐링 여행!) -->
                <a class="movie_box_header clearfix"><span class="title">귀염뽀짝 마블리♥ 마동석 출연 영화</span></a>
                 <!-- 해당 추천 카테고리 영화 리스트 -->
                <div class="movie_list">
                    <!-- Swiper -->
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <c:forEach var="item" items="${marvelyMovieSlider}" varStatus="status"> 
                             <div class="swiper-slide">
	                             <a href="Movie_information?movieNo=${item.movie_no}" class="gallbox">
	                             <img src="${item.thumbnail}" alt="${item.name} 썸네일">
	                             <span class="movie_title">${item.name}</span>
	                             <span class="type">${item.type}</span>
	                             <c:if test="${item.sale != 0}">
		                         	<span class="price"><fmt:formatNumber value="${item.sale}" pattern="#,###" /><img id="coin" src="assets/img/coin_icon.png"/></span>
		                         	<del class="sale"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img id="coin" src="assets/img/coin_icon.png"/></del>
		                         </c:if>
		                         <c:if test="${item.sale == 0}">
		                         	<span class="price">무료</span>
		                         	<del class="sale">무료</del>
		                         </c:if>
                             	 </a>
                             </div>
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
                <a href="Movie_free" class="movie_box_header clearfix"><span class="title">무료영화</span><img src="assets/img/right.png" class="right" /></a>
                <!-- 무료 영화 리스트 -->
                <div class="free_movie_list">
                    <c:forEach var="item" items="${freeMovie}" varStatus="status"> 
                    	<c:if test="${status.count < 4}">
	                    	<a href="Movie_information?movieNo=${item.movie_no}">
	                        	<img src="${item.thumbnail}" alt="${item.name} 썸네일">
	                            <span class="movie_title">${item.name}</span>
	                            <span class="age">${item.age}<span> | ${item.runtime}</span></span>
	                            <span class="free_date">${item.period} 까지</span>
	                    	</a>
                    	</c:if>
                    </c:forEach>
                </div>
            </div>

            <!-- 애니메이션 영화 -->
            <div class="movie_box">
                <!-- 해당 추천 카테고리 링크(ex. 영화와 함께 힐링 여행!) -->
                <a href="Movie_category_sorted?categoryTypeNo=7" class="movie_box_header clearfix"><span class="title">2D? 3D? 차원을 넘나드는 애니메이션!</span><img src="assets/img/right.png" class="right" /></a>
                 <!-- 해당 추천 카테고리 영화 리스트 -->
                <div class="movie_list">
                    <!-- Swiper -->
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                           <c:forEach var="item" items="${animationSlider}" varStatus="status"> 
                             <div class="swiper-slide">
	                             <a href="Movie_information?movieNo=${item.movie_no}" class="gallbox">
	                             <img src="${item.thumbnail}" alt="${item.name} 썸네일">
	                             <span class="movie_title">${item.name}</span>
	                             <span class="type">${item.type}</span>
	                             <c:if test="${item.sale != 0}">
		                         	<span class="price"><fmt:formatNumber value="${item.sale}" pattern="#,###" /><img id="coin" src="assets/img/coin_icon.png"/></span>
		                         	<del class="sale"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img id="coin" src="assets/img/coin_icon.png"/></del>
		                         </c:if>
		                         <c:if test="${item.sale == 0}">
		                         	<span class="price">무료</span>
		                         	<del class="sale">무료</del>
		                         </c:if>
                             	 </a>
                             </div>
                          </c:forEach>
                        </div>
                    <!-- Add Pagination -->
                    <!-- <div class="swiper-pagination"></div> -->
                    </div>
                </div>
            </div>

            <!-- 해리포터 시리즈 -->
            <div class="movie_box">
                <!-- 해당 추천 카테고리 링크(ex. 영화와 함께 힐링 여행!) -->
                <a class="movie_box_header clearfix"><span class="title">호그와트로 떠나는 마법여행! 해리 포터 시리즈</span></a>
                <!-- 해당 추천 카테고리 영화 리스트 -->
                <div class="movie_list">
                    <!-- Swiper -->
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                             <c:forEach var="item" items="${harryPotterMovieSlider}" varStatus="status"> 
	                             <div class="swiper-slide">
		                             <a href="Movie_information?movieNo=${item.movie_no}" class="gallbox">
		                             <img src="${item.thumbnail}" alt="${item.name} 썸네일">
		                             <span class="movie_title">${item.name}</span>
		                             <span class="type">${item.type}</span>
		                             <c:if test="${item.sale != 0}">
			                         	<span class="price"><fmt:formatNumber value="${item.sale}" pattern="#,###" /><img id="coin" src="assets/img/coin_icon.png"/></span>
			                         	<del class="sale"><fmt:formatNumber value="${item.price}" pattern="#,###" /><img id="coin" src="assets/img/coin_icon.png"/></del>
			                         </c:if>
			                         <c:if test="${item.sale == 0}">
			                         	<span class="price">무료</span>
			                         	<del class="sale">무료</del>
			                         </c:if>
	                             	 </a>
	                             </div>
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
                          <a href="Movie_category_sorted?categoryTypeNo=${item.category_type_no}">
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
                             <a href="Movie_category_sorted?categoryTypeNo=${item.category_type_no}">
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