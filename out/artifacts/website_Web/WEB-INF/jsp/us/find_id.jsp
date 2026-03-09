<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Í±¥Í∞ï?¥Ïûê(?¨Ïö©?? ?ÑÏù¥??Ï∞æÍ∏∞</title>
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
                                <h2>?ÑÏù¥??Ï∞æÍ∏∞</h2>

                            </div>
                            <p class="sub_title">Í∞Ä?ÖÏãú ?ÖÎ†•??Î≥∏Ïù∏ ?ïÎ≥¥Î•?br><br class="mo">
                                ?ÖÎ†•??Ï£ºÏÑ∏??
                            </p>
                        </div>
                        <div class="input_area">

                            <div class="write row">
                                <div class="input_type1 col-md-12">
                                    <label for="s_f1">
                                        <input type="text" name="s_f1" id="s_f1" placeholder="&nbsp;" required=""
                                               autocomplete="off">
                                        <span class="label">?¥Î¶Ñ???ÖÎ†•?òÏÑ∏??/span>
                                    </label>
                                </div>
                            </div><!--?¥Î¶Ñ-->

                            <div class="write row">
                                <div class="input_type1 col-md-9">
                                    <label for="s_f2">
                                        <input type="text" name="s_f2" id="s_f2" class="phone_num" maxlength="13"
                                               class="only_num" placeholder="&nbsp;" required="" autocomplete="off">
                                        <span class="label">?¥Î???Î≤àÌò∏ (?´ÏûêÎß??ÖÎ†•)</span>
                                    </label>
                                </div>
                                <div id="findBtn" class="certi_btn col-md-3">
                                    <a>?∏Ï¶ù</a>
                                </div>
                            </div><!--?¥Î??∞Î≤à??->

                            <div class="write row">
                                <div class="input_type1 col-md-12">
                                    <label for="s_f3">
                                        <input type="text" name="s_f3" id="s_f3" class="only_num" placeholder="&nbsp;"
                                               required="" autocomplete="off">
                                        <span class="label">?∏Ï¶ùÎ≤àÌò∏Î•??ÖÎ†• ?òÏÑ∏??/span>
                                    </label>
                                </div>
                            </div><!--?∏Ï¶ùÎ≤àÌò∏-->


                        </div><!--input_area-->

                        <div id="checkBtn" class="btn find_id_btn">
                            <span class="button_on_circle"></span>
                            <a href="#" class="btn_inner">
                                      <span class="btn_txt_area">
                                        ?ïÏù∏
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
            <span class="title">?ÑÏù¥??Î™©Î°ù</span>
            <span class="click_popup_close"><a><i class="xi-close"></i></a></span>
        </div>
        <div class="sub_title_area">
            <span>Í≥†Í∞ù?òÏùò ?ïÎ≥¥?Ä ?ºÏπò?òÎäî ?ÑÏù¥??Î™©Î°ù?ÖÎãà??</span>
        </div>
        <div class="click_popup_wrap">


            <div class="popup_id_select">
                <table class="popup_table" border="1" style="table-layout: fixed">
                    <th width="28.3%">Í∏∞ÏóÖÎ™?/th>
                    <th width="28.3%">?ÑÏù¥??/th>
                    <th width="28.3%">Í∞Ä?ÖÏùº</th>
                    <%--                    <th width="15%">?†ÌÉù</th>--%>
                    <tr><!-- Ï≤´Î≤àÏß?Ï§??úÏûë -->
                        <td id="companyName">Ï≤´Î≤àÏß?Í∏∞ÏóÖ</td>
                        <td id="employeeCode">Ï≤´Î≤à???ÑÏù¥??/td>
                        <td id="createdAt">Ï≤´Î≤àÏß?Í∞Ä?ÖÏùº</td>
                        <%--                        <td>--%>

                        <%--                            <!--Ï≤¥ÌÅ¨Î∞ïÏä§ ?úÏûë-->--%>
                        <%--                            <div class="chk_area">--%>
                        <%--                                <div class="chk_boxArea">--%>
                        <%--                                    <label class="item">--%>
                        <%--                                        <input type="checkbox" name="s_v1_0" id="s_v1_0" class="hidden" value="?†ÌÉù">--%>
                        <%--                                        <label class="cbx" for="s_v1_0">--%>
                        <%--                                            <svg height="20px" viewBox="0 -8 16 30" width="20px">--%>
                        <%--                                                <polyline points="1 7.6 5 11 13 1"></polyline>--%>
                        <%--                                            </svg>--%>
                        <%--                                        </label>--%>

                        <%--                                        <label class="cbx-lbl"></label>--%>
                        <%--                                    </label>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                            <!--Ï≤¥ÌÅ¨Î∞ïÏä§ ??->--%>

                        <%--                        </td>--%>

                    </tr><!-- Ï≤´Î≤àÏß?Ï§???-->

                    <%--                    <tr><!-- ?êÎ≤àÏß?Ï§??úÏûë -->--%>
                    <%--                        <td>?êÎ≤àÏß?Í∏∞ÏóÖ</td>--%>
                    <%--                        <td>?êÎ≤àÏß??ÑÏù¥??/td>--%>
                    <%--                        <td>?êÎ≤àÏß?Í∞Ä?ÖÏùº</td>--%>
                    <%--                        <td>--%>
                    <%--                            <!--Ï≤¥ÌÅ¨Î∞ïÏä§ ?úÏûë-->--%>
                    <%--                            <div class="chk_area">--%>
                    <%--                                <div class="chk_boxArea">--%>
                    <%--                                    <label class="item">--%>
                    <%--                                        <input type="checkbox" name="s_v2_0" id="s_v2_0" class="hidden" value="?†ÌÉù">--%>
                    <%--                                        <label class="cbx" for="s_v2_0">--%>
                    <%--                                            <svg height="20px" viewBox="0 -8 16 30" width="20px">--%>
                    <%--                                                <polyline points="1 7.6 5 11 13 1"></polyline>--%>
                    <%--                                            </svg>--%>
                    <%--                                        </label>--%>

                    <%--                                        <label class="cbx-lbl"></label>--%>
                    <%--                                    </label>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <!--Ï≤¥ÌÅ¨Î∞ïÏä§ ??->--%>

                    <%--                        </td>--%>
                    <%--                    </tr><!-- ?êÎ≤àÏß?Ï§???-->--%>

                    <%--                    <tr><!-- ?∏Î≤àÏß?Ï§??úÏûë -->--%>
                    <%--                        <td>?∏Î≤àÏß?Í∏∞ÏóÖ</td>--%>
                    <%--                        <td>?∏Î≤àÏß??ÑÏù¥??/td>--%>
                    <%--                        <td>?∏Î≤àÏß?Í∞Ä?ÖÏùº</td>--%>
                    <%--                        <td>--%>
                    <%--                            <!--Ï≤¥ÌÅ¨Î∞ïÏä§ ?úÏûë-->--%>
                    <%--                            <div class="chk_area">--%>
                    <%--                                <div class="chk_boxArea">--%>
                    <%--                                    <label class="item">--%>
                    <%--                                        <input type="checkbox" name="s_v3_0" id="s_v3_0" class="hidden" value="?†ÌÉù">--%>
                    <%--                                        <label class="cbx" for="s_v3_0">--%>
                    <%--                                            <svg height="20px" viewBox="0 -8 16 30" width="20px">--%>
                    <%--                                                <polyline points="1 7.6 5 11 13 1"></polyline>--%>
                    <%--                                            </svg>--%>
                    <%--                                        </label>--%>

                    <%--                                        <label class="cbx-lbl"></label>--%>
                    <%--                                    </label>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <!--Ï≤¥ÌÅ¨Î∞ïÏä§ ??->--%>
                    <%--                        </td>--%>
                    <%--                    </tr><!-- ?∏Î≤àÏß?Ï§???-->--%>

                </table>
                <div class="line"></div>
                <div class="btn_area">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="btn login_btn">
                                <span class="button_on_circle"></span>
                                <a href="login.html" class="btn_inner">
                                    <span class="btn_txt_area">
                                    Î°úÍ∑∏???òÍ∏∞ <i class="xi-log-in"></i>
                                    </span>
                                </a>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="btn find_password_btn">
                                <span class="button_on_circle"></span>
                                <a href="find_password.html" class="btn_inner">
                                    <span class="btn_txt_area">
                                    ÎπÑÎ?Î≤àÌò∏ Ï∞æÍ∏∞<i class="xi-lock"></i>
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


    /*?ÑÏù¥??ÎπÑÎ?Î≤àÌò∏ Ï∞æÍ∏∞ ?¥Î¶≠???ùÏóÖ Ï≤¥ÌÅ¨Î∞ïÏä§*/

    $(".chk_boxArea .item").click(function () {
        var chk = $(this).find("input").is(":checked");
        if (chk) { //Ï≤¥ÌÅ¨Í∞Ä ?òÏóà?ÑÏãú
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


$("#checkBtn").click(function () {

    if (!s_f1.value) { //?¥Î¶Ñ

        $("#s_f1").parents("label").addClass("input_focus").find("input").focus();
        setTimeout(() => {
            $("#s_f1").parents("label").removeClass("input_focus")
        }, 1000);

        Swal.fire('?¥Î¶Ñ???ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
        return;
        }

        if(!s_f2.value){ //?¥Î???Î≤àÌò∏

            $("#s_f2").parents("label").addClass("input_focus").find("input").focus();
            setTimeout(() => {
                $("#s_f2").parents("label").removeClass("input_focus")
            },  1000);

            Swal.fire('?¥Î???Î≤àÌò∏Î•??ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

    if (!s_f3.value) { //?∏Ï¶ùÎ≤àÌò∏

        $("#s_f3").parents("label").addClass("input_focus").find("input").focus();
        setTimeout(() => {
            $("#s_f3").parents("label").removeClass("input_focus")
        }, 1000);

        Swal.fire('?∏Ï¶ùÎ≤àÌò∏Î•??ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
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
