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
                            <h3 class="h3">?덉빟痍⑥냼</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap logo-area-left btn-area-left">
                                <div class="row-box-title"><i class="xi-play-circle"></i>?덉빟 痍⑥냼 寃??/div>
                                <div class="row-box">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>湲곗뾽泥대챸</span></div>
                                                    <div class="col-lg-2" id="companyName"
                                                         data-sitebuilder="dxTextBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>蹂묒썝紐?/span></div>
                                                    <div class="col-lg-3" id="hospitalSearch"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                    <div class="col-lg-1 tag-name"><span>援щ텇</span></div>
                                                    <div class="col-lg-1" id="vipSearch" data-sitebuilder="dxCheckBox"></div>
                                                    <div class="col-lg-1" id="selectAll" data-sitebuilder="dxCheckBox"></div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>?좎쭨寃??/span></div>
                                                    <div class="col-lg-2" id="selectStatusDate"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>?좎쭨?좏깮</span></div>
                                                    <div class="col-lg-3" id="companyCheckup.reserveDateBegin"
                                                         data-sitebuilder="dxDateBox"></div>
                                                    <div class="col-lg-3" id="companyCheckup.reserveDateEnd"
                                                         data-sitebuilder="dxDateBox"></div>
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
                                                    <div class="col-lg-12" id="searchGrid" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Header -->

                        <div id="dataGridReserve" class="main_table" data-sitebuilder="dxDataGrid">
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>痍⑥냼?뺤젙</div>
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

        dxInstances.hospitalSearch.option({
            text: '蹂묒썝 寃??,
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
            text: '?댁쟾痍⑥냼???꾩껜蹂닿린',
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
                {'id': 0, 'text': '?덉빟?깅줉??},
                {'id': 1, 'text': '寃吏꾪씗留앹씪'}
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
            text: 'VIP議고쉶',
            value: false,
            onValueChanged: function () {
                search();
            },
        });

        dxInstances.searchGrid.option({
            placeholder: '寃??,
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
                caption: "?덉빟?곹깭",
                lookup: {
                    dataSource: [
                        {'id': 0, 'text': '?덉빟痍⑥냼'},
                        {'id': 1, 'text': '?덉빟?좎껌'},
                        {'id': 2, 'text': '?덉빟?뺤젙'},
                        {'id': 3, 'text': '?덉빟蹂寃?},
                        {'id': 4, 'text': '?섍??꾨즺'},
                        {'id': 5, 'text': '?덉빟蹂대쪟'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
                allowEditing: false,
            }, {
                dataField: "hospitalCenterName",
                caption: "寃吏꾨퀝??,
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "desiredAt",
                caption: "寃吏꾩씪",
                alignment: 'center',
                dataType: "date",
                allowEditing: false,
            }, {
                dataField: "ampm",
                caption: "?쒓컙",
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
                caption: "痍⑥냼?쇱떆",
                alignment: 'center',
                dataType: "datetime",
                allowEditing: false,
            }, {
                dataField: "canceledUserId",
                caption: "痍⑥냼??,
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "confirmedAt",
                caption: "痍⑥냼?뺤젙?쇱떆",
                alignment: 'center',
                dataType: "datetime",
                allowEditing: false,
            }, {
                dataField: "companyName",
                alignment: 'center',
                caption: "?뚯냽湲곗뾽",
                allowEditing: false,
            }, {
                dataField: "employeeName",
                caption: "寃吏꾩옄紐?,
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.append("<a href = " + '<c:url value="/cm/reserve"/>/view' + '/' + cellInfo.data.reservationId + ">" + cellInfo.text + "</a>");
                    cellElement.append(' - ');
                    if (cellInfo.data.myself === 1) {
                        cellElement.append('蹂몄씤');
                    } else {
                        cellElement.append(cellInfo.data.familyName + '媛議?);
                    }
                    if (cellInfo.data.vip === true) {
                        cellElement.append('<span style="color:red; font-weight: bold;">??/span>');
                    }
                },
                allowEditing: false,
            }, {
                dataField: "birth",
                caption: "?앸뀈?붿씪",
                alignment: 'center',
                dataType: "date",
                allowEditing: false,
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.append(cellInfo.text + '(' + cellInfo.data.sex + ')');
                },
            }, {
                dataField: "mobile",
                caption: "?대??꾪솕",
                alignment: 'center',
                format: function (value) {
                    return sitebuilder.phoneWithHyphen(value);
                },
                allowEditing: false,
            }, {
                dataField: "checkupTypeName",
                caption: "?덉빟?댁슜",
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    let companyCheckupTypeName = cellInfo.data.companyCheckupTypeName;
                    let companyCheckupTypeCode = cellInfo.data.companyCheckupTypeCode;
                    cellElement.append(companyCheckupTypeCode, '.', companyCheckupTypeName, ' - ', cellInfo.data.subTypeName);
                },
                allowEditing: false,
            }, {
                dataField: "supportType",
                caption: "寃吏꾨퉬 寃곗젣",
                alignment: 'center',
                lookup: {
                    dataSource: [
                        {'id': false, 'text': '湲곗뾽遺??},
                        {'id': true, 'text': '蹂몄씤遺??},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
                allowEditing: false,
            }, {
                dataField: "registeredAt",
                caption: "?덉빟?깅줉??,
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
            sitebuilder.valuesToDx(response.data);
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
            dsHospital.unshift({hospitalId: null, hospitalName: '?꾩껜'});
            dxInstances.hospitalSearch.option({
                dataSource: dsHospital,
                valueExpr: 'hospitalId',
                displayExpr: 'hospitalName',
                placeholder: '蹂묒썝 寃??,
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
                    alert('蹂寃쎈맂 ?ы빆???놁뒿?덈떎.');
                    return;
                } else {
                    alert('??ν븯?쒓쿋?듬땲源?');
                }

                $.ajax({
                    url: '<c:url value="/cm/cancel-reserve"/>',
                    method: 'POST',
                    data: JSON.stringify(getSelectedRows),
                }).then(function () {
                    sitebuilder.notify("??λ릺?덉뒿?덈떎.");
                    LoadReserveList();
                });
            }
        });
    });
</script>
</html>
