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
                            <h3 class="h3">예약취소</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap logo-area-left btn-area-left">
                                <div class="row-box-title"><i class="xi-play-circle"></i>예약 취소 검색</div>
                                <div class="row-box">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>기업체명</span></div>
                                                    <div class="col-lg-2" id="companyName"
                                                         data-ggsj="dxTextBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>병원명</span></div>
                                                    <div class="col-lg-3" id="hospitalSearch"
                                                         data-ggsj="dxSelectBox"></div>
                                                    <div class="col-lg-1 tag-name"><span>구분</span></div>
                                                    <div class="col-lg-1" id="vipSearch" data-ggsj="dxCheckBox"></div>
                                                    <div class="col-lg-1" id="selectAll" data-ggsj="dxCheckBox"></div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>날짜검색</span></div>
                                                    <div class="col-lg-2" id="selectStatusDate"
                                                         data-ggsj="dxSelectBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>날짜선택</span></div>
                                                    <div class="col-lg-3" id="companyCheckup.reserveDateBegin"
                                                         data-ggsj="dxDateBox"></div>
                                                    <div class="col-lg-3" id="companyCheckup.reserveDateEnd"
                                                         data-ggsj="dxDateBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-wrap logo-area-right btn-area-right">
                                <div class="row-box-title" style="visibility:hidden;"><i class="xi-play-circle"></i>
                                </div>
                                <div class="row-box1">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                            </div>
                                        </div>
                                        <div class="row-wrap-box right">
                                            <div class="row-wrap row-wrap1">
                                                <div class="col-box1 row text-box-area">
                                                    <div class="col-lg-12" id="searchGrid" data-ggsj="dxTextBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Header -->

                        <div id="dataGridReserve" class="main_table" data-ggsj="dxDataGrid">
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"><i class="xi-save"></i>취소확정</div>
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
        ggsj.openMenu('cancel-reserve');

        let dxInstances = ggsj.createDx(false);

        dxInstances.hospitalSearch.option({
            text: '병원 검색',
        });

        function LoadCancelNameList() {
            let ajaxCancelNameList = {
                url: '<c:url value="/cm/cancelnamelist"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
            };

            $.when($.ajax(ajaxCancelNameList)).then(function (response) {
                console.log(response);
                dxInstances.dataGridReserve.columnOption('canceledUserId', {
                    lookup: {
                        dataSource: response.data,
                        valueExpr: 'userId',
                        displayExpr: 'name',
                    },
                });
                dxInstances.dataGridReserve.columnOption('hospitalId', {
                    lookup: {
                        dataSource: response.data,
                        valueExpr: 'hospitalId',
                        displayExpr: 'hospitalCenterName',
                    }
                });
            });
        }

        function LoadReserveList() {
            let ajaxReserveList = $.ajax({
                url: '<c:url value="/cm/cancel-reserve"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    hospitalId: dxInstances.hospitalSearch.option('value'),
                }
            });

            $.when(ajaxReserveList).then(function (responseReserve) {
                cancelCheck = responseReserve.data;
                dxInstances.dataGridReserve.option({
                    dataSource: responseReserve.data
                });

                dxInstances.dataGridReserve.columnOption('hospitalId', {
                    lookup: {
                        dataSource: responseReserve.data,
                        valueExpr: 'hospitalId',
                        displayExpr: 'hospitalName',
                    }
                });
                dxInstances.dataGridReserve.columnOption('companyId', {
                    lookup: {
                        dataSource: responseReserve.data,
                        valueExpr: 'companyId',
                        displayExpr: 'companyName',
                    }
                });

                // dxInstances.dataGridReserve.filter(['confirmedAt', '=', null]);
                search();
            });
        }

        dxInstances.selectAll.option({
            text: '이전취소자 전체보기',
            onValueChanged: function (e) {
                search();
                if (e.value === true) {
                    dxInstances.dataGridReserve.option({
                        selection: {
                            mode: ""
                        },
                    });
                } else {
                    dxInstances.dataGridReserve.option({
                        selection: {
                            mode: "multiple"
                        },
                    });
                }
            }
        });

        LoadCancelNameList();
        LoadReserveList();

        dxInstances.selectStatusDate.option({
            dataSource: [
                {'id': 0, 'text': '예약등록일'},
                {'id': 1, 'text': '검진희망일'}
            ],
            value: 0,
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances['companyCheckup.reserveDateBegin'].option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            value: new Date().addYears(-1),
        })

        dxInstances['companyCheckup.reserveDateEnd'].option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
        })

        dxInstances.vipSearch.option({
            text: 'VIP조회',
            value: false,
            onValueChanged: function () {
                search();
            },
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
            editing: {
                mode: "batch",
                allowUpdating: true,
                allowAdding: true,
                allowDeleting: false,
                selectTextOnEditStart: false,
            },
            // selection: {
            //     mode: "multiple"
            // },
            columns: [{
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
                dataField: "reservationState",
                caption: "예약상태",
                lookup: {
                    dataSource: [
                        {'id': 0, 'text': '예약취소'},
                        {'id': 1, 'text': '예약신청'},
                        {'id': 2, 'text': '예약확정'},
                        {'id': 3, 'text': '예약변경'},
                        {'id': 4, 'text': '수검완료'},
                        {'id': 5, 'text': '예약보류'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
                allowEditing: false,
            }, {
                dataField: "hospitalCenterName",
                caption: "검진병원",
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "desiredAt",
                caption: "검진일",
                alignment: 'center',
                dataType: "date",
                allowEditing: false,
            }, {
                dataField: "ampm",
                caption: "시간",
                alignment: 'center',
                allowEditing: false,
                lookup: {
                    dataSource: [
                        {'id': 'AM', 'text': 'AM'},
                        {'id': 'PM', 'text': 'PM'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.displayValue === 'PM') {
                        cellElement.append('<spen style="color: red">PM</spen>');
                    } else {
                        cellElement.append('<spen style="color: black">AM</spen>');
                    }
                }
            }, {
                dataField: "canceledAt",
                caption: "취소일시",
                alignment: 'center',
                dataType: "datetime",
                allowEditing: false,
            }, {
                dataField: "canceledUserId",
                caption: "취소자",
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "confirmedAt",
                caption: "취소확정일시",
                alignment: 'center',
                dataType: "datetime",
                allowEditing: false,
            }, {
                dataField: "companyName",
                alignment: 'center',
                caption: "소속기업",
                allowEditing: false,
            }, {
                dataField: "employeeName",
                caption: "검진자명",
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.append("<a href = " + '<c:url value="/cm/reserve"/>/view' + '/' + cellInfo.data.reservationId + ">" + cellInfo.text + "</a>");
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
                allowEditing: false,
            }, {
                dataField: "birth",
                caption: "생년월일",
                alignment: 'center',
                dataType: "date",
                allowEditing: false,
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.append(cellInfo.text + '(' + cellInfo.data.sex + ')');
                },
            }, {
                dataField: "mobile",
                caption: "휴대전화",
                alignment: 'center',
                format: function (value) {
                    return ggsj.phoneWithHyphen(value);
                },
                allowEditing: false,
            }, {
                dataField: "checkupTypeName",
                caption: "예약내용",
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    let companyCheckupTypeName = cellInfo.data.companyCheckupTypeName;
                    let companyCheckupTypeCode = cellInfo.data.companyCheckupTypeCode;
                    cellElement.append(companyCheckupTypeCode, '.', companyCheckupTypeName, ' - ', cellInfo.data.subTypeName);
                },
                allowEditing: false,
            }, {
                dataField: "supportType",
                caption: "검진비 결제",
                alignment: 'center',
                lookup: {
                    dataSource: [
                        {'id': false, 'text': '기업부담'},
                        {'id': true, 'text': '본인부담'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
                allowEditing: false,
            }, {
                dataField: "registeredAt",
                caption: "예약등록일",
                alignment: 'center',
                dataType: "date",
                allowEditing: false,
            },],

            // Export
            // onExporting: function (e) {
            //     let workbook = new ExcelJS.Workbook();
            //     let worksheet = workbook.addWorksheet('Sheet1');
            //
            //     DevExpress.excelExporter.exportDataGrid({
            //         'component': e.component,
            //         'worksheet': worksheet,
            //         'autoFilterEnabled': true
            //     }).then(function () {
            //         workbook.xlsx.writeBuffer().then(function (buffer) {
            //             saveAs(new Blob([buffer], {type: 'application/octet-stream'}), 'export.xlsx');
            //         });
            //     });
            //     e.cancel = true;
            // },
            //
            // onToolbarPreparing: function (e) {
            //     // Modifies an existing item
            //     let toolbarItems = e.toolbarOptions.items;
            //     toolbarItems.forEach(function (item) {
            //         if (item.name === "saveButton" || item.name === "addRowButton") {
            //             item.visible = false;
            //         }
            //     });
            // },

            onCellClick: function (event) {
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

        function search() {
            let filters = [];

            if (dxInstances.selectAll.option('value') === true) {
                filters.push([
                    ['confirmedAt', "=", null],
                    'or',
                    ['confirmedAt', '<>', null]
                ]);
            } else {
                filters.push(['confirmedAt', "=", null]);
            }

            if (dxInstances.vipSearch.option('value')) {
                filters.push('and');
                filters.push(['vip', "=", dxInstances.vipSearch.option('value')]);
            }

            dxInstances.dataGridReserve.filter(filters);
        }

        $.ajax({
            url: '<c:url value="/cm/cancel-reserve"/>',
            method: 'GET',
        }).then(function (response) {
            ggsj.valuesToDx(response.data);
            dxInstances.dataGridReserve.option({
                dataSource: response.data
            });

            dxInstances.companyName.option({
                value: response.data[0].companyName,
                readOnly: true,
            });

            dxInstances.dataGridReserve.columnOption('hospitalId', {
                lookup: {
                    dataSource: response.data,
                    valueExpr: 'hospitalId',
                    displayExpr: 'hospitalName',
                }
            });
            dxInstances.dataGridReserve.columnOption('companyId', {
                lookup: {
                    dataSource: response.data,
                    valueExpr: 'companyId',
                    displayExpr: 'companyName',
                }
            });
        });

        $.ajax({
            url: '<c:url value="/common/hospital"/>',
            method: 'GET',
        }).then(function (response) {
            let dsHospital = response.data;
            dsHospital.unshift({hospitalId: null, hospitalName: '전체'});
            dxInstances.hospitalSearch.option({
                dataSource: dsHospital,
                valueExpr: 'hospitalId',
                displayExpr: 'hospitalName',
                placeholder: '병원 검색',
                searchEnabled: true,
                searchExpr: 'centerName',
                searchMode: 'contains',
                onValueChanged: function () {
                    LoadReserveList();
                }
            });
        });

        dxInstances.btnSave.option({
            onClick: function () {
                let getSelectedRowsData = dxInstances.dataGridReserve.getVisibleRows();
                let getSelectedRows = [];
                for (let i = 0; i < getSelectedRowsData.length; i++) {
                    if (getSelectedRowsData[i].cells[0].value === true) {
                        getSelectedRows.push(getSelectedRowsData[i].key);
                    }
                }

                let gridData = getSelectedRows.map(function (v) {
                    return $.extend(true, {}, v.key, v.data);
                });

                if (gridData.length === 0) {
                    alert('변경된 사항이 없습니다.');
                    return;
                } else {
                    alert('저장하시겠습니까?');
                }

                $.ajax({
                    url: '<c:url value="/cm/cancel-reserve"/>',
                    method: 'POST',
                    data: JSON.stringify(getSelectedRows),
                }).then(function () {
                    ggsj.notify("저장되었습니다.");
                    LoadReserveList();
                });
            }
        });
    });
</script>
</html>
