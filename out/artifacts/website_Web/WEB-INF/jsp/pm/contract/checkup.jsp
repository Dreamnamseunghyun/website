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
                            <h3 class="h3">Í≤ÄÏß??†Ìòï Î™©Î°ù</h3>
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
                                            <div class="col-lg-5 tag-name"><span>?Ä???ÑÎèÑ</span></div>
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

                        <div id="dataGridCheckupTypeList" class="main_table" data-sitebuilder="dxDataGrid">
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
        sitebuilder.openMenu('contract-checkup');

        /** @param dxInstances : {dataGridCheckupTypeList} */
        let dxInstances = sitebuilder.createDx(false);

        dxInstances.checkupYear.option({
            dataSource: sitebuilder.typeDef.Year,
            value: new Date().getFullYear(),
            onValueChanged: LoadContractCheckupList,
        });

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
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
                caption: 'Í∏∞ÏóÖÏ≤¥Î™Ö',
                dataField: 'companyName',
                groupIndex: 0,
            }, {
                caption: 'ÏßÑÌñâÎ≥ëÏõê(?ºÌÑ∞)',
                groupIndex: 1,
                dataField: 'hospitalCenterName',
                groupCellTemplate: function (cellElement, cellInfo) {
                    $('<span>')
                        .text(cellInfo.data.key)
                        .appendTo(cellElement);
                    $("<div>")
                        .css({'float': 'right'})
                        .dxButton({
                            text: "?±Î°ù",
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
                caption: 'Í≤ÄÏßÑÏú†??,
                alignment: 'center',
            }, {
                dataField: 'companyCheckupTypeName',
                caption: 'Í≤ÄÏßÑÏú†?ïÎ™Ö',
                alignment: 'center',
            }, {
                dataField: 'subTypeName',
                caption: '?∏Î??†ÌòïÎ™?,
                alignment: 'center',
            }, {
                dataField: 'hospitalPay',
                caption: 'Î≥ëÏõêÏ≤?µ¨??,
                alignment: 'center',
                format: {
                    type: "fixedPoint",
                }
            }, {
                dataField: 'upgradePay',
                caption: '?ÖÍ∑∏?àÏù¥?úÌòï Î≥∏Ïù∏Î∂Ä?¥Ïï°',
                alignment: 'center',
                format: {
                    type: "fixedPoint",
                }
            }, {
                type: 'buttons',
                caption: 'Í≤Ä?¨Ïú†??,
                buttons: [{
                    name: 'detail',
                    text: '?ÅÏÑ∏',
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
