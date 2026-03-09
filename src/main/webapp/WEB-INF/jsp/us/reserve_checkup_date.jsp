<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건강살자(사용자) 검진 희망일 선택</title>
    <link href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet" type="text/css">
    <link href="../css/us/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/us/common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/header.css" rel="stylesheet" type="text/css">
    <link href="../css/us/footer.css" rel="stylesheet" type="text/css">
    <link href="../css/us/reserve_step_line.css" rel="stylesheet" type="text/css">
    <link href="../css/us/sub_common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/jquery_ui.css" rel="stylesheet" type="text/css">
    <link href="../css/us/reserve_checkup_date.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="<c:url value="/lib/devextreme/dx.material.ggsj.css"/>">
    <style>
        .dx-overlay-wrapper {
            z-index: 10000 !important;
        }

        .dx-placeholder {
            font-size: 13px;
            color: #9b9dad;
            letter-spacing: 1.2px;
            font-weight: 400;
        }
    </style>
    <style>
        .reserve_checkup_date_area {
            margin: 0;
        }

        .schedule_wrap {
            width: 100%;
            height: auto;
            display: inline-block;
        }

        #datepicker {
            width: 100%;
            margin: 0;
            float: none;
        }

        .ui-widget.ui-widget-content {
            height: auto;
        }

        .ui-datepicker .ui-state-default {
            height: auto;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            position: relative;
            min-width: 100px;
            min-height: 120px;
            border-radius: 0;
            padding: 10px;
            background: #fff;
            color: #454545;
            transition: all 0.3s ease;
            border: 1px solid #ddd;
        }

        .ui-datepicker td {
            padding: 5px;
        }

        .ui-datepicker-header {
            border: none;
        }

        .ui-datepicker .ui-state-default .date {
            position: absolute;
            left: 10px;
            top: 10px;
            display: inline-block;
            padding: 0;
            line-height: normal;
        }

        .ui-datepicker .ui-state-default > div {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
            color: #fff;
            width: 100%;
            text-align: center;
        }

        .ui-datepicker .ui-state-default > div.possible {
            color: #269cd5;
        }

        .ui-datepicker .ui-state-default > div.not_possible {
            color: #cc3333
        }

        .ui-datepicker .ui-state-default > div.ampm_btn > div {
            width: 50%;
            text-align: center;
            margin-right: 5px;
        }

        .ui-datepicker .ui-state-default > div.ampm_btn > div:last-of-type {
            margin-right: 0;
        }

        /*.ui-datepicker .ui-state-default > div.ampm_btn .am{background:#f89e34}*/
        /*.ui-datepicker .ui-state-default > div.ampm_btn .pm{background:#00469c}*/
        .ui-datepicker .ui-state-default > div.reserve_closed_item {
            margin-top: 5px !important; /*background:#5d5d5d;*/
        }

        /*.ui-datepicker-unselectable .ui-state-default{border:none!important;}*/
        /*.ui-datepicker-unselectable .ui-state-default .date{left:50%; top:50%; transform: translate(-50%, -50%);}*/
        .ui-datepicker .ui-state-default:hover {
            background: #fff;
            color: inherit;
        }

        .ui-datepicker-unselectable .ui-state-default:hover {
            box-shadow: none;
        }

        .ui-datepicker .ui-state-default.ui-state-active {
            border: 2px solid #27A3AC;
            box-shadow: 0 5px 12px rgba(0, 0, 0, 0.12);
        }


        .ui-state-default .btn {
            border-radius: 0;
            box-shadow: none;
        }

        .ui-state-default .btn .button_on_circle {
            padding: 0 !important;
            display: inline-block !important;
        }

        .ui-state-default .btn .btn_inner {
            font-size: 13px;
            letter-spacing: -.5px;
            padding: 0;
            width: 100%;
        }

        .ui-state-default .btn .btn_txt_area {
            padding: 0;
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

            <c:choose>
                <c:when test="${reserveType == 'date'}">
                    <div class="step_line four_step_line"> <!--step_line-->
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

                                    <div class="step step02 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 2</h3>
                                                </div>
                                                <div class="info">
                                                    검진 희망일 선택
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img04_active.png">
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


                                    <div class="step step05">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 4</h3>
                                                </div>
                                                <div class="info">
                                                    최종 예약 정보
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img05.png">
                                            </div>
                                        </div>
                                    </div><!--step04-->

                                </div><!--step_area-->
                            </div><!--row-->
                        </div><!--container-->
                    </div>
                    <!--step_line-->
                </c:when>
                <c:when test="${reserveType == 'item'}">
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
                                    <div class="step step02 active">
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
                                                <img src="../img/us/reserve/step_line/step_line_img02_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step02-->
                                    <div class="step step03 active">
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
                                                <img src="../img/us/reserve/step_line/step_line_img03_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step03-->
                                    <div class="step step04 active">
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
                                                <img src="../img/us/reserve/step_line/step_line_img04_active.png">
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
                    </div>
                    <!--step_line-->
                </c:when>
                <c:otherwise>
                    <div class="step_line four_step_line"> <!--step_line-->
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


                                    <div class="step step02 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 2</h3>
                                                </div>
                                                <div class="info">
                                                    병원 및 항목 선택
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img03_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step02-->


                                    <div class="step step03 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 3</h3>
                                                </div>
                                                <div class="info">
                                                    검진 희망일 선택
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img04_active.png">
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
                                                    최종 예약 정보
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img05.png">
                                            </div>
                                        </div>
                                    </div><!--step04-->

                                </div><!--step_area-->
                            </div><!--row-->
                        </div><!--container-->
                    </div>
                    <!--step_line-->
                </c:otherwise>
            </c:choose>

            <div class="container">

                <div class="reserve_checkup_date_area">

                    <div class="title_area">
                        <div class="title">
                            <span class="point_line point_color"></span>
                            <h2>검진 희망일 선택</h2>
                        </div>
                        <div class="title_add_txt">※ 달력의 예약일자 선택 버튼을 클릭하여 원하시는 검진 예약일과 시간을 설정해 주세요.</div>
                    </div>
                    <div class="calendar">

                        <div class="schedule_wrap">
                            <div id="datepicker"></div>
                            <br/>
                            <div class="select_date_box">
                                <div class="select_date">
                                    <span class="date_comment">예약 일자 및 예약 시간을 선택한 후 버튼을 클릭 해주세요.</span>
                                    <span class="form_coment">
                                        <span class="year"></span> <span class="month"></span> <span class="day"></span> <span
                                            class="ap"></span>
                                    </span>
                                    <span class="last_comment"></span>
                                </div>
                            </div>
                        </div><!--schedule_wrap-->

                    </div><!--calendar-->

                </div><!--reserve_checkup_date_area-->

                <input type="hidden" name="s_v1" id="s_v1" value="" class="reserve_info">
                <div class="confirm_btn">
                    <div class="btn_area">
                        <div class="btn date_btn">
                            <span class="button_on_circle"></span>
                            <a href="#none" class="btn_inner blue_gradient">
                                <span class="btn_txt_area">검진희망일 선택완료</span>
                            </a>
                        </div>
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
<script src="../js/us/sub_common.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>

<script type="text/javascript" src="<c:url value="/lib/devextreme/dx-quill.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/lib/devextreme/dx.all.js"/>"></script>
<script type="text/javascript" src="<c:url value="/lib/devextreme/localization/dx.messages.ko.js"/>"></script>
<script>

    DevExpress.localization.locale(navigator.language);

    Date.prototype.addDays = function (days) {
        this.setDate(this.getDate() + days);
        return this;
    };

    $("header").load("header.html");
    $("footer").load("footer.html");


    var disabledDays = [];

    $.ajax({
        url: '<c:url value="/us/day-off"/>?centerId=<c:out value="${centerId}"/>',
        dataType: 'json',
        contentType: 'application/json',
    }).then(function (response) {
        if (response && response.data && response.data.length > 0) {
            response.data.forEach(function (v) {
                let dayOff = {};
                if (v.amPm === 'AM') {
                    dayOff.am = true;
                } else if (v.amPm === 'PM') {
                    dayOff.pm = true;
                } else if (v.amPm === 'TX') {
                    dayOff.notes = v.notes;
                    dayOff.itemIds = v.itemIds;
                }

                disabledDays[v.dayOff] = $.extend({}, disabledDays[v.dayOff], dayOff);
            });
        }

        let checkupDateBegin = new Date(<c:out value="${reserve.checkupDateBegin.time}"/>);
        let minDate = new Date().addDays(<c:out value="${reserveType == 'date' ? 0 : reserve.preday}"/>);

        $('#datepicker').datepicker({
            showOtherMonths: true,
            showMonthAfterYear: true,
            changeMonth: true,
            yearSuffix: '년',
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            minDate: checkupDateBegin > minDate ? checkupDateBegin : minDate,
            maxDate: new Date(<c:out value="${reserve.checkupDateEnd.time}"/>),
            defaultDate: null,
            beforeShowDay: dayOffs,
            onChangeMonthYear: function () {
                setTimeout(renderCalendar, 1);
            },
        }).datepicker('setDate', null);

        renderCalendar();
        setOnHoverCalnedarButton();
    });


    $('.date_btn').on('click', function () {
        let selectedDate = $('#s_v1').data('selectedDate');

        if (!selectedDate) { //예약정보
            $('.res_btn .select_btn button').addClass('btn_focus');
            setTimeout(function () {
                $('.res_btn .select_btn button').removeClass('btn_focus');
            }, 1000);
            Swal.fire('예약일자 및 예약시간을\n선택해 주세요.', '', 'warning');
            return;
        }

        <c:choose>
        <c:when test="${reserve.reservationState == null}">
        $.ajax({
            url: '<c:url value="/us/reserve"/>',
            method: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({
                userId: <c:out value="${userId}"/>,
                desiredAt: selectedDate,
            }),
        }).then(function (response) {
            if (response.code === 'SUCCESS') {
                <c:choose>
                <c:when test="${reserveType == 'date'}">
                location.href = 'reserve_checkup.html?reserveType=date&userId=<c:out value="${userId}"/>';
                </c:when>
                <c:otherwise>
                location.href = 'ex_item_final_confirm.html?' + $.param({
                    reserveType: '<c:out value="${reserveType}"/>',
                    userId: <c:out value="${userId}"/>,
                    reservationId: response.data.reservationId,
                });
                </c:otherwise>
                </c:choose>
            } else {
                Swal.fire(response.message, '', 'error');
            }
        }, function (jqXHR) {
            console.log(jqXHR);
            Swal.fire('Error!', '', 'error');
        });
        </c:when>
        <c:otherwise>
        sessionStorage.setItem('desiredAt', String(selectedDate.getTime()));

        location.href = 'edit_information.html?' + $.param({
            userId: <c:out value="${reserve.userId}"/>,
            reservationId: <c:out value="${reserve.reservationId}"/>,
        });
        </c:otherwise>
        </c:choose>
    });


    // 특정일 금지
    function dayOffs(date) {
        if (date.getDay() === 0) {
            return [false, '', '종일불가'];
        } else if (date.getDay() === 6) {
            disabledDays[date.getTime()] = $.extend({}, disabledDays[date.getTime()], {pm: true});
        }

        let today = new Date();
        if (date.getFullYear() === today.getFullYear() && date.getMonth() === today.getMonth() && date.getDate() === today.getDate()) {
            if (today.getHours() >= 10) {
                disabledDays[date.getTime()] = $.extend({}, disabledDays[date.getTime()], {am: true});
            }
            if (today.getHours() >= 14) {
                disabledDays[date.getTime()] = $.extend({}, disabledDays[date.getTime()], {pm: true});
            }
        }

        for (let day in disabledDays) {
            if (Number(day) === date.getTime()) {
                if (disabledDays[day].am && disabledDays[day].pm) {
                    return [false, '', '종일불가'];
                }

                let dateCellClass = 'ui-datepicker-unselectable';
                let tooltip = '';

                if (disabledDays[day].am) {
                    dateCellClass += ' disable-am';
                    tooltip = '오전불가';
                } else if (disabledDays[day].pm) {
                    dateCellClass += ' disable-pm';
                    tooltip = '오후불가';
                }

                if (disabledDays[day].notes) {
                    dateCellClass += ' disable-notes';
                }

                return [true, dateCellClass, tooltip];
            }
        }

        return [true, 'ui-datepicker-unselectable', ''];
    }

    function renderCalendar() {
        $('.ui-datepicker .ui-datepicker-calendar tr td a').removeClass('ui-state-active');

        let desiredAt;
        <c:if test="${reserve.reservationState != null && reserve.desiredAt != null}">
        desiredAt = new Date(<c:out value="${reserve.desiredAt.time}"/>);
        $('#s_v1').val(desiredAt).data('selectedDate', desiredAt);

        $('.select_date .date_comment').hide();
        $('.select_date .year').empty().append(desiredAt.getFullYear() + '년');
        $('.select_date .month').empty().append((desiredAt.getMonth() + 1) + '월');
        $('.select_date .day').empty().append(desiredAt.getDate() + '일');
        $('.select_date .ap').empty().append(desiredAt.getHours() < 12 ? '오전' : '오후');
        $('.select_date .last_comment').empty().append('(으)로 선택 하셨습니다.');
        </c:if>

        const year = Number($(".ui-datepicker-year").text());
        const month = Number($(".ui-datepicker-month").val());

        $('.ui-datepicker .ui-datepicker-calendar tr td').each(function () {
            let enable = $(this).find('a');
            let disable = $(this).find('span');

            const date = Number(enable.text());
            const disableDate = Number(disable.text());

            const visibilityAm = $(this).hasClass('disable-am') ? 'hidden' : 'visible';
            const visibilityPm = $(this).hasClass('disable-pm') ? 'hidden' : 'visible';
            const visibilityNotes = $(this).hasClass('disable-notes') ? 'visible' : 'hidden';

            if (desiredAt && desiredAt.getFullYear() === year && desiredAt.getMonth() === month) {
                if (desiredAt.getDate() === date) {
                    enable.addClass('ui-state-active');
                } else if (desiredAt.getDate() === disableDate) {
                    disable.addClass('ui-state-active');
                }
            }

            // //예약가능 셋팅
            enable.empty().append('\n\
                <span class="date">' + date + '</span>\n\
                <div class="possible">예약가능</div>\n\
                <div class="ampm_btn btn_area">\n\
                    <div class="am btn" style="visibility: ' + visibilityAm + ';">\n\
                        <span class="button_on_circle"></span>\n\
                        <a href="#none" class="btn_inner orange">\n\
                            <span class="btn_txt_area">오전</span>\n\
                        </a>\n\
                    </div>\n\
                    <div class="pm btn" style="visibility: ' + visibilityPm + ';">\n\
                        <span class="button_on_circle"></span>\n\
                        <a href="#none" class="btn_inner blue">\n\
                            <span class="btn_txt_area">오후</span>\n\
                        </a>\n\
                    </div>\n\
                </div>\n\
                <div class="reserve_closed_item btn" style="visibility: ' + visibilityNotes + '">\n\
                    <span class="button_on_circle"></span>\n\
                    <a href="#none" class="btn_inner grey">\n\
                        <span class="btn_txt_area">예약 마감 항목 보기</span>\n\
                    </a>\n\
                </div>\n\
            ');

            $(this).find('.am.btn').on('click', function () {
                $('.ui-datepicker .ui-datepicker-calendar tr td a').removeClass('ui-state-active');
                enable.addClass('ui-state-active');

                $('.select_date .date_comment').hide();
                $('.select_date .year').empty().append(year + '년');
                $('.select_date .month').empty().append((month + 1) + '월');
                $('.select_date .day').empty().append(date + '일');
                $('.select_date .ap').empty().append('오전');
                $('.select_date .last_comment').empty().append('(으)로 선택 하셨습니다.');

                const selectedDate = new Date(year, month, date, 10);
                $('#s_v1').val(selectedDate).data('selectedDate', selectedDate);
            });

            $(this).find('.pm.btn').on('click', function () {
                $('.ui-datepicker .ui-datepicker-calendar tr td a').removeClass('ui-state-active');
                enable.addClass('ui-state-active');

                $('.select_date .date_comment').hide();
                $('.select_date .year').empty().append(year + '년');
                $('.select_date .month').empty().append((month + 1) + '월');
                $('.select_date .day').empty().append(date + '일');
                $('.select_date .ap').empty().append('오후');
                $('.select_date .last_comment').empty().append('(으)로 선택 하셨습니다.');

                const selectedDate = new Date(year, month, date, 14);
                $('#s_v1').val(selectedDate).data('selectedDate', selectedDate);
            });

            $(this).find('.reserve_closed_item.btn').on('click', function () {
                const selectedDate = new Date(year, month, date);
                Swal.fire(disabledDays[selectedDate.getTime()].notes, '', 'info');
            });

            //예약불가 셋팅
            disable.empty().append('<span class="date">' + disableDate + '</span>');
        });
    }

    function setOnHoverCalnedarButton() {
        $('.ui-state-default .btn').on('mouseenter', function (e) {
            const parentOffset = $(this).offset();
            const relX = e.pageX - parentOffset.left;
            const relY = e.pageY - parentOffset.top;

            $(this).find('.button_on_circle').removeClass('desplode-circle').addClass('explode-circle').css({
                left: relX,
                top: relY
            });
        }).on('mouseleave', function (e) {
            const parentOffset = $(this).offset();
            const relX = e.pageX - parentOffset.left;
            const relY = e.pageY - parentOffset.top;

            $(this).find('.button_on_circle').removeClass("explode-circle").addClass("desplode-circle").css({
                left: relX,
                top: relY
            });
        });
    }
</script>
</body>
</html>
