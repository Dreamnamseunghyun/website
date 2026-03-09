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
                            <h3 class="h3">검진 유형 등록</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- 검진 유형 세부 정보 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>검진 유형 세부 정보
<%--                                <div class="btnCheckup right" id="btnCopy" data-ggsj="dxButton"></div>--%>
                            </div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>병원명</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="hospitalCenterName" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>기업체명</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="companyNameYear" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>검진유형</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="checkupContractTypeId"
                                                 data-ggsj="dxSelectBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>세부유형명</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="subTypeName" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>병원청구액</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="checkupContractTypes.hospitalPay"
                                                 data-ggsj="dxNumberBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>업그레이드형</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="upgradePay" data-ggsj="dxNumberBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 검진 유형 세부 정보 -->

                        <!-- 선택 검진 세부 정보 -->
                        <div class="row-wrap">
                            <div class="row-box-title">
                                <i class="xi-play-circle"></i>선택 검진 세부 정보
                                <div class="right button-box">
                                    <div class="btnExcelImport" id="btnImport" data-ggsj="dxButton"></div>
                                    <div class="btnExcelDown" id="btnSampleDown" data-ggsj="dxButton"></div>
                                </div>

                                <input style="display: none" id="openFile" type="file">
                            </div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name border-right"><span>선택검진</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 tag-name border-right"><span>개수</span></div>
                                            <div class="col-lg-10 tag-name"><span>메모</span></div>
                                            <%--                                            <div class="col-lg-2 center" id="text_1" data-ggsj="dxTextBox"></div>--%>
                                            <%--                                            <div class="col-lg-10 center" id="text_2" data-ggsj="dxTextBox"></div>--%>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name border-right"><span>선택검진</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 tag-name border-right"><span>개수</span></div>
                                            <div class="col-lg-10 tag-name"><span>메모</span></div>
                                            <%--                                            <div class="col-lg-2 center" id="text_3" data-ggsj="dxTextBox"></div>--%>
                                            <%--                                            <div class="col-lg-10 center" id="text_4" data-ggsj="dxTextBox"></div>--%>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>선택A</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectACount"
                                                 data-ggsj="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectAMemo" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>선택D</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectDCount"
                                                 data-ggsj="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectDMemo" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>선택B</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectBCount"
                                                 data-ggsj="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectBMemo" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>선택E</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectECount"
                                                 data-ggsj="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectEMemo" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>선택C</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectCCount"
                                                 data-ggsj="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectCMemo" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>선택F</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2 center border-right" id="selectFCount"
                                                 data-ggsj="dxNumberBox"></div>
                                            <div class="col-lg-10 center" id="selectFMemo" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 선택 검진 세부 정보 -->

                        <%--<div class="row">
                            <div class="col-lg-4">개별등록 (등록패키지 미리보기)</div>
                        </div>--%>

                        <!-- checkBox -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap logo-area-left">
                                <div class="row-box-title"><i class="xi-play-circle"></i>검진 항목 세부 정보</div>

                                <div class="row-box1">
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>검색항목</span></div>
                                        <div class="col-lg-1" id="all" data-ggsj="dxCheckBox"></div>
                                        <div class="col-lg-1" id="noInc" data-ggsj="dxCheckBox"></div>
                                        <div class="col-lg-1" id="basic" data-ggsj="dxCheckBox"></div>
                                        <div class="col-lg-1" id="A" data-ggsj="dxCheckBox"></div>
                                        <div class="col-lg-1" id="B" data-ggsj="dxCheckBox"></div>
                                        <div class="col-lg-1" id="C" data-ggsj="dxCheckBox"></div>
                                        <div class="col-lg-1" id="D" data-ggsj="dxCheckBox"></div>
                                        <div class="col-lg-1" id="E" data-ggsj="dxCheckBox"></div>
                                        <div class="col-lg-1" id="F" data-ggsj="dxCheckBox"></div>
                                        <div class="col-lg-1" id="add" data-ggsj="dxCheckBox"></div>
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
                                                    <div class="col-lg-12" id="searchGrid" data-ggsj="dxTextBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- checkBox -->

                        <div class="row">
                            <div id="treeviewCheckupItemCodeCreate" data-ggsj="dxTreeList"></div>
                        </div>

                        <div class="row btn_area footer-btn">
<%--                            <div class="col-lg-1" id="confirmedChecked" data-ggsj="dxCheckBox"></div>--%>
                            <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"><i class="xi-save"></i>저장</div>
                            <div class="col-lg-1" id="btnList" data-ggsj="dxButton">목록</div>
                            <div class="col-lg-1"></div>
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
        ggsj.openMenu('contract-checkup');
        let inputOpenFile = $('#openFile');
        inputOpenFile.on('change', parseExcelContractCheckup);

        /** @param dxInstances : {btnCopy,btnAttach,btnImport,treeviewCheckupItemCodeCreate} */
        let dxInstances = ggsj.createDx(false);

        // dxInstances.btnCopy.option({
        //     text: '검진유형복사',
        // });

        // dxInstances.confirmedChecked.option({
        //     text: '검진 항목 확인 요청',
        //     value: true
        // });

        dxInstances.btnSampleDown.option({
            text: 'Excel 샘플 다운로드',
            onClick: function () {
                exportExcelContractCheckupSample();
            },
        });

        dxInstances.btnImport.option({
            text: '검진유형 Excel 등록',
            onClick: function () {
                if (!dxInstances.subTypeName.option('value')) {
                    alert('세부 유형명을 입력하세요');
                    return;
                }
                inputOpenFile.trigger("click");
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

        dxInstances.all.option({
            text: '전체',
            value: true,
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
                        dxInstances.treeviewCheckupItemCodeCreate.clearFilter();
                    } else {
                        search(data);
                    }
                }
            }
        });

        dxInstances.noInc.option({
            text: '미포함',
            value: true,
            onValueChanged: search,
        });

        dxInstances.basic.option({
            text: '기본항목',
            value: true,
            onValueChanged: search,
        });

        dxInstances.A.option({
            text: '선택A',
            value: true,
            onValueChanged: search,
        });

        dxInstances.B.option({
            text: '선택B',
            value: true,
            onValueChanged: search,
        });

        dxInstances.C.option({
            text: '선택C',
            value: true,
            onValueChanged: search,
        });

        dxInstances.D.option({
            text: '선택D',
            value: true,
            onValueChanged: search,
        });

        dxInstances.E.option({
            text: '선택E',
            value: true,
            onValueChanged: search,
        });

        dxInstances.F.option({
            text: '선택F',
            value: true,
            onValueChanged: search,
        });

        dxInstances.add.option({
            text: '추가검사',
            value: true,
            onValueChanged: search,
        });

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            readOnly: false,
            onValueChanged: function (e) {
                dxInstances.treeviewCheckupItemCodeCreate.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.treeviewCheckupItemCodeCreate.option({
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
                caption: '대분류',
                dataField: 'code',
                allowEditing: false,
            }, {
                caption: '중분류',
                dataField: 'name',
                allowEditing: false,
            }, {
                caption: '등록',
                dataField: 'register',
                lookup: {
                    dataSource: ggsj.typeDef.registerType,
                    displayExpr: 'text',
                    valueExpr: 'id'
                }
            }, {
                caption: '수납비용',
                dataField: 'copay',
            }, {
                caption: '항목 메모',
                dataField: 'checkupContractItemMemo',
            }, {
                caption: '병원 기준수가',
                dataField: 'bill',
                allowEditing: false,
            }, {
                caption: '기업체 할인수가',
                dataField: 'discountBill',
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
            text: '목록',
            onClick: function () {
                location.href = '<c:url value="/pm/contract-checkup"/>';
            }
        });

        dxInstances.btnSave.option({
            text: '저장',
            type: 'success',
            stylingMode: 'contained',
            onClick: function () {
                let data = ggsj.dxToValues();

                if (!data.checkupContractTypeId) {
                    alert('검진 유형을 선택하세요');
                    return;
                }

                if (!data.subTypeName) {
                    alert('세부 유형명을 입력하세요');
                    return;
                }

                let gridData = dxInstances.treeviewCheckupItemCodeCreate.option('editing.changes').map(function (v) {
                    v.data._crudType = 'INSERT';
                    v.data.id = v.key;

                    let rowData = dxInstances.treeviewCheckupItemCodeCreate.getNodeByKey(v.key).data;
                    v.data = $.extend(true, {}, rowData, v.data);

                    if (!v.data.register) {
                        v.data.register = '0';
                    }

                    return v.data;
                });

                data._crudType = 'INSERT';
                data.checkupContractTypes = null;
                data.checkupContractItems = gridData;

                //console.log(data);

                let ajaxCheckupSave = $.ajax({
                    url: '<c:url value="/pm/contract-checkup"/>',
                    method: 'POST',
                    data: JSON.stringify(data),
                });

                $.when(ajaxCheckupSave).then(function () {
                    ggsj.notify("저장되었습니다.");
                    location.href = '<c:url value="/pm/contract-checkup"/>';
                });
            }
        });

        function search(data) {
            if (!data.event) {
                return;
            }

            let filters = [];
            filters.push(['register', "=", '']);

            if (dxInstances.noInc.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeCreate, 'register', 'keyId'), "=", '0']);
            }

            if (dxInstances.basic.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeCreate, 'register', 'keyId'), "=", '1']);
            }

            if (dxInstances.A.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeCreate, 'register', 'keyId'), "=", 'A']);
            }
            if (dxInstances.B.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeCreate, 'register', 'keyId'), "=", 'B']);
            }
            if (dxInstances.C.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeCreate, 'register', 'keyId'), "=", 'C']);
            }
            if (dxInstances.D.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeCreate, 'register', 'keyId'), "=", 'D']);
            }
            if (dxInstances.E.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeCreate, 'register', 'keyId'), "=", 'E']);
            }
            if (dxInstances.F.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeCreate, 'register', 'keyId'), "=", 'F']);
            }
            if (dxInstances.add.option('value')) {
                filters.push('or');
                filters.push([unSavedData(dxInstances.treeviewCheckupItemCodeCreate, 'register', 'keyId'), "=", '2']);
            }

            if (filters.length === 19) {
                dxInstances.all.option('value', true);
                dxInstances.treeviewCheckupItemCodeCreate.clearFilter();
            } else {
                dxInstances.all.option('value', false);
                dxInstances.treeviewCheckupItemCodeCreate.filter(filters);
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

        function exportExcelContractCheckupSample() {
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
            worksheet.getCell('A1').value = '대분류명';
            worksheet.getCell('A1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('A1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('B1:B2');
            worksheet.getCell('B1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('B1').value = '중분류명';
            worksheet.getCell('B1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('B1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('C1:C2');
            worksheet.getCell('C1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('C1').value = '소분류';
            worksheet.getCell('C1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('C1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('D1:D2');
            worksheet.getCell('D1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('D1').value = '소분류아이디';
            worksheet.getCell('D1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('D1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('E1:E2');
            worksheet.getCell('E1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('E1').value = '소분류코드';
            worksheet.getCell('E1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('E1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.getCell('F1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('F1').value = '포함여부';
            worksheet.getCell('F1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('F1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};
            worksheet.getCell('F2').alignment = {vertical: 'middle', horizontal: 'left', wrapText: true};
            worksheet.getCell('F2').value = '▶미포함:0\n▶기본항목:1\n▶추가항목:2\n▶선택검사:A~F';
            worksheet.getCell('F2').font = {color: {argb: 'FF000000'},};
            worksheet.getCell('F2').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FFAEAAAA'}};

            worksheet.getCell('G1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('G1').value = '수납비용';
            worksheet.getCell('G1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('G1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};
            worksheet.getCell('G2').alignment = {vertical: 'middle', horizontal: 'left'};
            worksheet.getCell('G2').value = '(숫자로 표시)';
            worksheet.getCell('G2').font = {color: {argb: 'FF000000'},};
            worksheet.getCell('G2').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FFAEAAAA'}};

            worksheet.getCell('H1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('H1').value = '항목 메모';
            worksheet.getCell('H1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('H1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};
            worksheet.getCell('H2').alignment = {vertical: 'middle', horizontal: 'left'};
            worksheet.getCell('H2').value = '';
            worksheet.getCell('H2').font = {color: {argb: 'FF000000'},};
            worksheet.getCell('H2').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FFAEAAAA'}};

            worksheet.getCell('I1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('I1').value = '추가검사 기업체 할인수가';
            worksheet.getCell('I1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('I1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};
            worksheet.getCell('I2').alignment = {vertical: 'middle', horizontal: 'left'};
            worksheet.getCell('I2').value = '(숫자로 표시)';
            worksheet.getCell('I2').font = {color: {argb: 'FF000000'},};
            worksheet.getCell('I2').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FFAEAAAA'}};

            worksheet.mergeCells('K1:K2');
            worksheet.getCell('K1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('K1').value = '선택항목';
            worksheet.getCell('K1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('K1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('L1:L2');
            worksheet.getCell('L1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('L1').value = '개수';
            worksheet.getCell('L1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('L1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            worksheet.mergeCells('M1:M2');
            worksheet.getCell('M1').alignment = {vertical: 'middle', horizontal: 'center'};
            worksheet.getCell('M1').value = '메모';
            worksheet.getCell('M1').font = {color: {argb: 'FFFFFFFF'},};
            worksheet.getCell('M1').fill = {type: 'pattern', pattern: 'solid', fgColor: {argb: 'FF3A3838'}};

            let rootNode = dxInstances.treeviewCheckupItemCodeCreate.getRootNode();
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
            worksheet.getCell('K3').value = '선택A';
            worksheet.getCell('K4').value = '선택B';
            worksheet.getCell('K5').value = '선택C';
            worksheet.getCell('K6').value = '선택D';
            worksheet.getCell('K7').value = '선택E';
            worksheet.getCell('K8').value = '선택F';

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

                            // 빈 셀을 만나면 중단
                            if (!row.getCell(1).value || !row.getCell(2).value || !row.getCell(3).value || !row.getCell(4).value || !row.getCell(5).value) {
                                // Check Key Field
                                break;
                            }

                            if (row.getCell(6).value === 0 || row.getCell(6).value === '0' || row.getCell(6).value === '' || row.getCell(6).value === undefined || row.getCell(6).value === null) {
                                // 미포함
                                continue;
                            }

                            let resultRow = {};

                            // Key
                            resultRow._crudType = 'INSERT';
                            resultRow.id = parseInt(row.getCell(4).value);
                            resultRow.register = String(row.getCell(6).value);
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

                    let data = ggsj.dxToValues();

                    data._crudType = 'INSERT';
                    data.checkupContractTypes = null;
                    data.checkupContractItems = excelDataSet;

                    let ajaxCheckupSave = $.ajax({
                        url: '<c:url value="/pm/contract-checkup"/>',
                            method: 'POST',
                            data: JSON.stringify(data),
                        });

                        $.when(ajaxCheckupSave).then(function () {
                            ggsj.notify("저장되었습니다.");
                            location.href = '<c:url value="/pm/contract-checkup"/>';
                        });
                    }
                );
            };

            reader.readAsArrayBuffer(file);

            inputOpenFile.val('');
        }

        // Load
        let ajaxCheckupCreate = $.ajax({
            url: '<c:url value="/pm/contract-checkup/create"/>',
            method: 'GET',
            data: {
                checkupContractId: <c:out value="${checkupContractId}"/>,
                centerId: <c:out value="${centerId}"/>,
            },
        });

        $.when(ajaxCheckupCreate).then(function (response) {
            console.log(response.data);

            dxInstances.checkupContractTypeId.option({
                dataSource: response.data.checkupContractTypes,
            });

            dxInstances.treeviewCheckupItemCodeCreate.option({
                dataSource: response.data.checkupContractItems,
            });

            let checkupContractTypeIdLoad = dxInstances.checkupContractTypeId.getDataSource().load();
            let treeviewCheckupItemCodeCreateLoad = dxInstances.treeviewCheckupItemCodeCreate.getDataSource().load();

            $.when(checkupContractTypeIdLoad, treeviewCheckupItemCodeCreateLoad).then(function () {
                ggsj.valuesToDx(response.data);
            });
        });
    });

</script>
</html>
