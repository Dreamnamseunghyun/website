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
                            <h3 class="h3">미예약 독려 발송</h3>
                        </div>
                    </div>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap">
                                <div class="row-box1">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>기업체</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectCompany"
                                                     data-ggsj="dxLookup" style="width: 250px"></div>
                                            </div>
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

                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap logo-area-left">
                                <div class="row-box-title bottom-0"><i class="xi-play-circle"></i>미예약자 목록
                                    <div class="checkText ml-3"><i class="xi-info-o"></i>휴대전화번호 있는 기업부담 직원, 가족만 목록에
                                        보입니다.
                                    </div>
                                </div>
                                <div class="row-box1">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row col-box-vertical6">
                                            <div class="row">
                                                <div id="dxGridUrgeList" class="main_table"
                                                     data-ggsj="dxDataGrid"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row-wrap logo-area-right notitok-area">
                                <div class="row-box-title"><i class="xi-play-circle"></i>템플릿</div>
                                <div class="row-box1 notitok-wrap">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div id="notitokTemplateTitle" data-ggsj="dxTextBox">
                                            </div>
                                            <div id="notitokTemplate" data-ggsj="dxTextArea">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box2">
                                    <div class="col-box1 row">
                                        <div class="col-lg-6 tag-name"><span>합계</span></div>
                                        <div class="col-lg-6 row period">
                                            <div class="col-lg-12" id="total" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box2">
                                    <div class="col-box1 row">
                                        <div class="col-lg-6 tag-name"><span>발송건수</span></div>
                                        <div class="col-lg-6 row period">
                                            <div class="col-lg-12" id="totalGuide" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1 btnGGSJ" id="btnSend" data-ggsj="dxButton"></div>
                        </div>
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
        ggsj.openMenu('urge');

        /** @param dxInstances : {dxGridUrgeList} */
        let dxInstances = ggsj.createDx(false);
        let gridData;

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dxGridUrgeList.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.notitokTemplateTitle.option({
            readOnly: true,
        });

        dxInstances.notitokTemplate.option({
            readOnly: true,
        });

        dxInstances.btnSend.option({
            text: '발송',
            onClick: function () {
                let changes = dxInstances.dxGridUrgeList.option('editing.changes');
                let changesData = changes.map(function (v) {
                    return $.extend(true, {}, v.key, v.data);
                });

                let sendData = gridData.map(function (gridItem) {
                    let find = changesData.find(function (changeItem) {
                        return gridItem.employeeCheckupId === changeItem.employeeCheckupId;
                    });

                    if (find) {
                        return find;
                    }

                    return gridItem;
                }).filter(function (v) {
                    return v.checkGuide;
                });

                console.log(sendData);
                if (window.confirm('발송하시겠습니까?') === false) {
                    return;
                }

                let ajaxSendCheckupGuide = $.ajax({
                    url: '<c:url value="/pm/notitok/send/urge"/>',
                    cache: false,
                    method: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify(sendData),
                });

                $.when(ajaxSendCheckupGuide).then(function (response) {
                    ggsj.notify("발송되었습니다.");
                });
            }
        });

        dxInstances.dxGridUrgeList.option({
            editing: {
                mode: "batch",
                allowUpdating: true,
                allowAdding: true,
                allowDeleting: false,
                selectTextOnEditStart: false,
            },
            options: {
                allowColumnReordering: true,
                allowColumnResizing: true,
                autoNavigateToFocusedRow: true,
                columnAutoWidth: true,
                // columnMaxWidth: 200,
                // columnResizingMode: "nextColumn",
            },
            export: {
                enabled: false
            },
            dataSource: [],
            columnAutoWidth: true,
            allowColumnReordering: true,
            columns: [{
                caption: '순번',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
                allowEditing: false,
            }, {
                dataField: "employeeName",
                caption: "검진자명",
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.append("<a href = " + '<c:url value="/pm/reserve"/>/view' + '/' + cellInfo.data.userId + ">" + cellInfo.text + "</a>");
                    if (cellInfo.data.vip === true) {
                        cellElement.append('   *' + 'vip' + '*');
                    }
                },
                allowEditing: false,
            }, {
                dataField: "birth",
                caption: "생년월일",
                dataType: 'date',
                allowEditing: false,
            }, {
                dataField: "sex",
                caption: "성별",
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "depart",
                caption: "부서",
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "title",
                caption: "직책",
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "myself",
                caption: "대상자",
                alignment: 'center',
                lookup: {
                    dataSource: [{id: 1, text: '본인'}, {id: 2, text: '가족'},],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
                allowEditing: false,
            }, {
                dataField: "employeeNo",
                caption: "사번",
                allowEditing: false,
            }, {
                dataField: "mobile",
                caption: "휴대전화번호",
                format: function (value) {
                    return ggsj.phoneWithHyphen(value);
                },
                allowEditing: false,
                //}, {
                //     dataField: "email",
                //     caption: "이메일",
                //     allowEditing: false,
            }, {
                dataField: "employeeCode",
                caption: "ID",
                allowEditing: false,
            }, {
                dataField: 'notokGuide',
                caption: '안내제외',
                alignment: 'center',
                width: 120,
                allowEditing: false,
                lookup: {
                    dataSource: [
                        {'id': false, 'text': 'N'},
                        {'id': true, 'text': 'Y'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                dataField: 'checkGuide',
                caption: '발송여부',
                width: 100,
            }, {
                dataField: "notokUpdatedAt",
                caption: "발송제외일",
                alignment: 'center',
                dataType: 'date',
                allowEditing: false,
            },],
            onEditorPreparing: function (event) {
                if (event.parentType === 'dataRow' && event.dataField === 'checkGuide') {
                    let orgOnValueChanged = event.editorOptions.onValueChanged;

                    event.editorOptions.onValueChanged = function (e) {
                        orgOnValueChanged(e);

                        let changes = dxInstances.dxGridUrgeList.option('editing.changes');
                        let changesData = changes.map(function (v) {
                            return $.extend(true, {}, v.key, v.data);
                        });

                        let sendData = gridData.map(function (gridItem) {
                            let find = changesData.find(function (changeItem) {
                                return gridItem.employeeCheckupId === changeItem.employeeCheckupId;
                            });

                            if (find) {
                                return find;
                            }
                            return gridItem;
                        }).filter(function (v) {
                            return v.checkGuide;
                        });

                        dxInstances.totalGuide.option({
                            value: sendData.length + '명',
                            readOnly: true,
                            alignment: 'center',
                        });
                    };
                }
            },
        });

        dxInstances.selectCompany.option({
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
            placeholder: "회사를 선택해주세요.",
            onValueChanged: function (e) {
                LoadUserExceptList();
            }
        });

        //Load
        function LoadUserExceptList() {
            let ajaxUserExcept = $.ajax({
                url: '<c:url value="/pm/urge"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    companyCheckupId: dxInstances.selectCompany.option('value'),
                }
            });

            let total = 0;
            $.when(ajaxUserExcept).then(function (response) {
                gridData = response.data;
                for (let i = 0; i < gridData.length; i++) {
                    if (gridData[i].checkGuide === true) {
                        total += 1;
                    }
                }

                dxInstances.totalGuide.option({
                    value: total + '명',
                    readOnly: true,
                    alignment: 'center',
                });

                dxInstances.total.option({
                    value: response.data.length + '명',
                    readOnly: true,
                    alignment: 'center',
                });

                dxInstances.dxGridUrgeList.cancelEditData();

                dxInstances.dxGridUrgeList.option({
                    dataSource: gridData,
                });
            });
        }

        let ajaxCompanyList = $.ajax({
            url: '<c:url value="/common/company?listType=LAST_ALL"/>',
        });

        $.when(ajaxCompanyList).then(function (responseCompanyList) {
            // Company List
            dxInstances.selectCompany.option({
                dataSource: responseCompanyList.data,
            });
        });

        let ajaxTemplateCheckupInfo = $.ajax({
            url: '<c:url value="/pm/template/urge"/>',
            cache: false,
            method: 'GET',
            dataType: 'json',
            contentType: 'application/json',
        });

        $.when(ajaxTemplateCheckupInfo).then(function (response) {
            dxInstances.notitokTemplateTitle.option({
                value: response.data.templtCode + ' ' + response.data.templtName,
            });

            dxInstances.notitokTemplate.option({
                value: response.data.templtContent,
            });
        });
    });
</script>
</html>
