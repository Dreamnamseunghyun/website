<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%--@elvariable id="sessionLoginName" type="java.lang.String"--%>

<!DOCTYPE html>
<html lang="ko">

<%@include file="/WEB-INF/jsp/common/head.jsp" %>

<body class="fixed-header dashboard menu-pin menu-behind">
<%@include file="/WEB-INF/jsp/common/nav.jsp" %>

<div class="page-container ">
    <%@include file="/WEB-INF/jsp/common/header.jsp" %>

    <div class="page-content-wrapper ">
        <div class="content sm-gutter">
            <div class=" container-fluid  padding-30 sm-padding-10 container-fixed-lg bg-white">
                <div class="card card-transparent board_internal">
                    <div class="card-header ">
                        <div class="card-title">
                            <h3 class="h3">1:1문의</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap right">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12" id="searchGrid" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Header -->

                        <div id="dataGridOne2One" class="main_table" data-ggsj="dxDataGrid">
                        </div>
                    </div>
                    <%--                    </div>--%>
                </div>
            </div>
        </div>


    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        ggsj.openMenu('one2one');

        let dxInstances = ggsj.createDx(false);

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridOne2One.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridOne2One.option({
            dataSource: {
                load: function () {
                    return $.ajax({
                        url: '<c:url value="/pm/commune/one2one"/>',
                    });
                }
            },
            columns: [{
                caption: '순번',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'category',
                caption: '구분',
                alignment: 'center',
                width: 230,
                lookup: {
                    dataSource: [
                        {'id': 0, 'text': '예약문의'},
                        {'id': 1, 'text': '결과상담'},
                        {'id': 2, 'text': '불만사항'},
                        {'id': 3, 'text': '홈페이지'},
                        {'id': 4, 'text': '기타문의'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                dataField: 'title',
                cellTemplate: function (cellElement, cellInfo) {
                    let qnaId = cellInfo.row.data.qnaId;
                    cellElement.append("<a href = " + '<c:url value="/pm/commune/one2one"/>/' + qnaId + ">" + cellInfo.text + "</a>");
                },
                caption: '제목',
            }, {
                dataField: 'companyName',
                caption: '기업체명',
                alignment: 'center',

            }, {
                dataField: 'employeeName',
                caption: '작성자',
                alignment: 'center',
            }, {
                dataField: 'questionAt',
                caption: '작성일',
                alignment: 'center',
                dataType: 'date',
                format: 'yyyy-MM-dd HH:mm:ss'
            }, {
                type: 'buttons',
                caption: '답글작성',
                buttons: [{
                    text: '답글작성',
                    onClick: function (e) {
                        let qna_id = e.row.data;
                        location.href = '<c:url value="/pm/commune/one2one"/>/' + qna_id.qnaId + '/edit';
                    },
                }]
            }, {
                dataField: 'answerCheck',
                caption: '답변완료',
                alignment: 'center',
            },],
        });
    });
</script>
</html>
