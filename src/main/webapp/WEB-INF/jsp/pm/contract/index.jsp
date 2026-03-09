<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%--@elvariable id="sessionLoginName" type="java.lang.String"--%>

<!DOCTYPE html>
<html lang="ko">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
                            <h3 class="h3">ÏßÑÌñâÎ≥ëÏõê</h3>
                        </div>
                    </div>
                    <%--<div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">


                            <div class="row-wrap left">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-5 tag-name"><span>?Ä???ÑÎèÑ</span></div>
                                            <div class="col-lg-7" id="checkupYear" data-sitebuilder="dxSelectBox"></div>
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

                        <div id="popupHospital" data-sitebuilder="dxPopup"></div>
                        <div id="dataGridContractList1" class="main_table" data-sitebuilder="dxDataGrid">
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>?Ä??/div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
    <%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>

<script>
    $(function () {
        sitebuilder.openMenu('contract');

        /** @param dxInstances : {dataGridContractList1,searchGrid} */
        let dxInstances = sitebuilder.createDx(false);
        let dsHospital = [];
        let companyName = [];

        LoadContractList();

        dxInstances.checkupYear.option({
            dataSource: sitebuilder.typeDef.Year,
            value: new Date().getFullYear(),
            onValueChanged: LoadContractList,
        });

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
            valueChangeEvent: "keyup",
            mode: 'search',
            onValueChanged: function (e) {
                dxInstances.dataGridContractList1.searchByText(e.value);
            },
        });

        dxInstances.dataGridContractList1.option({
            paging: {
                enabled: false,
            },
            grouping: {
                autoExpandAll: false,
            },
            export: {enabled: false},
            onRowPrepared: function (e) {
                if (e.rowType === "data") {
                    if (e.data.centerId === null) {
                        e.rowElement.hide();
                    }
                }
            },
            columns: [{
                dataField: 'companyCheckupId',
                visible: false,
            }, {
                caption: 'Í∏∞ÏóÖ ?ÑÏù¥??,
                dataField: 'companyId',
                groupIndex: 0,
                calculateDisplayValue: 'companyName',
                groupCellTemplate: function (cellElement, cellInfo) {
                    $('<span>')
                        .html('Í∏∞ÏóÖÏ≤¥Î™Ö : ' + cellInfo.text)
                        .appendTo(cellElement);

                    if (cellInfo.data.items === null || cellInfo.data.items.length === 0) {
                        return;
                    }


                    $("<div class='blue'>")
                        .css({'float': 'right'})
                        .dxButton({
                            text: "Î≥ëÏõê(?ºÌÑ∞)?±Î°ù",
                            onClick: function () {
                                dxInstances.popupHospital.userData = $.extend(true, {}, cellInfo.data.items[0]);
                                dxInstances.popupHospital.show();
                            }
                        }).appendTo(cellElement);
                },
            }, {
                caption: 'Í∏∞ÏóÖÎ™?,
                dataField: 'companyName',
                allowEditing: false,
                visible: false,
            }, {
                caption: null,
                dataField: null,
                allowEditing: false,
                allowHeaderFiltering: false,
                allowGrouping: false,
                allowResizing: false,
                allowSearch: false,
                allowSorting: false,
                width: 20,
                visible: true,
            }, {
                caption: 'ÏßÑÌñâÎ≥ëÏõê (?ºÌÑ∞)',
                dataField: 'centerId',
                allowEditing: false,
                width: 500,
            }, {
                caption: 'Í≤ÄÏß??†Ìòï',
                dataField: 'contractTypes',
                allowEditing: false,
                cellTemplate: function (container, options) {
                    if (options.data.contractTypes) {
                        options.data.contractTypes.forEach(function (v) {
                            $('<div/>').css({'margin-right': 20}).dxCheckBox({
                                text: v.companyCheckupTypeCode + '. ' + v.companyCheckupTypeName,
                                value: v.register,
                                onValueChanged: function (e) {
                                    v.register = e.value;
                                    options.component.cellValue(options.rowIndex, options.columnIndex, options.data.contractTypes);
                                },
                            }).appendTo(container);
                        });
                    }
                }
            }],
        });

        dxInstances.popupHospital.option({
            title: "Î≥ëÏõê(?ºÌÑ∞) Í≤Ä??,
            width: 600,
            height: 580,
            contentTemplate: function (contentElement) {
                return contentElement.append($("<div />").dxList({
                    dataSource: dsHospital,
                    valueExpr: 'centerId',
                    displayExpr: 'hospitalCenterName',
                    searchEnabled: true,
                    searchExpr: 'hospitalCenterName',
                    searchMode: 'contains',
                    onItemClick: function (e) {
                        dxInstances.popupHospital.hide();
                        dxInstances.popupHospital.userData.hospitalId = e.itemData.hospitalId;
                        dxInstances.popupHospital.userData.centerId = e.itemData.centerId;
                        dxInstances.popupHospital.userData._crudType = 'INSERT';

                        dxInstances.dataGridContractList1.getDataSource().store().insert(dxInstances.popupHospital.userData).then(function () {
                            dxInstances.dataGridContractList1.refresh().then(function () {
                                // Set Default All Support
                                let key = {
                                    companyCheckupId: dxInstances.popupHospital.userData.companyCheckupId,
                                    hospitalId: dxInstances.popupHospital.userData.hospitalId,
                                    centerId: dxInstances.popupHospital.userData.centerId,
                                };

                                let contractTypes = dxInstances.popupHospital.userData.contractTypes.map(function (v) {
                                    v.register = true;
                                    return v;
                                });

                                let data = {
                                    contractTypes: contractTypes,
                                    companyCheckupId: dxInstances.popupHospital.userData.companyCheckupId,
                                    hospitalId: dxInstances.popupHospital.userData.hospitalId,
                                    centerId: dxInstances.popupHospital.userData.centerId,
                                };

                                let rowIndex = dxInstances.dataGridContractList1.getRowIndexByKey(key);
                                if (rowIndex >= 0) {
                                    console.log(rowIndex)
                                    dxInstances.dataGridContractList1.cellValue(rowIndex, 'contractTypes', contractTypes);
                                }

                                let changes = [];
                                changes.push(data);

                                $.ajax({
                                    url: '<c:url value="/pm/contract"/>',
                                    method: 'POST',
                                    data: JSON.stringify(changes),
                                }).then(function () {
                                    sitebuilder.notify("?±Î°ù?òÏóà?µÎãà??");
                                    LoadContractList();
                                });
                            });
                        });
                    }
                }));
            },
        });

        dxInstances.btnSave.option({
            stylingMode: "contained",
            text: "?Ä??,
            type: "success",
            onClick: function () {
                dxInstances.dataGridContractList1.getDataSource().store().load().done(function (data) {
                    let changes = data.filter(function (item) {
                        return item._crudType !== 'SELECT';
                    });
                });
                let changes = dxInstances.dataGridContractList1.option('editing.changes');
                let gridData = changes.map(function (v) {
                    return $.extend(true, {}, v.key, v.data);
                });
                console.log(gridData)
                if (gridData.length === 0) {
                    sitebuilder.notify("Î≥ÄÍ≤??¨Ìï≠???ÜÏäµ?àÎã§.");
                    return;
                }

                $.ajax({
                    url: '<c:url value="/pm/contract"/>',
                    method: 'POST',
                    data: JSON.stringify(gridData),
                }).then(function () {
                    sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");

                    LoadContractList();
                });
            }
        });

        function LoadContractList() {
            // Load
            let ajaxContractList = $.ajax({
                url: '<c:url value="/pm/contract"/>',
                data: {
                    checkupYear: dxInstances.checkupYear.option('value'),
                }
            });

            $.when(ajaxContractList).then(function (resultList) {
                companyName = resultList.data;
                // Item List
                dxInstances.dataGridContractList1.option({
                    dataSource: {
                        store: {
                            type: 'array',
                            data: companyName,
                            key: ['companyCheckupId', 'hospitalId', 'centerId'],
                        },
                    },
                });

                dxInstances.dataGridContractList1.cancelEditData();
            });
        }

        let ajaxCenterList = $.ajax({
            url: '<c:url value="/common/center"/>',
        });

        $.when(ajaxCenterList).then(function (resultList) {
            dsHospital = resultList.data;
            dxInstances.dataGridContractList1.columnOption('centerId', {
                lookup: {
                    dataSource: dsHospital,
                    valueExpr: "centerId",
                    displayExpr: "hospitalCenterName"
                }
            });

            LoadContractList();
        });

    });


</script>

</html>
