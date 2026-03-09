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
                            <h3 class="h3">알림톡 관리</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <%-- checkup type dataGrid --%>
                        <div class="row">
                            <div class="col-lg-3" id="btnCheckupInfo" data-ggsj="dxButton"></div>
                            <div class="col-lg-3" id="btnReserve" data-ggsj="dxButton"></div>
                            <div class="col-lg-3" id="btnEncouragement" data-ggsj="dxButton"></div>
                            <div class="col-lg-3" id="btnNoneReserve" data-ggsj="dxButton"></div>
                        </div>

                        <div class="row">
                            <div class="col-lg-2" id="selectCompany" data-ggsj="dxSelectBox"></div>
                            <div class="col-lg-2" id="btnSend" data-ggsj="dxButton"></div>
                        </div>

                        <div class="row">
                            <div id="dxGridSendList" data-ggsj="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div id="dxGridExceptList" data-ggsj="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12" id="contentsText" data-ggsj="dxTextBox"></div>
                            <div class="col-lg-12" id="contents" data-ggsj="dxTextArea"></div>
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
        ggsj.openMenu('notitokinfo');

        let dxInstances = ggsj.createDx(false);

        dxInstances.btnCheckupInfo.option({
            text: '템플릿 리스트',
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
            text: '검사실시안내 발송',
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
            text: '발송 결과 리스트',
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
            text: '미예약자 관리',
            onClick: function () {
                location.href = '<c:url value="/pm/notitoknonereserve"/>';
            }
        });

        dxInstances.btnSend.option({
            text: '발송',
        });

        dxInstances.contentsText.option({
            value: '검진실시안내',
            readOnly: true,
        });

        dxInstances.contents.option({
            height: 300,
            value: '[ooo 기업체 건강검진 안내] 반갑습니다 고객님^^' + '\n' +
                '귀사 건강검진 업무를 위탁운영하고 있는 건강살자입니다.' + '\n' +
                '올해 아래와 같이 건강검진을 시행하오니, 저희 건강살자에 접속하신 후 예약신청을' + '\n' +
                '해주시기 바랍니다.' + '\n' +
                '■ 웹사이트 : https://www.ggsj.co.kr' + '\n' +
                '■ 기업체코드 : [  ]' + '\n' +
                '■ 예약가능기간 : [  ]' + '\n' +
                '※포털사이트에서 "건강살자"검색하셔도 접속이 가능합니다' + '\n' +
                '- 건강살자 드림 (1600-1600) -',
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
                caption: '순번',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                caption: '발송일',
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
                caption: '성공건수',
                format: {
                    type: "fixedPoint",
                }
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '검진실시안내 발송 목록',
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
                caption: '순번',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'employeeName',
                caption: '검진자명',
            }, {
                dataField: 'birth',
                caption: '생년월일',
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
                caption: '휴대전화번호',
            }, {
                dataField: 'exceptDate',
                caption: '발송제외 등록일',
                type: 'date',
                displayFormat: 'yyyy-MM-dd',
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '검진실시안내 발송 제외자 목록',
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
