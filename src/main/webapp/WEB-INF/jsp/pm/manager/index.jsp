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
                            <h3 class="h3">매니저 관리</h3>
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
                                            <div class="col-lg-4 tag-name"><span>매니저 구분</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectStatus"
                                                     data-ggsj="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2" style="display: none" id="employeeCheckup.companyCheckupId"
                                     data-ggsj="dxTextBox"></div>
                                <div class="col-lg-2" style="display: none" id="companyId" data-ggsj="dxTextBox"></div>

                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>로그인 가능</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectNoUse" data-ggsj="dxSelectBox"></div>
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

                        <div id="dataGridManager" class="main_table" data-ggsj="dxDataGrid">
                        </div>


                    </div>
                    <%--                    </div>--%>
                </div>

                <div class="row btn_area index_btn_area footer-btn">
                    <div id="btnCompanyManagerCreate" data-ggsj="dxButton">기업 매니저 등록</div>
                    <div id="btnHospitalManagerCreate" data-ggsj="dxButton">병원 매니저 등록
                    </div>
                    <div id="btnPlatformManagerCreate" data-ggsj="dxButton">총괄 매니저 등록
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
        ggsj.openMenu('manager');

        let dxInstances = ggsj.createDx(false);
        let centerManagerList = [];

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridManager.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.btnCompanyManagerCreate.option({
            stylingMode: 'contained',
            text: '기업매니저 등록',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/manager/companycreate"/>';
            }
        });

        dxInstances.btnHospitalManagerCreate.option({
            stylingMode: 'contained',
            text: '병원매니저 등록',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/manager/hospitalcreate"/>';
            }
        });

        dxInstances.btnPlatformManagerCreate.option({
            stylingMode: 'contained',
            text: '총괄매니저 등록',
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
                {'id': 0, 'text': '전체'},
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
                {'id': 'All', 'text': '전체'},
                {'id': false, 'text': '로그인 가능'},
                {'id': true, 'text': '로그인 중지'},
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
                caption: '소속',
                alignment: 'center',
            }, {
                dataField: 'managerCode',
                caption: 'ID',
                alignment: 'center',
            }, {
                dataField: 'managerName',
                caption: '담당자명',
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
                format: ggsj.phoneWithHyphen,
            }, {
                caption: '유선',
                dataField: 'telephone',
                alignment: 'center',
                format: ggsj.phoneWithHyphen,
            }, {
                dataField: 'email',
                caption: '이메일',
            }, {
                dataField: 'noUse',
                caption: '로그인 중지',
            }, {
                type: 'buttons',
                caption: '수정',
                buttons: [{
                    text: '수정',
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
