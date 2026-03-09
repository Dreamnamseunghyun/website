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
                            <h3 class="h3">?덉빟?꾪솴</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap">
                                <div class="row-box-title">
                                    <i class="xi-play-circle"></i>?덉빟?꾪솴 寃??諛??덉빟?곹깭 泥섎━
                                </div>


                                <div class="row-box">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>湲곗뾽泥대챸</span></div>
                                                    <div class="col-lg-4" id="companyName"
                                                         data-sitebuilder="dxTextBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>蹂묒썝紐?/span></div>
                                                    <div class="col-lg-4" id="hospitalSearch"
                                                         data-sitebuilder="dxLookup"></div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row margin-button">
                                                    <div class="col-lg-2 tag-name"><span>?덉빟?곹깭蹂?議고쉶</span></div>
                                                    <div class="col-lg-1">
                                                        <div id="all" data-sitebuilder="dxCheckBox"></div>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <div id="reserveApply"
                                                             data-sitebuilder="dxCheckBox"></div>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <div id="reserveCompleted"
                                                             data-sitebuilder="dxCheckBox"></div>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <div id="reserveChanged"
                                                             data-sitebuilder="dxCheckBox"></div>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <div id="completePay" data-sitebuilder="dxCheckBox"></div>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <div id="holdReserve" data-sitebuilder="dxCheckBox"></div>
                                                    </div>
                                                    <div class="col-lg-2 border-right"></div>
                                                    <div class="col-lg-1">
                                                        <div id="vipSearch" data-sitebuilder="dxCheckBox"></div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>?좎쭨寃??/span></div>
                                                    <div class="col-lg-2" id="selectStatusDate"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>?좎쭨?좏깮</span></div>
                                                    <div class="col-lg-3" id="reserveDateBegin"
                                                         data-sitebuilder="dxDateBox"></div>
                                                    <div class="col-lg-3" id="reserveDateEnd"
                                                         data-sitebuilder="dxDateBox"></div>
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
                                                <div id="btnExport" class="btnExcelSample" data-sitebuilder="dxButton"></div>
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

                        <div id="dataGridReserve" class="main_table" data-sitebuilder="dxDataGrid"></div>
                        <div id="popupMemo" data-sitebuilder="dxPopup"></div>
                        <div id="popupReserveContent" data-sitebuilder="dxPopup"></div>
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
        sitebuilder.openMenu('reserve');

        let dxInstances = sitebuilder.createDx(false);

        // dxInstances.info.option({
        //     value: '1嫄댁씠???좏깮?섏뿬 泥섎━踰꾪듉 ?대┃ ??諛섎뱶????ν빐二쇱꽭??',
        //     readOnly: true,
        // });

        dxInstances.btnExport.option({
            text: '?덉빟?꾪솴 ?ㅼ슫濡쒕뱶',
            onClick: function () {
                //$('.dx-datagrid-export-button').trigger('click');

                let workbook = new ExcelJS.Workbook();
                let worksheet = workbook.addWorksheet('Sheet1');

                worksheet.getColumn(1).width = 5;

                let itemData;

                // Title
                itemData = [];
                itemData[1] = '?쒕쾲';
                itemData[2] = '寃吏꾨퀝??;
                itemData[3] = '?덉빟?곹깭';
                itemData[4] = '寃吏꾩씪';
                itemData[5] = '?섍???;
                itemData[6] = '?뚯냽湲곗뾽';
                itemData[7] = '?ъ썝踰덊샇';
                itemData[8] = '遺?쒕챸/吏곸콉';
                itemData[9] = '寃吏꾩옄紐?;
                itemData[10] = '愿怨?;
                itemData[11] = '?앸뀈?붿씪';
                itemData[12] = '?대??꾪솕';
                itemData[13] = '?대찓??;
                itemData[14] = '二쇱냼';
                itemData[15] = '寃吏꾩쑀??;
                itemData[16] = '?좏깮寃??;
                itemData[17] = '異붽?寃??;
                itemData[18] = '?밴? ???臾쇱쭏';
                itemData[19] = '寃吏꾨퉬 泥?뎄';
                itemData[20] = '蹂몄씤遺?대퉬??;
                itemData[21] = '?뱀씠?ы빆';
                itemData[22] = '怨좉컼臾몄쓽?ы빆';
                itemData[23] = '嫄닿컯?댁옄硫붾え';
                itemData[24] = '蹂묒썝硫붾え';
                itemData[25] = '?덉빟蹂대쪟,痍⑥냼?ъ쑀';
                itemData[26] = '?덉빟?깅줉??;

                worksheet.addRow(itemData);

                dxInstances.dataGridReserve.getDataSource().store().load().done(function (data) {
                    for (let idx = 0; idx < data.length; idx++) {
                        itemData = [];
                        itemData[1] = idx + 1;
                        itemData[2] = data[idx].hospitalCenterName;

                        if (data[idx].reservationState === 1) {
                            data[idx].reservationState = '?덉빟?좎껌';
                        } else if (data[idx].reservationState === 2) {
                            data[idx].reservationState = '?덉빟?뺤젙';
                        } else if (data[idx].reservationState === 3) {
                            data[idx].reservationState = '?덉빟蹂寃?;
                        } else if (data[idx].reservationState === 4) {
                            data[idx].reservationState = '?섍??꾨즺';
                        } else if (data[idx].reservationState === 5) {
                            data[idx].reservationState = '?덉빟蹂대쪟';
                        }
                        itemData[3] = data[idx].reservationState;

                        if (data[idx].desiredAmpm === 'AM') {
                            data[idx].desiredAmpm = '?ㅼ쟾';
                        } else {
                            data[idx].desiredAmpm = '?ㅽ썑';
                        }

                        itemData[4] = DevExpress.localization.formatDate(new Date(data[idx].desiredAt), "yyyy-MM-dd") + " (" + data[idx].desiredAmpm + ")";

                        if (data[idx].checkupedAmpm === 'AM') {
                            data[idx].checkupedAmpm = '?ㅼ쟾';
                        } else {
                            data[idx].checkupedAmpm = '?ㅽ썑';
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
                        itemData[10] = data[idx].myself === 1 ? '蹂몄씤' : '媛議?(' + data[idx].familyName + ')';
                        itemData[11] = DevExpress.localization.formatDate(new Date(data[idx].birth), "yyyy-MM-dd");
                        itemData[12] = sitebuilder.phoneWithHyphen(data[idx].mobile);
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

                        itemData[18] = data[idx].specialCheckup === 0 ? '?대떦?놁쓬' : '?밴???? + ' / ' + data[idx].specialCheckupMemo;
                        itemData[19] = data[idx].supportType === true ? '蹂몄씤遺?? : '湲곗뾽遺?? + ' / ' + data[idx].hospitalPay;
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
            {'id': 0, 'text': '?덉빟痍⑥냼'},
            {'id': 1, 'text': '?덉빟?좎껌'},
            {'id': 2, 'text': '?덉빟?뺤젙'},
            {'id': 3, 'text': '?덉빟蹂寃?},
            {'id': 4, 'text': '?섍??꾨즺'},
            {'id': 5, 'text': '?덉빟蹂대쪟'},
        ];

        LoadCancelReserve();
        LoadReserveList();

        function LoadReserveList() {
            let selectStatusDate = dxInstances.selectStatusDate.option('value');

            let data = {
                hospitalId: dxInstances.hospitalSearch.option('value'),
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
                url: '<c:url value="/cm/reserve"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: data,
            };

            let dsReserveList;

            $.when($.ajax(ajaxReserveList)).then(function (responseReserve) {
                sitebuilder.valuesToDx(responseReserve.data);

                dsReserveList = responseReserve.data;

                dxInstances.dataGridReserve.option({
                    dataSource: responseReserve.data
                });

                dxInstances.dataGridReserve.columnOption('hospitalId', {
                    lookup: {
                        dataSource: responseReserve.data,
                        valueExpr: 'hospitalId',
                        displayExpr: 'hospitalCenterName',
                    }
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
                url: '<c:url value="/cm/cancel-reserve"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
            }).then(function (response) {
                let confirmedAt = response.data.map(function (v) {
                    return v.confirmedAt;
                });
            });
        }

        dxInstances.vipSearch.option({
            text: 'VIP議고쉶',
            value: false,
            onValueChanged: function (e) {
                if (e.value === true) {
                    dxInstances.dataGridReserve.filter(['vip', '=', true]);
                } else {
                    dxInstances.dataGridReserve.filter("!", ['reservationState', '=', 0]);
                }
            },
        });

        dxInstances.all.option({
            text: '?꾩껜',
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
            text: '?덉빟?좎껌',
            value: true,
            onValueChanged: search,
        });

        dxInstances.reserveCompleted.option({
            text: '?덉빟?뺤젙',
            value: true,
            onValueChanged: search,
        });

        dxInstances.reserveChanged.option({
            text: '?덉빟蹂寃?,
            value: true,
            onValueChanged: search,
        });

        dxInstances.completePay.option({
            text: '?섍??꾨즺',
            value: true,
            onValueChanged: search,
        });

        dxInstances.holdReserve.option({
            text: '?덉빟蹂대쪟',
            value: true,
            onValueChanged: search,
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
            // keyExpr: 'reservationId',
            // selection: {
            //     mode: "multiple",
            // },
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
                    caption: "寃吏꾨퀝??,
                    alignment: 'center',
                    allowEditing: false,
                }, {
                    dataField: "reservationState",
                    caption: "?덉빟?곹깭",
                    alignment: 'center',
                    lookup: {
                        dataSource: reserveState,
                        valueExpr: 'id',
                        displayExpr: 'text',
                    }
                }, {
                    dataField: "desiredAt",
                    caption: "寃吏꾩씪",
                    alignment: 'center',
                    dataType: "date",
                    cssClass: "hoverGray"
                }, {
                    dataField: "desiredAmpm",
                    caption: "?쒓컙",
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
                    caption: "?섍???,
                    alignment: 'center',
                    dataType: "date",
                    cssClass: "hoverBlue"
                }, {
                    dataField: "checkupedAmpm",
                    caption: "?쒓컙",
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
                    caption: "?뚯냽湲곗뾽",
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
                    caption: "寃吏꾩옄紐?,
                    alignment: 'center',
                    allowEditing: false,
                    cellTemplate: function (cellElement, cellInfo) {
                        // console.log(cellInfo.data)
                        cellElement.append("<a href = " + '<c:url value="/cm/reserve"/>/view' + '/' + cellInfo.data.reservationId + ">" + cellInfo.data.employeeName + "</a>");
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
                }, {
                    dataField: "birth",
                    caption: "?앸뀈?붿씪",
                    alignment: 'center',
                    dataType: "date",
                    allowEditing: false,
                    cellTemplate: function (cellElement, cellInfo) {
                        cellElement.append(cellInfo.text + '(' + cellInfo.data.sex + ')');
                    },
                    width: 100,
                }, {
                    dataField: "mobile",
                    caption: "?대??꾪솕",
                    alignment: 'center',
                    allowEditing: false,
                    format: function (value) {
                        return sitebuilder.phoneWithHyphen(value);
                    },
                }, {
                    dataField: "companyCheckupTypeName",
                    caption: "?덉빟?댁슜",
                    alignment: 'center',
                    allowEditing: false,
                    cellTemplate: function (cellElement, cellInfo) {
                        let companyCheckupTypeName = cellInfo.data.companyCheckupTypeName;
                        let companyCheckupTypeCode = cellInfo.data.companyCheckupTypeCode;
                        cellElement.append(companyCheckupTypeCode, '.', companyCheckupTypeName, ' - ', cellInfo.data.subTypeName);
                        if (cellInfo.row.data.specialCheckup === 1) {
                            cellElement.append('&nbsp<div class="specialCheck">??/div>');
                        }
                        cellElement.append('&nbsp<div class="reserveContent">+</div>');
                    },
                }, {
                    dataField: "supportType",
                    caption: "寃吏꾨퉬 寃곗젣",
                    alignment: 'center',
                    allowEditing: false,
                    lookup: {
                        dataSource: [
                            {'id': false, 'text': '湲곗뾽遺??},
                            {'id': true, 'text': '蹂몄씤遺??},
                        ],
                        valueExpr: 'id',
                        displayExpr: 'text',
                    }
                }, {
                    dataField: "allMemo",
                    caption: "硫붾え",
                    alignment: 'center',
                    allowEditing: false,
                    cellTemplate: function (cellElement, cellInfo) {
                        if (cellInfo.row.data.hospitalNotes) {
                            cellElement.append('<div class="hospitalMemo" title="' + cellInfo.row.data.hospitalNotes + '">蹂?/div>');
                        }
                        if (cellInfo.row.data.platformNotes) {
                            //cellElement.append('<span style="color: blue">??/span>');
                            cellElement.append('<div class="platformMemo" title="' + cellInfo.row.data.platformNotes + '">嫄?/div>');
                        }
                        if (cellInfo.row.data.employeeNotes) {
                            //cellElement.html('<span style="color: red">??/span>');
                            cellElement.append('<div class="employeeMemo" title="' + cellInfo.row.data.employeeNotes + '">怨?/div>');
                        }
                    }
                }, {
                    dataField: "registeredAt",
                    caption: "?덉빟?깅줉??,
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

            onCellClick: function (event) {
                if (event.rowType === 'data' && event.columnIndex === 13) {
                    dxInstances.popupMemo.show();
                    dxInstances.popupMemo.option({
                        title: "?꾩껜 硫붾え",
                        closeOnOutsideClick: true,
                        width: 800,
                        height: 500,
                        contentTemplate: function (contentElement) {
                            contentElement.append('<div style="font-weight: bold; color: #2ea3aa">蹂묒썝硫붾え</div>');
                            contentElement.append($("<div id='hospitalNotes' />").dxTextArea({
                                height: 100,
                                value: event.key.hospitalNotes,
                            }));
                            contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">嫄닿컯?댁옄硫붾え</div>');
                            contentElement.append($("<div id='platformNotes' />").dxTextArea({
                                height: 100,
                                value: event.key.platformNotes,
                            }));
                            contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">怨좉컼硫붾え</div>');
                            contentElement.append($("<div id='employeeNotes' />").dxTextArea({
                                height: 100,
                                value: event.key.employeeNotes,
                                readOnly: true,
                            }));
                            contentElement.append($("<div style='alignment: center;'/>").dxButton({
                                text: '???,
                                alignment: 'center',
                                onClick: function () {
                                    let hospitalNotes = DevExpress.ui.dxTextArea.getInstance($('#hospitalNotes'));
                                    let platformNotes = DevExpress.ui.dxTextArea.getInstance($('#platformNotes'));
                                    let employeeNotes = DevExpress.ui.dxTextArea.getInstance($('#employeeNotes'));
                                    event.data.hospitalNotes = hospitalNotes.option('value');
                                    event.data.platformNotes = platformNotes.option('value');
                                    event.data.employeeNotes = employeeNotes.option('value');
                                    $.ajax({
                                        url: '<c:url value="/cm/reserve-edit"/>',
                                        method: 'POST',
                                        data: JSON.stringify(event.data),
                                    }).then(function () {
                                        sitebuilder.notify("??λ릺?덉뒿?덈떎.");
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

        $('#dataGridReserve').on('click', '.reserveContent', function (e) {
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
                title: "?덉빟 ?몃? ?댁슜",
                closeOnOutsideClick: true,
                width: 600,
                height: 270,
                contentTemplate: function (contentElement) {
                    contentElement.append('<div style="font-weight: bold; color: #2ea3aa">?좏깮寃??/div>');
                    contentElement.append($("<div />").dxTextArea({
                        height: 60,
                        value: selectReserve,
                        readOnly: true,
                    }));
                    contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">異붽?寃??/div>');
                    contentElement.append($("<div />").dxTextArea({
                        height: 60,
                        value: addReserve,
                        readOnly: true,
                    }));
                    if (specialCheckup) {
                        dxInstances.popupReserveContent.option({
                            height: 350,
                        });
                        contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">?뱀닔寃?щЪ吏?/div>');
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
        $('#dataGridReserve').on('click', '.specialCheck', function (e) {
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
                title: "?덉빟 ?몃? ?댁슜",
                closeOnOutsideClick: true,
                width: 600,
                height: 270,
                contentTemplate: function (contentElement) {
                    contentElement.append('<div style="font-weight: bold; color: #2ea3aa">?좏깮寃??/div>');
                    contentElement.append($("<div />").dxTextArea({
                        height: 60,
                        value: selectReserve,
                        readOnly: true,
                    }));
                    contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">異붽?寃??/div>');
                    contentElement.append($("<div />").dxTextArea({
                        height: 60,
                        value: addReserve,
                        readOnly: true,
                    }));
                    if (specialCheckup) {
                        dxInstances.popupReserveContent.option({
                            height: 350,
                        });
                        contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">?뱀닔寃?щЪ吏?/div>');
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
                {'id': 0, 'text': '?덉빟?깅줉??},
                {'id': 1, 'text': '寃吏꾪씗留앹씪'}
            ],
            value: 0,
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: LoadReserveList,
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
            url: '<c:url value="/cm/company/0"/>',
            method: 'GET',
        }).then(function (response) {
            // console.log(response)
            dxInstances.companyName.option({
                value: response.data.companyName,
                readOnly: true,
            });
        });

        $.ajax({
            url: '<c:url value="/cm/reserve"/>',
            method: 'GET',
            data: {
                hospitalId: dxInstances.hospitalSearch.option('value'),
            },
        }).then(function (response) {
            sitebuilder.valuesToDx(response.data);
            console.log(response.data)
            dxInstances.dataGridReserve.option({
                dataSource: response.data
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
            url: '<c:url value="/cm/hospitallist"/>',
            method: 'GET',
        }).then(function (response) {
            // console.log(response.data)
            response.data.unshift({hospitalId: null, hospitalName: '?꾩껜'});
            dxInstances.hospitalSearch.option({
                dataSource: response.data,
                valueExpr: 'hospitalId',
                displayExpr: 'hospitalName',
                placeholder: '蹂묒썝 寃??,
                searchEnabled: true,
                searchExpr: 'hospitalName',
                searchMode: 'contains',
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
