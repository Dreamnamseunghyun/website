<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건강살자(사용자) 검진예약</title>
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
    <link href="../css/us/reserve.css" rel="stylesheet" type="text/css">
</head>
<body>
<header></header>
<div class="header_blank"></div>
<!--header-->
<main>
    <section class="main_section">
        <div class="main_cont">
            <div class="title_area">
                <h2>검진 예약</h2>
                <p>기업에서 책정된 복지비용을 기본으로 정보를 제공합니다.</p>
            </div>

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
                <div class="row">
                    <div class="col-md-4">
                        <div class="list list03">
                            <div class="title_area">
                                <h3>검진 희망 <span class="blue">병원</span></h3>
                            </div>
                            <div class="img_area">
                                <img src="../img/us/reserve/main/reserve_main_select_img03.png">
                            </div>
                            <div class="info_area">
                                <p>
                                    검진 희망 병원을 먼저 선택하고<br><br class="mo">
                                    희망 병원에 맞는 검진 패키지, 일정을<br><br class="mo">
                                    추천해 드립니다.
                                </p>
                            </div>
                            <div class="btn find_id_btn">
                                <span class="button_on_circle"></span>
                                <a href="sexual_selection.html?reserveType=hospital&userId=<c:out value="${userId}"/>"
                                   class="btn_inner blue">
                                    <span class="btn_txt_area">
                                        우선 선택하기
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div><!--list03-->

                    <div class="col-md-4">
                        <div class="list list02">
                            <div class="title_area">
                                <h3>검진 희망 <span class="green">일정</span></h3>
                            </div>
                            <div class="img_area">
                                <img src="../img/us/reserve/main/reserve_main_select_img02.png">
                            </div>
                            <div class="info_area">
                                <p>
                                    검진 희망 일정을 먼저 선택하고<br><br class="mo">
                                    복지비용에 맞는 검진 패키지, 병원을<br><br class="mo">
                                    추천해 드립니다.
                                </p>
                            </div>
                            <div class="btn find_id_btn">
                                <span class="button_on_circle"></span>
                                <a href="sexual_selection.html?reserveType=date&userId=<c:out value="${userId}"/>"
                                   class="btn_inner green">
                                    <span class="btn_txt_area">
                                        우선 선택하기
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div><!--list02-->

                    <div class="col-md-4">
                        <div class="list list01">
                            <div class="title_area">
                                <h3>검진 희망 <span class="orange">항목</span></h3>
                            </div>
                            <div class="img_area">
                                <img src="../img/us/reserve/main/reserve_main_select_img01.png">
                            </div>
                            <div class="info_area">
                                <p>
                                    검진 항목을 먼저 선택하고<br><br class="mo">
                                    복지비용에 맞는 병원, 예약 일정을<br><br class="mo">
                                    추천해 드립니다.
                                </p>
                            </div>
                            <div class="btn find_id_btn">
                                <span class="button_on_circle"></span>
                                <a href="sexual_selection.html?reserveType=item&userId=<c:out value="${userId}"/>"
                                   class="btn_inner orange">
                                    <span class="btn_txt_area">
                                        우선 선택하기
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div><!--list01-->
                </div><!--row-->

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

</script>
</body>
</html>
