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
                            <div class="col-lg-2">예약</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3" id="btnCheckupInfo" data-ggsj="dxButton"></div>
                            <div class="col-lg-3" id="btnReserve" data-ggsj="dxButton"></div>
                            <div class="col-lg-3" id="btnEncouragement" data-ggsj="dxButton"></div>
                            <div class="col-lg-3" id="btnNoneReserve" data-ggsj="dxButton"></div>
                        </div>
                        <div class="row">
                            <div id="dxGridExceptList" data-ggsj="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2" id="applicationText" data-ggsj="dxTextBox"></div>
                            <div class="col-lg-12" id="reserveApplication" data-ggsj="dxTextArea"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2" id="confirmText" data-ggsj="dxTextBox"></div>
                            <div class="col-lg-12" id="reserveConfirm" data-ggsj="dxTextArea"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2" id="changeText" data-ggsj="dxTextBox"></div>
                            <div class="col-lg-12" id="reserveChange" data-ggsj="dxTextArea"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2" id="cancelText" data-ggsj="dxTextBox"></div>
                            <div class="col-lg-12" id="reserveCancel" data-ggsj="dxTextArea"></div>
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

        dxInstances.applicationText.option({
            value: '예약신청',
            readOnly: true,
        });
        dxInstances.confirmText.option({
            value: '예약확정',
            readOnly: true,
        });
        dxInstances.changeText.option({
            value: '예약변경',
            readOnly: true,
        });
        dxInstances.cancelText.option({
            value: '예약취소',
            readOnly: true,
        });


        dxInstances.reserveApplication.option({
            height: 300,
            value: '【OOO】고객님, ' + '\n' +
                    '소중한 예약 감사드립니다^^' + '\n' +
                    '건강검진 예약이 확정된 상태가 아니므로, 1-3일 내 검진기관에서 확정 시 고객님께' + '\n' +
                    '다시한번 알려드리겠습니다.   확정 전까지는 변경이 자유롭게 가능합니다.' + '\n' +
                    '■ 【강북삼성병원 (☎ 02-700-1000)】' + '\n' +
                    '■ 검진희망일 : 【2021-07-01 오전】' + '\n' +
                    '▷ 건강살자 ☎1566-7527 ◁',
            readOnly: true,
        });
        dxInstances.reserveConfirm.option({
            height: 300,
            value: '【OOO】고객님, ' + '\n' +
                    '【(2021-07-01 오전, 강북삼성병원)】으로 예약이 확정되었습니다.' + '\n' +
                    '검진희망일 3일 이전에는 플랫폼 내에서 변경이 불가능하오니, ' + '\n' +
                    '부득이한 변경이나 취소 희망 시 검진기관에 요청 주시기 바랍니다' + '\n' +
                    '■ 【강북삼성병원 (02-700-1000)】' + '\n' +
                    '■ 검진희망일 : 【2021-07-01 오전】' + '\n' +
                    '▷ 건강살자 ☎1566-7527 ◁',
            readOnly: true,
        });
        dxInstances.reserveChange.option({
            height: 300,
            value: '【OOO】고객님,' + '\n' +
                    '예약변경을 신청하셨습니다.' + '\n' +
                    '요청주신 변경사항에 대해서 빠른 처리 약속드리겠습니다^^' + '\n' +
                    '▷ 건강살자 ☎1566-7527 ◁',
            readOnly: true,
        });
        dxInstances.reserveCancel.option({
            height: 300,
            value: '【OOO】고객님,' + '\n' +
                    '【(2021-07-01 오전, 강북삼성병원)】으로 신청주신 예약건이 취소되었습니다.' + '\n' +
                    '날짜 검토하시어 재예약 해주시기 바랍니다.' + '\n' +
                    '☞ 예약 가능 기간 : 【2021-03-01~2021-08-31】' + '\n' +
                    '▷ 건강살자 ☎1566-7527 ◁',
            readOnly: true,
        });

        dxInstances.dxGridExceptList.option({
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
                dataField: 'employeeName',
                caption: '검진자명',
            }, {
                dataField: 'birth',
                caption: '생년월일',
                type: 'date',
                displayFormat: 'yyyy-MM-dd',
            }, {
                dataField: 'companyName',
                caption: '기업체명',
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
                    text: '예약안내 발송 제외자 목록',
                });
            },
        });
    });
</script>
</html>
