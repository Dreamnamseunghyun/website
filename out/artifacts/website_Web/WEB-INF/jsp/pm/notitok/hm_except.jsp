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
                            <h3 class="h3">Î∞úÏÜ° ?úÏô∏??Î™©Î°ù(Î≥ëÏõê Îß§Îãà?Ä??</h3>
                        </div>
                    </div>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap2">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>Î≥ëÏõê</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectHospital"
                                                     data-sitebuilder="dxLookup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>?ºÌÑ∞</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectCenter" data-sitebuilder="dxSelectBox"></div>
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
                            <div id="dxGridHmExceptList" class="main_table" data-sitebuilder="dxDataGrid"></div>
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
        sitebuilder.openMenu('hmExcept');
        let dxInstances = sitebuilder.createDx(false);

        dxInstances.selectHospital.option({
            valueExpr: 'hospitalId',
            displayExpr: 'hospitalName',
            dropDownOptions: {
                closeOnOutsideClick: true,
                showTitle: false,
            },
            searchEnabled: true,
            searchExpr: 'hospitalName',
            searchMode: 'contains',
            searchTimeout: 100,
            placeholder: "Î≥ëÏõê???†ÌÉù?¥Ï£º?∏Ïöî.",
            onValueChanged: function (e) {
                LoadHmExceptList();
                let ajaxCenterList = {
                    url: '<c:url value="/common/centercheck"/>',
                    data: {
                        hospitalId: dxInstances.selectHospital.option('value'),
                    }
                };
                $.when($.ajax(ajaxCenterList)).then(function (responseCenterList) {
                    // Center List
                    responseCenterList.data.unshift({centerId: null, centerName: '?ÑÏ≤¥'});
                    dxInstances.selectCenter.option({
                        dataSource: responseCenterList.data,
                        disabled: false,
                    });
                });
                if (e.value !== null) {
                    dxInstances.selectCenter.option({
                        disabled: false,
                    });
                }
            },
        });

        dxInstances.selectCenter.option({
            valueExpr: 'centerId',
            displayExpr: 'centerName',
            dropDownOptions: {
                closeOnOutsideClick: true,
                showTitle: false,
            },
            searchEnabled: true,
            searchExpr: 'centerName',
            searchMode: 'contains',
            searchTimeout: 100,
            placeholder: "?ºÌÑ∞Î•??†ÌÉù?¥Ï£º?∏Ïöî.",
            disabled: true,
            onValueChanged: function (e) {
                LoadHmExceptList()
            },
        });

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dxGridHmExceptList.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dxGridHmExceptList.option({
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
                dataField: "centerManagerName",
                caption: "?¥Îãπ?êÎ™Ö",
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.append("<a href = " + '<c:url value="/pm/hmmanager"/>' + '/' + cellInfo.data.userId + ">" + cellInfo.text + "</a>");
                }
            }, {
                dataField: "hospitalName",
                caption: "Î≥ëÏõêÎ™?,
            }, {
                dataField: "centerName",
                caption: "?ºÌÑ∞Î™?,
            }, {
                dataField: "centerManagerCode",
                caption: "ID",
            }, {
                caption: 'H.P',
                dataField: 'mobile',
                alignment: 'center',
                format: sitebuilder.phoneWithHyphen,
            }, {
                caption: '?†ÏÑ†',
                dataField: 'telephone',
                alignment: 'center',
                format: sitebuilder.phoneWithHyphen,
            }, {
                dataField: 'email',
                caption: '?¥Î©î??,
            }, {
                dataField: 'noUse',
                caption: 'Î°úÍ∑∏??Í∞Ä??,
                width: 100,
            }, {
                dataField: 'notokUrge',
                caption: '?ÖÎ†§ ?úÏô∏',
                width: 100,
            }, {
                dataField: "notokUpdatedAt",
                caption: "Î∞úÏÜ° ?úÏô∏ ?±Î°ù??,
                dataType: 'date',
            },
            ],
        });

        //Load
        function LoadHmExceptList() {
            let ajaxHmExcept = {
                url: '<c:url value="/pm/hm-except"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    hospitalId: dxInstances.selectHospital.option('value'),
                    centerId: dxInstances.selectCenter.option('value'),
                }
            };

            $.when($.ajax(ajaxHmExcept)).then(function (response) {
                dxInstances.dxGridHmExceptList.option({
                    dataSource: response.data,
                });
            });
        }

        let ajaxHospitalList = {
            url: '<c:url value="/common/hospital"/>',
        };


        $.when($.ajax(ajaxHospitalList)).then(function (responseHospitalList) {
            // Center List
            responseHospitalList.data.unshift({hospitalId: null, hospitalName: '?ÑÏ≤¥'});
            dxInstances.selectHospital.option({
                dataSource: responseHospitalList.data,
            });
        });
    })
    ;
</script>
</html>
