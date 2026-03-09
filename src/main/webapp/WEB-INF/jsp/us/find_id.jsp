<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건강살자(사용자) 아이디 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet" type="text/css">
    <link href="../css/us/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/us/common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/header.css" rel="stylesheet" type="text/css">
    <link href="../css/us/footer.css" rel="stylesheet" type="text/css">
    <link href="../css/us/login.css" rel="stylesheet" type="text/css">
    <style>
        .main_section{margin: 0; padding:0 0 73px 0;}

        .main_section .container{background:none; padding:50px 15px;}

        .main_section .cont_area .title_area{text-align: center;}

        .main_section .certi_btn a{border:1px solid #27a3ac; border-radius:5px; cursor:pointer; display: flex; align-items: center; justify-content: center; color:#27a3ac; transition: all 0.4s cubic-bezier(0.2, 0.9, 0.4, 1.1); font-size:16px;
        }

        .main_section .certi_btn a:hover{background:#27a3ac; color:#fff;}

        .chk_area{position:absolute; top:50%; left:50%; transform:translate(-50%,-50%); }

        @media(max-width:768px){
            .main_section .title_area{font-size:18px;}

            .main_section .main_section_close{width:30px; height: 30px; font-size:20px;}
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
                <div class="row">
                    <div class="cont_area">
                        <div class="title_area">
                            <div class="title">
                                <h2>아이디 찾기</h2>

                            </div>
                            <p class="sub_title">가입시 입력한 본인 정보를<br><br class="mo">
                                입력해 주세요.
                            </p>
                        </div>
                        <div class="input_area">

                            <div class="write row">
                                <div class="input_type1 col-md-12">
                                    <label for="s_f1">
                                        <input type="text" name="s_f1" id="s_f1" placeholder="&nbsp;" required=""
                                               autocomplete="off">
                                        <span class="label">이름을 입력하세요</span>
                                    </label>
                                </div>
                            </div><!--이름-->

                            <div class="write row">
                                <div class="input_type1 col-md-9">
                                    <label for="s_f2">
                                        <input type="text" name="s_f2" id="s_f2" class="phone_num" maxlength="13"
                                               class="only_num" placeholder="&nbsp;" required="" autocomplete="off">
                                        <span class="label">휴대폰 번호 (숫자만 입력)</span>
                                    </label>
                                </div>
                                <div id="findBtn" class="certi_btn col-md-3">
                                    <a>인증</a>
                                </div>
                            </div><!--휴대폰번호-->

                            <div class="write row">
                                <div class="input_type1 col-md-12">
                                    <label for="s_f3">
                                        <input type="text" name="s_f3" id="s_f3" class="only_num" placeholder="&nbsp;"
                                               required="" autocomplete="off">
                                        <span class="label">인증번호를 입력 하세요</span>
                                    </label>
                                </div>
                            </div><!--인증번호-->


                        </div><!--input_area-->

                        <div id="checkBtn" class="btn find_id_btn">
                            <span class="button_on_circle"></span>
                            <a href="#" class="btn_inner">
                                      <span class="btn_txt_area">
                                        확인
                                      </span>
                            </a>
                        </div>


                    </div><!--cont_area-->
                </div><!--row-->

            </div><!--container-->


        </div><!--main_cont-->
    </section><!--main_section-->


</main>
<div class="find_popup">

    <div class="click_popup_bg"></div>
    <div class="click_popup">
        <div class="title_area">
            <span class="title">아이디 목록</span>
            <span class="click_popup_close"><a><i class="xi-close"></i></a></span>
        </div>
        <div class="sub_title_area">
            <span>고객님의 정보와 일치하는 아이디 목록입니다.</span>
        </div>
        <div class="click_popup_wrap">


            <div class="popup_id_select">
                <table class="popup_table" border="1" style="table-layout: fixed">
                    <th width="28.3%">기업명</th>
                    <th width="28.3%">아이디</th>
                    <th width="28.3%">가입일</th>
                    <%--                    <th width="15%">선택</th>--%>
                    <tr><!-- 첫번째 줄 시작 -->
                        <td id="companyName">첫번째 기업</td>
                        <td id="employeeCode">첫번재 아이디</td>
                        <td id="createdAt">첫번째 가입일</td>
                        <%--                        <td>--%>

                        <%--                            <!--체크박스 시작-->--%>
                        <%--                            <div class="chk_area">--%>
                        <%--                                <div class="chk_boxArea">--%>
                        <%--                                    <label class="item">--%>
                        <%--                                        <input type="checkbox" name="s_v1_0" id="s_v1_0" class="hidden" value="선택">--%>
                        <%--                                        <label class="cbx" for="s_v1_0">--%>
                        <%--                                            <svg height="20px" viewBox="0 -8 16 30" width="20px">--%>
                        <%--                                                <polyline points="1 7.6 5 11 13 1"></polyline>--%>
                        <%--                                            </svg>--%>
                        <%--                                        </label>--%>

                        <%--                                        <label class="cbx-lbl"></label>--%>
                        <%--                                    </label>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                            <!--체크박스 끝-->--%>

                        <%--                        </td>--%>

                    </tr><!-- 첫번째 줄 끝 -->

                    <%--                    <tr><!-- 두번째 줄 시작 -->--%>
                    <%--                        <td>두번째 기업</td>--%>
                    <%--                        <td>두번째 아이디</td>--%>
                    <%--                        <td>두번째 가입일</td>--%>
                    <%--                        <td>--%>
                    <%--                            <!--체크박스 시작-->--%>
                    <%--                            <div class="chk_area">--%>
                    <%--                                <div class="chk_boxArea">--%>
                    <%--                                    <label class="item">--%>
                    <%--                                        <input type="checkbox" name="s_v2_0" id="s_v2_0" class="hidden" value="선택">--%>
                    <%--                                        <label class="cbx" for="s_v2_0">--%>
                    <%--                                            <svg height="20px" viewBox="0 -8 16 30" width="20px">--%>
                    <%--                                                <polyline points="1 7.6 5 11 13 1"></polyline>--%>
                    <%--                                            </svg>--%>
                    <%--                                        </label>--%>

                    <%--                                        <label class="cbx-lbl"></label>--%>
                    <%--                                    </label>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <!--체크박스 끝-->--%>

                    <%--                        </td>--%>
                    <%--                    </tr><!-- 두번째 줄 끝 -->--%>

                    <%--                    <tr><!-- 세번째 줄 시작 -->--%>
                    <%--                        <td>세번째 기업</td>--%>
                    <%--                        <td>세번째 아이디</td>--%>
                    <%--                        <td>세번째 가입일</td>--%>
                    <%--                        <td>--%>
                    <%--                            <!--체크박스 시작-->--%>
                    <%--                            <div class="chk_area">--%>
                    <%--                                <div class="chk_boxArea">--%>
                    <%--                                    <label class="item">--%>
                    <%--                                        <input type="checkbox" name="s_v3_0" id="s_v3_0" class="hidden" value="선택">--%>
                    <%--                                        <label class="cbx" for="s_v3_0">--%>
                    <%--                                            <svg height="20px" viewBox="0 -8 16 30" width="20px">--%>
                    <%--                                                <polyline points="1 7.6 5 11 13 1"></polyline>--%>
                    <%--                                            </svg>--%>
                    <%--                                        </label>--%>

                    <%--                                        <label class="cbx-lbl"></label>--%>
                    <%--                                    </label>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <!--체크박스 끝-->--%>
                    <%--                        </td>--%>
                    <%--                    </tr><!-- 세번째 줄 끝 -->--%>

                </table>
                <div class="line"></div>
                <div class="btn_area">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="btn login_btn">
                                <span class="button_on_circle"></span>
                                <a href="login.html" class="btn_inner">
                                    <span class="btn_txt_area">
                                    로그인 하기 <i class="xi-log-in"></i>
                                    </span>
                                </a>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="btn find_password_btn">
                                <span class="button_on_circle"></span>
                                <a href="find_password.html" class="btn_inner">
                                    <span class="btn_txt_area">
                                    비밀번호 찾기<i class="xi-lock"></i>
                                    </span>
                                </a>
                            </div>
                        </div>

                    </div><!--row-->
                </div><!--btn_area-->
            </div><!--step02-->


        </div><!--click_popup_wrap-->
    </div><!--click_popup-->


</div><!--find_popup-->


<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="../js/us/sub_common.js"></script>
<script>

$("header").load("header.html");
$("footer").load("footer.html");


    /*아이디,비밀번호 찾기 클릭시 팝업 체크박스*/

    $(".chk_boxArea .item").click(function () {
        var chk = $(this).find("input").is(":checked");
        if (chk) { //체크가 되었을시
            $(this).find("input").prop("checked", true).parents(".chk_area").addClass("active").parents("tr").siblings("tr").find("td:last-of-type").find(".chk_area").removeClass("active").find("input").prop("checked", false)
        }
    });

    $("#findBtn").click(function () {

        let employeeName = $('#s_f1').val();
        let mobile = $('#s_f2').val().replace(/-/g, '');

        $.ajax({
            url: '<c:url value="/us/find/id"/>',
            method: 'GET',
            contentType: "application/json; charset=utf-8",
            data: {
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


$("#checkBtn").click(function () {

    if (!s_f1.value) { //이름

        $("#s_f1").parents("label").addClass("input_focus").find("input").focus();
        setTimeout(() => {
            $("#s_f1").parents("label").removeClass("input_focus")
        }, 1000);

        Swal.fire('이름을 입력해 주세요.', '', 'warning');
        return;
        }

        if(!s_f2.value){ //휴대폰 번호

            $("#s_f2").parents("label").addClass("input_focus").find("input").focus();
            setTimeout(() => {
                $("#s_f2").parents("label").removeClass("input_focus")
            },  1000);

            Swal.fire('휴대폰 번호를 입력해 주세요.', '', 'warning');
            return;
        }

    if (!s_f3.value) { //인증번호

        $("#s_f3").parents("label").addClass("input_focus").find("input").focus();
        setTimeout(() => {
            $("#s_f3").parents("label").removeClass("input_focus")
        }, 1000);

        Swal.fire('인증번호를 입력해 주세요.', '', 'warning');
        return;
    }

    let recvName = $('#s_f1').val();
    let mobile = $('#s_f2').val().replace(/-/g, '');
    let data = $('#s_f3').val();

    $.ajax({
        url: '<c:url value="/us/find/data"/>',
        method: 'GET',
        data: {
            recvName: recvName,
            mobile: mobile,
            data: data,
        },
    }).then(function (response) {
        $('#companyName').text(response.data.companyName);
        $('#employeeCode').text(response.data.employeeCode);
        let date = new Date(response.data.createdAt);
        $('#createdAt').text(date.toLocaleDateString());
        popup_open();
    });
})


</script>
</body>
</html>
