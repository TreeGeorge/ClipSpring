<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<style>
        a {
            text-decoration: none;
            color: black;
        }
        
        body {
            background-color: #FEE4E9;
        }
        
        .custom {
            background-color: #E61A3F;
            height: 180px;
            position: relative;
            text-align: center;
        }
        
        .custom img {
            display: block;
            height: 100px;
            margin: auto;
        }
        
        .custom a {
            display: inline-block;
            margin-top: 30px;
        }
        
        .custom span {
            display: block;
            width: 100%;
            text-align: center;
            font-weight: bold;
            color: white;
            text-decoration: none;
            margin-top: -16px;
        }
        
        .clearfix:after {
            content: "";
            display: block;
            float: none;
            clear: both;
        }
        /*예고편 영화정보 상품정보 탭버튼 감싸는 div*/
        
        .tab_btn {
            position: absolute;
            width: 90%;
            margin: auto;
            top: -25px;
            height: 50px;
            left: 5%;
            font-size: 18px;
        }
        /*예고편 영화정보 상품정보 탭버튼 */
        
        .tab_btn_1 {
            float: left;
            width: 33.3%;
            text-align: center;
            line-height: 50px;
            background-color: #fff;
        }
        /*예고편 영화정보 상품정보 탭 스왑*/
        
        .hide {
            display: none;
        }
        /*예고편 영화정보 상품정보 탭 선택되었을때*/
        
        .tab_btn_1 a.selected {
            color: #E61A3F;
        }
        /*영화정보*/
        
        .head {
            width: 90%;
            margin: auto;
        }
        
        .tab_btn_1 a {
            display: inline-block;
            width: 100%;
            height: 100%;
            border-right: 1px solid #d5d5d5;
            box-sizing: border-box;
        }
        
        .tab_btn_1 a:last-child {
            border-right: none;
        }
        
        .head img {
            height: 120px;
            display: block;
            margin: auto;
        }
        
</style>

<div class="custom">
        <a href="home"><img src="assets/img/logo_white.png" alt=""><span>이용정책</span></a>
    </div>
    <div style="background-color: #FEE4E9; height: 50px; position: relative;">
        <!-- 탭 전체 박스 -->
        <div class="tab">
            <!-- 탭버튼영역 -->
            <ul class="clearfix tab_btn">

                <li class="tab_btn_1" style="font-size: 0.7em; font-weight: bold;">
                    <a class="tab_btn_1_link" href="Clip_terms">이용약관</a>
                </li>

                <li class="tab_btn_1" style="font-size: 0.7em; font-weight: bold;">
                    <a class="tab_btn_1_link" href="Privacy_policy">개인정보처리방침</a>
                </li>

                <li class="tab_btn_1" style="font-size: 0.7em; font-weight: bold;">
                    <a class="tab_btn_1_link" href="Youth_protection_policy">청소년보호정책</a>
                </li>
            </ul>
        </div>
    </div>
<!-- $(".tab_btn_1_link").eq(i).addClass("selected"); -->