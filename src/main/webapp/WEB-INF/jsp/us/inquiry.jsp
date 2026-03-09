<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>ê±´ê°•?´ì(?¬ìš©?? ê³µì??¬í•­</title>
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
                            <h2>ê³ ê°?¼í„°</h2>
                        </div>
                    </div>
                </div><!--title_area-->
                <div class="tab_area">
                    <div class="tab">
                        <ul class="tab_list">
                            <li><a href="notice.html">ê³µì??¬í•­</a></li>
                            <li><a href="faq.html">?ì£¼ ë¬»ëŠ” ì§ˆë¬¸</a></li>
                            <li class="active"><a href="inquiry.html">1:1 ë¬¸ì˜?˜ê¸°</a></li>
                            <li><a href="common_sense.html">ê±´ê°•??ê±´ê°• ?ì‹</a></li>
                        </ul>
                    </div>
                </div>
                <div class="board_wrap">
                    <p class="cont_title text-center">
                                        <span class="quotation">
                                        ê³ ê°?˜ê»˜???„ìš”?˜ì‹  ?´ìš©???µë??´ë“œë¦½ë‹ˆ??<br>
                                        ê³ ê°?˜ì˜ ë¬¸ì˜ê°€ ë§ì•„ ?µë?????–´ì§????ˆëŠ” ???‘í•´ ë°”ë?ˆë‹¤.
                                        </span>
                        <span class="quotation empty_title">
                                        ?‘ìˆ˜?´ìš©?€ <span class="point_color"
                                                    style="text-decoration: underline">ìµœë???ë¹ ë¥´ê²??•ì¸?˜ì—¬</span> ?µë??œë¦¬?„ë¡ ?˜ê² ?µë‹ˆ??
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
                                <th>?œë²ˆ</th>
                                <th>êµ¬ë¶„</th>
                                <th>?œëª©</th>
                                <th>ì²˜ë¦¬?„í™©</th>
                                <th>?‘ì„±?¼ì</th>
                            </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="btn_type2">
                        <div class="btn_area">
                            <div class="btn inquiry_btn">
                                <span class="button_on_circle"></span>
                                <a href="inquiry_edit.html" class="btn_inner blue_gradient">
                                    <span class="btn_txt_area">ë¬¸ì˜ê¸€ ?‘ì„±?˜ê¸°</span>
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
        "emptyTable": "?°ì´?°ê? ?†ìŠµ?ˆë‹¤.",
        "info": "_START_ - _END_ (ì´?_TOTAL_ ê°?",
        "infoEmpty": "0ê°?,
        "infoFiltered": "(?„ì²´ _MAX_ ê°?ì¤?ê²€?‰ê²°ê³?",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "ê²Œì‹œê¸€ _MENU_ ê°?,
        "loadingRecords": "ë¡œë”©ì¤?..",
        "processing": "ì²˜ë¦¬ì¤?..",
        "search": "",
        // "zeroRecords": "ê²€?‰ì–´?€ ê´€?¨ëœ ?´ìš©???†ìŠµ?ˆë‹¤.",
        "zeroRecords":'<div class="empty_info"><p><i class="fa fa-exclamation-triangle point_color"></i></p><p>ê²€?‰ì–´?€ ê´€?¨ëœ ?´ìš©??ê¸€???†ìŠµ?ˆë‹¤.<br>?¤ë¥¸ ê²€?‰ì–´ë¥??…ë ¥??ì£¼ì„¸??</p></div>',
        "paginate": {
            "first": "ì²??˜ì´ì§€",
            "last": "ë§ˆì?ë§??˜ì´ì§€",
            "next": '<i class="xi-angle-right"></i>',
            "previous": '<i class="xi-angle-left"></i>'
        },
        "aria": {
            "sortAscending": " :  ?¤ë¦„ì°¨ìˆœ ?•ë ¬",
            "sortDescending": " :  ?´ë¦¼ì°¨ìˆœ ?•ë ¬"
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
                            return '<td class="sort">?ˆì•½ë¬¸ì˜</a></td>';
                        } else if (data === 1) {
                            return '<td class="sort">ê²°ê³¼?ë‹´</a></td>';
                        } else if (data === 2) {
                            return '<td class="sort">ë¶ˆë§Œ?¬í•­</a></td>';
                        } else if (data === 3) {
                            return '<td class="sort">?ˆí˜?´ì?</a></td>';
                        } else if (data === 4) {
                            return '<td class="sort">ê¸°í?ë¬¸ì˜</a></td>';
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
                            return '<td class="status"><i class="xi-message"></i>?µë? ì¤?/a></td>';
                        } else {
                            return '<td class="status"><i class="xi-check-circle"></i>?µë??„ë£Œ</a></td>';
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
                $(".dataTables_wrapper .dataTables_filter label").attr({for:"search"}).append('<span class="label">ê²€?‰ì–´ë¥??…ë ¥??ì£¼ì„¸??</span>');
                $(".dataTables_wrapper .dataTables_filter label input").attr({type:"text", name:"search", placeholder:" ", autocomplete:"off", type:"text"});
                $(".dataTables_wrapper .dataTables_filter").append('<div class="btn search_btn"><span class="button_on_circle desplode-circle"></span><a class="btn_inner point_color"><span class="btn_txt_area"><i class="xi-search"></i></span></a></div>')
            }

        });
    });

    //empty?”ë©´?€ tr 2ê°œë? ì£¼ì„ ì²˜ë¦¬ ?˜ì‹œë©?ë³´ì—¬ì§‘ë‹ˆ??
    $("document").ready(function () {
        var data_length = $(".table_wrap table tr").length; //ê²Œì‹œê¸€ ê°?ˆ˜?¸ê¸°
        if (data_length < 2) { //ê²Œì‹œê¸€???˜ë‚˜???†ì„??(1ê°œëŠ” ?œëª© ?¼ì¸)
            $(".table_wrap").addClass("data_empty")
            $(".cont_title").addClass("data_empty")
        }
    })





</script>
</body>
</html>
