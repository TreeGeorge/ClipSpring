<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp"%>
<style type="text/css">

/* 무료영화 배너 박스 */
.Banner_box {
	width: 100%;
	height: 80px;
	background-color: #B9062D;
	position: relative;
}
/* 배너박스 안에 "이주의 무료영화"*/
.Banner_box li:first-child {
	height: 50px;
	text-align: left;
	color: #fff;
	line-height: 60px;
	font-size: 20px;
	font-weight: bold;
	width: 50%;
	display: block;
	padding-left: 35px;
}
/* 배너박스 안에 "금요일마다 베스트 영화가 무료!" */
.Banner_box li:nth-child(2) {
	color: #ccc;
	font-size: 10px;
	display: block;
	font-size: 12px;
	line-height: 10px;
	width: 50%;
	padding-left: 35px;
}
/* 베너박스 아이콘 */
.Banner_box img {
	position: absolute;
	width: 60px;
	height: 60px;
	display: block;
	float: right;
	right: 50px;
	top: 10px;
}
/** 무료 영화 리스트 */
.Free_movie_box .Free_movie {
	position: relative;
	width: 100%;
	display: block;
	height: 150px;
	text-decoration: none;
	background-color: #fff;
	color: #222;
	box-sizing: border-box;
	border-bottom: 1px solid #eee;
}
/* 영화 제목 */
.Free_movie .Movie_title {
	display: block;
	position: absolute;
	left: 120px;
	top: 15px;
	font-weight: bold;
	font-size: 16px;
	width: 50%;
	height: 30px;
	line-height: 30px;
	display: block;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	text-align: left;
}
/* 영화 관람가 */
.Free_movie .Age {
	display: block;
	position: absolute;
	left: 120px;
	top: 50px;
	font-size: 12px;
	line-height: 20px;
	height: 20px;
	color: #aaa;
}
/* 영화 남은 기간 */
.Free_movie .Period {
	display: block;
	position: absolute;
	left: 145px;
	top: 75px;
	font-size: 12px;
	line-height: 20px;
	height: 20px;
	color: #ff3253;
}
/* 영화 남은기간 아이콘 */
.Free_movie .Period img {
	width: 20px;
	height: 20px;
	position: absolute;
	left: -30px;
	top: -5px;
}
/* 영화 썸네일 */
.Free_movie img {
	position: absolute;
	top: 5px;
	width: 100px;
	display: block;
	margin: 5px;
	left: 5px;
	height: 130px;
}
/* 영화 리스트 전체 박스 */
.Free_movie_box {
	padding-bottom: 50px;
}
</style>
</head>

<body>
	<!--전체박스-->
	<div id="container">

		<!--TOP LOGO-->
		<%@ include file="assets/inc/top_logo.jsp"%>

		<!--TOP BAR-->
		<%@ include file="assets/inc/top_bar.jsp"%>

		<!--Banner box -->
		<div class=Banner_box>
			<ul>
				<li>이주의 무료영화<img src="assets/img/freeimg.png" /></li>
				<li>금요일마다 베스트 영화가 무료!</li>
			</ul>
		</div>

		<!--페이지별 가변 요소-->
		<div id="content">
			<div class="Free_movie_box">
				<!-- 무료 영화 목록 -->
				<c:forEach var="item" items="${output}" varStatus="status">
					<a class="Free_movie" href="Movie_information.do?Movie_no=${item.movie_no}"> 
					<img src="${item.thumbnail}" alt="${item.name} 썸네일"> 
					<span class="Movie_title">${item.name}</span> 
					<span class="Age">
					<span>${item.age} | ${item.runtime}</span>
					</span>
					<span class="Period"><img src="assets/img/freecalendal.png">${item.period} 까지</span>
					</a>
				</c:forEach>
			</div>
		</div>

		<!-- BOT BAR -->
		<%@ include file="assets/inc/bot_bar.jsp"%>
	</div>
</body>
<script>
	$(".top_bar_list").eq(0).removeClass("selected")
	$(".top_bar_list").eq(1).addClass("selected")
	$(".bot_bar_icon").eq(0).attr("src", "assets/img/home_icon_selected.png");
</script>
</html>