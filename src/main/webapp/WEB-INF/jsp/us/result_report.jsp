<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건강살자(사용자) 검진결과 보고서</title>
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

</head>
<body>
<header></header>
<div class="header_blank"></div>
<!--header-->

<style>

    table {
        table-layout: fixed;
    }

    .section_wrap > div {
        margin-bottom: 35px;
        font-weight: bold;
    }

    .section_wrap > div:last-of-type {
        margin-bottom: 0;
    }

    .section_wrap .tag_name {
        background: #f3f3f3;
    }

    .section_wrap .title {
        text-align: center;
        font-size: 40px;
        margin-bottom: 50px;
    }

    .section_wrap .user_info_area {
        border-top: 5px solid #a0a0a0;
        border-bottom: 5px solid #a0a0a0;
    }

    .section_wrap .user_info_area .tr:after {
        content: "";
        clear: both;
        display: block;
        height: 0;
        visibility: hidden;
    }

    .section_wrap .user_info_area .tr > div {
        float: left;
        padding: 10px 0;
        width: calc(100% / 4);
        text-align: center;
        font-weight: bold;
    }


    .tr > [class*="info_title"], .result > .sub_title {
        display: flex;
        align-items: center;
        padding: 0 40px;
        margin-bottom: 20px;
        font-size: 20px;
    }

    .section_wrap .result .sub_title i {
        margin-right: 10px;
        color: #33a6ac;
    }

    .section_wrap .result .result_info_area {
        border-top: 5px solid #33a6ac;
        border-bottom: 5px solid #33a6ac;
        padding-bottom: 60px;
    }

    .section_wrap .result .result_info_area .tr {
        border-bottom: 2px solid #dfe4e8;
    }

    .section_wrap .result .result_info_area .tr > div {
        padding: 0 50px;
    }

    .section_wrap .result .result_info_area .tr .info_title {
        padding: 15px 50px;
        font-size: 18px;
    }

    .section_wrap .result .result_info_area .tr .info {
        padding: 20px 70px 60px 70px;
        font-size: 15px;
    }

    .info_title_dot {
        display: inline-block;
        width: 10px;
        height: 10px;
        border-radius: 100%;
        background: #33a6ac;
        margin-right: 10px;
        position: relative;
        top: 1px;
    }

    .info_title_dot.square {
        border-radius: 0;
        width: 20px;
        height: 20px;
    }

    .result_info_area_type2 {
        text-align: center;
    }

    .result_info_area_type2 .tr {
        margin-bottom: 30px;
    }

    .result_info_area_type2 .tr:last-of-type {
        margin-bottom: 0;
    }

    .item_info_title {
        font-size: 28px;
    }

    .item_info_area {
        border-bottom: 2px solid #a0a0a0;
    }

    .item_info_area > div:after {
        content: "";
        clear: both;
        display: block;
        height: 0;
        visibility: hidden;
    }

    .item_info_area > div > div {
        float: left;
        padding: 15px 0;
        width: 20%;
        height: 56px;
    }

    .item_info_area > div > div:nth-of-type(odd) {
        width: 30%;
    }

    .item_info_area > div > div:nth-of-type(even) {
        background: #f3f3f3;
    }

    .item_title > div {
        background: #33a6ac !important;
    }

</style>


<style>
    .result_info_area .list {
        margin-bottom: 35px;
        /*border-bottom: 2px solid #a0a0a0;*/
    }

    .result_info_area .list:last-of-type {
        margin-bottom: 0;
    }

    .result_info_area .result_info_title {
        font-size: 20px;
        margin-bottom: 25px;
    }


    .result_info_area table {
        width: 100%;
    }

    .result_info_area th {
        padding: 15px 0;
        background: #33a6ac;
        font-size: 18px;
    }

    .result_info_area tr td {
        padding: 15px 30px;
        border-bottom: 1px solid #a0a0a0;
        height: 52.5px;
        font-size: 15px;
        word-break: break-all;
    }

    /*.result_info_area tr:last-of-type td {*/
    /*    border-bottom: 0;*/
    /*}*/

    .result_info_area .list_type1 tr td:nth-of-type(even) {
        background: #f3f3f3;
    }

    .result_info_area .list_type2 tr td:last-of-type {
        text-align: left;
    }

    .result_info_area .list_type2 tr td:first-of-type {
        background: #f3f3f3;
    }

    .result_info_area .list_type2 tr:first-of-type td:first-of-type {
        background: none;
        font-size: 18px;
    }

    .result_info_area .list_type2 tr:first-of-type td:nth-of-type(2) {
        background: #f3f3f3;
    }

    .result_info_area .list_type2 .left_area {
        border-bottom: 0;
    }

</style>

<main>
    <section class="main_section">
        <div class="main_cont">
            <div class="container">
                <div class="section_wrap">
                    <h1 class="title">건강검진 결과 보고서</h1>

                    <div class="user_info_area">
                        <div class="tr">
                            <div class="tag_name">검진자명</div>
                            <div><c:out value="${sessionLoginName}"/></div>
                            <div class="tag_name">생년월일</div>
                            <div id="birth"></div>
                        </div>
                        <div class="tr">
                            <div class="tag_name">최종 검진병원</div>
                            <div id="hospitalCenterName_0"></div>
                            <div class="tag_name">검진일자</div>
                            <div class="checkupedAt_0"></div>
                        </div>
                        <div class="tr">
                            <div class="tag_name">종전 검진병원</div>
                            <div id="hospitalCenterName_1"></div>
                            <div class="tag_name">검진일자</div>
                            <div class="checkupedAt_1"></div>
                        </div>
                        <div class="tr">
                            <div class="tag_name">종전 검진병원</div>
                            <div id="hospitalCenterName_2"></div>
                            <div class="tag_name">검진일자</div>
                            <div class="checkupedAt_2"></div>
                        </div>
                    </div><!--user_info-->

                    <div class="result">
                        <h2 class="sub_title"><i class="xi-play-circle"></i>종합소견</h2>
                        <div class="result_info_area">
                            <div class="tr">
                                <div class="info_title tag_name">
                                </div>
                                <div class="info" id="review" style="white-space:pre-line;">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="result_info_area">

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>신체계측
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>신장</td>
                                    <td id="B010011_0"></td>
                                    <td id="B010011_1"></td>
                                    <td id="B010011_2"></td>
                                    <td>cm</td>
                                </tr>
                                <tr>
                                    <td>체중</td>
                                    <td id="B010012_0"></td>
                                    <td id="B010012_1"></td>
                                    <td id="B010012_2"></td>
                                    <td>kg</td>
                                </tr>
                                <tr>
                                    <td>비만도(bmi)</td>
                                    <td id="B010013_0"></td>
                                    <td id="B010013_1"></td>
                                    <td id="B010013_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>허리둘레</td>
                                    <td id="B010014_0"></td>
                                    <td id="B010014_1"></td>
                                    <td id="B010014_2"></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>혈압
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>수축기혈압</td>
                                    <td id="B010021_0"></td>
                                    <td id="B010021_1"></td>
                                    <td id="B010021_2"></td>
                                    <td>mmHg</td>
                                </tr>
                                <tr>
                                    <td>이완기혈압</td>
                                    <td id="B010022_0"></td>
                                    <td id="B010022_1"></td>
                                    <td id="B010022_2"></td>
                                    <td>mmHg</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>청력검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <!--                                불러올때 좌우 같이 불러와주기-->
                                <tr>
                                    <td>500Hz(좌/우)</td>
                                    <td id="B030021_0"></td>
                                    <td id="B030021_1"></td>
                                    <td id="B030021_2"></td>
                                    <!--                                    <td id="B030022_0">172</td>-->
                                    <!--                                    <td id="B030022_1">172</td>-->
                                    <!--                                    <td id="B030022_2">172</td>-->
                                    <td>dB</td>
                                </tr>
                                <tr>
                                    <td>1000Hz(좌/우)</td>
                                    <td id="B030023_0"></td>
                                    <td id="B030023_1"></td>
                                    <td id="B030023_2"></td>
                                    <!--                                    <td id="B030024_0">172</td>-->
                                    <!--                                    <td id="B030024_1">172</td>-->
                                    <!--                                    <td id="B030024_2">172</td>-->
                                    <td>dB</td>
                                </tr>
                                <tr>
                                    <td>2000Hz(좌/우)</td>
                                    <td id="B030025_0"></td>
                                    <td id="B030025_1"></td>
                                    <td id="B030025_2"></td>
                                    <!--                                    <td id="B030026_0">172</td>-->
                                    <!--                                    <td id="B030026_1">172</td>-->
                                    <!--                                    <td id="B030026_2">172</td>-->
                                    <td>dB</td>
                                </tr>
                                <tr>
                                    <td>4000Hz(좌/우)</td>
                                    <td id="B030027_0"></td>
                                    <td id="B030027_1"></td>
                                    <td id="B030027_2"></td>
                                    <!--                                    <td id="B030028_0">172</td>-->
                                    <!--                                    <td id="B030028_1">172</td>-->
                                    <!--                                    <td id="B030028_2">172</td>-->
                                    <td>dB</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>안과검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>시력(좌/우)</td>
                                    <td id="B040021_0"></td>
                                    <td id="B040021_1"></td>
                                    <td id="B040021_2"></td>
                                    <!--                                    <td id="B040022_0">172</td>-->
                                    <!--                                    <td id="B040022_1">172</td>-->
                                    <!--                                    <td id="B040022_2">172</td>-->
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>교정시력(좌/우)</td>
                                    <td id="B040023_0"></td>
                                    <td id="B040023_1"></td>
                                    <td id="B040023_2"></td>
                                    <!--                                    <td id="B040024_0">172</td>-->
                                    <!--                                    <td id="B040024_1">172</td>-->
                                    <!--                                    <td id="B040024_2">172</td>-->
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>안압(좌/우)</td>
                                    <td id="B040031_0"></td>
                                    <td id="B040031_1"></td>
                                    <td id="B040031_2"></td>
                                    <!--                                    <td id="B040032_0">172</td>-->
                                    <!--                                    <td id="B040032_1">172</td>-->
                                    <!--                                    <td id="B040032_2">172</td>-->
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>안저(좌/우)</td>
                                    <td id="B040041_0"></td>
                                    <td id="B040041_1"></td>
                                    <td id="B040041_2"></td>
                                    <!--                                    <td id="B040042_0">172</td>-->
                                    <!--                                    <td id="B040042_1">172</td>-->
                                    <!--                                    <td id="B040042_2">172</td>-->
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>간기능검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>총단백(Total protein)</td>
                                    <td id="C01001_0"></td>
                                    <td id="C01001_1"></td>
                                    <td id="C01001_2"></td>
                                    <td>g/dl</td>
                                </tr>
                                <tr>
                                    <td>알부민(Albumin)</td>
                                    <td id="C01002_0"></td>
                                    <td id="C01002_1"></td>
                                    <td id="C01002_2"></td>
                                    <td>g/dl</td>
                                </tr>
                                <tr>
                                    <td>글로블린(Globulin)</td>
                                    <td id="C01003_0"></td>
                                    <td id="C01003_1"></td>
                                    <td id="C01003_2"></td>
                                    <td>g/dl</td>
                                </tr>
                                <tr>
                                    <td>A/G비율(albumin:globilin ratio)</td>
                                    <td id="C01004_0"></td>
                                    <td id="C01004_1"></td>
                                    <td id="C01004_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>AST(SGOT)</td>
                                    <td id="C01005_0"></td>
                                    <td id="C01005_1"></td>
                                    <td id="C01005_2"></td>
                                    <td>IU/L</td>
                                </tr>
                                <tr>
                                    <td>ALT(SGPT)</td>
                                    <td id="C01006_0"></td>
                                    <td id="C01006_1"></td>
                                    <td id="C01006_2"></td>
                                    <td>IU/L</td>
                                </tr>
                                <tr>
                                    <td>감마지티피(γ-GTP)</td>
                                    <td id="C01007_0"></td>
                                    <td id="C01007_1"></td>
                                    <td id="C01007_2"></td>
                                    <td>IU/L</td>
                                </tr>
                                <tr>
                                    <td>총빌리루빈(Total bilirubin)</td>
                                    <td id="C01008_0"></td>
                                    <td id="C01008_1"></td>
                                    <td id="C01008_2"></td>
                                    <td>mg/dL</td>
                                </tr>
                                <tr>
                                    <td>직접빌리루빈(Direct bilirubin)</td>
                                    <td id="C01009_0"></td>
                                    <td id="C01009_1"></td>
                                    <td id="C01009_2"></td>
                                    <td>mg/dL</td>
                                </tr>
                                <tr>
                                    <td>알칼리포스파타제(ALP)</td>
                                    <td id="C01011_0"></td>
                                    <td id="C01011_1"></td>
                                    <td id="C01011_2"></td>
                                    <td>IU/L</td>
                                </tr>
                                <tr>
                                    <td>유산탈수소효소(LDH)</td>
                                    <td id="C01012_0"></td>
                                    <td id="C01012_1"></td>
                                    <td id="C01012_2"></td>
                                    <td>IU/L</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>간염검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>A형 항체 형성여부(HAV IgG)</td>
                                    <td id="C02001_0"></td>
                                    <td id="C02001_1"></td>
                                    <td id="C02001_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>A형간염표면항체(HAV IgM)</td>
                                    <td id="C02002_0"></td>
                                    <td id="C02002_1"></td>
                                    <td id="C02002_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>B형간염항원(HBsAg)</td>
                                    <td id="C02005_0"></td>
                                    <td id="C02005_1"></td>
                                    <td id="C02005_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>B형간염항체(HBsAb)</td>
                                    <td id="C02006_0"></td>
                                    <td id="C02006_1"></td>
                                    <td id="C02006_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>B형간염활동성및전염성여부(HBeAg)</td>
                                    <td id="C02007_0"></td>
                                    <td id="C02007_1"></td>
                                    <td id="C02007_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>B형간염활동성및전염성여부(HBeAb)</td>
                                    <td id="C02008_0"></td>
                                    <td id="C02008_1"></td>
                                    <td id="C02008_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>C형간염항체(HCVAb)</td>
                                    <td id="C02009_0"></td>
                                    <td id="C02009_1"></td>
                                    <td id="C02009_2"></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>신장기능검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>요소질소(BUN)</td>
                                    <td id="C03001_0"></td>
                                    <td id="C03001_1"></td>
                                    <td id="C03001_2"></td>
                                    <td>mg/dl</td>
                                </tr>
                                <tr>
                                    <td>크레아티닌(Creatinin)</td>
                                    <td id="C03002_0"></td>
                                    <td id="C03002_1"></td>
                                    <td id="C03002_2"></td>
                                    <td>mg/dl</td>
                                </tr>
                                <tr>
                                    <td>B/C비율</td>
                                    <td id="C03003_0"></td>
                                    <td id="C03003_1"></td>
                                    <td id="C03003_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>신사구체여과율(GFR)</td>
                                    <td id="C03004_0"></td>
                                    <td id="C03004_1"></td>
                                    <td id="C03004_2"></td>
                                    <td>mL/min/1.73m²</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>당뇨검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>공복시혈당(FBS=Glucose)</td>
                                    <td id="C04001_0"></td>
                                    <td id="C04001_1"></td>
                                    <td id="C04001_2"></td>
                                    <td>mg/dl</td>
                                </tr>
                                <tr>
                                    <td>당화혈색소(HbA1c)</td>
                                    <td id="C04002_0"></td>
                                    <td id="C04002_1"></td>
                                    <td id="C04002_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>Insulin</td>
                                    <td id="C04004_0"></td>
                                    <td id="C04004_1"></td>
                                    <td id="C04004_2"></td>
                                    <td>uU/ml</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>췌장기능검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>리파아제(Lipase)</td>
                                    <td id="C05001_0"></td>
                                    <td id="C05001_1"></td>
                                    <td id="C05001_2"></td>
                                    <td>U/L</td>
                                </tr>
                                <tr>
                                    <td>아밀라제(Amylase)</td>
                                    <td id="C05002_0"></td>
                                    <td id="C05002_1"></td>
                                    <td id="C05002_2"></td>
                                    <td>U/L</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>지질 및 심혈관계검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>총콜레스테롤</td>
                                    <td id="C06001_0"></td>
                                    <td id="C06001_1"></td>
                                    <td id="C06001_2"></td>
                                    <td>mg/dL</td>
                                </tr>
                                <tr>
                                    <td>고밀도 콜레스테롤(HDL-콜레스테롤)</td>
                                    <td id="C06002_0"></td>
                                    <td id="C06002_1"></td>
                                    <td id="C06002_2"></td>
                                    <td>mg/dL</td>
                                </tr>
                                <tr>
                                    <td>저밀도 콜레스테롤(LDL-콜레스테롤)</td>
                                    <td id="C06003_0"></td>
                                    <td id="C06003_1"></td>
                                    <td id="C06003_2"></td>
                                    <td>mg/dL</td>
                                </tr>
                                <tr>
                                    <td>중성지방(Triglyceride)</td>
                                    <td id="C06004_0"></td>
                                    <td id="C06004_1"></td>
                                    <td id="C06004_2"></td>
                                    <td>mg/dL</td>
                                </tr>
                                <tr>
                                    <td>크레아티닌키나제(CPK)</td>
                                    <td id="C06005_0"></td>
                                    <td id="C06005_1"></td>
                                    <td id="C06005_2"></td>
                                    <td>U/L</td>
                                </tr>
                                <tr>
                                    <td>심장병위험인자(CRF)</td>
                                    <td id="C06006_0"></td>
                                    <td id="C06006_1"></td>
                                    <td id="C06006_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>호모시스테인(Homocysteine)</td>
                                    <td id="C06008_0"></td>
                                    <td id="C06008_1"></td>
                                    <td id="C06008_2"></td>
                                    <td>umoL/L</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>일반혈액검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>적혈구(RBC)</td>
                                    <td id="C070011_0"></td>
                                    <td id="C070011_1"></td>
                                    <td id="C070011_2"></td>
                                    <td>Mil/uL</td>
                                </tr>
                                <tr>
                                    <td>혈색소(Hb)</td>
                                    <td id="C070012_0"></td>
                                    <td id="C070012_1"></td>
                                    <td id="C070012_2"></td>
                                    <td>g/dL</td>
                                </tr>
                                <tr>
                                    <td>적혈구용적(Hct)</td>
                                    <td id="C070013_0"></td>
                                    <td id="C070013_1"></td>
                                    <td id="C070013_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>평균적혈구용적(MCV)</td>
                                    <td id="C070014_0"></td>
                                    <td id="C070014_1"></td>
                                    <td id="C070014_2"></td>
                                    <td>fL</td>
                                </tr>
                                <tr>
                                    <td>평균적혈구혈색소량(MCH)</td>
                                    <td id="C070015_0"></td>
                                    <td id="C070015_1"></td>
                                    <td id="C070015_2"></td>
                                    <td>pg</td>
                                </tr>
                                <tr>
                                    <td>평균적혈구혈색소농도(MCHC)</td>
                                    <td id="C070016_0"></td>
                                    <td id="C070016_1"></td>
                                    <td id="C070016_2"></td>
                                    <td>g/dL</td>
                                </tr>
                                <tr>
                                    <td>적혈구분포계수(RDW)</td>
                                    <td id="C070017_0"></td>
                                    <td id="C070017_1"></td>
                                    <td id="C070017_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>혈소판수(PLT)</td>
                                    <td id="C070018_0"></td>
                                    <td id="C070018_1"></td>
                                    <td id="C070018_2"></td>
                                    <td>Thous/uL</td>
                                </tr>
                                <tr>
                                    <td>혈소판백분율(PCT)</td>
                                    <td id="C070019_0"></td>
                                    <td id="C070019_1"></td>
                                    <td id="C070019_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>평균혈소판용적(MPV)</td>
                                    <td id="C0700110_0"></td>
                                    <td id="C0700110_1"></td>
                                    <td id="C0700110_2"></td>
                                    <td>fL</td>
                                </tr>
                                <tr>
                                    <td>혈소판분포폭(PDW)</td>
                                    <td id="C0700111_0"></td>
                                    <td id="C0700111_1"></td>
                                    <td id="C0700111_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>백혈구(WBC)</td>
                                    <td id="C0700112_0"></td>
                                    <td id="C0700112_1"></td>
                                    <td id="C0700112_2"></td>
                                    <td>Thous/uL</td>
                                </tr>
                                <tr>
                                    <td>분획호중구(Seg.Neutrophil)</td>
                                    <td id="C0700113_0"></td>
                                    <td id="C0700113_1"></td>
                                    <td id="C0700113_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>봉상호중구(Band neutrophil)</td>
                                    <td id="C0700114_0"></td>
                                    <td id="C0700114_1"></td>
                                    <td id="C0700114_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>림프구(Lymphocyte)</td>
                                    <td id="C0700115_0"></td>
                                    <td id="C0700115_1"></td>
                                    <td id="C0700115_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>단핵구(Monocyte)</td>
                                    <td id="C0700116_0"></td>
                                    <td id="C0700116_1"></td>
                                    <td id="C0700116_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>호산구(Eosinophile)</td>
                                    <td id="C0700117_0"></td>
                                    <td id="C0700117_1"></td>
                                    <td id="C0700117_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>염기구(Basophile)</td>
                                    <td id="C0700118_0"></td>
                                    <td id="C0700118_1"></td>
                                    <td id="C0700118_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>후골수구(metamyelocyte)</td>
                                    <td id="C0700119_0"></td>
                                    <td id="C0700119_1"></td>
                                    <td id="C0700119_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>골수구(myelocyte)</td>
                                    <td id="C0700120_0"></td>
                                    <td id="C0700120_1"></td>
                                    <td id="C0700120_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>전골수세포(promyeloyte)</td>
                                    <td id="C0700121_0"></td>
                                    <td id="C0700121_1"></td>
                                    <td id="C0700121_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>골수아세포(myeloblast)</td>
                                    <td id="C0700122_0"></td>
                                    <td id="C0700122_1"></td>
                                    <td id="C0700122_2"></td>
                                    <td>%</td>
                                </tr>
                                <tr>
                                    <td>유핵적혈구(nRCBC)</td>
                                    <td id="C0700123_0"></td>
                                    <td id="C0700123_1"></td>
                                    <td id="C0700123_2"></td>
                                    <td>%</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>철 결핍성 빈혈검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>훼리틴(Ferritin)</td>
                                    <td id="C11001_0"></td>
                                    <td id="C11001_1"></td>
                                    <td id="C11001_2"></td>
                                    <td>ng/m</td>
                                </tr>
                                <tr>
                                    <td>혈청철(Fe)</td>
                                    <td id="C11002_0"></td>
                                    <td id="C11002_1"></td>
                                    <td id="C11002_2"></td>
                                    <td>ug/dl</td>
                                </tr>
                                <tr>
                                    <td>총철결합능(TIBC)</td>
                                    <td id="C11003_0"></td>
                                    <td id="C11003_1"></td>
                                    <td id="C11003_2"></td>
                                    <td>ug/dl</td>
                                </tr>
                                <tr>
                                    <td>불포화 철결합능(UIBC)</td>
                                    <td id="C11004_0"></td>
                                    <td id="C11004_1"></td>
                                    <td id="C11004_2"></td>
                                    <td>ug/dl</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>갑상선기능검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>갑상선호르몬(T3)</td>
                                    <td id="C12001_0"></td>
                                    <td id="C12001_1"></td>
                                    <td id="C12001_2"></td>
                                    <td>ng/dl</td>
                                </tr>
                                <tr>
                                    <td>갑상선호르몬(T4)</td>
                                    <td id="C12002_0"></td>
                                    <td id="C12002_1"></td>
                                    <td id="C12002_2"></td>
                                    <td>ng/dl</td>
                                </tr>
                                <tr>
                                    <td>갑상선호르몬(Free T3)</td>
                                    <td id="C12003_0"></td>
                                    <td id="C12003_1"></td>
                                    <td id="C12003_2"></td>
                                    <td>ng/dl</td>
                                </tr>
                                <tr>
                                    <td>갑상선호르몬(Free T4)</td>
                                    <td id="C12004_0"></td>
                                    <td id="C12004_1"></td>
                                    <td id="C12004_2"></td>
                                    <td>ng/dl</td>
                                </tr>
                                <tr>
                                    <td>갑상선자극호르몬(TSH)</td>
                                    <td id="C12005_0"></td>
                                    <td id="C12005_1"></td>
                                    <td id="C12005_2"></td>
                                    <td>uIU/ml</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>감염검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>헬리코박터 : H.pylori</td>
                                    <td id="C13001_0"></td>
                                    <td id="C13001_1"></td>
                                    <td id="C13001_2"></td>
                                    <td>음성</td>
                                </tr>
                                <tr>
                                    <td>매독 : RPR(VDRL)</td>
                                    <td id="C13002_0"></td>
                                    <td id="C13002_1"></td>
                                    <td id="C13002_2"></td>
                                    <td>음성</td>
                                </tr>
                                <tr>
                                    <td>매독감작혈구응집 : TPHA</td>
                                    <td id="C13003_0"></td>
                                    <td id="C13003_1"></td>
                                    <td id="C13003_2"></td>
                                    <td>음성</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>통풍 및 염증반응검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>요산(uric acid)</td>
                                    <td id="C14001_0"></td>
                                    <td id="C14001_1"></td>
                                    <td id="C14001_2"></td>
                                    <td>mg/dL</td>
                                </tr>
                                <tr>
                                    <td>류마티스인자(RA Factor, RF)</td>
                                    <td id="C14002_0"></td>
                                    <td id="C14002_1"></td>
                                    <td id="C14002_2"></td>
                                    <td>음성</td>
                                </tr>
                                <tr>
                                    <td>C-반응 단백 (CRP)</td>
                                    <td id="C14003_0"></td>
                                    <td id="C14003_1"></td>
                                    <td id="C14003_2"></td>
                                    <td>mg/dL</td>
                                </tr>
                                <tr>
                                    <td>고감도 C-반응 단백 (HS_CRP)</td>
                                    <td id="C14004_0"></td>
                                    <td id="C14004_1"></td>
                                    <td id="C14004_2"></td>
                                    <td>mg/dL</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>전해질검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>나트륨(Na)</td>
                                    <td id="C15001_0"></td>
                                    <td id="C15001_1"></td>
                                    <td id="C15001_2"></td>
                                    <td>mmol/l</td>
                                </tr>
                                <tr>
                                    <td>칼륨(K)</td>
                                    <td id="C15002_0"></td>
                                    <td id="C15002_1"></td>
                                    <td id="C15002_2"></td>
                                    <td>mmol/l</td>
                                </tr>
                                <tr>
                                    <td>염소(Cl)</td>
                                    <td id="C15003_0"></td>
                                    <td id="C15003_1"></td>
                                    <td id="C15003_2"></td>
                                    <td>mmol/l</td>
                                </tr>
                                <tr>
                                    <td>칼슘(Ca)</td>
                                    <td id="C15004_0"></td>
                                    <td id="C15004_1"></td>
                                    <td id="C15004_2"></td>
                                    <td>mg/dl</td>
                                </tr>
                                <tr>
                                    <td>인(P)</td>
                                    <td id="C15005_0"></td>
                                    <td id="C15005_1"></td>
                                    <td id="C15005_2"></td>
                                    <td>mg/dl</td>
                                </tr>
                                <tr>
                                    <td>마그네슘(Mg)</td>
                                    <td id="C15006_0"></td>
                                    <td id="C15006_1"></td>
                                    <td id="C15006_2"></td>
                                    <td>mg/dl</td>
                                </tr>
                                <tr>
                                    <td>아연(Zn)</td>
                                    <td id="C15007_0"></td>
                                    <td id="C15007_1"></td>
                                    <td id="C15007_2"></td>
                                    <td>mg/dl</td>
                                </tr>
                                <tr>
                                    <td>혈중 이산화탄소(CO2)</td>
                                    <td id="C15008_0"></td>
                                    <td id="C15008_1"></td>
                                    <td id="C15008_2"></td>
                                    <td>mmol/l</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>종양표지자검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>AFP(간암)</td>
                                    <td id="C16001_0"></td>
                                    <td id="C16001_1"></td>
                                    <td id="C16001_2"></td>
                                    <td>ng/mL</td>
                                </tr>
                                <tr>
                                    <td>CEA(대장암)</td>
                                    <td id="C16002_0"></td>
                                    <td id="C16002_1"></td>
                                    <td id="C16002_2"></td>
                                    <td>ng/mL</td>
                                </tr>
                                <tr>
                                    <td>CA19-9 (췌장암)</td>
                                    <td id="C16003_0"></td>
                                    <td id="C16003_1"></td>
                                    <td id="C16003_2"></td>
                                    <td>U/mL</td>
                                </tr>
                                <tr>
                                    <td>PSA(전립선암)_남</td>
                                    <td id="C16004_0"></td>
                                    <td id="C16004_1"></td>
                                    <td id="C16004_2"></td>
                                    <td>ng/mL</td>
                                </tr>
                                <tr>
                                    <td>CA125(난소/자궁암)_여</td>
                                    <td id="C16005_0"></td>
                                    <td id="C16005_1"></td>
                                    <td id="C16005_2"></td>
                                    <td>U/mL</td>
                                </tr>
                                <tr>
                                    <td>CA15-3(유방암)_여</td>
                                    <td id="C16006_0"></td>
                                    <td id="C16006_1"></td>
                                    <td id="C16006_2"></td>
                                    <td>U/mL</td>
                                </tr>
                                <tr>
                                    <td>Cyfra21-1(폐암)</td>
                                    <td id="C16007_0"></td>
                                    <td id="C16007_1"></td>
                                    <td id="C16007_2"></td>
                                    <td>ng/mL</td>
                                </tr>
                                <tr>
                                    <td>NSE(폐암)</td>
                                    <td id="C16008_0"></td>
                                    <td id="C16008_1"></td>
                                    <td id="C16008_2"></td>
                                    <td>μg/L</td>
                                </tr>
                                <tr>
                                    <td>SCC(폐암,식도암,편평상피암)</td>
                                    <td id="C16009_0"></td>
                                    <td id="C16009_1"></td>
                                    <td id="C16009_2"></td>
                                    <td>ng/mL</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>비타민검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>비타민D(Vit.D)</td>
                                    <td id="C18002_0"></td>
                                    <td id="C18002_1"></td>
                                    <td id="C18002_2"></td>
                                    <td>ng/mL</td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>소변검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>요비중(urine S.G)</td>
                                    <td id="D010011_0"></td>
                                    <td id="D010011_1"></td>
                                    <td id="D010011_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>요산도(urine pH)</td>
                                    <td id="D010012_0"></td>
                                    <td id="D010012_1"></td>
                                    <td id="D010012_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>요백혈구(Urine Leukocytes)</td>
                                    <td id="D010013_0"></td>
                                    <td id="D010013_1"></td>
                                    <td id="D010013_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>요아질산염(urine Nitrite)</td>
                                    <td id="D010014_0"></td>
                                    <td id="D010014_1"></td>
                                    <td id="D010014_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>요단백(urine protein)</td>
                                    <td id="D010015_0"></td>
                                    <td id="D010015_1"></td>
                                    <td id="D010015_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>요당(urine glucose)</td>
                                    <td id="D010016_0"></td>
                                    <td id="D010016_1"></td>
                                    <td id="D010016_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>케톤(urine ketone body)</td>
                                    <td id="D010017_0"></td>
                                    <td id="D010017_1"></td>
                                    <td id="D010017_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>유로빌리노겐(urobilinogen)</td>
                                    <td id="D010018_0"></td>
                                    <td id="D010018_1"></td>
                                    <td id="D010018_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>빌리루빈(bilirubin)</td>
                                    <td id="D010019_0"></td>
                                    <td id="D010019_1"></td>
                                    <td id="D010019_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>요잠혈(urine occult blood)</td>
                                    <td id="D0100110_0"></td>
                                    <td id="D0100110_1"></td>
                                    <td id="D0100110_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>요침사백혈구(urine WBC)</td>
                                    <td id="D010021_0"></td>
                                    <td id="D010021_1"></td>
                                    <td id="D010021_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>요침사적혈구(urine RBC)</td>
                                    <td id="D010022_0"></td>
                                    <td id="D010022_1"></td>
                                    <td id="D010022_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>요침사 현미경검사</td>
                                    <td id="D010023_0"></td>
                                    <td id="D010023_1"></td>
                                    <td id="D010023_2"></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>대변검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>분변잠혈</td>
                                    <td id="D02001_0"></td>
                                    <td id="D02001_1"></td>
                                    <td id="D02001_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>분변충란검사(기생충)</td>
                                    <td id="D02002_0"></td>
                                    <td id="D02002_1"></td>
                                    <td id="D02002_2"></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>부인과검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>자궁경부암검사(Papsmear)</td>
                                    <td id="G02001_0"></td>
                                    <td id="G02001_1"></td>
                                    <td id="G02001_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>자궁경부암 액상세포검사(Thin prep)</td>
                                    <td id="G02002_0"></td>
                                    <td id="G02002_1"></td>
                                    <td id="G02002_2"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>인유두종바이러스검사(HPV)</td>
                                    <td id="G02003_0"></td>
                                    <td id="G02003_1"></td>
                                    <td id="G02003_2"></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>골밀도검사 (Bone density)
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th class="checkupedAt_0"></th>
                                    <th class="checkupedAt_1"></th>
                                    <th class="checkupedAt_2"></th>
                                    <th>단위</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>골밀도검사 (Bone density)</td>
                                    <td id="F05001_0"></td>
                                    <td id="F05001_1"></td>
                                    <td id="F05001_2"></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>심전도검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="55%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th>검진일자</th>
                                    <th>결과</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td rowspan="3">심전도 검사</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3">2021-01-01</td>
                                    <td id="E01001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="E01001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="E01001_2" style="background-color: #ffffff"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>폐기능검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="55%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th>검진일자</th>
                                    <th>결과</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td rowspan="3">폐기능 검사</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="E01002_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="E01002_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="E01002_2" style="background-color: #ffffff"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>흉부X-선검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="55%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th>검진일자</th>
                                    <th>결과</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td rowspan="3">흉부X-선 검사</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="E01003_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="E01003_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="E01003_2" style="background-color: #ffffff"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>동맥경화검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="55%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th>검진일자</th>
                                    <th>결과</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td rowspan="3">동맥경화검사</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F03001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F03001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F03001_2" style="background-color: #ffffff"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>위장검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="55%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th>검진일자</th>
                                    <th>결과</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <%--                                    <td>위내시경</td>--%>
                                    <!--                                    <td id="F06002_0"></td>-->
                                    <!--                                    <td id="F06002_1"></td>-->
                                    <!--                                    <td id="F06002_2"></td>-->
                                </tr>
                                <tr>
                                    <td rowspan="3">위내시경</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F06001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F06001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F06001_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">위장조영촬영</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F06003_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F06003_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F06003_2" style="background-color: #ffffff"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>대장내시경
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="55%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th>검진일자</th>
                                    <th>결과</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <%--                                    <td>대장내시경</td>--%>
                                    <!--                                    <td id="F07002_0"></td>-->
                                    <!--                                    <td id="F07002_1"></td>-->
                                    <!--                                    <td id="F07002_2"></td>-->
                                </tr>
                                <tr>
                                    <td rowspan="3">대장내시경</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F07001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F07001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F07001_2" style="background-color: #ffffff"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>유방X-선(Mammography)
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="55%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th>검진일자</th>
                                    <th>결과</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td rowspan="3">유방X-선(Mammography)</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="E02001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="E02001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="E02001_2" style="background-color: #ffffff"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>척추X-선촬영
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="55%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th>검진일자</th>
                                    <th>결과</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td rowspan="3">경추X-선촬영</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F02001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F02001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F02001_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">요추X-선촬영</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F02002_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F02002_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F02002_2" style="background-color: #ffffff"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>초음파검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="55%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th>검진일자</th>
                                    <th>결과</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td rowspan="3">상복부초음파</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F08001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F08001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F08001_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">전립선(남성하복부)초음파</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F08004_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F08004_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F08004_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">경직장(전립선)초음파</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F08005_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F08005_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F08005_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">골반(여성하복부)초음파</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F08006_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F08006_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F08006_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">질초음파(VaginalSono)</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F08007_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F08007_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F08007_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">갑상선초음파</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F08008_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F08008_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F08008_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">경동맥초음파</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F08009_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F08009_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F08009_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">유방초음파(BreastSono)</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F08010_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F08010_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F08010_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">심장초음파</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F08012_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F08012_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F08012_2" style="background-color: #ffffff"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>CT검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="55%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th>검진일자</th>
                                    <th>결과</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td rowspan="3">뇌(머리)CT</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F09001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F09001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F09001_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">흉부(폐)CT</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F10001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F10001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F10001_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">경추(목)CT</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F11001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F11001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F11001_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">요추(허리)CT</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F11002_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F11002_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F11002_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">심장석회화(칼슘스코어링)CT</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F12001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F12001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F12001_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">복부비만CT</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F13001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F13001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F13001_2" style="background-color: #ffffff"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->

                        <div class="list list_type1">
                            <div class="result_info_title">
                                <span class="info_title_dot square"></span>MRI(MRA)검사
                            </div>
                            <table>
                                <colgroup>
                                    <col width="40%">
                                    <col width="15%">
                                    <col width="55%">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th>검진일자</th>
                                    <th>결과</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td rowspan="3">뇌MRI</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F16001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F16001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F16001_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">뇌혈관MRA</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F16003_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F16003_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F16003_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">뇌MRI+뇌MRA</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F16005_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F16005_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F16005_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">경추(목)MRI</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F17001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F17001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F17001_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">요추(허리)MRI</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F17003_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F17003_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F17003_2" style="background-color: #ffffff"></td>
                                </tr>
                                </tbody>

                                <thead>
                                <tr>
                                    <th>검사항목</th>
                                    <th>검진일자</th>
                                    <th>결과</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td rowspan="3">견관절(어깨)MRI (좌, 우 중 한1부위)</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F18001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F18001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F18001_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">족관절(발목)MRI (좌, 우 중 한1부위)</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F18002_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F18002_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F18002_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">고관절(골반)MRI</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F18003_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F18003_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F18003_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">수근관절(손목)MRI (좌, 우 중 한1부위)</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F18004_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F18004_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F18004_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">슬관절(무릎)MRI (좌, 우 중 한1부위)</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F18005_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F18005_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F18005_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">뇌+전신 PET</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F21001_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F21001_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F21001_2" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3">전신 PET(뇌 제외)</td>
                                    <td class="checkupedAt_0" style="background-color: #f3f3f3"></td>
                                    <td id="F21002_0" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_1" style="background-color: #f3f3f3"></td>
                                    <td id="F21002_1" style="background-color: #ffffff"></td>
                                </tr>
                                <tr>
                                    <td class="checkupedAt_2" style="background-color: #f3f3f3"></td>
                                    <td id="F21002_2" style="background-color: #ffffff"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--list list_type1-->


                    </div><!--result_info_area-->

                </div>


            </div><!--container-->


        </div><!--main_cont-->
    </section><!--main_section-->

</main>


<!--<div class="btn_area">-->
<!--    <div class="btn check_btn">-->
<!--        <span class="button_on_circle"></span>-->
<!--        <a href="javascript:history.back()" class="btn_inner grey">-->
<!--                                                      <span class="btn_txt_area">-->
<!--                                                        이전 페이지로-->
<!--                                                      </span>-->
<!--        </a>-->
<!--    </div>-->
<!--</div>-->
<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
    $("header").load("header.html");
    $("footer").load("footer.html");
    let resultItems;

    $.ajax({
        type: 'GET',
        url: '<c:url value="/us/result"/>',
        dataType: 'JSON',
    }).then(function (response) {
        let length = response.data.length;
        response.data[length - 1].year = 0;
        if (length > 1) {
            response.data[length - 2].year = 1;
            if (length > 2) {
                response.data[length - 3].year = 2;
            }
        }

        if (length < 3) {
            for (let i = 0; i < length; i++) {
                let checkupYear = '_' + response.data[i].year;
                let birth = new Date(response.data[i].birth);
                let birthMonth;
                let birthDate;
                let confirmedAt = new Date(response.data[i].confirmedAt);
                let confirmedAtMonth;
                let confirmedAtDate;
                let checkupedAt = new Date(response.data[i].checkupedAt);
                let checkupedAtMonth;
                let checkupedAtDate;

                if ((birth.getMonth() + 1).toString() < 10) {
                    birthMonth = '0' + (birth.getMonth() + 1);
                } else {
                    birthMonth = birth.getMonth() + 1;
                }
                if ((birth.getDate()).toString() < 10) {
                    birthDate = '0' + (birth.getDate());
                } else {
                    birthDate = birth.getDate();
                }

                if (response.data[i].checkupedAt === null) {
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
                    $('.checkupedAt' + '_' + (response.data[i].year)).text(confirmedAt.getFullYear() + '-' + confirmedAtMonth + '-' + confirmedAtDate);
                } else {
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
                    $('.checkupedAt' + '_' + (response.data[i].year)).text(checkupedAt.getFullYear() + '-' + checkupedAtMonth + '-' + checkupedAtDate);
                }


                $('#birth').text(birth.getFullYear() + '' + birthMonth + '' + birthDate);
                $('#hospitalCenterName' + '_' + (response.data[i].year)).text(response.data[i].hospitalCenterName);
                if (response.data[i].resultEmployees[0].review === null) {
                    $('#review').text('등록된 종합소견이 없습니다.');
                } else {
                    $('#review').text(response.data[i].resultEmployees[0].review);
                }
                if (response.data[i] && response.data[i].resultEmployees && response.data[i].resultEmployees.length) {
                    console.log(response.data[i].resultEmployees[0].resultItems)
                    if (response.data[i].resultEmployees[0].resultItems) {
                        let other;
                        for (let j = response.data[i].resultEmployees[0].resultItems.length - 1; j >= 0; j--) {
                            let itemCode = response.data[i].resultEmployees[0].resultItems[j].itemCode;
                            let resultValue = response.data[i].resultEmployees[0].resultItems[j].resultValue;
                            if (itemCode === 'B030022') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B030021') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B030024') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B030023') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B030026') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B030025') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B030028') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B030027') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B040022') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue
                                }

                            }
                            if (itemCode === 'B040021') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B040024') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue
                                }
                            }
                            if (itemCode === 'B040023') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B040032') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B040031') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B040042') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B040041') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'F06002' && resultValue !== null) {
                                other = resultValue;
                            }
                            if (itemCode === 'F06001' && resultValue === null) {
                                resultValue = other;
                            }

                            if (itemCode === 'F07002' && resultValue !== null) {
                                other = resultValue;
                            }
                            if (itemCode === 'F07001' && resultValue === null) {
                                resultValue = other;
                            }

                            if (resultValue !== null) {
                                $('#' + itemCode + checkupYear).text(resultValue);
                            }
                        }
                    }
                }
            }
        } else {
            for (let i = length - 1; i < length - 3; i--) {
                let checkupYear = '_' + (response.data[i].year).toString();
                let birth = new Date(response.data[i].birth);
                let birthMonth;
                let birthDate;
                let confirmedAt = new Date(response.data[i].confirmedAt);
                let confirmedAtMonth;
                let confirmedAtDate;
                let checkupedAt = new Date(response.data[i].checkupedAt);
                let checkupedAtMonth;
                let checkupedAtDate;

                if ((birth.getMonth() + 1).toString() < 10) {
                    birthMonth = '0' + (birth.getMonth() + 1);
                } else {
                    birthMonth = birth.getMonth() + 1;
                }
                if ((birth.getDate()).toString() < 10) {
                    birthDate = '0' + (birth.getDate());
                } else {
                    birthDate = birth.getDate();
                }

                if (response.data[i].checkupedAt === null) {
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
                    $('.checkupedAt' + '_' + (response.data[i].year)).text(confirmedAt.getFullYear() + '-' + confirmedAtMonth + '-' + confirmedAtDate);
                } else {
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
                    $('.checkupedAt' + '_' + (response.data[i].year)).text(checkupedAt.getFullYear() + '-' + checkupedAtMonth + '-' + checkupedAtDate);
                }


                $('#birth').text(birth.getFullYear() + '' + birthMonth + '' + birthDate);
                $('#hospitalCenterName' + '_' + (response.data[i].year)).text(response.data[i].hospitalCenterName);
                if (response.data[i].resultEmployees[0].review === null) {
                    $('#review').text('등록된 종합소견이 없습니다.');
                } else {
                    $('#review').text(response.data[i].resultEmployees[0].review);
                }

                if (response.data[i] && response.data[i].resultEmployees && response.data[i].resultEmployees.length) {
                    if (response.data[i].resultEmployees[0].resultItems) {
                        let other;
                        for (let j = response.data[i].resultEmployees[0].resultItems.length - 1; j >= 0; j--) {
                            let itemCode = response.data[i].resultEmployees[0].resultItems[j].itemCode;
                            let resultValue = response.data[i].resultEmployees[0].resultItems[j].resultValue;
                            if (itemCode === 'B030022') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B030021') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B030024') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B030023') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B030026') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B030025') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B030028') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B030027') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B040022') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B040021') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B040024') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B040023') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B040032') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B040031') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'B040042') {
                                if (resultValue === null) {
                                    other = ' ';
                                } else {
                                    other = resultValue;
                                }
                            }
                            if (itemCode === 'B040041') {
                                if (resultValue === null) {
                                    resultValue = ' /' + other;
                                } else {
                                    resultValue = resultValue + '/' + other;
                                }
                            }

                            if (itemCode === 'F06002' && resultValue !== null) {
                                other = resultValue;
                            }
                            if (itemCode === 'F06001' && resultValue === null) {
                                resultValue = other;
                            }

                            if (itemCode === 'F07002' && resultValue !== null) {
                                other = resultValue;
                            }
                            if (itemCode === 'F07001' && resultValue === null) {
                                resultValue = other;
                            }

                            if (resultValue !== null) {
                                $('#' + itemCode + checkupYear).text(resultValue);
                            }
                        }
                    }
                }
            }
        }
    });


</script>
</body>
</html>
