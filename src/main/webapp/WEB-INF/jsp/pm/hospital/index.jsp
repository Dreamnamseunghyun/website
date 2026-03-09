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

                <div class="row btn_area index_btn_area footer-btn">
                    <div id="btnCreate" data-ggsj="dxButton">
                        <div class="write_btn">
                            <div>
                                <div class="pencil"></div>
                                <div class="folder">
                                    <div class="top">
                                        <svg viewBox="0 0 24 27">
                                            <path d="M1,0 L23,0 C23.5522847,-1.01453063e-16 24,0.44771525 24,1 L24,8.17157288 C24,8.70200585 23.7892863,9.21071368 23.4142136,9.58578644 L20.5857864,12.4142136 C20.2107137,12.7892863 20,13.2979941 20,13.8284271 L20,26 C20,26.5522847 19.5522847,27 19,27 L1,27 C0.44771525,27 6.76353751e-17,26.5522847 0,26 L0,1 C-6.76353751e-17,0.44771525 0.44771525,1.01453063e-16 1,0 Z"></path>
                                        </svg>
                                    </div>
                                    <div class="paper"></div>
                                </div>
                            </div>
                            <span>병원 등록</span>
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
        ggsj.openMenu('hospital');

        let dxInstances = ggsj.createDx(false);

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
            //columnAutoWidth: true,
            //allowColumnReordering: true,
            columns: [
                {
                    caption: '병원명',
                    groupIndex: 0,
                    dataField: 'hospitalId',
                    calculateDisplayValue: 'hospitalName',
                    groupCellTemplate: function (cellElement, cellInfo) {
                        $('<span>')
                            .html(cellInfo.text)
                            .appendTo(cellElement);

                        if (cellInfo.data.items === null || cellInfo.data.items.length === 0) {
                            return;
                        }

                        let hospitalId = cellInfo.data.items[0].hospitalId;

                        $("<div class='green'>")
                            .css({'float': 'right', 'margin': '0 5px'})
                            .dxButton({
                                text: "연도별 기준수가",
                                onClick: function () {
                                    location.href = '<c:url value="/pm/hospital"/>/' + hospitalId + '/checkup/2022';
                                }
                            }).appendTo(cellElement);
                        $("<div class='blue'>")
                            .css({'float': 'right', 'margin': '0 5px'})
                            .dxButton({
                                text: "센터 등록",
                                onClick: function () {
                                    location.href = '<c:url value="/pm/center"/>/' + hospitalId + '/create';
                                }
                            }).appendTo(cellElement);
                        $("<div class='orange'>")
                            .css({'float': 'right','margin':'0 5px'})
                            .dxButton({
                                text: "계약 기업",
                                onClick: function () {
                                    location.href = '<c:url value="/pm/hospital"/>/' + hospitalId + '/hcontract';
                                }
                            }).appendTo(cellElement);
                    },
                }, {
                    caption: '병원명',
                    dataField: 'hospitalName',
                    visible: false,
                }, {
                    caption: null,
                    dataField: null,
                    allowEditing: false,
                    allowHeaderFiltering: false,
                    allowGrouping: false,
                    allowResizing: false,
                    allowSearch: false,
                    allowSorting: false,
                    width: 20,
                    visible: true,
                }, {
                    dataField: 'centerName',
                    caption: '센터명',
                    width: 300,
                    cellTemplate: function (cellElement, cellInfo) {
                        let centerId = cellInfo.row.data.centerId;

                        cellElement.append('<a href = ' + '<c:url value="/pm/center"/>/' + centerId + '>' + cellInfo.data.centerName + '</a>');
                    },
                }, {
                    caption: '특수검진 가능병원',
                    dataField: 'ableSpecial',
                    alignment: 'center',
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
                            location.href = '<c:url value="/pm/center"/>/' + hospital.centerId + '/info';
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
                            location.href = '<c:url value="/pm/day-off"/>?' + $.param({
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
                            location.href = '<c:url value="/pm/center"/>/' + hospital.centerId + '/edit';
                        }
                    }]
                }],
        });
        dxInstances.btnCreate.option({
            stylingMode: 'outlined',
            icon: 'comment',
            text: '등록',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/hospital/create"/>';
            }
        });

        $.ajax({
            url: '<c:url value="/pm/hospital"/>',
            method: 'GET',
        }).then(function (response) {
            console.log(response)
            dxInstances.dataGridHospital.option({
                dataSource: response.data,
            });
        });
    });

</script>
</html>
