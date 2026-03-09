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
                            <h3 class="h3">발송 제외자 목록(고객용)</h3>
                        </div>
                    </div>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap2">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>기업</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectCompany"
                                                     data-ggsj="dxLookup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>안내제외</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectState" data-ggsj="dxSelectBox"></div>
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

                        <div class="row">
                            <div id="dxGridUserExceptList" class="main_table" data-ggsj="dxDataGrid"></div>
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
        ggsj.openMenu('userExcept');
        let dxInstances = ggsj.createDx(false);

        dxInstances.selectCompany.option({
            // valueExpr: 'companyId',
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
            placeholder: "회사를 선택해주세요.",
            onValueChanged: function () {
                LoadUserExceptList();
            }
        });

        dxInstances.selectState.option({
            placeholder: "원하시는 안내 제외를 선택하세요.",
            items: [
                {'id': 0, 'text': '전체'},
                {'id': 1, 'text': '검진실시안내 제외'},
                {'id': 2, 'text': '예약안내 제외'},
                {'id': 3, 'text': '미예약독려안내 제외'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function (data) {
                if (data.value === 0) {
                    dxInstances.dxGridUserExceptList.clearFilter();
                    ggsj.notify("전체 목록입니다.");
                } else if (data.value === 1) {
                    dxInstances.dxGridUserExceptList.filter(["notokGuide", "=", 1]);
                    ggsj.notify("선택하신 안내 제외를 포함한 목록입니다.");
                } else if (data.value === 2) {
                    dxInstances.dxGridUserExceptList.filter(["notokReserve", "=", 1]);
                    ggsj.notify("선택하신 안내 제외를 포함한 목록입니다.");
                } else if (data.value === 3) {
                    dxInstances.dxGridUserExceptList.filter(["notokUrge", "=", 1]);
                    ggsj.notify("선택하신 안내 제외를 포함한 목록입니다.");
                }
            }
        });

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dxGridUserExceptList.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dxGridUserExceptList.option({
            export: {
                enabled: false
            },
            dataSource: [],
            columnAutoWidth: true,
            allowColumnReordering: true,
            columns: [{
                caption: '순번',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: "employeeName",
                caption: "검진자명",
                cellTemplate: function (cellElement, cellInfo) {
                    let employeeCheckupId = cellInfo.data.employeeCheckupId;
                    cellElement.append("<a href = " + '<c:url value="/pm/employee"/>/' + employeeCheckupId + ">" + cellInfo.text + "</a>");
                    if (cellInfo.data.vip === true) {
                        cellElement.append('   *' + 'vip' + '*');
                    }
                },
            }, {
                dataField: "birth",
                caption: "생년월일",
                dataType: 'date',
            }, {
                dataField: "sex",
                caption: "성별",
            }, {
                dataField: "depart",
                caption: "부서",
            }, {
                dataField: "title",
                caption: "직책",
            }, {
                dataField: "myself",
                caption: "대상자",
                lookup: {
                    dataSource: [
                        {id: 1, text: '본인'},
                        {id: null, text: '가족'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                dataField: "employeeNo",
                caption: "사번",
            }, {
                dataField: "mobile",
                caption: "휴대전화번호",
                format: function (value) {
                    return ggsj.phoneWithHyphen(value);
                }
            }, {
                dataField: "email",
                caption: "이메일",
            }, {
                dataField: "employeeCode",
                caption: "ID",
            }, {
                dataField: 'notokGuide',
                caption: '검진실시 제외',
                width: 100,
            }, {
                dataField: 'notokReserve',
                caption: '예약안내 제외',
                width: 100,
            }, {
                dataField: 'notokUrge',
                caption: '미예약독려 제외',
                width: 100,
            }, {
                dataField: "notokUpdatedAt",
                caption: "발송 제외 등록일",
                dataType: 'date',
            },],
        });

        //Load
        function LoadUserExceptList() {
            let ajaxUserExcept = {
                url: '<c:url value="/pm/user-except"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    companyId: dxInstances.selectCompany.option('value').companyId,
                    checkupYear: dxInstances.selectCompany.option('value').checkupYear,
                }
            };

            $.when($.ajax(ajaxUserExcept)).then(function (response) {
                console.log(response);
                dxInstances.dxGridUserExceptList.option({
                    dataSource: response.data,
                });
            });
        }

        let ajaxCompanyList = {
            url: '<c:url value="/common/company?listType=LAST_ALL"/>',
        }

        $.when($.ajax(ajaxCompanyList)).then(function (responseCompanyList) {
            // Company List
            dxInstances.selectCompany.option({
                dataSource: responseCompanyList.data,
            });
        });
    });
</script>
</html>
