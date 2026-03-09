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
                            <h3 class="h3">?�림??관�?/h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <%-- checkup type dataGrid --%>
                        <div class="row">
                            <div class="col-lg-3" id="btnCheckupInfo" data-sitebuilder="dxButton"></div>
                            <div class="col-lg-3" id="btnReserve" data-sitebuilder="dxButton"></div>
                            <div class="col-lg-3" id="btnEncouragement" data-sitebuilder="dxButton"></div>
                            <div class="col-lg-3" id="btnNoneReserve" data-sitebuilder="dxButton"></div>
                        </div>

                        <div class="row">
                            <div class="col-lg-2" id="selectCompany" data-sitebuilder="dxSelectBox"></div>
                            <div class="col-lg-2" id="btnSend" data-sitebuilder="dxButton"></div>
                        </div>

                        <div class="row">
                            <div id="dxGridSendList" data-sitebuilder="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div id="dxGridExceptList" data-sitebuilder="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12" id="contentsText" data-sitebuilder="dxTextBox"></div>
                            <div class="col-lg-12" id="contents" data-sitebuilder="dxTextArea"></div>
                        </div>
                    </div>
                    <%--                    </div>--%>
                </div>
            </div>
        </div>


    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        sitebuilder.openMenu('notitokinfo');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.btnCheckupInfo.option({
            text: '?�플�?리스??,
            onClick: function () {
                let ajaxTemplateList = $.ajax({
                    url: '<c:url value="/pm/notitok/template"/>',
                    method: 'GET',
                });

                $.when(ajaxTemplateList).then(function (response) {
                    console.log(response);
                });
            }
        });

        dxInstances.btnReserve.option({
            text: '검?�실?�안??발송',
            onClick: function () {
                let ajaxSendGuide = $.ajax({
                    url: '<c:url value="/pm/notitok/send/checkupguide"/>',
                    method: 'GET',
                });

                $.when(ajaxSendGuide).then(function (response) {
                    console.log(response);
                });
            }
        });

        dxInstances.btnEncouragement.option({
            text: '발송 결과 리스??,
            onClick: function () {
                let ajaxResultList = $.ajax({
                    url: '<c:url value="/pm/notitok/result"/>',
                    method: 'GET',
                });

                $.when(ajaxResultList).then(function (response) {
                    console.log(response);
                });
            }
        });

        dxInstances.btnNoneReserve.option({
            text: '미예?�자 관�?,
            onClick: function () {
                location.href = '<c:url value="/pm/notitoknonereserve"/>';
            }
        });

        dxInstances.btnSend.option({
            text: '발송',
        });

        dxInstances.contentsText.option({
            value: '검진실?�안??,
            readOnly: true,
        });

        dxInstances.contents.option({
            height: 300,
            value: '[ooo 기업�?건강검�??�내] 반갑?�니??고객??^' + '\n' +
                '귀??건강검�??�무�??�탁?�영?�고 ?�는 건강?�자?�니??' + '\n' +
                '?�해 ?�래?� 같이 건강검진을 ?�행?�오?? ?�??건강?�자???�속?�신 ???�약?�청?? + '\n' +
                '?�주?�기 바랍?�다.' + '\n' +
                '???�사?�트 : https://www.sitebuilder.co.kr' + '\n' +
                '??기업체코??: [  ]' + '\n' +
                '???�약가?�기�?: [  ]' + '\n' +
                '?�포?�사?�트?�서 "건강?�자"검?�하?�도 ?�속??가?�합?�다' + '\n' +
                '- 건강?�자 ?�림 (1600-1600) -',
            readOnly: true,
        });

        dxInstances.dxGridSendList.option({
            export: {
                enabled: false
            },
            dataSource: [],
            columnAutoWidth: true,
            allowColumnReordering: true,
            columns: [{
                caption: '?�번',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                caption: '발송??,
                dataField: 'sendDate',
            }, {
                dataField: 'companyName',
                caption: '기업체명',
            }, {
                dataField: 'totalSend',
                caption: '발송건수',
                format: {
                    type: "fixedPoint",
                }
            }, {
                dataField: 'totalSuccess',
                caption: '?�공건수',
                format: {
                    type: "fixedPoint",
                }
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '검진실?�안??발송 목록',
                });
            },
        });

        dxInstances.dxGridExceptList.option({
            export: {
                enabled: false
            },
            dataSource: [],
            columnAutoWidth: true,
            allowColumnReordering: true,
            columns: [{
                caption: '?�번',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'employeeName',
                caption: '검진자�?,
            }, {
                dataField: 'birth',
                caption: '?�년?�일',
                type: 'date',
                displayFormat: 'yyyy-MM-dd',
            }, {
                dataField: 'companyName',
                caption: '기업체명',
            }, {
                dataField: 'employeeCode',
                caption: 'ID',
            }, {
                dataField: 'mobile',
                caption: '?��??�화번호',
            }, {
                dataField: 'exceptDate',
                caption: '발송?�외 ?�록??,
                type: 'date',
                displayFormat: 'yyyy-MM-dd',
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '검진실?�안??발송 ?�외??목록',
                });
            },
        });

        let ajaxCompanyList = {
            url: '<c:url value="/common/company?listType=LAST_ALL"/>',
        }
        $.when($.ajax(ajaxCompanyList)).then(function (resp1) {
            let dsCompany = resp1.data.map(function (v) {
                return v;
            });

            dxInstances.selectCompany.option({
                items: dsCompany,
                valueExpr: 'companyId',
                displayExpr: 'companyName',
            });
        });
    });
</script>
</html>
