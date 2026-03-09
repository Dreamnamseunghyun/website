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
                            <h3 class="h3">결과조회</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap">
                                <div class="row-box2" style="width:370px;">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>기업체 검색</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="lookupCompany"
                                                     data-ggsj="dxLookup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box2" style="width:370px; margin-right:0;">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12">
                                                <div class="col-lg-4 tag-name"><span>대상년도</span></div>
                                                <div class="col-lg-8">
                                                    <div class="col-lg-12" id="selectCompanyYear"
                                                         data-ggsj="dxSelectBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div id="btnExelDownload" class="btnExcelSample" data-ggsj="dxButton"
                                                 style="height:34px!important;"></div>
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

                        <div class="row">
                            <div id="dataGridResultLookup" class="main_table" data-ggsj="dxDataGrid">
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
        ggsj.openMenu('result-lookup');

        let dxInstances = ggsj.createDx(false);

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
            dataSource: ggsj.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function () {
                LoadSelectResult();
            }
        });

        dxInstances.btnExelDownload.option({
            text: '엑셀다운로드'
        });

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            mode: 'search',
            onValueChanged: function (e) {
                dxInstances.dataGridResultLookup.searchByText(e.value);
            },
        });

        dxInstances.dataGridResultLookup.option({
            dataSource: [],
            columns: [{
                //기업체코드
                dataField: 'companyCode',
                caption: '기업체코드',
                alignment: 'center',
            }, {
                //기업체명
                dataField: 'companyName',
                caption: '기업체명',
                alignment: 'center',
            }, {
                //병원코드
                dataField: 'hospitalCode',
                caption: '병원코드',
                alignment: 'center',
            }, {
                //병원명
                dataField: 'hospitalName',
                caption: '병원명',
                alignment: 'center',
            }, {
                //센터코드
                dataField: 'centerCode',
                caption: '센터코드',
                alignment: 'center',
            }, {
                //센터명
                dataField: 'centerName',
                caption: '센터명',
                alignment: 'center',
            }, {
                //이름
                dataField: 'employeeName',
                caption: '검진자명',
                alignment: 'center',
            }, {
                //생년월일
                dataField: 'birth',
                caption: '생년월일',
                alignment: 'center',
                dataType: 'date',
            }, {
                //성별
                dataField: 'sex',
                caption: '성별',
                alignment: 'center',
            }, {
                //ID
                dataField: 'employeeCode',
                caption: 'ID',
                alignment: 'center',
            }, {
                //검진일
                dataField: 'checkupedAt',
                caption: '수검완료일',
                alignment: 'center',
                dataType: 'date',
            }, {
                //결과등록일
                dataField: 'employeeRegisteredAt',
                caption: '결과등록일',
                alignment: 'center',
                dataType: 'date',
            }, {
                type: 'buttons',
                caption: '결과보기',
                buttons: [{
                    text: '보기'
                }]
            }, {
                type: 'buttons',
                caption: '삭제',
                buttons: [{
                    text: '삭제',
                    dataField: '',
                    onClick: function (e) {
                        if (confirm('정말로 삭제하시겠습니까?')) {
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
