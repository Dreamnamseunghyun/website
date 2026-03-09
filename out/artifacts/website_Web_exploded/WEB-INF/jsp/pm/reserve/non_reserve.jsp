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
                            <h3 class="h3">ÎØ∏Ïòà?ΩÏûê Í¥ÄÎ¶?/h3>
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
                                            <div class="col-lg-4 tag-name"><span>Í∏∞ÏóÖÏ≤?Í≤Ä??/span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="lookupCompany"
                                                     data-sitebuilder="dxLookup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>Íµ¨Î∂Ñ</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-6" id="vipSearch" data-sitebuilder="dxCheckBox"></div>
                                                <div class="col-lg-6" id="myselfSearch" data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row-wrap row-wrap-box" style="margin-bottom:10px;">
                                <div class="row-wrap right" style="display:flex; align-items: center;">
                                    <div class="row-box left-btn">
                                        <div class="row-box-inner">
                                            <div class="col-box1 row">
                                                <div class="col-lg-12">
                                                    <div id="btnExport" class="btnExcelSample"
                                                         data-sitebuilder="dxButton"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row-box" style="border:1px solid #eaecef">
                                        <div class="row-box-inner">
                                            <div class="col-box1 row">

                                                <div id="searchGrid" data-sitebuilder="dxTextBox"></div>

                                            </div>
                                        </div>

                                    </div>


                                </div>

                            </div>


                        </div>
                        <!-- Header -->
                        <div class="checkText"><i class="xi-info-o"></i>Í∏∞ÏóÖÎ∂Ä??ÏßÅÏõê, Í∞ÄÏ°±Îßå Î™©Î°ù??Î≥¥ÏûÖ?àÎã§.
                        </div>
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

        dxInstances.btnExport.option({
            text: '?àÏïΩ?ÑÌô© ?§Ïö¥Î°úÎìú',
            onClick: function () {
                //$('.dx-datagrid-export-button').trigger('click');

                let workbook = new ExcelJS.Workbook();
                let worksheet = workbook.addWorksheet('Sheet1');

                worksheet.getColumn(1).width = 5;

                let itemData;

                // Title
                itemData = [];
                itemData[1] = '?úÎ≤à';
                itemData[2] = 'Í≤ÄÏßÑÏûêÎ™?;
                itemData[3] = '?ùÎÖÑ?îÏùº';
                itemData[4] = '?±Î≥Ñ';
                itemData[5] = 'Î∂Ä??;
                itemData[6] = 'ÏßÅÏ±Ö';
                itemData[7] = '?Ä?ÅÏûê';
                itemData[8] = '?¨Î≤à';
                itemData[9] = 'Í≤ÄÏßÑÏú†??;
                itemData[10] = '?¥Î??ÑÌôîÎ≤àÌò∏';
                itemData[11] = '?¥Î©î??;
                itemData[12] = '?πÏù¥?¨Ìï≠';

                worksheet.addRow(itemData);

                dxInstances.dataGridNonReserve.getDataSource().store().load().done(function (data) {
                    for (let idx = 0; idx < data.length; idx++) {
                        itemData = [];
                        itemData[1] = idx + 1;
                        itemData[2] = data[idx].employeeName;
                        itemData[3] = DevExpress.localization.formatDate(new Date(data[idx].birth), "yyyy-MM-dd");
                        itemData[4] = data[idx].sex;
                        itemData[5] = data[idx].depart;
                        itemData[6] = data[idx].title;
                        itemData[7] = data[idx].myself === 1 ? 'Î≥∏Ïù∏' : 'Í∞ÄÏ°?(' + data[idx].familyName + ')';
                        itemData[8] = data[idx].employeeNo;
                        itemData[9] = data[idx].companyCheckupTypeCode + '.' + data[idx].companyCheckupTypeName;
                        itemData[10] = sitebuilder.phoneWithHyphen(data[idx].mobile);
                        itemData[11] = data[idx].email;
                        itemData[12] = data[idx].notes;
                        worksheet.addRow(itemData);
                    }

                    workbook.xlsx.writeBuffer().then(function (buffer) {
                        saveAs(new Blob([buffer], {type: 'application/octet-stream'}), 'export.xlsx');
                    });
                });
            },
        });

        function LoadNonReserveList() {
            let ajaxNonReserve = {
                url: '<c:url value="/pm/non-reserve"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    companyCheckupId: dxInstances.lookupCompany.option('value')
                }
            };

            $.when($.ajax(ajaxNonReserve)).then(function (response) {
                console.log('?ÑÏ≤¥Î¶¨Ïä§??, response);

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

        dxInstances.lookupCompany.option({
            valueExpr: 'companyCheckupId',
            displayExpr: function (item) {
                return item && item.companyName + ' (' + item.checkupYear + ')';
            },
            dropDownOptions: {
                closeOnOutsideClick: true,
                showTitle: false,
            },
            searchEnabled: true,
            searchExpr: 'companyName',
            searchMode: 'contains',
            searchTimeout: 100,
            placeholder: "?åÏÇ¨Î•??†ÌÉù?¥Ï£º?∏Ïöî.",
            onValueChanged: function () {
                LoadNonReserveList();
            }
        });

        dxInstances.vipSearch.option({
            text: 'VIPÏ°∞Ìöå',
            value: false,
            onValueChanged: search,
        });

        dxInstances.myselfSearch.option({
            dataSource: [
                {'id': 0, 'text': '?ÑÏ≤¥'},
                {'id': null, 'text': 'Í∞ÄÏ°?},
                {'id': 1, 'text': 'Î≥∏Ïù∏'},
            ],
            value: 'All',
            valueExpr: 'id',
            displayExpr: 'text',
            placeholder: "Í∞ÄÏ°?Î≥∏Ïù∏",
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
            text: 'ÎØ∏Ïòà?ΩÏûê ?åÎ¶º??Î∞úÏÜ°',
            onClick: function () {
                location.href = '<c:url value="/pm/urge"/>';
            },
        });

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridNonReserve.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridNonReserve.option({
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
                caption: "?úÎ≤à",
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: "employeeName",
                caption: "Í≤ÄÏßÑÏûêÎ™?,
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.append(cellInfo.data.employeeName);
                    if (cellInfo.data.vip === true) {
                        cellElement.append('<span style="color:red; font-weight: bold;">??/span>');
                    }
                },
            }, {
                dataField: "birth",
                caption: "?ùÎÖÑ?îÏùº",
                alignment: 'center',
                dataType: 'date',
            }, {
                dataField: "sex",
                caption: "?±Î≥Ñ",
                alignment: 'center',
            }, {
                dataField: "depart",
                caption: "Î∂Ä??,
                alignment: 'center',
            }, {
                dataField: "title",
                caption: "ÏßÅÏ±Ö",
                alignment: 'center',
            }, {
                dataField: "myself",
                caption: "?Ä?ÅÏûê",
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.myself === 1) {
                        cellElement.append('Î≥∏Ïù∏');
                    } else {
                        cellElement.append(cellInfo.data.familyName + 'Í∞ÄÏ°?);
                    }
                    // if (cellInfo.data.vip === true) {
                    //     cellElement.append('<span style="color:red; font-weight: bold;">??/span>');
                    // }
                },
            }, {
                dataField: "employeeNo",
                caption: "?¨Î≤à",
                alignment: 'center',
            }, {
                dataField: "checkupTypeName",
                caption: "Í≤ÄÏßÑÏú†??,
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    let companyCheckupTypeName = cellInfo.data.companyCheckupTypeName;
                    let companyCheckupTypeCode = cellInfo.data.companyCheckupTypeCode;
                    cellElement.append(companyCheckupTypeCode, '.', companyCheckupTypeName);
                },
            }, {
                dataField: "mobile",
                caption: "?¥Î??ÑÌôîÎ≤àÌò∏",
                alignment: 'center',
                format: function (value) {
                    return sitebuilder.phoneWithHyphen(value);
                }
            }, {
                dataField: "email",
                caption: "?¥Î©î??,
                alignment: 'center',
            }, {
                dataField: "notes",
                caption: "?πÏù¥?¨Ìï≠",
                alignment: 'center',
            }, {
                dataField: "notokUrge",
                caption: "?àÏïΩ?ÖÎ†§ ?úÏô∏",
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

            onRowPrepared: function (event) {
                if (event.rowType === 'data' && event.cells[13].value === true) {
                    // dxInstances.dataGridNonReserve.cellValue(event.rowIndex, 'check', event.cells[13].value);
                } else {
                    // dxInstances.dataGridNonReserve.cellValue(event.rowIndex, 'check', event.value);
                }
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
