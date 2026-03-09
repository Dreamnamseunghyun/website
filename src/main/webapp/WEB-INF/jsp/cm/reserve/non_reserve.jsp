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
                            <h3 class="h3">誘몄삁?쎌옄 愿由?/h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap2">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>湲곗뾽泥?寃??/span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="companyName"
                                                     data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>援щ텇</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-6" id="vipSearch" data-sitebuilder="dxCheckBox"></div>
                                                <div class="col-lg-6" id="myselfSearch" data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



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

                        <div id="dataGridNonReserve" class="main_table" data-sitebuilder="dxDataGrid">
                        </div>
                        <div class="row btn_area footer-btn">
                            <div class="col-lg-2 btnGGSJ" id="btnNotitok" data-sitebuilder="dxButton"></div>
                        </div>
                    </div>
                    <%--</div>--%>
                </div>
            </div>
        </div>


    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        sitebuilder.openMenu('non-reserve');

        let dxInstances = sitebuilder.createDx(false);

        function LoadNonReserveList() {
            let ajaxNonReserve = {
                url: '<c:url value="/cm/non-reserve"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
            };

            $.when($.ajax(ajaxNonReserve)).then(function (response) {
                dxInstances.dataGridNonReserve.option({
                    dataSource: response.data,
                });

                if (response.data.notokUrge === true) {
                    for (let i = 0; i < response.data.length; i++) {
                        dxInstances.dataGridNonReserve.cellValue(response.data[i], 'check', true);
                    }
                }
            });
        }

        $.ajax({
            url: '<c:url value="/cm/company/0"/>',
            method: 'GET',
        }).then(function (response) {
            dxInstances.companyName.option({
                value: response.data.companyName,
                readOnly: true,
            });
        });

        dxInstances.vipSearch.option({
            text: 'VIP議고쉶',
            value: false,
            onValueChanged: search,
        });

        dxInstances.myselfSearch.option({
            dataSource: [
                {'id': 0, 'text': '?꾩껜'},
                {'id': null, 'text': '媛議?},
                {'id': 1, 'text': '蹂몄씤'},
            ],
            value: 'All',
            valueExpr: 'id',
            displayExpr: 'text',
            placeholder: "媛議?蹂몄씤",
            onValueChanged: search,
        });

        function search(data) {
            if (!data.event) {
                return;
            }

            let filters = [];

            if (dxInstances.vipSearch.option('value') === true) {
                if (filters.length) {
                    filters.push('and');
                }
                filters.push(['vip', "=", true]);
            } else if (dxInstances.vipSearch.option('value') === false) {
                if (filters.length) {
                    filters.push('and');
                }
                filters.push([
                    ['vip', "=", true],
                    'or',
                    ['vip', "=", false]
                ]);
            }

            if (dxInstances.myselfSearch.option('value') === null) {
                if (filters.length) {
                    filters.push('and');
                }
                filters.push(['myself', "=", null]);
            } else if (dxInstances.myselfSearch.option('value') === 1) {
                if (filters.length) {
                    filters.push('and');
                }
                filters.push(['myself', "=", 1]);
            } else if (dxInstances.myselfSearch.option('value') === 0) {
                if (filters.length) {
                    filters.push('and');
                }
                filters.push([
                    ['myself', "=", 1],
                    'or',
                    ['myself', "=", null]
                ]);
            }
            console.log(filters)
            dxInstances.dataGridNonReserve.filter(filters);
        }

        dxInstances.btnNotitok.option({
            text: '誘몄삁?쎌옄 ?뚮┝??諛쒖넚',
            onClick: function () {
            },
        });

        dxInstances.searchGrid.option({
            placeholder: '寃??,
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridNonReserve.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridNonReserve.option({
            dataSource: LoadNonReserveList(),
            editing: {
                mode: "batch",
                allowUpdating: true,
                allowAdding: true,
                allowDeleting: false,
                selectTextOnEditStart: false,
            },
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
                caption: "?쒕쾲",
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: "employeeName",
                caption: "寃吏꾩옄紐?,
                alignment: 'center',
                allowEditing: false,
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.append(cellInfo.data.employeeName);
                    if (cellInfo.data.vip === true) {
                        cellElement.append('<span style="color:red; font-weight: bold;">??/span>');
                    }
                },
            }, {
                dataField: "birth",
                caption: "?앸뀈?붿씪",
                alignment: 'center',
                allowEditing: false,
                dataType: 'date',
            }, {
                dataField: "sex",
                caption: "?깅퀎",
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "depart",
                caption: "遺??,
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "title",
                caption: "吏곸콉",
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "myself",
                caption: "??곸옄",
                alignment: 'center',
                allowEditing: false,
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.myself === 1) {
                        cellElement.append('蹂몄씤');
                    } else {
                        cellElement.append(cellInfo.data.familyName + '媛議?);
                    }
                    // if (cellInfo.data.vip === true) {
                    //     cellElement.append('<span style="color:red; font-weight: bold;">??/span>');
                    // }
                },
            }, {
                dataField: "employeeNo",
                caption: "?щ쾲",
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "checkupTypeName",
                caption: "寃吏꾩쑀??,
                alignment: 'center',
                allowEditing: false,
                cellTemplate: function (cellElement, cellInfo) {
                    let companyCheckupTypeName = cellInfo.data.companyCheckupTypeName;
                    let companyCheckupTypeCode = cellInfo.data.companyCheckupTypeCode;
                    cellElement.append(companyCheckupTypeCode, '.', companyCheckupTypeName);
                },
            }, {
                dataField: "mobile",
                caption: "?대??꾪솕踰덊샇",
                alignment: 'center',
                allowEditing: false,
                format: function (value) {
                    return sitebuilder.phoneWithHyphen(value);
                }
            }, {
                dataField: "email",
                caption: "?대찓??,
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "notes",
                caption: "?뱀씠?ы빆",
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "notokUrge",
                caption: "?덉빟?낅젮 ?쒖쇅",
                alignment: 'center',
                allowEditing: false,
            }],

            // Export
            onExporting: function (e) {
                let workbook = new ExcelJS.Workbook();
                let worksheet = workbook.addWorksheet('Sheet1');

                DevExpress.excelExporter.exportDataGrid({
                    'component': e.component,
                    'worksheet': worksheet,
                    'autoFilterEnabled': true
                }).then(function () {
                    workbook.xlsx.writeBuffer().then(function (buffer) {
                        saveAs(new Blob([buffer], {type: 'application/octet-stream'}), 'export.xlsx');
                    });
                });
                e.cancel = true;
            },

            onCellClick: function (event) {
                if (event.rowType === 'header' && event.columnIndex === 0) {
                    let count = dxInstances.dataGridNonReserve.getVisibleRows().length;
                    let selectAllMode = false;

                    for (let i = 0; i < count; i++) {
                        if (dxInstances.dataGridNonReserve.cellValue(i, 'check') === true) {
                            selectAllMode = false;
                        } else if (dxInstances.dataGridNonReserve.cellValue(i, 'check') === false || dxInstances.dataGridNonReserve.cellValue(i, 'check') === undefined) {
                            selectAllMode = true;
                            event.cellElement.css('checked', 'true');
                            break;
                        }
                    }

                    for (let i = 0; i < count; i++) {
                        dxInstances.dataGridNonReserve.cellValue(i, 'check', selectAllMode);
                    }

                    $('#selectAllBox').prop('checked', selectAllMode);
                }
            }
        });

        // Load
        let ajaxCompanyList = {
            url: '<c:url value="/common/company?listType=LAST_ALL"/>',
        }

        $.when($.ajax(ajaxCompanyList)).then(function (responseCompanyList) {
            // Company List
            dxInstances.lookupCompany.option({
                dataSource: responseCompanyList.data,
            });
        });
    });
</script>
</html>
