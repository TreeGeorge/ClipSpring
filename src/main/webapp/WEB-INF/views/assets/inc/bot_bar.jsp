<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<style>
.clearfix:after {
    clear: both;
    content: "";
    float: none;
    display: block;
}

#bot_bar .pull_left {
    background: #f5f7f8;
    float: left;
    width: 25%;
    height: 50px;
}

.hidden {
    display: none;
}

#bot_bar {
    text-align: center;
    position: fixed;
    bottom: 0;
    width: 100%;
    line-height: 50px;
    z-index: 100;
    height: 50px;
}

#bot_bar img {
    height: 50px;
}
</style>

<div id="bot_bar">
	<ul class="clearfix">
		<li class="pull_left">
			<!-- 홈버튼 -->
			<a href="home"><img class="bot_bar_icon" src="${pageContext.request.contextPath}/assets/img/home_icon.png" alt="홈"></a>
		</li>
		<li class="pull_left">
			<!-- 검색 -->
			<a href="Movie_search.jsp"><img class="bot_bar_icon" src="${pageContext.request.contextPath}/assets/img/search_icon.png" alt="검색"></a>
		</li>
		<li class="pull_left">
			<!-- 장바구니 -->
			<a href="Wish_list"><img class="bot_bar_icon" src="${pageContext.request.contextPath}/assets/img/wish_icon.png" alt="장바구니"></a>
		</li>
		<li class="pull_left">
			<!-- 로그인페이지 or 마이페이지 -->
			<span class="login_status"><a href="MY_movie"><img class="bot_bar_icon" src="${pageContext.request.contextPath}/assets/img/my_page_icon.png" alt="로그인페이지"></a>
			</span>
		</li>
	</ul>
</div>

<!-- $(".bot_bar_icon").eq(i).attr("src", "assets/img/해당페이지_icon_selected.png"); -->