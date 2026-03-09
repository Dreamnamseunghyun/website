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
                            <h3 class="h3">?�약취소</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap1">
                                <div class="row-box-title"><i class="xi-play-circle"></i>?�약 취소 검??/div>
                                <div class="row-box row-box1">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>기업체명</span></div>
                                                    <div class="col-lg-2">
                                                        <div id="lookupCompany"
                                                             data-sitebuilder="dxLookup"></div>
                                                    </div>
                                                    <div class="col-lg-2 tag-name"><span>병원�?/span></div>
                                                    <div class="col-lg-3">
                                                        <div id="hospitalSearch"
                                                             data-sitebuilder="dxLookup"></div>
                                                    </div>
                                                    <div class="col-lg-1 border-left" id="vipSearch"
                                                         data-sitebuilder="dxCheckBox"></div>
                                                    <div class="col-lg-2" id="selectAll" data-sitebuilder="dxCheckBox"></div>

                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>?�짜검??/span></div>
                                                    <div class="col-lg-2" id="selectStatusDate"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>?�짜?�택</span></div>
                                                    <div class="col-lg-3" id="reserveDateBegin"
                                                         data-sitebuilder="dxDateBox"></div>
                                                    <div class="col-lg-3" id="reserveDateEnd"
                                                         data-sitebuilder="dxDateBox"></div>
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
                                        class="xi-play-circle"></i>?�약 취소 목록
                                </div>

                            </div>

                            <div class="row-wrap-box right">
                                <div class="row-wrap" style="box-shadow: none; padding:0;">
                                    <div class="row-box1">
                                        <div class="row-box-inner">
                                            <div class="col-box1 row">
                                                <div class="col-lg-12" id="searchGrid" data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Header -->


                        <div id="dataGridReserve" class="main_table" data-sitebuilder="dxDataGrid"></div>


                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>취소?�정</div>
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
        sitebuilder.openMenu('cancel-reserve');

        let dxInstances = sitebuilder.createDx(false);

        let cancelCheck = [];

        function LoadCancelNameList() {
            let ajaxCancelNameList = {
                url: '<c:url value="/pm/cancelnamelist"/>',
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
                url: '<c:url value="/pm/cancel-reserve"/>',
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
            text: '?�전취소???�체보기',
            onValueChanged: function (e) {
                search();
            }
        });

        LoadCancelNameList();
        LoadReserveList();

        dxInstances.selectStatusDate.option({
            dataSource: [
                {'id': 0, 'text': '?�약?�록??},
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
            placeholder: '검??,
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
                caption: "?�약?�태",
                alignment: 'center',
                allowEditing: false,
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.confirmedAt !== null) {
                        let confirmedAt = new Date(cellInfo.data.confirmedAt);
                        let canceledAt = new Date(cellInfo.data.canceledAt);
                        if ((confirmedAt.getTime() - canceledAt.getTime()) / 1000 / 60 / 60 >= 24) {
                            cellElement.append('<spen style="color: red">(?�동취소)</spen>');
                        } else {
                            cellElement.text('?�약취소');
                        }
                    } else {
                        cellElement.text('?�약취소');
                    }
                }
            }, {
                dataField: "hospitalCenterName",
                caption: "검진병??,
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
                caption: "?�간",
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
                caption: "취소?�시",
                alignment: 'center',
                dataType: "datetime",
                allowEditing: false,
            }, {
                dataField: "canceledUserId",
                caption: "취소??,
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "confirmedAt",
                caption: "취소?�정?�시",
                alignment: 'center',
                dataType: "datetime",
                allowEditing: false,
            }, {
                dataField: "companyName",
                alignment: 'center',
                caption: "?�속기업",
                allowEditing: false,
            }, {
                dataField: "employeeName",
                caption: "검진자�?,
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.append("<a href = " + '<c:url value="/pm/reserve"/>/view' + '/' + cellInfo.data.reservationId + ">" + cellInfo.text + "</a>");
                    cellElement.append(' - ');
                    if (cellInfo.data.myself === 1) {
                        cellElement.append('본인');
                    } else {
                        cellElement.append(cellInfo.data.familyName + '가�?);
                    }
                    if (cellInfo.data.vip === true) {
                        cellElement.append('<span style="color:red; font-weight: bold;">??/span>');
                    }
                },
                allowEditing: false,
            }, {
                dataField: "birth",
                caption: "?�년?�일",
                alignment: 'center',
                dataType: "date",
                allowEditing: false,
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.append(cellInfo.text + '(' + cellInfo.data.sex + ')');
                },
            }, {
                dataField: "mobile",
                caption: "?��??�화",
                alignment: 'center',
                format: function (value) {
                    return sitebuilder.phoneWithHyphen(value);
                },
                allowEditing: false,
            }, {
                dataField: "checkupTypeName",
                caption: "?�약?�용",
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
                        {'id': false, 'text': '기업부??},
                        {'id': true, 'text': '본인부??},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
                allowEditing: false,
            }, {
                dataField: "registeredAt",
                caption: "?�약?�록??,
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
            url: '<c:url value="/common/company?listType=LAST_ALL"/>',
            method: 'GET',
        }).then(function (response) {
            let dsCompany = response.data;
            dsCompany.unshift({companyId: null, companyName: '?�체'});
            dxInstances.lookupCompany.option({
                dataSource: dsCompany,
                valueExpr: 'companyId',
                displayExpr: 'companyName',
                placeholder: '기업�?검??,
                searchEnabled: true,
                searchExpr: 'companyName',
                searchMode: 'contains',
                onValueChanged: function () {
                    LoadReserveList();
                }
            });
        });

        $.ajax({
            url: '<c:url value="/common/hospital"/>',
            method: 'GET',
        }).then(function (response) {
            let dsHospital = response.data;
            dsHospital.unshift({hospitalId: null, hospitalName: '?�체'});
            dxInstances.hospitalSearch.option({
                dataSource: dsHospital,
                valueExpr: 'hospitalId',
                displayExpr: 'hospitalName',
                placeholder: '병원 검??,
                searchEnabled: true,
                searchExpr: 'hospitalName',
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
                    alert('변경된 ?�항???�습?�다.');
                    return;
                } else {
                    alert('?�?�하?�겠?�니�?');
                }

                $.ajax({
                    url: '<c:url value="/pm/cancel-reserve"/>',
                    method: 'POST',
                    data: JSON.stringify(getSelectedRows),
                }).then(function () {
                    sitebuilder.notify("?�?�되?�습?�다.");
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
