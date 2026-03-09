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
                            <h3 class="h3">?àÏïΩ?ÑÌô©</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap">
                                <div class="row-box-title">
                                    <i class="xi-play-circle"></i>?àÏïΩ?ÑÌô© Í≤Ä??Î∞??àÏïΩ?ÅÌÉú Ï≤òÎ¶¨
                                    <div class="right">
                                        <div class="btnCancel" id="btnCancelReserveList" data-sitebuilder="dxButton"></div>
                                    </div>
                                </div>


                                <div class="row-box">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>Í∏∞ÏóÖÏ≤¥Î™Ö</span></div>
                                                    <div class="col-lg-4" id="lookupCompany"
                                                         data-sitebuilder="dxLookup"></div>
                                                    <div class="col-lg-2 tag-name"><span>Î≥ëÏõêÎ™?/span></div>
                                                    <div class="col-lg-4" id="hospitalSearch"
                                                         data-sitebuilder="dxLookup"></div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row margin-button">
                                                    <div class="col-lg-2 tag-name"><span>?àÏïΩ?ÅÌÉú ?ºÍ¥Ñ Ï≤òÎ¶¨Î≤ÑÌäº</span></div>
                                                    <div class="col-lg-10" style="padding:0 16px!important">
                                                        <div id="reservation" class="btnReservation"
                                                             data-sitebuilder="dxButton"></div>
                                                        <div class="btnPayCompleted" id="payCompleted"
                                                             data-sitebuilder="dxButton"></div>
                                                        <div class="btnReserveCancel" id="reserveCancel"
                                                             data-sitebuilder="dxButton"></div>
                                                        <div class="btnReserveHold" id="reserveHold"
                                                             data-sitebuilder="dxButton"></div>
                                                        <div class="xi-info-o"></div>
                                                        <div class="col-lg-5" id="info" data-sitebuilder="dxTextBox"
                                                             style="margin-left: -12px"></div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row margin-button">
                                                    <div class="col-lg-2 tag-name"><span>?àÏïΩ?ÅÌÉúÎ≥?Ï°∞Ìöå</span></div>
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
                                                    <div class="col-lg-2 tag-name"><span>?†ÏßúÍ≤Ä??/span></div>
                                                    <div class="col-lg-2" id="selectStatusDate"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>?†Ïßú?†ÌÉù</span></div>
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
                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>?àÏïΩ?ÅÌÉú ?Ä??/div>
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
        sitebuilder.openMenu('reserve');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.info.option({
            value: '1Í±¥Ïù¥???†ÌÉù?òÏó¨ Ï≤òÎ¶¨Î≤ÑÌäº ?¥Î¶≠ ??Î∞òÎìú???Ä?•Ìï¥Ï£ºÏÑ∏??',
            readOnly: true,
        });

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
                itemData[2] = 'Í≤ÄÏßÑÎ≥ë??;
                itemData[3] = '?àÏïΩ?ÅÌÉú';
                itemData[4] = 'Í≤ÄÏßÑÏùº';
                itemData[5] = '?òÍ???;
                itemData[6] = '?åÏÜçÍ∏∞ÏóÖ';
                itemData[7] = '?¨ÏõêÎ≤àÌò∏';
                itemData[8] = 'Î∂Ä?úÎ™Ö/ÏßÅÏ±Ö';
                itemData[9] = 'Í≤ÄÏßÑÏûêÎ™?;
                itemData[10] = 'Í¥ÄÍ≥?;
                itemData[11] = '?ùÎÖÑ?îÏùº';
                itemData[12] = '?¥Î??ÑÌôî';
                itemData[13] = '?¥Î©î??;
                itemData[14] = 'Ï£ºÏÜå';
                itemData[15] = 'Í≤ÄÏßÑÏú†??;
                itemData[16] = '?†ÌÉùÍ≤Ä??;
                itemData[17] = 'Ï∂îÍ?Í≤Ä??;
                itemData[18] = '?πÍ? ?Ä??Î¨ºÏßà';
                itemData[19] = 'Í≤ÄÏßÑÎπÑ Ï≤?µ¨';
                itemData[20] = 'Î≥∏Ïù∏Î∂Ä?¥ÎπÑ??;
                itemData[21] = '?πÏù¥?¨Ìï≠';
                itemData[22] = 'Í≥†Í∞ùÎ¨∏Ïùò?¨Ìï≠';
                itemData[23] = 'Í±¥Í∞ï?¥ÏûêÎ©îÎ™®';
                itemData[24] = 'Î≥ëÏõêÎ©îÎ™®';
                itemData[25] = '?àÏïΩÎ≥¥Î•ò,Ï∑®ÏÜå?¨Ïú†';
                itemData[26] = '?àÏïΩ?±Î°ù??;

                worksheet.addRow(itemData);

                dxInstances.dataGridReserve.getDataSource().store().load().done(function (data) {
                    for (let idx = 0; idx < data.length; idx++) {
                        itemData = [];
                        itemData[1] = idx + 1;
                        itemData[2] = data[idx].hospitalCenterName;

                        if (data[idx].reservationState === 1) {
                            data[idx].reservationState = '?àÏïΩ?†Ï≤≠';
                        } else if (data[idx].reservationState === 2) {
                            data[idx].reservationState = '?àÏïΩ?ïÏ†ï';
                        } else if (data[idx].reservationState === 3) {
                            data[idx].reservationState = '?àÏïΩÎ≥ÄÍ≤?;
                        } else if (data[idx].reservationState === 4) {
                            data[idx].reservationState = '?òÍ??ÑÎ£å';
                        } else if (data[idx].reservationState === 5) {
                            data[idx].reservationState = '?àÏïΩÎ≥¥Î•ò';
                        }
                        itemData[3] = data[idx].reservationState;

                        if (data[idx].desiredAmpm === 'AM') {
                            data[idx].desiredAmpm = '?§Ï†Ñ';
                        } else {
                            data[idx].desiredAmpm = '?§ÌõÑ';
                        }

                        itemData[4] = DevExpress.localization.formatDate(new Date(data[idx].desiredAt), "yyyy-MM-dd") + " (" + data[idx].desiredAmpm + ")";

                        if (data[idx].checkupedAmpm === 'AM') {
                            data[idx].checkupedAmpm = '?§Ï†Ñ';
                        } else {
                            data[idx].checkupedAmpm = '?§ÌõÑ';
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
                        itemData[10] = data[idx].myself === 1 ? 'Î≥∏Ïù∏' : 'Í∞ÄÏ°?(' + data[idx].familyName + ')';
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

                        itemData[18] = data[idx].specialCheckup === 0 ? '?¥Îãπ?ÜÏùå' : '?πÍ??Ä?? + ' / ' + data[idx].specialCheckupMemo;
                        itemData[19] = data[idx].supportType === true ? 'Î≥∏Ïù∏Î∂Ä?? : 'Í∏∞ÏóÖÎ∂Ä?? + ' / ' + data[idx].hospitalPay;
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
            {'id': 0, 'text': '?àÏïΩÏ∑®ÏÜå'},
            {'id': 1, 'text': '?àÏïΩ?†Ï≤≠'},
            {'id': 2, 'text': '?àÏïΩ?ïÏ†ï'},
            {'id': 3, 'text': '?àÏïΩÎ≥ÄÍ≤?},
            {'id': 4, 'text': '?òÍ??ÑÎ£å'},
            {'id': 5, 'text': '?àÏïΩÎ≥¥Î•ò'},
        ];

        LoadCancelReserve();
        LoadReserveList();

        function LoadReserveList() {
            let selectStatusDate = dxInstances.selectStatusDate.option('value');

            let data = {
                companyId: dxInstances.lookupCompany.option('value'),
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
                url: '<c:url value="/pm/reserve"/>',
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
                url: '<c:url value="/pm/cancel-reserve"/>',
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
                                template: '?àÏïΩÏ∑®ÏÜå??<span style="color: red;">NEW</span>',
                                onClick: function () {
                                    location.href = '<c:url value="/pm/cancel-reserve"/>';
                                }
                            });
                        } else {
                            dxInstances.btnCancelReserveList.option({
                                text: '?àÏïΩÏ∑®ÏÜå??,
                                onClick: function () {
                                    location.href = '<c:url value="/pm/cancel-reserve"/>';
                                }
                            });
                        }
                    }
                } else {
                    dxInstances.btnCancelReserveList.option({
                        text: '?àÏïΩÏ∑®ÏÜå??,
                        onClick: function () {
                            location.href = '<c:url value="/pm/cancel-reserve"/>';
                        }
                    });
                }
            });
        }

        dxInstances.vipSearch.option({
            text: 'VIPÏ°∞Ìöå',
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
        //     text: '?ºÍ¥Ñ?ïÏ†ï ?ÖÎ°ú??,
        // });

        dxInstances.reservation.option({
            text: '?àÏïΩ?ïÏ†ï',
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
                    // keyExpr ???¨Ïö©??Í≤ΩÏö∞
                    // const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRowsData[i].reservationId);
                    const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRows[i]);
                    dxInstances.dataGridReserve.cellValue(rowIndex, 'reservationState', 2);
                }
            }
        });

        dxInstances.payCompleted.option({
            text: '?òÍ??ÑÎ£å',
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
                    // keyExpr ???¨Ïö©??Í≤ΩÏö∞
                    // const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRowsData[i].reservationId);
                    const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRows[i]);
                    dxInstances.dataGridReserve.cellValue(rowIndex, 'reservationState', 4);
                }
            }
        });

        dxInstances.reserveCancel.option({
            text: '?àÏïΩÏ∑®ÏÜå',
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
                    // keyExpr ???¨Ïö©??Í≤ΩÏö∞
                    // const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRowsData[i].reservationId);
                    const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRows[i]);
                    dxInstances.dataGridReserve.cellValue(rowIndex, 'reservationState', 0);
                }
            }
        });

        dxInstances.reserveHold.option({
            text: '?àÏïΩÎ≥¥Î•ò',
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
                    // keyExpr ???¨Ïö©??Í≤ΩÏö∞
                    // const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRowsData[i].reservationId);
                    const rowIndex = dxInstances.dataGridReserve.getRowIndexByKey(getSelectedRows[i]);
                    dxInstances.dataGridReserve.cellValue(rowIndex, 'reservationState', 5);
                }
            }
        });

        dxInstances.all.option({
            text: '?ÑÏ≤¥',
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
            text: '?àÏïΩ?†Ï≤≠',
            value: true,
            onValueChanged: search,
        });

        dxInstances.reserveCompleted.option({
            text: '?àÏïΩ?ïÏ†ï',
            value: true,
            onValueChanged: search,
        });

        dxInstances.reserveChanged.option({
            text: '?àÏïΩÎ≥ÄÍ≤?,
            value: true,
            onValueChanged: search,
        });

        dxInstances.completePay.option({
            text: '?òÍ??ÑÎ£å',
            value: true,
            onValueChanged: search,
        });

        dxInstances.holdReserve.option({
            text: '?àÏïΩÎ≥¥Î•ò',
            value: true,
            onValueChanged: search,
        });

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
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
                    caption: "Í≤ÄÏßÑÎ≥ë??,
                    alignment: 'center',
                    allowEditing: false,
                }, {
                    dataField: "reservationState",
                    caption: "?àÏïΩ?ÅÌÉú",
                    alignment: 'center',
                    lookup: {
                        dataSource: reserveState,
                        valueExpr: 'id',
                        displayExpr: 'text',
                    }
                }, {
                    dataField: "desiredAt",
                    caption: "Í≤ÄÏßÑÏùº",
                    alignment: 'center',
                    dataType: "date",
                    cssClass: "hoverGray"
                }, {
                    dataField: "desiredAmpm",
                    caption: "?úÍ∞Ñ",
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
                    caption: "?òÍ???,
                    alignment: 'center',
                    dataType: "date",
                    cssClass: "hoverBlue"
                }, {
                    dataField: "checkupedAmpm",
                    caption: "?úÍ∞Ñ",
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
                    caption: "?åÏÜçÍ∏∞ÏóÖ",
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
                    caption: "Í≤ÄÏßÑÏûêÎ™?,
                    alignment: 'center',
                    allowEditing: false,
                    cellTemplate: function (cellElement, cellInfo) {
                        cellElement.append("<a href = " + '<c:url value="/pm/reserve"/>/view' + '/' + cellInfo.data.reservationId + ">" + cellInfo.data.employeeName + "</a>");
                        cellElement.append(' - ');
                        if (cellInfo.data.myself === 1) {
                            cellElement.append('Î≥∏Ïù∏');
                        } else {
                            cellElement.append(cellInfo.data.familyName + 'Í∞ÄÏ°?);
                        }
                        if (cellInfo.data.vip === true) {
                            cellElement.append('<span style="color:red; font-weight: bold;">??/span>');
                        }
                    },
                }, {
                    dataField: "birth",
                    caption: "?ùÎÖÑ?îÏùº",
                    alignment: 'center',
                    dataType: "date",
                    allowEditing: false,
                    cellTemplate: function (cellElement, cellInfo) {
                        cellElement.append(cellInfo.text + '(' + cellInfo.data.sex + ')');
                    },
                    width: 100,
                }, {
                    dataField: "mobile",
                    caption: "?¥Î??ÑÌôî",
                    alignment: 'center',
                    allowEditing: false,
                    format: function (value) {
                        return sitebuilder.phoneWithHyphen(value);
                    },
                }, {
                    dataField: "companyCheckupTypeName",
                    caption: "?àÏïΩ?¥Ïö©",
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
                    caption: "Í≤ÄÏßÑÎπÑ Í≤∞Ï†ú",
                    alignment: 'center',
                    allowEditing: false,
                    lookup: {
                        dataSource: [
                            {'id': false, 'text': 'Í∏∞ÏóÖÎ∂Ä??},
                            {'id': true, 'text': 'Î≥∏Ïù∏Î∂Ä??},
                        ],
                        valueExpr: 'id',
                        displayExpr: 'text',
                    }
                }, {
                    dataField: "allMemo",
                    caption: "Î©îÎ™®",
                    alignment: 'center',
                    allowEditing: false,
                    cellTemplate: function (cellElement, cellInfo) {
                        if (cellInfo.row.data.hospitalNotes) {
                            cellElement.append('<div class="hospitalMemo" title="' + cellInfo.row.data.hospitalNotes + '">Î≥?/div>');
                        }
                        if (cellInfo.row.data.platformNotes) {
                            //cellElement.append('<span style="color: blue">??/span>');
                            cellElement.append('<div class="platformMemo" title="' + cellInfo.row.data.platformNotes + '">Í±?/div>');
                        }
                        if (cellInfo.row.data.employeeNotes) {
                            //cellElement.html('<span style="color: red">??/span>');
                            cellElement.append('<div class="employeeMemo" title="' + cellInfo.row.data.employeeNotes + '">Í≥?/div>');
                        }
                    }
                }, {
                    dataField: "registeredAt",
                    caption: "?àÏïΩ?±Î°ù??,
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
                //         {'id': 0, 'text': '?àÏïΩÏ∑®ÏÜå'},
                //         {'id': 2, 'text': '?àÏïΩ?ïÏ†ï'},
                //         {'id': 3, 'text': '?àÏïΩÎ≥ÄÍ≤?},
                //         {'id': 5, 'text': '?àÏïΩÎ≥¥Î•ò'},
                //     ];
                // } else if (e.rowType === 'data' && (e.data.reservationState === 2 || e.data.reservationState === 3)) {
                //     e.columns[2].lookup.dataSource = [
                //         {'id': 0, 'text': '?àÏïΩÏ∑®ÏÜå'},
                //         {'id': 1, 'text': '?àÏïΩ?†Ï≤≠'},
                //         {'id': 2, 'text': '?àÏïΩ?ïÏ†ï'},
                //         {'id': 3, 'text': '?àÏïΩÎ≥ÄÍ≤?},
                //         {'id': 4, 'text': '?òÍ??ÑÎ£å'},
                //         {'id': 5, 'text': '?àÏïΩÎ≥¥Î•ò'},
                //     ];
                // } else {
                //     e.columns[2].lookup.dataSource = [
                //         {'id': 0, 'text': '?àÏïΩÏ∑®ÏÜå'},
                //         {'id': 1, 'text': '?àÏïΩ?†Ï≤≠'},
                //         {'id': 2, 'text': '?àÏïΩ?ïÏ†ï'},
                //         {'id': 4, 'text': '?òÍ??ÑÎ£å'},
                //         {'id': 5, 'text': '?àÏïΩÎ≥¥Î•ò'},
                //     ];
                // }
            },

            onCellClick: function (event) {
                if (event.rowType === 'data' && event.columnIndex === 13) {
                    dxInstances.popupMemo.show();
                    dxInstances.popupMemo.option({
                        title: "?ÑÏ≤¥ Î©îÎ™®",
                        closeOnOutsideClick: true,
                        width: 800,
                        height: 500,
                        contentTemplate: function (contentElement) {
                            contentElement.append('<div style="font-weight: bold; color: #2ea3aa">Î≥ëÏõêÎ©îÎ™®</div>');
                            contentElement.append($("<div id='hospitalNotes' />").dxTextArea({
                                height: 100,
                                value: event.key.hospitalNotes,
                            }));
                            contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">Í±¥Í∞ï?¥ÏûêÎ©îÎ™®</div>');
                            contentElement.append($("<div id='platformNotes' />").dxTextArea({
                                height: 100,
                                value: event.key.platformNotes,
                            }));
                            contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">Í≥†Í∞ùÎ©îÎ™®</div>');
                            contentElement.append($("<div id='employeeNotes' />").dxTextArea({
                                height: 100,
                                value: event.key.employeeNotes,
                                readOnly: true,
                            }));
                            contentElement.append($("<div style='alignment: center;'/>").dxButton({
                                text: '?Ä??,
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
                                        sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");
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
            let selectedItemsA = '';
            let selectedItemsB = '';
            let selectedItemsC = '';
            let selectedItemsD = '';
            let selectedItemsE = '';
            let selectedItemsF = '';
            let specialCheckup = dxInstances.dataGridReserve.getSelectedRowsData()[0].specialCheckup;
            let specialCheckupMemo = dxInstances.dataGridReserve.getSelectedRowsData()[0].specialCheckupMemo;
            for (let i = 0; i < reserveItems.length; i++) {
                if (reserveItems[i].register === 'A') {
                    if (selectedItemsA === '') {
                        selectedItemsA = reserveItems[i].itemName;
                    } else {
                        selectedItemsA = selectedItemsA + ' / ' + reserveItems[i].itemName;
                    }
                } else if (reserveItems[i].register === 'B') {
                    if (selectedItemsB === '') {
                        selectedItemsB = reserveItems[i].itemName;
                    } else {
                        selectedItemsB = selectedItemsB + ' / ' + reserveItems[i].itemName;
                    }
                } else if (reserveItems[i].register === 'C') {
                    if (selectedItemsC === '') {
                        selectedItemsC = reserveItems[i].itemName;
                    } else {
                        selectedItemsC = selectedItemsC + ' / ' + reserveItems[i].itemName;
                    }
                } else if (reserveItems[i].register === 'D') {
                    if (selectedItemsD === '') {
                        selectedItemsD = reserveItems[i].itemName;
                    } else {
                        selectedItemsD = selectedItemsD + ' / ' + reserveItems[i].itemName;
                    }
                } else if (reserveItems[i].register === 'E') {
                    if (selectedItemsE === '') {
                        selectedItemsE = reserveItems[i].itemName;
                    } else {
                        selectedItemsE = selectedItemsE + ' / ' + reserveItems[i].itemName;
                    }
                } else if (reserveItems[i].register === 'F') {
                    if (selectedItemsF === '') {
                        selectedItemsF = reserveItems[i].itemName;
                    } else {
                        selectedItemsF = selectedItemsF + ' / ' + reserveItems[i].itemName;
                    }
                } else if (reserveItems[i].register === '2') {
                    if (addReserve === '') {
                        addReserve = reserveItems[i].itemName;
                    } else {
                        addReserve = addReserve + ' / ' + reserveItems[i].itemName;
                    }
                }
            }
            for (let i = 65; i < 71; i++) {
                if (eval('selectedItems' + String.fromCharCode(i)) !== '') {
                    if (selectReserve === '') {
                        selectReserve += eval('selectedItems' + String.fromCharCode(i))
                    } else {
                        selectReserve += (' / ' + eval('selectedItems' + String.fromCharCode(i)))
                    }
                }
            }
            dxInstances.popupReserveContent.show();

            dxInstances.popupReserveContent.option({
                title: "?àÏïΩ ?∏Î? ?¥Ïö©",
                closeOnOutsideClick: true,
                width: 600,
                height: 270,
                contentTemplate: function (contentElement) {
                    contentElement.append('<div style="font-weight: bold; color: #2ea3aa">?†ÌÉùÍ≤Ä??/div>');
                    contentElement.append($("<div />").dxTextArea({
                        height: 60,
                        value: selectReserve,
                        readOnly: true,
                    }));
                    contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">Ï∂îÍ?Í≤Ä??/div>');
                    contentElement.append($("<div />").dxTextArea({
                        height: 60,
                        value: addReserve,
                        readOnly: true,
                    }));
                    if (specialCheckup) {
                        dxInstances.popupReserveContent.option({
                            height: 350,
                        });
                        contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">?πÏàòÍ≤Ä?¨Î¨ºÏß?/div>');
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
                title: "?àÏïΩ ?∏Î? ?¥Ïö©",
                closeOnOutsideClick: true,
                width: 600,
                height: 270,
                contentTemplate: function (contentElement) {
                    contentElement.append('<div style="font-weight: bold; color: #2ea3aa">?†ÌÉùÍ≤Ä??/div>');
                    contentElement.append($("<div />").dxTextArea({
                        height: 60,
                        value: selectReserve,
                        readOnly: true,
                    }));
                    contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">Ï∂îÍ?Í≤Ä??/div>');
                    contentElement.append($("<div />").dxTextArea({
                        height: 60,
                        value: addReserve,
                        readOnly: true,
                    }));
                    if (specialCheckup) {
                        dxInstances.popupReserveContent.option({
                            height: 350,
                        });
                        contentElement.append('<br> <div style="font-weight: bold; color: #2ea3aa">?πÏàòÍ≤Ä?¨Î¨ºÏß?/div>');
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
                {'id': 0, 'text': '?àÏïΩ?±Î°ù??},
                {'id': 1, 'text': 'Í≤ÄÏßÑÌù¨ÎßùÏùº'}
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
                    alert('Î≥ÄÍ≤ΩÎêú ?¨Ìï≠???ÜÏäµ?àÎã§.');
                } else {
                    if (confirm('?ïÎßêÎ°??Ä?•Ìïò?úÍ≤†?µÎãàÍπ?')) {
                        $.ajax({
                            url: '<c:url value="/pm/reserve"/>',
                            method: 'POST',
                            data: JSON.stringify(gridData),
                        }).then(function () {
                            sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");
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
            url: '<c:url value="/common/company?listType=LAST_ALL"/>',
            method: 'GET',
        }).then(function (response) {
            response.data.unshift({companyId: null, companyName: '?ÑÏ≤¥'});
            dxInstances.lookupCompany.option({
                dataSource: response.data,
                valueExpr: 'companyId',
                displayExpr: 'companyName',
                placeholder: 'Í∏∞ÏóÖÏ≤?Í≤Ä??,
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
            url: '<c:url value="/common/hospital"/>',
            method: 'GET',
        }).then(function (response) {
            response.data.unshift({hospitalId: null, hospitalName: '?ÑÏ≤¥'});
            dxInstances.hospitalSearch.option({
                dataSource: response.data,
                valueExpr: 'hospitalId',
                displayExpr: 'hospitalName',
                placeholder: 'Î≥ëÏõê Í≤Ä??,
                searchEnabled: true,
                searchExpr: 'hospitalName',
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
