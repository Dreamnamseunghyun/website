<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>ê±´ê°•?´ì(?¬ìš©?? ê³µì??¬í•­</title>
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

    <style>
        .board_wrap .cont_title {
            text-align: center;
            padding: 43px !important;
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

                <div class="board_wrap">
                    <p class="cont_title text-center">
                                        <span class="quotation">
                                        ê³ ê°?˜ê»˜???„ìš”?˜ì‹  ?´ìš©???µë??´ë“œë¦½ë‹ˆ??<br>
                                        ê³ ê°?˜ì˜ ë¬¸ì˜ê°€ ë§ì•„ ?µë?????–´ì§????ˆëŠ” ???‘í•´ ë°”ë?ˆë‹¤.
                                        </span>
                    </p>
                    <div class="edit_form">
                        <div class="sort">
                            <div class="name">ë¶„ë¥˜</div>
                            <div class="select_area">
                                <div class="select_box_area">
                                    <div id="qnaCategory">

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="title">
                            <div class="name">?œëª©</div>
                            <div class="input_area">
                                <div id="qnaTitle" style="resize: none;" disabled></div>
                            </div>
                        </div>

                        <div class="text_area">
                            <div class="name">ë¬¸ì˜</div>
                            <textarea id="qnaQuestion" readonly></textarea>
                        </div>
                        <div class="text_area">
                            <div class="name">?µë?</div>
                            <textarea id="qnaAnswer" contenteditable="true" readonly="readonly"></textarea>
                        </div>
                    </div>
                    <div class="btn_type2">
                        <div class="btn_area">
                            <div class="btn check_btn">
                                <span class="button_on_circle"></span>
                                <a href="inquiry" class="btn_inner grey">
                                    <span class="btn_txt_area">ëª©ë¡?¼ë¡œ</span>
                                </a>
                            </div>
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
<script src="../js/us/custom_select.js"></script>
<script>


    $("header").load("header.html");
    $("footer").load("footer.html");

    $(function () {
        // Load
        $.ajax({
            url: '<c:url value="/us/inquiry/${qnaId}"/>',
            method: 'GET',
        }).then(function (response) {
            console.log(response)
            $("#qnaTitle").html(response.data.title);
            $("#qnaQuestion").html(response.data.question);
            if (response.data.category === 0) {
                $("#qnaCategory").html('?ˆì•½ë¬¸ì˜');
            } else if (response.data.category === 1) {
                $("#qnaCategory").html('ê²°ê³¼?ë‹´');
            } else if (response.data.category === 2) {
                $("#qnaCategory").html('ë¶ˆë§Œ?¬í•­');
            } else if (response.data.category === 3) {
                $("#qnaCategory").html('?ˆí˜?´ì?');
            } else if (response.data.category === 4) {
                $("#qnaCategory").html('ê¸°í?ë¬¸ì˜');
            }
            $("#qnaAnswer").html(response.data.answer);
        });
    });

</script>
</body>
</html>
