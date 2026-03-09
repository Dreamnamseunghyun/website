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
                            <h3 class="h3">기업 목록</h3>
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
                                            <div class="col-lg-5 tag-name"><span>?�?�년??/span></div>
                                            <div class="col-lg-7" id="checkupYear" data-sitebuilder="dxSelectBox"></div>
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

                        <div id="dataGridCompany" class="main_table" data-sitebuilder="dxDataGrid">
                        </div>
                    </div>


                    <%--                    </div>--%>
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
                            <span>기업 ?�록</span>
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
        sitebuilder.openMenu('company');

        /** @param dxInstances : {dataGridCompany} */

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.checkupYear.option({
            dataSource: [
                {id: 0, text: '최근'},
                {id: 2020, text: '2020'},
                {id: 2021, text: '2021'},
                {id: 2022, text: '2022'},
                {id: 2023, text: '2023'},
                {id: 2024, text: '2024'},
                {id: 2025, text: '2025'},
                {id: 2026, text: '2026'},
                {id: 2027, text: '2027'},
                {id: 2028, text: '2028'},
                {id: 2029, text: '2029'},
                {id: 2030, text: '2030'},
            ],
            value: 0,
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function (data) {
                selectCompany({checkupYear: data.value});
            }
        });

        dxInstances.searchGrid.option({
            placeholder: '검??,
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridCompany.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridCompany.option({
            paging: {
                enabled: false
            },
            pager: {
                visible: true,
                allowedPageSizes: 'all',
                showPageSizeSelector: false,
                showInfo: true,
                showNavigationButtons: false
            },
            columns: [{
                caption: '?�번',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'companyName',
                caption: '기업체명',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    let companyId = cellInfo.row.data.companyId;
                    let checkupYear = cellInfo.row.data.checkupYear;
                    cellElement.append('<a href = ' + '<c:url value="/pm/company"/>/' + checkupYear + '/' + companyId + '>' + cellInfo.text + '</a>');
                },
            }, {
                dataField: 'companyCheckup.checkupYear',
                caption: '?�?�년??,
                alignment: 'center',
                dataType: 'decimal',
            }, {
                dataField: 'companyCheckup.checkupDateBegin',
                caption: '검진시?�일',
                alignment: 'center',
                dataType: 'date',
            }, {
                dataField: 'companyCheckup.checkupDateEnd',
                caption: '검진종료일',
                alignment: 'center',
                dataType: 'date',
            }, {
                dataField: 'companyCheckup.reserveDateBegin',
                caption: '?�약?�작??,
                alignment: 'center',
                dataType: 'date',
            }, {
                dataField: 'companyCheckup.reserveDateEnd',
                caption: '?�약종료??,
                alignment: 'center',
                dataType: 'date',
            }, {
                dataField: 'name',
                caption: '기업 매니?�',
                cellTemplate: function (cellElement, cellInfo) {

                    let dsContractManager = cellInfo.row.data.contractManager;
                    let dsAccountManager = cellInfo.row.data.accountManager;
                    let dsResultManager = cellInfo.row.data.resultManager;

                    for (let i = 0; i < dsContractManager.length; i++) {
                        if (dsContractManager[i].companyManagerName !== null) {
                            cellElement.append('계약 : ', dsContractManager[i].companyManagerName, ' / ');
                            cellElement.append(sitebuilder.phoneWithHyphen(dsContractManager[i].mobile), ' / ');
                            cellElement.append(dsContractManager[i].email, '<br/>');
                        }
                    }

                    for (let i = 0; i < dsAccountManager.length; i++) {
                        if (dsAccountManager[i].companyManagerName !== null) {
                            cellElement.append('?�산 : ', dsAccountManager[i].companyManagerName, ' / ');
                            cellElement.append(sitebuilder.phoneWithHyphen(dsAccountManager[i].mobile), ' / ');
                            cellElement.append(dsAccountManager[i].email, '<br/>');
                        }
                    }

                    for (let i = 0; i < dsResultManager.length; i++) {
                        if (dsResultManager[i].companyManagerName !== null) {
                            cellElement.append('결과 : ', dsResultManager[i].companyManagerName, ' / ');
                            cellElement.append(sitebuilder.phoneWithHyphen(dsResultManager[i].mobile), ' / ');
                            cellElement.append(dsResultManager[i].email, '<br/>');
                        }
                    }
                },
            }, {
                type: 'buttons',
                caption: '진행병원',
                buttons: [{
                    name: 'contract',
                    text: '진행병원',
                    onClick: function (e) {
                        let company = e.row.data;
                        console.log(company);
                        location.href = '<c:url value="/pm/contract"/>/' + company.companyId;
                    },
                }]
            }, {
                type: 'buttons',
                caption: '?�규?�도?�록',
                buttons: [{
                    name: '',
                    text: '?�규?�도?�록',
                    onClick: function (e) {
                        let company = e.row.data;
                        console.log(company);
                        location.href = '<c:url value="/pm/company"/>/' + company.checkupYear + '/' + company.companyId + '/checkup/create';
                    },
                }]
            }, {
                type: 'buttons',
                caption: '?�정',
                buttons: [{
                    text: '?�정',
                    onClick: function (e) {
                        let company = e.row.data;
                        location.href = '<c:url value="/pm/company"/>/' + company.checkupYear + '/' + company.companyId + '/edit';
                    },
                }]
            }, {
                type: 'buttons',
                caption: '??��',
                buttons: [{
                    text: '??��',

                    onClick: function (e) {
                        if (confirm('?�말�???��?�시겠습?�까?')) {
                            let company = e.row.data;
                            $.ajax({
                                url: '<c:url value="/pm/company"/>/' + company.companyId,
                                method: 'DELETE',
                            }).then(function (response) {
                                console.log(response);
                                location.href = '<c:url value="/pm/company"/>';
                            });
                        }
                    }
                }]
            },],
        });

        dxInstances.btnCreate.option({
            type: "success",
            stylingMode: "outlined",
            text: "?�록",
            icon: "comment",
            onClick: function () {
                location.href = '<c:url value="/pm/company/create"/>';
            },
        });

        selectCompany();

        function selectCompany(data) {
            if (data === 0) {
                data = null;
            }
            $.ajax({
                url: '<c:url value="/pm/company"/>',
                method: 'GET',
                data: data,
            }).then(function (response) {
                dxInstances.dataGridCompany.option({
                    dataSource: response.data,
                });
            });
        }
    });
</script>


</html>
