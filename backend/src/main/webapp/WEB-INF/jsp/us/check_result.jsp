<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Í±¥Í∞ï?¥Ïûê(?¨Ïö©?? Í≤∞Í≥ºÏ°∞Ìöå</title>
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
    <link href="../css/us/check_result.css" rel="stylesheet" type="text/css">


    <style>
        .main_section {
            min-height: 550px;
        }

        .info_btn {
            position: absolute;
            bottom: 12px;
            right: 12px;
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        .info_btn i {
            font-size: 25px;
        }

        .infoChange .infoList tbody td:nth-of-type(4) {
            text-align: left;
        }

        body .swal2-popup {
            width: 40em !important
        }

        body .swal2-title {
            font-size: 40px;
            margin-bottom: 0;
        }

        body #swal2-content {
            height: 600px !important;
            overflow: auto;
            font-size: 15px !important;
            line-height: 30px;
            text-align: left;
            font-weight: 500;
            margin-top: 30px;
        }

        .infoList tbody tr {
            display: none
        }

        .infoList tbody tr.on {
            display: table-row
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
            <div class="container">

                <div class="title_area">
                    <span class="point_line point_color"></span>
                    <div class="row">
                        <div class="title col-md-12">
                            <h2><span class="user_name"><c:out value="${sessionLoginName}"/></span>?òÏùò Í±¥Í∞ïÍ≤ÄÏß?Í≤∞Í≥º</h2>
                        </div>
                    </div>
                </div><!--title_area-->
                <div class="infoChange">
                    <table class="infoList">
                        <thead>

                        <th style="width:12%">?Ä?ÅÎÖÑ??/th>
                        <th style="width:12%">Í≤ÄÏßÑÏùº??/th>
                        <th style="width:12%">Í≤ÄÏßÑÍ∏∞Í¥Ä</th>
                        <th style="width:40%">Ï¢ÖÌï© ?åÍ≤¨</th>
                        <th style="width:12%">Í≤ÄÏßÑÍ≤∞Í≥?/th>
                        </thead>
                        <tbody>

                        <tr id="row_0">
                            <td id="year_0"></td>
                            <td id="checkupedAt_0"></td>
                            <td id="hospitalCenterName_0"></td>
                            <td id="review_0" style="white-space:pre-line; height: auto;"></td>
                            <td rowspan="3">
                                <div class="btn_area">
                                    <div class="btn check_result_btn">
                                        <span class="button_on_circle desplode-circle"></span>
                                        <a href="result_report.html" class="btn_inner point_color">
                                                                  <span class="btn_txt_area">
                                                                    <i class="xi-search"></i>
                                                                  </span>
                                        </a>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr id="row_1">
                            <td id="year_1"></td>
                            <td id="checkupedAt_1"></td>
                            <td id="hospitalCenterName_1"></td>
                            <td id="review_1" style="white-space:pre-line; height: auto;"></td>
                        </tr>

                        <tr id="row_2">
                            <td id="year_2"></td>
                            <td id="checkupedAt_2"></td>
                            <td id="hospitalCenterName_2"></td>
                            <td id="review_2" style="white-space:pre-line; height: auto;"></td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div class="btn_area">
                    <div class="btn check_btn">
                        <span class="button_on_circle"></span>
                        <a href="index.html" class="btn_inner grey">
                                                      <span class="btn_txt_area">
                                                        ?¥Ï†Ñ ?òÏù¥ÏßÄÎ°?                                                      </span>
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
<script>


    $("header").load("header.html");
    $("footer").load("footer.html");

    let info_btn_text0;
    let info_btn_text1;
    let info_btn_text2;

    function btnClick0() {
        if (info_btn_text0) {
            Swal.fire({
                title: 'Ï¢ÖÌï©?åÍ≤¨',
                html: info_btn_text0
                // showCancelButton: true,
                // confirmButtonText: 'Í∞ÄÏ°??àÏïΩ?òÍ∏∞',
                // cancelButtonText: '?´Í∏∞',
                // cancelButtonColor: '#5d5d5d',
            })
        } else {
            Swal.fire({
                title: 'Ï¢ÖÌï©?åÍ≤¨',
                html: '?±Î°ù??Ï¢ÖÌï©?åÍ≤¨???ÜÏäµ?àÎã§.',
                // showCancelButton: true,
                // confirmButtonText: 'Í∞ÄÏ°??àÏïΩ?òÍ∏∞',
                // cancelButtonText: '?´Í∏∞',
                // cancelButtonColor: '#5d5d5d',
            })
        }
    }

    function btnClick1() {
        if (info_btn_text1) {
            Swal.fire({
                title: 'Ï¢ÖÌï©?åÍ≤¨',
                html: info_btn_text1
            })
        } else {
            Swal.fire({
                title: 'Ï¢ÖÌï©?åÍ≤¨',
                html: '?±Î°ù??Ï¢ÖÌï©?åÍ≤¨???ÜÏäµ?àÎã§.',
            })
        }
    }

    function btnClick2() {
        if (info_btn_text2) {
            Swal.fire({
                title: 'Ï¢ÖÌï©?åÍ≤¨',
                html: info_btn_text2
            })
        } else {
            Swal.fire({
                title: 'Ï¢ÖÌï©?åÍ≤¨',
                html: '?±Î°ù??Ï¢ÖÌï©?åÍ≤¨???ÜÏäµ?àÎã§.',
            })
        }
    }

    $.ajax({
        type: 'GET',
        url: '<c:url value="/us/result"/>',
        dataType: 'JSON',
    }).then(function (response) {
        let checkupYear = response.data.map(function (v) {
            return v.checkupYear;
        });
        let max = Math.max(checkupYear);

        if (response.data.length > 0) {
            for (let i = 0; i < 3; i++) {
                let last = response.data.length - 1;
                let row = last - i;
                if (last - i > -1) {
                    $('#row_' + i).addClass('on');
                    if (response.data[row].confirmedAt != null) {
                        let confirmedAt = new Date(response.data[row].confirmedAt);
                        let confirmedAtMonth;
                        let confirmedAtDate;
                        if ((confirmedAt.getMonth() + 1).toString() < 10) {
                            confirmedAtMonth = '0' + (confirmedAt.getMonth() + 1);
                        } else {
                            confirmedAtMonth = confirmedAt.getMonth() + 1;
                        }
                        if ((confirmedAt.getDate()).toString() < 10) {
                            confirmedAtDate = '0' + (confirmedAt.getDate());
                        } else {
                            confirmedAtDate = confirmedAt.getDate();
                        }
                        $('#confirmedAt_' + i).text(confirmedAt.getFullYear() + '.' + confirmedAtMonth + '.' + confirmedAtDate);
                    }
                    ;
                    if (response.data[row].checkupedAt != null) {
                        let checkupedAt = new Date(response.data[row].checkupedAt);
                        let checkupedAtMonth;
                        let checkupedAtDate;
                        if ((checkupedAt.getMonth() + 1).toString() < 10) {
                            checkupedAtMonth = '0' + (checkupedAt.getMonth() + 1);
                        } else {
                            checkupedAtMonth = checkupedAt.getMonth() + 1;
                        }
                        if ((checkupedAt.getDate()).toString() < 10) {
                            checkupedAtDate = '0' + (checkupedAt.getDate());
                        } else {
                            checkupedAtDate = checkupedAt.getDate();
                        }
                        $('#checkupedAt_' + i).text(checkupedAt.getFullYear() + '.' + checkupedAtMonth + '.' + checkupedAtDate);
                    }
                    ;

                    if (response.data[row].checkupYear) {
                        let year = response.data[row].checkupYear;
                        $('#year_' + i).text(year);
                    }

                    if (response.data[row].birth != null) {
                        let birth = new Date(response.data[row].birth);
                        let birthMonth;
                        let birthDate;
                        if ((birth.getMonth() + 1).toString() < 10) {
                            birthMonth = '0' + (birth.getMonth() + 1);
                        } else {
                            birthMonth = birth.getMonth() + 1;
                        }
                        if ((birth.getDate() + 1).toString() < 10) {
                            birthDate = '0' + (birth.getDate());
                        } else {
                            birthDate = birth.getDate();
                        }
                        $('#birth_' + i).text(birth.getFullYear() + '' + birthMonth + '' + birthDate);
                    }

                    $('#hospitalCenterName_' + i).text(response.data[row].hospitalCenterName);

                    if (i === 0) {
                        info_btn_text0 = response.data[row].resultEmployees[0].review;
                        if (response.data[row].resultEmployees[0].review === null) {
                            $('#review_' + i).text('?±Î°ù??Ï¢ÖÌï©?åÍ≤¨???ÜÏäµ?àÎã§.');
                        } else {
                            let title = response.data[row].resultEmployees[0].review;
                            $('#review_' + i).html(title.substring(0, 150) + '...' + '<a onclick="btnClick0()" class="info_btn"><i class="xi-plus-circle" id="info"></i></a>');
                        }
                    } else if (i === 1) {
                        info_btn_text1 = response.data[row].resultEmployees[0].review;
                        if (response.data[row].resultEmployees[0].review === null) {
                            $('#review_' + i).text('?±Î°ù??Ï¢ÖÌï©?åÍ≤¨???ÜÏäµ?àÎã§.');
                        } else {
                            let title = response.data[row].resultEmployees[0].review;
                            $('#review_' + i).html(title.substring(0, 150) + '...' + '<a onclick="btnClick1()" class="info_btn"><i class="xi-plus-circle" id="info"></i></a>');
                        }
                    } else if (i === 2) {
                        info_btn_text2 = response.data[row].resultEmployees[0].review;
                        if (response.data[row].resultEmployees[0].review === null) {
                            $('#review_' + i).text('?±Î°ù??Ï¢ÖÌï©?åÍ≤¨???ÜÏäµ?àÎã§.');
                        } else {
                            let title = response.data[row].resultEmployees[0].review;
                            $('#review_' + i).html(title.substring(0, 150) + '...' + '<a onclick="btnClick2()" class="info_btn"><i class="xi-plus-circle" id="info"></i></a>');
                        }
                    }

                }
            }
        }
    });
</script>
</body>
</html>
