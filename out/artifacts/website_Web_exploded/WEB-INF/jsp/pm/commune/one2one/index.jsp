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
                            <h3 class="h3">1:1Î¨∏Ïùò</h3>
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
                                            <div class="col-lg-12" id="searchGrid" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Header -->

                        <div id="dataGridOne2One" class="main_table" data-sitebuilder="dxDataGrid">
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
        sitebuilder.openMenu('one2one');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
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
                caption: '?úÎ≤à',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'category',
                caption: 'Íµ¨Î∂Ñ',
                alignment: 'center',
                width: 230,
                lookup: {
                    dataSource: [
                        {'id': 0, 'text': '?àÏïΩÎ¨∏Ïùò'},
                        {'id': 1, 'text': 'Í≤∞Í≥º?ÅÎã¥'},
                        {'id': 2, 'text': 'Î∂àÎßå?¨Ìï≠'},
                        {'id': 3, 'text': '?àÌéò?¥Ï?'},
                        {'id': 4, 'text': 'Í∏∞Ì?Î¨∏Ïùò'},
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
                caption: '?úÎ™©',
            }, {
                dataField: 'companyName',
                caption: 'Í∏∞ÏóÖÏ≤¥Î™Ö',
                alignment: 'center',

            }, {
                dataField: 'employeeName',
                caption: '?ëÏÑ±??,
                alignment: 'center',
            }, {
                dataField: 'questionAt',
                caption: '?ëÏÑ±??,
                alignment: 'center',
                dataType: 'date',
                format: 'yyyy-MM-dd HH:mm:ss'
            }, {
                type: 'buttons',
                caption: '?µÍ??ëÏÑ±',
                buttons: [{
                    text: '?µÍ??ëÏÑ±',
                    onClick: function (e) {
                        let qna_id = e.row.data;
                        location.href = '<c:url value="/pm/commune/one2one"/>/' + qna_id.qnaId + '/edit';
                    },
                }]
            }, {
                dataField: 'answerCheck',
                caption: '?µÎ??ÑÎ£å',
                alignment: 'center',
            },],
        });
    });
</script>
</html>
