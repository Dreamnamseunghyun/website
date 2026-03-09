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
                            <h3 class="h3">알림톡 관리</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <%-- checkup type dataGrid --%>
                        <div class="row">
                            <div class="col-lg-2">독려</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3" id="btnCheckupInfo" data-ggsj="dxButton"></div>
                            <div class="col-lg-3" id="btnReserve" data-ggsj="dxButton"></div>
                            <div class="col-lg-3" id="btnEncouragement" data-ggsj="dxButton"></div>
                            <div class="col-lg-3" id="btnNoneReserve" data-ggsj="dxButton"></div>
                        </div>
                        <div class="row">
                            <div id="dxGridReserveConfirmExcept" data-ggsj="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">예약확정독려</div>
                            <div class="col-lg-12" id="reserveConfirmEncouragement" data-ggsj="dxTextArea"></div>
                        </div>
                        <div class="row">
                            <div id="dxGridReserveChangeExcept" data-ggsj="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">예약변경독려</div>
                            <div class="col-lg-12" id="reserveChangeEncouragement" data-ggsj="dxTextArea"></div>
                        </div>
                        <div class="row">
                            <div id="dxGridCheckupExcept" data-ggsj="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">수검체크독려</div>
                            <div class="col-lg-12" id="checkupEncouragement" data-ggsj="dxTextArea"></div>
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
        ggsj.openMenu('notitokinfo');

        let dxInstances = ggsj.createDx(false);

        dxInstances.btnCheckupInfo.option({
            text: '검진실시 안내',
            onClick: function () {
                location.href = '<c:url value="/pm/notitokinfo"/>';
            }
        });
        dxInstances.btnReserve.option({
            text: '예약',
            onClick: function () {
                location.href = '<c:url value="/pm/notitokreserve"/>';
            }
        });
        dxInstances.btnEncouragement.option({
            text: '독려',
            onClick: function () {
                location.href = '<c:url value="/pm/notitokencouragement"/>';
            }
        });
        dxInstances.btnNoneReserve.option({
            text: '미예약자 관리',
            onClick: function () {
                location.href = '<c:url value="/pm/notitoknonereserve"/>';
            }
        });

        dxInstances.reserveConfirmEncouragement.option({
            height: 150,
            value: '【OOO】 매니저님 안녕하세요~? ' + '\n' +
                    '항상 감사드립니다^^' + '\n' +
                    '신규예약 고객님이 예약확정을 기다리고 계시니 확정 부탁드립니다~' + '\n' +
                    '▷ 건강살자 ☎1566-7527 ◁',
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
                caption: '순번',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'hospitalName',
                caption: '병원명',
            }, {
                dataField: 'employeeName',
                caption: '검진자명',
            }, {
                dataField: 'employeeCode',
                caption: 'ID',
            }, {
                dataField: 'mobile',
                caption: '휴대전화번호',
            }, {
                dataField: 'exceptDate',
                caption: '발송제외 등록일',
                type: 'date',
                displayFormat: 'yyyy-MM-dd',
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '예약확정 독려 발송 제외자 목록',
                });
            },
        });

        dxInstances.reserveChangeEncouragement.option({
            height: 150,
            value: '【OOO】 매니저님 안녕하세요~?  ' + '\n' +
                    '예약변경 건이 있습니다. ' + '\n' +
                    '바쁘시겠지만 지금 바로 부탁드립니다~' + '\n' +
                    '▷ 건강살자 ☎1566-7527 ◁',
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
                caption: '순번',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'hospitalName',
                caption: '병원명',
            }, {
                dataField: 'employeeName',
                caption: '검진자명',
            }, {
                dataField: 'employeeCode',
                caption: 'ID',
            }, {
                dataField: 'mobile',
                caption: '휴대전화번호',
            }, {
                dataField: 'exceptDate',
                caption: '발송제외 등록일',
                type: 'date',
                displayFormat: 'yyyy-MM-dd',
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '예약변경 독려 발송 제외자 목록',
                });
            },
        });

        dxInstances.checkupEncouragement.option({
            height: 150,
            value: '【OOO】 매니저님 안녕하세요~?' + '\n' +
                    '검진이 완료되신 고객님들의 수검완료 체크 부탁드립니다~' + '\n' +
                    '▷ 건강살자 ☎1566-7527 ◁',
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
                caption: '순번',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'hospitalName',
                caption: '병원명',
            }, {
                dataField: 'employeeName',
                caption: '검진자명',
            }, {
                dataField: 'employeeCode',
                caption: 'ID',
            }, {
                dataField: 'mobile',
                caption: '휴대전화번호',
            }, {
                dataField: 'exceptDate',
                caption: '발송제외 등록일',
                type: 'date',
                displayFormat: 'yyyy-MM-dd',
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '수검체크 독려 발송 제외자 목록',
                });
            },
        });
    });
</script>
</html>
