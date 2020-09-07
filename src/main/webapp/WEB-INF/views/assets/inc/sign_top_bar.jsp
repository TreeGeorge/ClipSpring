<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<style>
.clearfix{
    display: block;
    content: "";
    float: none;
    clear: both;
}
/* top_bar */
.top_bar {
    background-color: #fff;
    width: 100%;
    height: 40px;
    line-height: 40px;
    text-align: center;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 100;
    border-bottom: 1px solid black;
    box-sizing: border-box;
}

/* top_bar logo */
.top_bar .logo{
    display: block;
    width: 80px;
    height: 40px;
    text-indent: -10000px;
    background: url(assets/img/logo.png)left 4px no-repeat;
    background-size: 80px;
    margin-left: 13px;
    float: left;
}


.top_bar .link{
    float: right;
    height: 30px;
}

.top_bar span:last-child{
    border-right: none;
    padding-right: 8px;
}

.top_bar a{
    text-decoration: none;
    font-size: 0.7em;
    color: black;
}
</style>

<div id="header">
	<div class="top_bar clearfix">
		<a href="home" class="logo">CLIP</a>
		<div class="link">
			<span><a href="home">Home&nbsp;</a></span>
			<span><a href="Sign_up_agree">회원가입&nbsp;</a></span>
			<span><a href="Login">로그인</a></span>
		</div>
	</div>
</div>