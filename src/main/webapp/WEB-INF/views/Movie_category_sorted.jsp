<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp"%>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

</head>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
}
/* 총 n개 작품 */
.p {
	padding-top: -5px;
	height: 20px;
	color: #e61a3f;
}

.total {
	padding-top: -5px;
	padding-left: 15px;
	height: 20px;
}

.top_info {
	padding: 0px;
	margin: 0px;
}
/* 최신순 드롭박스 */
.container {
	padding: 0;
}
/* 드롭다운, n개작품 박스 */
.content {
	padding-top: 60px;
}
/* 드랍다운 css */
.selcls {
	padding: 2px;
	border: solid 1px #eee;
	outline: 0;
	background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF),
		color-stop(4%, #fff), to(#FFFFFF));
	background: -moz-linear-gradient(top, #FFFFFF, #fff 1px, #FFFFFF 25px);
	box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	-moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	width: 85px;
	height: 28px;
	float: right;
	margin-top: 3px;
	font-size: 12px;
	margin-bottom: 15px;
	margin-top: -5px;
	margin-right: 10px;
}
/* 영화 썸네일 이미지 영역 박스 */
#movie {
	width: auto;
	padding: 0px;
}
/* 한줄에 3개씩 가로배치 */
#movie li {
	width: 33.3%;
	float: left;
	padding-bottom: 15px;
}
/* 영화 썸네일 밑 글씨 block처리 */
#movie li a {
	display: block;
	width: auto;
	padding-left: 10px;
}
/* 영화 썸네일 이미지 크기 */
#movie .thumb img {
	width: auto;
	height: 150px;
	display: block;
}
/* 링크 안의 span을 block처리 */
#movie li a span {
	display: block;
	width: auto;
}
/* a태그 영화제목 밑줄 제거 */
a {
	text-decoration: none;
}

/* a태그에 hover시 밑줄 제거 */
a:hover {
	text-decoration: none;
}
/* 썸네일 밑 텍스트 영역 처리 */
.clearfix:after {
	content: "";
	display: block;
	float: none;
	clear: both;
}
/* n개작품 left */
.total {
	float: left;
	display: block;
}
/* 썸네일 영화제목 */
#movie .movie_title {
	color: #222;
	font-size: 14px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}
/* 썸네일 영화가격 */
#movie .price {
	color: #aaa;
	font-size: 13px;
	margin: auto;
}
/* 영화 가격 옆 c 코인 이미지 */
#movie .price img {
	width: 12px;
	height: 12px;
	margin-left: 1px;
}
</style>

<body>
	<!-- 카테고리 제목 -->
	<%@ include file="assets/inc/top_info.jsp"%>

	<!-- 총 n개 작품 , 드롭다운  -->
	<div class="content clearfix">
		<span class="total">총</span> <span class="p">&nbsp;${TotalCount}</span>개 작품

		<!-- 드랍 다운 -->
		<select class="form-control selcls" id="movie_select">
			<option>최신순</option>
			<option>개봉순</option>
			<option>평점순</option>
			<option>판매순</option>
			<option>낮은가격순</option>
		</select>
	</div>

	<!-- 썸네일 이미지 내용 -->
	<div id="body">
		<ul id="movie" class="infinite_scroll">
			<c:forEach var="item" items="${categorySorted}" varStatus="status">
				<li class="img"><a href="Movie_information.do?movie_no=${item.movie_no}"> 
				<span class="thumb"> <img src="${item.thumbnail}" alt="${item.name} 썸네일" /></span> 
				<span class="movie_title">${item.name}</span>
				<span class="price">${item.type}&nbsp;<span class="cost">${item.price}</span><img src="assets/img/coin_icon.png"></span>
				</a></li>
			</c:forEach>
		</ul>
	</div>
	
	<!-- 인피니트 스크롤 -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			var cost = $(".cost");
				for(var i = 0; i< cost.length; i++) {
					if(cost.eq(i).text()=="0"){
						cost.eq(i).text("무료");
					}
				}
			
			$("#top_info_value").html("카테고리 종류");

			var num = 0;
			$(window).scroll(
					function() {
						if ($(window).scrollTop() + 100 >= $(document).height()
								- $(window).height()) {
							var $clone = $('.img').eq(num).first().clone()
							num++;
							$('.infinite_scroll').append($clone)
							console.log(num);
						}
					})
				});
	</script>
</body>

</html>
