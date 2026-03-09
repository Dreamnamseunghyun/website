<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건강살자(사용자) 공지사항</title>
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
                                        고객님께서 필요하신 내용을 답변해드립니다.<br>
                                        고객님의 문의가 많아 답변이 늦어질 수 있는 점 양해 바랍니다.
                                        </span>
                    </p>
                    <div class="edit_form">
                        <div class="sort">
                            <div class="name">분류</div>
                            <div class="select_area">
                                <div class="select_box_area">
                                    <div id="qnaCategory">

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="title">
                            <div class="name">제목</div>
                            <div class="input_area">
                                <div id="qnaTitle" style="resize: none;" disabled></div>
                            </div>
                        </div>

                        <div class="text_area">
                            <div class="name">문의</div>
                            <textarea id="qnaQuestion" readonly></textarea>
                        </div>
                        <div class="text_area">
                            <div class="name">답변</div>
                            <textarea id="qnaAnswer" contenteditable="true" readonly="readonly"></textarea>
                        </div>
                    </div>
                    <div class="btn_type2">
                        <div class="btn_area">
                            <div class="btn check_btn">
                                <span class="button_on_circle"></span>
                                <a href="inquiry" class="btn_inner grey">
                                    <span class="btn_txt_area">목록으로</span>
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
                $("#qnaCategory").html('예약문의');
            } else if (response.data.category === 1) {
                $("#qnaCategory").html('결과상담');
            } else if (response.data.category === 2) {
                $("#qnaCategory").html('불만사항');
            } else if (response.data.category === 3) {
                $("#qnaCategory").html('홈페이지');
            } else if (response.data.category === 4) {
                $("#qnaCategory").html('기타문의');
            }
            $("#qnaAnswer").html(response.data.answer);
        });
    });

</script>
</body>
</html>
