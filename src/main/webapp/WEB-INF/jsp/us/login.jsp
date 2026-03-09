<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건강살자(사용자) 로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet" type="text/css">
    <link href="../css/us/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/us/common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/header.css" rel="stylesheet" type="text/css">
    <link href="../css/us/footer.css" rel="stylesheet" type="text/css">
    <link href="../css/us/login.css" rel="stylesheet" type="text/css">
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
                        <div class="title_area">
                            <div class="title row">
                                <div class="col-md-8"><h2>기업 회원 로그인</h2></div>
                                <div class="col-md-4 img_area"><img src="../img/us/login/login_title_img.png"></div>
                            </div>
                            <p class="sub_title">
                                믿고 선택해주신 고객님 고맙습니다.<br><br class="mo">
                                기업코드와 아이디, 비밀번호를 입력해 주세요.
                            </p>
                        </div>
                        <div class="input_area">

                            <div class="write row">
                                <div class="tit col-md-3"><span>기업코드</span></div>
                                <div class="input_type1 col-md-6">
                                    <label for="companyCode">
                                        <input type="text" name="s_v1" id="companyCode" placeholder="&nbsp;"
                                               required="" autocomplete="off">
                                        <span class="label">기업코드를 입력해 주세요</span>
                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <div class="btn confirm_btn" style="margin-top: 0;">
                                        <span class="button_on_circle"></span>
                                        <a href="#" class="btn_inner blue_gradient" tabindex="-1">
                                            <span class="btn_txt_area">
                                                확인
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div><!--기업코드-->

                            <div class="login_hidden">
                                <div class="write row">
                                    <div class="tit col-md-3"><span>아이디</span></div>
                                    <div class="input_type1 col-md-9">
                                        <label for="loginId">
                                            <input type="text" name="s_v2" id="loginId" placeholder="&nbsp;"
                                                   required="" autocomplete="off">
                                            <span class="label" id="idPlaceHolder"></span>
                                        </label>
                                    </div>
                                </div><!--아이디 (생년월일)-->
                                <div class="write row">
                                    <div class="tit col-md-3"><span>비밀번호</span></div>
                                    <div class="input_type1 col-md-9">
                                        <label for="userPw">
                                            <input type="password" name="s_v3" id="userPw" placeholder="&nbsp;"
                                                   required="" autocomplete="new-password"/>
                                            <span class="label" id="pwPlaceHolder"></span>
                                        </label>
                                    </div>
                                </div><!--아이디 (생년월일)-->

                                <div class="btn login_btn">
                                    <span class="button_on_circle"></span>
                                    <a href="#" class="btn_inner blue_gradient">
                                      <span class="btn_txt_area">
                                        기업회원 로그인 <i class="xi-log-in"></i>
                                      </span>
                                    </a>
                                </div>
                            </div>

                        </div><!--input_area-->




                    </div><!--cont_area-->
                </div><!--row-->

            </div><!--container-->


        </div><!--main_cont-->
    </section><!--main_section-->

    <section class="sec02">
        <div class="container">
            <div class="noti_area">

                <div class="title"><p><i class="xi-info-o"></i> <span>알림</span></p></div>
                <div class="info">
                    <p>기업코드는 소속 기업의 담당자에게 문의해주세요</p>
                    <p>기업 회원의 경우, 기업에서 부여 받은 아이디/ 비밀번호로 로그인 해주세요</p>

                </div>
            </div>
            <div class="find_area">
                <div class="find_btn">
                    <a href="find_id.html"><span>아이디 찾기</span></a>
                </div>
                <div class="find_btn">
                    <a href="find_password.html"><span>비밀번호 찾기</span></a>
                </div>
            </div>
        </div>
    </section>
    <div></div>
</main>


<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="../js/us/sub_common.js"></script>
<script>

    $("header").load("header.html");
    $("footer").load("footer.html");


    $(function () {
        const companyCode = $('#companyCode');
        const loginId = $('#loginId');
        const userPw = $('#userPw');

        companyCode.on('keypress', function (e) {
            if (e.keyCode === 13) {
                return checkCompanyCode();
            }
        });

        loginId.on('keypress', function (e) {
            if (e.keyCode === 13) {
                login();
            }
        });

        userPw.on('keypress', function (e) {
            if (e.keyCode === 13) {
                login();
            }
        });

        $('.confirm_btn').on('click', function () {
            checkCompanyCode();
        });

        $('.login_btn').on('click', function () {
            login();
        });

        function checkCompanyCode() {
            if (!companyCode.val()) {
                companyCode.trigger('focus');

                Swal.fire({
                    title: '기업코드를 입력해 주세요.',
                    icon: 'warning',
                    onDestroy: function () {
                        companyCode.parents('label').addClass('input_focus');

                        setTimeout(function () {
                            companyCode.parents('label').removeClass('input_focus');
                        }, 1000);
                    }
                });

                $('.login_hidden').slideUp(500);
                return;
            }

            $.ajax({
                url: '<c:url value="/common/company/login-place-holder"/>',
                dataType: 'json',
                data: {
                    companyCode: companyCode.val(),
                },
            }).then(function (response) {
                if (response.code === 'SUCCESS' && response.data) {
                    $('#idPlaceHolder').text(response.data.idPlaceHolder);

                    let pwPlaceHolder;
                    switch (response.data.pwType) {
                        case 1:
                            pwPlaceHolder = '초기 비밀번호는 사원번호 입니다.';
                            break;
                        case 2:
                            pwPlaceHolder = '초기 비밀번호는 생년월일 8자리 입니다.';
                            break;
                        default:
                            pwPlaceHolder = '초기 비밀번호는 휴대전화번호 (11자리) 입니다.';
                            break;
                    }

                    $('#pwPlaceHolder').text(pwPlaceHolder);
                    $('.login_hidden').slideDown(500);
                } else {
                    Swal.fire('존재하지 않는 기업코드 입니다.', '', 'error');
                    $('.login_hidden').slideUp(500);
                }
            }, function (jqXHR) {
                console.log(jqXHR);
                Swal.fire('기업코드 조회에 실패하였습니다.', '', 'error');
                $('.login_hidden').slideUp(500);
            });
        }

        function login() {
            if (!companyCode.val()) {
                companyCode.trigger('focus');

                Swal.fire({
                    title: '기업코드를 입력해 주세요.',
                    icon: 'warning',
                    onDestroy: function () {
                        companyCode.parents('label').addClass('input_focus');

                        setTimeout(function () {
                            companyCode.parents('label').removeClass('input_focus');
                        }, 1000);
                    }
                });

                return;
            }

            if (!loginId.val()) {
                loginId.trigger('focus');

                Swal.fire({
                    title: '아이디를 입력해 주세요.',
                    icon: 'warning',
                    onDestroy: function () {
                        loginId.parents('label').addClass('input_focus');

                        setTimeout(function () {
                            loginId.parents('label').removeClass('input_focus');
                        }, 1000);
                    }
                });

                return;
            }

            if (!userPw.val()) {
                userPw.trigger('focus');
                Swal.fire({
                    title: '비밀번호를 입력해 주세요.',
                    icon: 'warning',
                    onDestroy: function () {
                        userPw.parents('label').addClass('input_focus');

                        setTimeout(function () {
                            userPw.parents('label').removeClass('input_focus');
                        }, 1000);
                    }
                });

                return;
            }

            $.ajax({
                url: 'login',
                method: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify({
                    companyCode: companyCode.val(),
                    loginId: loginId.val(),
                    userPw: userPw.val(),
                }),
            }).then(function (response) {
                if (response.code === 'SUCCESS') {
                    location.href = 'index.html';
                } else {
                    Swal.fire(response.message, '', 'error');
                }
            }, function (jqXHR) {
                console.log(jqXHR);
                Swal.fire('로그인에 실패하였습니다.', '', 'error');
            });
        }
    });
</script>
</body>
</html>
