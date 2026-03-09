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
                            <h2>고객센터</h2>
                        </div>
                    </div>
                </div><!--title_area-->
                <div class="tab_area">
                    <div class="tab">
                        <ul class="tab_list">
                            <li><a href="notice.html">공지사항</a></li>
                            <li><a href="faq.html">자주 묻는 질문</a></li>
                            <li class="active"><a href="inquiry.html">1:1 문의하기</a></li>
                            <li><a href="common_sense.html">건강한 건강 상식</a></li>
                        </ul>
                    </div>
                </div>
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
                                    <div class="select_box">
                                        <input type="hidden" name="s_v1" id="s_v1" value="">
                                        <select class="custom-select sources" for="s_v1" placeholder="문의 분류를 선택해주세요.">
                                            <option value="" selected>문의 분류를 선택해주세요.</option>
                                            <option value="0">예약문의</option>
                                            <option value="1">결과상담</option>
                                            <option value="2">불만사항</option>
                                            <option value="3">홈페이지</option>
                                            <option value="4">기타문의</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="title">
                            <div class="name">제목</div>
                            <div class="input_area">
                                <div class="input_type1">
                                    <label for="s_v2">
                                        <input type="text" name="s_v2" id="s_v2" class="id_input" placeholder="&nbsp;"
                                               required="" autocomplete="off" maxlength="50">
                                        <span class="label">제목을 입력해주세요. (50자 내외)</span>
                                    </label>
                                </div>

                            </div>
                        </div>

                        <div class="text_area">
                            <textarea name="s_v3" id="s_v3" placeholder="문의 내용을 입력해주세요"></textarea>
                        </div>
                    </div>
                    <div class="btn_type2">
                        <div class="btn_area">
                            <div class="btn inquiry_btn">
                                <span class="button_on_circle"></span>
                                <a class="btn_inner blue_gradient">
                                    <span class="btn_txt_area">문의하기</span>
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

    $(".inquiry_btn").click(function (e) {

        let title = $('#s_v2');
        if (!title.val()) { //제목

            $("#s_v2").parents("label").addClass("input_focus").find("input").focus();

            setTimeout(() => {
                $("#s_v2").parents("label").removeClass("input_focus")
            }, 1000);

            Swal.fire('제목을 입력해 주세요.', '', 'warning');
            return;
        }

        let question = $('#s_v3');
        if (!question.val()) { //제목

            $("#s_v3").focus().addClass("textarea_focus").find("input");

            setTimeout(() => {
                $("#s_v3").removeClass("textarea_focus");
            }, 1000);

            Swal.fire('문의 내용을 입력해 주세요.', '', 'warning');
            return;
        }

        let category = $('#s_v1');

        //통과

        // TODO: 확인 버튼 클릭후 활성화 필요

        $.ajax({
            url: '<c:url value="/us/inquiry_edit"/>',
            method: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({
                userId: <c:out value="${userId}"/>,
                title: title.val(),
                question: question.val(),
                category: category.val()
            }),
        }).then(function (response) {
            if (response.code === 'SUCCESS') {
                Swal.fire({
                    icon: 'success',
                    title: "작성하신 문의글이<br>정상적으로 등록 되었습니다.",
                    timer: 1000
                })
                    .then((result) => {
                        if (result.dismiss === Swal.DismissReason.timer) {
                            location.href = "inquiry.html"
                        }
                        if (result.isConfirmed) {
                            location.href = "inquiry.html"
                        }
                    })
            } else {
                Swal.fire(response.message, '', 'error');
            }
        }, function (jqXHR) {
            console.log(jqXHR);
            Swal.fire('Error!', '', 'error');
        });


    })


</script>
</body>
</html>
