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
                            <h3 class="h3">발송 제외자 목록(병원 매니저용)</h3>
                        </div>
                    </div>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap2">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>병원</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectHospital"
                                                     data-ggsj="dxLookup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>센터</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectCenter" data-ggsj="dxSelectBox"></div>
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
                            <div id="dxGridHmExceptList" class="main_table" data-ggsj="dxDataGrid"></div>
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
        ggsj.openMenu('hmExcept');
        let dxInstances = ggsj.createDx(false);

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
            placeholder: "병원을 선택해주세요.",
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
                    responseCenterList.data.unshift({centerId: null, centerName: '전체'});
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
            placeholder: "센터를 선택해주세요.",
            disabled: true,
            onValueChanged: function (e) {
                LoadHmExceptList()
            },
        });

        dxInstances.searchGrid.option({
            placeholder: '검색',
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
                caption: '순번',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: "centerManagerName",
                caption: "담당자명",
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.append("<a href = " + '<c:url value="/pm/hmmanager"/>' + '/' + cellInfo.data.userId + ">" + cellInfo.text + "</a>");
                }
            }, {
                dataField: "hospitalName",
                caption: "병원명",
            }, {
                dataField: "centerName",
                caption: "센터명",
            }, {
                dataField: "centerManagerCode",
                caption: "ID",
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
                caption: '로그인 가능',
                width: 100,
            }, {
                dataField: 'notokUrge',
                caption: '독려 제외',
                width: 100,
            }, {
                dataField: "notokUpdatedAt",
                caption: "발송 제외 등록일",
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
            responseHospitalList.data.unshift({hospitalId: null, hospitalName: '전체'});
            dxInstances.selectHospital.option({
                dataSource: responseHospitalList.data,
            });
        });
    })
    ;
</script>
</html>
