<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- BEGIN SIDEBAR MENU ITEMS-->
<ul class="menu-items">
    <li class="m-t-20 ">
        <a href="<c:url value="/pm"/>" class="detailed">
            <span class="title">HOME</span>
        </a>
    </li>

    <li>
        <a href="javascript:"><span class="title">湲곗??뺣낫愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="item-code" href="<c:url value="/pm/item-code"/>">??ぉ肄붾뱶愿由?/a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">湲곗뾽愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="company" href="<c:url value="/pm/company"/>">湲곗뾽紐⑸줉</a>
            </li>
            <li>
                <a id="contract" href="<c:url value="/pm/contract"/>">吏꾪뻾蹂묒썝</a>
            </li>
            <li>
                <a href="#">寃吏꾨퉬 ?뺤궛</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">?뚯썝愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="employee" href="<c:url value="/pm/employee"/>">?뚯썝紐⑸줉</a>
            </li>
            <li>
                <a id="employee-batch" href="<c:url value="/pm/employee/batch"/>">?묒??깅줉</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">蹂묒썝愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="hospital" href="<c:url value="/pm/hospital"/>">蹂묒썝紐⑸줉</a>
            </li>
            <li>
                <a id="contract-checkup" href="<c:url value="/pm/contract-checkup"/>">寃吏꾩쑀?뺣ぉ濡?/a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">?덉빟愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="reserve" href="<c:url value="/pm/reserve"/>">?덉빟?꾪솴</a>
            </li>
            <li>
                <a id="cancel-reserve" href="<c:url value="/pm/cancel-reserve"/>">?덉빟痍⑥냼</a>
            </li>
            <li>
                <a id="non-reserve" href="<c:url value="/pm/non-reserve"/>">誘몄삁?쎌옄 愿由?/a>
            </li>
            <li>
                <a id="day-off" href="<c:url value="/pm/day-off"/>">?덉빟遺덇?</a>
            </li>
            <li>
                <a href="#">寃吏꾨룆??利앸튃 ?먮즺</a>
            </li>

        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">寃곌낵愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="result" href="<c:url value="/pm/result"/>">寃곌낵?깅줉 ?꾪솴</a>
            </li>
            <li>
                <a id="result-lookup" href="<c:url value="/pm/result-lookup"/>">寃곌낵議고쉶</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">怨좉컼?쇳꽣</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="notice" href="<c:url value="/pm/commune/notice"/>">怨듭??ы빆</a>
            </li>
            <li>
                <a id="faq" href="<c:url value="/pm/commune/faq"/>">FAQ</a>
            </li>
            <li>
                <a id="one2one" href="<c:url value="/pm/commune/one2one"/>">1:1臾몄쓽</a>
            </li>
            <li>
                <a id="healthcare" href="<c:url value="/pm/commune/healthcare"/>">嫄닿컯?곸떇</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">?곸뾽愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="manager" href="<c:url value="/pm/manager"/>">留ㅻ땲?愿由?/a>
            </li>
            <li>
                <a id="calculate" href="<c:url value="/pm/calculate"/>">?뺤궛愿由?/a>
            </li>
            <li>
                <a id="sales" href="<c:url value="/pm/sales"/>">留ㅼ텧愿由?/a>
            </li>
            <li>
                <a id="companyarchive" href="<c:url value="/pm/companyarchive"/>">?뚯궗蹂닿????먮즺</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">?뚮┝??愿由?/span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="userExcept" href="<c:url value="/pm/user-except"/>">諛쒖넚?쒖쇅??怨좉컼??</a>
            </li>
            <li>
                <a id="hmExcept" href="<c:url value="/pm/hm-except"/>">諛쒖넚?쒖쇅??蹂묒썝留ㅻ땲???</a>
            </li>
            <li>
                <a id="checkupInfo" href="<c:url value="/pm/checkup-info"/>">寃吏꾩떎???덈궡 諛쒖넚</a>
            </li>
            <li>
                <a id="urge" href="<c:url value="/pm/urge"/>">誘몄삁???낅젮 諛쒖넚</a>
            </li>
            <li>
                <a id="notitokinfo" href="<c:url value="/pm/notitokinfo"/>">?뚮┝??愿由??ν꽣???뚯뒪?몄슜)</a>
            </li>
        </ul>
    </li>
    <%@include file="/WEB-INF/jsp/common/footer.jsp" %>
</ul>
<!-- END SIDEBAR MENU ITEMS-->
