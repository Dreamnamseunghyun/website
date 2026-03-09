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
                            <h3 class="h3">병원목록</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap left">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-5 tag-name"><span>특수검진 가능병원 조회</span></div>
                                            <div class="col-lg-7" id="selectSpecial" data-ggsj="dxSelectBox"></div>
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

                        <div id="dataGridHospital" class="main_table" data-ggsj="dxDataGrid">
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
        ggsj.openMenu('hospital');

        let dxInstances = ggsj.createDx(false);

        let dshospital = new DevExpress.data.DataSource({
            load: function () {
                return $.ajax({
                    url: '<c:url value="/hm/hospital"/>',
                    method: 'GET',
                })
            }
        });

        dxInstances.selectSpecial.option({
            dataSource: [
                {'id': 'All', 'text': '전체'},
                {'id': 1, 'text': '특수검진 가능병원 조회'},
            ],
            value: 'All',
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function (data) {
                if (data.value === 'All')
                    dxInstances.dataGridHospital.clearFilter();
                else
                    dxInstances.dataGridHospital.filter(['ableSpecial', '=', data.value]);
            }
        });

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridHospital.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridHospital.option({
            export: {
                enabled: false
            },
            dataSource: dshospital,
            columnAutoWidth: true,
            allowColumnReordering: true,
            groupPanel: {
                visible: false,
            },
            columns: [{
                caption: '병원명',
                groupIndex: 0,
                dataField: 'hospitalName',
                groupCellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.items !== null) {
                        $('<span>')
                            .text(cellInfo.data.key)
                            .appendTo(cellElement);
                        $("<div class='green'>")
                            .css({'float': 'right', 'margin': '0 5px'})
                            .dxButton({
                                text: "연도별 기준수가",
                                onClick: function () {
                                    let hospitalId = cellInfo.data.items[0].hospitalId;
                                    location.href = '<c:url value="/hm/hospital/0/checkup/2022"/>';
                                }
                            }).appendTo(cellElement);
                        $("<div class='blue'>")
                            .css({'float': 'right', 'margin': '0 5px'})
                            .dxButton({
                                text: "센터 등록",
                                onClick: function () {
                                    let hospitalId = cellInfo.data.items[0].hospitalId;
                                    location.href = '<c:url value="/hm/center/0/create"/>';
                                }
                            }).appendTo(cellElement);
                        $("<div class='orange'>")
                            .css({'float': 'right', 'margin': '0 5px'})
                            .dxButton({
                                text: "계약 기업",
                                onClick: function () {
                                    let hospitalId = cellInfo.data.items[0].hospitalId;
                                    location.href = '<c:url value="/hm/hospital/0/hcontract"/>';
                                }
                            }).appendTo(cellElement);
                    } else if (cellInfo.data.items === null) {
                        $('<span>')
                            .text(cellInfo.data.key)
                            .appendTo(cellElement);
                        $("<div class='green'>")
                            .css({'float': 'right', 'margin': '0 5px'})
                            .dxButton({
                                text: "연도별 기준수가",
                                onClick: function () {
                                    let hospitalId = cellInfo.data.collapsedItems[0].hospitalId;
                                    location.href = '<c:url value="/hm/hospital/0/checkup/2021"/>';
                                }
                            }).appendTo(cellElement);
                        $("<div class='blue'>")
                            .css({'float': 'right', 'margin': '0 5px'})
                            .dxButton({
                                text: "센터 등록",
                                onClick: function () {
                                    let hospitalId = cellInfo.data.collapsedItems[0].hospitalId;
                                    location.href = '<c:url value="/hm/center/0/create"/>';
                                }
                            }).appendTo(cellElement);
                        $("<div class='orange'>")
                            .css({'float': 'right', 'margin': '0 5px'})
                            .dxButton({
                                text: "계약 기업",
                                onClick: function () {
                                    let hospitalId = cellInfo.data.collapsedItems[0].hospitalId;
                                    location.href = '<c:url value="/hm/hospital/0/hcontract"/>';
                                }
                            }).appendTo(cellElement);
                    }
                },
            }, {
                dataField: 'centerName',
                caption: '센터명',
                cellTemplate: function (cellElement, cellInfo) {
                    let centerId = cellInfo.row.data.centerId;
                    <%--cellElement.append('<a href = ' + '<c:url value="/hm/center"/>/' + centerId + '>' + cellInfo.text + '</a>');--%>
                    cellElement.append('<a href = ' + '<c:url value="/hm/center"/>/' + centerId + '>' + cellInfo.data.centerName + '</a>');
                },
            }, {
                caption: '특수검진 가능병원',
                dataField: 'ableSpecial',
                lookup: {
                    dataSource: [
                        {id: false, text: ''},
                        {id: true, text: '특수검진 가능'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                type: 'buttons',
                caption: '병원홍보',
                buttons: [{
                    name: 'hospitalInfo',
                    text: '병원홍보',
                    onClick: function (e) {
                        let hospital = e.row.data;
                        location.href = '<c:url value="/hm/center"/>/' + hospital.centerId + '/info';
                    }
                }],
            }, {
                type: 'buttons',
                caption: '예약불가',
                buttons: [{
                    name: 'reserveLimit',
                    text: '예약불가',
                    onClick: function (e) {
                        let hospital = e.row.data;
                        location.href = '<c:url value="/hm/day-off"/>?' + $.param({
                            centerId: hospital.centerId,
                        });
                    },
                }],
            }, {
                type: 'buttons',
                caption: '수정',
                buttons: [{
                    name: 'hospitalDetail',
                    text: '수정',
                    method: 'PUT',
                    onClick: function (e) {
                        let hospital = e.row.data;
                        location.href = '<c:url value="/hm/center"/>/' + hospital.centerId + '/edit';
                    }
                }]
            }],
        });

        $.ajax({
            url: '<c:url value="/hm/hospital"/>',
            method: 'GET',
        }).then(function (response) {
            dxInstances.dataGridHospital.option({
                dataSource: response.data,
            });
        });
    });

</script>
</html>
