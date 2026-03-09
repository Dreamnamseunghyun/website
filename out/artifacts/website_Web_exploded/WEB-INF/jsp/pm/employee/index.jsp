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
                            <h3 class="h3">?åÏõê Î™©Î°ù</h3>
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
                                            <div class="col-lg-4 tag-name"><span>Í∏∞ÏóÖÏ≤¥Î™Ö</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="lookupCompany"
                                                     data-sitebuilder="dxLookup"></div>
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
                                            <div class="col-lg-4 tag-name"><span>?Ä?ÅÎÖÑ??/span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectCheckupYear" data-sitebuilder="dxSelectBox"></div>
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

                        <div id="dataGridEmployee" class="main_table" data-sitebuilder="dxDataGrid">
                        </div>
                    </div>
                    <%--</div>--%>
                </div>

                <div class="row btn_area index_btn_area footer-btn">
                    <div id="btnCreate" data-sitebuilder="dxButton">
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
                            <span>Í∞úÎ≥Ñ ?±Î°ù</span>
                        </div>
                    </div>
                    <div id="btnExcel" data-sitebuilder="dxButton"><i class="fa fa-file-excel"></i>Excel ?±Î°ù</div>
                </div>
            </div>
        </div>


    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        sitebuilder.openMenu('employee');

        /** @param dxInstances : {dataGridEmployee,btnCreate,btnExcel} */
        let dxInstances = sitebuilder.createDx(false);

        function LoadEmployeeList() {
            // Lookup CheckupTypeList
            let ajaxCheckupTypeList = $.ajax({
                url: '<c:url value="/common/companycheckuptype"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    companyId: dxInstances.lookupCompany.option('value'),
                    checkupYear: dxInstances.selectCheckupYear.option('value'),
                }
            });

            // EmployeeList
            let ajaxEmployeeList = $.ajax({
                url: '<c:url value="/pm/employee"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    companyId: dxInstances.lookupCompany.option('value'),
                    checkupYear: dxInstances.selectCheckupYear.option('value'),
                }
            });

            $.when(ajaxCheckupTypeList, ajaxEmployeeList).then(function (responseCheckupTypeList, responseEmployeeList) {
                //console.log(responseCheckupTypeList);
                //console.log(responseEmployeeList);

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

        dxInstances.lookupCompany.option({
            valueExpr: 'companyId',
            displayExpr: 'companyName',
            dropDownOptions: {
                closeOnOutsideClick: true,
                showTitle: false,
            },
            searchEnabled: true,
            searchExpr: 'companyName',
            searchMode: 'contains',
            searchTimeout: 100,
            onValueChanged: function () {
                LoadEmployeeList();
            }
        });

        dxInstances.selectCheckupYear.option({
            dataSource: sitebuilder.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function () {
                LoadEmployeeList();
            }
        });

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
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
                caption: '?úÎ≤à',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                caption: '?åÏõêÎ≤àÌò∏',
                alignment: 'center',
                dataField: 'userId',
            }, {
                caption: 'Í∏∞ÏóÖÎ™?,
                alignment: 'center',
                dataField: 'companyName',
            }, {
                caption: '?¥Î¶Ñ',
                alignment: 'center',
                dataField: 'employeeName',
                //sortIndex : 1,
                //sortOrder : 'asc',
                cellTemplate: function (cellElement, cellInfo) {
                    let employeeCheckupId = cellInfo.data.employeeCheckup.employeeCheckupId;
                    cellElement.append("<a href = " + '<c:url value="/pm/employee"/>/' + employeeCheckupId + ">" + cellInfo.text + "</a>");
                    if (cellInfo.data.employeeCheckup.vip === true) {
                        cellElement.append('<span style="color:red; font-weight: bold;">??/span>');
                    }
                },
            }, {
                caption: '?ùÎÖÑ?îÏùº',
                alignment: 'center',
                dataField: 'birth',
                dataType: 'date',
            }, {
                caption: '?±Î≥Ñ',
                alignment: 'center',
                dataField: 'sex',
            }, {
                caption: '?Ä?ÅÏûê',
                alignment: 'center',
                dataField: 'myself',
                lookup: {
                    dataSource: [
                        {id: 1, text: 'Î≥∏Ïù∏'},
                        {id: 2, text: 'Í∞ÄÏ°?},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
                //sortIndex : 0,
                //sortOrder : 'asc',
            }, {
                caption: 'Í≤ÄÏßÑÎπÑ Ï≤?µ¨',
                alignment: 'center',
                dataField: 'employeeCheckup.supportType',
                lookup: {
                    dataSource: [
                        {id: '0', text: 'Í∏∞ÏóÖÎ∂Ä??},
                        {id: '1', text: 'Î≥∏Ïù∏Î∂Ä??},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                caption: 'ID',
                alignment: 'center',
                dataField: 'employeeCode',
            }, {
                caption: '?¥Î??ÑÌôî',
                alignment: 'center',
                dataField: 'mobile',
                format: function (value) {
                    return sitebuilder.phoneWithHyphen(value);
                }
            }, {
                caption: 'Í≤ÄÏßÑÏú†??,
                alignment: 'center',
                dataField: 'employeeCheckup.companyCheckupTypeId',
            }, {
                caption: '?¨Ïö©?¨Î?',
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
                caption: '?òÏ†ï',
                type: 'buttons',
                buttons: [{
                    name: 'detail',
                    text: '?òÏ†ï',
                    onClick: function (e) {
                        let user = e.row.data;
                        location.href = '<c:url value="/pm/employee"/>/' + user.employeeCheckup.employeeCheckupId + '/edit';
                    },
                }
                ]
            },],
        });

        // Create
        dxInstances.btnCreate.option({
            stylingMode: 'outlined',
            text: 'Í∞úÎ≥Ñ?±Î°ù',
            type: 'success',
            icon: 'group',
            onClick: function () {
                location.href = '<c:url value="/pm/employee/create"/>'
            },
        });

        // Excel
        dxInstances.btnExcel.option({
            stylingMode: 'outlined',
            text: '?ëÏ??±Î°ù',
            type: 'danger',
            icon: 'xlsxfile',
            onClick: function () {
                location.href = '<c:url value="/pm/employee/batch"/>'
            },
        });

        // Load
        let ajaxCompanyList = $.ajax({
            url: '<c:url value="/common/company?listType=LAST_ALL"/>',
        });

        $.when(ajaxCompanyList).then(function (responseCompanyList) {
            // Company List
            let companyList = responseCompanyList.data;
            companyList.unshift({companyId: 0, companyName: '?ÑÏ≤¥'});

            dxInstances.lookupCompany.option({
                dataSource: companyList,
            });

        });

        <c:if test="${companyId != null}">
        dxInstances.lookupCompany.option({value: <c:out value="${companyId}"/>});

        <c:if test="${checkupYear != null}">
        dxInstances.selectCheckupYear.option({value: <c:out value="${checkupYear}"/>});
        </c:if>

        LoadEmployeeList();
        </c:if>
    });
</script>
</html>
