<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<%@ include file="assets/inc/header.jsp" %>
<script src="assets/plugins/ajax/ajax_helper.js"></script>
<script src="assets/plugins/handlebars/handlebars-v4.0.5.js"></script>
<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<link rel="stylesheet" type="text/css" href="assets/plugins/ajax/ajax_helper.css" />
<link rel="stylesheet" href="plugins/sweetalert/sweetalert2.min.css">
<link rel="stylesheet" type="text/css" href="assets/assets/css/bootstrap.min.css" />
<script src="assets/js/bootstrap.min.js"></script>
<style>
/** 검색창 */
.form {
    position: sticky;
    top: 0;
    z-index: 1000;
}

legend {
    border: 0;
    margin: 0;
    text-indent: -1000000px;
    line-height: 0;
}

.form .search_movie {
    float: left;
    width: 80%;
    border-radius: 3px 0px 0px 3px;
    border-right: none;
}

.form input:focus {
    outline: 0;
}

.form input {
    height: 35px;
    line-height: 35px;
    border: 1px solid #FF3253;
    box-sizing: border-box;
}

.form .search_button {
    float: left;
    width: 20%;
    box-sizing: border-box;
    background-color: #FF3253;
    border: 0;
    border-radius: 0 3px 3px 0;
    color: #fffbfc;
    font-size: 0.8em;
    font-weight: 550;
}

/** 총개수 및 정렬 */
.search_info {
    margin: auto;
    font-weight: bold;
    font-size: 12px;
    height: 35px;
    line-height: 35px;
    border-bottom: 1px solid #d5d5d5;
    padding: 0 10px 0 15px;
}

/* n개작품 left */
.total {
    float: left;
    display: block;
}

/* 드랍다운 css */
.selcls {
    padding: 2px;
    border: solid 1px #eee;
    outline: 0;
    background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF), color-stop(4%, #fff), to(#FFFFFF));
    background: -moz-linear-gradient(top, #FFFFFF, #fff 1px, #FFFFFF 25px);
    box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
    -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
    -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
    width: 85px;
    height: 28px;
    float: right;
    margin-top: 3px;
    font-size: 12px;
}

/** 검색 영화 리스트 */
.search_movie_box {
    margin-bottom: 50px;
}

.search_movie_box .search_movie_list {
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

.search_movie_list .movie_title {
    display: block;
    position: absolute;
    left: 120px;
    top: 10px;
    font-weight: bold;
    font-size: 16px;
    width: 50%;
    height: 30px;
    line-height: 30px;
    display: block;
    text-overflow:ellipsis;
    white-space:nowrap;
    overflow:hidden;
    text-align: left;
}

.search_movie_list img {
    position: absolute;
    top: 5px;
    width: 100px;
    display: block;
    margin: 5px;
    left: 5px;
    height: 130px;
}

.search_movie_list .age {
    display: block;
    position: absolute;
    left: 120px;
    top: 45px;
    font-size: 12px;
    line-height: 20px;
    height: 20px;
    color: #aaa;
}

.search_movie_list .price {
    display: block;
    position: absolute;
    left: 145px;
    top: 64px;
    font-size: 12px;
    line-height: 20px;
    height: 20px;
    color: #ff3253;
}

.search_movie_list .type {
	display: block;
    position: absolute;
    left: 120px;
    top: 65px;
    font-size: 12px;
    line-height: 20px;
    height: 20px;
    color: #ff3253;
}

#coin {
	display: inline-block;
	position: relative;
	top: 0;
	left: 3px;
    width: 12px;
    height: 12px;
    margin:0;
}

/** 검색 영화 리스트가 비었을때 */
.hide {
    display: none;
}

.no_value {
    height: 300px;
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


</style>

</head>

<body>
    <!--전체박스-->
    <div id="container">

        <!--TOP LOGO-->
        <%@ include file="assets/inc/top_logo.jsp" %>

        <!-- 검색창 -->
        <form method="get" action="${pageContext.request.contextPath}/Movie_search" class="form" >
            <fieldset>
                <legend>검색</legend>
                    <div class="clearfix">
                        <input autocomplete="off" type="text" id="search_movie" name="${name}" 
                        class="search_movie" value="" placeholder="검색할 영화를 입력해주세요">
                        <input type="button" class="search_button" value="검색" id="search_button">
                    </div>
            </fieldset>
        </form>

        <!-- 총 개수, 정렬 -->
        <div class="search_info clearfix hide">
            <div class="total">
                <p>
                    총 <span id="count">${count}</span>개 작품
                </p>
            </div>
            <div class="pull-right">
                <select class="form-control selcls" id="movie_select">
                    <option>최신순</option>
                    <option>개봉순</option>
                    <option>판매순</option>
                    <option>낮은가격순</option>
                </select>
            </div>
        </div>

        <div class="search_movie_box">
        </div>

        <div class="no_value hide">
            <img src="assets/img/wish_list_none.png" />
            <div class="text">검색된 영화가 없습니다.</div>
        </div>

        <!-- BOT BAR -->
        <%@ include file="assets/inc/bot_bar.jsp" %>
       
    </div>

    <!-- Ajax로 읽어온 내용을 출력하는데 사용될 템플릿 -->
    <script id="movie_item" type="text/x-handlebars-template">
		<c:forEach var="item" items="${MovieSearch}" varStatus="status">
        <a class="search_movie_list" href="Movie_information?movieNo=${movie_no}">
            <img src="${item.thumbnail}" alt="${item.name}">
            <span class="movie_title">${item.name}</span>
            <span class="age">${item.age}세 이용가 | ${item.time}분</span>
			<span class="type">${item.type}</span>
            <span class="price">${item.price}<img id="coin" src="assets/img/coin_icon.png"/></span>
        </a>
		</c:forEach>
    </script>
    <script type="text/javascript">
        $(function() {
        	$(".bot_bar_icon").eq(1).attr("src", "assets/img/search_icon_selected.png");
        	
        	$("#search_button").click(function(){
				// 아무것도 입력하지 않았을때
        		if (!$("#search_movie").val().trim()) {
        			swal({
                        html: "<b>검색어를 입력해주세요.</b>",    // 내용
                        type: "error",  // 종류
                        confirmButtonText: "확인", // 확인버튼 표시 문구
                        confirmButtonColor: "#ff3253", // 확인버튼 색상
                    });
        			return false;
        		}

        		// 검색된 개수
            	var total = 0;
                // 검색 초기화
                $(".search_movie_list").remove();
				// 검색어와 일치하는 영화 나타나게 하기
                $.post('Movie_search', {name:$("#search_movie").val()},function(req) {
                    var template = Handlebars.compile($("#movie_item").html());
                    var html = null;
                    // 영화 정보중에 검색값과 일치하는지 확인
                   	for ( var i = 0 ; i < req.length ; i++ ) {
                   		html = template(req.item[i])
                   		// TODO 감독과 배우검색도 가능하게 할거면 영화 정보에 나타내주기(위에 리스트)
                    	if (req[i].movieTitle.indexOf($("#search_movie").val()) != -1 // ||			// 제목
                    	//	req.item[i].director.indexOf($("#search_movie").val()) != -1 ||			// 감독
                    	//	req.item[i].actor.indexOf($("#search_movie").val()) != -1				// 배우
                    	) {
                    		// 일치하면 영화를 나타내준다.
                    	    $(".search_movie_box").append(html);
                    	    total += 1;
                    	}
               		}

                	if (total != 0){	// 검색값이 존재할 경우
                  		$(".search_info").removeClass("hide");
                    	$(".no_value").addClass("hide");
                	} else {	// 검색값이 존재하지 않을 경우
                    	$(".search_info").addClass("hide");
                    	$(".no_value").removeClass("hide");
                    	$(".no_value .text").html("\"" + $("#search_movie").val() + "\" 의 검색결과가 존재하지 않습니다." );
                	}

                   	// 검색된 영화 개수
                   	$("#count").html(total);
                   	// 검색창 초기화 <-- 취향(비우면 다음 검색이 편하고 안비우면 뭘 검색했었는지 바로 알 수 있음)
                   	// $("#search_movie").val("");
    			});
        	});

        	// 엔터키 눌렀을때
            $("#search_movie").keydown(function(key) {
            	if (key.keyCode == 13) {
					// 엔터키 반응 막기
            		event.returnValue = false;
					// 클릭반응 일으키기
            		$("#search_button").click();
            	}
            });

        });
        
    </script>
</body>
</html>