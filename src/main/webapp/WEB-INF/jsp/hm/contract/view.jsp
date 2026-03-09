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
                            <h3 class="h3">寃吏??좏삎 ?곸꽭</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- 寃吏??좏삎 ?몃? ?뺣낫 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>寃吏??좏삎 ?몃? ?뺣낫</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>蹂묒썝紐?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="hospitalCenterName" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>湲곗뾽泥대챸</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="companyNameYear" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>寃吏꾩쑀??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="checkupContractTypeId"
                                                 data-sitebuilder="dxSelectBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?몃??좏삎紐?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="subTypeName" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>蹂묒썝泥?뎄??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="checkupContractTypes.hospitalPay"
                                                 data-sitebuilder="dxNumberBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?낃렇?덉씠?쒗삎</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="upgradePay" data-sitebuilder="dxNumberBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 寃吏??좏삎 ?몃? ?뺣낫 -->

                        <!-- ?좏깮 寃吏??몃? ?뺣낫 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>?좏깮 寃吏??몃? ?뺣낫
                                <div class="right button-box">
                                    <div class="btnExcelDown" id="btnSampleDown" data-sitebuilder="dxButton"></div>
                                </div>


                            </div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name border-right"><span>?좏깮寃吏?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 tag-name border-right"><span>媛쒖닔</span></div>
                                            <div class="col-lg-10 tag-name"><span>硫붾え</span></div>
                                            <%--                                            <div class="col-lg-2 center" id="text_1" data-sitebuilder="dxTextBox"></div>--%>
                                            <%--                                            <div class="col-lg-10 center" id="text_2" data-sitebuilder="dxTextBox"></div>--%>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name border-right"><span>?좏깮寃吏?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 tag-name border-right"><span>媛쒖닔</span></div>
                                            <div class="col-lg-10 tag-name"><span>硫붾え</span></div>
                                            <%--                                            <div class="col-lg-2 center" id="text_3" data-sitebuilder="dxTextBox"></div>--%>
                                            <%--                                            <div class="col-lg-10 center" id="text_4" data-sitebuilder="dxTextBox"></div>--%>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?좏깮A</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectACount"
                                                 data-sitebuilder="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectAMemo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?좏깮D</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectDCount"
                                                 data-sitebuilder="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectDMemo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?좏깮B</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectBCount"
                                                 data-sitebuilder="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectBMemo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?좏깮E</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectECount"
                                                 data-sitebuilder="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectEMemo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?좏깮C</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectCCount"
                                                 data-sitebuilder="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectCMemo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?좏깮F</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectFCount"
                                                 data-sitebuilder="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectFMemo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ?좏깮 寃吏??몃? ?뺣낫 -->

                        <%--<div class="row">
                            <div class="col-lg-4">媛쒕퀎?깅줉 (?깅줉?⑦궎吏 誘몃━蹂닿린)</div>
                        </div>--%>

                        <!-- checkBox -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap logo-area-left">
                                <div class="row-box-title"><i class="xi-play-circle"></i>寃吏???ぉ ?몃? ?뺣낫</div>

                                <div class="row-box1">
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>寃?됲빆紐?/span></div>
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
                            <div id="treeviewCheckupItemCodeView" data-sitebuilder="dxTreeList"></div>
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnEdit" data-sitebuilder="dxButton"><i class="xi-file-check"></i>?섏젙
                            </div>
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">紐⑸줉</div>
                            <div class="col-lg-1" id="btnDelete" data-sitebuilder="dxButton">??젣</div>
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

        /** @param dxInstances : {btnExport,treeviewCheckupItemCodeView,btnEdit,btnList,btnDelete} */
        let dxInstances = sitebuilder.createDx(true);

        dxInstances.btnSampleDown.option({
            text: 'EXCEL ?ㅼ슫濡쒕뱶',
            onClick: function () {
                exportExcelContractCheckup();
            }
        });

        dxInstances.hospitalCenterName.option({readOnly: true,});
        dxInstances.companyNameYear.option({readOnly: true,});

        dxInstances.checkupContractTypeId.option({
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
        dxInstances.upgradePay.option({readOnly: true,});

        dxInstances.all.option({
            text: '?꾩껜',
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
                        dxInstances.treeviewCheckupItemCodeView.clearFilter();
                    } else {
                        search(data);
                    }
                }
            }
        });

        dxInstances.noInc.option({
            text: '誘명룷??,
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.basic.option({
            text: '湲곕낯??ぉ',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.A.option({
            text: '?좏깮A',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.B.option({
            text: '?좏깮B',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.C.option({
            text: '?좏깮C',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.D.option({
            text: '?좏깮D',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.E.option({
            text: '?좏깮E',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.F.option({
            text: '?좏깮F',
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.add.option({
            text: '異붽?寃??,
            value: true,
            readOnly: false,
            onValueChanged: search,
        });

        dxInstances.searchGrid.option({
            placeholder: '寃??,
            valueChangeEvent: "keyup",
            readOnly: false,
            onValueChanged: function (e) {
                dxInstances.treeviewCheckupItemCodeView.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.treeviewCheckupItemCodeView.option({
            parentIdExpr: 'keyParentId',
            keyExpr: 'keyId',
            editing: {
                mode: "batch",
                allowAdding: false,
                allowUpdating: false,
                allowDeleting: false,
                startEditAction: "click"
            },
            searchPanel: {visible: false},
            columns: [{
                caption: '?遺꾨쪟',
                dataField: 'code',
                allowEditing: false,
            }, {
                caption: '以묐텇瑜?,
                dataField: 'name',
                allowEditing: false,
            }, {
                caption: '?깅줉',
                dataField: 'register',
                lookup: {
                    dataSource: sitebuilder.typeDef.registerType,
                    displayExpr: 'text',
                    valueExpr: 'id'
                }
            }, {
                caption: '?섎궔鍮꾩슜',
                dataField: 'copay',
            }, {
                caption: '??ぉ 硫붾え',
                dataField: 'checkupContractItemMemo',
            }, {
                caption: '蹂묒썝 湲곗??섍?',
                dataField: 'bill',
                allowEditing: false,
            }, {
                caption: '湲곗뾽泥??좎씤?섍?',
                dataField: 'discountBill',
            }],
            onToolbarPreparing: function (e) {
                // Modifies an existing item
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

        dxInstances.btnEdit.option({
            stylingMode: 'contained',
            text: '?섏젙',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/hm/contract-checkup/${checkupContractSubTypeId}/edit"/>';
            }
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '紐⑸줉',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/hm/contract-checkup"/>';
            }
        });

        dxInstances.btnDelete.option({
            stylingMode: "contained",
            text: "??젣",
            type: "danger",
            onClick: function () {
                if (confirm('?뺣쭚濡???젣?섏떆寃좎뒿?덇퉴?')) {
                    $.ajax({
                        url: '<c:url value="/hm/contract-checkup/${checkupContractSubTypeId}"/>',
                        method: 'DELETE',
                    }).then(function () {
                        location.href = '<c:url value="/hm/contract-checkup"/>';
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
            worksheet.getColumn(8).width = 15;
            worksheet.getColumn(9).width = 10;
            worksheet.getColumn(10).width = 15;
            worksheet.getColumn(11).width = 15;
            worksheet.getColumn(12).width = 50;

            worksheet.getRow(2).height = 70;

            worksheet.mergeCells('A1:A2');
            worksheet.getCell('A1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('A1').value = '?遺꾨쪟紐?;
            worksheet.getCell('A1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('A1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('B1:B2');
            worksheet.getCell('B1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('B1').value = '以묐텇瑜섎챸';
            worksheet.getCell('B1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('B1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('C1:C2');
            worksheet.getCell('C1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('C1').value = '?뚮텇瑜?;
            worksheet.getCell('C1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('C1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('D1:D2');
            worksheet.getCell('D1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('D1').value = '?뚮텇瑜섏븘?대뵒';
            worksheet.getCell('D1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('D1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('E1:E2');
            worksheet.getCell('E1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('E1').value = '?뚮텇瑜섏퐫??;
            worksheet.getCell('E1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('E1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.getCell('F1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('F1').value = '?ы븿?щ?';
            worksheet.getCell('F1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('F1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};
            worksheet.getCell('F2').alignment = {vertical: 'middle', horizontal: 'left', wrapText: true};
            worksheet.getCell('F2').value = '?띕??ы븿:0\n?띔린蹂명빆紐?1\n?띠텛媛??ぉ:2\n?띠꽑?앷???A~F';
            worksheet.getCell('F2').font = {color: {argb: 'FF000000'},};
            worksheet.getCell('F2').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FFAEAAAA'}};

            worksheet.getCell('G1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('G1').value = '?섎궔鍮꾩슜';
            worksheet.getCell('G1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('G1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};
            worksheet.getCell('G2').alignment = {vertical: 'middle', horizontal: 'left'};
            worksheet.getCell('G2').value = '(?レ옄濡??쒖떆)';
            worksheet.getCell('G2').font = {color: {argb: 'FF000000'},};
            worksheet.getCell('G2').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FFAEAAAA'}};

            worksheet.getCell('H1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('H1').value = '異붽?寃??湲곗뾽泥??좎씤?섍?';
            worksheet.getCell('H1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('H1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};
            worksheet.getCell('H2').alignment = {vertical: 'middle', horizontal: 'left'};
            worksheet.getCell('H2').value = '(?レ옄濡??쒖떆)';
            worksheet.getCell('H2').font = {color: {argb: 'FF000000'},};
            worksheet.getCell('H2').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FFAEAAAA'}};

            worksheet.mergeCells('J1:J2');
            worksheet.getCell('J1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('J1').value = '?좏깮??ぉ';
            worksheet.getCell('J1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('J1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('K1:K2');
            worksheet.getCell('K1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('K1').value = '媛쒖닔';
            worksheet.getCell('K1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('K1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('L1:L2');
            worksheet.getCell('L1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('L1').value = '硫붾え';
            worksheet.getCell('L1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('L1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            let rootNode = dxInstances.treeviewCheckupItemCodeView.getRootNode();
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
                itemData[8] = itemList[idxItem].data.discountBill;

                worksheet.addRow(itemData);
            }

            worksheet.getCell('J3').value = '?좏깮A';
            worksheet.getCell('J4').value = '?좏깮B';
            worksheet.getCell('J5').value = '?좏깮C';
            worksheet.getCell('J6').value = '?좏깮D';
            worksheet.getCell('J7').value = '?좏깮E';
            worksheet.getCell('J8').value = '?좏깮F';

            worksheet.getCell('K3').value = dxInstances.selectACount.option('value');
            worksheet.getCell('K4').value = dxInstances.selectBCount.option('value');
            worksheet.getCell('K5').value = dxInstances.selectCCount.option('value');
            worksheet.getCell('K6').value = dxInstances.selectDCount.option('value');
            worksheet.getCell('K7').value = dxInstances.selectECount.option('value');
            worksheet.getCell('K8').value = dxInstances.selectFCount.option('value');

            worksheet.getCell('L3').value = dxInstances.selectAMemo.option('value');
            worksheet.getCell('L4').value = dxInstances.selectBMemo.option('value');
            worksheet.getCell('L5').value = dxInstances.selectCMemo.option('value');
            worksheet.getCell('L6').value = dxInstances.selectDMemo.option('value');
            worksheet.getCell('L7').value = dxInstances.selectEMemo.option('value');
            worksheet.getCell('L8').value = dxInstances.selectFMemo.option('value');

            workbook.xlsx.writeBuffer().then(function (buffer) {
                saveAs(new Blob([buffer], {type: 'application/octet-stream'}), 'export.xlsx');
            });
        }

        function search(data) {
            if (!data.event) {
                return;
            }

            let filters = [];
            filters.push(['register', '=', '']);

            if (dxInstances.noInc.option('value')) {
                filters.push('or');
                filters.push(['register', '=', '0']);
            }

            if (dxInstances.basic.option('value')) {
                filters.push('or');
                filters.push(['register', '=', '1']);
            }

            if (dxInstances.A.option('value')) {
                filters.push('or');
                filters.push(['register', '=', 'A']);
            }
            if (dxInstances.B.option('value')) {
                filters.push('or');
                filters.push(['register', '=', 'B']);
            }
            if (dxInstances.C.option('value')) {
                filters.push('or');
                filters.push(['register', '=', 'C']);
            }
            if (dxInstances.D.option('value')) {
                filters.push('or');
                filters.push(['register', '=', 'D']);
            }
            if (dxInstances.E.option('value')) {
                filters.push('or');
                filters.push(['register', '=', 'E']);
            }
            if (dxInstances.F.option('value')) {
                filters.push('or');
                filters.push(['register', '=', 'F']);
            }
            if (dxInstances.add.option('value')) {
                filters.push('or');
                filters.push(['register', '=', '2']);
            }

            if (filters.length === 19) {
                dxInstances.all.option('value', true);
                dxInstances.treeviewCheckupItemCodeView.clearFilter();
            } else {
                dxInstances.all.option('value', false);
                dxInstances.treeviewCheckupItemCodeView.filter(filters);
            }
        }

        // Load
        let ajaxCheckupContract = $.ajax({
            url: '<c:url value="/hm/contract-checkup/${checkupContractSubTypeId}"/>',
            method: 'GET',
        });

        $.when(ajaxCheckupContract).then(function (response) {
            console.log(response.data);

            dxInstances.checkupContractTypeId.option({
                dataSource: response.data.checkupContractTypes,
            });

            dxInstances.treeviewCheckupItemCodeView.option({
                dataSource: response.data.checkupContractItems,
            });

            let checkupContractTypeIdLoad = dxInstances.checkupContractTypeId.getDataSource().load();
            let treeviewCheckupItemCodeViewLoad = dxInstances.treeviewCheckupItemCodeView.getDataSource().load();

            $.when(checkupContractTypeIdLoad, treeviewCheckupItemCodeViewLoad).then(function () {
                sitebuilder.valuesToDx(response.data);
            });
        });
    });

</script>
</html>
