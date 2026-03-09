<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건강살자(사용자) 검진옵션 선택</title>
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
    <link href="../css/us/ex_item_selection_package_option.css" rel="stylesheet" type="text/css">

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


                                    <div class="step step03">
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

                <div class="row title_btn">
                    <div class="col-md-9">
                        <div class="title_area">
                            <div class="title">
                                <span class="point_line point_color"></span>
                                <h2>검진 옵션 선택</h2>
                            </div>
                            <div class="search_area">
                                <div class="row">
                                    <div class="col-md-2">
                                        <span>검사항목 검색</span>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="search_box_area write">
                                            <div class="input_type1">
                                                <label for="search">
                                                    <input type="text" name="search" id="search" placeholder="&nbsp;"
                                                           required="" autocomplete="off">
                                                    <span class="label">검색하실 단어를 입력해 주세요.</span>
                                                </label>
                                            </div>
                                        </div><!--search_box-->
                                    </div>
                                    <div class="col-md-2">
                                        <div class="btn search_btn">
                                            <span class="button_on_circle"></span>
                                            <a href="#none" class="btn_inner point_color">
                                                      <span class="btn_txt_area">
                                                        검색하기
                                                      </span>
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div><!--title_area-->
                    </div>
                    <div class="col-md-3 btn_area">
                        <div class="btn retry_btn">

                            <a class="btn_inner">

                                <i class="xi-renew"></i> 항목비교 다시하기

                            </a>
                        </div>
                    </div>
                </div>

                <div class="list_area">
                    <div class="table">
                        <div class="tbody">
                            <div class="tr hospital_select">
                                <div class="tr_wrap">
                                    <div class="left_area sub_title">병원선택</div>
                                    <div class="right_area">
                                        <div class="td selectList">
                                            <div class="select_box_area">
                                                <div id="center1"></div>
                                            </div>
                                        </div>
                                        <div class="td selectList">
                                            <div class="select_box_area">
                                                <div id="center2"></div>
                                            </div>
                                        </div>
                                        <div class="td selectList">
                                            <div class="select_box_area">
                                                <div id="center3"></div>
                                            </div>
                                        </div>
                                    </div><!--right_area-->
                                </div><!--tr_wrap-->
                            </div><!--tr-->

                            <div class="tr checkup_select">
                                <div class="tr_wrap">
                                    <div class="left_area sub_title">검진유형선택</div>
                                    <div class="right_area">
                                        <div class="td selectList">
                                            <div class="select_box_area">
                                                <div id="checkup1"></div>
                                            </div>
                                        </div>
                                        <div class="td selectList">
                                            <div class="select_box_area">
                                                <div id="checkup2"></div>
                                            </div>
                                        </div>
                                        <div class="td selectList">
                                            <div class="select_box_area">
                                                <div id="checkup3"></div>
                                            </div>
                                        </div>
                                    </div><!--right_area-->
                                </div><!--tr_wrap-->
                            </div><!--tr-->

                        </div><!--tbody-->
                    </div><!--table-->

                    <div class="table main_table basic_item">
                        <div class="thead sub_title">
                            기본<br>항목
                        </div>

                        <div class="tbody">
                            <c:forEach var="checkupItemClass" items="${checkupItemClasses}" varStatus="status">
                                <div class="tr">
                                    <c:choose>
                                        <c:when test="${checkupItemClass.itemClassCode == 'F'}">
                                            <div class="tr_wrap basicItemClassF">
                                                <div class="left_area item_name detail_view_btn select_item_name">특수장비
                                                    검사
                                                </div>
                                                <div class="right_area">
                                                    <div class="td"
                                                         id="checkupClass1_<c:out value="${checkupItemClass.itemClassId}"/>">
                                                        <ul class="checkupClass1"></ul>
                                                    </div>
                                                    <div class="td"
                                                         id="checkupClass2_<c:out value="${checkupItemClass.itemClassId}"/>">
                                                        <ul class="checkupClass2"></ul>
                                                    </div>
                                                    <div class="td"
                                                         id="checkupClass3_<c:out value="${checkupItemClass.itemClassId}"/>">
                                                        <ul class="checkupClass3"></ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="tr_wrap">
                                                <div class="left_area item_name<c:if test="${checkupItemClass.checkupItemCategories.size() > 0 && checkupItemClass.itemClassCode != 'A'}"> arrange_area detail_view_btn</c:if>">
                                                    <div class="left_area_inner">
                                                        <c:out value="${checkupItemClass.itemClassName}"/>
                                                        <c:if test="${checkupItemClass.checkupItemCategories.size() > 0 && checkupItemClass.itemClassCode != 'A'}">
                                                            <i class="xi-caret-down"></i>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <div class="right_area">
                                                    <div class="td checkupClass1 zero"
                                                         id="checkupClass1_<c:out value="${checkupItemClass.itemClassId}"/>">
                                                        <c:out value="${checkupItemClass.itemClassCode == 'A' ? '미제공' : '0 개'}"/>
                                                    </div>
                                                    <div class="td checkupClass2 zero"
                                                         id="checkupClass2_<c:out value="${checkupItemClass.itemClassId}"/>">
                                                        <c:out value="${checkupItemClass.itemClassCode == 'A' ? '미제공' : '0 개'}"/>
                                                    </div>
                                                    <div class="td checkupClass3 zero"
                                                         id="checkupClass3_<c:out value="${checkupItemClass.itemClassId}"/>">
                                                        <c:out value="${checkupItemClass.itemClassCode == 'A' ? '미제공' : '0 개'}"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <c:if test="${checkupItemClass.checkupItemCategories.size() > 0}">
                                                <div class="toogle_table">
                                                    <c:forEach items="${checkupItemClass.checkupItemCategories}"
                                                               var="checkupItemCategory">
                                                        <div class="table border_line basicItemCategory">
                                                            <div class="thead">
                                                                <div class="left_area sub_title"></div>
                                                                <div class="right_area">
                                                                    <div class="td sub_title">
                                                                        <c:out value="${checkupItemCategory.itemCategoryName}"/>
                                                                    </div>
                                                                </div>
                                                            </div><!--thead-->

                                                            <c:if test="${checkupItemCategory.checkupItems.size() > 0}">
                                                                <div class="tbody">
                                                                    <c:forEach
                                                                            items="${checkupItemCategory.checkupItems}"
                                                                            var="checkupItem">
                                                                        <div class="tr basicItem">
                                                                            <div class="left_area">
                                                                                <c:out value="${checkupItem.itemName}"/>
                                                                            </div>
                                                                            <div class="right_area">
                                                                                <div class="td checkupItem1"
                                                                                     id="checkupItem1_<c:out value="${checkupItem.itemId}"/>">
                                                                                    <i class="check_icon xi-close-circle-o"></i>
                                                                                </div>
                                                                                <div class="td checkupItem2"
                                                                                     id="checkupItem2_<c:out value="${checkupItem.itemId}"/>">
                                                                                    <i class="check_icon xi-close-circle-o"></i>
                                                                                </div>
                                                                                <div class="td checkupItem3"
                                                                                     id="checkupItem3_<c:out value="${checkupItem.itemId}"/>">
                                                                                    <i class="check_icon xi-close-circle-o"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                                <!--tbody-->
                                                            </c:if>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <!--toggle_table-->
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:forEach>

                        </div><!--tbody-->
                    </div><!--table-->


                    <div class="table main_table select_item">
                        <div class="thead sub_title">
                            선택<br>항목
                        </div>
                        <div class="tbody">
                            <div class="tr selectA">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name"
                                         style="height:auto;"></div>
                                    <div class="right_area">
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass1"
                                                id="checkupClass1_A_count"></span></div>
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass2"
                                                id="checkupClass2_A_count"></span></div>
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass3"
                                                id="checkupClass3_A_count"></span></div>
                                    </div>
                                </div>
                            </div><!--tr-->
                            <div class="tr selectA">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name">선택<br>A</div>
                                    <div class="right_area">
                                        <div class="td" id="checkupClass1_A">
                                            <ul class="checkupClass1"></ul>
                                        </div>
                                        <div class="td" id="checkupClass2_A">
                                            <ul class="checkupClass2"></ul>
                                        </div>
                                        <div class="td" id="checkupClass3_A">
                                            <ul class="checkupClass3"></ul>
                                        </div>
                                    </div>
                                </div>
                            </div><!--tr-->

                            <div class="tr selectB">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name"
                                         style="height:auto;"></div>
                                    <div class="right_area">
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass1"
                                                id="checkupClass1_B_count"></span></div>
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass2"
                                                id="checkupClass2_B_count"></span></div>
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass3"
                                                id="checkupClass3_B_count"></span></div>
                                    </div>
                                </div>
                            </div><!--tr-->
                            <div class="tr selectB">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name">선택<br>B</div>
                                    <div class="right_area">
                                        <div class="td" id="checkupClass1_B">
                                            <ul class="checkupClass1"></ul>
                                        </div>
                                        <div class="td" id="checkupClass2_B">
                                            <ul class="checkupClass2"></ul>
                                        </div>
                                        <div class="td" id="checkupClass3_B">
                                            <ul class="checkupClass3"></ul>
                                        </div>
                                    </div>
                                </div>
                            </div><!--tr-->

                            <div class="tr selectC">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name"
                                         style="height:auto;"></div>
                                    <div class="right_area">
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass1"
                                                id="checkupClass1_C_count"></span></div>
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass2"
                                                id="checkupClass2_C_count"></span></div>
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass3"
                                                id="checkupClass3_C_count"></span></div>
                                    </div>
                                </div>
                            </div><!--tr-->
                            <div class="tr selectC">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name">선택<br>C</div>
                                    <div class="right_area">
                                        <div class="td" id="checkupClass1_C">
                                            <ul class="checkupClass1"></ul>
                                        </div>
                                        <div class="td" id="checkupClass2_C">
                                            <ul class="checkupClass2"></ul>
                                        </div>
                                        <div class="td" id="checkupClass3_C">
                                            <ul class="checkupClass3"></ul>
                                        </div>
                                    </div>
                                </div>
                            </div><!--tr-->

                            <div class="tr selectD">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name"
                                         style="height:auto;"></div>
                                    <div class="right_area">
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass1"
                                                id="checkupClass1_D_count"></span></div>
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass2"
                                                id="checkupClass2_D_count"></span></div>
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass3"
                                                id="checkupClass3_D_count"></span></div>
                                    </div>
                                </div>
                            </div><!--tr-->
                            <div class="tr selectD">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name">선택<br>D</div>
                                    <div class="right_area">
                                        <div class="td" id="checkupClass1_D">
                                            <ul class="checkupClass1"></ul>
                                        </div>
                                        <div class="td" id="checkupClass2_D">
                                            <ul class="checkupClass2"></ul>
                                        </div>
                                        <div class="td" id="checkupClass3_D">
                                            <ul class="checkupClass3"></ul>
                                        </div>
                                    </div>
                                </div>
                            </div><!--tr-->

                            <div class="tr selectE">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name"
                                         style="height:auto;"></div>
                                    <div class="right_area">
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass1"
                                                id="checkupClass1_E_count"></span></div>
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass2"
                                                id="checkupClass2_E_count"></span></div>
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass3"
                                                id="checkupClass3_E_count"></span></div>
                                    </div>
                                </div>
                            </div><!--tr-->
                            <div class="tr selectE">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name">선택<br>E</div>
                                    <div class="right_area">
                                        <div class="td" id="checkupClass1_E">
                                            <ul class="checkupClass1"></ul>
                                        </div>
                                        <div class="td" id="checkupClass2_E">
                                            <ul class="checkupClass2"></ul>
                                        </div>
                                        <div class="td" id="checkupClass3_E">
                                            <ul class="checkupClass3"></ul>
                                        </div>
                                    </div>
                                </div>
                            </div><!--tr-->

                            <div class="tr selectF">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name"
                                         style="height:auto;"></div>
                                    <div class="right_area">
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass1"
                                                id="checkupClass1_F_count"></span></div>
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass2"
                                                id="checkupClass2_F_count"></span></div>
                                        <div class="td choice_num_area">선택갯수<span
                                                class="point_color add_info choic_num checkupClass3"
                                                id="checkupClass3_F_count"></span></div>
                                    </div>
                                </div>
                            </div><!--tr-->
                            <div class="tr selectF">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name">선택<br>F</div>
                                    <div class="right_area">
                                        <div class="td" id="checkupClass1_F">
                                            <ul class="checkupClass1"></ul>
                                        </div>
                                        <div class="td" id="checkupClass2_F">
                                            <ul class="checkupClass2"></ul>
                                        </div>
                                        <div class="td" id="checkupClass3_F">
                                            <ul class="checkupClass3"></ul>
                                        </div>
                                    </div>
                                </div>
                            </div><!--tr-->

                            <div class="tr selectADD">
                                <div class="tr_wrap">
                                    <div class="left_area item_name select_item_name">추가<br>검사</div>
                                    <div class="right_area">
                                        <div class="td" id="checkupClass1_ADD">
                                            <ul class="checkupClass1"></ul>
                                        </div>
                                        <div class="td" id="checkupClass2_ADD">
                                            <ul class="checkupClass2"></ul>
                                        </div>
                                        <div class="td" id="checkupClass3_ADD">
                                            <ul class="checkupClass3"></ul>
                                        </div>
                                    </div>
                                </div>
                            </div><!--tr-->
                        </div><!--tbody-->
                    </div><!--table-->

                    <div class="table reserve_btn_area">
                        <div class="thead sub_title">

                        </div>
                        <div class="tbody">
                            <div class="tr">
                                <div class="tr_wrap">
                                    <div class="left_area"></div>
                                    <div class="right_area">

                                        <c:if test="${checkupContractSubTypeId != null && centerId != null}">
                                            <div class="td reserve_btn_box">
                                                <div class="btn_area">
                                                    <div class="btn confirm_btn" data-index="1">
                                                        <span class="button_on_circle"></span>
                                                        <a href="#none" class="btn_inner blue_gradient">
                                                        <span class="btn_txt_area">
                                                            예약하기
                                                        </span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="td reserve_btn_box">
                                                <div class="btn_area">
                                                    <div class="btn confirm_btn" data-index="2">
                                                        <span class="button_on_circle"></span>
                                                        <a href="#none" class="btn_inner blue_gradient">
                                                        <span class="btn_txt_area">
                                                            예약하기
                                                        </span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="td reserve_btn_box">
                                                <div class="btn_area">
                                                    <div class="btn confirm_btn" data-index="3">
                                                        <span class="button_on_circle"></span>
                                                        <a href="#none" class="btn_inner blue_gradient">
                                                        <span class="btn_txt_area">
                                                            예약하기
                                                        </span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                    </div>
                                </div>
                            </div><!--tr-->
                        </div>
                    </div>

                </div><!--list_arae-->


            </div><!--container-->


        </div><!--main_cont-->
    </section><!--main_section-->

</main>


<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="../js/us/custom_select.js"></script>

<script type="text/javascript" src="<c:url value="/lib/devextreme/dx-quill.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/lib/devextreme/dx.all.js"/>"></script>
<script type="text/javascript" src="<c:url value="/lib/devextreme/localization/dx.messages.ko.js"/>"></script>
<script>


    $("header").load("header.html");
    $("footer").load("footer.html");

    DevExpress.localization.locale(navigator.language);

    $.ajax({
        url: '<c:url value="/us/reserve-center"/>',
        contentType: 'application/json',
        dataType: 'json',
        data: {
            userId: <c:out value="${userId}"/>,
            itemIds: '<c:out value="${itemIds}"/>',
            specialCheckup: '<c:out value="${specialCheckup}"/>',
            sido: '<c:out value="${sido}"/>',
            sigungu: '<c:out value="${sigungu}"/>',
            centerName: '<c:out value="${centerName}"/>',
        }
    }).then(function (response) {
        if (response.data.length > 0) {
            let checkup1 = $('#checkup1').dxSelectBox({
                valueExpr: 'checkupContractSubTypeId',
                displayExpr: 'subTypeName',
                <c:if test="${checkupContractSubTypeId != null && centerId != null}">
                dataSource: response.data.find(function (v) {
                    return v.centerId === <c:out value="${centerId}"/>;
                }).hsubcontracts,
                value: <c:out value="${checkupContractSubTypeId}"/>,
                </c:if>
                onValueChanged: function (e) {
                    setCheckupItemList(1, e.value);
                }
            }).dxSelectBox('instance');
            let checkup2 = $('#checkup2').dxSelectBox({
                valueExpr: 'checkupContractSubTypeId',
                displayExpr: 'subTypeName',
                onValueChanged: function (e) {
                    setCheckupItemList(2, e.value);
                }
            }).dxSelectBox('instance');
            let checkup3 = $('#checkup3').dxSelectBox({
                valueExpr: 'checkupContractSubTypeId',
                displayExpr: 'subTypeName',
                onValueChanged: function (e) {
                    setCheckupItemList(3, e.value);
                }
            }).dxSelectBox('instance');

            $('#center1').dxSelectBox({
                dataSource: response.data,
                valueExpr: 'centerId',
                displayExpr: 'hospitalCenterName',
                <c:if test="${checkupContractSubTypeId != null && centerId != null}">
                value: <c:out value="${centerId}"/>,
                </c:if>
                onValueChanged: function (e) {
                    checkup1.option({
                        value: null,
                        dataSource: response.data.find(function (v) {
                            return v.centerId === e.value;
                        }).hsubcontracts,
                    });
                }
            });
            $('#center2').dxSelectBox({
                dataSource: response.data,
                valueExpr: 'centerId',
                displayExpr: 'hospitalCenterName',
                onValueChanged: function (e) {
                    checkup2.option({
                        value: null,
                        dataSource: response.data.find(function (v) {
                            return v.centerId === e.value;
                        }).hsubcontracts,
                    });
                }
            });
            $('#center3').dxSelectBox({
                dataSource: response.data,
                valueExpr: 'centerId',
                displayExpr: 'hospitalCenterName',
                onValueChanged: function (e) {
                    checkup3.option({
                        value: null,
                        dataSource: response.data.find(function (v) {
                            return v.centerId === e.value;
                        }).hsubcontracts,
                    });
                }
            });
        }
    });

    <c:if test="${checkupContractSubTypeId != null}">
    setCheckupItemList(1, <c:out value="${checkupContractSubTypeId}"/>);
    </c:if>
    $('.btn.retry_btn').on('click', function () {
        location.reload();
    });


    $('.arrange_area').on('click', function () {
        $(this).toggleClass('active').parents('.tr').toggleClass('active').find('.toogle_table').slideToggle(500);
    });

    $('.reserve_btn_box .btn').on('click', function () {
        let index = $(this).data('index');
        let centerId = $('#center' + index).dxSelectBox('instance').option('value');
        let checkupContractSubTypeId = $('#checkup' + index).dxSelectBox('instance').option('value');

        if (!centerId) { //병원선택
            Swal.fire('병원을 선택해 주세요.', '', 'warning');
            return;
        }

        if (!checkupContractSubTypeId) { //검진유형 선택
            Swal.fire('검진유형을 선택해 주세요.', '', 'warning');
            return;
        }

        //통과
        location.href = "ex_item_selection_package.html?" + $.param({
            reserveType: '<c:out value="${reserveType}"/>',
            userId: <c:out value="${userId}"/>,
            itemIds: '<c:out value="${itemIds}"/>',
            centerId: centerId,
            checkupContractSubTypeId: checkupContractSubTypeId,
        });
    });

    function setCheckupItemList(index, checkupContractSubTypeId) {
        $.ajax({
            url: '<c:url value="/us/checkup-register"/>',
            contentType: 'application/json',
            dataType: 'json',
            data: {
                checkupContractSubTypeId: checkupContractSubTypeId,
            }
        }).then(function (response) {
            $('.checkupClass' + index).empty();
            $('.checkupClass' + index + '.zero').html(0 + ' 개');
            $('.checkupItem' + index + ' i').removeClass('xi-check-circle-o').addClass('xi-close-circle-o');

            let itemA;
            let selectItem = false;
            if (response.data.length > 0) {
                response.data[0].checkupItemClasses.forEach(function (v) {
                    if (v.itemClassId === 1) {
                        itemA = true;
                    }
                });
                response.data.forEach(function (v) {
                    if (v.register === '1') {
                        v.checkupItemClasses.forEach(function (itemClass) {
                            if (itemClass.itemClassCode === 'F') {
                                let ul = $('#checkupClass' + index + '_' + itemClass.itemClassId + ' ul');
                                ul.empty();

                                itemClass.checkupItemCategories.forEach(function (itemCategory) {
                                    itemCategory.checkupItems.forEach(function (item) {
                                        ul.append('<li>- ' + item.itemName + '</li>');
                                    });
                                });
                            } else {
                                if (itemClass.itemClassCode === 'A') {
                                    $('#checkupClass' + index + '_' + itemClass.itemClassId).html(itemClass.itemCount ? '제공' : '미제공');
                                } else {
                                    if (itemA !== true) {
                                        $('#checkupClass' + index + '_1').html('미제공');
                                    }
                                    $('#checkupClass' + index + '_' + itemClass.itemClassId).html(itemClass.itemCount + ' 개');
                                }
                                itemClass.checkupItemCategories.forEach(function (itemCategory) {
                                    itemCategory.checkupItems.forEach(function (item) {
                                        $('#checkupItem' + index + '_' + item.itemId + ' i').removeClass('xi-close-circle-o').addClass('xi-check-circle-o');
                                    });
                                });
                            }
                        });
                    } else {
                        selectItem = true;

                        let ul = $('#checkupClass' + index + '_' + (v.register === '2' ? 'ADD' : v.register) + ' ul');
                        ul.empty();

                        v.checkupItemClasses.forEach(function (itemClass) {
                            itemClass.checkupItemCategories.forEach(function (itemCategory) {
                                itemCategory.checkupItems.forEach(function (item) {
                                    ul.append('<li>- ' + item.itemName + '</li>');
                                });
                            });
                        });

                        if (v.register !== '2') {
                            $('#checkupClass' + index + '_' + v.register + '_count').html('(' + v.selectCount + ')');
                        }
                    }
                });
            }

            // 기본항목
            $('.basicItemCategory:has(i.xi-check-circle-o)').show();
            $('.basicItemCategory:not(:has(i.xi-check-circle-o))').hide();
            $('.basicItem:has(i.xi-check-circle-o)').show();
            $('.basicItem:not(:has(i.xi-check-circle-o))').hide();

            // 특수장비 검사
            if ($('.basicItemClassF ul:empty').length === 3) {
                $('.basicItemClassF').hide();
            } else {
                $('.basicItemClassF').show();
            }

            // 선택검사
            if (!selectItem) {
                $('.select_item').hide();
            } else {
                if ($('.selectA ul:empty').length === 3) {
                    $('.selectA').hide();
                } else {
                    $('.selectA').show();
                }
                if ($('.selectB ul:empty').length === 3) {
                    $('.selectB').hide();
                } else {
                    $('.selectB').show();
                }
                if ($('.selectC ul:empty').length === 3) {
                    $('.selectC').hide();
                } else {
                    $('.selectC').show();
                }
                if ($('.selectD ul:empty').length === 3) {
                    $('.selectD').hide();
                } else {
                    $('.selectD').show();
                }
                if ($('.selectE ul:empty').length === 3) {
                    $('.selectE').hide();
                } else {
                    $('.selectE').show();
                }
                if ($('.selectF ul:empty').length === 3) {
                    $('.selectF').hide();
                } else {
                    $('.selectF').show();
                }

                // 추가검사
                if ($('.selectADD ul:empty').length === 3) {
                    $('.selectADD').hide();
                } else {
                    $('.selectADD').show();
                }

                $('.select_item').show();
            }
        });
    }


    $('#search').on('keyup', function (e) {
        var search_val = $(this).val();
        var search_val_length = $(this).val().length;

        if (search_val_length < 1) { //적은 단어가 1개 이하일때 (하나도없을때)
            $('.main_table').show();
            $('.main_table > .tbody > .tr').show();
        } else if (search_val_length > 0) {//적은 단어가 0개 이상일때 (하나라도 있을때)
            $('.main_table').hide();
            $('.main_table > .tbody > .tr').hide();

            $('.table.main_table .tbody .left_area_inner:contains("' + search_val + '")').parents(".main_table").show();
            $('.table.main_table .tbody .left_area_inner:contains("' + search_val + '")').parents(".tr").show();

            $('.toogle_table .tbody .left_area:contains("' + search_val + '")').parents(".main_table").show();
            $('.toogle_table .tbody .left_area:contains("' + search_val + '")').parents(".tr").show();

            $('.table.main_table .tbody .td ul li:contains("' + search_val + '")').parents(".main_table").show();
            $('.table.main_table .tbody .td ul li:contains("' + search_val + '")').parents(".tr").show();
        }
    });//keyup


</script>
</body>
</html>
