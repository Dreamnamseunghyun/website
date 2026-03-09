<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건강살자(사용자) 자주 묻는 질문</title>
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
                            <h2>고객센터</h2>
                        </div>
                    </div>
                </div>
                <!--title_area-->
                <div class="tab_area">
                    <div class="tab">
                        <ul class="tab_list">
                            <li><a href="notice.html">공지사항</a></li>
                            <li class="active"><a href="faq.html">자주 묻는 질문</a></li>
                            <li><a href="inquiry.html">1:1 문의하기</a></li>
                            <li><a href="common_sense.html">건강한 건강 상식</a></li>
                        </ul>
                    </div>
                    <div class="board_wrap">
                        <p class="cont_title text-center">
                            <span class="quotation">고객님들께서 많이 궁금해 하시는 내용입니다.</span>
                        </p>
                        <div class="search_area">
                            <div class="search_box_area">
                                <div class="input_type1">
                                    <label for="search">
                                        <input onkeyup="filter();" type="text" name="search" id="search"
                                               placeholder="&nbsp;" required=""
                                               autocomplete="off">
                                        <span class="label">검색어를 입력해 주세요.</span>
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
                                        href="faq.html?category=RESERVE">검진예약</a></li>
                                <li <c:if test="${category == 'RESULT'}">class="active"</c:if>><a
                                        href="faq.html?category=RESULT">검진결과</a></li>
                                <li <c:if test="${category == 'CAUTION'}">class="active"</c:if>><a
                                        href="faq.html?category=CAUTION">주의사항</a></li>
                                <li <c:if test="${category == 'ETC'}">class="active"</c:if>><a
                                        href="faq.html?category=ETC">기타</a></li>
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
                                                    <c:when test="${faq.category == 'RESERVE'}">검진예약</c:when>
                                                    <c:when test="${faq.category == 'RESULT'}">검진결과</c:when>
                                                    <c:when test="${faq.category == 'CAUTION'}">주의사항</c:when>
                                                    <c:when test="${faq.category == 'ETC'}">기타</c:when>
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
                                <%--                                        <div class="cate">검진 예약 질문</div>--%>
                                <%--                                        <div class="title">ID를 변경할 수 있나요?</div>--%>
                                <%--                                        <div class="toggle_icon"><i class="xi-angle-down"></i></div>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="list_answer">--%>
                                <%--                                        <div class="list_answer_wrap">--%>
                                <%--                                            <p>이미 가입된 ID는 변경하실 수 없습니다.<br>--%>
                                <%--                                                ID가 잘못된 경우 기업회원은 기업 담당자를 통하여 잘못된 회원정보를 수정해 주시고,<br>--%>
                                <%--                                                개인회원은 회원탈퇴 후 재가입 해주시기 바랍니다.--%>
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

    /*페이징 처리*/
    function linkPage(pageNo) {
        let category = '${category}';
        location.href = '<c:url value="/us/faq?category="/>' + category + "&pageNo=" + pageNo;

        /*페이징 후 화면 처리*/
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

        if (search_val_length < 1) { //적은 단어가 1개 이하일때 (하나도없을때)
            $('.faq_list ul li').show();
        } else if (search_val_length > 0) {//적은 단어가 0개 이상일때 (하나라도 있을때)
            $('.faq_list ul li').hide();

            $('.tab_area .faq_list ul li .list_question .title:contains("' + search_val + '")').parents("li").show();
        }
    });//keyup



</script>
</body>
</html>
