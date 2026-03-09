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
                            <h3 class="h3">진행병원</h3>
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
                                            <div class="col-lg-5 tag-name"><span>대상 년도</span></div>
                                            <div class="col-lg-7" id="checkupYear" data-ggsj="dxSelectBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row-wrap right">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12" id="searchGrid" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- Header -->

                        <div id="popupHospital" data-ggsj="dxPopup"></div>
                        <div id="dataGridContractSelectList" class="main_table" data-ggsj="dxDataGrid">
                        </div>

                        <div class="row btn_area index_btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"><i class="xi-save"></i>저장</div>
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
        ggsj.openMenu('contract');

        /** @param dxInstances : {dataGridContractSelectList} */
        let dxInstances = ggsj.createDx(false);
        let dsHospital = [];

        dxInstances.checkupYear.option({
            dataSource: ggsj.typeDef.Year,
            value: new Date().getFullYear(),
            onValueChanged: LoadContractList,
        });

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridContractSelectList.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridContractSelectList.option({
            paging: {
                enabled: false,
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
                dataField: 'companyId',
                visible: false,
            }, {
                caption: '기업체명',
                dataField: 'companyName',
                groupIndex: 0,
                groupCellTemplate: function (cellElement, cellInfo) {
                    $('<span>')
                        .text('기업체명 : ' + cellInfo.data.key)
                        .appendTo(cellElement);
                    $("<div class='blue'>")
                        .css({'float': 'right'})
                        .dxButton({
                            text: "병원(센터)등록",
                            onClick: function () {
                                dxInstances.popupHospital.userData = $.extend(true, {}, cellInfo.data.items[0]);
                                dxInstances.popupHospital.show();
                            }
                        }).appendTo(cellElement);
                },
            }, {
                caption: '진행병원 (센터)',
                dataField: 'centerId',
                allowEditing: false,
            }, {
                caption: '검진 유형',
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
            }]
        });

        dxInstances.popupHospital.option({
            title: "병원(센터) 검색",
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

                        dxInstances.dataGridContractSelectList.getDataSource().store().insert(dxInstances.popupHospital.userData).then(function () {
                            dxInstances.dataGridContractSelectList.refresh().then(function () {
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

                                let rowIndex = dxInstances.dataGridContractSelectList.getRowIndexByKey(key);
                                if (rowIndex >= 0) {
                                    dxInstances.dataGridContractSelectList.cellValue(rowIndex, 'contractTypes', contractTypes);
                                }
                            });
                        });
                    }
                }));
            },
        });

        dxInstances.btnSave.option({
            stylingMode: "contained",
            text: "저장",
            type: "success",
            onClick: function () {
                let changes = dxInstances.dataGridContractSelectList.option('editing.changes');
                let gridData = changes.map(function (v) {
                    return $.extend(true, {}, v.key, v.data);
                });
                //console.log(gridData);

                if (gridData.length === 0) {
                    ggsj.notify("변경 사항이 없습니다.");
                    return;
                }

                $.ajax({
                    url: '<c:url value="/pm/contract"/>',
                    method: 'POST',
                    data: JSON.stringify(gridData),
                }).then(function () {
                    ggsj.notify("저장되었습니다.");

                    LoadContractList();
                });
            }
        });

        function LoadContractList() {
            // Load
            let ajaxContractList = $.ajax({
                url: '<c:url value="/pm/contract/${companyId}"/>',
                data: {
                    checkupYear: dxInstances.checkupYear.option('value'),
                }
            });

            $.when(ajaxContractList).then(function (resultList) {
                console.log(resultList);

                // Item List
                dxInstances.dataGridContractSelectList.option({
                    dataSource: {
                        store: {
                            type: 'array',
                            data: resultList.data,
                            key: ['companyCheckupId', 'hospitalId', 'centerId'],
                        },
                    },
                });

                dxInstances.dataGridContractSelectList.cancelEditData();
            });
        }

        let ajaxCenterList = $.ajax({
            url: '<c:url value="/common/center"/>',
        });

        $.when(ajaxCenterList).then(function (resultList) {
            dsHospital = resultList.data;

            // Item List
            dxInstances.dataGridContractSelectList.columnOption('centerId', {
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
