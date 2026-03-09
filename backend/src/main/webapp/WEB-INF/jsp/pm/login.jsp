<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%--@elvariable id="version" type="java.lang.String"--%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
    <meta charset="utf-8"/>
    <title>Í±¥Í∞ï?¥Ïûê</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, shrink-to-fit=no"/>
    <link rel="apple-touch-icon" href="<c:url value="/lib/pages/ico/60.png"/>">
    <link rel="apple-touch-icon" sizes="76x76" href="<c:url value="/lib/pages/ico/76.png"/>">
    <link rel="apple-touch-icon" sizes="120x120" href="<c:url value="/lib/pages/ico/120.png"/>">
    <link rel="apple-touch-icon" sizes="152x152" href="<c:url value="/lib/pages/ico/152.png"/>">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <meta content="Í±¥Í∞ï?¥Ïûê" name="description"/>

    <link rel="stylesheet" type="text/css" href="<c:url value="/lib/bootstrap/css/bootstrap.min.css"/>"/>
    <link rel="stylesheet" type="text/css" class="main-stylesheet"
          href="<c:url value="/lib/pages/css/themes/corporate.css"/>"/>
    <%--<link rel="stylesheet" type="text/css" class="main-stylesheet" href="<c:url value="/css/style.css"/>"/>--%>
    <link rel="stylesheet" type="text/css" class="main-stylesheet" href="<c:url value="/css/custom.css"/>"/>

    <%--
    <link rel="stylesheet" type="text/css" href="/lib/assets/plugins/pace/pace-theme-flash.css"/>
    <link rel="stylesheet" type="text/css" href="/lib/assets/plugins/jquery-scrollbar/jquery.scrollbar.css" media="screen"/>
    --%>

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;600&display=swap">

    <script type="text/javascript">
        window.onload = function () {
            // fix for windows 8
            if (navigator.appVersion.indexOf("Windows NT 6.2") !== -1) {
                document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="/lib/pages/css/windows.chrome.fix.css" />';
            }
        };
    </script>
</head>
<body class="fixed-header menu-pin menu-behind">
<div class="login-wrapper ">
    <div class="bg-pic">
        <div class="bg-caption p-l-50">
            <h1 class="normal">
                ?úÍ?Í∏∞Ïö∏???§Ïñ¥Ï§Ä?§Î©¥ ?∞Î¶¨ Î™∏Ï? <br>
                ?∞Î¶¨?êÍ≤å Î∂ÑÎ™Ö?òÍ≥† Íµ¨Ï≤¥?ÅÏúºÎ°??òÍ∏∞?úÎã§.??/h1>
            <h5 class="mont opacity-06 m-t-30">
                Our bodies communicate to us clearly and specifically, <br>if we are willing to listen to them.
            </h5>
            <p class="m-t-30">- ??ã∞ Í±∞Ïõ®??Shakti Gawain</p>
        </div>
    </div>
    <div class="login-container bg-white">
        <div class="login-loc p-l-50 p-r-50">
            <img src="<c:url value="/img/logo-login.png"/>" alt="Í±¥Í∞ï?¥ÏûêÎ°úÍ≥†">
            <h4 class="m-t-30 m-b-0 color-gray2 mont">Platform Manager LOGIN</h4>
            <h2 class="m-t-10 font-weight-bold">?åÎû´?ºÎß§?àÏ? Î°úÍ∑∏??/h2>
            <p class="mw-80 m-t-5 color-gray3">Î°úÍ∑∏?∏ÌïòÍ∏??ÑÌï¥ ?ÑÏù¥?îÏ? ?®Ïä§?åÎìúÎ•??ÖÎ†•?¥Ï£º?∏Ïöî.</p>
            <form id="form-login" class="p-t-15" role="form">
                <div class="form-group form-group-default">
                    <label for="managerCode" class="mont font-weight-bold">Login</label>
                    <div class="controls">
                        <input type="text" id="managerCode" placeholder="?ÑÏù¥?îÎ? ?ÖÎ†•?¥Ï£º?∏Ïöî." class="form-control mont"
                               required>
                    </div>
                </div>
                <div class="form-group form-group-default">
                    <label for="userPw" class="mont font-weight-bold">Password</label>
                    <div class="controls">
                        <input type="password" id="userPw" name="userPw" class="form-control mont"
                               placeholder="?®Ïä§?åÎìúÎ•??ÖÎ†•?¥Ï£º?∏Ïöî." required>
                    </div>
                </div>
                <%--<div class="row">
                    <div class="col-md-6 no-padding sm-p-l-10">
                        <div class="form-check">
                            <input type="checkbox" value="1" id="checkbox1">
                            <label for="checkbox1">ID ?Ä?•ÌïòÍ∏?/label>
                        </div>
                    </div>
                    <div class="col-md-6 d-flex align-items-center justify-content-end">

                        <a href="#" class="normal change_pw">?®Ïä§?åÎìúÎ•?Î≥ÄÍ≤ΩÌïòÍ≥??∂Ïúº?†Í???</a>
                    </div>
                </div>--%>
                <div class="m-b-5 m-t-0">
                    <button type="submit" aria-label="" class="btn btn-primary btn-lg m-t-10">Î°úÍ∑∏??/button>
                </div>
            </form>
        </div>
        <div class="pull-bottom login-footer">
            <div class="copyright sm-text-center">
                <p class="small-text no-margin pull-left sm-pull-reset color-gray1">
                    ¬© 2021 VOLK KOREA All Rights Reserved.
                </p>
                <p class="small no-margin pull-right sm-pull-reset">
                    <span class="hint-text m-l-15 small-text color-gray1">GGSJ v<c:out value="${version}"/></span>
                </p>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="<c:url value="/lib/jquery/jquery-3.2.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/lib/jquery-validation/js/jquery.validate.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/lib/jquery-validation/js/localization/messages_ko.min.js"/>"></script>

<%--<script type="text/javascript" src="/lib/assets/plugins/jquery-ui/jquery-ui.min.js"></script>--%>
<%--<script type="text/javascript" src="/lib/assets/plugins/jquery/jquery-easy.js"></script>--%>
<%--<script type="text/javascript" src="/lib/assets/plugins/jquery-unveil/jquery.unveil.min.js"></script>--%>
<%--<script type="text/javascript" src="/lib/assets/plugins/jquery-ios-list/jquery.ioslist.min.js"></script>--%>
<%--<script type="text/javascript" src="/lib/assets/plugins/jquery-actual/jquery.actual.min.js"></script>--%>
<%--<script type="text/javascript" src="/lib/assets/plugins/jquery-scrollbar/jquery.scrollbar.min.js"></script>--%>

<%--<script type="text/javascript" src="/lib/assets/plugins/pace/pace.min.js"></script>--%>
<%--<!--  A polyfill for browsers that don't support ligatures: remove liga.js if not needed-->--%>
<%--<script type="text/javascript" src="/lib/assets/plugins/liga.js"></script>--%>
<%--<script type="text/javascript" src="/lib/assets/plugins/modernizr.custom.js"></script>--%>
<%--<script type="text/javascript" src="/lib/assets/plugins/popper/umd/popper.min.js"></script>--%>
<%--<script type="text/javascript" src="/lib/assets/plugins/classie/classie.js"></script>--%>

<script type="text/javascript" src="<c:url value="/lib/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/lib/pages/js/pages.min.js"/>"></script>

<script>
    $(function () {
        $('#form-login').validate({
            submitHandler: function () {
                $.ajax({
                    url: '<c:url value="/pm/login"/>',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        loginId: $('#managerCode').val(),
                        userPw: $('#userPw').val(),
                    }),
                }).then(function (response) {
                    console.log(JSON.stringify(response));

                    if (response.code === 'SUCCESS') {
                        location.href = '<c:url value="/pm"/>';
                    } else {
                        alert(response.message);
                    }
                });
            }
        });
    });
</script>
</body>
</html>
