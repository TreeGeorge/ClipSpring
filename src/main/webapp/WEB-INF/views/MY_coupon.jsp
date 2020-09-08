<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
<script
	src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<style>
.content {
	font-weight: bold;
	font-size: 12px;
	height: 35px;
	line-height: 35px;
	border-bottom: 1px solid #d5d5d5;
	padding: 0 10px 0 15px;
}

.pull_left {
	float: left;
}

.coupon_box {
	height: 100px;
	width: 90%;
	margin: auto;
	margin-bottom: 0;
	margin-top: 10px;
}

.coupon_box1 {
	width: 66%;
	height: 100px;
	padding-left: 15px;
	padding-top: 15px;
	border: 1px solid #d5d5d5;
	border-right: none;
}

.coupon_box2 {
	width: 33%;
	height: 100px;
	text-align: center;
	background-color: #E61A3F;
	color: #fff;
	font-size: 15px;
	font-weight: bold;
	padding-top: 31px;
}

.coupon_box3 {
	width: 33%;
	height: 100px;
	text-align: center;
	background-color: #aaa;
	color: #fff;
	font-size: 15px;
	font-weight: bold;
	padding-top: 31px;
}

.container {
	padding:0px;
	padding-bottom:50px;
	width:100%;
}

	.no_value {
        height: 250px;
        text-align: center;
    }

    .no_value img {
        padding-top: 75px;
        width: 100px;
        margin: auto;
    }

    .no_value .text {
        font-weight: bold;
        padding-top: 10px;
        line-height: 25px;
        font-size: 16px;
    }

    .hide {
        display: none;
    }


</style>
</head>

<body>
	<!--전체박스-->
	<div class="container">
		<%@ include file="assets/inc/id_box.jsp" %>
		
		<!--TOP BAR-->
		<%@ include file="assets/inc/my_top_bar.jsp" %>
	
		<div class="content">사용가능 쿠폰</div>
		
		<div class="no_value hide">
            <img src="assets/img/wish_list_none.png" />
            <div class="text">사용 가능한 쿠폰이 없습니다.</div>
        </div>
	
		<div>
			<c:forEach var="item" items="${output}" varStatus="status">
				<c:choose>
					<c:when test="${item.is_used == 'N'}">
						<ul class="clear coupon_box">
							<li class="pull_left coupon_box1">
								<h5 style="font-weight: bold; margin: 0; width:80%;
									text-overflow: ellipsis;white-space: nowrap;overflow: hidden;">${item.name}</h5>
								<span style="font-size: 12px; color: #aaa;">구매/대여시<br>${item.period} 까지<br>쿠폰한 장당 1회만 결제 가능</span>
							</li>
							<li class="pull_left coupon_box2">
								<span><fmt:formatNumber value="${item.price}" pattern="#,###" />코인<br>할인</span>
							</li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="clear coupon_box" style="opacity: 0.7;">
							<li class="pull_left coupon_box1">
								<h5 style="font-weight: bold; margin: 0; width:80%;
									text-overflow: ellipsis;white-space: nowrap;overflow: hidden;">${item.name}</h5>
								<span style="font-size: 12px; color: #aaa;">구매/대여시<br>${item.period} 까지<br>쿠폰한 장당 1회만 결제 가능</span>
							</li>
							<li class="pull_left coupon_box3">
								<span><fmt:formatNumber value="${item.price}" pattern="#,###" />코인<br>할인</span>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		
		<div class="footer"
			style="font-size: 12px; color: #aaa; padding: 20px;">
			&#8226;쿠폰의 유효기간을 꼭 확인해 주세요<br> &#8226;유효기간이 만료된 쿠폰은 자동으로 삭제됩니다<br> &#8226;쿠폰에 표기된 금액보다
			적은 금액을 결제하셔도, 쿠폰은<br>&nbsp;&nbsp;&nbsp;소진됩니다.
		</div>
	
	
		<!-- BOT BAR -->
		<%@ include file="assets/inc/bot_bar.jsp" %>
	
	</div>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<script>
	
	// 아이디
	$(function(){
		$(".bot_bar_icon").eq(3).attr("src", "assets/img/my_page_icon_selected.png");
		$(".top_bar_list").eq(2).addClass("selected");
		
		if (!$(".coupon_box")[0]) {
			$(".no_value").removeClass("hide");
		}
	});
	</script>
</body>

</html>