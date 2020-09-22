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
.clear {
	content: "";
	display: block;
	float: none;
	clear: both;
}

.content .delete_list {
	padding-left: 5px;
}

.content {
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
}

/** 영화 목록 **/
.movie {
	margin: 0px;
	padding: 0px;
}

.movie li {
	border-bottom: 1px solid #eee;
	margin: 0px;
	padding: 0px;
}

.movie li a {
	display: block;
	width: 85%;
	padding: 10px;
	color: #222;
	text-decoration: none;
	position: relative;
	display: block;
}

.movie a {
	padding-left: -10px;
}

.movie li a .thumb {
	width: 80px;
	height: 125px;
	display: block;
}

.movie img {
	width: 90px;
	height: 125px;
}

.movie .movie_title {
	display: block;
	position: absolute;
	left: 110px;
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

.movie .age {
	display: block;
	position: absolute;
	left: 110px;
	top: 45px;
	font-size: 12px;
	line-height: 20px;
	height: 20px;
	color: #aaa;
}

.movie .act {
	display: block;
	position: absolute;
	left: 110px;
	top: 100px;
	font-size: 12px;
	line-height: 20px;
	height: 20px;
	color: #ff3253;
}

/* hidden , hide */
.hidden {
	visibility: hidden;
}

.hide {
	display: none;
}

/* 휴지통 버튼 */
.wastebasket a {
	display: inline-block;
	height: 45px;
	width: 100%;
	text-decoration: none;
	color: #eee;
	box-sizing: border-box;
	line-height: 45px;
	border: 1px solid #b8b8b8;
	text-align: center;
	padding: 0;
	margin: auto;
	background-color: #E61A3F;
	font-weight: bold;
}

/* 휴지통 글씨 */
.wastebasket {
	text-align: center;
	position: fixed;
	bottom: 50px;
	width: 100%;
	line-height: 50px;
	z-index: 100px;
	height: 45px;
}

/** 영상리스트의 내용물이 없을때 */
.no_value {
	height: 300px;
	text-align: center;
}

.no_value img {
	width: 100px;
	height: 100px;
	margin-top: 70px;
}

.no_value .text {
	font-weight: bold;
	padding-top: 10px;
	line-height: 25px;
	font-size: 16px;
}

.star {
	background: url(assets/img/star2.png) no-repeat;
	float: right;
	padding-right: 10px;
	position: relative;
	top: -85px;
	z-index: 10px;
}

.star img {
	width: 25px;
	height: 25px;
}

/** 스윗 얼럴 css */
#swal_pw {
	display: block;
	width: 100%;
	background-color: #FFFBFC;
	height: 40px;
	border: 2px solid black;
	line-height: 40px;
	margin-top: 110px;
	border-radius: 10px;
	text-align: center;
}

.container {
	padding:0px;
	margin-bottom:50px;
	width:100%;
}
</style>
</head>

<body>
	<!--전체박스-->
	<div class="container">
		<%@ include file="assets/inc/id_box.jsp" %>
		
		<!--TOP BAR-->
		<%@ include file="assets/inc/my_top_bar.jsp" %>
		<!-- 드롭다운 옵션 -->
		<div class="content clearfix">
			<span class="delete_list"> <a class="toggleCheckbox_top hidden">전체선택</a>
				<a class="movie_delete hidden">삭제</a></span> <select name="dropBox"
				class="form-control selcls" id="movie_select">
				<option value="가나다순">가나다순</option>
				<option value="개봉순">개봉순</option>
				<option value="low">낮은가격순</option>
				<option value="high">높은가격순</option>
			</select>
		</div>
		<!-- 영화목록에 담긴 상품이 아무것도 없을 떄 -->
		<div class="no_value hide">
			<img src="assets/img/wish_list_none.png" />
			<div class="text">
				관심영화 목록에 담겨진<br />상품이 없습니다.
			</div>
		</div>
	<div id="asd">
		<ul class="movie">
		<c:forEach var="item" items="${output}" varStatus="status">
			<li class="movie_list wish_content"><a
				href="Movie_information?movieNo=${item.movie_no}"> <img
					src="${item.thumbnail}" alt="${item.name}포스터">
					<span class="movie_title">${item.name}</span> <span class="age">${item.age}세 이용가<span>
							| ${item.runtime}</span></span> <span class="act">${item.type}</span>
			</a> <!-- 편집 클릭시 체크박스 -->
				<div class="star">
				<input type="hidden" name="interestoo"value="${item.movie_no}"></input>
					<img src="assets/img/star2.png"
						alt="interest_button" >
				</div></li>
		</c:forEach>									
		</ul>
	</div>
	
		<!-- BOT BAR -->
		<%@ include file="assets/inc/bot_bar.jsp" %>
	
	</div>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
	$(".top_bar_list").eq(1).addClass("selected")
	$(".bot_bar_icon").eq(3).attr("src", "assets/img/my_page_icon_selected.png");
	if (!$(".movie_list")[0]) {
        // 지우고 난 후 빈화면
        $(".no_value").removeClass("hide")
        $(".delete_list").addClass("hide");
    }
	
	//전체이용가 표기
	function allAge(){
		for(var i = 0; i<$(".age").length; i++){
         	if($(".age").eq(i).text().substring(0,5)=="세 이용가"){
         		$(".age").eq(i).text($(".age").eq(i).text().replace("세 이용가", "전체 이용가"));
         	}
         }
	}
	
	function change(){
		 // 체크 버튼 클릭시
        $(".star").click(function() {
            var star = $(this)
            var target = star.children(1).val();
            console.log(target);
            // 확인, 취소버튼에 따른 후속 처리 구현
            swal({
                html: "<b>선택하신 상품을 관심영화에서 삭제하시겠습니까?</b>", // 내용
                type: "question", // 종류
                showCancelButton: true, // 취소버튼 표시 여부
                cancelButtonText:"취소",
                confirmButtonText:"확인",
                confirmButtonColor:"#ff3253",
            }).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
                if (result.value) { // 확인 버튼이 눌러진 경우
							var interest_movie_no = parseInt(target);
							// 체크된 항목의 value값(무비넘버(input에 value로 담아놓음)을 파라미터로 넘겨 해당 항목 DB에서 삭제)
							$.post('interestDelete.do', {movieNo:interest_movie_no},function(req){
								
							});
						
					
					swal({
			            timer:1500,
			            html:"<div style='font-weight: bold; margin-bottom: 20px;'>삭제 되었습니다.</div>",
			            type:"success",
			            allowOutsideClick: false,
			            showConfirmButton: false
			        }).then(function(){
			            location.reload();
			        });

                    }
                })
            })


	}
	
	
       
     	//정렬기능 (output을 여러개 받음)
     	$("select[name='dropBox']").change(function() {
         if($(this).val()=="개봉순"){
               $(".movie").remove();	 
			   $("#asd").append().html('<ul class="movie"><c:forEach var="item" items="${output}" varStatus="status"><li class="movie_list wish_content"><a href="Movie_information?movieNo=${item.movie_no}"> <img src="${item.thumbnail}" alt="${item.name}포스터"><span class="movie_title">${item.name}</span> <span class="age">${item.age}세 이용가<span> | ${item.runtime}</span></span> <span class="act">${item.type}</span></a> <!-- 편집 클릭시 체크박스 --><div class="star"><input type="hidden" name="interestoo"value="${item.movie_no}"></input><img src="assets/img/star2.png" alt="interest_button" ></div></li></c:forEach></ul>')
		   } else if ($(this).val()=="low") {
        	   $(".movie").remove();
        	   $("#asd").append().html('<ul class="movie"> <c:forEach var="item" items="${output3}" varStatus="status"> <li class="movie_list wish_content"><a href="Movie_information?movieNo=${item.movie_no}"> <img src="${item.thumbnail}" alt="${item.name}포스터"> <span class="movie_title">${item.name}</span> <span class="age">${item.age}세 이용가<span> | ${item.runtime}</span></span> <span class="act">${item.type}</span></a> <!-- 편집 클릭시 체크박스 --><div class="star"><input type="hidden" name="interestoo"value="${item.movie_no}"></input><img src="assets/img/star2.png" alt="interest_button"></div></li></c:forEach></ul>')
           } else if ($(this).val()=="high"){
        	   $(".movie").remove();
        	   $("#asd").append().html('<ul class="movie"> <c:forEach var="item" items="${output2}" varStatus="status"> <li class="movie_list wish_content"><a href="Movie_information?movieNo=${item.movie_no}"> <img src="${item.thumbnail}" alt="${item.name}포스터"> <span class="movie_title">${item.name}</span> <span class="age">${item.age}세 이용가<span> | ${item.runtime}</span></span> <span class="act">${item.type}</span></a> <!-- 편집 클릭시 체크박스 --><div class="star"><input type="hidden" name="interestoo"value="${item.movie_no}"></input><img src="assets/img/star2.png" alt="interest_button"></div></li></c:forEach></ul>')  
           } else{
        	   $(".movie").remove();
        	   $("#asd").append().html('<ul class="movie"> <c:forEach var="item" items="${output4}" varStatus="status"> <li class="movie_list wish_content"><a href="Movie_information?movieNo=${item.movie_no}"> <img src="${item.thumbnail}" alt="${item.name}포스터"> <span class="movie_title">${item.name}</span> <span class="age">${item.age}세 이용가<span> | ${item.runtime}</span></span> <span class="act">${item.type}</span></a> <!-- 편집 클릭시 체크박스 --><div class="star"><input type="hidden" name="interestoo"value="${item.movie_no}"></input><img src="assets/img/star2.png" alt="interest_button"></div></li></c:forEach></ul>')   
           }
         change();
         allAge();
         
         
         })

      $(function(){
    	  allAge();
      })

         
	</script>
</body>

</html>