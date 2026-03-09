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
        <a href="javascript:"><span class="title">기준정보관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="item-code" href="<c:url value="/pm/item-code"/>">항목코드관리</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">기업관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="company" href="<c:url value="/pm/company"/>">기업목록</a>
            </li>
            <li>
                <a id="contract" href="<c:url value="/pm/contract"/>">진행병원</a>
            </li>
            <li>
                <a href="#">검진비 정산</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">회원관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="employee" href="<c:url value="/pm/employee"/>">회원목록</a>
            </li>
            <li>
                <a id="employee-batch" href="<c:url value="/pm/employee/batch"/>">엑셀등록</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">병원관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="hospital" href="<c:url value="/pm/hospital"/>">병원목록</a>
            </li>
            <li>
                <a id="contract-checkup" href="<c:url value="/pm/contract-checkup"/>">검진유형목록</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">예약관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="reserve" href="<c:url value="/pm/reserve"/>">예약현황</a>
            </li>
            <li>
                <a id="cancel-reserve" href="<c:url value="/pm/cancel-reserve"/>">예약취소</a>
            </li>
            <li>
                <a id="non-reserve" href="<c:url value="/pm/non-reserve"/>">미예약자 관리</a>
            </li>
            <li>
                <a id="day-off" href="<c:url value="/pm/day-off"/>">예약불가</a>
            </li>
            <li>
                <a href="#">검진독려 증빙 자료</a>
            </li>

        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">결과관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="result" href="<c:url value="/pm/result"/>">결과등록 현황</a>
            </li>
            <li>
                <a id="result-lookup" href="<c:url value="/pm/result-lookup"/>">결과조회</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">고객센터</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="notice" href="<c:url value="/pm/commune/notice"/>">공지사항</a>
            </li>
            <li>
                <a id="faq" href="<c:url value="/pm/commune/faq"/>">FAQ</a>
            </li>
            <li>
                <a id="one2one" href="<c:url value="/pm/commune/one2one"/>">1:1문의</a>
            </li>
            <li>
                <a id="healthcare" href="<c:url value="/pm/commune/healthcare"/>">건강상식</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">영업관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="manager" href="<c:url value="/pm/manager"/>">매니저관리</a>
            </li>
            <li>
                <a id="calculate" href="<c:url value="/pm/calculate"/>">정산관리</a>
            </li>
            <li>
                <a id="sales" href="<c:url value="/pm/sales"/>">매출관리</a>
            </li>
            <li>
                <a id="companyarchive" href="<c:url value="/pm/companyarchive"/>">회사보관용 자료</a>
            </li>
        </ul>
    </li>

    <li>
        <a href="javascript:"><span class="title">알림톡 관리</span> <span class=" arrow"></span></a>
        <ul class="sub-menu">
            <li>
                <a id="userExcept" href="<c:url value="/pm/user-except"/>">발송제외자(고객용)</a>
            </li>
            <li>
                <a id="hmExcept" href="<c:url value="/pm/hm-except"/>">발송제외자(병원매니저용)</a>
            </li>
            <li>
                <a id="checkupInfo" href="<c:url value="/pm/checkup-info"/>">검진실시 안내 발송</a>
            </li>
            <li>
                <a id="urge" href="<c:url value="/pm/urge"/>">미예약 독려 발송</a>
            </li>
            <li>
                <a id="notitokinfo" href="<c:url value="/pm/notitokinfo"/>">알림톡 관리(닥터송 테스트용)</a>
            </li>
        </ul>
    </li>
    <%@include file="/WEB-INF/jsp/common/footer.jsp" %>
</ul>
<!-- END SIDEBAR MENU ITEMS-->
