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
                            <h3 class="h3">매니?� 관�?/h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap2">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>매니?� 구분</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectStatus"
                                                     data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="display: none" id="employeeCheckup.companyCheckupId"
                                     data-sitebuilder="dxTextBox"></div>
                                <div class="col-lg-2" style="display: none" id="companyId" data-sitebuilder="dxTextBox"></div>

                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>로그??가??/span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectNoUse" data-sitebuilder="dxSelectBox"></div>
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

                        <div id="dataGridManager" class="main_table" data-sitebuilder="dxDataGrid">
                        </div>


                    </div>
                    <%--                    </div>--%>
                </div>

                <div class="row btn_area index_btn_area footer-btn">
                    <div id="btnCompanyManagerCreate" data-sitebuilder="dxButton">기업 매니?� ?�록</div>
                    <div id="btnHospitalManagerCreate" data-sitebuilder="dxButton">병원 매니?� ?�록
                    </div>
                    <div id="btnPlatformManagerCreate" data-sitebuilder="dxButton">총괄 매니?� ?�록
                    </div>


                </div>

            </div>
        </div>


    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    /** @param _dxInstances : {btnCompanyManagerCreate,btnHospitalManagerCreate,btnPlatformManagerCreate,selectStatus,dataGridManager} */
    $(function () {
        sitebuilder.openMenu('manager');

        let dxInstances = sitebuilder.createDx(false);
        let centerManagerList = [];

        dxInstances.searchGrid.option({
            placeholder: '검??,
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridManager.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.btnCompanyManagerCreate.option({
            stylingMode: 'contained',
            text: '기업매니?� ?�록',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/manager/companycreate"/>';
            }
        });

        dxInstances.btnHospitalManagerCreate.option({
            stylingMode: 'contained',
            text: '병원매니?� ?�록',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/manager/hospitalcreate"/>';
            }
        });

        dxInstances.btnPlatformManagerCreate.option({
            stylingMode: 'contained',
            text: '총괄매니?� ?�록',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/manager/platformcreate"/>';
            }
        });

        function SettingFilter() {
            let selectStatus = dxInstances.selectStatus.option('value');
            let selectNoUse = dxInstances.selectNoUse.option('value');

            //console.log('selectStatus' + selectStatus);
            //console.log('selectNoUse' + selectNoUse);

            if (selectStatus === 0 && selectNoUse === 'All') {
                dxInstances.dataGridManager.clearFilter();
            } else if (selectStatus !== 0 && selectNoUse === 'All') {
                dxInstances.dataGridManager.filter(['userType', '=', selectStatus]);
            } else if (selectStatus === 0 && selectNoUse !== 'All') {
                dxInstances.dataGridManager.filter(['noUse', '=', selectNoUse]);
            } else if (selectStatus !== 0 && selectNoUse !== 'All') {
                dxInstances.dataGridManager.filter(
                    ['userType', '=', selectStatus],
                    'and',
                    ['noUse', '=', selectNoUse]);
            }
        }

        dxInstances.selectStatus.option({
            dataSource: [
                {'id': 0, 'text': '?�체'},
                {'id': 'CM', 'text': '기업'},
                {'id': 'HM', 'text': '병원'},
                {'id': 'PM', 'text': '총괄'}
            ],
            value: 0,
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function () {
                SettingFilter();
            }
        });

        dxInstances.selectNoUse.option({
            dataSource: [
                {'id': 'All', 'text': '?�체'},
                {'id': false, 'text': '로그??가??},
                {'id': true, 'text': '로그??중�?'},
            ],
            value: 'All',
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function () {
                SettingFilter();
            }
        });


        dxInstances.dataGridManager.option({
            dataSource: {
                load: function () {
                    return $.ajax({
                        url: '<c:url value="/pm/manager"/>',
                        dataType: 'json',
                    });
                }
            },
            key: 'groupName',
            groupPanel: {
                visible: false,
            },
            paging: {
                pageSize: 'all'
            },
            columns: [{
                dataField: 'userType',
                caption: '구분',
                alignment: 'center',
                /*cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.value === 'PM') {
                        $('<span>')
                            .text('총괄')
                            .appendTo(cellElement);
                    }
                    if (cellInfo.value === 'CM') {
                        $('<span>')
                            .text('기업')
                            .appendTo(cellElement);
                    }
                    if (cellInfo.value === 'HM') {
                        $('<span>')
                            .text('병원')
                            .appendTo(cellElement);
                    }
                },*/
            }, {
                dataField: 'groupName',
                caption: '?�속',
                alignment: 'center',
            }, {
                dataField: 'managerCode',
                caption: 'ID',
                alignment: 'center',
            }, {
                dataField: 'managerName',
                caption: '?�당?�명',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {

                    switch (cellInfo.data.userType) {
                        case 'CM':
                            cellElement.append("<a href = " + '<c:url value="/pm/companymanager"/>' + '/' + cellInfo.data.userId + ">" + cellInfo.text + "</a>");
                            break;
                        case 'HM':
                            cellElement.append("<a href = " + '<c:url value="/pm/hospitalmanager"/>' + '/' + cellInfo.data.userId + ">" + cellInfo.text + "</a>");
                            break;
                        case 'PM':
                            cellElement.append("<a href = " + '<c:url value="/pm/pmmanager"/>' + '/' + cellInfo.data.userId + ">" + cellInfo.text + "</a>");
                            break;
                    }
                },
            }, {
                caption: 'H.P',
                dataField: 'mobile',
                alignment: 'center',
                format: sitebuilder.phoneWithHyphen,
            }, {
                caption: '?�선',
                dataField: 'telephone',
                alignment: 'center',
                format: sitebuilder.phoneWithHyphen,
            }, {
                dataField: 'email',
                caption: '?�메??,
            }, {
                dataField: 'noUse',
                caption: '로그??중�?',
            }, {
                type: 'buttons',
                caption: '?�정',
                buttons: [{
                    text: '?�정',
                    onClick: function (e) {
                        console.log(e);
                        let manager = e.row.data;
                        if (manager.userType === 'PM') {
                            console.log(manager);
                            location.href = '<c:url value="/pm/manager"/>/' + manager.userId + '/pmedit';
                        } else if (manager.userType === 'HM') {
                            console.log(manager);
                            location.href = '<c:url value="/pm/manager"/>/' + manager.userId + '/hospitaledit';
                        } else if (manager.userType === 'CM') {
                            console.log(manager);
                            location.href = '<c:url value="/pm/manager"/>/' + manager.userId + '/companyedit';
                        }
                    },
                }
                ]
            },
            ],
        });

        $.ajax({
            url: '<c:url value="/pm/centermanager"/>',
            method: 'GET',
        }).then(function (response) {
            centerManagerList = response.data;
            console.log(centerManagerList);
        });
    });
</script>
</html>
