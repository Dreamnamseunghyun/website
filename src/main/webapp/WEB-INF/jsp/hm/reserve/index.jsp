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
                            <h3 class="h3">예약현황</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap">
                                <div class="row-box-title">
                                    <i class="xi-play-circle"></i>예약현황 검색 및 예약상태 처리
                                    <div class="right">
                                        <div class="btnCancel" id="btnCancelReserveList" data-ggsj="dxButton"></div>
                                    </div>
                                </div>

                                <div class="row-box">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>기업체명</span></div>
                                                    <div class="col-lg-4" id="lookupCompany"
                                                         data-ggsj="dxLookup"></div>
                                                    <div class="col-lg-2 tag-name"><span>병원명</span></div>
                                                    <div class="col-lg-4" id="centerSearch"
                                                         data-ggsj="dxLookup"></div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row margin-button">
                                                    <div class="col-lg-2 tag-name"><span>예약상태 일괄 처리버튼</span></div>
                                                    <div class="col-lg-10" style="padding:0 16px!important">
                                                        <div id="reservation" class="btnReservation"
                                                             data-ggsj="dxButton"></div>
                                                        <div class="btnPayCompleted" id="payCompleted"
                                                             data-ggsj="dxButton"></div>
                                                        <div class="btnReserveCancel" id="reserveCancel"
                                                             data-ggsj="dxButton"></div>
                                                        <div class="btnReserveHold" id="reserveHold"
                                                             data-ggsj="dxButton"></div>
                                                        <div class="xi-info-o"></div>
                                                        <div class="col-lg-5" id="info" data-ggsj="dxTextBox"
                                                             style="margin-left: -12px"></div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row margin-button">
                                                    <div class="col-lg-2 tag-name"><span>예약상태별 조회</span></div>
                                                    <div class="col-lg-1">
                                                        <div id="all" data-ggsj="dxCheckBox"></div>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <div id="reserveApply"
                                                             data-ggsj="dxCheckBox"></div>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <div id="reserveCompleted"
                                                             data-ggsj="dxCheckBox"></div>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <div id="reserveChanged"
                                                             data-ggsj="dxCheckBox"></div>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <div id="completePay" data-ggsj="dxCheckBox"></div>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <div id="holdReserve" data-ggsj="dxCheckBox"></div>
                                                    </div>
                                                    <div class="col-lg-2 border-right"></div>
                                                    <div class="col-lg-1">
                                                        <div id="vipSearch" data-ggsj="dxCheckBox"></div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>날짜검색</span></div>
                                                    <div class="col-lg-2" id="selectStatusDate"
                                                         data-ggsj="dxSelectBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>날짜선택</span></div>
                                                    <div class="col-lg-3" id="reserveDateBegin"
                                                         data-ggsj="dxDateBox"></div>
                                                    <div class="col-lg-3" id="reserveDateEnd"
                                                         data-ggsj="dxDateBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!--left-->
                        </div>


                        <div class="row-wrap row-wrap-box" style="margin-bottom:10px;">
                            <div class="row-wrap right" style="display:flex; align-items: center;">
                                <div class="row-box left-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12">
                                                <div id="btnExport" class="btnExcelSample" data-ggsj="dxButton"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box" style="border:1px solid #eaecef">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">

                                            <div id="searchGrid" data-ggsj="dxTextBox"></div>

                                        </div>
                                    </div>

                                </div>


                            </div>

                        </div>

                        <div id="dataGridReserve" class="main_table" data-ggsj="dxDataGrid"></div>
                        <div id="popupMemo" data-ggsj="dxPopup"></div>
                        <div id="popupReserveContent" data-ggsj="dxPopup"></div>
                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"><i class="xi-save"></i>예약상태 저장</div>
                        </div>
                    </div>
                </div>
                <%--                    </div>--%>
            </div>
        </div>

    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        ggsj.openMenu('reserve');

        let dxInstances = ggsj.createDx(false);

        dxInstances.info.option({
            value: '1건이상 선택하여 처리버튼 클릭 후 반드시 저장해주세요.',
            readOnly: true,
        });

        dxInstances.btnExport.option({
            text: '예약현황 다운로드',
            onClick: function () {
                //$('.dx-datagrid-export-button').trigger('click');

                let workbook = new ExcelJS.Workbook();
                let worksheet = workbook.addWorksheet('Sheet1');

                worksheet.getColumn(1).width = 5;

                let itemData;

                // Title
                itemData = [];
                itemData[1] = '순번';
                itemData[2] = '검진병원';
                itemData[3] = '예약상태';
                itemData[4] = '검진일';
                itemData[5] = '수검일';
                itemData[6] = '소속기업';
                itemData[7] = '사원번호';
                itemData[8] = '부서명/직책';
                itemData[9] = '검진자명';
                itemData[10] = '관계';
                itemData[11] = '생년월일';
                itemData[12] = '휴대전화';
                itemData[13] = '이메일';
                itemData[14] = '주소';
                itemData[15] = '검진유형';
                itemData[16] = '선택검사';
                itemData[17] = '추가검사';
                itemData[18] = '특검 대상/물질';
                itemData[19] = '검진비 청구';
                itemData[20] = '본인부담비용';
                itemData[21] = '특이사항';
                itemData[22] = '고객문의사항';
                itemData[23] = '건강살자메모';
                itemData[24] = '병원메모';
                itemData[25] = '예약보류,취소사유';
                itemData[26] = '예약등록일';

                worksheet.addRow(itemData);

                dxInstances.dataGridReserve.getDataSource().store().load().done(function (data) {
                    for (let idx = 0; idx < data.length; idx++) {
                        itemData = [];
                        itemData[1] = idx + 1;
                        itemData[2] = data[idx].hospitalCenterName;

                        if (data[idx].reservationState === 1) {
                            data[idx].reservationState = '예약신청';
                        } else if (data[idx].reservationState === 2) {
                            data[idx].reservationState = '예약확정';
                        } else if (data[idx].reservationState === 3) {
                            data[idx].reservationState = '예약변경';
                        } else if (data[idx].reservationState === 4) {
                            data[idx].reservationState = '수검완료';
                        } else if (data[idx].reservationState === 5) {
                            data[idx].reservationState = '예약보류';
                        }
                        itemData[3] = data[idx].reservationState;

                        if (data[idx].desiredAmpm === 'AM') {
                            data[idx].desiredAmpm = '오전';
                        } else {
                            data[idx].desiredAmpm = '오후';
                        }

                        itemData[4] = DevExpress.localization.formatDate(new Date(data[idx].desiredAt), "yyyy-MM-dd") + " (" + data[idx].desiredAmpm + ")";

                        if (data[idx].checkupedAmpm === 'AM') {
                            data[idx].checkupedAmpm = '오전';
                        } else {
                            data[idx].checkupedAmpm = '오후';
                        }
                        if (!data[idx].checkupedAt) {
                            data[idx].checkupedAt = ' ';
                        } else {
                            itemData[5] = DevExpress.localization.formatDate(new Date(data[idx].checkupedAt), "yyyy-MM-dd") + " (" + data[idx].checkupedAmpm + ")";
                        }

                        itemData[6] = data[idx].companyName;
                        itemData[7] = data[idx].employeeNo;

                        if (!data[idx].depart) {
                            data[idx].depart = ' ';
                        } else if (!data[idx].title) {
                            data[idx].title = ' ';
                        } else {
                            itemData[8] = data[idx].depart + ' / ' + data[idx].title;
                        }

                        let vip;
                        if (data[idx].vip === true) {
                            vip = ' / vip';
                        } else {
                            vip = '';
                        }
                        itemData[9] = data[idx].employeeName + vip;
                        itemData[10] = data[idx].myself === 1 ? '본인' : '가족 (' + data[idx].familyName + ')';
                        itemData[11] = DevExpress.localization.formatDate(new Date(data[idx].birth), "yyyy-MM-dd");
                        itemData[12] = ggsj.phoneWithHyphen(data[idx].mobile);
                        itemData[13] = data[idx].email;

                        if (!data[idx].zipcode) {
                            data[idx].zipcode = ' ';
                        } else if (!data[idx].address1) {
                            data[idx].address1 = ' ';
                        } else {
                            itemData[14] = '(' + data[idx].zipcode + ') ' + data[idx].address1 + ' ' + data[idx].address2;
                        }

                        itemData[15] = data[idx].companyCheckupTypeCode + '.' + data[idx].companyCheckupTypeName + ' - ' + data[idx].subTypeName;
                        itemData[16] = '';
                        itemData[17] = '';

                        for (let i = 0; i < data[idx].reserveItems.length; i++) {
                            if (data[idx].reserveItems[i].register >= 'A' || data[idx].reserveItems[i].register >= 'F') {
                                if (itemData[15] === '') {
                                    itemData[16] = data[idx].reserveItems[i].itemName + ' / ';
                                } else {
                                    itemData[16] = itemData[16] + data[idx].reserveItems[i].itemName + ' / ';
                                }
                            } else if (data[idx].reserveItems[i].register === '2') {
                                if (itemData[16] === '') {
                                    itemData[17] = data[idx].reserveItems[i].itemName + ' / ';
                                } else {
                                    itemData[17] = itemData[17] + data[idx].reserveItems[i].itemName + ' / ';
                                }
                            }
                        }

                        itemData[18] = data[idx].specialCheckup === 0 ? '해당없음' : '특검대상' + ' / ' + data[idx].specialCheckupMemo;
                        itemData[19] = data[idx].supportType === true ? '본인부담' : '기업부담' + ' / ' + data[idx].hospitalPay;
                        if (data[idx].supportType === true) {
                            itemData[20] = data[idx].hospitalPay + data[idx].upgradePay + data[idx].sumItemCopay + data[idx].sumItemDiscountBill;
                        } else {
                            itemData[20] = data[idx].upgradePay + data[idx].sumItemCopay + data[idx].sumItemDiscountBill;
                        }
                        itemData[21] = data[idx].notes;
                        itemData[22] = data[idx].employeeNotes;
                        itemData[23] = data[idx].platformNotes;
                        itemData[24] = data[idx].hospitalNotes;
                        itemData[25] = data[idx].stateNotes;
                        itemData[26] = DevExpress.localization.formatDate(new Date(data[idx].registeredAt), "yyyy-MM-dd hh:mm:ss");

                        worksheet.addRow(itemData);
                    }

                    workbook.xlsx.writeBuffer().then(function (buffer) {
                        saveAs(new Blob([buffer], {type: 'application/octet-stream'}), 'export.xlsx');
                    });
                });
            },
        });

        let reserveState = [
            {'id': 0, 'text': '예약취소'},
            {'id': 1, 'text': '예약신청'},
            {'id': 2, 'text': '예약확정'},
            {'id': 3, 'text': '예약변경'},
            {'id': 4, 'text': '수검완료'},
            {'id': 5, 'text': '예약보류'},
        ];

        LoadCancelReserve();
        LoadReserveList();

        function LoadReserveList() {
            let selectStatusDate = dxInstances.selectStatusDate.option('value');

            let data = {
                companyId: dxInstances.lookupCompany.option('value'),
                centerId: dxInstances.centerSearch.option('value'),
                selectStatusDate: dxInstances.selectStatusDate.option('value'),
            };

            switch (selectStatusDate) {
                case 0:
                    dxInstances.reserveDateBegin.option('value').setHours(0, 0, 0, 0);
                    dxInstances.reserveDateEnd.option('value').setHours(0, 0, 0, 0);
                    data.reserveDateBegin = dxInstances.reserveDateBegin.option('value').toDateString();
                    data.reserveDateEnd = dxInstances.reserveDateEnd.option('value').toDateString();
                    break;
                case 1:
                    dxInstances.reserveDateBegin.option('value').setHours(0, 0, 0, 0);
                    dxInstances.reserveDateEnd.option('value').setHours(0, 0, 0, 0);
                    data.reserveDateBegin = dxInstances.reserveDateBegin.option('value').toDateString();
                    data.reserveDateEnd = dxInstances.reserveDateEnd.option('value').toDateString();
                    break;
            }

            // return;

            let ajaxReserveList = {
                url: '<c:url value="/hm/reserve"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: data,
            };

            $.when($.ajax(ajaxReserveList)).then(function (responseReserve) {
                ggsj.valuesToDx(responseReserve.data);

                dxInstances.dataGridReserve.option({
                    dataSource: responseReserve.data
                });

                dxInstances.dataGridReserve.columnOption('companyId', {
                    lookup: {
                        dataSource: responseReserve.data,
                        valueExpr: 'companyId',
                        displayExpr: 'companyName',
                    }
                });

            });
        }

        function LoadCancelReserve() {
            $.ajax({
                url: '<c:url value="/hm/cancel-reserve"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
            }).then(function (response) {
                let confirmedAt = response.data.map(function (v) {
                    return v.confirmedAt;
                });

                if (response.data.length > 0) {
                    for (let i = 0; i < confirmedAt.length; i++) {
                        if (confirmedAt[i] === null) {
                            dxInstances.btnCancelReserveList.option({
                                template: '예약취소자 <span style="color: red;">NEW</span>',
                                onClick: function () {
                                    location.href = '<c:url value="/hm/cancel-reserve"/>';
                                }
                            });
                        } else {
                            dxInstances.btnCancelReserveList.option({
                                text: '예약취소자',
                                onClick: function () {
                                    location.href = '<c:url value="/hm/cancel-reserve"/>';
                                }
                            });
                        }
                    }
                } else {
                    dxInstances.btnCancelReserveList.option({
                        text: '예약취소자',
                        onClick: function () {
                            location.href = '<c:url value="/hm/cancel-reserve"/>';
                        }
                    });
                }
            });
        }

        dxInstances.vipSearch.option({
            text: 'VIP조회',
            value: false,
            onValueChanged: function (e) {
                if (e.value === true) {
                    dxInstances.dataGridReserve.filter(['vip', '=', true]);
                } else {
                    dxInstances.dataGridReserve.filter("!", ['reservationState', '=', 0]);
                }
            },
        });

        // dxInstances.btnReserveApply.option({
        //     text: '일괄확정 업로드',
        // });

        dxInstances.reservation.option({
            text: '예약확정',
            value: 2,
            onClick: function () {
                let getSelectedRowsData = dxInstances.dataGridReserve.getVisibleRows();
                let getSelectedRows = [];
                for (let i = 0; i < getSelectedRowsData.length; i++) {
                    if (getSelectedRowsData[i].cells[0].value === true) {
                        getSelectedRows.push(getSelectedRowsData[i].key);
                    }
                }
                for (let i = 0; i < getSelectedRows.length; i++) {
                    // keyExpr 을 사용할 경우
                    // const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRowsData[i].reservationId);
                    const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRows[i]);
                    dxInstances.dataGridReserve.cellValue(rowIndex, 'reservationState', 2);
                }
            }
        });

        dxInstances.payCompleted.option({
            text: '수검완료',
            value: 4,
            onClick: function () {
                let getSelectedRowsData = dxInstances.dataGridReserve.getVisibleRows();
                let getSelectedRows = [];
                for (let i = 0; i < getSelectedRowsData.length; i++) {
                    if (getSelectedRowsData[i].cells[0].value === true) {
                        getSelectedRows.push(getSelectedRowsData[i].key);
                    }
                }
                for (let i = 0; i < getSelectedRows.length; i++) {
                    // keyExpr 을 사용할 경우
                    // const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRowsData[i].reservationId);
                    const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRows[i]);
                    dxInstances.dataGridReserve.cellValue(rowIndex, 'reservationState', 4);
                }
            }
        });

        dxInstances.reserveCancel.option({
            text: '예약취소',
            value: 0,
            onClick: function () {
                let getSelectedRowsData = dxInstances.dataGridReserve.getVisibleRows();
                let getSelectedRows = [];
                for (let i = 0; i < getSelectedRowsData.length; i++) {
                    if (getSelectedRowsData[i].cells[0].value === true) {
                        getSelectedRows.push(getSelectedRowsData[i].key);
                    }
                }
                for (let i = 0; i < getSelectedRows.length; i++) {
                    // keyExpr 을 사용할 경우
                    // const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRowsData[i].reservationId);
                    const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRows[i]);
                    dxInstances.dataGridReserve.cellValue(rowIndex, 'reservationState', 0);
                }
            }
        });

        dxInstances.reserveHold.option({
            text: '예약보류',
            value: 5,
            onClick: function () {
                let getSelectedRowsData = dxInstances.dataGridReserve.getVisibleRows();
                let getSelectedRows = [];
                for (let i = 0; i < getSelectedRowsData.length; i++) {
                    if (getSelectedRowsData[i].cells[0].value === true) {
                        getSelectedRows.push(getSelectedRowsData[i].key);
                    }
                }
                for (let i = 0; i < getSelectedRows.length; i++) {
                    // keyExpr 을 사용할 경우
                    // const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRowsData[i].reservationId);
                    const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRows[i]);
                    dxInstances.dataGridReserve.cellValue(rowIndex, 'reservationState', 5);
                }
            }
        });

        dxInstances.all.option({
            text: '전체',
            value: true,
            onValueChanged: function (data) {
                if (data.event) {
                    dxInstances.reserveApply.option('value', data.value);
                    dxInstances.reserveCompleted.option('value', data.value);
                    dxInstances.reserveChanged.option('value', data.value);
                    dxInstances.completePay.option('value', data.value);
                    dxInstances.holdReserve.option('value', data.value);

                    if (data.value) {
                        dxInstances.dataGridReserve.clearFilter();
                    } else {
                        search(data);
                    }
                }
            }
        });

        dxInstances.reserveApply.option({
            text: '예약신청',
            value: true,
            onValueChanged: search,
        });

        dxInstances.reserveCompleted.option({
            text: '예약확정',
            value: true,
            onValueChanged: search,
        });

        dxInstances.reserveChanged.option({
            text: '예약변경',
            value: true,
            onValueChanged: search,
        });

        dxInstances.completePay.option({
            text: '수검완료',
            value: true,
            onValueChanged: search,
        });

        dxInstances.holdReserve.option({
            text: '예약보류',
            value: true,
            onValueChanged: search,
        });

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridReserve.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridReserve.option({
            // keyExpr: 'reservationId',
            editing: {
                mode: "batch",
                allowUpdating: true,
                allowAdding: true,
                allowDeleting: true,
                selectTextOnEditStart: true,
                startEditAction: "click"
            },
            export: {
                enabled: true,
            },
            columns: [
                {
                    dataField: "check",
                    caption: "",
                    dataType: "boolean",
                    value: false,
                    allowSorting: false,
                    allowEditing: true,
                    headerCellTemplate: function (container) {
                        container.append($('<div><input id="selectAllBox" type=checkbox></div>'));
                    },
                }, {
                    dataField: "hospitalCenterName",
                    caption: "검진병원",
                    alignment: 'center',
                    allowEditing: false,
                }, {
                    dataField: "reservationState",
                    caption: "예약상태",
                    alignment: 'center',
                    lookup: {
                        dataSource: reserveState,
                        valueExpr: 'id',
                        displayExpr: 'text',
                    }
                }, {
                    dataField: "desiredAt",
                    caption: "검진일",
                    alignment: 'center',
                    dataType: "date",
                    cssClass: "hoverGray"
                }, {
                    dataField: "desiredAmpm",
                    caption: "시간",
                    alignment: 'center',
                    lookup: {
                        dataSource: [
                            {'id': 'AM', 'text': 'AM'},
                            {'id': 'PM', 'text': 'PM'},
                        ],
                        valueExpr: 'id',
                        displayExpr: 'text',
                    },
                    cssClass: "hoverGray"
                }, {
                    dataField: "checkupedAt",
                    caption: "수검일",
                    alignment: 'center',
                    dataType: "date",
                    cssClass: "hoverBlue"
                }, {
                    dataField: "checkupedAmpm",
                    caption: "시간",
                    alignment: 'center',
                    lookup: {
                        dataSource: [
                            {'id': 'AM', 'text': 'AM'},
                            {'id': 'PM', 'text': 'PM'},
                        ],
                        valueExpr: 'id',
                        displayExpr: 'text',
                    },
                    cssClass: "hoverBlue"
                }, {
                    dataField: "companyName",
                    caption: "소속기업",
                    alignment: 'center',
                    allowEditing: false,
                    cellTemplate: function (cellElement, cellInfo) {
                        cellElement.append(cellInfo.data.companyName);
                    },
                }, {
                    dataField: "vip",
                    alignment: 'center',
                    allowEditing: false,
                    visible: false,
                }, {
                    dataField: "employeeName",
                    caption: "검진자명",
                    alignment: 'center',
                    allowEditing: false,
                    cellTemplate: function (cellElement, cellInfo) {
                        cellElement.append("<a href = " + '<c:url value="/hm/reserve"/>/view' + '/' + cellInfo.data.reservationId + ">" + cellInfo.text + "</a>");
                        cellElement.append(' - ');
                        if (cellInfo.data.myself === 1) {
                            cellElement.append('본인');
                        } else {
                            cellElement.append(cellInfo.data.familyName + '가족');
                        }
                        if (cellInfo.data.vip === true) {
                            cellElement.append('<span style="color:red; font-weight: bold;">ⓥ</span>');
                        }
                    },
                }, {
                    dataField: "birth",
                    caption: "생년월일",
                    alignment: 'center',
                    dataType: "date",
                    allowEditing: false,
                    cellTemplate: function (cellElement, cellInfo) {
                        cellElement.append(cellInfo.text + '(' + cellInfo.data.sex + ')');
                    },
                    width: 100,
                }, {
                    dataField: "mobile",
                    caption: "휴대전화",
                    alignment: 'center',
                    allowEditing: false,
                    format: function (value) {
                        return ggsj.phoneWithHyphen(value);
                    },
                }, {
                    dataField: "companyCheckupTypeName",
                    caption: "예약내용",
                    alignment: 'center',
                    allowEditing: false,
                    cellTemplate: function (cellElement, cellInfo) {
                        let companyCheckupTypeName = cellInfo.data.companyCheckupTypeName;
                        let companyCheckupTypeCode = cellInfo.data.companyCheckupTypeCode;
                        cellElement.append(companyCheckupTypeCode, '.', companyCheckupTypeName, ' - ', cellInfo.data.subTypeName);
                        if (cellInfo.row.data.specialCheckup === 1) {
                            cellElement.append('&nbsp<div class="specialCheck">특</div>');
                        }
                        cellElement.append('&nbsp<div class="reserveContent">+</div>');
                    },
                }, {
                    dataField: "supportType",
                    caption: "검진비 결제",
                    alignment: 'center',
                    allowEditing: false,
                    lookup: {
                        dataSource: [
                            {'id': false, 'text': '기업부담'},
                            {'id': true, 'text': '본인부담'},
                        ],
                        valueExpr: 'id',
                        displayExpr: 'text',
                    }
                }, {
                    dataField: "allMemo",
                    caption: "메모",
                    alignment: 'center',
                    allowEditing: false,
                    cellTemplate: function (cellElement, cellInfo) {
                        if (cellInfo.row.data.hospitalNotes) {
                            cellElement.append('<div class="hospitalMemo" title="' + cellInfo.row.data.hospitalNotes + '">병</div>');
                        }
                        if (cellInfo.row.data.platformNotes) {
                            //cellElement.append('<span style="color: blue">●</span>');
                            cellElement.append('<div class="platformMemo" title="' + cellInfo.row.data.platformNotes + '">건</div>');
                        }
                        if (cellInfo.row.data.employeeNotes) {
                            //cellElement.html('<span style="color: red">●</span>');
                            cellElement.append('<div class="employeeMemo" title="' + cellInfo.row.data.employeeNotes + '">고</div>');
                        }
                    }
                }, {
                    dataField: "registeredAt",
                    caption: "예약등록일",
                    dataType: "datetime",
                    alignment: 'center',
                    allowEditing: false,
                }],

            onEditorPreparing: function (event) {
                if (event.parentType === 'dataRow' && event.dataField === 'reservationState') {
                    let orgOnValueChanged = event.editorOptions.onValueChanged;

                    event.editorOptions.onValueChanged = function (e) {
                        orgOnValueChanged(e);

                        if (e.value === 4) {
                            dxInstances.dataGridReserve.cellValue(event.row.rowIndex, 'checkupedAt', new Date());
                            dxInstances.dataGridReserve.cellValue(event.row.rowIndex, 'checkupedAmpm', (new Date().getHours() >= 12 ? 'PM' : 'AM'));
                        } else if (dxInstances.dataGridReserve.cellValue(event.row.rowIndex, 'checkupedAt') != null) {
                            dxInstances.dataGridReserve.cellValue(event.row.rowIndex, 'checkupedAt', null);
                            dxInstances.dataGridReserve.cellValue(event.row.rowIndex, 'checkupedAmpm', null);
                        }
                    };
                }
            },

            onCellPrepared: function (data) {
                if (data.rowType === 'header') {
                    data.cellElement.css('background', 'white');
                    data.cellElement.hover(function () {
                            $(this).css('background', '#eeeeee');
                        }, function () {
                            $(this).css('background', 'white');
                        }
                    );
                }
            },

            onRowPrepared: function (e) {
                // if (e.rowType === 'data' && e.data.reservationState === 5) {
                //     e.columns[2].lookup.dataSource = [
                //         {'id': 0, 'text': '예약취소'},
                //         {'id': 2, 'text': '예약확정'},
                //         {'id': 3, 'text': '예약변경'},
                //         {'id': 5, 'text': '예약보류'},
                //     ];
                // } else if (e.rowType === 'data' && (e.data.reservationState === 2 || e.data.reservationState === 3)) {
                //     e.columns[2].lookup.dataSource = [
                //         {'id': 0, 'text': '예약취소'},
                //         {'id': 1, 'text': '예약신청'},
                //         {'id': 2, 'text': '예약확정'},
                //         {'id': 3, 'text': '예약변경'},
                //         {'id': 4, 'text': '수검완료'},
                //         {'id': 5, 'text': '예약보류'},
                //     ];
                // } else {
                //     e.columns[2].lookup.dataSource = [
                //         {'id': 0, 'text': '예약취소'},
                //         {'id': 1, 'text': '예약신청'},
                //         {'id': 2, 'text': '예약확정'},
                //         {'id': 4, 'text': '수검완료'},
                //         {'id': 5, 'text': '예약보류'},
                //     ];
                // }
            },

            onCellClick: function (event) {
                if (event.rowType === 'data' && event.columnIndex === 13) {
                    dxInstances.popupMemo.show();
                    dxInstances.popupMemo.option({
                        title: "전체 메모",
                        closeOnOutsideClick: true,
                        width: 800,
                        height: 500,
                        contentTemplate: function (contentElement) {
                            contentElement.append('<div style="font-weight: bold; color: #2ea3aa">병원메모</div>');
                            contentElement.append($("<div id='hospitalNotes' />").dxTextArea({
                                height: 100,
                                value: event.key.hospitalNotes,
                            }));
                            contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">건강살자메모</div>');
                            contentElement.append($("<div id='platformNotes' />").dxTextArea({
                                height: 100,
                                value: event.key.platformNotes,
                            }));
                            contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">고객메모</div>');
                            contentElement.append($("<div id='employeeNotes' />").dxTextArea({
                                height: 100,
                                value: event.key.employeeNotes,
                                readOnly: true,
                            }));
                            contentElement.append($("<div style='alignment: center;'/>").dxButton({
                                text: '저장',
                                alignment: 'center',
                                onClick: function () {
                                    let hospitalNotes = DevExpress.ui.dxTextArea.getInstance($('#hospitalNotes'));
                                    let platformNotes = DevExpress.ui.dxTextArea.getInstance($('#platformNotes'));
                                    let employeeNotes = DevExpress.ui.dxTextArea.getInstance($('#employeeNotes'));
                                    event.data.hospitalNotes = hospitalNotes.option('value');
                                    event.data.platformNotes = platformNotes.option('value');
                                    event.data.employeeNotes = employeeNotes.option('value');
                                    $.ajax({
                                        url: '<c:url value="/pm/reserve-edit"/>',
                                        method: 'POST',
                                        data: JSON.stringify(event.data),
                                    }).then(function () {
                                        ggsj.notify("저장되었습니다.");
                                        LoadReserveList();
                                        LoadCancelReserve();
                                        dxInstances.popupMemo.hide();
                                    });
                                }
                            }));
                            return contentElement;
                        },
                    });
                }

                if (event.rowType === 'header' && event.columnIndex === 0) {
                    let count = dxInstances.dataGridReserve.getVisibleRows().length;
                    let selectAllMode = false;

                    for (let i = 0; i < count; i++) {
                        if (dxInstances.dataGridReserve.cellValue(i, 'check') === true) {
                            selectAllMode = false;
                        } else if (dxInstances.dataGridReserve.cellValue(i, 'check') === false || dxInstances.dataGridReserve.cellValue(i, 'check') === undefined) {
                            selectAllMode = true;
                            event.cellElement.css('checked', 'true');
                            break;
                        }
                    }
                    for (let i = 0; i < count; i++) {
                        dxInstances.dataGridReserve.cellValue(i, 'check', selectAllMode);
                    }
                    $('#selectAllBox').prop('checked', selectAllMode);
                }
            }
        });

        $('#dataGridReserve').on('click', '.reserveContent', function () {
            let reserveItems = dxInstances.dataGridReserve.getSelectedRowsData()[0].reserveItems;
            let selectReserve = '';
            let addReserve = '';
            let specialCheckup = dxInstances.dataGridReserve.getSelectedRowsData()[0].specialCheckup;
            let specialCheckupMemo = dxInstances.dataGridReserve.getSelectedRowsData()[0].specialCheckupMemo;
            for (let i = 0; i < reserveItems.length; i++) {
                if (reserveItems[i].register >= 'A' || reserveItems[i].register >= 'F') {
                    if (selectReserve === '') {
                        selectReserve = reserveItems[i].itemName;
                    } else {
                        selectReserve = selectReserve + ' / ' + reserveItems[i].itemName;
                    }
                } else if (reserveItems[i].register === '2') {
                    if (addReserve === '') {
                        addReserve = reserveItems[i].itemName;
                    } else {
                        addReserve = addReserve + ' / ' + reserveItems[i].itemName;
                    }
                }
            }
            dxInstances.popupReserveContent.show();

            dxInstances.popupReserveContent.option({
                title: "예약 세부 내용",
                closeOnOutsideClick: true,
                width: 600,
                height: 270,
                contentTemplate: function (contentElement) {
                    contentElement.append('<div style="font-weight: bold; color: #2ea3aa">선택검사</div>');
                    contentElement.append($("<div />").dxTextArea({
                        height: 60,
                        value: selectReserve,
                        readOnly: true,
                    }));
                    contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">추가검사</div>');
                    contentElement.append($("<div />").dxTextArea({
                        height: 60,
                        value: addReserve,
                        readOnly: true,
                    }));
                    if (specialCheckup) {
                        dxInstances.popupReserveContent.option({
                            height: 350,
                        });
                        contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">특수검사물질</div>');
                        contentElement.append($("<div />").dxTextArea({
                            height: 60,
                            value: specialCheckupMemo,
                            readOnly: true,
                        }));
                    }
                    return contentElement;
                },
            });
        });
        $('#dataGridReserve').on('click', '.specialCheck', function () {
            let reserveItems = dxInstances.dataGridReserve.getSelectedRowsData()[0].reserveItems;
            let selectReserve = '';
            let addReserve = '';
            let specialCheckup = dxInstances.dataGridReserve.getSelectedRowsData()[0].specialCheckup;
            let specialCheckupMemo = dxInstances.dataGridReserve.getSelectedRowsData()[0].specialCheckupMemo;
            for (let i = 0; i < reserveItems.length; i++) {
                if (reserveItems[i].register >= 'A' || reserveItems[i].register >= 'F') {
                    if (selectReserve === '') {
                        selectReserve = reserveItems[i].itemName;
                    } else {
                        selectReserve = selectReserve + ' / ' + reserveItems[i].itemName;
                    }
                } else if (reserveItems[i].register === '2') {
                    if (addReserve === '') {
                        addReserve = reserveItems[i].itemName;
                    } else {
                        addReserve = addReserve + ' / ' + reserveItems[i].itemName;
                    }
                }
            }
            dxInstances.popupReserveContent.show();

            dxInstances.popupReserveContent.option({
                title: "예약 세부 내용",
                closeOnOutsideClick: true,
                width: 600,
                height: 270,
                contentTemplate: function (contentElement) {
                    contentElement.append('<div style="font-weight: bold; color: #2ea3aa">선택검사</div>');
                    contentElement.append($("<div />").dxTextArea({
                        height: 60,
                        value: selectReserve,
                        readOnly: true,
                    }));
                    contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">추가검사</div>');
                    contentElement.append($("<div />").dxTextArea({
                        height: 60,
                        value: addReserve,
                        readOnly: true,
                    }));
                    if (specialCheckup) {
                        dxInstances.popupReserveContent.option({
                            height: 350,
                        });
                        contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">특수검사물질</div>');
                        contentElement.append($("<div />").dxTextArea({
                            height: 60,
                            value: specialCheckupMemo,
                            readOnly: true,
                        }));
                    }
                    return contentElement;
                },
            });
        });


        dxInstances.selectStatusDate.option({
            dataSource: [
                {'id': 0, 'text': '예약등록일'},
                {'id': 1, 'text': '검진희망일'}
            ],
            value: 0,
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: LoadReserveList,
        });

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            type: 'success',
            onClick: function () {
                let changes = dxInstances.dataGridReserve.option('editing.changes');
                let gridData = changes.map(function (v) {
                    return $.extend(true, {}, v.key, v.data);
                });

                if (gridData.length === 0) {
                    alert('변경된 사항이 없습니다.');
                } else {
                    if (confirm('정말로 저장하시겠습니까?')) {
                        $.ajax({
                            url: '<c:url value="/hm/reserve"/>',
                            method: 'POST',
                            data: JSON.stringify(gridData),
                        }).then(function () {
                            ggsj.notify("저장되었습니다.");
                            LoadReserveList();
                            LoadCancelReserve();
                        });
                    }
                }
            }
        });

        function search(data) {
            if (!data.event) {
                return;
            }

            let filters = [];
            filters.push(['reservationState', "=", 0]);

            if (dxInstances.reserveApply.option('value')) {
                filters.push('or');
                filters.push(['reservationState', "=", 1]);
            }

            if (dxInstances.reserveCompleted.option('value')) {
                filters.push('or');
                filters.push(['reservationState', "=", 2]);
            }
            if (dxInstances.reserveChanged.option('value')) {
                filters.push('or');
                filters.push(['reservationState', "=", 3]);
            }
            if (dxInstances.completePay.option('value')) {
                filters.push('or');
                filters.push(['reservationState', "=", 4]);
            }
            if (dxInstances.holdReserve.option('value')) {
                filters.push('or');
                filters.push(['reservationState', "=", 5]);
            }

            if (filters.length === 11) {
                dxInstances.all.option('value', true);
                dxInstances.dataGridReserve.clearFilter();
            } else {
                dxInstances.all.option('value', false);
                dxInstances.dataGridReserve.filter(filters);
            }
        }

        $.ajax({
            url: '<c:url value="/hm/companylist"/>',
            method: 'GET',
        }).then(function (response) {
            response.data.unshift({companyId: null, companyName: '전체'});
            dxInstances.lookupCompany.option({
                dataSource: response.data,
                valueExpr: 'companyId',
                displayExpr: 'companyName',
                placeholder: '기업체 검색',
                searchEnabled: true,
                searchExpr: 'companyName',
                searchMode: 'contains',
                searchTimeout: 100,
                onValueChanged: function () {
                    LoadReserveList();
                }
            });
        });

        $.ajax({
            url: '<c:url value="/hm/reserve/centerlist"/>',
            method: 'GET',
        }).then(function (response) {
            response.data.unshift({hospitalId: null, hospitalName: '전체'});
            dxInstances.centerSearch.option({
                dataSource: response.data,
                items: response.data,
                valueExpr: 'centerId',
                displayExpr: 'centerName',
                placeholder: '센터 검색',
                searchEnabled: true,
                searchExpr: 'centerName',
                searchMode: 'contains',
                searchTimeout: 100,
                onValueChanged: function () {
                    LoadReserveList();
                }
            });
        });

        dxInstances.reserveDateBegin.option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            value: new Date().addYears(-1),
            onValueChanged: function () {
                LoadReserveList();
            }
        });

        dxInstances.reserveDateEnd.option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            onValueChanged: function () {
                LoadReserveList();
            }
        });
    });
</script>
</html>
