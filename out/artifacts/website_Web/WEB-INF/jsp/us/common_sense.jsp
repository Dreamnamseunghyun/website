<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Í±¥Í∞ï?¥Ïûê(?¨Ïö©?? ?êÏ£º Î¨ªÎäî ÏßàÎ¨∏</title>
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
                            <h2>Í≥†Í∞ù?ºÌÑ∞</h2>
                        </div>
                    </div>
                </div>
                <!--title_area-->
                <div class="tab_area">
                    <div class="tab">
                        <ul class="tab_list">
                            <li><a href="notice.html">Í≥µÏ??¨Ìï≠</a></li>
                            <li><a href="faq.html">?êÏ£º Î¨ªÎäî ÏßàÎ¨∏</a></li>
                            <li><a href="inquiry.html">1:1 Î¨∏Ïùò?òÍ∏∞</a></li>
                            <li class="active"><a href="common_sense.html">Í±¥Í∞ï??Í±¥Í∞ï ?ÅÏãù</a></li>
                        </ul>
                    </div>
                    <div class="board_wrap">
                        <p class="cont_title text-center">
                            <span class="quotation">Í≥†Í∞ù?òÎì§Íª?Í±¥Í∞ï??Í±¥Í∞ï?ÅÏãù???åÎ†§?úÎ¶Ω?àÎã§.</span>
                        </p>
                        <div class="search_area">
                            <div class="search_box_area">
                                <div class="input_type1">
                                    <label for="search">
                                        <input type="text" name="search" id="search" placeholder="&nbsp;" required=""
                                               autocomplete="off">
                                        <span class="label">Í≤Ä?âÏñ¥Î•??ÖÎ†•??Ï£ºÏÑ∏??</span>
                                    </label>
                                </div>
                            </div>
                            <!--search_box-->
                            <div class="btn search_btn">
                                <span class="button_on_circle"></span>
                                <a href="#none" class="btn_inner point_color">
                                    <span class="btn_txt_area"><i class="xi-search"></i></span>
                                </a>
                            </div>
                        </div>


                        <div class="faq_list">
                            <ul>
                                <c:forEach items="${healthSenseList}" var="healthSense">
                                    <li>
                                        <div class="list_question">
                                            <div class="question_icon en">Q</div>
                                            <div class="title"><c:out value="${healthSense.title}"/></div>
                                            <div class="toggle_icon"><i class="xi-angle-down"></i></div>
                                        </div>
                                        <div class="list_answer">
                                            <div class="list_answer_wrap">
                                                <p><A href="<c:out value="${healthSense.linkUrl}"/>"
                                                      target="blank"><c:out
                                                        value="${healthSense.linkUrl}"/> </A>
                                                </p>
                                            </div>
                                            <img src="<c:out value="${healthSense.attachUrl}" escapeXml="false"/>"
                                                 alt="Í±¥Í∞ï?ÅÏãù ?¥Î?ÏßÄ"/>
                                        </div>
                                    </li>
                                </c:forEach>
                                <%--                                <li>--%>
                                <%--                                    <div class="list_question">--%>
                                <%--                                        <div class="question_icon en">Q</div>--%>
                                <%--                                        <div class="cate">?àÎ∞©?òÏπô</div>--%>
                                <%--                                        <div class="title">?¥Ïô∏ Í∞êÏóºÎ≥??àÎ∞©?òÏπô</div>--%>
                                <%--                                        <div class="toggle_icon"><i class="xi-angle-down"></i></div>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="list_answer">--%>
                                <%--                                        <div class="list_answer_wrap">--%>
                                <%--                                            <p><img src="../img/us/customer_service/health_sense2.png">--%>
                                <%--                                            </p>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                </li>--%>
                                <%--                                <li>--%>
                                <%--                                    <div class="list_question">--%>
                                <%--                                        <div class="question_icon en">Q</div>--%>
                                <%--                                        <div class="cate">Í≤ÄÏß??àÏïΩ ÏßàÎ¨∏</div>--%>
                                <%--                                        <div class="title">Í±¥Í∞ï?ÅÏãù ÏßàÎ¨∏3</div>--%>
                                <%--                                        <div class="toggle_icon"><i class="xi-angle-down"></i></div>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="list_answer">--%>
                                <%--                                        <div class="list_answer_wrap">--%>
                                <%--                                            <p>Í±¥Í∞ï?ÅÏãù ÏßàÎ¨∏3???¥Ïö©?ÖÎãà??--%>
                                <%--                                            </p>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                </li>--%>
                            </ul>
                        </div><!--faq_list-->

                        <!--pagination-->
                        <div id="pagination" class="pagination">
                            <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/>
                        </div><!--pagination-->

                    </div><!--board_wrap-->
                </div><!--tab_area-->
            </div><!--container-->
        </div><!--main_cont-->
    </section><!--main_section-->


</main>


<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>
<script>

    function linkPage(pageNo) {
        location.href = '<c:url value="/us/common_sense?="/>' + "&pageNo=" + pageNo;

        /*?òÏù¥Ïß????îÎ©¥ Ï≤òÎ¶¨*/
        $(document).ready(function () {
            $('#pagination').focus();
        });
    }

    let indexCount = $(".list_question").length;
    let totalCount;

    for (let i = 0; i < indexCount; i++) {
        if (i > 5) {
            for (let j = 0; j < i - 4; j++) {
                $(".paging").append('<i class="paging">j</i>');
            }
        } else {
            $(".paging").append('<i class="paging">1</i>');
            break;
        }
    }

    $("header").load("header.html");
    $("footer").load("footer.html");

    $(".tab_area .faq_list ul li .list_answer p img").parents("p").addClass("img_wrap")

    $(".faq_tab ul li a").click(function () {

        $(this).parents("li").addClass("active").siblings("li").removeClass("active");
        var active_left = $(".faq_tab ul li.active").position().left;
        $(this).parents(".faq_tab").find(".border").css({"left": active_left})
    })


    $(".faq_list ul li .list_question").click(function () {
        $(this).parents("li").toggleClass("active").find(".list_answer").toggleClass("active").slideToggle(400, "swing");
    })

    $('#search').on('keyup', function (e) {
        var search_val = $(this).val();
        var search_val_length = $(this).val().length;

        if (search_val_length < 1) { //?ÅÏ? ?®Ïñ¥Í∞Ä 1Í∞??¥Ìïò?ºÎïå (?òÎÇò?ÑÏóÜ?ÑÎïå)
            $('.faq_list ul li').show();
        } else if (search_val_length > 0) {//?ÅÏ? ?®Ïñ¥Í∞Ä 0Í∞??¥ÏÉÅ?ºÎïå (?òÎÇò?ºÎèÑ ?àÏùÑ??
            $('.faq_list ul li').hide();

            $('.tab_area .faq_list ul li .list_question .title:contains("' + search_val + '")').parents("li").show();
        }
    });//keyup

    window.onload = function () {

        var pagenation_active = $(".pagination strong").index();
        var pagenation_h = $(".board_wrap").offset().top;


        if (pagenation_active > 2) {
            $('html, body').stop().animate({scrollTop: pagenation_h}, 350);
        }
    }

</script>
</body>
</html>
