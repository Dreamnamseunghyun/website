<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건강살자(사용자) 비밀번호 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet" type="text/css">
    <link href="../css/us/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/us/common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/header.css" rel="stylesheet" type="text/css">
    <link href="../css/us/footer.css" rel="stylesheet" type="text/css">
    <link href="../css/us/login.css" rel="stylesheet" type="text/css">
    <link href="../css/us/find_password.css" rel="stylesheet" type="text/css">
    <style>
        main{min-height:590px;}

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
                <div class="row">
                    <div class="cont_area">
                        <div class="step_area step01 chk_type2_2 active">

                            <div class="title_area">
                                <div class="title">
                                    <h2>비밀번호 찾기</h2>

                                </div>
                                <p class="sub_title">아이디와 이름을 입력 후 휴대폰 번호 인증을 진행해주세요.</p>
                            </div>

                            <div class="input_area">
                                <div class="write row">
                                    <div class="input_type1 col-md-12">
                                        <label for="s_f1">
                                            <input type="text" name="s_f1" id="s_f1" class="" placeholder="&nbsp;"
                                                   required="" autocomplete="off" maxlength="20">
                                            <span class="label">아이디를 입력 해주세요</span>
                                        </label>
                                    </div>
                                </div><!--이름-->

                                <div class="write active">

                                    <div class="select_list">
                                        <div class="write row">
                                            <div class="input_type1 col-md-12">
                                                <label for="s_f2_1">
                                                    <input type="text" name="s_f2_1" id="s_f2_1" class=""
                                                           placeholder="&nbsp;" required="" autocomplete="off">
                                                    <span class="label">이름을 입력하세요</span>
                                                </label>
                                            </div>
                                        </div><!--이름-->
                                        <div class="write row">
                                            <div class="input_type1 col-md-9 certifi_box">
                                                <label for="s_f2_2">
                                                    <input type="text" name="s_f2_2" id="s_f2_2" class="phone_num"
                                                           maxlength="13" class="only_num" placeholder="&nbsp;"
                                                           required="" autocomplete="off">
                                                    <span class="label">휴대폰 번호 (숫자만 입력)</span>
                                                </label>
                                            </div>
                                            <div id="findPwBtn" class="certi_btn col-md-3">
                                                <a>인증</a>
                                            </div>
                                        </div><!--휴대폰번호-->

                                        <div class="write row">
                                            <div class="input_type1 col-md-12">
                                                <label for="s_f2_3">
                                                    <input type="text" name="s_f2_3" id="s_f2_3" class="only_num"
                                                           placeholder="&nbsp;" required="" autocomplete="off">
                                                    <span class="label">인증번호를 입력 하세요</span>
                                                </label>
                                            </div>
                                        </div><!--인증번호-->
                                    </div>
                                </div><!--휴대전화 인증-->

                            </div><!--input_area-->

                            <div class="btn step01_btn">
                                <span class="button_on_circle"></span>
                                <a class="btn_inner">
                                          <span class="btn_txt_area">
                                            비밀번호 초기화
                                          </span>
                                </a>
                            </div>

                        </div><!--step01-->

                    </div><!--cont_area-->

                </div><!--row-->

            </div><!--container-->

        </div><!--main_cont-->
    </section><!--main_section-->


</main>


<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="../js/us/sub_common.js"></script>
<script>


    $("header").load("header.html");
    $("footer").load("footer.html");


    $(".main_section .cont_area .title_area .back").click(function () {
        $(this).parents(".step_area").removeClass("active").prev().addClass("active")
    });

    //인증 버튼 클릭시
    $("#findPwBtn").click(function () {

        let employeeCode = $('#s_f1').val();
        let employeeName = $('#s_f2_1').val();
        let mobile = $('#s_f2_2').val().replace(/-/g, '');

        $.ajax({
            url: '<c:url value="/us/find/pw"/>',
            method: 'GET',
            contentType: "application/json; charset=utf-8",
            data: {
                employeeCode: employeeCode,
                employeeName: employeeName,
                mobile: mobile,
            },
        }).then(function (response) {
            if (response.data === null) {
                Swal.fire({
                    title: '입력하신 정보가 없습니다.',
                    icon: 'warning'
                });
            } else {
                Swal.fire({
                    title: '인증번호를 발송 했습니다.',
                    text: "인증번호가 오지 않으면\n 입력하신 정보가 회원정보와\n일치하는지 확인해 주세요.",
                    icon: 'success'
                });
            }
        });
    });

    // 비번 초기화
    $(".step01_btn").click(function () {

        if (!s_f1.value) { //아이디

            $("#s_f1").parents("label").addClass("input_focus").find("input").focus();

            setTimeout(() => {
                $("#s_f1").parents("label").removeClass("input_focus")
            }, 1000);

            Swal.fire('아이디를 입력해 주세요.', '', 'warning');
            return;
        }

        if (!s_f2_1.value) { //이름

            $("#s_f2_1").parents("label").addClass("input_focus").find("input").focus();
            setTimeout(() => {
                $("#s_f2_1").parents("label").removeClass("input_focus")
        },  1000);
        Swal.fire('이름을 입력해주세요.', '', 'warning' );
        return;
    }

        if (!s_f2_2.value) { //휴대폰 번호

            $("#s_f2_2").parents("label").addClass("input_focus").find("input").focus();
            setTimeout(() => {
                $("#s_f2_2").parents("label").removeClass("input_focus")
            }, 1000);
            Swal.fire('휴대폰번호를 입력해주세요.', '', 'warning');
            return;
        }

        if (!s_f2_3.value) { //휴대폰 번호 (인증)

            $("#s_f2_3").parents("label").addClass("input_focus").find("input").focus();
            setTimeout(() => {
                $("#s_f2_3").parents("label").removeClass("input_focus")
            }, 1000);
            Swal.fire('인증번호를 입력해주세요.', '', 'warning');
            return;
        }

        let employeeCode = $('#s_f1').val();
        let recvName = $('#s_f2_1').val();
        let mobile = $('#s_f2_2').val().replace(/-/g, '');
        let data = $('#s_f2_3').val();

        $.ajax({
            url: '<c:url value="/us/find/data_pw"/>',
            method: 'GET',
            data: {
                employeeCode: employeeCode,
                recvName: recvName,
                mobile: mobile,
                data: data,
            },
        }).then(function (response) {
            let con = confirm('정말로 초기화 하시겠습니까?');
            if (con === true) {
                $.ajax({
                    url: '<c:url value="/us/employee/reset"/>',
                    contentType: 'application/json',
                    method: 'POST',
                    data: JSON.stringify(response.data),
                    success: function () {
                        Swal.fire({
                            title: '비밀번호를 초기화 했습니다.',
                            text: "비밀번호는 로그인시 기업이\n 설정한 값으로 초기화 됩니다.",
                            icon: 'success'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.href = "login.html";
                            }
                        });
                    },
                    error: function () {
                        Swal.fire({
                            title: '입력하신 정보가 없습니다.',
                            icon: 'warning'
                        });
                    }
                });
            }
        });
    });
</script>
</body>
</html>
