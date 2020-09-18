<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<%@ include file="assets/inc/header.jsp" %>

<style type="text/css">

* {
    font-family: 'Nanum Gothic', sans-serif;
}

html, body {
    width: 100%;
    height: 100%;
}

.clearfix:after {
    clear: both;
    content: "";
    float: none;
    display: block;
}

/** 카테고리 종류 버튼 */
.category_top_button .pull_left {
    float: left;
    width: 25%;
    height: 30px;
    text-align: center;
}

.category_page_link {
    color: #aaa;
    font-weight: bold;
    text-decoration: none;
    line-height: 30px;
    font-size: 0.9em;
    display: inline-block;
}

.hide {
    display: none;
}

.category_top_button .size {
    width: 85%;
    margin: auto;
}

.category_top_button .selected {
    color: #E61A3F;
}

.category_top_button {
    position: sticky;
    width: 100%;
    top: 39px;
    height: 30px;
    border-bottom: 1px solid #b8b8b8;
    background: #fff;
    z-index: 10;
    box-sizing: border-box;
}

/** 카테고리 리스트 공통사항 */
.category_list {
    background-color: #fff;
    padding-bottom: 50px;
}

.category_list li {
    list-style: none;
    height: 50px;
}

.category_list .icon {
    height: 36px;
    width: 36px;
    margin: 7px;
    float: left;
    padding-left: 10px;
}

.category_list .fix {
    padding-top: 5px;
    padding-left: 12px;
    padding-right: 5px;
    height: 30px;
    line-height: 30px;
    width: 30px;
}

.category_list .right {
    float: right;
    height: 30px;
    padding-top: 10px;
    padding-right: 20px;
}

.category_list a {
    display: block;
    height: 100%;
    box-sizing: border-box;
    border-bottom: 1px solid #eee;
}

.category_list .list {
    display: block;
    float: left;
    width: 200px;
    height: 50px;
    line-height: 51px;
    font-weight: bold;
    font-size: 1em;
    text-indent: 10px;
    color: #222;
}

</style>
</head>

<body>

    <!--TOP LOGO-->
    <%@ include file="assets/inc/top_logo.jsp" %>
    
    <!--TOP BAR-->
    <%@ include file="assets/inc/top_bar.jsp" %>

    <!-- Category Top -->
    <div class="category_top_button clearfix">
       <ul class="size">
            <li class="category_button pull_left">
                <a href=".category_page_genre" class="category_page_link selected">장르별</a>
            </li>
            <li class="category_button pull_left">
                <a href=".category_page_product" class="category_page_link">상품별</a>
            </li>
        </ul>
    </div>

    <!-- Category List -->
    <div class="category_list">
        <!-- 장르별 카테고리 -->
        <div class="category_page_genre">
            <ul>
           		<c:forEach var="item" items="${categoryTypeG}" varStatus="status"> 
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

        <!-- 상품별 카테고리 -->
        <div class="category_page_product hide">
            <ul>
                <c:forEach var="item" items="${categoryTypeP}" varStatus="status"> 
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

    <!-- BOT BAR -->
    <%@ include file="assets/inc/bot_bar.jsp" %>

    <script type="text/javascript">
        $(function() {
        	// top_bar
        	$(".top_bar_list").eq(3).addClass("selected");
        	$(".bot_bar_icon").eq(0).attr("src", "assets/img/home_icon_selected.png")
        	
            /** 카테고리 버튼의 클릭 처리 */
            $(".category_page_link").click(function(e) {
                // 페이지 이동 방지
                e.preventDefault();

                // 클릭된 요소를 제외한 나머지에게 selected 클래스 제거 --> css 적용
                $(".category_page_link").not(this).removeClass("selected");

                // 클릭된 요소에게 selected 클래스 적용 --> css 적용
                $(this).addClass("selected");

                var target = $(this).attr("href");
                $(target).removeClass("hide");
                $(".category_list > div").not($(target)).addClass("hide");
            });
        }); // end $(function() {})
    </script>
</body>

</html>