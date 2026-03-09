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
                            <h3 class="h3">吏꾪뻾蹂묒썝</h3>
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
                                            <div class="col-lg-5 tag-name"><span>????꾨룄</span></div>
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
                        <div id="dataGridContractList" class="main_table" data-sitebuilder="dxDataGrid">
                        </div>
<%--                        <div class="row btn_area footer-btn">--%>
<%--                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>???/div>--%>
<%--                        </div>--%>

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

        /** @param dxInstances : {dataGridContractList} */
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
            placeholder: '寃??,
            valueChangeEvent: "keyup",
            mode: 'search',
            onValueChanged: function (e) {
                dxInstances.dataGridContractList.searchByText(e.value);
            },
        });

        dxInstances.dataGridContractList.option({
            stateStoring: {
                enabled: false,
            },
            pager: {
                visible: true,
                allowedPageSizes: 'all',
                showPageSizeSelector: false,
                showInfo: true,
                showNavigationButtons: false
            },
            paging: {
                enabled: false
            },
            editing: {
                mode: "batch",
                allowAdding: false,
                allowUpdating: true,
                allowDeleting: false,
                selectTextOnEditStart: true,
                startEditAction: "click"
            },
            export: {enabled: false},
            onRowPrepared: function (e) {
                if (e.rowType === "data") {
                    if (e.data.centerId === null) {
                        e.rowElement.hide();
                    }
                }
            },
            onToolbarPreparing: function (e) {
                // Modifies an existing item
                let toolbarItems = e.toolbarOptions.items;
                toolbarItems.forEach(function (item) {
                    if (item.name === "saveButton") {
                        item.visible = false;
                    } else if (item.name === "revertButton") {
                        item.visible = false;
                    }
                });
            },
            columns: [{
                dataField: 'companyCheckupId',
                visible: false,
            }, {
                caption: '湲곗뾽 ?꾩씠??,
                dataField: 'companyId',
                groupIndex: 0,
                calculateDisplayValue: 'companyName',
                groupCellTemplate: function (cellElement, cellInfo) {
                    let companyId = cellInfo.data.key;
                    $('<span>')
                        .text('湲곗뾽泥대챸 : ' + cellInfo.data.key)
                        .appendTo(cellElement);
                },
            }, {
                caption: '湲곗뾽紐?,
                dataField: 'companyName',
                allowEditing: false,
                visible: false,
            }, {
                caption: '吏꾪뻾蹂묒썝 (?쇳꽣)',
                dataField: 'centerId',
                allowEditing: false,
                allowSorting: true,
            }, {
                caption: '寃吏??좏삎',
                dataField: 'contractTypes',
                allowEditing: false,
                cellTemplate: function (container, options) {
                    if (options.data.contractTypes) {
                        options.data.contractTypes.forEach(function (v) {
                            $('<div/>').css({'margin-right': 20}).dxCheckBox({
                                // readOnly: true,
                                text: v.companyCheckupTypeCode + '. ' + v.companyCheckupTypeName,
                                value: v.register,
                                readOnly: true,
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

        function LoadContractList() {
            // Load
            let ajaxContractList = {
                url: '<c:url value="/cm/contract"/>',
                data: {
                    checkupYear: dxInstances.checkupYear.option('value'),
                }
            };

            $.when($.ajax(ajaxContractList)).then(function (resultList) {
                companyName = resultList.data;
                // Item List
                dxInstances.dataGridContractList.option({
                    dataSource: {
                        store: {
                            type: 'array',
                            data: resultList.data,
                            key: ['companyCheckupId', 'hospitalId', 'centerId'],
                        },
                    },
                });

                dxInstances.dataGridContractList.cancelEditData();
            });
        }

        let ajaxCenterList = {
            url: '<c:url value="/common/center"/>',
        };

        $.when($.ajax(ajaxCenterList)).then(function (resultList) {
            dsHospital = resultList.data;

            // Item List
            dxInstances.dataGridContractList.columnOption('centerId', {
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
