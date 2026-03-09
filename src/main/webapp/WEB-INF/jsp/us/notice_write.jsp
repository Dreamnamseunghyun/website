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
        .write_wrap div {
            width: 100%;
            background: #fff;
            font-size: 24px;
            border: none;
            height: auto;
            letter-spacing: -.5px;
        }

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
                        <span class="quotation">고객님께 새로운 소식을 전합니다</span>
                    </p>
                    <div class="table_wrap">
                        <table class="table">
                            <colgroup>
                                <col width="15%">
                                <col width="*">
                                <col width="15%">
                            </colgroup>
                            <thead>
                            <th>구분</th>
                            <th>제목</th>
                            <th>작성일자</th>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <div id="targetName"></div>
                                </td>
                                <td>
                                    <div id="title"></div>
                                </td>
                                <td>
                                    <div id="writedAt"></div>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="write_wrap">
                            <div id="noticeContent" style="resize: none;" disabled></div>
                        </div>

                        <div class="write_file">
                            <div class="file_title_area">
                                <span class="toggle_button"><i class="xi-caret-up"></i></span>
                                <i class="xi-paperclip"></i>
                                <span class="title_text">게시글 첨부파일
                                        <span class="file_length point_color"><span class="length">
                                    </span>
                                <%--                                <span class="file_size">(<span class="size">28KB</span>)</span>--%>
                                <%--                                <a href="#none" class="download_link">모두 저장</a>--%>
                            </div>
                            <div class="file_download_area">
                                    <span class="download_icon">
                                        <a href="">
                                            <i class="xi-download"></i>
                                        </a>
                                    </span>
                                <span class="file_name"><a class="download_link"></a></span>
                                <%--                                <span class="file_size">(<span class="size">28KB</span>)</span>--%>
                            </div>

                        </div>

                        <div class="write_pagenation">
                            <table class="table">
                                <colgroup>
                                    <col width="10%">
                                    <col width="15%">
                                    <col width="*">
                                    <col width="15%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <td><a onclick=""><i class="xi-angle-up"></i>다음글</a></td>
                                    <td><a onclick="" id="targetNameNext"></a></td>
                                    <td><a href='#none' id="titleNext"></a></td>
                                    <td><a onclick="" id="writedAtNext"></a></td>
                                </tr>
                                <tr>
                                    <td><a onclick=""><i class="xi-angle-down"></i>이전글</a></td>
                                    <td><a onclick="" id="targetNameBefore"></a></td>
                                    <td><a href="#none" id="titleBefore"></a></td>
                                    <td><a onclick="" id="writedAtBefore"></a></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div><!--table_wrap-->

                </div><!--board_wrap-->

            </div><!--container-->
        </div><!--main_cont-->
    </section><!--main_section-->

    <div class="btn_area">
        <div class="btn check_btn">
            <span class="button_on_circle"></span>
            <a href="notice" class="btn_inner grey">
                <span class="btn_txt_area">목록으로</span>
            </a>
        </div>
    </div>

</main>

<footer>
</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>

    $("header").load("header.html");
    $("footer").load("footer.html");

    $(function () {
        // Load
        $.ajax({
            url: '<c:url value="/us/notice/${noticeId}"/>',
            method: 'GET',
        }).then(function (response) {
            console.log(response.data);
            $("#noticeContent").html(response.data[0].contents);
            $("#targetName").html(response.data[0].targetName);
            $("#title").html(response.data[0].title);
            $("#writedAt").html(new Date(response.data[0].writedAt).toISOString().substring(0, 10));

            if (response.data[1] === null) {
                $("#titleNext").html('다음글이 없습니다.');
            } else {
                $("#targetNameNext").html(response.data[1].targetName);
                $("#titleNext").html(response.data[1].title).attr('href', '<c:url value="/us/notice"/>?noticeId=' + response.data[1].noticeId);
                $("#writedAtNext").html(new Date(response.data[1].writedAt).toISOString().substring(0, 10));
            }

            if (response.data[2] === null) {
                $("#titleBefore").html('이전글이 없습니다.');
            } else {
                $("#targetNameBefore").html(response.data[2].targetName);
                $("#titleBefore").html(response.data[2].title).attr('href', '<c:url value="/us/notice"/>?noticeId=' + response.data[2].noticeId);
                $("#writedAtBefore").html(new Date(response.data[2].writedAt).toISOString().substring(0, 10));
            }

            if (response.data[0].attachFilename) {
                $(".download_link").html(response.data[0].attachFilename).attr('href', response.data[0].attachUrl);
                $(".download_icon a").attr('href', response.data[0].attachUrl);
            } else {
                $(".write_file .file_length .length").text('0');
                let file_length = $(".write_file .file_length .length").text();
                if (file_length === "0") {
                    $(".toggle_button").remove();
                    $(".write_file .file_download_area").remove();
                    $(".write_file .file_title_area .file_size").remove();
                    $(".file_length").empty();
                    $(".title_text").text('첨부파일이 없습니다.');
                    $(".file_title_area").css({"color": "#999"})
                }
            }
        });
    });

    $(".write_file .toggle_button").click(function () {
        $(this).parents(".write_file").toggleClass("active");
    });

</script>
</body>
</html>
