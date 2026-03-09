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
                            <div id="dxGridExceptList" data-ggsj="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12" id="contents" data-ggsj="dxTextArea"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2" id="btnNoneReserveLink" data-ggsj="dxButton"></div>
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
            text: '검진실시 안내',
            onClick: function () {
                location.href = '<c:url value="/pm/notitokinfo"/>';
            }
        });
        dxInstances.btnReserve.option({
            text: '예약',
            onClick: function () {
                location.href = '<c:url value="/pm/notitokreserve"/>';
            }
        });
        dxInstances.btnEncouragement.option({
            text: '독려',
            onClick: function () {
                location.href = '<c:url value="/pm/notitokencouragement"/>';
            }
        });
        dxInstances.btnNoneReserve.option({
            text: '미예약자 관리',
            onClick: function () {
                location.href = '<c:url value="/pm/notitoknonereserve"/>';
            }
        });

        dxInstances.contents.option({
            height: 300,
            value: '오늘은 건강검진 예약이 하고 싶어지는 날입니다 ♬   지금 꼭 예약 부탁드립니다.' + '\n' +
                    '■ 웹사이트 : https://www.ggsj.co.kr' + '\n' +
                    '■ 기업체 코드 : 【001001】' + '\n' +
                    '■ ID, PW : 예약 플랫폼 화면에서 안내' + '\n' +
                    '■ 예약가능기간 : 【2021-00-00~2021-00-00】' + '\n' +
                    '※ 포털사이트에서 "건강살자"를 검색하셔도 접속이 가능합니다.' + '\n' +
                    '▷ 건강살자 ☎1566-7527 ◁',
            readOnly: true,
        });

        dxInstances.btnNoneReserveLink.option({
            text: '미예약자 관리 바로가기',
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
                    text: '미예약자 관리 발송 목록',
                });
            },
        });
    });
</script>
</html>
