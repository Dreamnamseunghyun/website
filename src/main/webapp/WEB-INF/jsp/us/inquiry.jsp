<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건강살자(사용자) 공지사항</title>
    <link href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet" type="text/css">
    <link href="../css/us/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/us/common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/header.css" rel="stylesheet" type="text/css">
    <link href="../css/us/footer.css" rel="stylesheet" type="text/css">
    <link href="../css/us/reserve_step_line.css" rel="stylesheet" type="text/css">
    <link href="../css/us/datatables.min.css" rel="stylesheet" type="text/css">
    <link href="../css/us/notice.css" rel="stylesheet" type="text/css">
    <link href="../css/us/sub_common.css" rel="stylesheet" type="text/css">
    <style>
        body .board_wrap .table_wrap table thead th:nth-of-type(1){width:10%!important}
        body .board_wrap .table_wrap table thead th:nth-of-type(2){width:15%!important}
        body .board_wrap .table_wrap table thead th:nth-of-type(3){width:45%!important}
        body .board_wrap .table_wrap table thead th:nth-of-type(4){width:15%!important}
        body .board_wrap .table_wrap table thead th:nth-of-type(5){width:15%!important}
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
                        <span class="quotation empty_title">
                                        접수내용은 <span class="point_color"
                                                    style="text-decoration: underline">최대한 빠르게 확인하여</span> 답변드리도록 하겠습니다.
                                        </span>
                    </p>
                    <div class="table_wrap">
                        <table class="table">
                            <colgroup>
                                <col width="10%">
                                <col width="15%">
                                <col width="*">
                                <col width="15%">
                                <col width="15%">
                            </colgroup>
                        </table>

                        <table id="userQna" class="display">
                            <thead>
                            <tr>
                                <th>순번</th>
                                <th>구분</th>
                                <th>제목</th>
                                <th>처리현황</th>
                                <th>작성일자</th>
                            </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="btn_type2">
                        <div class="btn_area">
                            <div class="btn inquiry_btn">
                                <span class="button_on_circle"></span>
                                <a href="inquiry_edit.html" class="btn_inner blue_gradient">
                                    <span class="btn_txt_area">문의글 작성하기</span>
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
<script src="../js/us/datatables.min.js" type="text/javascript" charset="utf8"></script>
<script>
    $("header").load("header.html");
    $("footer").load("footer.html");

    // Korean
    var lang_kor = {
        "decimal": "",
        "emptyTable": "데이터가 없습니다.",
        "info": "_START_ - _END_ (총 _TOTAL_ 개)",
        "infoEmpty": "0개",
        "infoFiltered": "(전체 _MAX_ 개 중 검색결과)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "게시글 _MENU_ 개",
        "loadingRecords": "로딩중...",
        "processing": "처리중...",
        "search": "",
        // "zeroRecords": "검색어와 관련된 내용이 없습니다.",
        "zeroRecords":'<div class="empty_info"><p><i class="fa fa-exclamation-triangle point_color"></i></p><p>검색어와 관련된 내용의 글이 없습니다.<br>다른 검색어를 입력해 주세요.</p></div>',
        "paginate": {
            "first": "첫 페이지",
            "last": "마지막 페이지",
            "next": '<i class="xi-angle-right"></i>',
            "previous": '<i class="xi-angle-left"></i>'
        },
        "aria": {
            "sortAscending": " :  오름차순 정렬",
            "sortDescending": " :  내림차순 정렬"
        }
    };
    // load
    $(function () {
        let userQna = $('#userQna').DataTable({
            language: lang_kor,
            // lengthMenu: [[5, 10, 20, -1], [5, 10, 20, "All"]],
            lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
            ajax: {
                type: 'GET',
                url: '<c:url value="/us/inquiry"/>',
                dataType: 'JSON',
            },
            columns: [
                {
                    render: function (data, type, row, meta) {
                        return meta.row + 1;
                    }
                },
                {
                    data: 'category',
                    render: function (data, type, row, meta) {
                        if (data === 0) {
                            return '<td class="sort">예약문의</a></td>';
                        } else if (data === 1) {
                            return '<td class="sort">결과상담</a></td>';
                        } else if (data === 2) {
                            return '<td class="sort">불만사항</a></td>';
                        } else if (data === 3) {
                            return '<td class="sort">홈페이지</a></td>';
                        } else if (data === 4) {
                            return '<td class="sort">기타문의</a></td>';
                        }
                    }
                },
                {
                    data: 'title',
                    render: function (data, type, row, meta) {
                        if (data && type === 'filter') {
                            return data;
                        } else {
                            if (data) {
                                let title = data.substring();
                                return "<a class='title' href='<c:url value="/us/inquiry"/>?qnaId=" + row.qnaId + "'>" + title + "</a>";
                            }
                            return data;
                        }
                    }
                },
                {
                    data: 'answerCheck',
                    render: function (data, type, row, meta) {
                        if (data === false) {
                            return '<td class="status"><i class="xi-message"></i>답변 중</a></td>';
                        } else {
                            return '<td class="status"><i class="xi-check-circle"></i>답변완료</a></td>';
                        }
                    }
                },
                {
                    data: 'questionAt',
                    render: function (data, type) {
                        if (data && type === 'filter') {
                            return data + '' + new Date(data).toISOString().substring(0, 10);
                        } else {
                            return new Date(data).toISOString().substring(0, 10);
                        }
                    }
                },
            ],
            fnInitComplete:function(){

                $(".dataTables_wrapper .dataTables_filter label").wrap('<div class="search_box_area write"></div>').wrap('<div class="input_type1"></div>');
                $(".dataTables_wrapper .dataTables_filter label").attr({for:"search"}).append('<span class="label">검색어를 입력해 주세요.</span>');
                $(".dataTables_wrapper .dataTables_filter label input").attr({type:"text", name:"search", placeholder:" ", autocomplete:"off", type:"text"});
                $(".dataTables_wrapper .dataTables_filter").append('<div class="btn search_btn"><span class="button_on_circle desplode-circle"></span><a class="btn_inner point_color"><span class="btn_txt_area"><i class="xi-search"></i></span></a></div>')
            }

        });
    });

    //empty화면은 tr 2개를 주석 처리 하시면 보여집니다.
    $("document").ready(function () {
        var data_length = $(".table_wrap table tr").length; //게시글 갯수세기
        if (data_length < 2) { //게시글이 하나도 없을때 (1개는 제목 라인)
            $(".table_wrap").addClass("data_empty")
            $(".cont_title").addClass("data_empty")
        }
    })





</script>
</body>
</html>
