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
                            <h3 class="h3">?뺤궛愿由?/h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <%-- checkup type dataGrid --%>
<%--                        <div class="row">--%>
<%--                            <div class="col-lg-1">[蹂묒썝 泥?뎄 ?꾪솴]</div>--%>
<%--                        </div>--%>

<%--                        <div class="row">--%>
<%--                            <div class="col-lg-1">寃吏??щ쭩??/div>--%>
<%--                            <div class="col-lg-1" id="selectDateStart" data-sitebuilder="dxDateBox"></div>--%>
<%--                            <div class="col-lg-1">~</div>--%>
<%--                            <div class="col-lg-1" id="selectDateEnd" data-sitebuilder="dxDateBox"></div>--%>
<%--                            <div id="dataGridBillingStatus" class="main_table" data-sitebuilder="dxDataGrid"--%>
<%--                                 style="height: 35vh;"></div>--%>
<%--                        </div>--%>

                            <div class="row-wrap">
                                <div class="row-box1 row-box-margin-bottom">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row" style="border:1px solid #eaecef!important">
                                        <div class="col-lg-2 tag-name"><span>寃吏꾪씗留앹씪</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6">
                                                <div id="selectDateStart" data-sitebuilder="dxDateBox"></div>
                                            </div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6">
                                                <div id="selectDateEnd" data-sitebuilder="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </div>

                            <div class="row-wrap">
                                <div class="row-box-title" style="border:none!important;"><i class="xi-play-circle"></i>蹂묒썝 泥?뎄 ?꾪솴</div>
                                <div id="dataGridBillingStatus" class="main_table" data-sitebuilder="dxDataGrid"></div>
                            </div>

                            <div class="row-wrap">
                                <div class="row-box-title" style="border:none!important;"><i class="xi-play-circle"></i>?뺤궛?뺤젙 諛?怨꾩궛??諛쒗뻾 ?꾪솴</div>
                                <div id="dataGridBillPublish" class="main_table" data-sitebuilder="dxDataGrid"></div>
                            </div>




<%--                            <div class="row">--%>
<%--                            <div class="col-lg-2">[?뺤궛?뺤젙 諛?怨꾩궛??諛쒗뻾 ?꾪솴]</div>--%>
<%--                            <div class="col-lg-8"></div>--%>
<%--                            <div class="col-lg-2" id="checkUnidentified" data-sitebuilder="dxCheckBox"></div>--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div id="dataGridBillPublish" class="main_table" data-sitebuilder="dxDataGrid"--%>
<%--                                 style="height: 35vh"></div>--%>
<%--                        </div>--%>
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
    /** @param _dxInstances : {} */
    $(function () {
        sitebuilder.openMenu('calculate');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.selectDateStart.option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            value: new Date().addYears(-1),
        });

        dxInstances.selectDateEnd.option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
        });

        dxInstances.checkUnidentified.option({
            text: '怨꾩궛??誘몃컻??蹂닿린',
        });

        //蹂묒썝 泥?뎄 ?꾪솴
        dxInstances.dataGridBillingStatus.option({
            dataSource: test1,
            columns: [{
                caption: '?쒕쾲',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.row.rowIndex + 1);
                },
            }, {
                //?뺤궛 援щ텇
                dataField: 'billCheck',
                caption: '?뺤궛援щ텇',
            }, {
                //湲곗뾽泥대챸
                dataField: 'companyName',
                caption: '湲곗뾽泥대챸',
            }, {
                //??곸씤??紐?
                dataField: '',
                caption: '??곸씤??紐?',
            }, {
                //?덉빟?좎껌??紐?
                dataField: '',
                caption: '?덉빟?좎껌??紐?',
            }, {
                //誘몄삁??紐?
                dataField: '',
                caption: '誘몄삁??紐?',
            }, {
                dataField: '',
                caption: '?뺤궛?꾨즺(湲곗뾽?꾩넚?湲?',
                alignment: 'center',
                columns: [{
                    caption: '?몄썝(紐?',
                    dataField: '',
                }, {
                    caption: '蹂묒썝 泥?뎄 湲덉븸(??',
                    dataField: 'hospitalPay',
                    format: {
                        type: "fixedPoint",
                    }
                }, {
                    caption: '湲곗뾽 理쒖쥌 泥?뎄 湲덉븸(??',
                    dataField: '',
                    format: {
                        type: "fixedPoint",
                    }
                }]
            }, {
                dataField: '',
                caption: '?뺤궛?湲?,
                alignment: 'center',
                columns: [{
                    caption: '?섍??꾨즺(紐?',
                    dataField: '',
                }, {
                    caption: '?섍? 誘몄셿猷???',
                    dataField: 'hospitalPay',
                }]
            }, {
                type: 'buttons',
                caption: '?섍??꾨즺 泥댄겕?섍린',
                cellTemplate: function (cellElement, cellInfo) {
                    /*
                    if (billCheck == true) {
                        $("<div>")
                            .dxButton({
                                text: "?쇳꽣?깅줉",
                                onClick: function (e) {
                                    let hospitalId = cellInfo.data.items[0].hospitalId;
                                    location.href = '<c:url value="/pm/hospital"/>/' + hospitalId + '/create';
                                }
                            }).appendTo(cellElement);
                    } else {
                        $('<span>')
                            .text('-')
                            .appendTo(cellElement);
                    }
                    */
                },
                buttons: [{
                    name: '',
                    text: '?섍?泥댄겕',
                    onClick: function (e) {
                    },
                }]
            }, {
                type: 'buttons',
                caption: '寃吏꾨퉬 ?뺤궛_?곸꽭',
                buttons: [{
                    name: '',
                    text: '?곸꽭蹂닿린',
                    onClick: function (e) {
                    },
                }]
            }],
        });

        //?뺤궛?뺤젙 諛?怨꾩궛??諛쒗뻾 ?꾪솴
        dxInstances.dataGridBillPublish.option({
            dataSource: test2,
            columns: [{
                caption: '?쒕쾲',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.row.rowIndex + 1);
                },
            }, {
                //湲곗뾽泥대챸
                dataField: 'companyName',
                caption: '湲곗뾽泥대챸',
            }, {
                //泥?뎄湲덉븸
                dataField: 'supportPay',
                caption: '泥?뎄湲덉븸',
                format: {
                    type: "fixedPoint",
                }
            }, {
                //湲곗뾽 留ㅻ땲?(怨꾩빟)
                dataField: 'companyManager',
                caption: '湲곗뾽 留ㅻ땲?(怨꾩빟)',
                alignment: 'center',
                columns: [{
                    caption: '?대쫫',
                    dataField: 'companyManagerName',
                }, {
                    caption: '?대찓??,
                    dataField: 'email',
                }]
            }, {
                //?대떦???뺤씤??                dataField: '',
                caption: '?대떦???뺤씤??,
            }, {
                //怨꾩궛??諛쒗뻾??                dataField: '',
                caption: '怨꾩궛??諛쒗뻾??,
                dataType: 'date'
            }],
        });
    });
    let test1 = [{
        "ID": 1,
        "hospitalName": "ooo蹂묒썝",
        "totalNumber": "560",
        "resultNumber": "200",
        "contractManagerName": "?띻만??,
        "mobile": "02-590-1111",
        "email": "aaa@bbb.com",
        "billDate": "2021-02-01"
    }, {
        "ID": 2,
        "hospitalName": "ooo蹂묒썝",
        "totalNumber": "120",
        "resultNumber": "80",
        "contractManagerName": "ooo",
        "mobile": "00-000-0020",
        "email": "bbb@bbb.com",
    }, {
        "ID": 3,
        "hospitalName": "ooo蹂묒썝",
        "totalNumber": "78",
        "resultNumber": "75",
        "contractManagerName": "ooo",
        "mobile": "00-000-0003",
        "email": "ccc@bbb.com",
    }];
    let test2 = [{
        "ID": 1,
        "hospitalName": "1",
        "employeeName": "ooo",
        "birth": "1991-05-01",
        "sex": "M",
        "employeeNo": "1234",
        "myself": "蹂몄씤",
        "depart": "1",
        "checkupDate": "2021-04-30",
        "hospitalPay": 200000,
        "uniqueCheckupPay": "-",
        "material": "",
    }, {
        "ID": 2,
        "hospitalName": "2",
        "employeeName": "ooo",
        "birth": "0000-00-01",
        "sex": "F",
        "employeeNo": "5487",
        "myself": "?⑥껜泥?뎄 媛議?,
        "depart": "2",
        "checkupDate": "0000-00-00",
        "hospitalPay": 200000,
        "uniqueCheckupPay": "-",
        "material": "",
    }, {
        "ID": 3,
        "hospitalName": "3",
        "employeeName": "ooo",
        "birth": "0000-00-02",
        "sex": "M",
        "employeeNo": "9584",
        "myself": "蹂몄씤",
        "depart": "3",
        "checkupDate": "0000-00-00",
        "hospitalPay": 200000,
        "uniqueCheckupPay": 89540,
        "material": "ooo,oo,ooo",
    }];
    let test3 = [{
        "ID": 1,
        "companyName": "A湲곗뾽泥?,
        "companyPay": 5600000,
        "companyManagerName": "ooo",
        "email": "aaa@bbb.com",
        "managerCheckDate": "5/15/2021",
    }, {
        "ID": 2,
        "companyName": "B湲곗뾽泥?,
        "companyPay": 18000000,
        "companyManagerName": "ooo",
        "email": "bbb@bbb.com",
        "managerCheckDate": "5/3/2021",
    }, {
        "ID": 3,
        "companyName": "C湲곗뾽泥?,
        "companyPay": 5600000,
        "companyManagerName": "ooo",
        "email": "ccc@bbb.com",
        "managerCheckDate": "4/30/2021",
    }, {
        "ID": 4,
        "companyName": "D湲곗뾽泥?,
        "companyPay": 18000000,
        "companyManagerName": "ooo",
        "email": "ddd@bbb.com",
        "managerCheckDate": "3/31/2021",
    }, {
        "ID": 5,
        "companyName": "E湲곗뾽泥?,
        "companyPay": 18000000,
        "companyManagerName": "ooo",
        "email": "eee@bbb.com",
        "managerCheckDate": "3/15/2021",
    }];
</script>
</html>
