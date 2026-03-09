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
        <a href="javascript:"><span class="title">병원관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="hospital" href="<c:url value="/hm/hospital"/>">병원목록</a>
            </li>
            <li>
                <a id="contract-checkup" href="<c:url value="/hm/contract-checkup"/>">검진유형목록</a>
            </li>
            <li>
                <a id="hospital-checkup" href="<c:url value="/hm/hospital/0/checkup/2022"/>">연도별기준수가</a>
            </li>
            <li>
                <a id="companyarchive" href="<c:url value="/hm/companyarchive"/>">회사보관용 자료</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">예약관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="reserve" href="<c:url value="/hm/reserve"/>">예약현황</a>
            </li>
            <li>
                <a id="cancel-reserve" href="<c:url value="/hm/cancel-reserve"/>">예약취소</a>
            </li>
            <li>
                <a id="day-off" href="<c:url value="/hm/day-off"/>">예약불가</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">결과관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="result" href="<c:url value="/hm/result"/>">결과등록 현황</a>
            </li>
            <li>
                <a id="result-lookup" href="<c:url value="/hm/result-lookup"/>">결과조회</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">공지사항</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="notice" href="<c:url value="/hm/commune/notice"/>">공지사항</a>
            </li>
        </ul>
    </li>
    <%@include file="/WEB-INF/jsp/common/footer.jsp" %>
</ul>
<!-- END SIDEBAR MENU ITEMS-->
