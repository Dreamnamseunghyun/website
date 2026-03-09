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
                            <h3 class="h3">寃곌낵議고쉶</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap">
                                <div class="row-box2" style="width:370px;">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>湲곗뾽泥?寃??/span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="lookupCompany"
                                                     data-sitebuilder="dxLookup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box2" style="width:370px; margin-right:0;">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12">
                                                <div class="col-lg-4 tag-name"><span>??곷뀈??/span></div>
                                                <div class="col-lg-8">
                                                    <div class="col-lg-12" id="selectCompanyYear"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div id="btnExelDownload" class="btnExcelSample" data-sitebuilder="dxButton"
                                                 style="height:34px!important;"></div>
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

                        <div class="row">
                            <div id="dataGridResultLookup" class="main_table" data-sitebuilder="dxDataGrid">
                            </div>
                        </div>
                        <%--                    </div>--%>
                    </div>
                </div>
            </div>


        </div>
    </div>
        <%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        sitebuilder.openMenu('result-lookup');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.lookupCompany.option({
            displayExpr: 'companyName',
            valueExpr: 'companyId',
            dropDownOptions: {
                closeOnOutsideClick: true,
                showTitle: false,
            },
            searchEnabled: true,
            searchExpr: 'companyName',
            searchMode: 'contains',
            searchTimeout: 100,
            onValueChanged: function (e) {
                LoadSelectResult();
            },
        });

        dxInstances.selectCompanyYear.option({
            dataSource: sitebuilder.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function () {
                LoadSelectResult();
            }
        });

        dxInstances.btnExelDownload.option({
            text: '?묒??ㅼ슫濡쒕뱶'
        });

        dxInstances.searchGrid.option({
            placeholder: '寃??,
            valueChangeEvent: "keyup",
            mode: 'search',
            onValueChanged: function (e) {
                dxInstances.dataGridResultLookup.searchByText(e.value);
            },
        });

        dxInstances.dataGridResultLookup.option({
            dataSource: [],
            columns: [{
                //湲곗뾽泥댁퐫??                dataField: 'companyCode',
                caption: '湲곗뾽泥댁퐫??,
                alignment: 'center',
            }, {
                //湲곗뾽泥대챸
                dataField: 'companyName',
                caption: '湲곗뾽泥대챸',
                alignment: 'center',
            }, {
                //蹂묒썝肄붾뱶
                dataField: 'hospitalCode',
                caption: '蹂묒썝肄붾뱶',
                alignment: 'center',
            }, {
                //蹂묒썝紐?                dataField: 'hospitalName',
                caption: '蹂묒썝紐?,
                alignment: 'center',
            }, {
                //?쇳꽣肄붾뱶
                dataField: 'centerCode',
                caption: '?쇳꽣肄붾뱶',
                alignment: 'center',
            }, {
                //?쇳꽣紐?                dataField: 'centerName',
                caption: '?쇳꽣紐?,
                alignment: 'center',
            }, {
                //?대쫫
                dataField: 'employeeName',
                caption: '寃吏꾩옄紐?,
                alignment: 'center',
            }, {
                //?앸뀈?붿씪
                dataField: 'birth',
                caption: '?앸뀈?붿씪',
                alignment: 'center',
                dataType: 'date',
            }, {
                //?깅퀎
                dataField: 'sex',
                caption: '?깅퀎',
                alignment: 'center',
            }, {
                //ID
                dataField: 'employeeCode',
                caption: 'ID',
                alignment: 'center',
            }, {
                //寃吏꾩씪
                dataField: 'checkupedAt',
                caption: '?섍??꾨즺??,
                alignment: 'center',
                dataType: 'date',
            }, {
                //寃곌낵?깅줉??                dataField: 'employeeRegisteredAt',
                caption: '寃곌낵?깅줉??,
                alignment: 'center',
                dataType: 'date',
            }, {
                type: 'buttons',
                caption: '寃곌낵蹂닿린',
                buttons: [{
                    text: '蹂닿린'
                }]
            }, {
                type: 'buttons',
                caption: '??젣',
                buttons: [{
                    text: '??젣',
                    dataField: '',
                    onClick: function (e) {
                        if (confirm('?뺣쭚濡???젣?섏떆寃좎뒿?덇퉴?')) {
                            $.ajax({
                                url: '<c:url value="/hm/result"/>/' + e.row.data.checkupResultEmployeeId + '/employee',
                                method: 'DELETE',
                            }).then(function () {
                                LoadSelectResult();
                            });
                        }
                    },
                }]
            }],
        });
        // Load
        let ajaxCompanyList = {
            url: '<c:url value="/hm/companylist"/>',
        };

        $.when($.ajax(ajaxCompanyList)).then(function (responseCompanyList) {
            // Company List
            dxInstances.lookupCompany.option({
                dataSource: responseCompanyList.data,
            });
        });

        let dsResultList;

        function LoadSelectResult() {
            $.ajax({
                url: '<c:url value="/hm/select-result"/>',
                method: 'GET',
                data: {
                    companyId: dxInstances.lookupCompany.option('value'),
                    checkupYear: dxInstances.selectCompanyYear.option('value')
                },
            }).then(function (response) {
                dsResultList = response.data;

                dxInstances.dataGridResultLookup.option({
                    dataSource: dsResultList
                });
            });
        }
    });
</script>
</html>
