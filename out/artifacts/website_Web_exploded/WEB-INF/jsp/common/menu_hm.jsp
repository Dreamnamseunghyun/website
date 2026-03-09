<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- BEGIN SIDEBAR MENU ITEMS-->
<ul class="menu-items">
    <li class="m-t-20 ">
        <a href="<c:url value="/hm"/>" class="detailed">
            <span class="title">HOME</span>
        </a>
    </li>

    <li>
        <a href="javascript:"><span class="title">蹂묒썝愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="hospital" href="<c:url value="/hm/hospital"/>">蹂묒썝紐⑸줉</a>
            </li>
            <li>
                <a id="contract-checkup" href="<c:url value="/hm/contract-checkup"/>">寃吏꾩쑀?뺣ぉ濡?/a>
            </li>
            <li>
                <a id="hospital-checkup" href="<c:url value="/hm/hospital/0/checkup/2022"/>">?곕룄蹂꾧린以?섍?</a>
            </li>
            <li>
                <a id="companyarchive" href="<c:url value="/hm/companyarchive"/>">?뚯궗蹂닿????먮즺</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">?덉빟愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="reserve" href="<c:url value="/hm/reserve"/>">?덉빟?꾪솴</a>
            </li>
            <li>
                <a id="cancel-reserve" href="<c:url value="/hm/cancel-reserve"/>">?덉빟痍⑥냼</a>
            </li>
            <li>
                <a id="day-off" href="<c:url value="/hm/day-off"/>">?덉빟遺덇?</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">寃곌낵愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="result" href="<c:url value="/hm/result"/>">寃곌낵?깅줉 ?꾪솴</a>
            </li>
            <li>
                <a id="result-lookup" href="<c:url value="/hm/result-lookup"/>">寃곌낵議고쉶</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">怨듭??ы빆</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="notice" href="<c:url value="/hm/commune/notice"/>">怨듭??ы빆</a>
            </li>
        </ul>
    </li>
    <%@include file="/WEB-INF/jsp/common/footer.jsp" %>
</ul>
<!-- END SIDEBAR MENU ITEMS-->
