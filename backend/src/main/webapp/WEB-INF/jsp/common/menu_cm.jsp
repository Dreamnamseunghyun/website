<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- BEGIN SIDEBAR MENU ITEMS-->
<ul class="menu-items">
    <li class="m-t-20 ">
        <a href="<c:url value="/cm"/>" class="detailed">
            <span class="title">HOME</span>
        </a>
    </li>

    <li>
        <a href="javascript:"><span class="title">湲곗뾽愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="company" href="<c:url value="/cm/company/0"/>">?곸꽭?뺣낫</a>
            </li>
            <li>
                <a id="contract" href="<c:url value="/cm/contract"/>">吏꾪뻾蹂묒썝</a>
            </li>
            <li>
                <a href="#">寃吏꾨퉬 ?뺤궛</a>
            </li>
            <li>
                <a id="companyarchive" href="<c:url value="/cm/companyarchive"/>">?뚯궗蹂닿????먮즺</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">?뚯썝愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="employee" href="<c:url value="/cm/employee"/>">?뚯썝紐⑸줉</a>
            </li>
            <li>
                <a id="employee-batch" href="<c:url value="/cm/employee/batch"/>">?묒??깅줉</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">?덉빟愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="reserve" href="<c:url value="/cm/reserve"/>">?덉빟紐⑸줉</a>
            </li>
            <%--            <li>--%>
            <%--                <a id="cancel-reserve" href="<c:url value="/cm/cancel-reserve"/>">?덉빟痍⑥냼</a>--%>
            <%--            </li>--%>
            <%--            <li>--%>
            <%--                <a id="non-reserve" href="<c:url value="/cm/non-reserve"/>">誘몄삁?쎌옄 愿由?/a>--%>
            <%--            </li>--%>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">怨좉컼?쇳꽣</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="notice" href="<c:url value="/cm/commune/notice"/>">怨듭??ы빆</a>
            </li>
        </ul>
    </li>
    <%@include file="/WEB-INF/jsp/common/footer.jsp" %>
</ul>
<!-- END SIDEBAR MENU ITEMS-->
