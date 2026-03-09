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
                            <h3 class="h3">엑셀 회원등록</h3>
                        </div>
                    </div>
                    <%--<div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">

                            <div class="row-wrap left row-btn">
                                <div class="row-box" style="width:400px;">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-5 tag-name"><span>기업체</span></div>
                                            <div class="col-lg-7" id="lookupCompany" data-ggsj="dxLookup"
                                                 style="width: 250px"></div>
                                        </div>

                                    </div>

                                </div>

                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12">
                                                <div class="btnExcelSample" id="btnSampleDown"
                                                     data-ggsj="dxButton"></div>
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

                        <div id="dataGridEmployeeBatch" class="main_table" data-ggsj="dxDataGrid">
                        </div>

                        <input style="display: none" id="openFile" type="file">
                    </div>
                    <%--</div>--%>
                </div>

                <div class="row btn_area index_btn_area footer-btn">
                    <div id="btnSave" data-ggsj="dxButton"><i class="xi-save"></i>저장</div>
                    <div id="btnExcel" data-ggsj="dxButton"><i class="fa fa-file-excel"></i>Excel 등록</div>
                </div>

            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        ggsj.openMenu('employee-batch');

        /** @param dxInstances : {dataGridEmployeeBatch,btnSampleDown,btnSave,btnExcel} */
        let dxInstances = ggsj.createDx(false);
        let keyCompanyId;
        let keyCheckupYear;
        let keyCompanyCheckupId;

        let dsCheckupTypeList;
        let dsEmployeeList;
        let dsEmployeeSelfList;

        let inputOpenFile = $('#openFile');

        function LoadEmployeeList() {
            // Lookup CheckupTypeList
            let ajaxCheckupTypeList = $.ajax({
                url: '<c:url value="/common/companycheckuptype"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    companyId: keyCompanyId,
                    checkupYear: keyCheckupYear,
                }
            });

            // EmployeeList
            let ajaxEmployeeList = $.ajax({
                url: '<c:url value="/pm/employee"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    companyId: keyCompanyId,
                    checkupYear: keyCheckupYear,
                }
            });

            $.when(ajaxCheckupTypeList, ajaxEmployeeList).then(function (responseCheckupTypeList, responseEmployeeList) {
                //console.log(responseCheckupTypeList);
                //console.log(responseEmployeeList);

                dsCheckupTypeList = responseCheckupTypeList[0].data;
                dsEmployeeList = responseEmployeeList[0].data;

                dsEmployeeSelfList = dsEmployeeList.filter(function isMyself(item) {
                    return item.myself === 1;
                });

                function getDisplayEmployeeBatchCheckupName(item) {
                    return item && item.companyCheckupTypeCode + '. ' + item.companyCheckupTypeName;
                }

                dxInstances.dataGridEmployeeBatch.columnOption('employeeCheckup.companyCheckupTypeId', {
                    lookup: {
                        dataSource: dsCheckupTypeList,
                        valueExpr: 'companyCheckupTypeId',
                        displayExpr: getDisplayEmployeeBatchCheckupName,
                    },
                });

                dxInstances.dataGridEmployeeBatch.columnOption('employeeCodeFamily', {
                    lookup: {
                        dataSource: dsEmployeeSelfList,
                        valueExpr: 'employeeCode',
                        displayExpr: 'employeeName',
                    },
                });

                dxInstances.dataGridEmployeeBatch.option({
                    dataSource: dsEmployeeList,
                });

                dxInstances.btnExcel.option({
                    disabled: false,
                });
            });
        }

        function batchEmployee(resultEmployee) {
            let bFind;
            resultEmployee._crudType = 'INSERT';

            if (resultEmployee.myself === 1) {
                bFind = !!dsEmployeeList.find(function (employee) {
                    if (resultEmployee.employeeCode === employee.employeeCode) {
                        if (employee._crudType !== 'INSERT')
                            resultEmployee._crudType = 'UPDATE';

                        $.extend(employee, resultEmployee);
                        return true;
                    }
                });

                if (bFind === false) {
                    dsEmployeeList.push(resultEmployee);
                }
            } else {
                bFind = !!dsEmployeeList.find(function (employee) {
                    if (resultEmployee.employeeCode === employee.employeeCode && resultEmployee.employeeName === employee.employeeName) {
                        if (employee._crudType !== 'INSERT')
                            resultEmployee._crudType = 'UPDATE';
                        $.extend(employee, resultEmployee);
                        return true;
                    }
                });

                if (bFind === false) {
                    dsEmployeeList.push(resultEmployee);
                }
            }
        }

        function parseExcelEmployee() {
            let files = this.files || [];
            if (!files.length) return;

            let file = files[0];
            let reader = new FileReader();

            reader.onloadend = function () {
                let arrayBuffer = reader.result;
                let workbook = new ExcelJS.Workbook();

                workbook.xlsx.load(arrayBuffer).then(function (workbook) {
                        let sheet = workbook.worksheets[0];
                        let rowCount = sheet.rowCount;
                        for (let rowNumber = 1; rowNumber <= rowCount; rowNumber++) {
                            let row = sheet.getRow(rowNumber);

                            if (rowNumber < 2) {
                                continue;
                            }

                            // 빈 셀을 만나면 중단
                            if (!row.getCell(2).value || !row.getCell(3).value || !row.getCell(13).value) {
                                // Check Key Field
                                break;
                            }

                            let resultRow = {};
                            resultRow.employeeCheckup = {};

                            // Key
                            resultRow.companyId = keyCompanyId;
                            resultRow.employeeCheckup.companyCheckupId = keyCompanyCheckupId;

                            resultRow.employeeCode = row.getCell(2).value;
                            resultRow.employeeName = row.getCell(3).value;
                            resultRow.noUse = false;
                            resultRow.employeeNo = row.getCell(10).value;

                            resultRow.myself = parseInt(row.getCell(13).value);

                            resultRow.birth = new Date((row.getCell(4).value).replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));

                            if (isNaN(resultRow.birth)) {
                                resultRow.birth = new Date();
                                resultRow.birth.setUTCFullYear(1900, 0, 1);
                                resultRow.birth.setUTCHours(1, 0, 0);
                            }

                            resultRow.sex = row.getCell(5).value;
                            if (row.getCell(7).type === ExcelJS.ValueType.Hyperlink) // for HyperLink
                                resultRow.email = row.getCell(7).value.text;
                            else
                                resultRow.email = row.getCell(7).value;

                            resultRow.mobile = row.getCell(6).value;
                            if (resultRow.mobile !== null && resultRow.mobile !== undefined) {
                                resultRow.mobile = resultRow.mobile.replaceAll('-', '');
                            }

                            resultRow.depart = row.getCell(8).value;
                            resultRow.title = row.getCell(9).value;

                            resultRow.employeeCheckup.vip = row.getCell(11).value;
                            resultRow.employeeCheckup.vip = resultRow.employeeCheckup.vip === 'Y';
                            resultRow.employeeCheckup.supportType = parseInt(row.getCell(14).value) - 1;

                            // lookup checkupType
                            if (row.getCell(12).value === null) {
                                alert('*필수*\n검진유형이 누락되었습니다.\n등록하실 EXCEL 파일을 확인해주세요 !!');
                                break;
                            }
                            resultRow.employeeCheckup.companyCheckupTypeId = dsCheckupTypeList[0].companyCheckupTypeId; // default
                            dsCheckupTypeList.find(function (checkupType) {
                                if (checkupType.companyCheckupTypeCode === row.getCell(12).value) {
                                    resultRow.employeeCheckup.companyCheckupTypeId = checkupType.companyCheckupTypeId;
                                    return true;
                                }
                            });

                            resultRow.employeeCheckup.specialCheckup = row.getCell(16).value;
                            resultRow.employeeCheckup.specialCheckup = resultRow.employeeCheckup.specialCheckup === 'Y';

                            resultRow.employeeCheckup.specialCheckupMemo = row.getCell(17).value;
                            resultRow.employeeCheckup.notes = row.getCell(18).value;

                            batchEmployee(resultRow);
                        }

                        dxInstances.dataGridEmployeeBatch.option({
                            dataSource: dsEmployeeList,
                        });
                    }
                );
            };

            reader.readAsArrayBuffer(file);

            inputOpenFile.val('');
        }

        inputOpenFile.on('change', parseExcelEmployee);

        dxInstances.lookupCompany.option({
            displayExpr: function (item) {
                return item && item.companyName + ' (' + item.checkupYear + ')';
            },
            dropDownOptions: {
                closeOnOutsideClick: true,
                showTitle: false,
            },
            searchEnabled: true,
            searchExpr: 'companyName',
            searchMode: 'contains',
            searchTimeout: 100,
            onValueChanged: function (e) {
                keyCompanyId = e.value.companyId;
                keyCheckupYear = e.value.checkupYear;
                keyCompanyCheckupId = e.value.companyCheckupId;

                LoadEmployeeList();
            }
        });

        dxInstances.btnSampleDown.option({
            text: 'Excel 샘플 다운로드',
            onClick: function () {
                location.href = '<c:url value="/storage/template/employee-batch/EmployeeBatchTemplate.xlsx"/>';
            }
        });

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridEmployeeBatch.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridEmployeeBatch.option({
            dataSource: [],
            columns: [{
                caption: 'CRUD',
                dataField: '_crudType',
                visible: false,
            }, {
                caption: '회원번호',
                dataField: 'userId',
                alignment: 'center',
            }, {
                caption: 'ID',
                dataField: 'employeeCode',
                alignment: 'center',
            }, {
                dataField: 'employeeName',
                caption: '이름',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    let employeeCheckupId = cellInfo.data.employeeCheckup.employeeCheckupId;
                    cellElement.append("<a href = " + '<c:url value="/pm/employee"/>/' + employeeCheckupId + ">" + cellInfo.text + "</a>");
                },
            }, {
                caption: '생년월일',
                dataField: 'birth',
                alignment: 'center',
                dataType: 'date',
            }, {
                caption: '성별',
                dataField: 'sex',
                alignment: 'center',
            }, {
                caption: '휴대전화',
                dataField: 'mobile',
                alignment: 'center',
                format: function (value) {
                    return ggsj.phoneWithHyphen(value);
                },
            }, {
                caption: '이메일',
                dataField: 'email',
            }, {
                caption: '부서',
                dataField: 'depart',
                alignment: 'center',
            }, {
                dataField: 'title',
                caption: '직책',
                alignment: 'center',
            }, {
                caption: '사원번호',
                dataField: 'employeeNo',
                alignment: 'center',
            }, {
                caption: 'VIP',
                dataField: 'employeeCheckup.vip',
                alignment: 'center',
                lookup: {
                    dataSource: [
                        {id: false, text: 'N'},
                        {id: true, text: 'Y'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                caption: '검진유형',
                dataField: 'employeeCheckup.companyCheckupTypeId',
                alignment: 'center',
            }, {
                caption: '대상자',
                dataField: 'myself',
                alignment: 'center',
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
                dataField: 'employeeCheckup.supportType',
                alignment: 'center',
                lookup: {
                    dataSource: [
                        {id: 0, text: '기업부담'},
                        {id: 1, text: '본인부담'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                caption: '직원명',
                dataField: 'employeeCode',
                alignment: 'center',
                name: 'employeeCodeFamily',
            }, {
                caption: '특검대상',
                dataField: 'employeeCheckup.specialCheckup',
                alignment: 'center',
                lookup: {
                    dataSource: [
                        {'id': false, 'text': 'N'},
                        {'id': true, 'text': 'Y'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                caption: '특수검진 유해물질',
                dataField: 'employeeCheckup.specialCheckupMemo',
                alignment: 'center',
            }, {
                caption: '특이사항',
                dataField: 'employeeCheckup.notes',
            }],
            onRowPrepared: function (e) {
                if (e.rowType === "data") {
                    if (e.data._crudType === 'INSERT') {
                        e.rowElement.find("td").css('background', '#ebb3af');
                    } else if (e.data._crudType === 'UPDATE') {
                        e.rowElement.find("td").css('background', '#cef2ca');
                    }
                }
            },
        });

        // Save
        dxInstances.btnSave.option({
            stylingMode: 'outlined',
            text: '저장',
            type: 'success',
            icon: 'save',
            onClick: function () {
                dxInstances.dataGridEmployeeBatch.getDataSource().store().load().done(function (data) {
                    let changes = data.filter(function (item) {
                        return item._crudType !== 'SELECT';
                    });

                    //console.log(changes);
                    if (changes.length < 1) {
                        console.log('No Changes');
                        return;
                    }

                    $.ajax({
                        url: '<c:url value="/pm/employee/batch"/>',
                        method: 'POST',
                        cache: false,
                        dataType: 'json',
                        contentType: 'application/json',
                        data: JSON.stringify(changes),
                    }).then(function () {
                        ggsj.notify("저장되었습니다.");
                        LoadEmployeeList();
                    });

                });
            },
        });

        // Excel
        dxInstances.btnExcel.option({
            text: '엑셀첨부',
            stylingMode: 'outlined',
            type: 'danger',
            icon: 'xlsxfile',
            disabled: true,
            onClick: function () {
                inputOpenFile.trigger("click");
            },
        });

        // Load
        let ajaxCompanyList = {
            url: '<c:url value="/common/company?listType=ALL"/>',
        }

        $.when($.ajax(ajaxCompanyList)).then(function (responseCompanyList) {
            // Company List
            dxInstances.lookupCompany.option({
                dataSource: responseCompanyList.data,
            });
        });
    });


</script>
</html>
