<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Í±¥Í∞ï?¥Ïûê(?¨Ïö©?? Î≥ëÏõê Î∞???™© ?†ÌÉù</title>
    <link href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet" type="text/css">
    <link href="../css/us/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/us/common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/header.css" rel="stylesheet" type="text/css">
    <link href="../css/us/footer.css" rel="stylesheet" type="text/css">
    <link href="../css/us/reserve_step_line.css" rel="stylesheet" type="text/css">
    <link href="../css/us/sub_common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/reserve_checkup.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="<c:url value="/lib/devextreme/dx.material.sitebuilder.css"/>">
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

        .hospital_select_area.empty {
            display: none !important;
        }

        .empty_info.active {
            display: block !important;
        }

        .empty_info {
            border-top: 2px solid #25939a;
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
                                                    Í≤ÄÏß??àÏïΩ
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
                                                    Í≤ÄÏß??¨Îßù???†ÌÉù
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img04_active.png">
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
                                                    Î≥ëÏõê Î∞???™© ?†ÌÉù
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img03_active.png">
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
                                                    ÏµúÏ¢Ö ?àÏïΩ ?ïÎ≥¥
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
                                                    Í≤ÄÏß??àÏïΩ
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
                                                    Í≤ÄÏß???™© ?†ÌÉù
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
                                                    Î≥ëÏõê Î∞???™© ?†ÌÉù
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img03_active.png">
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
                                                    Í≤ÄÏß??¨Îßù???†ÌÉù
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
                                                    ÏµúÏ¢Ö ?àÏïΩ ?ïÎ≥¥
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
                                                    Í≤ÄÏß??àÏïΩ
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
                                                    Î≥ëÏõê Î∞???™© ?†ÌÉù
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img03_active.png">
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
                                                    Í≤ÄÏß??¨Îßù???†ÌÉù
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img04.png">
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
                                                    ÏµúÏ¢Ö ?àÏïΩ ?ïÎ≥¥
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
                <div class="user_info_area">

                </div><!--user_info_area-->

                <div class="hospital_recommend_area">
                    <div class="setting_area">
                        <c:if test="${not empty itemNames}">
                            <div class="title_area">
                                <span class="point_line point_color"></span>
                                <div class="title">
                                    <h2>
                                        ?†ÌÉù?òÏã†
                                        <span class="item_name point_color"><c:out value="${itemNames}"/></span>
                                        ??™©??Í≤Ä?¨Ìïò??Î≥ëÏõê Ï∂îÏ≤ú?úÎ¶Ω?àÎã§.
                                    </h2>
                                </div>
                            </div>
                        </c:if>

                        <div class="option_setting">
                            <div class="special_checkup">
                                <ul>
                                    <li>
                                        <div class="tit">?πÏàòÍ≤ÄÏß?/div>
                                        <div class="check write">
                                            <div class="chk_area">
                                                <div class="chk_boxArea">

                                                    <label class="item" for="s_v1" style="cursor: default;">
                                                        <input type="checkbox" name="s_v1" id="s_v1" class="hidden"
                                                               value="?πÏàòÍ≤ÄÏßÑÍ∏∞Í¥Ä" disabled
                                                               <c:if test="${reserve.specialCheckup == 1}">checked</c:if>>
                                                        <label class="cbx" for="s_v1" style="cursor: default;">
                                                            <svg height="20px" viewBox="0 -8 16 30" width="20px">
                                                                <polyline points="1 7.6 5 11 13 1"></polyline>
                                                            </svg>
                                                        </label>
                                                        <label class="cbx-lbl" for="s_v1" style="cursor: default;">?πÏàòÍ≤ÄÏßÑÍ∏∞Í¥Ä</label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${reserve.specialCheckup == 1}">
                                            <div class="user_special_checkup active">??Í∑Ä?òÎäî ?πÏàòÍ≤ÄÏß??Ä?ÅÏûê?ÖÎãà??</div>
                                        </c:if>
                                    </li>


                                    <li>
                                        <div class="tit">ÏßÄ?????/div>
                                        <div class="select_box_area">
                                            <div id="sido"></div>
                                        </div>
                                        <div class="select_box_area">
                                            <div id="sigungu"></div>
                                        </div>
                                    </li>


                                    <li>
                                        <div class="tit">Î≥ëÏõêÎ™ÖÍ???/div>
                                        <div class="search_box_area write">
                                            <div class="input_type1">
                                                <label for="centerName">
                                                    <input type="text" name="search" id="centerName"
                                                           placeholder="&nbsp;"
                                                           required="" autocomplete="off">
                                                    <span class="label">Î≥ëÏõê??Í≤Ä?âÌï¥ Ï£ºÏÑ∏??</span>
                                                </label>
                                            </div>
                                        </div><!--search_box-->
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="btn_area">
                            <div class="btn search_btn">
                                <span class="button_on_circle"></span>
                                <a href="#none" class="btn_inner blue_gradient">
                                    <span class="btn_txt_area">
                                        Í≤Ä??<i class="xi-search"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div><!--setting_area-->

                </div><!--hospital_recommend_area-->
                <div class="hospital_select_area">


                </div>
                <div class="empty_info" style="padding:35px 0; margin-top:45px;">
                    <p>
                        <i class="fa fa-exclamation-triangle point_color"></i>
                    </p>
                    <p>
                        ?†ÌÉù?òÏã† Í≤ÄÏß???™©??Í≤Ä??Í∞Ä?•Ìïú Î≥ëÏõê???ÜÏäµ?àÎã§.<br><br>
                        Í≤ÄÏß???™©???§Ïãú ?úÎ≤à ?†ÌÉù?òÍ±∞??<br>
                        ?àÏïΩ?ºÏ†ï/Î≥ëÏõê?∞ÏÑ† ?†ÌÉù Í∞Ä?•Ìïú ?îÎ©¥?êÏÑú<br>
                        ?§Ïãú ?úÎ≤à ?†ÌÉù Î∂Ä?ÅÎìúÎ¶ΩÎãà??
                    </p>
                </div>
            </div><!--container-->


        </div><!--main_cont-->
    </section><!--main_section-->

</main>


<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="../js/us/custom_select.js"></script>
<script src="../js/us/sub_common.js"></script>

<script type="text/javascript" src="<c:url value="/lib/devextreme/dx-quill.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/lib/devextreme/dx.all.js"/>"></script>
<script type="text/javascript" src="<c:url value="/lib/devextreme/localization/dx.messages.ko.js"/>"></script>
<script>

    DevExpress.localization.locale(navigator.language);

    $.ajax({
        url: '<c:url value="/common/center/address"/>',
    }).then(function (response) {
        let dataSourceSido = [{value: '', sido: '?ÑÏ≤¥'}].concat(response.data.map(function (v) {
            v.value = v.sido;
            return v;
        }));

        let sigungu = $('#sigungu').dxSelectBox({
            valueExpr: 'value',
            displayExpr: 'sigungu',
            value: '',
            dataSource: [{value: '', sigungu: '?ÑÏ≤¥'}],
        }).dxSelectBox('instance');

        $('#sido').dxSelectBox({
            valueExpr: 'value',
            displayExpr: 'sido',
            value: '',
            dataSource: dataSourceSido,
            onValueChanged: function (e) {
                let find = response.data.find(function (v) {
                    return v.sido === e.value;
                });

                let dataSourceSigungu = [{value: '', sigungu: '?ÑÏ≤¥'}];
                if (find) {
                    dataSourceSigungu = dataSourceSigungu.concat(response.data.find(function (v) {
                        return v.sido === e.value;
                    }).sigungu.map(function (v) {
                        return {value: v, sigungu: v};
                    }));
                }

                sigungu.option({
                    value: '',
                    dataSource: dataSourceSigungu,
                });
            }
        });

        $('.search_btn').trigger('click');
    });


    $("header").load("header.html");
    $("footer").load("footer.html");
    $(".user_info_area").load("user_info_area.html?userId=<c:out value="${userId}"/>");

    let specialCheckup;
    let sido;
    let sigungu;

    var orgTimeout = setTimeout;


    $('.search_btn').on('click', function () {

        specialCheckup = $('#s_v1:checked').length;


        if ($('.user_special_checkup').hasClass('active')) {
            if (specialCheckup <= 0) {//?πÏàòÍ≤ÄÏßÑÍ∏∞Í¥Ä
                $('#s_v1').parents('label').find('.cbx').addClass('chk_focus').focus();
                setTimeout(function () {
                    $('#s_v1').parents('label').find('.cbx').removeClass('chk_focus');
                }, 1000);

                Swal.fire('Í∑Ä?òÎäî ?πÏàòÍ≤ÄÏß??Ä?ÅÏûê?ÖÎãà??\n?πÏàòÍ≤ÄÏßÑÍ∏∞Í¥Ä??Ï≤¥ÌÅ¨ ?¥Ï£º?∏Ïöî.', '', 'warning');
                return;
            }
        }


        sido = $('#sido').dxSelectBox('instance').option('value');
        sigungu = $('#sigungu').dxSelectBox('instance').option('value');

        // if (!sido) { //ÏßÄ??        //     Swal.fire('ÏßÄ??ùÑ ?†ÌÉù??Ï£ºÏÑ∏??', '', 'warning');
        //     return;
        // }
        //
        // if (!sigungu) { //?∏Î?ÏßÄ??        //     Swal.fire('?∏Î?ÏßÄ??ùÑ ?†ÌÉù??Ï£ºÏÑ∏??', '', 'warning');
        //     return;
        // }

        $.ajax({
            url: '<c:url value="/us/reserve-center"/>',
            contentType: 'application/json',
            dataType: 'json',
            data: {
                userId: <c:out value="${userId}"/>,
                itemIds: '<c:out value="${itemIds}"/>',
                specialCheckup: specialCheckup ? 1 : 0,
                sido: sido,
                sigungu: sigungu,
                centerName: $('#centerName').val(),
                <c:if test="${reserveType == 'date'}">
                desiredAt: '<fmt:formatDate value="${reserve.desiredAt}" pattern="yyyy-MM-dd HH:mm:ss"/>',
                desiredAmpm: '<c:out value="${reserve.desiredAt.hours < 12 ? 'AM' : 'PM'}"/>',
                </c:if>
            }
        }).then(function (response) {
            /**
             * @param response.data[].centerAdvUrl1
             * @param response.data[].hospitalCenterName
             * @param response.data[].hsubcontracts[]
             */
            if (response.data.length > 0) {
                setCenterList(response.data);
                $('.hospital_select_area').slideDown(400);
                $(".hospital_select_area").removeClass("empty");
                $(".empty_info").removeClass("active");

            } else {
                // Swal.fire('?†ÌÉù?òÏã† ÏßÄ??óê???êÌïò?úÎäî Í≤ÄÏßÑÌï≠Î™©ÏùÑ\nÍ≤Ä??Í∞Ä?•Ìïú Î≥ëÏõê???ÜÏäµ?àÎã§.\n\nÍ≤ÄÏßÑÌï≠Î™??àÏïΩ?ºÏ†ï/Î≥ëÏõê?∞ÏÑ†\n?†ÌÉù Í∞Ä?•Ìïú ?îÎ©¥?êÏÑú ?§Ïãú ?úÎ≤à ?†ÌÉù\nÎ∂Ä?ÅÎìúÎ¶ΩÎãà??', '', 'warning');
                $('.hospital_select_area').empty();
                $(".empty_info").addClass("active");
                $(".hospital_select_area").addClass("empty");
                $(".empty_info").addClass("active");


            }
        });
    });

    $('.hospital_select_area').on('click', '.reserve_btn', function () {
        let centerId = $(this).data('centerId');
        let checkupContractSubTypeId = $(this).parents('.list').find('.dx-select-box').dxSelectBox('instance').option('value');

        if (!checkupContractSubTypeId) {
            Swal.fire('Í≤ÄÏß??†Ìòï???†ÌÉù??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        //?µÍ≥º
        location.href = 'ex_item_selection_package_option.html?' + $.param({
            reserveType: '<c:out value="${reserveType}"/>',
            userId: <c:out value="${userId}"/>,
            itemIds: '<c:out value="${itemIds}"/>',
            centerId: centerId,
            checkupContractSubTypeId: checkupContractSubTypeId,
            specialCheckup: specialCheckup ? 1 : 0,
            sido: sido,
            sigungu: sigungu,
            centerName: $('#centerName').val(),
        });
    });

    $('.user_info_area').on('click', '.checkup_comparison', function () {
        location.href = 'ex_item_selection_package_option.html?' + $.param({
            reserveType: '<c:out value="${reserveType}"/>',
            userId: <c:out value="${userId}"/>,
            itemIds: '<c:out value="${itemIds}"/>',
            specialCheckup: specialCheckup ? 1 : 0,
            sido: sido,
            sigungu: sigungu,
            centerName: $('#centerName').val(),
        });
    });


    function setCenterList(centers) {
        let hospitalSelectArea = $('.hospital_select_area');
        hospitalSelectArea.empty();

        let row;
        centers.forEach(function (v, i) {
            if (i % 3 === 0) {
                row = $('<div class="row"></div>');
                hospitalSelectArea.append(row);

            }


            let div = $('\n\
                <div class="col-md-4 list">\n\
                    <div class="img_area">\n\
                        <a href="hospital_detail_list.html?centerId=' + v.centerId + '">\n\
                            <img src="' + v.centerAdvUrl1 + '">\n\
                        </a>\n\
                    </div>\n\
                    <div class="name">\n\
                        <a href="hospital_detail_list.html?centerId=' + v.centerId + '">\n\
                            ' + v.hospitalCenterName + '\n\
                        </a>\n\
                    </div>\n\
                    \n\
                    <div class="select_box_area">\n\
                        <div id="hsubcontracts_' + i + '" class="dx-select-box"></div>\n\
                    </div>\n\
                    <div class="reserve_btn" data-center-id="' + v.centerId + '">\n\
                        <a>Í≤ÄÏßÑÏòà??/a>\n\
                    </div>\n\
                </div>\n'
            );

            div.find('#hsubcontracts_' + i).dxSelectBox({
                dataSource: v.hsubcontracts,
                valueExpr: 'checkupContractSubTypeId',
                displayExpr: 'subTypeName',
            });

            row.append(div);
        });

        // var hospital_list_length = $(".hospital_select_area .list").length;
        // if(hospital_list_length === "0"){
        //       alert('ss')
        // }
        //
        // if(hospital_list_length >"0"){
        //    alert('dd')
        // }

    }


</script>
</body>
</html>
