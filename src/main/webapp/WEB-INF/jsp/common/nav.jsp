<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--@elvariable id="sessionUserType" type="java.lang.String"--%>
<%--@elvariable id="sessionLoginName" type="java.lang.String"--%>

<nav class="page-sidebar" data-pages="sidebar">
    <div class="sidebar-header">
        <a href="<c:url value="/${sessionUserType.toLowerCase()}"/>">
            <img src="<c:url value="/img/logo_white.png"/>" alt="logo" class="brand" width="122" height="30"
                 data-src="assets/img/logo_white.png" data-src-retina="assets/img/logo_white_2x.png"/>
        </a>
    </div>
    <div class="sidebar-menu">
        <div class="util_user">
            <div class="row">
                <div class="col-md-9">
                    <p class="name_tag">
                        <b class="white"><c:out value="${sessionLoginName}"/></b>님 <br> 로그인 되었습니다
                    </p>
                </div>
                <div class="col-md-3">
                    <div class="dropdown pull-right d-lg-block d-none user_thumb">
                        <button class="profile-dropdown-toggle" onclick=location.href="<c:url value="/logout"/>"
                                type="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false" aria-label="profile dropdown">
                        <span class="thumbnail-wrapper d32 circular inline">
<%--                        <img src="<c:url value="/img/avatar.jpg"/>" alt="" data-src="<c:url value="/img/avatar.jpg"/>"--%>
<%--                             data-src-retina="<c:url value="/img/avatar@2x.jpg"/>" width="32" height="32" />--%>
                            <i class="logout_icon xi-log-out" title="로그아웃"></i>
                        </span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right profile-dropdown" role="menu">
                            <a href="#" class="dropdown-item">매니저 관리 <span
                                    class="pg-icon pull-right">settings</span></a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item logout">로그아웃 <span
                                    class="pg-icon pull-right">exit</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <c:choose>
            <c:when test="${sessionUserType == 'PM'}">
                <%--User Type PM--%>
                <%@include file="menu_pm.jsp" %>
            </c:when>
            <c:when test="${sessionUserType == 'CM'}">
                <%--User Type PM--%>
                <%@include file="menu_cm.jsp" %>
            </c:when>
            <c:when test="${sessionUserType == 'HM'}">
                <%--User Type PM--%>
                <%@include file="menu_hm.jsp" %>
            </c:when>
        </c:choose>

        <div class="clearfix"></div>
    </div>
</nav>
<script>
    function dx_button_custom(){
        $(".dx-button").prepend('<span class="button-on-circle"></span>');
    }

    function dx_button_hover(){
        $(".dx-button .dx-button-content").mouseenter(function (e) {
            var parentOffset = $(this).offset();

            var relX = e.pageX - parentOffset.left;
            var relY = e.pageY - parentOffset.top;
            $(this).prev(".dx-button .button-on-circle").css({"left": relX, "top": relY});
            $(this).prev(".dx-button .button-on-circle").removeClass("desplode-circle");
            $(this).prev(".dx-button .button-on-circle").addClass("explode-circle");

        });

        $(".dx-button .dx-button-content").mouseleave(function (e) {

            var parentOffset = $(this).offset();

            var relX = e.pageX - parentOffset.left;
            var relY = e.pageY - parentOffset.top;
            $(this).prev(".dx-button .button-on-circle").css({"left": relX, "top": relY});
            $(this).prev(".dx-button .button-on-circle").removeClass("explode-circle");
            $(this).prev(".dx-button .button-on-circle").addClass("desplode-circle");

        });
    }

    window.onload = function () {
        //circle 생성
        setTimeout('dx_button_custom()', 1000);
        setTimeout('dx_button_hover()', 1000);

        //tag-name icon-box 생성
        $(".row-wrap .row .tag-name").prepend('<span class="icon-area"></span>');
        $(".row-wrap .row .tag-name.check .icon-area").append('<i class="xi-check-min"></i>');
    };




</script>
