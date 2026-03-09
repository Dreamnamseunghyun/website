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
        <a href="javascript:"><span class="title">기업관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="company" href="<c:url value="/cm/company/0"/>">상세정보</a>
            </li>
            <li>
                <a id="contract" href="<c:url value="/cm/contract"/>">진행병원</a>
            </li>
            <li>
                <a href="#">검진비 정산</a>
            </li>
            <li>
                <a id="companyarchive" href="<c:url value="/cm/companyarchive"/>">회사보관용 자료</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">회원관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="employee" href="<c:url value="/cm/employee"/>">회원목록</a>
            </li>
            <li>
                <a id="employee-batch" href="<c:url value="/cm/employee/batch"/>">엑셀등록</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">예약관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="reserve" href="<c:url value="/cm/reserve"/>">예약목록</a>
            </li>
            <%--            <li>--%>
            <%--                <a id="cancel-reserve" href="<c:url value="/cm/cancel-reserve"/>">예약취소</a>--%>
            <%--            </li>--%>
            <%--            <li>--%>
            <%--                <a id="non-reserve" href="<c:url value="/cm/non-reserve"/>">미예약자 관리</a>--%>
            <%--            </li>--%>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">고객센터</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="notice" href="<c:url value="/cm/commune/notice"/>">공지사항</a>
            </li>
        </ul>
    </li>
    <%@include file="/WEB-INF/jsp/common/footer.jsp" %>
</ul>
<!-- END SIDEBAR MENU ITEMS-->
