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
                            <h3 class="h3">회원 목록</h3>
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
                                            <div class="col-lg-4 tag-name"><span>대상년도</span></div>
                                            <div class="col-lg-8 row period">
                                                <div class="col-lg-12" id="selectCheckupYear"
                                                     data-ggsj="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2" style="display: none" id="employeeCheckup.companyCheckupId"
                                         data-ggsj="dxTextBox"></div>
                                    <div class="col-lg-2" style="display: none" id="companyId"
                                         data-ggsj="dxTextBox"></div>
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

                        <div id="dataGridEmployee" class="main_table" data-ggsj="dxDataGrid">
                        </div>
                    </div>
                    <%--</div>--%>
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
                            <span>개별 등록</span>
                        </div>
                    </div>
                    <div id="btnExcel" data-ggsj="dxButton"><i class="fa fa-file-excel"></i>Excel 등록</div>
                </div>
            </div>
        </div>


    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        ggsj.openMenu('employee');

        /** @param dxInstances : {dataGridEmployee,btnCreate,btnExcel} */
        let dxInstances = ggsj.createDx(false);

        function LoadEmployeeList() {
            // Lookup CheckupTypeList
            let ajaxCheckupTypeList = $.ajax({
                url: '<c:url value="/common/companycheckuptype"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    // companyId: dxInstances.lookupCompany.option('value'),
                    checkupYear: dxInstances.selectCheckupYear.option('value'),
                }
            });

            // EmployeeList
            let ajaxEmployeeList = $.ajax({
                url: '<c:url value="/cm/employee"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    checkupYear: dxInstances.selectCheckupYear.option('value'),
                }
            });

            $.when(ajaxCheckupTypeList, ajaxEmployeeList).then(function (responseCheckupTypeList, responseEmployeeList) {
                // console.log(responseEmployeeList);
                dxInstances.dataGridEmployee.columnOption('employeeCheckup.companyCheckupTypeId', {
                    lookup: {
                        dataSource: responseCheckupTypeList[0].data,
                        valueExpr: 'companyCheckupTypeId',
                        displayExpr: function (item) {
                            return item && item.companyCheckupTypeCode + '. ' + item.companyCheckupTypeName;
                        },
                    },
                });

                dxInstances.dataGridEmployee.option({
                    dataSource: responseEmployeeList[0].data,
                });
            });
        }

        LoadEmployeeList();

        dxInstances.selectCheckupYear.option({
            dataSource: ggsj.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function () {
                LoadEmployeeList();
            }
        });

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            mode: 'search',
            onValueChanged: function (e) {
                dxInstances.dataGridEmployee.searchByText(e.value);
            },
        });

        dxInstances.dataGridEmployee.option({
            sorting: {
                mode: 'multiple',
            },
            columns: [{
                caption: '순번',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                caption: '회원번호',
                alignment: 'center',
                dataField: 'userId',
            }, {
                caption: '이름',
                alignment: 'center',
                dataField: 'employeeName',
                cellTemplate: function (cellElement, cellInfo) {
                    let employeeCheckupId = cellInfo.data.employeeCheckup.employeeCheckupId;
                    cellElement.append("<a href = " + '<c:url value="/cm/employee"/>/' + employeeCheckupId + ">" + cellInfo.text + "</a>");
                    if (cellInfo.data.employeeCheckup.vip === true) {
                        cellElement.append('<span style="color:red; font-weight: bold;">ⓥ</span>');
                    }
                },
            }, {
                caption: '생년월일',
                alignment: 'center',
                dataField: 'birth',
                dataType: 'date',
            }, {
                caption: '성별',
                alignment: 'center',
                dataField: 'sex',
            }, {
                caption: '대상자',
                alignment: 'center',
                dataField: 'myself',
                lookup: {
                    dataSource: [
                        {id: 1, text: '본인'},
                        {id: 2, text: '가족'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                caption: '검진비 청구',
                alignment: 'center',
                dataField: 'employeeCheckup.supportType',
                lookup: {
                    dataSource: [
                        {id: '0', text: '기업부담'},
                        {id: '1', text: '본인부담'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                caption: 'ID',
                alignment: 'center',
                dataField: 'employeeCode',
            }, {
                caption: '휴대전화',
                alignment: 'center',
                dataField: 'mobile',
                format: function (value) {
                    return ggsj.phoneWithHyphen(value);
                }
            }, {
                caption: '검진유형',
                alignment: 'center',
                dataField: 'employeeCheckup.companyCheckupTypeId',
                cellTemplate: function (cellElement, cellInfo) {
                    let companyCheckupTypeName = cellInfo.data.employeeCheckup.companyCheckupTypeName;
                    let companyCheckupTypeCode = cellInfo.data.employeeCheckup.companyCheckupTypeCode;
                    cellElement.append(companyCheckupTypeCode, '.', companyCheckupTypeName);
                },
            }, {
                caption: '사용여부',
                alignment: 'center',
                dataField: 'noUse',
                lookup: {
                    dataSource: [
                        {id: false, text: 'Y'},
                        {id: true, text: 'N'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                caption: '수정',
                type: 'buttons',
                buttons: [{
                    name: 'detail',
                    text: '수정',
                    onClick: function (e) {
                        let user = e.row.data;
                        location.href = '<c:url value="/cm/employee"/>/' + user.employeeCheckup.employeeCheckupId + '/edit';
                    },
                }
                ]
            },],
        });

        // Create
        dxInstances.btnCreate.option({
            stylingMode: 'outlined',
            text: '개별등록',
            type: 'success',
            icon: 'group',
            onClick: function () {
                location.href = '<c:url value="/cm/employee/create"/>'
            },
        });

        // Excel
        dxInstances.btnExcel.option({
            stylingMode: 'outlined',
            text: '엑셀등록',
            type: 'danger',
            icon: 'xlsxfile',
            onClick: function () {
                location.href = '<c:url value="/cm/employee/batch"/>'
            },
        });
    });
</script>
</html>
