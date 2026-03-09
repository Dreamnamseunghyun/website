<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% pageContext.setAttribute("LF", "\n"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Í±¥Í∞ï?¥Ïûê(?¨Ïö©?? Î≥ëÏõê ?ÅÏÑ∏?ïÎ≥¥</title>
    <link href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet" type="text/css">
    <link href="../css/us/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/us/common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/header.css" rel="stylesheet" type="text/css">
    <link href="../css/us/footer.css" rel="stylesheet" type="text/css">
    <link href="../css/us/reserve_step_line.css" rel="stylesheet" type="text/css">
    <link href="../css/us/sub_common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/hospital_detail_list.css" rel="stylesheet" type="text/css">
    <link href="https://unpkg.com/swiper/swiper-bundle.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<header></header>
<div class="header_blank"></div>
<!--header-->
<main>
    <section class="main_section">
        <div class="main_cont">


            <div class="container">
                <div class="title_area">
                    <span class="point_line point_color"></span>
                    <div class="row">
                        <div class="title col-md-12">
                            <h2><c:out value="${center.hospitalCenterName}"/></h2>
                        </div>
                    </div>
                </div><!--title_area-->


                <div class="detailTable">
                    <div class="logoArea">
                        <img src="<c:out value="${center.ciUrl}"/>" class="hos_logo">
                    </div>
                    <div class="infoArea">
                        <ul class="list">
                            <li>
                                <p class="title">Ï£ºÏÜå</p>
                                <p class="detail address">
                                    <c:out value="${center.address1}"/> <c:out value="${center.address2}"/>
                                </p>
                            </li>
                            <li>
                                <p class="title">?ÑÏπò</p>
                                <p class="detail location"><c:out value="${center.locationDesc}"/></p>
                            </li>
                            <li>
                                <p class="title">?ÑÌôî</p>
                                <p class="detail tel">
                                    <a href="tel:<c:out value="${center.telephone}"/>" class="phone_num2">
                                        <c:out value="${center.telephone}"/>
                                    </a>
                                </p>
                            </li>
                            <li>
                                <p class="title">?àÌéò?¥Ï?</p>
                                <p class="detail homepages">
                                    <a href="<c:out value="${center.homepage}"/>" target="_blank">
                                        <c:out value="${center.homepage}"/>
                                    </a>
                                </p>
                            </li>
                            <li class="date">
                                <p class="title">Í≤ÄÏßÑÏ†ë?òÏãúÍ∞?/p>
                                <p class="detail">
                                <ul>
                                    <li class="weekday">
                                        <span>?âÏùº ?§Ï†Ñ</span>
                                        <fmt:formatDate value="${center.receiptNormalBegin}" pattern="HH:mm"/>
                                        ~
                                        <fmt:formatDate value="${center.receiptNormalEnd}" pattern="HH:mm"/>
                                    </li>
                                    <li class="weekday">
                                        <span>?âÏùº ?§ÌõÑ</span>
                                        <fmt:formatDate value="${center.receiptNormalPmBegin}" pattern="HH:mm"/>
                                        ~
                                        <fmt:formatDate value="${center.receiptNormalPmEnd}" pattern="HH:mm"/>
                                    </li>
                                    <li class="sat">
                                        <c:if test="${center.receiptSaturBegin != null && center.receiptSaturEnd != null}">
                                            <span>?†Ïöî??/span>
                                            <fmt:formatDate value="${center.receiptSaturBegin}" pattern="HH:mm"/>
                                            ~
                                            <fmt:formatDate value="${center.receiptSaturEnd}" pattern="HH:mm"/>
                                        </c:if>
                                    </li>
                                </ul>
                                </p>
                            </li>
                        </ul>
                    </div>

                </div>

                <div class="supportList kmi_gn"> <!--?¥Îûò?§Î™Ö?ºÎ°ú Í∞?Î≥ëÏõê ÏßÄ??Î¶¨Ïä§??Ï°∞Ï†ï-->
                    <ul>
                        <c:if test="${center.ableCt}">
                            <li class="list ct">CT</li>
                        </c:if>
                        <c:if test="${center.ableMri}">
                            <li class="list mri">MRI</li>
                        </c:if>
                        <c:if test="${center.ableSoup}">
                            <li class="list meal">?ùÏÇ¨?úÍ≥µ</li>
                        </c:if>
                        <c:if test="${center.ablePark}">
                            <li class="list parking">Ï£ºÏ∞®Í∞Ä??/li>
                        </c:if>
                        <c:if test="${center.ableSatur}">
                            <li class="list sat">?†ÏöîÍ≤ÄÏß?/li>
                        </c:if>
                        <c:if test="${center.ableSpecial}">
                            <li class="list special">?πÏàòÍ≤ÄÏß?/li>
                        </c:if>
                        <c:if test="${center.ableAm}">
                            <li class="list am">?§Ï†ÑÍ≤ÄÏß?/li>
                        </c:if>
                    </ul>
                </div>

                <div class="introduce">
                    <c:out value="${fn:replace(center.advertisement, LF, '<br/>')}" escapeXml="false"/>
                </div>

                <div class="locationInt">
                    <div class="int">
                        <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff"
                             class="swiper mySwiper2">
                            <div class="swiper-wrapper">
                                <c:if test="${not empty center.centerAdvUrl1}">
                                    <div class="swiper-slide">
                                        <img src="<c:out value="${center.centerAdvUrl1}"/>"/>
                                    </div>
                                </c:if>
                                <c:if test="${not empty center.centerAdvUrl2}">
                                    <div class="swiper-slide">
                                        <img src="<c:out value="${center.centerAdvUrl2}"/>"/>
                                    </div>
                                </c:if>
                                <c:if test="${not empty center.centerAdvUrl3}">
                                    <div class="swiper-slide">
                                        <img src="<c:out value="${center.centerAdvUrl3}"/>"/>
                                    </div>
                                </c:if>
                                <c:if test="${not empty center.centerAdvUrl4}">
                                    <div class="swiper-slide">
                                        <img src="<c:out value="${center.centerAdvUrl4}"/>"/>
                                    </div>
                                </c:if>
                                <c:if test="${not empty center.centerAdvUrl5}">
                                    <div class="swiper-slide">
                                        <img src="<c:out value="${center.centerAdvUrl5}"/>"/>
                                    </div>
                                </c:if>
                                <c:if test="${not empty center.centerAdvUrl6}">
                                    <div class="swiper-slide">
                                        <img src="<c:out value="${center.centerAdvUrl6}"/>"/>
                                    </div>
                                </c:if>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                        <div thumbsSlider="" class="swiper mySwiper thumb">
                            <div class="swiper-wrapper">
                                <c:if test="${not empty center.centerAdvUrl1}">
                                    <div class="swiper-slide">
                                        <img src="<c:out value="${center.centerAdvUrl1}"/>"/>
                                    </div>
                                </c:if>
                                <c:if test="${not empty center.centerAdvUrl2}">
                                    <div class="swiper-slide">
                                        <img src="<c:out value="${center.centerAdvUrl2}"/>"/>
                                    </div>
                                </c:if>
                                <c:if test="${not empty center.centerAdvUrl3}">
                                    <div class="swiper-slide">
                                        <img src="<c:out value="${center.centerAdvUrl3}"/>"/>
                                    </div>
                                </c:if>
                                <c:if test="${not empty center.centerAdvUrl4}">
                                    <div class="swiper-slide">
                                        <img src="<c:out value="${center.centerAdvUrl4}"/>"/>
                                    </div>
                                </c:if>
                                <c:if test="${not empty center.centerAdvUrl5}">
                                    <div class="swiper-slide">
                                        <img src="<c:out value="${center.centerAdvUrl5}"/>"/>
                                    </div>
                                </c:if>
                                <c:if test="${not empty center.centerAdvUrl6}">
                                    <div class="swiper-slide">
                                        <img src="<c:out value="${center.centerAdvUrl6}"/>"/>
                                    </div>
                                </c:if>
                            </div>
                        </div>

                    </div>

                    <div id="map" class="map">

                    </div>
                </div>


                <div class="btn_area">
                    <div class="btn check_complete_btn">
                        <span class="button_on_circle"></span>
                        <a href="javascript:history.back()" class="btn_inner blue_gradient">
                            <span class="btn_txt_area">
                                ?§Î°ú Í∞ÄÍ∏?                            </span>
                        </a>
                    </div>
                </div>

            </div><!--container-->


        </div><!--main_cont-->
    </section><!--main_section-->

</main>


<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c3c6ae34232fb1100d74eac44ec32245"></script>

<script>

    $("header").load("header.html");
    $("footer").load("footer.html");

    $(".radio_box ul li a > label").click(function () {
        var chk = $(this).find("input").is(":checked");
        if (chk) { //Ï≤¥ÌÅ¨Í∞Ä ?òÏóà?ÑÏãú
            $(this).find("input").prop("checked", true).parents("li").addClass("active").siblings("li").removeClass("active").find("input").prop("checked", false)

        } else {
            $(this).find("input").prop("checked", false).parents("li").removeClass("active").siblings("li").removeClass("active").find("input").prop("checked", false)
        }

    });

    // TODO: css ???ÅÏö©??Í∏∞Î≥∏ ÏßÄ???¥Î?ÏßÄ ??†ú?¥Ïïº ??    var container = document.getElementById('map');
    var map = new kakao.maps.Map(container, {
        center: new kakao.maps.LatLng(33.450701, 126.570667),  // Í∏∞Î≥∏ Ï£ºÏÜå Ïπ¥Ïπ¥?§Î≥∏??    });

    $.ajax({
        url: '<c:url value="/common/kakao/search"/>',
        dataType: 'json',
        type: 'GET',
        data: {
            address: '<c:out value="${center.address1}"/>',
        },
    }).then(function (response) {
        console.log(response);
        if (response.documents.length > 0) {
            let position = new kakao.maps.LatLng(response.documents[0].y, response.documents[0].x);
            map.setCenter(position);

            new kakao.maps.Marker({map: map, position: position});
        }
    });
</script>


<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        spaceBetween: 10,
        slidesPerView: 4,
        freeMode: true,
        watchSlidesProgress: true,
    });
    var swiper2 = new Swiper(".mySwiper2", {
        spaceBetween: 10,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        thumbs: {
            swiper: swiper,
        },
    });



    //input???ÑÎãå???∞ÎÑòÎ≤ÑÍ? Î≥¥Ïó¨ÏßÄ???îÎ©¥???àÏùÑ Í≤ΩÏö∞
    $(".phone_num2").text($(".phone_num2").text().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-"));



</script>
</body>
</html>
