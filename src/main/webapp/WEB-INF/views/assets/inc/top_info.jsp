<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<style>
.top_info {
   	position: fixed;
    top: 0;
    width: 100%;
    height: 40px;
    border-bottom: 1px solid #b8b8b8;
    text-align: center;
    line-height: 40px;
    box-sizing: border-box;
    font-size: 18px;
    font-weight: bold;
    background-color: #fff;
    z-index: 100;
}

.top_info img {
    display: block;
    position: absolute;
    float: left;
    height: 26px;
    width: 26px;
    margin: 7px;
}
</style>
<div class="top_info">
	<a href="#" onclick="history.back(); return false;">
		<img src="assets/img/left.png" alt="뒤로">
	</a><span id="top_info_value">${topInfo}</span>
</div>

<!-- $("#top_info_value").html("임의값"); -->