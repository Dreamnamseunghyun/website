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
                            <h3 class="h3">정산관리</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <%-- checkup type dataGrid --%>
<%--                        <div class="row">--%>
<%--                            <div class="col-lg-1">[병원 청구 현황]</div>--%>
<%--                        </div>--%>

<%--                        <div class="row">--%>
<%--                            <div class="col-lg-1">검진 희망일</div>--%>
<%--                            <div class="col-lg-1" id="selectDateStart" data-ggsj="dxDateBox"></div>--%>
<%--                            <div class="col-lg-1">~</div>--%>
<%--                            <div class="col-lg-1" id="selectDateEnd" data-ggsj="dxDateBox"></div>--%>
<%--                            <div id="dataGridBillingStatus" class="main_table" data-ggsj="dxDataGrid"--%>
<%--                                 style="height: 35vh;"></div>--%>
<%--                        </div>--%>

                            <div class="row-wrap">
                                <div class="row-box1 row-box-margin-bottom">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row" style="border:1px solid #eaecef!important">
                                        <div class="col-lg-2 tag-name"><span>검진희망일</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6">
                                                <div id="selectDateStart" data-ggsj="dxDateBox"></div>
                                            </div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6">
                                                <div id="selectDateEnd" data-ggsj="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </div>

                            <div class="row-wrap">
                                <div class="row-box-title" style="border:none!important;"><i class="xi-play-circle"></i>병원 청구 현황</div>
                                <div id="dataGridBillingStatus" class="main_table" data-ggsj="dxDataGrid"></div>
                            </div>

                            <div class="row-wrap">
                                <div class="row-box-title" style="border:none!important;"><i class="xi-play-circle"></i>정산확정 및 계산서 발행 현황</div>
                                <div id="dataGridBillPublish" class="main_table" data-ggsj="dxDataGrid"></div>
                            </div>




<%--                            <div class="row">--%>
<%--                            <div class="col-lg-2">[정산확정 및 계산서 발행 현황]</div>--%>
<%--                            <div class="col-lg-8"></div>--%>
<%--                            <div class="col-lg-2" id="checkUnidentified" data-ggsj="dxCheckBox"></div>--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div id="dataGridBillPublish" class="main_table" data-ggsj="dxDataGrid"--%>
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
        ggsj.openMenu('calculate');

        let dxInstances = ggsj.createDx(false);

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
            text: '계산서 미발행 보기',
        });

        //병원 청구 현황
        dxInstances.dataGridBillingStatus.option({
            dataSource: test1,
            columns: [{
                caption: '순번',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.row.rowIndex + 1);
                },
            }, {
                //정산 구분
                dataField: 'billCheck',
                caption: '정산구분',
            }, {
                //기업체명
                dataField: 'companyName',
                caption: '기업체명',
            }, {
                //대상인원(명)
                dataField: '',
                caption: '대상인원(명)',
            }, {
                //예약신청자(명)
                dataField: '',
                caption: '예약신청자(명)',
            }, {
                //미예약(명)
                dataField: '',
                caption: '미예약(명)',
            }, {
                dataField: '',
                caption: '정산완료(기업전송대기)',
                alignment: 'center',
                columns: [{
                    caption: '인원(명)',
                    dataField: '',
                }, {
                    caption: '병원 청구 금액(원)',
                    dataField: 'hospitalPay',
                    format: {
                        type: "fixedPoint",
                    }
                }, {
                    caption: '기업 최종 청구 금액(원)',
                    dataField: '',
                    format: {
                        type: "fixedPoint",
                    }
                }]
            }, {
                dataField: '',
                caption: '정산대기',
                alignment: 'center',
                columns: [{
                    caption: '수검완료(명)',
                    dataField: '',
                }, {
                    caption: '수검 미완료(원)',
                    dataField: 'hospitalPay',
                }]
            }, {
                type: 'buttons',
                caption: '수검완료 체크하기',
                cellTemplate: function (cellElement, cellInfo) {
                    /*
                    if (billCheck == true) {
                        $("<div>")
                            .dxButton({
                                text: "센터등록",
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
                    text: '수검체크',
                    onClick: function (e) {
                    },
                }]
            }, {
                type: 'buttons',
                caption: '검진비 정산_상세',
                buttons: [{
                    name: '',
                    text: '상세보기',
                    onClick: function (e) {
                    },
                }]
            }],
        });

        //정산확정 및 계산서 발행 현황
        dxInstances.dataGridBillPublish.option({
            dataSource: test2,
            columns: [{
                caption: '순번',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.row.rowIndex + 1);
                },
            }, {
                //기업체명
                dataField: 'companyName',
                caption: '기업체명',
            }, {
                //청구금액
                dataField: 'supportPay',
                caption: '청구금액',
                format: {
                    type: "fixedPoint",
                }
            }, {
                //기업 매니저(계약)
                dataField: 'companyManager',
                caption: '기업 매니저(계약)',
                alignment: 'center',
                columns: [{
                    caption: '이름',
                    dataField: 'companyManagerName',
                }, {
                    caption: '이메일',
                    dataField: 'email',
                }]
            }, {
                //담당자 확인일
                dataField: '',
                caption: '담당자 확인일',
            }, {
                //계산서 발행일
                dataField: '',
                caption: '계산서 발행일',
                dataType: 'date'
            }],
        });
    });
    let test1 = [{
        "ID": 1,
        "hospitalName": "ooo병원",
        "totalNumber": "560",
        "resultNumber": "200",
        "contractManagerName": "홍길동",
        "mobile": "02-590-1111",
        "email": "aaa@bbb.com",
        "billDate": "2021-02-01"
    }, {
        "ID": 2,
        "hospitalName": "ooo병원",
        "totalNumber": "120",
        "resultNumber": "80",
        "contractManagerName": "ooo",
        "mobile": "00-000-0020",
        "email": "bbb@bbb.com",
    }, {
        "ID": 3,
        "hospitalName": "ooo병원",
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
        "myself": "본인",
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
        "myself": "단체청구 가족",
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
        "myself": "본인",
        "depart": "3",
        "checkupDate": "0000-00-00",
        "hospitalPay": 200000,
        "uniqueCheckupPay": 89540,
        "material": "ooo,oo,ooo",
    }];
    let test3 = [{
        "ID": 1,
        "companyName": "A기업체",
        "companyPay": 5600000,
        "companyManagerName": "ooo",
        "email": "aaa@bbb.com",
        "managerCheckDate": "5/15/2021",
    }, {
        "ID": 2,
        "companyName": "B기업체",
        "companyPay": 18000000,
        "companyManagerName": "ooo",
        "email": "bbb@bbb.com",
        "managerCheckDate": "5/3/2021",
    }, {
        "ID": 3,
        "companyName": "C기업체",
        "companyPay": 5600000,
        "companyManagerName": "ooo",
        "email": "ccc@bbb.com",
        "managerCheckDate": "4/30/2021",
    }, {
        "ID": 4,
        "companyName": "D기업체",
        "companyPay": 18000000,
        "companyManagerName": "ooo",
        "email": "ddd@bbb.com",
        "managerCheckDate": "3/31/2021",
    }, {
        "ID": 5,
        "companyName": "E기업체",
        "companyPay": 18000000,
        "companyManagerName": "ooo",
        "email": "eee@bbb.com",
        "managerCheckDate": "3/15/2021",
    }];
</script>
</html>
