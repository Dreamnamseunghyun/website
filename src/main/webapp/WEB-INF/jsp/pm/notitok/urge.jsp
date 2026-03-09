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
                            <h3 class="h3">ÎØ∏Ïòà???ÖÎ†§ Î∞úÏÜ°</h3>
                        </div>
                    </div>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap">
                                <div class="row-box1">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>Í∏∞ÏóÖÏ≤?/span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectCompany"
                                                     data-sitebuilder="dxLookup" style="width: 250px"></div>
                                            </div>
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

                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap logo-area-left">
                                <div class="row-box-title bottom-0"><i class="xi-play-circle"></i>ÎØ∏Ïòà?ΩÏûê Î™©Î°ù
                                    <div class="checkText ml-3"><i class="xi-info-o"></i>?¥Î??ÑÌôîÎ≤àÌò∏ ?àÎäî Í∏∞ÏóÖÎ∂Ä??ÏßÅÏõê, Í∞ÄÏ°±Îßå Î™©Î°ù??                                        Î≥¥ÏûÖ?àÎã§.
                                    </div>
                                </div>
                                <div class="row-box1">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row col-box-vertical6">
                                            <div class="row">
                                                <div id="dxGridUrgeList" class="main_table"
                                                     data-sitebuilder="dxDataGrid"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row-wrap logo-area-right notitok-area">
                                <div class="row-box-title"><i class="xi-play-circle"></i>?úÌîåÎ¶?/div>
                                <div class="row-box1 notitok-wrap">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div id="notitokTemplateTitle" data-sitebuilder="dxTextBox">
                                            </div>
                                            <div id="notitokTemplate" data-sitebuilder="dxTextArea">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box2">
                                    <div class="col-box1 row">
                                        <div class="col-lg-6 tag-name"><span>?©Í≥Ñ</span></div>
                                        <div class="col-lg-6 row period">
                                            <div class="col-lg-12" id="total" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box2">
                                    <div class="col-box1 row">
                                        <div class="col-lg-6 tag-name"><span>Î∞úÏÜ°Í±¥Ïàò</span></div>
                                        <div class="col-lg-6 row period">
                                            <div class="col-lg-12" id="totalGuide" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1 btnGGSJ" id="btnSend" data-sitebuilder="dxButton"></div>
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
        sitebuilder.openMenu('urge');

        /** @param dxInstances : {dxGridUrgeList} */
        let dxInstances = sitebuilder.createDx(false);
        let gridData;

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
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
            text: 'Î∞úÏÜ°',
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
                if (window.confirm('Î∞úÏÜ°?òÏãúÍ≤†Ïäµ?àÍπå?') === false) {
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
                    sitebuilder.notify("Î∞úÏÜ°?òÏóà?µÎãà??");
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
                caption: '?úÎ≤à',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
                allowEditing: false,
            }, {
                dataField: "employeeName",
                caption: "Í≤ÄÏßÑÏûêÎ™?,
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
                caption: "?ùÎÖÑ?îÏùº",
                dataType: 'date',
                allowEditing: false,
            }, {
                dataField: "sex",
                caption: "?±Î≥Ñ",
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "depart",
                caption: "Î∂Ä??,
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "title",
                caption: "ÏßÅÏ±Ö",
                alignment: 'center',
                allowEditing: false,
            }, {
                dataField: "myself",
                caption: "?Ä?ÅÏûê",
                alignment: 'center',
                lookup: {
                    dataSource: [{id: 1, text: 'Î≥∏Ïù∏'}, {id: 2, text: 'Í∞ÄÏ°?},],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
                allowEditing: false,
            }, {
                dataField: "employeeNo",
                caption: "?¨Î≤à",
                allowEditing: false,
            }, {
                dataField: "mobile",
                caption: "?¥Î??ÑÌôîÎ≤àÌò∏",
                format: function (value) {
                    return sitebuilder.phoneWithHyphen(value);
                },
                allowEditing: false,
                //}, {
                //     dataField: "email",
                //     caption: "?¥Î©î??,
                //     allowEditing: false,
            }, {
                dataField: "employeeCode",
                caption: "ID",
                allowEditing: false,
            }, {
                dataField: 'notokGuide',
                caption: '?àÎÇ¥?úÏô∏',
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
                caption: 'Î∞úÏÜ°?¨Î?',
                width: 100,
            }, {
                dataField: "notokUpdatedAt",
                caption: "Î∞úÏÜ°?úÏô∏??,
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
                            value: sendData.length + 'Î™?,
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
            placeholder: "?åÏÇ¨Î•??†ÌÉù?¥Ï£º?∏Ïöî.",
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
                    value: total + 'Î™?,
                    readOnly: true,
                    alignment: 'center',
                });

                dxInstances.total.option({
                    value: response.data.length + 'Î™?,
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
