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
                            <div class="row-wrap row-wrap1">
                                <div class="row-box-title"><i class="xi-play-circle"></i>예약 취소 검색</div>
                                <div class="row-box row-box1">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>기업체명</span></div>
                                                    <div class="col-lg-2">
                                                        <div id="lookupCompany"
                                                             data-ggsj="dxLookup"></div>
                                                    </div>
                                                    <div class="col-lg-2 tag-name"><span>병원명</span></div>
                                                    <div class="col-lg-3">
                                                        <div id="hospitalSearch"
                                                             data-ggsj="dxLookup"></div>
                                                    </div>
                                                    <div class="col-lg-1 border-left" id="vipSearch"
                                                         data-ggsj="dxCheckBox"></div>
                                                    <div class="col-lg-2" id="selectAll" data-ggsj="dxCheckBox"></div>

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
                            </div>

                        </div>
                        <!-- Header -->


                        <!-- Header -->

                        <div class="row-wrap row-wrap-box"
                             style="margin-bottom:0; display: flex; align-items: center; margin-bottom:5px;">
                            <div class="row-wrap left"
                                 style="box-shadow: none!important; padding:0; float:none!important; margin-right: auto;">
                                <div class="row-box-title" style="border:none!important; padding:0;"><i
                                        class="xi-play-circle"></i>예약 취소 목록
                                </div>
                            </div>
                            <div class="row-wrap-box right">
                                <div class="row-wrap" style="box-shadow: none; padding:0;">
                                    <div class="row-box1">
                                        <div class="row-box-inner">
                                            <div class="col-box1 row">
                                                <div class="col-lg-12" id="searchGrid" data-ggsj="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Header -->


                        <div id="dataGridReserve" class="main_table" data-ggsj="dxDataGrid"></div>


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

        let cancelCheck = [];

        function LoadCancelNameList() {
            let ajaxCancelNameList = {
                url: '<c:url value="/hm/cancelnamelist"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
            };

            $.when($.ajax(ajaxCancelNameList)).then(function (response) {
                dxInstances.dataGridReserve.columnOption('canceledUserId', {
                    lookup: {
                        dataSource: response.data,
                        valueExpr: 'userId',
                        displayExpr: 'cancelName',
                    },
                });
            });
        }

        function LoadReserveList() {
            let selectStatusDate = dxInstances.selectStatusDate.option('value');

            let data = {
                companyId: dxInstances.lookupCompany.option('value'),
                hospitalId: dxInstances.hospitalSearch.option('value'),
                selectStatusDate: dxInstances.selectStatusDate.option('value'),
            };

            switch (selectStatusDate) {
                case 0:
                    data.reserveDateBegin = dxInstances.reserveDateBegin.option('value').toDateString();
                    data.reserveDateEnd = dxInstances.reserveDateEnd.option('value').toDateString();
                    break;
                case 1:
                    data.reserveDateBegin = dxInstances.reserveDateBegin.option('value').toDateString();
                    data.reserveDateEnd = dxInstances.reserveDateEnd.option('value').toDateString();
                    break;
                case 2:
                    data.reserveDateBegin = dxInstances.reserveDateBegin.option('value').toDateString();
                    data.reserveDateEnd = dxInstances.reserveDateEnd.option('value').toDateString();
                    break;
                case 3:
                    data.reserveDateBegin = dxInstances.reserveDateBegin.option('value').toDateString();
                    data.reserveDateEnd = dxInstances.reserveDateEnd.option('value').toDateString();
                    break;
            }

            let ajaxReserveList = $.ajax({
                url: '<c:url value="/hm/cancel-reserve"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: data,
            });

            $.when(ajaxReserveList).then(function (responseReserve) {
                cancelCheck = responseReserve.data;
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
                search();
            });
        }

        dxInstances.selectAll.option({
            text: '이전취소자 전체보기',
            onValueChanged: function (e) {
                search();
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
                alignment: 'center',
                allowEditing: false,
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.confirmedAt !== null) {
                        let confirmedAt = new Date(cellInfo.data.confirmedAt);
                        let canceledAt = new Date(cellInfo.data.canceledAt);
                        if ((confirmedAt.getTime() - canceledAt.getTime()) / 1000 / 60 / 60 >= 24) {
                            cellElement.append('<spen style="color: red">(자동취소)</spen>');
                        } else {
                            cellElement.text('예약취소');
                        }
                    } else {
                        cellElement.text('예약취소');
                    }
                }
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
            url: '<c:url value="/hm/companylist"/>',
            method: 'GET',
        }).then(function (response) {
            let dsCompany = response.data;
            dsCompany.unshift({companyId: null, companyName: '전체'});
            dxInstances.lookupCompany.option({
                dataSource: dsCompany,
                valueExpr: 'companyId',
                displayExpr: 'companyName',
                placeholder: '기업체 검색',
                searchEnabled: true,
                searchExpr: 'companyName',
                searchMode: 'contains',
                onValueChanged: function () {
                    LoadReserveList();
                }
            });
        });

        $.ajax({
            url: '<c:url value="/hm/reserve/centerlist"/>',
            method: 'GET',
        }).then(function (response) {
            let dsHospital = response.data;
            dsHospital.unshift({hospitalId: null, hospitalName: '전체'});
            dxInstances.hospitalSearch.option({
                dataSource: dsHospital,
                valueExpr: 'centerId',
                displayExpr: 'centerName',
                placeholder: '센터 검색',
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
                    url: '<c:url value="/hm/cancel-reserve"/>',
                    method: 'POST',
                    data: JSON.stringify(getSelectedRows),
                }).then(function () {
                    ggsj.notify("저장되었습니다.");
                    LoadReserveList();
                });
            }
        });

        dxInstances.reserveDateBegin.option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            value: new Date().addYears(-1),
            onValueChanged: function (e) {
                dxInstances.reserveDateEnd.option("min", e.value);
                LoadReserveList();
            }
        });

        dxInstances.reserveDateEnd.option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            onValueChanged: function (e) {
                dxInstances.reserveDateBegin.option("max", e.value);
                LoadReserveList();
            }
        });
    });
</script>
</html>
