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
<style>


</style>
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
                            <li class="active"><a href="faq.html">?êÏ£º Î¨ªÎäî ÏßàÎ¨∏</a></li>
                            <li><a href="inquiry.html">1:1 Î¨∏Ïùò?òÍ∏∞</a></li>
                            <li><a href="common_sense.html">Í±¥Í∞ï??Í±¥Í∞ï ?ÅÏãù</a></li>
                        </ul>
                    </div>
                    <div class="board_wrap">
                        <p class="cont_title text-center">
                            <span class="quotation">Í≥†Í∞ù?òÎì§ÍªòÏÑú ÎßéÏù¥ Í∂ÅÍ∏à???òÏãú???¥Ïö©?ÖÎãà??</span>
                        </p>
                        <div class="search_area">
                            <div class="search_box_area">
                                <div class="input_type1">
                                    <label for="search">
                                        <input onkeyup="filter();" type="text" name="search" id="search"
                                               placeholder="&nbsp;" required=""
                                               autocomplete="off">
                                        <span class="label">Í≤Ä?âÏñ¥Î•??ÖÎ†•??Ï£ºÏÑ∏??</span>
                                    </label>
                                </div>
                            </div>
                            <!--search_box-->
                            <div class="btn search_btn">
                                <span class="button_on_circle"></span>
                                <a class="btn_inner point_color">
                                    <span class="btn_txt_area"><i class="xi-search"></i></span>
                                </a>
                            </div>
                        </div>
                        <div class="faq_tab">
                            <ul class="tabList">
                                <li <c:if test="${category == 'RESERVE'}">class="active"</c:if>><a
                                        href="faq.html?category=RESERVE">Í≤ÄÏßÑÏòà??/a></li>
                                <li <c:if test="${category == 'RESULT'}">class="active"</c:if>><a
                                        href="faq.html?category=RESULT">Í≤ÄÏßÑÍ≤∞Í≥?/a></li>
                                <li <c:if test="${category == 'CAUTION'}">class="active"</c:if>><a
                                        href="faq.html?category=CAUTION">Ï£ºÏùò?¨Ìï≠</a></li>
                                <li <c:if test="${category == 'ETC'}">class="active"</c:if>><a
                                        href="faq.html?category=ETC">Í∏∞Ì?</a></li>
                            </ul>
                            <div class="border"></div>
                        </div>

                        <div class="faq_list">
                            <ul>
                                <c:forEach items="${faqList}" var="faq">
                                    <li>
                                        <div class="list_question">
                                            <div class="question_icon en">Q</div>
                                            <div class="cate">
                                                <c:choose>
                                                    <c:when test="${faq.category == 'RESERVE'}">Í≤ÄÏßÑÏòà??/c:when>
                                                    <c:when test="${faq.category == 'RESULT'}">Í≤ÄÏßÑÍ≤∞Í≥?/c:when>
                                                    <c:when test="${faq.category == 'CAUTION'}">Ï£ºÏùò?¨Ìï≠</c:when>
                                                    <c:when test="${faq.category == 'ETC'}">Í∏∞Ì?</c:when>
                                                    <c:otherwise>test</c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="title"><c:out value="${faq.title}"/></div>
                                            <div class="toggle_icon"><i class="xi-angle-down"></i></div>
                                        </div>
                                        <div class="list_answer">
                                            <div class="list_answer_wrap">
                                                <c:out value="${faq.contents}" escapeXml="false"/>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                                <%--                                <li>--%>
                                <%--                                    <div class="list_question">--%>
                                <%--                                        <div class="question_icon en">Q</div>--%>
                                <%--                                        <div class="cate">Í≤ÄÏß??àÏïΩ ÏßàÎ¨∏</div>--%>
                                <%--                                        <div class="title">IDÎ•?Î≥ÄÍ≤ΩÌï† ???àÎÇò??</div>--%>
                                <%--                                        <div class="toggle_icon"><i class="xi-angle-down"></i></div>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="list_answer">--%>
                                <%--                                        <div class="list_answer_wrap">--%>
                                <%--                                            <p>?¥Î? Í∞Ä?ÖÎêú ID??Î≥ÄÍ≤ΩÌïò?????ÜÏäµ?àÎã§.<br>--%>
                                <%--                                                IDÍ∞Ä ?òÎ™ª??Í≤ΩÏö∞ Í∏∞ÏóÖ?åÏõê?Ä Í∏∞ÏóÖ ?¥Îãπ?êÎ? ?µÌïò???òÎ™ª???åÏõê?ïÎ≥¥Î•??òÏ†ï??Ï£ºÏãúÍ≥?<br>--%>
                                <%--                                                Í∞úÏù∏?åÏõê?Ä ?åÏõê?àÌá¥ ???¨Í????¥Ï£º?úÍ∏∞ Î∞îÎûç?àÎã§.--%>
                                <%--                                            </p>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                </li>--%>
                            </ul>
                        </div><!--faq_list-->

                        <!--pagination-->
                        <div id="pagination" class="pagination">
                            <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
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
<script src="../js/us/sub_common.js"></script>
<script>

    /*?òÏù¥Ïß?Ï≤òÎ¶¨*/
    function linkPage(pageNo) {
        let category = '${category}';
        location.href = '<c:url value="/us/faq?category="/>' + category + "&pageNo=" + pageNo;

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

    $(".tab_area .faq_list ul li .list_answer p img").parents("p").addClass("img_wrap");

    $(".faq_list ul li .list_question").click(function () {
        $(this).parents("li").toggleClass("active").find(".list_answer").toggleClass("active").slideToggle(400, "swing");
    });


    var active_left = $(".faq_tab ul li.active").position().left;
    $(window).on("load", function () {
        $(".tab_area .faq_tab .border").css({"left": active_left});
    });


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



</script>
</body>
</html>
