<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=yes">
    <title>건강살자(사용자) 병원 및 항목 선택</title>
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
    <link href="../css/us/checkup_selection.css" rel="stylesheet" type="text/css">

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
                <div class="selection_wrap">
                    <connection from=".checkup_bg_btn.brain .connection_circle" to=".position_btn.brain"></connection>
                    <!--뇌-->
                    <connection from=".checkup_bg_btn.carotid_artery .connection_circle"
                                to=".position_btn.carotid_artery"></connection> <!--경동맥-->
                    <connection from=".checkup_bg_btn.cervical_vertebrae .connection_circle"
                                to=".position_btn.cervical_vertebrae"></connection> <!--경추-->
                    <connection from=".checkup_bg_btn.thyroid_gland .connection_circle"
                                to=".position_btn.thyroid_gland"></connection> <!--갑상선-->
                    <connection from=".checkup_bg_btn.shoulder .connection_circle"
                                to=".position_btn.shoulder"></connection> <!--어깨-->
                    <connection from=".checkup_bg_btn.heart .connection_circle" to=".position_btn.heart"></connection>
                    <!--심장-->
                    <connection from=".checkup_bg_btn.breast .connection_circle" to=".position_btn.breast"></connection>
                    <!--유방-->
                    <connection from=".checkup_bg_btn.lung .connection_circle" to=".position_btn.lung"></connection>
                    <!--폐-->
                    <connection from=".checkup_bg_btn.stomach .connection_circle"
                                to=".position_btn.stomach"></connection> <!--위-->
<%--                    <connection from=".checkup_bg_btn.liver .connection_circle" to=".position_btn.liver"></connection>--%>
                    <!--간-->
                    <connection from=".checkup_bg_btn.abdomen .connection_circle"
                                to=".position_btn.abdomen"></connection> <!--복부-->

<%--                    <connection from=".checkup_bg_btn.gall_bladder .connection_circle"--%>
<%--                                to=".position_btn.gall_bladder"></connection> <!--담낭-->--%>

                    <connection from=".checkup_bg_btn.pelvis .connection_circle" to=".position_btn.pelvis"></connection>
                    <!--골반-->

<%--                    <connection from=".checkup_bg_btn.kidney .connection_circle" to=".position_btn.kidney"></connection>--%>
<%--                    <!--신장-->--%>

                    <connection from=".checkup_bg_btn.large_intestine .connection_circle"
                                to=".position_btn.large_intestine"></connection> <!--대장-->

<%--                    <connection from=".checkup_bg_btn.spleen .connection_circle" to=".position_btn.spleen"></connection>--%>
<%--                    <!--비장-->--%>

                    <connection from=".checkup_bg_btn.uterus .connection_circle" to=".position_btn.uterus"></connection>
                    <!--자궁-->


<%--                    <connection from=".checkup_bg_btn.pancreas .connection_circle"--%>
<%--                                to=".position_btn.pancreas"></connection> <!--췌장-->--%>

                    <connection from=".checkup_bg_btn.knee .connection_circle" to=".position_btn.knee"></connection>
                    <!--무릎-->
                    <connection from=".checkup_bg_btn.vertebrae_lumbales .connection_circle"
                                to=".position_btn.vertebrae_lumbales"></connection> <!--요추-->

                    <div class="selection_area">
                        <div class="img_wrap">
                            <div class="body_parts_btn left_area">
                                <div class="checkup_bg_btn brain" data-body-parts="brain">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_sky_blue"></div>
                                    <div class="checkup_txt_btn">뇌</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>


                                <div class="checkup_bg_btn cervical_vertebrae" data-body-parts="cervical_vertebrae">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_sky_blue"></div>
                                    <div class="checkup_txt_btn">경추</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>


                                <div class="checkup_bg_btn shoulder" data-body-parts="shoulder">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_red"></div>
                                    <div class="checkup_txt_btn">어깨</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>

                                <div class="checkup_bg_btn lung" data-body-parts="lung">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_red"></div>
                                    <div class="checkup_txt_btn">폐</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>

<%--                                <div class="checkup_bg_btn liver" data-body-parts="liver">--%>
<%--                                    <span class="connection_circle"></span>--%>
<%--                                    <div class="checkup_color_btn bg_yellow"></div>--%>
<%--                                    <div class="checkup_txt_btn">간</div>--%>

<%--                                    <label class="success_check path">--%>
<%--                                        <input type="checkbox">--%>
<%--                                        <svg viewBox="0 0 21 21">--%>
<%--                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>--%>
<%--                                        </svg>--%>
<%--                                    </label>--%>
<%--                                </div>--%>

                                <div class="checkup_bg_btn stomach" data-body-parts="stomach">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_green"></div>
                                    <div class="checkup_txt_btn">위</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>

                                <div class="checkup_bg_btn abdomen" data-body-parts="abdomen">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_green"></div>
                                    <div class="checkup_txt_btn">복부</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>


<%--                                <div class="checkup_bg_btn gall_bladder" data-body-parts="gall_bladder">--%>
<%--                                    <span class="connection_circle"></span>--%>
<%--                                    <div class="checkup_color_btn bg_yellow"></div>--%>
<%--                                    <div class="checkup_txt_btn">담낭</div>--%>

<%--                                    <label class="success_check path">--%>
<%--                                        <input type="checkbox">--%>
<%--                                        <svg viewBox="0 0 21 21">--%>
<%--                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>--%>
<%--                                        </svg>--%>
<%--                                    </label>--%>
<%--                                </div>--%>

<%--                                <div class="checkup_bg_btn kidney" data-body-parts="kidney">--%>
<%--                                    <span class="connection_circle"></span>--%>
<%--                                    <div class="checkup_color_btn bg_yellow"></div>--%>
<%--                                    <div class="checkup_txt_btn">신장</div>--%>

<%--                                    <label class="success_check path">--%>
<%--                                        <input type="checkbox">--%>
<%--                                        <svg viewBox="0 0 21 21">--%>
<%--                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>--%>
<%--                                        </svg>--%>
<%--                                    </label>--%>
<%--                                </div>--%>


<%--                                <div class="checkup_bg_btn spleen" data-body-parts="spleen">--%>
<%--                                    <span class="connection_circle"></span>--%>
<%--                                    <div class="checkup_color_btn bg_yellow"></div>--%>
<%--                                    <div class="checkup_txt_btn">비장</div>--%>

<%--                                    <label class="success_check path">--%>
<%--                                        <input type="checkbox">--%>
<%--                                        <svg viewBox="0 0 21 21">--%>
<%--                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>--%>
<%--                                        </svg>--%>
<%--                                    </label>--%>
<%--                                </div>--%>

<%--                                <div class="checkup_bg_btn pancreas" data-body-parts="pancreas">--%>
<%--                                    <span class="connection_circle"></span>--%>
<%--                                    <span class="connection_circle"></span>--%>
<%--                                    <div class="checkup_color_btn bg_yellow"></div>--%>
<%--                                    <div class="checkup_txt_btn">췌장</div>--%>

<%--                                    <label class="success_check path">--%>
<%--                                        <input type="checkbox">--%>
<%--                                        <svg viewBox="0 0 21 21">--%>
<%--                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>--%>
<%--                                        </svg>--%>
<%--                                    </label>--%>
<%--                                </div>--%>

                                <div class="checkup_bg_btn vertebrae_lumbales" data-body-parts="vertebrae_lumbales">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_grey"></div>
                                    <div class="checkup_txt_btn">요추</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>
                            </div><!--left_area-->


                            <div class="middle_area">
                                <img src="../img/us/checkup_selection/checkup_selection_bg_female.jpg" alt="여자">

                                <div class="bg_btn position_btn brain" data-body-parts="brain">
                                    <div class="color_btn bg_sky_blue"></div>
                                </div><!--뇌-->

                                <div class="bg_btn position_btn carotid_artery" data-body-parts="carotid_artery">
                                    <div class="color_btn bg_sky_blue"></div>
                                </div><!--경동맥-->

                                <div class="bg_btn position_btn cervical_vertebrae"
                                     data-body-parts="cervical_vertebrae">
                                    <div class="color_btn bg_sky_blue"></div>
                                </div><!--경추-->

                                <div class="bg_btn position_btn thyroid_gland" data-body-parts="thyroid_gland">
                                    <div class="color_btn bg_sky_blue"></div>
                                </div><!--갑상선-->

                                <div class="bg_btn position_btn shoulder" data-body-parts="shoulder">
                                    <div class="color_btn bg_red"></div>
                                </div><!--어깨-->

                                <div class="bg_btn position_btn heart" data-body-parts="heart">
                                    <div class="color_btn bg_red"></div>
                                </div><!--심장-->

                                <div class="bg_btn position_btn breast" data-body-parts="breast">
                                    <div class="color_btn bg_red"></div>
                                </div><!--유방-->

                                <div class="bg_btn position_btn lung" data-body-parts="lung">
                                    <div class="color_btn bg_red"></div>
                                </div><!--폐-->

                                <div class="bg_btn position_btn stomach" data-body-parts="stomach">
                                    <div class="color_btn bg_green"></div>
                                </div><!--위-->

<%--                                <div class="bg_btn position_btn liver" data-body-parts="liver">--%>
<%--                                    <div class="color_btn bg_yellow"></div>--%>
<%--                                </div><!--간-->--%>

                                <div class="bg_btn position_btn abdomen" data-body-parts="abdomen">
                                    <div class="color_btn bg_green"></div>
                                </div><!--복부-->

<%--                                <div class="bg_btn position_btn gall_bladder" data-body-parts="gall_bladder">--%>
<%--                                    <div class="color_btn bg_yellow"></div>--%>
<%--                                </div><!--담낭-->--%>

                                <div class="bg_btn position_btn pelvis" data-body-parts="pelvis">
                                    <div class="color_btn bg_green"></div>
                                </div><!--골반-->

<%--                                <div class="bg_btn position_btn kidney" data-body-parts="kidney">--%>
<%--                                    <div class="color_btn bg_yellow"></div>--%>
<%--                                </div><!--신장-->--%>

                                <div class="bg_btn position_btn large_intestine" data-body-parts="large_intestine">
                                    <div class="color_btn bg_green"></div>
                                </div><!--대장-->

<%--                                <div class="bg_btn position_btn spleen" data-body-parts="spleen">--%>
<%--                                    <div class="color_btn bg_yellow"></div>--%>
<%--                                </div><!--비장-->--%>

                                <div class="bg_btn position_btn uterus" data-body-parts="uterus">
                                    <div class="color_btn bg_green"></div>
                                </div><!--자궁-->

<%--                                <div class="bg_btn position_btn pancreas" data-body-parts="pancreas">--%>
<%--                                    <div class="color_btn bg_yellow"></div>--%>
<%--                                </div><!--췌장-->--%>

                                <div class="bg_btn position_btn knee" data-body-parts="knee">
                                    <div class="color_btn bg_grey"></div>
                                </div><!--무릎-->

                                <div class="bg_btn position_btn vertebrae_lumbales"
                                     data-body-parts="vertebrae_lumbales">
                                    <div class="color_btn bg_grey"></div>
                                </div><!--요추-->

                            </div><!--middle_area-->


                            <div class="body_parts_btn right_area">
                                <div class="checkup_bg_btn carotid_artery" data-body-parts="carotid_artery">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_sky_blue"></div>
                                    <div class="checkup_txt_btn">경동맥</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>


                                <div class="checkup_bg_btn thyroid_gland" data-body-parts="thyroid_gland">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_sky_blue"></div>
                                    <div class="checkup_txt_btn">갑상선</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>


                                <div class="checkup_bg_btn heart" data-body-parts="heart">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_red"></div>
                                    <div class="checkup_txt_btn">심장</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>

                                <div class="checkup_bg_btn breast" data-body-parts="breast">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_red"></div>
                                    <div class="checkup_txt_btn">유방</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>




                                <div class="checkup_bg_btn pelvis" data-body-parts="pelvis">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_green"></div>
                                    <div class="checkup_txt_btn">골반</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>

                                <div class="checkup_bg_btn large_intestine" data-body-parts="large_intestine">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_green"></div>
                                    <div class="checkup_txt_btn">대장</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>

                                <div class="checkup_bg_btn uterus" data-body-parts="uterus">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_green"></div>
                                    <div class="checkup_txt_btn">자궁</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>

                                <div class="checkup_bg_btn knee" data-body-parts="knee">
                                    <span class="connection_circle"></span>
                                    <div class="checkup_color_btn bg_grey"></div>
                                    <div class="checkup_txt_btn">무릎</div>

                                    <label class="success_check path">
                                        <input type="checkbox">
                                        <svg viewBox="0 0 21 21">
                                            <path d="M5,10.75 L8.5,14.25 L19.4,2.3 C18.8333333,1.43333333 18.0333333,1 17,1 L4,1 C2.35,1 1,2.35 1,4 L1,17 C1,18.65 2.35,20 4,20 L17,20 C18.65,20 20,18.65 20,17 L20,7.99769186"></path>
                                        </svg>
                                    </label>
                                </div>
                            </div><!--right_area-->

                        </div>
                        <p class="noti">※ 검진을 원하시는 부위가 보이지 않을 경우 키워드 검색도 가능합니다.</p>
                    </div>
                    <div class="selection_form">
                        <div class="search_area">
                            <div class="row">
                                <div class="col-md-2 tag_name">
                                    <span>검사항목 검색</span>
                                </div>
                                <div class="col-md-8">
                                    <div class="search_box_area write">
                                        <div class="input_type1">
                                            <label for="search">
                                                <input type="text" name="text" id="search" placeholder="&nbsp;">
                                                <span class="label">검색하실 단어를 입력해 주세요.</span>
                                            </label>
                                        </div>
                                    </div><!--search_box-->
                                </div>
                                <div class="col-md-2">
                                    <div class="btn search_btn">
                                        <span class="button_on_circle"></span>
                                        <a class="btn_inner point_color">
                                                      <span class="btn_txt_area">
                                                        검색 <i class="xi-search"></i>
                                                      </span>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div><!--search_area-->

                        <div class="resert_area">

                            <div class="select_option">
                                <div class="list_title">검사항목 리스트</div>
                                <div class="option_list">
                                    <div class="empty_text">좌측 그림에서 검진을 원하시는 항목에 버튼을 클릭하세요.</div>
                                    <div class="list brain" data-body-parts="brain"></div><!--뇌-->
                                    <div class="list carotid_artery" data-body-parts="carotid_artery"></div><!--경동맥-->
                                    <div class="list cervical_vertebrae" data-body-parts="cervical_vertebrae"></div>
                                    <!--경추-->
                                    <div class="list thyroid_gland" data-body-parts="thyroid_gland"></div><!--갑상선-->
                                    <div class="list shoulder" data-body-parts="shoulder"></div><!--어깨-->
                                    <div class="list heart" data-body-parts="heart"></div><!--심장-->
                                    <div class="list breast" data-body-parts="breast"></div><!--유방-->
                                    <div class="list lung" data-body-parts="lung"></div><!--폐-->
                                    <div class="list stomach" data-body-parts="stomach"></div><!--위-->
<%--                                    <div class="list liver" data-body-parts="liver"></div><!--간-->--%>
                                    <div class="list abdomen" data-body-parts="abdomen"></div><!--복부-->
                                    <div class="list gall_bladder" data-body-parts="gall_bladder"></div><!--담낭-->
                                    <div class="list pelvis" data-body-parts="pelvis"></div><!--골반-->
                                    <div class="list kidney" data-body-parts="kidney"></div><!--신장-->
                                    <div class="list large_intestine" data-body-parts="large_intestine"></div><!--대장-->
                                    <div class="list spleen" data-body-parts="spleen"></div><!--비장-->
                                    <div class="list uterus" data-body-parts="uterus"></div><!--자궁-->
                                    <div class="list pancreas" data-body-parts="pancreas"></div><!--췌장-->
                                    <div class="list knee" data-body-parts="knee"></div><!--무릎-->
                                    <div class="list vertebrae_lumbales" data-body-parts="vertebrae_lumbales"></div>
                                    <!--요추-->
                                </div>
                            </div>

                            <div class="select_option_info">
                                <p>
                                    고객님, 선택하신 검사 항목은 <br>
                                    <span class="select_option_name_area">
                                    </span>
                                    입니다.
                                </p>
                            </div>

                            <p class="noti">※ 원하시는 검사 항목은 최대 2개 선택 가능합니다.</p>
                            <div class="btn_type2">
                                <div class="btn_area">
                                    <div class="btn checkup_select_btn">
                                        <span class="button_on_circle"></span>
                                        <a href="#" class="btn_inner blue_gradient">
                                          <span class="btn_txt_area">
                                            선택 항목 패키지 반영하기
                                          </span>
                                        </a>
                                    </div>
                                </div>

                                <div class="btn_area">
                                    <div class="btn cancle_btn">
                                        <span class="button_on_circle"></span>
                                        <a href="reserve.html?userId=<c:out value="${userId}"/>" class="btn_inner grey">
                                          <span class="btn_txt_area">
                                            처음으로 돌아가기
                                          </span>
                                        </a>
                                    </div>
                                </div>
                            </div>

                        </div><!--resert_area-->

                    </div><!--selection_form-->
                </div><!--selection_wrap-->

            </div><!--container-->


        </div><!--main_cont-->
    </section><!--main_section-->

</main>

<div class="selection_button_fixed_mob">
    <div>항목 선택화면으로 <i class="xi-arrow-top"></i></div>
</div>

<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.5.0/lodash.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="../js/us/custom_select.js"></script>
<script src="../js/us/connection_button.js"></script>
<script src="../js/us/sub_common.js"></script>
<script>

    $("header").load("header.html");
    $("footer").load("footer.html");

    $(".checkup_bg_btn").click(function () {


        $(this).toggleClass("select");


        var selected_length = $(this).parents(".img_wrap").find(".checkup_bg_btn.select").length;
        var btn_name = $(this).attr("data-body-parts");

        //검색화면 초기화
        $('.select_option .option_list .list .chk_boxArea').show();
        $(".select_option .option_list .list").removeClass("select");
        $('#search').val('');

        //클릭시 나오는 모션
        $(".select_option .option_list .list." + btn_name + "").toggleClass("select");
        $(".selection_area .position_btn").removeClass("select");
        $(".selection_area .position_btn." + btn_name + "").addClass("select");


        if (selected_length < 1) {
            //한개도 없을시
            $(this).removeClass("select");
            $(".select_option .option_list .list").removeClass("select");
            $(".select_option .empty_text").removeClass("select");
            $(".selection_area .position_btn").removeClass("select");
        } else if (selected_length > 1) {
            //클릭해서 1개이상일시
            $(this).parents(".img_wrap").find(".checkup_bg_btn").removeClass("select");
            $(this).addClass("select");
            $(".select_option .option_list .list").removeClass("select");
            $(".select_option .option_list .list." + btn_name + "").addClass("select");
            $(".select_option .empty_text").addClass("select");
            $(".selection_area .position_btn." + btn_name + "").addClass("select");
        } else {
            //클릭시
            $(this).addClass("select");
            $(".select_option .option_list .list." + btn_name + "").addClass("select");
            $(".select_option .empty_text").addClass("select");

        }

    })


    $(".position_btn").click(function () {

        $(".select_option .option_list .list").removeClass("select")
        $(this).toggleClass("select");

        var selected_length = $(this).parents(".middle_area").find(".position_btn.select").length;
        var btn_name = $(this).attr("data-body-parts");


        $(".checkup_bg_btn." + btn_name + "").toggleClass("select");

        if (selected_length < 1) {
            //한개도 없을시
            $(".position_btn").removeClass("select");
            $(".select_option .option_list .list").removeClass("select");
            $(".select_option .empty_text").removeClass("select");

            (".checkup_bg_btn").removeClass("select")

        } else if (selected_length > 1) {
            //클릭해서 1개이상일시

            $(".position_btn").removeClass("select");
            $(this).addClass("select");
            $(".select_option .option_list .list").removeClass("select");
            $(".select_option .option_list .list." + btn_name + "").addClass("select");
            $(".select_option .empty_text").addClass("select");

            $(".checkup_bg_btn").removeClass("select");
            $(".checkup_bg_btn." + btn_name + "").addClass("select");
        } else {
            //클릭시
            $(".position_btn").removeClass("select");
            $(this).addClass("select");
            $(".select_option .option_list .list." + btn_name + "").addClass("select");
            $(".select_option .empty_text").addClass("select");

            $(".checkup_bg_btn").removeClass("select");
            $(".checkup_bg_btn." + btn_name + "").addClass("select");
        }

    })

    $("document").ready(function () {


        //뇌
        for (i = 1; i <= 8; i++) {
            $('.select_option .option_list .brain').append('<div class="chk_boxArea"><label class="cbx-lbl"for="brain_' + i + '"><span class="list_dot"></span></label><label class="item"for="brain_' + i + '"><input type="checkbox"name="brain_' + i + '"id="brain_' + i + '"class="hidden"value=""><label class="cbx"for="brain_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }

        //경동맥
        for (i = 1; i <= 1; i++) {
            $('.select_option .option_list .carotid_artery').append('<div class="chk_boxArea"><label class="cbx-lbl"for="carotid_artery_' + i + '"><span class="list_dot"></span></label><label class="item"for="carotid_artery_' + i + '"><input type="checkbox"name="carotid_artery_' + i + '"id="carotid_artery_' + i + '"class="hidden"value=""><label class="cbx"for="carotid_artery_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }

        //경추
        for (i = 1; i <= 4; i++) {
            $('.select_option .option_list .cervical_vertebrae').append('<div class="chk_boxArea"><label class="cbx-lbl"for="cervical_vertebrae_' + i + '"><span class="list_dot"></span></label><label class="item"for="cervical_vertebrae_' + i + '"><input type="checkbox"name="cervical_vertebrae_' + i + '"id="cervical_vertebrae_' + i + '"class="hidden"value=""><label class="cbx"for="cervical_vertebrae_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }

        //갑상선
        for (i = 1; i <= 1; i++) {
            $('.select_option .option_list .thyroid_gland').append('<div class="chk_boxArea"><label class="cbx-lbl"for="thyroid_gland_' + i + '"><span class="list_dot"></span></label><label class="item"for="thyroid_gland_' + i + '"><input type="checkbox"name="thyroid_gland_' + i + '"id="thyroid_gland_' + i + '"class="hidden"value=""><label class="cbx"for="thyroid_gland_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }

        //어깨
        for (i = 1; i <= 1; i++) {
            $('.select_option .option_list .shoulder').append('<div class="chk_boxArea"><label class="cbx-lbl"for="shoulder_' + i + '"><span class="list_dot"></span></label><label class="item"for="shoulder_' + i + '"><input type="checkbox"name="shoulder_' + i + '"id="shoulder_' + i + '"class="hidden"value=""><label class="cbx"for="shoulder_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }

        //심장
        for (i = 1; i <= 6; i++) {
            $('.select_option .option_list .heart').append('<div class="chk_boxArea"><label class="cbx-lbl"for="heart_' + i + '"><span class="list_dot"></span></label><label class="item"for="heart_' + i + '"><input type="checkbox"name="heart_' + i + '"id="heart_' + i + '"class="hidden"value=""><label class="cbx"for="heart_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }

        //폐
        for (i = 1; i <= 3; i++) {
            $('.select_option .option_list .lung').append('<div class="chk_boxArea"><label class="cbx-lbl"for="lung_' + i + '"><span class="list_dot"></span></label><label class="item"for="lung_' + i + '"><input type="checkbox"name="lung_' + i + '"id="lung_' + i + '"class="hidden"value=""><label class="cbx"for="lung_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }

        //유방
        for (i = 1; i <= 2; i++) {
            $('.select_option .option_list .breast').append('<div class="chk_boxArea"><label class="cbx-lbl"for="breast_' + i + '"><span class="list_dot"></span></label><label class="item"for="breast_' + i + '"><input type="checkbox"name="breast_' + i + '"id="breast_' + i + '"class="hidden"value=""><label class="cbx"for="breast_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }

        //위
        for (i = 1; i <= 3; i++) {
            $('.select_option .option_list .stomach').append('<div class="chk_boxArea"><label class="cbx-lbl"for="stomach_' + i + '"><span class="list_dot"></span></label><label class="item"for="stomach_' + i + '"><input type="checkbox"name="stomach_' + i + '"id="stomach_' + i + '"class="hidden"value=""><label class="cbx"for="stomach_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }


        // //간
        // for (i = 1; i <= 3; i++) {
        //     $('.select_option .option_list .liver').append('<div class="chk_boxArea"><label class="cbx-lbl"for="liver_' + i + '"><span class="list_dot"></span></label><label class="item"for="liver_' + i + '"><input type="checkbox"name="liver_' + i + '"id="liver_' + i + '"class="hidden"value=""><label class="cbx"for="liver_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        // }

        //복부
        for (i = 1; i <= 6; i++) {
            $('.select_option .option_list .abdomen').append('<div class="chk_boxArea"><label class="cbx-lbl"for="abdomen_' + i + '"><span class="list_dot"></span></label><label class="item"for="abdomen_' + i + '"><input type="checkbox"name="abdomen_' + i + '"id="abdomen_' + i + '"class="hidden"value=""><label class="cbx"for="abdomen_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }

        // //담낭
        // for (i = 1; i <= 1; i++) {
        //     $('.select_option .option_list .gall_bladder').append('<div class="chk_boxArea"><label class="cbx-lbl"for="gall_bladder_' + i + '"><span class="list_dot"></span></label><label class="item"for="gall_bladder_' + i + '"><input type="checkbox"name="gall_bladder_' + i + '"id="gall_bladder_' + i + '"class="hidden"value=""><label class="cbx"for="gall_bladder_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        // }


        //골반
        for (i = 1; i <= 1; i++) {
            $('.select_option .option_list .pelvis').append('<div class="chk_boxArea"><label class="cbx-lbl"for="pelvis_' + i + '"><span class="list_dot"></span></label><label class="item"for="pelvis_' + i + '"><input type="checkbox"name="pelvis_' + i + '"id="pelvis_' + i + '"class="hidden"value=""><label class="cbx"for="pelvis_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }

        // //신장
        // for (i = 1; i <= 1; i++) {
        //     $('.select_option .option_list .kidney').append('<div class="chk_boxArea"><label class="cbx-lbl"for="kidney_' + i + '"><span class="list_dot"></span></label><label class="item"for="kidney_' + i + '"><input type="checkbox"name="kidney_' + i + '"id="kidney_' + i + '"class="hidden"value=""><label class="cbx"for="kidney_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        // }


        //대장
        for (i = 1; i <= 4; i++) {
            $('.select_option .option_list .large_intestine').append('<div class="chk_boxArea"><label class="cbx-lbl"for="large_intestine_' + i + '"><span class="list_dot"></span></label><label class="item"for="large_intestine_' + i + '"><input type="checkbox"name="large_intestine_' + i + '"id="large_intestine_' + i + '"class="hidden"value=""><label class="cbx"for="large_intestine_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }


        // //비장
        // for (i = 1; i <= 1; i++) {
        //     $('.select_option .option_list .spleen').append('<div class="chk_boxArea"><label class="cbx-lbl"for="spleen_' + i + '"><span class="list_dot"></span></label><label class="item"for="spleen_' + i + '"><input type="checkbox"name="spleen_' + i + '"id="spleen_' + i + '"class="hidden"value=""><label class="cbx"for="spleen_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        // }


        //자궁
        for (i = 1; i <= 4; i++) {
            $('.select_option .option_list .uterus').append('<div class="chk_boxArea"><label class="cbx-lbl"for="uterus_' + i + '"><span class="list_dot"></span></label><label class="item"for="uterus_' + i + '"><input type="checkbox"name="uterus_' + i + '"id="uterus_' + i + '"class="hidden"value=""><label class="cbx"for="uterus_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }


        // //췌장
        // for (i = 1; i <= 1; i++) {
        //     $('.select_option .option_list .pancreas').append('<div class="chk_boxArea"><label class="cbx-lbl"for="pancreas_' + i + '"><span class="list_dot"></span></label><label class="item"for="pancreas_' + i + '"><input type="checkbox"name="pancreas_' + i + '"id="pancreas_' + i + '"class="hidden"value=""><label class="cbx"for="pancreas_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        // }

        //무릎
        for (i = 1; i <= 1; i++) {
            $('.select_option .option_list .knee').append('<div class="chk_boxArea"><label class="cbx-lbl"for="knee_' + i + '"><span class="list_dot"></span></label><label class="item"for="knee_' + i + '"><input type="checkbox"name="knee_' + i + '"id="knee_' + i + '"class="hidden"value=""><label class="cbx"for="knee_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }

        //요추
        for (i = 1; i <= 5; i++) {
            $('.select_option .option_list .vertebrae_lumbales').append('<div class="chk_boxArea"><label class="cbx-lbl"for="vertebrae_lumbales_' + i + '"><span class="list_dot"></span></label><label class="item"for="vertebrae_lumbales_' + i + '"><input type="checkbox"name="vertebrae_lumbales_' + i + '"id="vertebrae_lumbales_' + i + '"class="hidden"value=""><label class="cbx"for="vertebrae_lumbales_' + i + '"><svg height="20px"viewBox="-1 -7 20 30"width="20px"><polyline points="1 7.6 5 11 13 1"></polyline></svg></label></label></div>');
        }

        //뇌 시작
        $(".select_option .brain .chk_boxArea:nth-child(1) input").val("뇌혈류초음파").data('itemId', 187);
        $(".select_option .brain .chk_boxArea:nth-child(1) .cbx-lbl").append("뇌혈류초음파");
        $(".select_option .brain .chk_boxArea:nth-child(2) input").val("뇌(머리)CT").data('itemId', 194);
        $(".select_option .brain .chk_boxArea:nth-child(2) .cbx-lbl").append("뇌(머리)CT");
        $(".select_option .brain .chk_boxArea:nth-child(3) input").val("뇌혈관CT").data('itemId', 196);
        $(".select_option .brain .chk_boxArea:nth-child(3) .cbx-lbl").append("뇌혈관CT");
        $(".select_option .brain .chk_boxArea:nth-child(4) input").val("뇌MRI").data('itemId', 210);
        $(".select_option .brain .chk_boxArea:nth-child(4) .cbx-lbl").append("뇌MRI");
        $(".select_option .brain .chk_boxArea:nth-child(5) input").val("뇌MRI-T2").data('itemId', 211);
        $(".select_option .brain .chk_boxArea:nth-child(5) .cbx-lbl").append("뇌MRI-T2");
        $(".select_option .brain .chk_boxArea:nth-child(6) input").val("뇌혈관MRA").data('itemId', 212);
        $(".select_option .brain .chk_boxArea:nth-child(6) .cbx-lbl").append("뇌혈관MRA");
        $(".select_option .brain .chk_boxArea:nth-child(7) input").val("뇌MRA-T2").data('itemId', 213);
        $(".select_option .brain .chk_boxArea:nth-child(7) .cbx-lbl").append("뇌MRA-T2");
        $(".select_option .brain .chk_boxArea:nth-child(8) input").val("뇌MRI+뇌MRA").data('itemId', 214);
        $(".select_option .brain .chk_boxArea:nth-child(8) .cbx-lbl").append("뇌MRI+뇌MRA");
        //뇌 끝

        //경추 시작
        $(".select_option .cervical_vertebrae .chk_boxArea:nth-child(1) input").val("경추X-선촬영").data('itemId', 159);
        $(".select_option .cervical_vertebrae .chk_boxArea:nth-child(1) .cbx-lbl").append("경추X-선촬영");
        $(".select_option .cervical_vertebrae .chk_boxArea:nth-child(2) input").val("경추(목)CT").data('itemId', 199);
        $(".select_option .cervical_vertebrae .chk_boxArea:nth-child(2) .cbx-lbl").append("경추(목)CT");
        $(".select_option .cervical_vertebrae .chk_boxArea:nth-child(3) input").val("경추(목)MRI").data('itemId', 215);
        $(".select_option .cervical_vertebrae .chk_boxArea:nth-child(3) .cbx-lbl").append("경추(목)MRI");
        $(".select_option .cervical_vertebrae .chk_boxArea:nth-child(4) input").val("경추MRI-T2").data('itemId', 216);
        $(".select_option .cervical_vertebrae .chk_boxArea:nth-child(4) .cbx-lbl").append("경추MRI-T2");
        //경추 끝

        //어깨 시작
        $(".select_option .shoulder .chk_boxArea:nth-child(1) input").val("견관절(어깨)MRI (좌, 우 중 1부위)").data('itemId', 219);
        $(".select_option .shoulder .chk_boxArea:nth-child(1) .cbx-lbl").append("견관절(어깨)MRI (좌, 우 중 1부위)");
        //어깨 끝

        //폐 시작
        $(".select_option .lung .chk_boxArea:nth-child(1) input").val("폐기능 검사").data('itemId', 155);
        $(".select_option .lung .chk_boxArea:nth-child(1) .cbx-lbl").append("폐기능 검사");
        $(".select_option .lung .chk_boxArea:nth-child(2) input").val("흉부X-선 촬영").data('itemId', 156);
        $(".select_option .lung .chk_boxArea:nth-child(2) .cbx-lbl").append("흉부X-선 촬영");
        $(".select_option .lung .chk_boxArea:nth-child(3) input").val("흉부(폐)CT").data('itemId', 197);
        $(".select_option .lung .chk_boxArea:nth-child(3) .cbx-lbl").append("흉부(폐)CT");
        //폐 끝

        // //간 시작
        // $(".select_option .liver .chk_boxArea:nth-child(1) input").val("간MRI").data('itemId', 225);
        // $(".select_option .liver .chk_boxArea:nth-child(1) .cbx-lbl").append("간MRI");
        // $(".select_option .liver .chk_boxArea:nth-child(2) input").val("지방간MRI").data('itemId', 227);
        // $(".select_option .liver .chk_boxArea:nth-child(2) .cbx-lbl").append("지방간MRI");
        // $(".select_option .liver .chk_boxArea:nth-child(3) input").val("췌장MRI").data('itemId', 229);
        // $(".select_option .liver .chk_boxArea:nth-child(3) .cbx-lbl").append("췌장MRI");
        //간 끝


        // //담낭 시작
        // $(".select_option .gall_bladder .chk_boxArea:nth-child(1) input").val("상복부초음파").data('itemId', 175);
        // $(".select_option .gall_bladder .chk_boxArea:nth-child(1) .cbx-lbl").append("상복부초음파");
        // //담낭 끝
        //
        // //신장 시작
        // $(".select_option .kidney .chk_boxArea:nth-child(1) input").val("상복부초음파").data('itemId', 175);
        // $(".select_option .kidney .chk_boxArea:nth-child(1) .cbx-lbl").append("상복부초음파");
        // //신장 끝
        //
        // //비장 시작
        // $(".select_option .spleen .chk_boxArea:nth-child(1) input").val("상복부초음파").data('itemId', 175);
        // $(".select_option .spleen .chk_boxArea:nth-child(1) .cbx-lbl").append("상복부초음파");
        // //비장 끝
        //
        // //췌장 시작
        // $(".select_option .pancreas .chk_boxArea:nth-child(1) input").val("상복부초음파").data('itemId', 175);
        // $(".select_option .pancreas .chk_boxArea:nth-child(1) .cbx-lbl").append("상복부초음파");
        // //췌장 끝

        //요추 시작
        $(".select_option .vertebrae_lumbales .chk_boxArea:nth-child(1) input").val("요추X-선촬영").data('itemId', 160);
        $(".select_option .vertebrae_lumbales .chk_boxArea:nth-child(1) .cbx-lbl").append("요추X-선촬영");
        $(".select_option .vertebrae_lumbales .chk_boxArea:nth-child(2) input").val("골밀도검사 (Bone density)").data('itemId', 166);
        $(".select_option .vertebrae_lumbales .chk_boxArea:nth-child(2) .cbx-lbl").append("골밀도검사 (Bone density)");
        $(".select_option .vertebrae_lumbales .chk_boxArea:nth-child(3) input").val("요추(허리)CT").data('itemId', 200);
        $(".select_option .vertebrae_lumbales .chk_boxArea:nth-child(3) .cbx-lbl").append("요추(허리)CT");
        $(".select_option .vertebrae_lumbales .chk_boxArea:nth-child(4) input").val("요추(허리)MRI").data('itemId', 217);
        $(".select_option .vertebrae_lumbales .chk_boxArea:nth-child(4) .cbx-lbl").append("요추(허리)MRI");
        $(".select_option .vertebrae_lumbales .chk_boxArea:nth-child(5) input").val("요추MRI-T2").data('itemId', 218);
        $(".select_option .vertebrae_lumbales .chk_boxArea:nth-child(5) .cbx-lbl").append("요추MRI-T2");
        //요추 끝


        //경동맥 시작
        $(".select_option .carotid_artery .chk_boxArea:nth-child(1) input").val("경동맥초음파").data('itemId', 183);
        $(".select_option .carotid_artery .chk_boxArea:nth-child(1) .cbx-lbl").append("경동맥초음파");
        //경동맥 끝

        //갑상선 시작
        $(".select_option .thyroid_gland .chk_boxArea:nth-child(1) input").val("갑상선초음파").data('itemId', 182);
        $(".select_option .thyroid_gland .chk_boxArea:nth-child(1) .cbx-lbl").append("갑상선초음파");
        //갑상선 끝

        //심장 시작
        $(".select_option .heart .chk_boxArea:nth-child(1) input").val("심전도 검사").data('itemId', 154);
        $(".select_option .heart .chk_boxArea:nth-child(1) .cbx-lbl").append("심전도 검사");
        $(".select_option .heart .chk_boxArea:nth-child(2) input").val("운동부하검사").data('itemId', 164);
        $(".select_option .heart .chk_boxArea:nth-child(2) .cbx-lbl").append("운동부하검사");
        $(".select_option .heart .chk_boxArea:nth-child(3) input").val("홀터 심전도(24시간 심전도)").data('itemId', 165);
        $(".select_option .heart .chk_boxArea:nth-child(3) .cbx-lbl").append("홀터 심전도(24시간 심전도)");
        $(".select_option .heart .chk_boxArea:nth-child(4) input").val("심장초음파").data('itemId', 186);
        $(".select_option .heart .chk_boxArea:nth-child(4) .cbx-lbl").append("심장초음파");
        $(".select_option .heart .chk_boxArea:nth-child(5) input").val("심장석회화(칼슘스코어링)CT").data('itemId', 201);
        $(".select_option .heart .chk_boxArea:nth-child(5) .cbx-lbl").append("심장석회화(칼슘스코어링)CT");
        $(".select_option .heart .chk_boxArea:nth-child(6) input").val("심장혈관CT(Coronary CT)").data('itemId', 202);
        $(".select_option .heart .chk_boxArea:nth-child(6) .cbx-lbl").append("심장혈관CT(Coronary CT)");

        //심장 끝

        //유방 시작
        $(".select_option .breast .chk_boxArea:nth-child(1) input").val("유방X-선(Mammography)").data('itemId', 157);
        $(".select_option .breast .chk_boxArea:nth-child(1) .cbx-lbl").append("유방X-선(Mammography)");
        $(".select_option .breast .chk_boxArea:nth-child(2) input").val("유방초음파(BreastSono)").data('itemId', 184);
        $(".select_option .breast .chk_boxArea:nth-child(2) .cbx-lbl").append("유방초음파(BreastSono)");
        //유방 끝

        //위 시작
        $(".select_option .stomach .chk_boxArea:nth-child(1) input").val("위내시경(비수면)").data('itemId', 167);
        $(".select_option .stomach .chk_boxArea:nth-child(1) .cbx-lbl").append("위내시경(비수면)");
        $(".select_option .stomach .chk_boxArea:nth-child(2) input").val("위내시경(수면)").data('itemId', 168);
        $(".select_option .stomach .chk_boxArea:nth-child(2) .cbx-lbl").append("위내시경(수면)");
        $(".select_option .stomach .chk_boxArea:nth-child(3) input").val("위장조영촬영").data('itemId', 169);
        $(".select_option .stomach .chk_boxArea:nth-child(3) .cbx-lbl").append("위장조영촬영");
        //위 끝

        //복부 시작
        $(".select_option .abdomen .chk_boxArea:nth-child(1) input").val("복부비만CT").data('itemId', 203);
        $(".select_option .abdomen .chk_boxArea:nth-child(1) .cbx-lbl").append("복부비만CT");
        $(".select_option .abdomen .chk_boxArea:nth-child(2) input").val("복부CT").data('itemId', 204);
        $(".select_option .abdomen .chk_boxArea:nth-child(2) .cbx-lbl").append("복부CT");
        $(".select_option .abdomen .chk_boxArea:nth-child(3) input").val("상복부초음파").data('itemId', 175);
        $(".select_option .abdomen .chk_boxArea:nth-child(3) .cbx-lbl").append("상복부초음파");
        $(".select_option .abdomen .chk_boxArea:nth-child(4) input").val("간MRI").data('itemId', 225);
        $(".select_option .abdomen .chk_boxArea:nth-child(4) .cbx-lbl").append("간MRI");
        $(".select_option .abdomen .chk_boxArea:nth-child(5) input").val("지방간MRI").data('itemId', 227);
        $(".select_option .abdomen .chk_boxArea:nth-child(5) .cbx-lbl").append("지방간MRI");
        $(".select_option .abdomen .chk_boxArea:nth-child(6) input").val("췌장MRI").data('itemId', 229);
        $(".select_option .abdomen .chk_boxArea:nth-child(6) .cbx-lbl").append("췌장MRI");
        //복부 끝

        //골반 시작
        $(".select_option .pelvis .chk_boxArea:nth-child(1) input").val("고관절(골반)MRI").data('itemId', 221);
        $(".select_option .pelvis .chk_boxArea:nth-child(1) .cbx-lbl").append("고관절(골반)MRI");
        //골반 끝


        //대장 시작
        $(".select_option .large_intestine .chk_boxArea:nth-child(1) input").val("대장내시경(비수면)").data('itemId', 170);
        $(".select_option .large_intestine .chk_boxArea:nth-child(1) .cbx-lbl").append("대장내시경(비수면)");
        $(".select_option .large_intestine .chk_boxArea:nth-child(2) input").val("대장내시경(수면)").data('itemId', 171);
        $(".select_option .large_intestine .chk_boxArea:nth-child(2) .cbx-lbl").append("대장내시경(수면)");
        $(".select_option .large_intestine .chk_boxArea:nth-child(3) input").val("위투하 대장내시경 검사").data('itemId', 172);
        $(".select_option .large_intestine .chk_boxArea:nth-child(3) .cbx-lbl").append("위투하 대장내시경 검사");
        $(".select_option .large_intestine .chk_boxArea:nth-child(4) input").val("직장내시경").data('itemId', 173);
        $(".select_option .large_intestine .chk_boxArea:nth-child(4) .cbx-lbl").append("직장내시경");
        //대장 끝

        //자궁 시작
        $(".select_option .uterus .chk_boxArea:nth-child(1) input").val("골반(여성하복부)초음파").data('itemId', 180);
        $(".select_option .uterus .chk_boxArea:nth-child(1) .cbx-lbl").append("골반(여성하복부)초음파");
        $(".select_option .uterus .chk_boxArea:nth-child(2) input").val("질초음파(VaginalSono)").data('itemId', 181);
        $(".select_option .uterus .chk_boxArea:nth-child(2) .cbx-lbl").append("질초음파(VaginalSono)");
        $(".select_option .uterus .chk_boxArea:nth-child(3) input").val("자궁경부암검사(Papsmear)").data('itemId', 245);
        $(".select_option .uterus .chk_boxArea:nth-child(3) .cbx-lbl").append("자궁경부암검사(Papsmear)");
        $(".select_option .uterus .chk_boxArea:nth-child(4) input").val("인유두종바이러스검사(HPV)").data('itemId', 247);
        $(".select_option .uterus .chk_boxArea:nth-child(4) .cbx-lbl").append("인유두종바이러스검사(HPV)");
        //자궁 끝

        //무릎 시작
        $(".select_option .knee .chk_boxArea:nth-child(1) input").val("슬관절(무릎)MRI (좌, 우 중 1부위)").data('itemId', 223);
        $(".select_option .knee .chk_boxArea:nth-child(1) .cbx-lbl").append("슬관절(무릎)MRI (좌, 우 중 1부위)");
        //무릎 끝


        $(".option_list .list .chk_boxArea").click(function(){

            var chk = $(this).find(".item input").is(":checked");
            var item_name = $(this).find('.cbx-lbl').text();
            var list_name = $(this).parents(".list").attr("data-body-parts");
            var chk_length = $(this).parents(".list").find(".item input:checked").length;
            var all_chk_length = $(this).parents(".option_list").find(".list .item input:checked").length;
            var windowWidth = $( window ).width();

            console.log(chk_length);

            if(chk){
                $(".select_option .chk_boxArea").css({"pointer-events":"auto","text-decoration":"none"});
                if(item_name == "상복부초음파"){
                    $(".select_option_name_area").append('<span class="select_option_name '+list_name+'">'+item_name+'</span>');
                    $(".select_option .chk_boxArea .cbx-lbl:contains('상복부초음파')").parents(".chk_boxArea").css({"pointer-events":"none","text-decoration":"line-through"}).removeClass("active");
                    $(this).css({"pointer-events":"auto","text-decoration":"none"}).addClass("active");

                }
                else{
                    $(".select_option_name_area").append('<span class="select_option_name">'+item_name+'</span>');

                    if($(".select_option .chk_boxArea.active").length > 0){
                        $(".select_option .chk_boxArea .cbx-lbl:contains('상복부초음파')").parents(".chk_boxArea").css({"pointer-events":"none","text-decoration":"line-through"});
                        $(".select_option .chk_boxArea.active").css({"pointer-events":"auto","text-decoration":"none"});
                    }
                    else{
                        $(".select_option .chk_boxArea").css({"pointer-events":"auto","text-decoration":"none"}).removeClass("active");
                    }

                }

            }//체크할때



            if(!chk) {
                if (item_name == "상복부초음파") {
                    $(".select_option_name." +list_name + "").remove();
                    $(".select_option .chk_boxArea").css({"pointer-events":"auto","text-decoration":"none"}).removeClass("active");
                }
                else {
                    $(".select_option_name_area > span:contains(" + item_name + ")").remove();


                    if($(".select_option .chk_boxArea.active").length > 0){
                        $(".select_option .chk_boxArea .cbx-lbl:contains('상복부초음파')").parents(".chk_boxArea").css({"pointer-events":"none","text-decoration":"line-through"});
                        $(".select_option .chk_boxArea.active").css({"pointer-events":"auto","text-decoration":"none"});
                    }
                    else{
                        $(".select_option .chk_boxArea").css({"pointer-events":"auto","text-decoration":"none"}).removeClass("active");
                    }

                }
            }



            if(chk_length > 0){
                $(".selection_area .img_wrap .checkup_bg_btn."+list_name+"").find(".success_check input").prop("checked",true);


                if(all_chk_length > 2){
                    $(".selection_area .img_wrap .checkup_bg_btn."+list_name+"").find(".success_check input").prop("checked",false);
                    $(this).find(".item input").prop("checked", false);
                    $(".select_option_name_area span:last-of-type").remove();
                    Swal.fire('검사 항목은 최대 2개까지\n선택 가능합니다.', '', 'warning' );



                    if(chk_length > 1){
                        $(".selection_area .img_wrap .checkup_bg_btn."+list_name+"").find(".success_check input").prop("checked",true);

                    }
                    if(chk_length < 3) {
                        if (windowWidth < 768) {
                            $('html, body').stop().animate({
                                scrollTop: 90
                            }, 0);
                        }
                    }

                }



            }

            if(chk_length < 1){
                $(".selection_area .img_wrap .checkup_bg_btn."+list_name+"").find(".success_check input").prop("checked",false);

            }

            if(chk_length > 2){
                $(this).find(".item input").prop("checked", false);

                if(all_chk_length > 0){
                    $(".selection_area .img_wrap .checkup_bg_btn."+list_name+"").find(".success_check input").prop("checked",true);
                }

                if(all_chk_length < 1){
                    $(".selection_area .img_wrap .checkup_bg_btn."+list_name+"").find(".success_check input").prop("checked",false);
                    $(".select_option_name_area span:last-of-type").remove();
                    Swal.fire('검사 항목은 최대 2개까지\n선택 가능합니다.', '', 'warning' );
                    if(windowWidth < 768) {
                        $('html, body').stop().animate({
                            scrollTop: 90
                        }, 0);
                    }
                }
            }

        })//검사항목 리스트 클릭시





    })//document


    $('.checkup_select_btn').on('click', function () {
        let list = $('.select_option .option_list .list input:checked');

        if (list.length < 1) { //체크된 항목수 1개이하면
            $('.selection_area .img_wrap').addClass('focus');
            setTimeout(function () {
                $('.selection_area .img_wrap').removeClass('focus');
            }, 1000);
            Swal.fire('검사항목을 선택해주세요.', '', 'warning');
            return;
        }

        let itemIds = [];
        let itemNames = [];
        list.each(function (i, v) {
            itemIds.push($(v).data('itemId'));
            itemNames.push($(v).val());
        });

        $.ajax({
            url: '<c:url value="/us/checkup-contract-item"/>',
            dataType: 'json',
            contentType: 'application/json',
            data: {
                userId: <c:out value="${userId}"/>,
                itemIds: itemIds.join(','),
            },
        }).then(function (response) {
            if (response.code !== 'SUCCESS') {
                Swal.fire(response.message, '', 'error');
                return;
            }

            let text = '';
            itemIds.forEach(function (itemId, i) {
                if (response.data.filter(function (v) {
                    return v.itemId === itemId;
                }).every(function (v) {
                    return v.register === '2';
                })) {
                    if (!text) {
                        text += itemNames[i];
                    } else {
                        text += ', ' + itemNames[i];
                    }
                }
            });

            if (text) {
                text = '고객님께서<br/>이용 가능하신 패키지에는<br/>' + text + '<br/>검사항목이 포함되어 있지 않습니다.<br/>해당 항목 추가를 희망하실 경우,<br/>추가 비용이 발생할 수 있습니다.<br/><br/>';
            }

            if (text) {
                Swal.fire({
                    icon: 'info',
                    title: text,
                    showCancelButton: true,
                    confirmButtonText: '반영하기',
                    cancelButtonText: '취소하기',
                    cancelButtonColor: '#5d5d5d',
                }).then(function (result) {
                    if (result.isConfirmed) {
                        //통과
                        location.href = 'reserve_checkup.html?' + $.param({
                            reserveType: 'item',
                            userId: <c:out value="${userId}"/>,
                            itemIds: itemIds.join(','),
                            itemNames: itemNames.join(', '),
                        });
                    }
                });
                return;
            }

            //통과
            location.href = 'reserve_checkup.html?' + $.param({
                reserveType: 'item',
                userId: <c:out value="${userId}"/>,
                itemIds: itemIds.join(','),
                itemNames: itemNames.join(', '),
            });
        }, function (jqXHR) {
            console.log(jqXHR);
            Swal.fire('Error!', '', 'error');
        });
    });

    $('#search').on('keypress', function (e) {
        if (e.keyCode === 13) {
            search($('#search').val());
        }
    });


    $('#search').on('keyup', function (e) {
        var search_val = $(this).val();
        var search_val_length = $(this).val().length;
//초기화
        $(".selection_area .img_wrap .body_parts_btn .checkup_bg_btn").removeClass("select");
        $(".selection_area .img_wrap .middle_area .position_btn").removeClass("select");

        if (search_val_length < 1) { //적은 단어가 1개 이하일때 (하나도없을때)

            $('.select_option .option_list .list .chk_boxArea').hide(); //모두 삭제
            $(".select_option .empty_text").removeClass("select");
            $('.select_option .option_list .list').removeClass('select');
        } else if (search_val_length > 0) {//적은 단어가 0개 이상일때 (하나라도 있을때)

            $(".select_option .empty_text").addClass("select");
            $('.select_option .option_list .list .chk_boxArea').show(); //모두 보이게
            $('.select_option .option_list .list .chk_boxArea input').not('input[value*="' + search_val + '"]')
                .parents(".chk_boxArea").hide(); //단어 내용이 아닌것은 삭제
            $('.select_option .option_list .list').addClass('select');
            // search($('#search').val());
        }
    });//keyup

    // $('.btn.search_btn').on('click', function () {
    //     search($('#search').val());
    // });


    function search(text) {
        $('.select_option .empty_text').addClass('select');
        $('.select_option .option_list .list .chk_boxArea').show();

        $('.select_option .option_list .list .chk_boxArea input').not('input[value*="' + text + '"]').parent().parent().hide();
        $('.select_option .option_list .list').addClass('select');
    };


    function connection_reset(){
        $(".selection_area .img_wrap .body_parts_btn .checkup_bg_btn").click().removeClass("select");
        $(".select_option .option_list .list").removeClass("select");
        $(".selection_area .img_wrap .middle_area .position_btn").removeClass("select");
        $(".select_option .empty_text.select").removeClass("select")
    }



    function mob_select(){

        var selection_area = $(".selection_area").offset().top;
        var selection_from = $(".selection_form").offset().top - 400;

        // $(".checkup_bg_btn").click(function () {
        //
        //     var selected_length = $(this).parents(".img_wrap").find(".checkup_bg_btn.select").length;
        //
        //
        //     if (selected_length < 1) {
        //         //select 된 상태
        //     }
        //     if (selected_length > 0) {
        //         //select 안된 상태
        //
        //         $('html, body').stop().animate({
        //             scrollTop: selection_from + 260
        //         }, 0);
        //
        //
        //     }
        //
        // })//bg_click


        $(document).on('scroll', _.throttle(function(){
            var scroll = $(window).scrollTop();
            var selection_from = $(".selection_form").offset().top - 400;


            if (scroll > selection_from) {
                $(".selection_button_fixed_mob").addClass("on")
            } else {
                $(".selection_button_fixed_mob").removeClass("on")

            }
        }, 300));
        //scroll


        $(".selection_button_fixed_mob").click(function () {
            $('html, body').stop().animate({
                scrollTop: selection_area - 120
            }, 400);
        })//mob



    }//mob_select();


    $(document).ready(function(){
        connection_reset();
        if(window.matchMedia("(max-width:768px)").matches){
            //mob화면
            mob_select();
        }
        else{
            //pc화면
        }

        function matchFunction(){
            if(window.matchMedia("(max-width:768px)").matches){
                //mob화면
                mob_select();
            }
            else{
                //pc화면
            }
        }
        window.matchMedia("(max-width:768px)").addListener(matchFunction);

    });




    $(window).resize(function() {
        var selected_length = $(".selection_area .img_wrap .body_parts_btn .checkup_bg_btn.select").length;
        var select_parts = $(".select_option .option_list .list.select").attr("data-body-parts");

        window.mobilecheck = function() {
            var check = false;
            (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
            return check;
        };



        if(mobilecheck()){


        }else{

            connection_reset();

            if (selected_length > 0){

                $(".selection_area .img_wrap .body_parts_btn .checkup_bg_btn." +select_parts + "").addClass("select");
                $(".select_option .option_list .list." +select_parts + "").addClass("select").siblings().removeClass("select");
                $(".select_option .empty_text").addClass("select");
                $(".selection_area .img_wrap .middle_area .position_btn." +select_parts + "").addClass("select")
            }
            if (selected_length < 1){
                $(".select_option .option_list .list").removeClass("select");
                $(".selection_area .img_wrap .middle_area .position_btn").removeClass("select");
                $(".select_option .empty_text.select").removeClass("select");
            }
        }

    });//resize

</script>
</body>
</html>
