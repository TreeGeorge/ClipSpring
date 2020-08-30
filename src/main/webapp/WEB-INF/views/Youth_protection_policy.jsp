<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>

<html lang="ko">

<head>
<%@ include file="assets/inc/header.jsp" %>
    <style>
        .tab_panel {
            width: 90%;
            margin: auto;
            min-height: 150px;
            border-radius: 50px;
            padding: 5px;
            margin-bottom: 20px;
            line-height: 25px;
            font-size: 15px;
            background-color: #fff;
            font-size: 12px;
        }
    </style>

</head>

<body>
    <%@ include file="assets/inc/utilization_policy.jsp" %>
    <!-- 내용영역 -->



    <div class="tab_panel">
        <br>
        <div class="terms_area">
            <h3>CLIP 청소년 보호정책</h3>
            <p>- 시행일자 : 2020년 05월 01일</p>
            <br>
            <p>CLIP은 청소년이 건전한 인격체로 성장할 수 있도록 하기 위하여 청소년 보호정책을 수립, 시행하고 있습니다. 이하 CLIP이 본 정책을 통하여 청소년의 보호를 위해 어떠한 조치를 취하고 있는지 알려드립니다.</p>
            <h4 class="youth">1. 청소년 유해정보에 대한 접근제한 및 관리조치</h4>
            <p>CLIP은 청소년이 아무런 제한장치 없이 청소년 유해정보에 접근하는 일이 발생하지 않도록 청소년유해매체물에 대한 별도의 인증절차를 마련하여 적용하고 있습니다. 이외에도 CLIP은 청소년 유해정보가 청소년에게 노출되지 않도록 예방차원의 조치를 강구합니다.</p>
            <h4>2. 관련 업무 담당자 교육 시행</h4>
            <p>CLIP은 각 서비스 담당자들을 대상으로 청소년 보호 관련 법령 및 제재 기준, 유해정보 발견 시 대처방법, 위반사항 처리에 대한 보고 절차 등을 교육하고 있습니다.</p>
            <h4>3. 청소년 유해정보로 인한 피해상담 및 고충처리</h4>
            <p>CLIP은 청소년 유해정보로 인한 피해상담 및 고충처리를 위한 전문인력을 배치하여 그 피해가 확산되지 않도록 하고 있습니다. 이용자 분들께서는 하단에 명시한 "4. CLIP 청소년보호 책임자 및 담당자" 항을 참고하여 전화나 메일을 통해 피해상담 및 고충처리를 요청할 수 있습니다.</p>
            <h4>4. CLIP 청소년보호 책임자 및 담당자</h4>
            <p>CLIP은 청소년들이 좋은 정보를 안전하게 이용할 수 있도록 최선을 다하고 있습니다.</p>
            <br>
        </div>
    </div>
</body>
<script>
$(".tab_btn_1_link").eq(2).addClass("selected");
</script>
</html>