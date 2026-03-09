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
                            <h3 class="h3">?Œë¦¼??ê´€ë¦?/h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <%-- checkup type dataGrid --%>
                        <div class="row">
                            <div class="col-lg-2">?…ë ¤</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3" id="btnCheckupInfo" data-sitebuilder="dxButton"></div>
                            <div class="col-lg-3" id="btnReserve" data-sitebuilder="dxButton"></div>
                            <div class="col-lg-3" id="btnEncouragement" data-sitebuilder="dxButton"></div>
                            <div class="col-lg-3" id="btnNoneReserve" data-sitebuilder="dxButton"></div>
                        </div>
                        <div class="row">
                            <div id="dxGridReserveConfirmExcept" data-sitebuilder="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">?ˆì•½?•ì •?…ë ¤</div>
                            <div class="col-lg-12" id="reserveConfirmEncouragement" data-sitebuilder="dxTextArea"></div>
                        </div>
                        <div class="row">
                            <div id="dxGridReserveChangeExcept" data-sitebuilder="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">?ˆì•½ë³€ê²½ë…??/div>
                            <div class="col-lg-12" id="reserveChangeEncouragement" data-sitebuilder="dxTextArea"></div>
                        </div>
                        <div class="row">
                            <div id="dxGridCheckupExcept" data-sitebuilder="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">?˜ê?ì²´í¬?…ë ¤</div>
                            <div class="col-lg-12" id="checkupEncouragement" data-sitebuilder="dxTextArea"></div>
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
        sitebuilder.openMenu('notitokinfo');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.btnCheckupInfo.option({
            text: 'ê²€ì§„ì‹¤???ˆë‚´',
            onClick: function () {
                location.href = '<c:url value="/pm/notitokinfo"/>';
            }
        });
        dxInstances.btnReserve.option({
            text: '?ˆì•½',
            onClick: function () {
                location.href = '<c:url value="/pm/notitokreserve"/>';
            }
        });
        dxInstances.btnEncouragement.option({
            text: '?…ë ¤',
            onClick: function () {
                location.href = '<c:url value="/pm/notitokencouragement"/>';
            }
        });
        dxInstances.btnNoneReserve.option({
            text: 'ë¯¸ì˜ˆ?½ì ê´€ë¦?,
            onClick: function () {
                location.href = '<c:url value="/pm/notitoknonereserve"/>';
            }
        });

        dxInstances.reserveConfirmEncouragement.option({
            height: 150,
            value: '?OOO??ë§¤ë‹ˆ?€???ˆë…•?˜ì„¸??? ' + '\n' +
                    '??ƒ ê°ì‚¬?œë¦½?ˆë‹¤^^' + '\n' +
                    '? ê·œ?ˆì•½ ê³ ê°?˜ì´ ?ˆì•½?•ì •??ê¸°ë‹¤ë¦¬ê³  ê³„ì‹œ???•ì • ë¶€?ë“œë¦½ë‹ˆ??' + '\n' +
                    '??ê±´ê°•?´ì ??566-7527 ??,
            readOnly: true,
        });

        dxInstances.dxGridReserveConfirmExcept.option({
            export: {
                enabled: false
            },
            dataSource: [],
            columnAutoWidth: true,
            allowColumnReordering: true,
            columns: [{
                caption: '?œë²ˆ',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'hospitalName',
                caption: 'ë³‘ì›ëª?,
            }, {
                dataField: 'employeeName',
                caption: 'ê²€ì§„ìëª?,
            }, {
                dataField: 'employeeCode',
                caption: 'ID',
            }, {
                dataField: 'mobile',
                caption: '?´ë??„í™”ë²ˆí˜¸',
            }, {
                dataField: 'exceptDate',
                caption: 'ë°œì†¡?œì™¸ ?±ë¡??,
                type: 'date',
                displayFormat: 'yyyy-MM-dd',
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '?ˆì•½?•ì • ?…ë ¤ ë°œì†¡ ?œì™¸??ëª©ë¡',
                });
            },
        });

        dxInstances.reserveChangeEncouragement.option({
            height: 150,
            value: '?OOO??ë§¤ë‹ˆ?€???ˆë…•?˜ì„¸???  ' + '\n' +
                    '?ˆì•½ë³€ê²?ê±´ì´ ?ˆìŠµ?ˆë‹¤. ' + '\n' +
                    'ë°”ì˜?œê² ì§€ë§?ì§€ê¸?ë°”ë¡œ ë¶€?ë“œë¦½ë‹ˆ??' + '\n' +
                    '??ê±´ê°•?´ì ??566-7527 ??,
            readOnly: true,
        });

        dxInstances.dxGridReserveChangeExcept.option({
            export: {
                enabled: false
            },
            dataSource: [],
            columnAutoWidth: true,
            allowColumnReordering: true,
            columns: [{
                caption: '?œë²ˆ',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'hospitalName',
                caption: 'ë³‘ì›ëª?,
            }, {
                dataField: 'employeeName',
                caption: 'ê²€ì§„ìëª?,
            }, {
                dataField: 'employeeCode',
                caption: 'ID',
            }, {
                dataField: 'mobile',
                caption: '?´ë??„í™”ë²ˆí˜¸',
            }, {
                dataField: 'exceptDate',
                caption: 'ë°œì†¡?œì™¸ ?±ë¡??,
                type: 'date',
                displayFormat: 'yyyy-MM-dd',
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '?ˆì•½ë³€ê²??…ë ¤ ë°œì†¡ ?œì™¸??ëª©ë¡',
                });
            },
        });

        dxInstances.checkupEncouragement.option({
            height: 150,
            value: '?OOO??ë§¤ë‹ˆ?€???ˆë…•?˜ì„¸???' + '\n' +
                    'ê²€ì§„ì´ ?„ë£Œ?˜ì‹  ê³ ê°?˜ë“¤???˜ê??„ë£Œ ì²´í¬ ë¶€?ë“œë¦½ë‹ˆ??' + '\n' +
                    '??ê±´ê°•?´ì ??566-7527 ??,
            readOnly: true,
        });

        dxInstances.dxGridCheckupExcept.option({
            export: {
                enabled: false
            },
            dataSource: [],
            columnAutoWidth: true,
            allowColumnReordering: true,
            columns: [{
                caption: '?œë²ˆ',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'hospitalName',
                caption: 'ë³‘ì›ëª?,
            }, {
                dataField: 'employeeName',
                caption: 'ê²€ì§„ìëª?,
            }, {
                dataField: 'employeeCode',
                caption: 'ID',
            }, {
                dataField: 'mobile',
                caption: '?´ë??„í™”ë²ˆí˜¸',
            }, {
                dataField: 'exceptDate',
                caption: 'ë°œì†¡?œì™¸ ?±ë¡??,
                type: 'date',
                displayFormat: 'yyyy-MM-dd',
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '?˜ê?ì²´í¬ ?…ë ¤ ë°œì†¡ ?œì™¸??ëª©ë¡',
                });
            },
        });
    });
</script>
</html>
