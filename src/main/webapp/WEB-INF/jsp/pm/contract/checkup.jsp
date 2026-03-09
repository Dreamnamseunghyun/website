<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
                            <h3 class="h3">검진 유형 목록</h3>
                        </div>
                    </div>
                    <%--<div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">

                            <div class="row-wrap left">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-5 tag-name"><span>대상 년도</span></div>
                                            <div class="col-lg-7" id="checkupYear" data-ggsj="dxSelectBox"></div>
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

                        <div id="dataGridCheckupTypeList" class="main_table" data-ggsj="dxDataGrid">
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

        /** @param dxInstances : {dataGridCheckupTypeList} */
        let dxInstances = ggsj.createDx(false);

        dxInstances.checkupYear.option({
            dataSource: ggsj.typeDef.Year,
            value: new Date().getFullYear(),
            onValueChanged: LoadContractCheckupList,
        });

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridCheckupTypeList.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridCheckupTypeList.option({
            grouping: {
                autoExpandAll: false,
            },
            export: {enabled: false},
            stateStoring: {
                enabled: false,
            },
            columns: [{
                caption: '기업체명',
                dataField: 'companyName',
                groupIndex: 0,
            }, {
                caption: '진행병원(센터)',
                groupIndex: 1,
                dataField: 'hospitalCenterName',
                groupCellTemplate: function (cellElement, cellInfo) {
                    $('<span>')
                        .text(cellInfo.data.key)
                        .appendTo(cellElement);
                    $("<div>")
                        .css({'float': 'right'})
                        .dxButton({
                            text: "등록",
                            onClick: function (e) {
                                location.href = '<c:url value="/pm/contract-checkup/create"/>?' + $.param({
                                    checkupContractId: cellInfo.data.items[0].checkupContractId,
                                    centerId: cellInfo.data.items[0].centerId,
                                });
                            }
                        }).appendTo(cellElement);
                },
            }, {
                dataField: 'companyCheckupTypeCode',
                caption: '검진유형',
                alignment: 'center',
            }, {
                dataField: 'companyCheckupTypeName',
                caption: '검진유형명',
                alignment: 'center',
            }, {
                dataField: 'subTypeName',
                caption: '세부유형명',
                alignment: 'center',
            }, {
                dataField: 'hospitalPay',
                caption: '병원청구액',
                alignment: 'center',
                format: {
                    type: "fixedPoint",
                }
            }, {
                dataField: 'upgradePay',
                caption: '업그레이드형 본인부담액',
                alignment: 'center',
                format: {
                    type: "fixedPoint",
                }
            }, {
                type: 'buttons',
                caption: '검사유형',
                buttons: [{
                    name: 'detail',
                    text: '상세',
                    visible: function (e) {
                        return e.row.data.checkupContractSubTypeId !== null;
                    },
                    onClick: function (e) {
                        location.href = '<c:url value="/pm/contract-checkup"/>/' + e.row.data.checkupContractSubTypeId;
                    },
                }],
            }],
        });

        function LoadContractCheckupList() {
            // Load
            let ajaxTypeList = {
                url: '<c:url value="/pm/contract-checkup"/>',
                data: {
                    checkupYear: dxInstances.checkupYear.option('value'),
                }
            };

            $.when($.ajax(ajaxTypeList)).then(function (resultList) {
                console.log(resultList.data);
                dxInstances.dataGridCheckupTypeList.option({
                    dataSource: resultList.data,
                });
            });
        }

        LoadContractCheckupList();
    });
</script>
</html>
