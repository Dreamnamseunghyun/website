<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건강살자(사용자) 건강검진 대상자 정보</title>
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
    <link href="../css/us/target_information.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="<c:url value="/lib/devextreme/dx.material.ggsj.css"/>">
    <style>
        .dx-overlay-wrapper {
            z-index: 10000 !important;
        }
    </style>
</head>
<body>
<header></header>
<div class="header_blank"></div>
<!--header-->
<main>
    <section class="main_section">
        <div class="main_cont">

            <div class="step_line"> <!--step_line-->
                <div class="step_line_color">
                    <div class="step_color step_color_first active">
                    </div>
                    <div class="container">
                    </div>
                    <div class="step_color step_color_last">
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="step_area">
                            <div class="step step01 active">
                                <div class="step_inner">
                                    <div class="left_area">
                                        <div class="title">
                                            <h3>STEP 1</h3>
                                        </div>
                                        <div class="info">
                                            검진 예약
                                        </div>
                                    </div>
                                    <div class="right_area">
                                        <img src="../img/us/reserve/step_line/step_line_img01_active.png">
                                    </div>
                                </div>
                                <div class="step_border">
                                </div>
                            </div><!--step01-->
                            <div class="step step02">
                                <div class="step_inner">
                                    <div class="left_area">
                                        <div class="title">
                                            <h3>STEP 2</h3>
                                        </div>
                                        <div class="info">
                                            검진 항목 선택
                                        </div>
                                    </div>
                                    <div class="right_area">
                                        <img src="../img/us/reserve/step_line/step_line_img02.png">
                                    </div>
                                </div>
                                <div class="step_border">
                                </div>
                            </div><!--step02-->
                            <div class="step step03">
                                <div class="step_inner">
                                    <div class="left_area">
                                        <div class="title">
                                            <h3>STEP 3</h3>
                                        </div>
                                        <div class="info">
                                            병원 및 항목 선택
                                        </div>
                                    </div>
                                    <div class="right_area">
                                        <img src="../img/us/reserve/step_line/step_line_img03.png">
                                    </div>
                                </div>
                                <div class="step_border">
                                </div>
                            </div><!--step03-->
                            <div class="step step04">
                                <div class="step_inner">
                                    <div class="left_area">
                                        <div class="title">
                                            <h3>STEP 4</h3>
                                        </div>
                                        <div class="info">
                                            검진 희망일 선택
                                        </div>
                                    </div>
                                    <div class="right_area">
                                        <img src="../img/us/reserve/step_line/step_line_img04.png">
                                    </div>
                                </div>
                                <div class="step_border">
                                </div>
                            </div><!--step04-->
                            <div class="step step05">
                                <div class="step_inner">
                                    <div class="left_area">
                                        <div class="title">
                                            <h3>STEP 5</h3>
                                        </div>
                                        <div class="info">
                                            최종 예약 정보
                                        </div>
                                    </div>
                                    <div class="right_area">
                                        <img src="../img/us/reserve/step_line/step_line_img05.png">
                                    </div>
                                </div>
                            </div><!--step05-->

                        </div><!--step_area-->
                    </div><!--row-->
                </div><!--container-->
            </div><!--step_line-->

            <div class="container">
                <div class="title_area" style="padding-right:0; ">
                    <span class="point_line point_color"></span>
                    <div class="row">
                        <div class="title col-md-5">
                            <h2>건강검진 대상자 정보</h2>
                        </div>
                        <div class="status_info col-md-7">
                            <ul>
                                <li><span class="status_icon orange not_reservation"></span>미예약</li>
                                <li><span class="status_icon skyblue reservation_request"></span> 예약신청</li>
                                <li><span class="status_icon purple reservation_confirm"></span> 예약확정</li>
                                <li><span class="status_icon green examination_complete"></span> 수검완료</li>
                                <li><span class="status_icon pink reservation_change"></span> 예약변경</li>
                                <li><span class="status_icon grey reservation_cancel"></span> 예약취소</li>
                            </ul>
                        </div><!--status_info-->
                    </div>
                </div><!--title_area-->
                <div class="list_area">

                    <c:forEach items="${reserveList}" var="reserve">
                        <c:choose>
                            <c:when test="${reserve.reservationState == null}">
                                <c:set var="reservationStateClass" value="not_reservation"/>
                                <c:set var="reservationStateText" value="미예약"/>
                            </c:when>
                            <c:when test="${reserve.reservationState == 0}">
                                <c:set var="reservationStateClass" value="reservation_cancel"/>
                                <c:set var="reservationStateText" value="예약취소 진행중 (24시간 이내 재예약 가능)"/>
                            </c:when>
                            <c:when test="${reserve.reservationState == 1}">
                                <c:set var="reservationStateClass" value="reservation_request"/>
                                <c:set var="reservationStateText" value="예약신청"/>
                            </c:when>
                            <c:when test="${reserve.reservationState == 2}">
                                <c:set var="reservationStateClass" value="reservation_confirm"/>
                                <c:set var="reservationStateText" value="예약확정"/>
                            </c:when>
                            <c:when test="${reserve.reservationState == 3}">
                                <c:set var="reservationStateClass" value="reservation_change"/>
                                <c:set var="reservationStateText" value="예약변경"/>
                            </c:when>
                            <c:when test="${reserve.reservationState == 4}">
                                <c:set var="reservationStateClass" value="examination_complete"/>
                                <c:set var="reservationStateText" value="수검완료"/>
                            </c:when>
                            <c:when test="${reserve.reservationState == 5}">
                                <c:set var="reservationStateClass" value="not_reservation"/>
                                <c:set var="reservationStateText" value="예약보류"/>
                            </c:when>
                        </c:choose>

                        <c:set var="today" value="<%=new java.util.Date()%>"/>
                        <fmt:formatDate value="${reserve.desiredAt}" pattern="yyyy년 M월 d일 / a" var="desiredAtText"/>
                        <fmt:formatDate value="${reserve.checkupedAt}" pattern="yyyy년 M월 d일 /a" var="checkupedAtText"/>
                        <fmt:formatDate value="${reserve.confirmedAt}" pattern="yyyy년 M월 d일 /a" var="confirmedAtText"/>


                        <div class="list list01 <c:out value="${reservationStateClass}"/>">
                            <span class="point_line"></span>
                            <div class="row">
                                <div class="info_area col-md-9">
                                    <ul>
                                        <li>
                                            <span class="info_title">
                                                <%--<c:out value="${reserve.myself == 1 ? '본인' : '가족'}"/>--%>
                                                검진자
                                            </span>
                                            <span class="info"><c:out value="${reserve.employeeName}"/></span>
                                        </li>
                                        <li>
                                            <span class="info_title">비용청구</span>
                                            <span class="info">
                                                <c:out value="${reserve.supportType ? '본인' : '기업'}"/>
                                            </span>
                                        </li>
                                        <c:if test="${reserve.myself == 1}">
                                            <li class="corper_possible_people">
                                                <span class="info_title long_title">기업부담 대상</span>
                                                <span class="info">본인 포함
                                                    <span class="p_num"><c:out value="${checkupNumber}"/></span>명
                                                    <div class="full_people">
                                                        <div class="full_people_bg">
                                                            <span>기업부담 검진 가능</span> 인원이 모두 반영 되었습니다.
                                                        </div>
                                                    </div>
                                                </span>
                                            </li>
                                        </c:if>
                                        <li>
                                            <span class="info_title">상태</span>
                                            <span class="info"><c:out value="${reservationStateText}"/></span>
                                        </li>
                                        <li>
                                            <span class="info_title">검진일정</span>
                                            <span class="info">
                                                <c:out value="${reserve.reservationState == null ? '미정' : (checkupedAtText == null ? (confirmedAtText == null ? desiredAtText : confirmedAtText) : checkupedAtText)}"/>
                                            </span>
                                        </li>
                                        <li>
                                            <span class="info_title">검진유형</span>
                                            <span class="info">
                                                <c:out value="${reserve.reservationState == null ? '미정' : reserve.companyCheckupTypeName += '_' += reserve.subTypeName}"/>
                                            </span>
                                        </li>
                                        <li>
                                            <span class="info_title">검진병원</span>
                                            <span class="info">
                                                <c:out value="${reserve.reservationState == null ? '미정' : reserve.hospitalCenterName}"/>
                                            </span>
                                        </li>
                                    </ul>
                                    <div class="period_area box_shadow_area">
                                        <div class="date_info">
                                            <div class="period_img">
                                                <span class="period_txt">
                                                    <fmt:formatNumber
                                                            value="${(today.time - reserve.reserveDateEnd.time) / 86400000 - 0.5}"
                                                            pattern="#" var="reserveTime"/>
                                                    <c:choose>
                                                        <c:when test="${reserveTime == 0}">
                                                            <c:out value="0"></c:out>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${reserveTime}"></c:out>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </div>
                                            <div class="period_noti">
                                                <p>
                                                    <span class="user_name"><c:out value="${reserve.employeeName}"/> 고객님,<br>
                                                    검진 예약 가능한 기간이
                                                    <br>
                                                   <span class="period_txt purple">
                                                       <fmt:formatNumber
                                                               value="${-((today.time - reserve.reserveDateEnd.time) / 86400000 - 0.5)}"
                                                               pattern="#" var="reserveEndTime"/>
                                                       <c:choose>
                                                           <c:when test="${reserveEndTime <= 0}">
                                                               <c:out value="${-reserveEndTime}"></c:out>
                                                           </c:when>
                                                           <c:otherwise>
                                                               <c:out value="${reserveEndTime}"></c:out>
                                                           </c:otherwise>
                                                       </c:choose>
                                                       일
                                                    </span>
                                                        <c:choose>
                                                           <c:when test="${reserveEndTime <= 0}">
                                                               지났습니다.
                                                           </c:when>
                                                           <c:otherwise>
                                                               남았습니다.
                                                           </c:otherwise>
                                                       </c:choose>
                                                </p></div>
                                        </div>
                                    </div>
                                </div><!--info_area-->
                                <div class="snb_area col-md-3">
                                    <ul>
                                        <c:if test="${reserve.reservationState == null}">
                                            <li>
                                                <div class="snb_btn">
                                                    <div class="btn reserve_btn">
                                                        <span class="button_on_circle"></span>
                                                        <c:choose>
                                                            <c:when test="${reserveEndTime < 0}">
                                                                <a onclick="delchk()"
                                                                   class="btn_inner blue_gradient">
                                                        <span class="btn_txt_area">
                                                            예약 시작하기
                                                        </span>
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="reserve.html?userId=<c:out value="${reserve.userId}"/>"
                                                                   class="btn_inner blue_gradient">
                                                        <span class="btn_txt_area">
                                                            예약 시작하기
                                                        </span>
                                                                </a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                            <%--                                                        <a href="reserve.html?userId=<c:out value="${reserve.userId}"/>"--%>
                                                            <%--                                                           class="btn_inner blue_gradient">--%>
                                                            <%--                                                        <span class="btn_txt_area">--%>
                                                            <%--                                                            예약 시작하기--%>
                                                            <%--                                                        </span>--%>
                                                            <%--                                                        </a>--%>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:if>

                                        <c:if test="${reserve.reservationState != null}">
                                            <li>
                                                <div class="snb_btn">
                                                    <div class="btn reservation_check_btn">
                                                        <span class="button_on_circle"></span>
                                                        <a href="check_information.html?userId=<c:out value="${reserve.userId}"/>&reservationId=<c:out value="${reserve.reservationId}"/>"
                                                           class="btn_inner sky_blue">
                                                        <span class="btn_txt_area">
                                                            예약 상세 조회
                                                        </span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:if>

                                        <c:if test="${(reserve.checkupedAt == null && reserve.confirmedAt == null && (reserve.desiredAt.time - today.time) / 86400000 > 4)}">
                                            <c:if test="${reserve.reservationState == 1 || reserve.reservationState == 2 || reserve.reservationState == 3}">
                                                <li>
                                                    <div class="snb_btn">
                                                        <div class="btn reservation_change_btn">
                                                            <span class="button_on_circle"></span>
                                                            <a href="edit_information.html?userId=<c:out value="${reserve.userId}"/>&reservationId=<c:out value="${reserve.reservationId}"/>"
                                                               class="btn_inner pink">
                                                        <span class="btn_txt_area">
                                                            예약 변경
                                                        </span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:if>
                                            <c:if test="${reserve.reservationState == 1 || reserve.reservationState == 2 || reserve.reservationState == 3 || reserve.reservationState == 5}">
                                                <li>
                                                    <div class="snb_btn">
                                                        <div class="btn reservation_cancel_btn">
                                                            <span class="button_on_circle"></span>
                                                            <a href="cancel_information.html?userId=<c:out value="${reserve.userId}"/>&reservationId=<c:out value="${reserve.reservationId}"/>"
                                                               class="btn_inner grey">
                                                        <span class="btn_txt_area">
                                                            예약 취소
                                                        </span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:if>
                                        </c:if>

                                        <c:if test="${(reserve.checkupedAt == null && reserve.confirmedAt != null && (reserve.confirmedAt.time - today.time) / 86400000 > 4)}">
                                            <c:if test="${reserve.reservationState == 1 || reserve.reservationState == 2 || reserve.reservationState == 3}">
                                                <li>
                                                    <div class="snb_btn">
                                                        <div class="btn reservation_change_btn">
                                                            <span class="button_on_circle"></span>
                                                            <a href="edit_information.html?userId=<c:out value="${reserve.userId}"/>&reservationId=<c:out value="${reserve.reservationId}"/>"
                                                               class="btn_inner pink">
                                                        <span class="btn_txt_area">
                                                            예약 변경
                                                        </span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:if>
                                            <c:if test="${reserve.reservationState == 1 || reserve.reservationState == 2 || reserve.reservationState == 3 || reserve.reservationState == 5}">
                                                <li>
                                                    <div class="snb_btn">
                                                        <div class="btn reservation_cancel_btn">
                                                            <span class="button_on_circle"></span>
                                                            <a href="cancel_information.html?userId=<c:out value="${reserve.userId}"/>&reservationId=<c:out value="${reserve.reservationId}"/>"
                                                               class="btn_inner grey">
                                                        <span class="btn_txt_area">
                                                            예약 취소
                                                        </span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:if>
                                        </c:if>

                                        <li>
                                            <div class="snb_btn">
                                                <div class="btn mypage_btn">
                                                    <span class="button_on_circle"></span>
                                                    <a href="mypage.html?userId=<c:out value="${reserve.userId}"/>"
                                                       class="btn_inner orange">
                                                        <span class="btn_txt_area">
                                                            마이페이지
                                                        </span>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>

                                        <c:if test="${reserve.myself == 1 && copayCompanyCheckupTypeList.size() > 0}">
                                            <li>
                                                <div class="snb_btn">
                                                    <div class="btn add_family_btn">
                                                        <span class="button_on_circle"></span>
                                                        <a href="#" class="btn_inner point_color">
                                                        <span class="btn_txt_area">
                                                            가족추가<i class="xi-plus-circle-o"></i>
                                                        </span>
                                                        </a>
                                                    </div><!--family_btn-->
                                                </div><!--snb_btn-->
                                            </li>
                                        </c:if>

                                    </ul>
                                </div>

                            </div><!--row-->
                        </div>
                    </c:forEach>

                </div><!--list_arae-->

            </div><!--container-->

        </div><!--main_cont-->
    </section><!--main_section-->

</main>

<div class="find_popup">

    <div class="click_popup_bg"></div>
    <div class="click_popup">
        <div class="title_area">
            <span class="title">추가하실 가족의 정보를 입력해 주세요</span>
            <span class="click_popup_close"><a><i class="xi-close"></i></a></span>
        </div>

        <div class="click_popup_wrap">


            <div class="popup_id_select">
                <div class="edit_area">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="write">
                                <div class="input_type1">
                                    <label for="f_v1">
                                        <input type="text" name="f_v1" id="f_v1" placeholder="&nbsp;"
                                               maxlength="15" autocomplete="off">
                                        <span class="label">이름을 입력하세요.</span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="write"><!--체크박스-->
                                <div class="chk_type2 chk_area">
                                    <div class="chk_boxArea">
                                        <label class="item" for="f_v2_1">
                                            <input type="checkbox" name="f_v2_1" id="f_v2_1" class="hidden" value="남성">
                                            <label class="cbx" for="f_v2_1">
                                                <svg height="20px" viewBox="0 -8 16 30" width="20px">
                                                    <polyline points="1 7.6 5 11 13 1"></polyline>
                                                </svg>
                                            </label>
                                            <label class="cbx-lbl" for="f_v2_1">남성</label>
                                        </label>
                                    </div>
                                    <div class="chk_boxArea">
                                        <label class="item" for="f_v2_2">
                                            <input type="checkbox" name="f_v2_2" id="f_v2_2" class="hidden" value="여성">
                                            <label class="cbx" for="f_v2_2">
                                                <svg height="20px" viewBox="0 -8 16 30" width="20px">
                                                    <polyline points="1 7.6 5 11 13 1"></polyline>
                                                </svg>
                                            </label>
                                            <label class="cbx-lbl" for="f_v2_2">여성</label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--생년월일-->
                    </div><!--1번째단-->


                    <div class="row">
                        <div class="col-md-6">
                            <div class="write">
                                <div class="input_type1">
                                    <label for="f_v3">
                                        <input type="text" name="f_v3" id="f_v3" class="only_num phone_num"
                                               placeholder="&nbsp;" maxlength="13" autocomplete="off">
                                        <span class="label">휴대폰 번호 (숫자만입력)</span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="write">
                                <div class="input_type1 add_info">
                                    <div id="birth" class="select_box_area"></div>
                                </div>
                            </div>
                        </div>
                        <!--생년월일-->
                    </div><!--2번째단-->

                    <div class="row">
                        <div class="col-md-12">
                            <div class="write">
                                <div class="input_type1 add_info">
                                    <div id="companyCheckupTypeId" class="select_box_area"></div>
                                </div>
                            </div>
                        </div>
                    </div><!-- 검진유형 선택 -->

                    <div class="row">
                        <div class="col-md-9">
                            <div class="write">
                                <!--주소-->

                                <div class="input_type1 postcode">
                                    <label for="f_v5_1">
                                        <input type="text" name="f_v5_1" id="f_v5_1" class="only_num address_code_1"
                                               placeholder="&nbsp;" maxlength="5" autocomplete="off" readonly>
                                        <span class="label">우편번호</span>
                                    </label>
                                    <div class="add_info">


                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="btn_area">
                                <div class="btn search_btn" onclick="address_API()">
                                    <span class="button_on_circle"></span>
                                    <a class="btn_inner point_color">
                                        <span class="btn_txt_area">
                                            검색 <i class="xi-search"></i>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div><!--3번째단-->

                    <div class="row">
                        <div class="col-md-6">
                            <div class="input_type1">
                                <label for="f_v5_2">
                                    <input type="text" name="f_v5_2" id="f_v5_2" class="address_code_2"
                                           placeholder="&nbsp;" autocomplete="off" readonly>
                                    <span class="label">주소</span>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input_type1">
                                <label for="f_v5_3">
                                    <input type="text" name="f_v5_3" id="f_v5_3" class="address_code_3"
                                           placeholder="&nbsp;" autocomplete="off">
                                    <span class="label">상세주소</span>
                                </label>
                            </div>
                        </div>
                    </div><!--4번째단-->

                    <div class="row">
                        <div class="email_type">
                            <div class="col-md-6">
                                <div class="write">
                                    <div class="input_type1">
                                        <label for="f_v6_1">
                                            <input type="text" name="f_v6_1" id="f_v6_1" class="email_input"
                                                   placeholder="&nbsp;" autocomplete="off">
                                            <span class="label">이메일 아이디</span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="email_at">@</div>

                            <div class="col-md-6">
                                <div class="select_box_area">
                                    <div class="select_box">
                                        <input type="hidden" name="f_v6_2" id="f_v6_2" value="">
                                        <select name="email_select" id="email_select" class="custom-select sources"
                                                for="f_v6_2" placeholder="선택 해주세요">
                                            <option value="" selected>선택 해주세요</option>
                                            <option value="gmail.com">gmail.com</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="nate.com">nate.com</option>
                                            <option value="kakao.com">kakao.com</option>
                                            <option value="daum.net">daum.net</option>
                                            <option value="direct">직접입력</option>
                                        </select>
                                        <input type="text" name="select_box_direct"
                                               class="select_box_direct email_input" autocomplete="off">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!--5번째단-->


                </div><!--edit_area-->

                <div class="line"></div>
                <div class="btn_area">
                    <div class="btn confirm_btn">
                        <span class="button_on_circle"></span>
                        <a href="#" class="btn_inner blue_gradient">
                            <span class="btn_txt_area">
                                가족 정보 반영하기
                            </span>
                        </a>
                    </div>
                </div><!--btn_area-->
            </div><!--step02-->


        </div><!--click_popup_wrap-->
    </div><!--click_popup-->


</div><!--find_popup-->
<div id="search_address"></div>

<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="../js/us/custom_select.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/us/address_api.js"></script>
<script src="../js/us/sub_common.js"></script>

<script type="text/javascript" src="<c:url value="/lib/devextreme/dx-quill.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/lib/devextreme/dx.all.js"/>"></script>
<script type="text/javascript" src="<c:url value="/lib/devextreme/localization/dx.messages.ko.js"/>"></script>
<script>

    DevExpress.localization.locale(navigator.language);

    $('#birth').dxDateBox({
        useMaskBehavior: true,
        displayFormat: 'yyyy.MM.dd',
        placeholder: '생년월일을 선택해 주세요.',
        width: '100%',
    });

    $('#companyCheckupTypeId').dxSelectBox({
        valueExpr: 'companyCheckupTypeId',
        displayExpr: 'companyCheckupTypeName',
        placeholder: '검진유형을 선택해 주세요.',
        width: '100%',
        dataSource: [
            <c:forEach items="${copayCompanyCheckupTypeList}" var="copayCompanyCheckup">
            {
                companyCheckupTypeId: <c:out value="${copayCompanyCheckup.companyCheckupTypeId}"/>,
                companyCheckupTypeName: '<c:out value="${copayCompanyCheckup.companyCheckupTypeName}"/> (<fmt:formatNumber value="${copayCompanyCheckup.hospitalPay}" pattern="#,###"/> 원)',
            },
            </c:forEach>
        ],
    });


    $("header").load("header.html");
    $("footer").load("footer.html");


    $(".add_family_btn").click(function () {
        $('#birth').dxDateBox('instance').option('value', null);

        popup_value_reset();
        popup_open();
    });

    $(".confirm_btn").click(function () {
        let employeeName = $('#f_v1');
        if (!employeeName.val()) { //이름
            employeeName.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                employeeName.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('이름을 입력해 주세요.', '', 'warning');
            return;
        }

        if ($('#f_v2_1:checked').length <= 0 && $('#f_v2_2:checked').length <= 0) {//성별
            $("#f_v2_1").parents("label").find(".cbx").addClass("chk_focus").focus();
            $("#f_v2_2").parents("label").find(".cbx").addClass("chk_focus").focus();

            setTimeout(function () {
                $("#f_v2_1").parents("label").find(".cbx").removeClass('chk_focus');
                $("#f_v2_2").parents("label").find(".cbx").removeClass('chk_focus');
            }, 1000);

            Swal.fire('성별을 선택해 주세요', '', 'warning');
            return;
        }

        let sex = 'M';
        if ($('#f_v2_2:checked').length) {
            sex = 'F';
        }

        let mobile = $('#f_v3');
        if (!mobile.val()) { //휴대폰번호
            mobile.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                mobile.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('휴대폰번호를 입력해 주세요.', '', 'warning');
            return;
        }

        let birth = $('#birth').dxDateBox('instance');
        if (!birth.option('value')) { //생년월일
            Swal.fire('생년월일을 선택해 주세요.', '', 'warning');
            return;
        }

        let companyCheckupTypeId = $('#companyCheckupTypeId').dxSelectBox('instance');
        if (!companyCheckupTypeId.option('text')) { //검진유형
            Swal.fire('검진유형을 선택해 주세요.', '', 'warning');
            return;
        }

        let zipcode = $('#f_v5_1');
        let address1 = $('#f_v5_2');
        let address2 = $('#f_v5_3');
        if ((!zipcode.val() || !address1.val()) && address2.val()) {
            address2.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                address2.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('우편번호를  검색해 주세요.', '', 'warning');
            return;
        }

        if ((zipcode.val() || address1.val()) && !address2.val()) {
            address2.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                address2.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('상세주소를 입력해 주세요.', '', 'warning');
            return;
        }

        let emailId = $('#f_v6_1');
        let emailDomain = $('#f_v6_2');
        if (!emailId.val() && emailDomain.val()) { //이메일 아이디
            emailId.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                emailId.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('이메일 아이디를 입력해 주세요.', '', 'warning');
            return;
        }

        if (emailId.val() && !emailDomain.val()) { //이메일 주소
            emailDomain.parents(".select_box").find(".custom-select-trigger").addClass("select_focus").parents(".custom-select-wrapper").find("select.custom-select").focus();
            setTimeout(function () {
                emailDomain.parents(".select_box").find(".custom-select-trigger").removeClass("select_focus");
            }, 1000);

            Swal.fire('이메일 주소를 입력해 주세요.', '', 'warning');
            return;
        }

        let email = emailId.val() && emailDomain.val() ? emailId.val() + '@' + emailDomain.val() : undefined;

        $.ajax({
            url: '<c:url value="/us/family"/>',
            method: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({
                employeeName: employeeName.val(),
                sex: sex,
                mobile: mobile.val(),
                birth: birth.option('value'),
                employeeCheckup: {
                    companyCheckupTypeId: companyCheckupTypeId.option('value'),
                },
                zipcode: zipcode.val() || undefined,
                address1: address1.val() || undefined,
                address2: address2.val() || undefined,
                email: email,
            }),
        }).then(function (response) {
            if (response.code === 'SUCCESS') {
                //반영 완료 화면
                Swal.fire('가족 정보가 정상적으로\n반영되었습니다', '', 'success').then(function () {
                    popup_close();
                    location.reload();
                });
            } else {
                Swal.fire(response.message, '', 'error');
            }
        }, function (jqXHR) {
            console.log(jqXHR);
            Swal.fire('Error!', '', 'error');
        });
    });

    function delchk() {
        Swal.fire('예약기간이 종료되어 검진신청이 불가합니다.', '', 'warning');
    }
</script>
</body>
</html>
