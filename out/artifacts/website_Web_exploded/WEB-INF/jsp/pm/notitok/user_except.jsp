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
                            <h3 class="h3">Î∞úÏÜ° ?úÏô∏??Î™©Î°ù(Í≥†Í∞ù??</h3>
                        </div>
                    </div>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap2">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>Í∏∞ÏóÖ</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectCompany"
                                                     data-sitebuilder="dxLookup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>?àÎÇ¥?úÏô∏</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectState" data-sitebuilder="dxSelectBox"></div>
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

                        <div class="row">
                            <div id="dxGridUserExceptList" class="main_table" data-sitebuilder="dxDataGrid"></div>
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
        sitebuilder.openMenu('userExcept');
        let dxInstances = sitebuilder.createDx(false);

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
            placeholder: "?åÏÇ¨Î•??†ÌÉù?¥Ï£º?∏Ïöî.",
            onValueChanged: function () {
                LoadUserExceptList();
            }
        });

        dxInstances.selectState.option({
            placeholder: "?êÌïò?úÎäî ?àÎÇ¥ ?úÏô∏Î•??†ÌÉù?òÏÑ∏??",
            items: [
                {'id': 0, 'text': '?ÑÏ≤¥'},
                {'id': 1, 'text': 'Í≤ÄÏßÑÏã§?úÏïà???úÏô∏'},
                {'id': 2, 'text': '?àÏïΩ?àÎÇ¥ ?úÏô∏'},
                {'id': 3, 'text': 'ÎØ∏Ïòà?ΩÎèÖ?§Ïïà???úÏô∏'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function (data) {
                if (data.value === 0) {
                    dxInstances.dxGridUserExceptList.clearFilter();
                    sitebuilder.notify("?ÑÏ≤¥ Î™©Î°ù?ÖÎãà??");
                } else if (data.value === 1) {
                    dxInstances.dxGridUserExceptList.filter(["notokGuide", "=", 1]);
                    sitebuilder.notify("?†ÌÉù?òÏã† ?àÎÇ¥ ?úÏô∏Î•??¨Ìï®??Î™©Î°ù?ÖÎãà??");
                } else if (data.value === 2) {
                    dxInstances.dxGridUserExceptList.filter(["notokReserve", "=", 1]);
                    sitebuilder.notify("?†ÌÉù?òÏã† ?àÎÇ¥ ?úÏô∏Î•??¨Ìï®??Î™©Î°ù?ÖÎãà??");
                } else if (data.value === 3) {
                    dxInstances.dxGridUserExceptList.filter(["notokUrge", "=", 1]);
                    sitebuilder.notify("?†ÌÉù?òÏã† ?àÎÇ¥ ?úÏô∏Î•??¨Ìï®??Î™©Î°ù?ÖÎãà??");
                }
            }
        });

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
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
                caption: '?úÎ≤à',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: "employeeName",
                caption: "Í≤ÄÏßÑÏûêÎ™?,
                cellTemplate: function (cellElement, cellInfo) {
                    let employeeCheckupId = cellInfo.data.employeeCheckupId;
                    cellElement.append("<a href = " + '<c:url value="/pm/employee"/>/' + employeeCheckupId + ">" + cellInfo.text + "</a>");
                    if (cellInfo.data.vip === true) {
                        cellElement.append('   *' + 'vip' + '*');
                    }
                },
            }, {
                dataField: "birth",
                caption: "?ùÎÖÑ?îÏùº",
                dataType: 'date',
            }, {
                dataField: "sex",
                caption: "?±Î≥Ñ",
            }, {
                dataField: "depart",
                caption: "Î∂Ä??,
            }, {
                dataField: "title",
                caption: "ÏßÅÏ±Ö",
            }, {
                dataField: "myself",
                caption: "?Ä?ÅÏûê",
                lookup: {
                    dataSource: [
                        {id: 1, text: 'Î≥∏Ïù∏'},
                        {id: null, text: 'Í∞ÄÏ°?},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                dataField: "employeeNo",
                caption: "?¨Î≤à",
            }, {
                dataField: "mobile",
                caption: "?¥Î??ÑÌôîÎ≤àÌò∏",
                format: function (value) {
                    return sitebuilder.phoneWithHyphen(value);
                }
            }, {
                dataField: "email",
                caption: "?¥Î©î??,
            }, {
                dataField: "employeeCode",
                caption: "ID",
            }, {
                dataField: 'notokGuide',
                caption: 'Í≤ÄÏßÑÏã§???úÏô∏',
                width: 100,
            }, {
                dataField: 'notokReserve',
                caption: '?àÏïΩ?àÎÇ¥ ?úÏô∏',
                width: 100,
            }, {
                dataField: 'notokUrge',
                caption: 'ÎØ∏Ïòà?ΩÎèÖ???úÏô∏',
                width: 100,
            }, {
                dataField: "notokUpdatedAt",
                caption: "Î∞úÏÜ° ?úÏô∏ ?±Î°ù??,
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
