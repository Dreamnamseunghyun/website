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
                            <h3 class="h3">Í≤ÄÏß??†Ìòï ?òÏ†ï</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- Í≤ÄÏß??†Ìòï ?∏Î? ?ïÎ≥¥ -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Í≤ÄÏß??†Ìòï ?∏Î? ?ïÎ≥¥
                                <%--                                <div class="btnCheckup right" id="btnCopy" data-sitebuilder="dxButton"></div>--%>
                                <%--                                <div class="btnCheckup right" id="btnReview" data-sitebuilder="dxButton"--%>
                                <%--                                     style="margin-right: 10px"></div>--%>
                                <%--                                <div id="popupReview" data-sitebuilder="dxPopup"></div>--%>
                            </div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Î≥ëÏõêÎ™?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="hospitalCenterName" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Í∏∞ÏóÖÏ≤¥Î™Ö</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="companyNameYear" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Í≤ÄÏßÑÏú†??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="checkupContractTypeId"
                                                 data-sitebuilder="dxSelectBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?∏Î??†ÌòïÎ™?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="subTypeName" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Î≥ëÏõêÏ≤?µ¨??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="checkupContractTypes.hospitalPay"
                                                 data-sitebuilder="dxNumberBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?ÖÍ∑∏?àÏù¥?úÌòï</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="upgradePay" data-sitebuilder="dxNumberBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Í≤ÄÏß??†Ìòï ?∏Î? ?ïÎ≥¥ -->

                        <!-- ?†ÌÉù Í≤ÄÏß??∏Î? ?ïÎ≥¥ -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>?†ÌÉù Í≤ÄÏß??∏Î? ?ïÎ≥¥
                                <div class="right button-box">
                                    <div class="btnExcelImport" id="btnImport" data-sitebuilder="dxButton"></div>
                                    <div class="btnExcelDown" id="btnExport" data-sitebuilder="dxButton"></div>
                                    <input style="display: none" id="openFile" type="file">
                                </div>


                            </div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name border-right"><span>?†ÌÉùÍ≤ÄÏß?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 tag-name border-right"><span>Í∞úÏàò</span></div>
                                            <div class="col-lg-10 tag-name"><span>Î©îÎ™®</span></div>
                                            <%--                                            <div class="col-lg-2 center" id="text_1" data-sitebuilder="dxTextBox"></div>--%>
                                            <%--                                            <div class="col-lg-10 center" id="text_2" data-sitebuilder="dxTextBox"></div>--%>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name border-right"><span>?†ÌÉùÍ≤ÄÏß?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 tag-name border-right"><span>Í∞úÏàò</span></div>
                                            <div class="col-lg-10 tag-name"><span>Î©îÎ™®</span></div>
                                            <%--                                            <div class="col-lg-2 center" id="text_3" data-sitebuilder="dxTextBox"></div>--%>
                                            <%--                                            <div class="col-lg-10 center" id="text_4" data-sitebuilder="dxTextBox"></div>--%>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?†ÌÉùA</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectACount"
                                                 data-sitebuilder="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectAMemo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?†ÌÉùD</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectDCount"
                                                 data-sitebuilder="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectDMemo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?†ÌÉùB</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectBCount"
                                                 data-sitebuilder="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectBMemo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?†ÌÉùE</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectECount"
                                                 data-sitebuilder="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectEMemo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?†ÌÉùC</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectCCount"
                                                 data-sitebuilder="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectCMemo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?†ÌÉùF</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectFCount"
                                                 data-sitebuilder="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectFMemo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ?†ÌÉù Í≤ÄÏß??∏Î? ?ïÎ≥¥ -->

                        <%--<div class="row">
                            <div class="col-lg-4">Í∞úÎ≥Ñ?±Î°ù (?±Î°ù?®ÌÇ§ÏßÄ ÎØ∏Î¶¨Î≥¥Í∏∞)</div>
                        </div>--%>

                        <!-- checkBox -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap logo-area-left">
                                <div class="row-box-title"><i class="xi-play-circle"></i>Í≤ÄÏß???™© ?∏Î? ?ïÎ≥¥</div>

                                <div class="row-box1">
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>Í≤Ä?âÌï≠Î™?/span></div>
                                        <div class="col-lg-1" id="all" data-sitebuilder="dxCheckBox"></div>
                                        <div class="col-lg-1" id="noInc" data-sitebuilder="dxCheckBox"></div>
                                        <div class="col-lg-1" id="basic" data-sitebuilder="dxCheckBox"></div>
                                        <div class="col-lg-1" id="A" data-sitebuilder="dxCheckBox"></div>
                                        <div class="col-lg-1" id="B" data-sitebuilder="dxCheckBox"></div>
                                        <div class="col-lg-1" id="C" data-sitebuilder="dxCheckBox"></div>
                                        <div class="col-lg-1" id="D" data-sitebuilder="dxCheckBox"></div>
                                        <div class="col-lg-1" id="E" data-sitebuilder="dxCheckBox"></div>
                                        <div class="col-lg-1" id="F" data-sitebuilder="dxCheckBox"></div>
                                        <div class="col-lg-1" id="add" data-sitebuilder="dxCheckBox"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="row-wrap logo-area-right btn-area-right">
                                <div class="row-box-title" style="visibility:hidden;"><i class="xi-play-circle"></i>
                                </div>
                                <div class="row-box1">
                                    <div class="row-box-inner1">
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
                        <!-- checkBox -->

                        <div class="row">
                            <div id="treeviewCheckupItemCodeEdit" data-sitebuilder="dxTreeList"></div>
                        </div>

                        <div class="row btn_area footer-btn">
                            <%--                            <div class="col-lg-1" id="confirmedCheck" data-sitebuilder="dxCheckBox"></div>--%>
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>?Ä??/div>
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">Î™©Î°ù</div>
                            <div class="col-lg-1" id="btnDelete" data-sitebuilder="dxButton">??†ú</div>
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
        sitebuilder.openMenu('contract-checkup');

        let inputOpenFile = $('#openFile');
        inputOpenFile.on('change', parseExcelContractCheckup);

        /** @param dxInstances : {btnCopy,btnExport,btnImport,treeviewCheckupItemCodeEdit,btnSave,btnList,btnDelete} */
        let dxInstances = sitebuilder.createDx(false);

        // dxInstances.btnCopy.option({
        //     text: 'Í≤ÄÏßÑÏú†?ïÎ≥µ??,
        // });

        // dxInstances.confirmedCheck.option({
        //     text: 'Í≤ÄÏß???™© ?ïÏù∏ ?îÏ≤≠',
        // });

        <%--dxInstances.btnReview.option({--%>
        <%--    text: 'Î¶¨Î∑∞ ?òÍ≤¨ Ï°∞Ìöå/?ëÏÑ±',--%>
        <%--    onClick: function () {--%>
        <%--        dxInstances.popupReview.show();--%>
        <%--    }--%>
        <%--});--%>
        <%--dxInstances.popupReview.option({--%>
        <%--    title: "Î¶¨Î∑∞ ?òÍ≤¨ Ï°∞Ìöå/?ëÏÑ±",--%>
        <%--    closeOnOutsideClick: true,--%>
        <%--    width: 1500,--%>
        <%--    height: 500,--%>
        <%--    contentTemplate: function (contentElement) {--%>
        <%--        contentElement.append('<div style="font-weight: bold; color: #2ea3aa">Î¶¨Î∑∞ ?òÍ≤¨ Ï°∞Ìöå</div>');--%>
        <%--        contentElement.append($("<div />").dxDataGrid({--%>
        <%--            editing: {--%>
        <%--                mode: "row",--%>
        <%--                allowAdding: true--%>
        <%--            },--%>
        <%--            onToolbarPreparing: function (e) {--%>
        <%--                e.toolbarOptions.visible = true;--%>
        <%--            },--%>
        <%--            pager: {--%>
        <%--                visible: true,--%>
        <%--                allowedPageSizes: 'all',--%>
        <%--                showPageSizeSelector: false,--%>
        <%--                showInfo: true,--%>
        <%--                showNavigationButtons: false--%>
        <%--            },--%>
        <%--            paging: {--%>
        <%--                enabled: false--%>
        <%--            },--%>
        <%--            rowAlternationEnabled: true,--%>
        <%--            scrolling: {columnRenderingMode: "virtual"},--%>
        <%--            dataSource: popupList,--%>
        <%--            columns: [{--%>
        <%--                caption: "?úÎ≤à",--%>
        <%--                alignment: 'center',--%>
        <%--                allowEditing: false,--%>
        <%--                width: 80,--%>
        <%--                cellTemplate: function (cellElement, cellInfo) {--%>
        <%--                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);--%>
        <%--                },--%>
        <%--            }, {--%>
        <%--                dataField: "registeredUserName",--%>
        <%--                caption: "??™© ?±Î°ù??,--%>
        <%--                alignment: 'center',--%>
        <%--                allowEditing: false,--%>
        <%--                width: 100,--%>
        <%--            }, {--%>
        <%--                dataField: "writedUserName",--%>
        <%--                caption: "?ëÏÑ±??,--%>
        <%--                alignment: 'center',--%>
        <%--                allowEditing: false,--%>
        <%--                width: 100,--%>
        <%--            }, {--%>
        <%--                dataField: "writedAt",--%>
        <%--                caption: "?ëÏÑ±?ºÏûê",--%>
        <%--                alignment: 'center',--%>
        <%--                dataType: "date",--%>
        <%--                allowEditing: false,--%>
        <%--                width: 100,--%>
        <%--            }, {--%>
        <%--                dataField: "review",--%>
        <%--                caption: "?òÍ≤¨",--%>
        <%--                alignment: 'center',--%>
        <%--            }],--%>
        <%--            onSaving: function (e) {--%>
        <%--                let data = {};--%>
        <%--                data.review = e.changes[0].data.review--%>
        <%--                data.checkupContractSubTypeId = dsList[0].checkupContractSubTypeId;--%>
        <%--                $.ajax({--%>
        <%--                    url: '<c:url value="/pm/contract-review"/>',--%>
        <%--                    method: 'POST',--%>
        <%--                    data: JSON.stringify(data),--%>
        <%--                }).then(function () {--%>
        <%--                    sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");--%>
        <%--                });--%>
        <%--                dxInstances.popupReview.hide();--%>
        <%--            },--%>
        <%--        }));--%>
        <%--        return contentElement;--%>
        <%--    },--%>
        <%--});--%>

        dxInstances.btnExport.option({
            text: 'Excel ?òÌîå ?§Ïö¥Î°úÎìú',
            onClick: function () {
                exportExcelContractCheckup();
            },
        });

        dxInstances.btnImport.option({
            text: 'Í≤ÄÏßÑÏú†??Excel ?±Î°ù',
            onClick: function () {
                if (!dxInstances.subTypeName.option('value')) {
                    alert('?∏Î? ?†ÌòïÎ™ÖÏùÑ ?ÖÎ†•?òÏÑ∏??);
                    return;
                }
                inputOpenFile.trigger("click");
            },
        });

        dxInstances.hospitalCenterName.option({readOnly: true,});
        dxInstances.companyNameYear.option({readOnly: true,});

        dxInstances.checkupContractTypeId.option({
            readOnly: true,
            displayExpr: function (item) {
                return item && item.companyCheckupTypeCode + '. ' + item.companyCheckupTypeName;
            },
            valueExpr: 'checkupContractTypeId',
            onValueChanged: function (e) {
                let checkupType = this.getDataSource().items().find(function (v) {
                    return v.checkupContractTypeId === e.value;
                });

                if (checkupType) {
                    dxInstances['checkupContractTypes.hospitalPay'].option({value: checkupType.hospitalPay,});
                }
            },
        });

        dxInstances['checkupContractTypes.hospitalPay'].option({readOnly: true,});

        dxInstances.all.option({
            text: '?ÑÏ≤¥',
            value: true,
            readOnly: false,
            onValueChanged: function (data) {
                if (data.event) {
                    dxInstances.noInc.option('value', data.value);
                    dxInstances.basic.option('value', data.value);
                    dxInstances.A.option('value', data.value);
                    dxInstances.B.option('value', data.value);
                    dxInstances.C.option('value', data.value);
                    dxInstances.D.option('value', data.value);
                    dxInstances.E.option('value', data.value);
                    dxInstances.F.option('value', data.value);
                    dxInstances.add.option('value', data.value);

                    if (data.value) {
                        dxInstances.treeviewCheckupItemCodeEdit.clearFilter();
                    } else {
                        search(data);
                    }
                }
            }
        });

        dxInstances.noInc.option({
            text: 'ÎØ∏Ìè¨??,
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.basic.option({
            text: 'Í∏∞Î≥∏??™©',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.A.option({
            text: '?†ÌÉùA',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.B.option({
            text: '?†ÌÉùB',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.C.option({
            text: '?†ÌÉùC',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.D.option({
            text: '?†ÌÉùD',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.E.option({
            text: '?†ÌÉùE',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.F.option({
            text: '?†ÌÉùF',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.add.option({
            text: 'Ï∂îÍ?Í≤Ä??,
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
            valueChangeEvent: "keyup",
            readOnly: false,
            onValueChanged: function (e) {
                dxInstances.treeviewCheckupItemCodeEdit.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.treeviewCheckupItemCodeEdit.option({
            parentIdExpr: 'keyParentId',
            keyExpr: 'keyId',
            autoExpandAll: true,
            editing: {
                mode: "batch",
                allowAdding: false,
                allowUpdating: true,
                allowDeleting: false,
                startEditAction: "click"
            },
            searchPanel: {visible: false},
            columns: [{
                caption: '?ÄÎ∂ÑÎ•ò',
                dataField: 'code',
                allowEditing: false,
            }, {
                caption: 'Ï§ëÎ∂ÑÎ•?,
                dataField: 'name',
                allowEditing: false,
            }, {
                caption: '?±Î°ù',
                dataField: 'register',
                alignment: 'center',
                lookup: {
                    dataSource: sitebuilder.typeDef.registerType,
                    displayExpr: 'text',
                    valueExpr: 'id'
                },
                setCellValue(rowData, value) {
                    rowData.register = value;

                    if (value) {
                        dxInstances.searchGrid.option({value: ''});
                    }
                },
            }, {
                caption: '?òÎÇ©ÎπÑÏö©',
                dataField: 'copay',
                alignment: 'right',
            }, {
                caption: '??™© Î©îÎ™®',
                dataField: 'checkupContractItemMemo',
            }, {
                caption: 'Î≥ëÏõê Í∏∞Ï??òÍ?',
                dataField: 'bill',
                allowEditing: false,
                alignment: 'right',
            }, {
                caption: 'Í∏∞ÏóÖÏ≤??†Ïù∏?òÍ?',
                dataField: 'discountBill',
                alignment: 'right',
            }],
            onEditorPreparing: function (e) {
                if (e.parentType === 'dataRow' && (e.dataField === 'checkupContractItemMemo'
                    || e.dataField === 'register'
                    || e.dataField === 'copay'
                    || e.dataField === 'bill'
                    || e.dataField === 'discountBill')) {
                    e.editorOptions.disabled = e.row.data && e.row.data.itemType !== 'item';
                }
            },
            onEditorPrepared: function (e) {
                if (e.dataField === 'register') {
                    e.editorElement.dxSelectBox('instance').option({
                        onValueChanged: function (data) {
                            e.setValue(data.value);
                            search(data);
                        },
                    });
                }
            },
            onToolbarPreparing: function (e) {
                // Modifies an existing item
                e.toolbarOptions.visible = false;

                let toolbarItems = e.toolbarOptions.items;

                toolbarItems.forEach(function (item) {
                    if (item.name === "saveButton") {
                        item.visible = false;
                    }

                    if (item.name === "addRowButton") {
                        item.visible = false;
                    }
                });
            },
        });

        dxInstances.btnList.option({
            text: 'Î™©Î°ù',
            onClick: function () {
                location.href = '<c:url value="/pm/contract-checkup"/>';
            }
        });

        dxInstances.btnSave.option({
            text: '?Ä??,
            type: 'success',
            stylingMode: 'contained',
            onClick: function () {
                let data = sitebuilder.dxToValues();

                if (!data.subTypeName) {
                    alert('?∏Î? ?†ÌòïÎ™ÖÏùÑ ?ÖÎ†•?òÏÑ∏??);
                    return;
                }

                let gridData = dxInstances.treeviewCheckupItemCodeEdit.option('editing.changes').map(function (v) {
                    v.data._crudType = 'INSERT';
                    v.data.id = v.key;

                    let rowData = dxInstances.treeviewCheckupItemCodeEdit.getNodeByKey(v.key).data;
                    v.data = $.extend(true, {}, rowData, v.data);

                    if (!v.data.register) {
                        v.data.register = '0';
                    }

                    return v.data;
                });

                data._crudType = 'UPDATE';
                data.checkupContractTypes = null;
                data.checkupContractItems = gridData;

                delete data.checkupContractReviews;
                // console.log(data)

                let ajaxCheckupSave = $.ajax({
                    url: '<c:url value="/pm/contract-checkup"/>',
                    method: 'POST',
                    data: JSON.stringify(data),
                });

                $.when(ajaxCheckupSave).then(function () {
                    sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");
                    //location.reload();
                    <%--location.href = '<c:url value="/pm/contract-checkup"/>';--%>
                });
            }
        });

        dxInstances.btnDelete.option({
            stylingMode: "contained",
            text: "??†ú",
            type: "danger",
            onClick: function () {
                if (confirm('?ïÎßêÎ°???†ú?òÏãúÍ≤†Ïäµ?àÍπå?')) {
                    $.ajax({
                        url: '<c:url value="/pm/contract-checkup/${checkupContractSubTypeId}"/>',
                        method: 'DELETE',
                    }).then(function () {
                        location.href = '<c:url value="/pm/contract-checkup"/>';
                    });
                }
            }
        });

        function exportExcelContractCheckup() {
            let workbook = new ExcelJS.Workbook();
            let worksheet = workbook.addWorksheet('Sheet1');

            worksheet.getColumn(1).width = 20;
            worksheet.getColumn(2).width = 25;
            worksheet.getColumn(3).width = 50;
            worksheet.getColumn(4).width = 15;
            worksheet.getColumn(5).width = 15;
            worksheet.getColumn(6).width = 15;
            worksheet.getColumn(7).width = 15;
            worksheet.getColumn(8).width = 20;
            worksheet.getColumn(9).width = 25;
            worksheet.getColumn(10).width = 10;
            worksheet.getColumn(11).width = 15;
            worksheet.getColumn(12).width = 15;
            worksheet.getColumn(13).width = 50;

            worksheet.getRow(2).height = 70;

            worksheet.mergeCells('A1:A2');
            worksheet.getCell('A1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('A1').value = '?ÄÎ∂ÑÎ•òÎ™?;
            worksheet.getCell('A1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('A1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('B1:B2');
            worksheet.getCell('B1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('B1').value = 'Ï§ëÎ∂ÑÎ•òÎ™Ö';
            worksheet.getCell('B1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('B1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('C1:C2');
            worksheet.getCell('C1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('C1').value = '?åÎ∂ÑÎ•?;
            worksheet.getCell('C1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('C1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('D1:D2');
            worksheet.getCell('D1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('D1').value = '?åÎ∂ÑÎ•òÏïÑ?¥Îîî';
            worksheet.getCell('D1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('D1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('E1:E2');
            worksheet.getCell('E1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('E1').value = '?åÎ∂ÑÎ•òÏΩî??;
            worksheet.getCell('E1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('E1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.getCell('F1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('F1').value = '?¨Ìï®?¨Î?';
            worksheet.getCell('F1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('F1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};
            worksheet.getCell('F2').alignment = {vertical: 'middle', horizontal: 'left', wrapText: true};
            worksheet.getCell('F2').value = '?∂Î??¨Ìï®:0\n?∂Í∏∞Î≥∏Ìï≠Î™?1\n?∂Ï∂îÍ∞Ä??™©:2\n?∂ÏÑ†?ùÍ???A~F';
            worksheet.getCell('F2').font = {color: {argb: 'FF000000'},};
            worksheet.getCell('F2').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FFAEAAAA'}};

            worksheet.getCell('G1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('G1').value = '?òÎÇ©ÎπÑÏö©';
            worksheet.getCell('G1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('G1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};
            worksheet.getCell('G2').alignment = {vertical: 'middle', horizontal: 'left'};
            worksheet.getCell('G2').value = '(?´ÏûêÎ°??úÏãú)';
            worksheet.getCell('G2').font = {color: {argb: 'FF000000'},};
            worksheet.getCell('G2').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FFAEAAAA'}};

            worksheet.getCell('H1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('H1').value = '??™© Î©îÎ™®';
            worksheet.getCell('H1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('H1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};
            worksheet.getCell('H2').alignment = {vertical: 'middle', horizontal: 'left'};
            worksheet.getCell('H2').value = '';
            worksheet.getCell('H2').font = {color: {argb: 'FF000000'},};
            worksheet.getCell('H2').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FFAEAAAA'}};

            worksheet.getCell('I1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('I1').value = 'Ï∂îÍ?Í≤Ä??Í∏∞ÏóÖÏ≤??†Ïù∏?òÍ?';
            worksheet.getCell('I1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('I1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};
            worksheet.getCell('I2').alignment = {vertical: 'middle', horizontal: 'left'};
            worksheet.getCell('I2').value = '(?´ÏûêÎ°??úÏãú)';
            worksheet.getCell('I2').font = {color: {argb: 'FF000000'},};
            worksheet.getCell('I2').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FFAEAAAA'}};

            worksheet.mergeCells('K1:K2');
            worksheet.getCell('K1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('K1').value = '?†ÌÉù??™©';
            worksheet.getCell('K1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('K1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('L1:L2');
            worksheet.getCell('L1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('L1').value = 'Í∞úÏàò';
            worksheet.getCell('L1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('L1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('M1:M2');
            worksheet.getCell('M1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('M1').value = 'Î©îÎ™®';
            worksheet.getCell('M1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('M1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            let rootNode = dxInstances.treeviewCheckupItemCodeEdit.getRootNode();
            let itemList = rootNode.children.reduce(function f(acc, v) {
                if (v.data.itemType === 'item') {
                    acc.push(v);
                } else if (v.children.length > 0) {
                    v.children.reduce(f, acc);
                }

                return acc;
            }, []);

            let itemData;
            for (let idxItem in itemList) {
                itemData = [];
                itemData[1] = itemList[idxItem].parent.parent.data.name;
                itemData[2] = itemList[idxItem].parent.data.name;
                itemData[3] = itemList[idxItem].data.name;
                itemData[4] = itemList[idxItem].data.keyId;
                itemData[5] = itemList[idxItem].data.code;

                switch (itemList[idxItem].data.register) {
                    case '0' :
                        itemData[6] = '';
                        break;
                    case '1' :
                        itemData[6] = '1';
                        break;
                    case '2' :
                        itemData[6] = '2';
                        break;
                    case 'A' :
                        itemData[6] = 'A';
                        break;
                    case 'B' :
                        itemData[6] = 'B';
                        break;
                    case 'C' :
                        itemData[6] = 'C';
                        break;
                    case 'D' :
                        itemData[6] = 'D';
                        break;
                    case 'E' :
                        itemData[6] = 'E';
                        break;
                    case 'F' :
                        itemData[6] = 'F';
                        break;
                    default :
                        itemData[6] = '';
                        break;
                }

                itemData[7] = itemList[idxItem].data.copay;
                itemData[8] = itemList[idxItem].data.checkupContractItemMemo;
                itemData[9] = itemList[idxItem].data.discountBill;

                worksheet.addRow(itemData);
            }
            worksheet.getCell('K3').value = '?†ÌÉùA';
            worksheet.getCell('K4').value = '?†ÌÉùB';
            worksheet.getCell('K5').value = '?†ÌÉùC';
            worksheet.getCell('K6').value = '?†ÌÉùD';
            worksheet.getCell('K7').value = '?†ÌÉùE';
            worksheet.getCell('K8').value = '?†ÌÉùF';

            worksheet.getCell('L3').value = dxInstances.selectACount.option('value');
            worksheet.getCell('L4').value = dxInstances.selectBCount.option('value');
            worksheet.getCell('L5').value = dxInstances.selectCCount.option('value');
            worksheet.getCell('L6').value = dxInstances.selectDCount.option('value');
            worksheet.getCell('L7').value = dxInstances.selectECount.option('value');
            worksheet.getCell('L8').value = dxInstances.selectFCount.option('value');

            worksheet.getCell('M3').value = dxInstances.selectAMemo.option('value');
            worksheet.getCell('M4').value = dxInstances.selectBMemo.option('value');
            worksheet.getCell('M5').value = dxInstances.selectCMemo.option('value');
            worksheet.getCell('M6').value = dxInstances.selectDMemo.option('value');
            worksheet.getCell('M7').value = dxInstances.selectEMemo.option('value');
            worksheet.getCell('M8').value = dxInstances.selectFMemo.option('value');

            workbook.xlsx.writeBuffer().then(function (buffer) {
                saveAs(new Blob([buffer], {type: 'application/octet-stream'}), 'export.xlsx');
            });
        }

        function parseExcelContractCheckup() {
            let files = this.files || [];
            if (!files.length) return;

            let file = files[0];
            let reader = new FileReader();

            let excelDataSet = [];

            reader.onloadend = function () {
                let arrayBuffer = reader.result;
                let workbook = new ExcelJS.Workbook();

                workbook.xlsx.load(arrayBuffer).then(function (workbook) {
                        let sheet = workbook.worksheets[0];
                        let rowCount = sheet.rowCount;

                        for (let rowNumber = 1; rowNumber <= rowCount; rowNumber++) {
                            let row = sheet.getRow(rowNumber);

                            if (rowNumber < 3) {
                                continue;
                            }

                            // Îπ??Ä??ÎßåÎÇòÎ©?Ï§ëÎã®
                            if (!row.getCell(1).value || !row.getCell(2).value || !row.getCell(3).value || !row.getCell(4).value || !row.getCell(5).value) {
                                // Check Key Field
                                break;
                            }

                            let resultRow = {};

                            // Key
                            resultRow._crudType = 'INSERT';
                            resultRow.id = parseInt(row.getCell(4).value);
                            if (row.getCell(6).value === 0 || row.getCell(6).value === '0' || row.getCell(6).value === '' || row.getCell(6).value === undefined || row.getCell(6).value === null) {
                                resultRow.register = '0';
                                // continue;
                            } else {
                                resultRow.register = String(row.getCell(6).value);
                            }
                            resultRow.copay = row.getCell(7).value;
                            resultRow.checkupContractItemMemo = row.getCell(8).value;
                            resultRow.discountBill = row.getCell(9).value;

                            excelDataSet.push(resultRow);
                        }

                    dxInstances.selectACount.option('value', sheet.getCell('L3').value);
                    dxInstances.selectBCount.option('value', sheet.getCell('L4').value);
                    dxInstances.selectCCount.option('value', sheet.getCell('L5').value);
                    dxInstances.selectDCount.option('value', sheet.getCell('L6').value);
                    dxInstances.selectECount.option('value', sheet.getCell('L7').value);
                    dxInstances.selectFCount.option('value', sheet.getCell('L8').value);

                    dxInstances.selectAMemo.option('value', sheet.getCell('M3').value);
                    dxInstances.selectBMemo.option('value', sheet.getCell('M4').value);
                    dxInstances.selectCMemo.option('value', sheet.getCell('M5').value);
                    dxInstances.selectDMemo.option('value', sheet.getCell('M6').value);
                    dxInstances.selectEMemo.option('value', sheet.getCell('M7').value);
                    dxInstances.selectFMemo.option('value', sheet.getCell('M8').value);

                    let data = sitebuilder.dxToValues();

                    data._crudType = 'UPDATE';
                    data.checkupContractTypes = null;
                    data.checkupContractItems = excelDataSet;
                    // if (dxInstances.confirmedCheck.option('value') === null) {
                    //     dxInstances.confirmedCheck.option({
                    //         value: false
                    //     });
                    // }
                    // data.confirmedCheck = dxInstances.confirmedCheck.option('value');

                    delete data.checkupContractReviews;
                    // console.log(data);

                    let ajaxCheckupSave = $.ajax({
                        url: '<c:url value="/pm/contract-checkup"/>',
                            method: 'POST',
                            data: JSON.stringify(data),
                        });

                        $.when(ajaxCheckupSave).then(function () {
                            sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");
                            <%--location.href = '<c:url value="/pm/contract-checkup"/>';--%>
                            location.reload();
                        });
                    }
                );
            };

            reader.readAsArrayBuffer(file);

            inputOpenFile.val('');
        }

        function search(data) {
            if (!data.event) {
                return;
            }

            let filters = [];
            filters.push(['register', "=", '']);

            if (dxInstances.noInc.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeEdit, 'register', 'keyId'), "=", '0']);
            }

            if (dxInstances.basic.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeEdit, 'register', 'keyId'), "=", '1']);
            }

            if (dxInstances.A.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeEdit, 'register', 'keyId'), "=", 'A']);
            }
            if (dxInstances.B.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeEdit, 'register', 'keyId'), "=", 'B']);
            }
            if (dxInstances.C.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeEdit, 'register', 'keyId'), "=", 'C']);
            }
            if (dxInstances.D.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeEdit, 'register', 'keyId'), "=", 'D']);
            }
            if (dxInstances.E.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeEdit, 'register', 'keyId'), "=", 'E']);
            }
            if (dxInstances.F.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeEdit, 'register', 'keyId'), "=", 'F']);
            }
            if (dxInstances.add.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeEdit, 'register', 'keyId'), "=", '2']);
            }

            if (filters.length === 19) {
                dxInstances.all.option('value', true);
                dxInstances.treeviewCheckupItemCodeEdit.clearFilter();
            } else {
                dxInstances.all.option('value', false);
                dxInstances.treeviewCheckupItemCodeEdit.filter(filters);
            }
        }

        function unSavedData(dataGrid, columnName, keyName) {
            return function (data) {
                let unsavedItem = dataGrid.option('editing.changes').find(function (v) {
                    return v.key === data[keyName] && v.data[columnName] !== undefined;
                });

                if (unsavedItem) {
                    return unsavedItem.data[columnName];
                } else {
                    return data[columnName];
                }
            };
        }

        // Load
        let ajaxCheckupContract = $.ajax({
            url: '<c:url value="/pm/contract-checkup/${checkupContractSubTypeId}"/>',
            method: 'GET',
        });
        let popupList;
        let dsList;

        $.when(ajaxCheckupContract).then(function (response) {
            // console.log(response.data);

            dsList = response.data.checkupContractReviews;
            if (response.data.checkupContractReviews[0].checkupContractReviewId) {
                popupList = response.data.checkupContractReviews;
            } else {
                popupList = {};
            }

            dxInstances.checkupContractTypeId.option({
                dataSource: response.data.checkupContractTypes,
            });

            dxInstances.treeviewCheckupItemCodeEdit.option({
                dataSource: response.data.checkupContractItems,
            });

            let checkupContractTypeIdLoad = dxInstances.checkupContractTypeId.getDataSource().load();
            let treeviewCheckupItemCodeEditLoad = dxInstances.treeviewCheckupItemCodeEdit.getDataSource().load();

            $.when(checkupContractTypeIdLoad, treeviewCheckupItemCodeEditLoad).then(function () {
                sitebuilder.valuesToDx(response.data);
            });
        });
    });

</script>
</html>
