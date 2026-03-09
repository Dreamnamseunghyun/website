<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Í±¥Í∞ï?¥Ïûê(?¨Ïö©?? Í≥µÏ??¨Ìï≠</title>
    <link href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet" type="text/css">
    <link href="../css/us/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/us/common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/header.css" rel="stylesheet" type="text/css">
    <link href="../css/us/footer.css" rel="stylesheet" type="text/css">
    <link href="../css/us/reserve_step_line.css" rel="stylesheet" type="text/css">
    <link href="../css/us/sub_common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/notice.css" rel="stylesheet" type="text/css">
    <link href="../css/us/datatables.min.css" rel="stylesheet" type="text/css">
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
                </div><!--title_area-->
                <div class="tab_area">
                    <div class="tab">
                        <ul class="tab_list">
                            <li class="active"><a href="notice.html">Í≥µÏ??¨Ìï≠</a></li>
                            <li><a href="faq.html">?êÏ£º Î¨ªÎäî ÏßàÎ¨∏</a></li>
                            <li><a href="inquiry.html">1:1 Î¨∏Ïùò?òÍ∏∞</a></li>
                            <li><a href="common_sense.html">Í±¥Í∞ï??Í±¥Í∞ï ?ÅÏãù</a></li>
                        </ul>
                    </div>
                </div>
                <div class="board_wrap">
                    <p class="cont_title text-center">
                        <span class="quotation">Í≥†Í∞ù?òÍªò ?àÎ°ú???åÏãù???ÑÌï©?àÎã§</span>
                    </p>
                    <div class="table_wrap">
                        <table class="table">
                            <colgroup>
                                <col width="10%">
                                <col width="15%">
                                <col width="*">
                                <col width="15%">
                            </colgroup>
                        </table>

                        <table id="userNotice" class="display">
                            <thead>
                            <tr>
                                <th>?úÎ≤à</th>
                                <th>Íµ¨Î∂Ñ</th>
                                <th>?úÎ™©</th>
                                <th>?ëÏÑ±?ºÏûê</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div><!--container-->
            </div><!--main_cont-->
        </div>
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
        "emptyTable": "?∞Ïù¥?∞Í? ?ÜÏäµ?àÎã§.",
        "info": "_START_ - _END_ (Ï¥?_TOTAL_ Í∞?",
        "infoEmpty": "0Í∞?,
        "infoFiltered": "(?ÑÏ≤¥ _MAX_ Í∞?Ï§?Í≤Ä?âÍ≤∞Í≥?",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Í≤åÏãúÍ∏Ä _MENU_ Í∞?,
        "loadingRecords": "Î°úÎî©Ï§?..",
        "processing": "Ï≤òÎ¶¨Ï§?..",
        "search": "",
        // "zeroRecords": "Í≤Ä?âÏñ¥?Ä Í¥Ä?®Îêú ?¥Ïö©???ÜÏäµ?àÎã§.",
        "zeroRecords":'<div class="empty_info"><p><i class="fa fa-exclamation-triangle point_color"></i></p><p>Í≤Ä?âÏñ¥?Ä Í¥Ä?®Îêú ?¥Ïö©??Í∏Ä???ÜÏäµ?àÎã§.<br>?§Î•∏ Í≤Ä?âÏñ¥Î•??ÖÎ†•??Ï£ºÏÑ∏??</p></div>',
        "paginate": {
            "first": "Ï≤??òÏù¥ÏßÄ",
            "last": "ÎßàÏ?Îß??òÏù¥ÏßÄ",
            "next": '<i class="xi-angle-right"></i>',
            "previous": '<i class="xi-angle-left"></i>'
        },
        "aria": {
            "sortAscending": " :  ?§Î¶ÑÏ∞®Ïàú ?ïÎ†¨",
            "sortDescending": " :  ?¥Î¶ºÏ∞®Ïàú ?ïÎ†¨"
        }
    };

    // load
    $(function () {
        let userNotice = $('#userNotice').DataTable({
            language: lang_kor,
            // lengthMenu: [[5, 10, 20, -1], [5, 10, 20, "All"]],
            lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
            ajax: {
                type: 'GET',
                url: '<c:url value="/us/notice"/>',
                dataType: 'JSON',
            },
            columns: [
                {
                    render: function (data, type, row, meta) {
                        return meta.row + 1;
                    }
                },
                {
                    data: 'targetId',
                    render: function (data, type, row, meta) {
                        return row.targetName;
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
                                return "<a class='title' href='<c:url value="/us/notice"/>?noticeId=" + row.noticeId + "'>" + title + "</a>";
                            }
                            return data;
                        }
                    }
                },
                {
                    data: 'writedAt',
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
                $(".dataTables_wrapper .dataTables_filter label").attr({for:"search"}).append('<span class="label">Í≤Ä?âÏñ¥Î•??ÖÎ†•??Ï£ºÏÑ∏??</span>');
                $(".dataTables_wrapper .dataTables_filter label input").attr({type:"text", name:"search", placeholder:" ", autocomplete:"off", type:"text"});
                $(".dataTables_wrapper .dataTables_filter").append('<div class="btn search_btn"><span class="button_on_circle desplode-circle"></span><a class="btn_inner point_color"><span class="btn_txt_area"><i class="xi-search"></i></span></a></div>')
            }
        });
    });





</script>
</body>
</html>
