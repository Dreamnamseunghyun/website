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
                            <h3 class="h3">怨꾩빟湲곗뾽</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap2">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>蹂묒썝紐?/span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="hospitalName" data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>??곷뀈??/span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectCheckupYear"
                                                     data-sitebuilder="dxSelectBox"></div>
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

                        <%-- checkup type dataGrid --%>
                        <div id="hcontractgrid" class="main_table" data-sitebuilder="dxDataGrid">
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">紐⑸줉</div>
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
        sitebuilder.openMenu('hospital');

        let dxInstances = sitebuilder.createDx(false);

        LoadHcontractList();

        dxInstances.searchGrid.option({
            placeholder: '寃??,
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.hcontractgrid.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.hcontractgrid.option({
            columnAutoWidth: true,
            allowColumnReordering: true,
            grouping: {
                autoExpandAll: true,
            },
            groupPanel: {
                visible: false
            },
            export: {
                enabled: true,
            },

            columns: [
                {
                    //湲곗뾽泥대챸
                    dataField: 'companyName',
                    caption: '湲곗뾽泥대챸',
                    alignment: 'center',
                    cellTemplate: function (cellElement, cellInfo) {
                        cellElement.append(cellInfo.row.data.companyName);
                    }
                }, {
                    dataField: 'centerName',
                    caption: '?쇳꽣紐?,
                    alignment: 'center',
                    // cellTemplate: function (cellElement, cellInfo) {
                    //     console.log(cellInfo);
                    // }
                }, {
                    dataField: 'checkupYear',
                    caption: '??곷뀈??,
                    alignment: 'center',
                    dataType: 'string',
                }, {
                    //蹂묒썝 留ㅻ땲?(?쇳꽣留ㅻ땲??蹂묒썝留ㅻ땲?? ?낅Т媛 ?섎돏 留ㅻ땲??놁쓬)
                    caption: '蹂묒썝 留ㅻ땲?',
                    alignment: 'center',
                    columns: [{
                        caption: '?곸뾽',
                        dataField: 'contractManagerNames',
                        alignment: 'center',
                        cellTemplate: function (cellElement, cellInfo) {
                            // console.log(cellInfo.data)
                            if (cellInfo.data.contractManagerName != null) {
                                cellElement.append(cellInfo.data.contractManagerName, '<br/>');
                                cellElement.append(cellInfo.data.contractManagerTelephone, '<br/>');
                                cellElement.append(cellInfo.data.contractManagerMobile, '<br/>');
                                cellElement.append(cellInfo.data.contractManagerEmail);
                            }
                        },
                    }, {
                        caption: '?덉빟',
                        dataField: 'reserveManagerNames',
                        alignment: 'center',
                        cellTemplate: function (cellElement, cellInfo) {
                            if (cellInfo.data.reserveManagerName != null) {
                                cellElement.append(cellInfo.data.reserveManagerName, '<br/>');
                                cellElement.append(cellInfo.data.reserveManagerTelephone, '<br/>');
                                cellElement.append(cellInfo.data.reserveManagerMobile, '<br/>');
                                cellElement.append(cellInfo.data.reserveManagerEmail);
                            }
                        },
                    }, {
                        caption: '寃곌낵',
                        dataField: 'resultManagerNames',
                        alignment: 'center',
                        cellTemplate: function (cellElement, cellInfo) {
                            if (cellInfo.data.resultManagerName != null) {
                                cellElement.append(cellInfo.data.resultManagerName, '<br/>');
                                cellElement.append(cellInfo.data.resultManagerTelephone, '<br/>');
                                cellElement.append(cellInfo.data.resultManagerMobile, '<br/>');
                                cellElement.append(cellInfo.data.resultManagerEmail);
                            }
                        },
                    }]
                }],
        });

        dxInstances.selectCheckupYear.option({
            dataSource: sitebuilder.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function () {
                LoadHcontractList();
            }
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '紐⑸줉',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/hm/hospital"/>';
            }
        });

        $.ajax({
            url: '<c:url value="/hm/hospital"/>',
            method: 'GET',
        }).then(function (response) {
            sitebuilder.valuesToDx(response.data);
            dxInstances.hospitalName.option({
                value: response.data[0].hospitalName,
                readOnly: true,
            })
        });

        function LoadHcontractList() {
            $.ajax({
                url: '<c:url value="/hm/hospital/0/hcontract"/>',
                method: 'GET',
                data: {
                    checkupYear: dxInstances.selectCheckupYear.option('value'),
                }
            }).then(function (response) {
                sitebuilder.valuesToDx(response.data);
                console.log(response.data)
                dxInstances.hcontractgrid.option({
                    dataSource: response.data
                });
            });
        }
    });
</script>
</html>
