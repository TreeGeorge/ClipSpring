<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>

<style type="text/css">
	/** 전체선택, 삭제 */
    .delete_list {
        position: relative;
        margin-top: 40px;
        height: 40px;
        line-height: 40px;
        text-indent: 40px;
        font-size: 14px;
        border-bottom: 1px solid #b8b8b8;
        box-sizing: border-box;
    }

    .wish_check {
        position: absolute;
        left: 15px;
        top: 10px;
        width: 16px;
        height: 16px;
    }

    .wish_delete {
        display: block;
        position: absolute;
        line-height: 26px;
        height: 26px;
        width: 50px;
        color: #222;
        font-size: 12px;
        text-align: center;
        text-indent: 0;
        text-decoration: none;
        right: 15px;
        top: 6px;
        box-sizing: border-box;
        border: 1px solid #b8b8b8;
    }

    /** 장바구니의 내용물이 없을때 */
    .no_value {
        margin-top: 40px;
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

    .hide {
        display: none;
    }

    /** 장바구니 내용물 */
    .wish_list {
        min-height: 260px;
        margin-bottom: 40px;
    }

    .wish_content_check {
        position: absolute;
        right: 15px;
        top: 42px;
        width: 16px;
        height: 16px;
    }

    .wish_list_content {
        border-bottom: 1px solid #b8b8b8;
        box-sizing: border-box;
        height: 100px;
        position: relative;
    }

    .wish_list_content a {
        position: absolute;
        display: block;
        left: 10px;
        height: 100%;
        width: 85%;
        text-decoration: none;
        background-color: #fff;
        color: #222;
    }

    .wish_list_content .movie_title {
        display: block;
        float: left;
        margin-top: 10px;
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

    .wish_list_content img {
        float: left;
        width: 61px;
        display: block;
        margin: 10px;
        margin-left: 0;
        height: 80px;
    }
    
    .wish_list_content .info {
        display: block;
        text-align: left;
        float: left;
        font-size: 12px;
        line-height: 19px;
        height: 20px;
        color: #ff3253;
        width: 50%;
    }
    
    .wish_list_content .info span {
    	display: block;
    	float: left;
    }
    
    .price {
    	line-height: 17px;
    	margin-left: 2px;
    	margin-top: 1px;
    }
    
    #coin {
    	display: block;
    	width: 12px;
    	height: 12px;
    	margin: 0;
    	margin-top: 4px;
    	margin-left: 1px;
    	float: left;
    }

    
    /** 선택 상품 가격 및 결제 */
    .total {
        text-align: center;
        padding-bottom: 10px;
        box-sizing: border-box;
        border-bottom: 1px solid #222;
    }

    .select_wish {
        position: relative;
        height: 60px;
        border-top: 1px solid #222;
        box-sizing: border-box;
        border-bottom: 1px solid #b8b8b8;
    }

    .total > .select_wish > span {
        position: absolute;
        display: inline-block;
        line-height: 60px;
        font-weight: bold;
    }

    .select_product {
        left: 15px;
    }

    .select_price {
        color: #ff3253;
        right: 20px;
    }

    .count {
        right: 120px;
    }

    .total_price {
        height: 50px;
        line-height: 50px;
        font-weight: bold;
        font-size: 18px;
        color: #ff3253;
    }

    .total p {
        font-size: 13px;
        color: #aaa;
        margin-bottom: 20px;
    }

    .total a {
        display: inline-block;
        height: 45px;
        width: 45%;
        margin: 5px;
        text-decoration: none;
        font-weight: bold;
        color: #222;
        box-sizing: border-box;
        line-height: 45px;
        border: 1px solid #b8b8b8;
    }

    .total a:last-child {
        background-color: #ff3253;
        color: #fff;
        border: 0;
    }

</style>

</head>

<body>
    <!--전체박스-->
    <div id="container">
        <%@ include file="assets/inc/top_info.jsp" %>

        <div class="delete_list"><label for="toggleCheckbox_top">전체선택</label>
            <input class="wish_check" type="checkbox" checked/>
            <a class="wish_delete">삭제</a></div>

        <div class="no_value hide">
            <img src="assets/img/wish_list_none.png" />
            <div class="text">장바구니에 담겨진<br />상품이 없습니다.</div>
        </div>

        <ul class="wish_list">
        	<c:forEach var="item" items="${output}" varStatus="status">
                <li class="wish_list_content">
	                <label for="movie_number" class="wish_content"></label>
	                <input name="wish_content_check" id="movie_number" type="checkbox" class="wish_content_check" value="${item.movie_no}" checked />
	                <a href="Movie_information?movieNo=${item.movie_no}">
	                    <img src="${item.thumbnail}" alt="${item.name} 썸네일">
	                    <span class="movie_title">${item.name}</span>
	                    <span class="info">
	                    	<span id="type">${item.type}</span>
	                    	<span class="price"><fmt:formatNumber value="${item.price}" pattern="#,###" /></span>
	                    	<img id="coin" src="assets/img/coin_icon.png"/>
	                    </span>
	                </a>
	            </li>
	       	</c:forEach>
	        
        </ul>

        <div class="total">
            <div class="select_wish">
                <span class="select_product">선택상품</span><span class="count">n건</span><span class="select_price">n코인</span>
            </div>
            <div class="total_price">
                총 결제금액 <span class="total_coin">n코인</span>
            </div>
            <p>무료 상품은 별도 지불없이 이용하실 수 있습니다.</p>
            <a href="home">다른 상품 보기</a>
            <a id="buy">구매하기</a>
        </div>

        <!--footer-->
        <%@ include file="assets/inc/footer.jsp" %>

        <!-- BOT BAR -->
        <%@ include file="assets/inc/bot_bar.jsp" %>
    </div>
    <script type="text/javascript">
    	function total() {
    		// 전체 금액
    		var total = 0;
            for ( var i = 0 ; i < $(".price").length ; i++ ) {
            	if (($(".wish_content_check").eq(i).is(":checked"))) {
            		if (!parseInt($(".price"))) {
            			total += parseInt($(".price").eq(i).html().replace(",",""));
            		}
            	}
            }
            
            var text = total + "";
        	$(".select_price").html(text.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "코인");
        	$(".total_coin").html(text.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "코인");
        	
        	// 선택된 개수
        	$(".count").html($(".wish_content_check:checked").length + "건")
    	}	// end total();
    	
    	function check() {
    		// 장바구니가 비었다면
    		if ( !$(".wish_list_content")[0] ) {
                // 빈 장바구니 화면 표현
                $(".no_value").removeClass("hide")
                $(".wish_list").addClass("hide");
                $(".delete_list").addClass("hide");
                $(".total").addClass("hide");
            }
    	}	// end check();
    
        $(function() {
        	$("#top_info_value").html("장바구니");
        	$(".bot_bar_icon").eq(2).attr("src", "assets/img/wish_icon_selected.png");
            total();
			check();
			
			// 구매버튼 클릭 이벤트
			$("#buy").click(function() {
				// 선택된 상품이 없을때
				if (!$("input:checkbox[name=wish_content_check]")) {
					swal({
                        html: "<b>선택된 상품이 없습니다.</b>",    // 내용
                        type: "error",  // 종류
                        confirmButtonText: "확인", // 확인버튼 표시 문구
                        confirmButtonColor: "#ff3253", // 확인버튼 색상
                    });
            		return false;
				}
				
				var url = "Movie_buy?"
				for ( var i = 0 ; i < $("input:checkbox[name=wish_content_check]").length ; i++ ) {
					if ($("input:checkbox[name=wish_content_check]").eq(i).is(":checked") == true) {
						url += "movieNo=" + $("input:checkbox[name=wish_content_check]").eq(i).val() + "&";
					}
				}
				$(location).attr('href',url);
			});

            // 전체선택 클릭 이벤트
            $(".wish_check").click(function(){
                // 전체선택 클릭시 모든 체크 박스 체크
                if($(this).prop("checked")) {
                    $("input[name=wish_content_check]").prop("checked",true);
                // 전체선택 해제시 모든 체크 박스 해제
                } else {
                    $("input[name=wish_content_check]").prop("checked",false);
                }
                total();
            }); // end $(".wish_check").click();

            // 삭제 버튼 클릭시
            $(".wish_delete").click(function() {
            	// 삭제할 제품이 없으면
            	if ($(".wish_content_check:checked").length == 0) {
            		swal({
                        html: "<b>삭제할 상품이 없습니다.</b>",    // 내용
                        type: "error",  // 종류
                        confirmButtonText: "확인", // 확인버튼 표시 문구
                        confirmButtonColor: "#ff3253", // 확인버튼 색상
                    });
            		return false;
            	}
                // 확인, 취소버튼에 따른 후속 처리 구현
                swal({
                    html: "<b>선택하신 상품을 장바구니에서 삭제하시겠습니까?</b>",  // 내용
                    type: "question",     // 종류
                    confirmButtonText: "확인",   // 확인버튼 표시 문구
                    showCancelButton: true, // 취소버튼 표시 여부
                    cancelButtonText: "취소", // 취소버튼 표시 문구
                    confirmButtonColor:  "#FF3253",
                }).then(function(result){   // 버튼이 눌러졌을 경우의 콜백 연결
    				if (result.value) { // 확인 버튼이 눌러진 경우
    					for ( var i = 0 ; i < $("input:checkbox[name=wish_content_check]").length ; i++ ) {
    						if ($("input:checkbox[name=wish_content_check]").eq(i).is(":checked") == true) {
    							var wish_movie_no = parseInt($("input:checkbox[name=wish_content_check]").eq(i).val());
    							$.post('wishListDelete.do', {movieNo:wish_movie_no},function(req){
    								if (req == 1) {
    									swal({
    							            timer:1500,
    							            html:"<div style='font-weight: bold; margin-bottom: 20px;'>개짓거리 하지 마십쇼 휴먼</div>",
    							            type:"error",
    							            allowOutsideClick: false,
    							            showConfirmButton: false
    							        }).then(function(){
    							            location.reload();
    							        });
    								}
    							});
    						}
    					}
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
                    
                });
            }); // end $(".wish_delete").click()

            // 영화 컨텐츠 선택마다 선택 건수 변경
            $(".wish_content_check").change(function(){
            	total();
            }); // end $(".wish_content_check").change()

        }); // end $(function(){});
    </script>
</body>
</html>