<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<style>
html, body {
    width: 100%;
    height: 100%;
    color: #222;
}

.clearfix:after {
    clear: both;
    content: "";
    float: none;
    display: block;
}

#top_bar {
    background-color: #fff;
    position: sticky;
    top: -1px;
    z-index: 100;
    width: 100%;
    height: 40px;
    box-sizing: border-box;
    border-bottom: 1px solid #b8b8b8;
}

#top_bar .selected {
    display: inline-block;
    color: #E61A3F;
    font-weight: bold;
    box-sizing: border-box;
    height: 41px;
    border-bottom: 2px solid #E61A3F;
    font-size: 1.1em;
}

#top_bar ul {
    width: 85%;
    margin: auto;
}

#top_bar .pull_left {
    float: left;
    height: 40px;
    width: 25%;
    text-align: center;
}

#top_bar a {
    font-size: 0.9em;
    line-height: 40px;
    color: #aaa;
    font-weight: bold;
    text-decoration: none;
}
</style>

<div id="top_bar">
	<ul class="clearfix">
		<li class="pull_left"><a class="session" href="MY_movie"><span class="top_bar_list">내영상</span></a></li>
		<li class="pull_left"><a class="session" href="MY_interest_movie"><span class="top_bar_list">관심영화</span></a></li>
		<li class="pull_left"><a class="session" href="MY_coupon"><span class="top_bar_list">쿠폰함</span></a></li>
		<li class="pull_left"><a class="session" href="MY_movie_purchase_list"><span class="top_bar_list">구입내역</span></a></li>
	</ul>
</div>

<script>
	$(".session").click(function(e){
		e.preventDefault();
		var item = e.target.parentElement.href.substring(e.target.parentElement.href.lastIndexOf("/")+1);
		
		
	})
</script>

<!-- $(".top_bar_list").eq(i).addClass("selected") -->