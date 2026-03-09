<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Í±¥Í∞ï?¥Ïûê(?¨Ïö©?? ÎπÑÎ?Î≤àÌò∏ Ï∞æÍ∏∞</title>
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
                                    <h2>ÎπÑÎ?Î≤àÌò∏ Ï∞æÍ∏∞</h2>

                                </div>
                                <p class="sub_title">?ÑÏù¥?îÏ? ?¥Î¶Ñ???ÖÎ†• ???¥Î???Î≤àÌò∏ ?∏Ï¶ù??ÏßÑÌñâ?¥Ï£º?∏Ïöî.</p>
                            </div>

                            <div class="input_area">
                                <div class="write row">
                                    <div class="input_type1 col-md-12">
                                        <label for="s_f1">
                                            <input type="text" name="s_f1" id="s_f1" class="" placeholder="&nbsp;"
                                                   required="" autocomplete="off" maxlength="20">
                                            <span class="label">?ÑÏù¥?îÎ? ?ÖÎ†• ?¥Ï£º?∏Ïöî</span>
                                        </label>
                                    </div>
                                </div><!--?¥Î¶Ñ-->

                                <div class="write active">

                                    <div class="select_list">
                                        <div class="write row">
                                            <div class="input_type1 col-md-12">
                                                <label for="s_f2_1">
                                                    <input type="text" name="s_f2_1" id="s_f2_1" class=""
                                                           placeholder="&nbsp;" required="" autocomplete="off">
                                                    <span class="label">?¥Î¶Ñ???ÖÎ†•?òÏÑ∏??/span>
                                                </label>
                                            </div>
                                        </div><!--?¥Î¶Ñ-->
                                        <div class="write row">
                                            <div class="input_type1 col-md-9 certifi_box">
                                                <label for="s_f2_2">
                                                    <input type="text" name="s_f2_2" id="s_f2_2" class="phone_num"
                                                           maxlength="13" class="only_num" placeholder="&nbsp;"
                                                           required="" autocomplete="off">
                                                    <span class="label">?¥Î???Î≤àÌò∏ (?´ÏûêÎß??ÖÎ†•)</span>
                                                </label>
                                            </div>
                                            <div id="findPwBtn" class="certi_btn col-md-3">
                                                <a>?∏Ï¶ù</a>
                                            </div>
                                        </div><!--?¥Î??∞Î≤à??->

                                        <div class="write row">
                                            <div class="input_type1 col-md-12">
                                                <label for="s_f2_3">
                                                    <input type="text" name="s_f2_3" id="s_f2_3" class="only_num"
                                                           placeholder="&nbsp;" required="" autocomplete="off">
                                                    <span class="label">?∏Ï¶ùÎ≤àÌò∏Î•??ÖÎ†• ?òÏÑ∏??/span>
                                                </label>
                                            </div>
                                        </div><!--?∏Ï¶ùÎ≤àÌò∏-->
                                    </div>
                                </div><!--?¥Î??ÑÌôî ?∏Ï¶ù-->

                            </div><!--input_area-->

                            <div class="btn step01_btn">
                                <span class="button_on_circle"></span>
                                <a class="btn_inner">
                                          <span class="btn_txt_area">
                                            ÎπÑÎ?Î≤àÌò∏ Ï¥àÍ∏∞??                                          </span>
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

    //?∏Ï¶ù Î≤ÑÌäº ?¥Î¶≠??    $("#findPwBtn").click(function () {

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
                    title: '?ÖÎ†•?òÏã† ?ïÎ≥¥Í∞Ä ?ÜÏäµ?àÎã§.',
                    icon: 'warning'
                });
            } else {
                Swal.fire({
                    title: '?∏Ï¶ùÎ≤àÌò∏Î•?Î∞úÏÜ° ?àÏäµ?àÎã§.',
                    text: "?∏Ï¶ùÎ≤àÌò∏Í∞Ä ?§Ï? ?äÏúºÎ©?n ?ÖÎ†•?òÏã† ?ïÎ≥¥Í∞Ä ?åÏõê?ïÎ≥¥?Ä\n?ºÏπò?òÎäîÏßÄ ?ïÏù∏??Ï£ºÏÑ∏??",
                    icon: 'success'
                });
            }
        });
    });

    // ÎπÑÎ≤à Ï¥àÍ∏∞??    $(".step01_btn").click(function () {

        if (!s_f1.value) { //?ÑÏù¥??
            $("#s_f1").parents("label").addClass("input_focus").find("input").focus();

            setTimeout(() => {
                $("#s_f1").parents("label").removeClass("input_focus")
            }, 1000);

            Swal.fire('?ÑÏù¥?îÎ? ?ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        if (!s_f2_1.value) { //?¥Î¶Ñ

            $("#s_f2_1").parents("label").addClass("input_focus").find("input").focus();
            setTimeout(() => {
                $("#s_f2_1").parents("label").removeClass("input_focus")
        },  1000);
        Swal.fire('?¥Î¶Ñ???ÖÎ†•?¥Ï£º?∏Ïöî.', '', 'warning' );
        return;
    }

        if (!s_f2_2.value) { //?¥Î???Î≤àÌò∏

            $("#s_f2_2").parents("label").addClass("input_focus").find("input").focus();
            setTimeout(() => {
                $("#s_f2_2").parents("label").removeClass("input_focus")
            }, 1000);
            Swal.fire('?¥Î??∞Î≤à?∏Î? ?ÖÎ†•?¥Ï£º?∏Ïöî.', '', 'warning');
            return;
        }

        if (!s_f2_3.value) { //?¥Î???Î≤àÌò∏ (?∏Ï¶ù)

            $("#s_f2_3").parents("label").addClass("input_focus").find("input").focus();
            setTimeout(() => {
                $("#s_f2_3").parents("label").removeClass("input_focus")
            }, 1000);
            Swal.fire('?∏Ï¶ùÎ≤àÌò∏Î•??ÖÎ†•?¥Ï£º?∏Ïöî.', '', 'warning');
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
            let con = confirm('?ïÎßêÎ°?Ï¥àÍ∏∞???òÏãúÍ≤†Ïäµ?àÍπå?');
            if (con === true) {
                $.ajax({
                    url: '<c:url value="/us/employee/reset"/>',
                    contentType: 'application/json',
                    method: 'POST',
                    data: JSON.stringify(response.data),
                    success: function () {
                        Swal.fire({
                            title: 'ÎπÑÎ?Î≤àÌò∏Î•?Ï¥àÍ∏∞???àÏäµ?àÎã§.',
                            text: "ÎπÑÎ?Î≤àÌò∏??Î°úÍ∑∏?∏Ïãú Í∏∞ÏóÖ??n ?§Ï†ï??Í∞íÏúºÎ°?Ï¥àÍ∏∞???©Îãà??",
                            icon: 'success'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.href = "login.html";
                            }
                        });
                    },
                    error: function () {
                        Swal.fire({
                            title: '?ÖÎ†•?òÏã† ?ïÎ≥¥Í∞Ä ?ÜÏäµ?àÎã§.',
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
