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
                            <h3 class="h3">매출관리</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <%-- checkup type dataGrid --%>
                        <div class="row">
                            <div class="col-lg-1">매출 성과 현황</div>
                            <div class="col-lg-2" id="selectYear" data-ggsj="dxSelectBox"></div>
                            <div class="col-lg-9"></div>
                            <div id="dataGridCost" class="main_table" data-ggsj="dxDataGrid"></div>
                            <div class="col-lg-1">&nbsp</div>
                            <div id="dataGridYearCost" class="main_table" data-ggsj="dxDataGrid"></div>
                        </div>

                        <div class="row">
                            <div class="col-lg-1">&nbsp</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-1">&nbsp</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-1">매출 상세현황</div>
                            <div class="col-lg-5"></div>
                            <div class="col-lg-2" id="selectPlatformManagerName" data-ggsj="dxSelectBox"></div>
                            <div class="col-lg-1">&nbsp</div>
                            <div class="col-lg-2" id="selectCostYear" data-ggsj="dxSelectBox"></div>
                        </div>

                        <div class="row">
                            <div id="dataGridTotalCost" class="main_table" data-ggsj="dxDataGrid">
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
        ggsj.openMenu('sales');

        let dxInstances = ggsj.createDx(false);

        dxInstances.selectYear.option({
            dataSource: [
                {'id': 0, 'text': '전체'},
                {'id': '2018', 'text': '2018'},
                {'id': '2019', 'text': '2019'},
                {'id': '2020', 'text': '2020'},
                {'id': '2021', 'text': '2021'},
            ],
            value: 0,
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function (data) {
                if (data.value === 0)
                    dxInstances.dataGridCost.clearFilter();
                else
                    dxInstances.dataGridCost.filter(['year', '=', data.value]);
            }
        });

        function SettingFilter() {
            let selectPlatformManagerName = dxInstances.selectPlatformManagerName.option('value');
            let selectCostYear = dxInstances.selectCostYear.option('value');

            console.log('selectStatus' + selectPlatformManagerName);
            console.log('selectNoUse' + selectCostYear);

            if (selectPlatformManagerName === 0 && selectCostYear === 0) {
                dxInstances.dataGridTotalCost.clearFilter();
            } else if (selectPlatformManagerName !== 0 && selectCostYear === 0) {
                dxInstances.dataGridTotalCost.filter(['platformManagerName', '=', selectPlatformManagerName]);
            } else if (selectPlatformManagerName === 0 && selectCostYear !== 0) {
                dxInstances.dataGridTotalCost.filter(['year', '=', selectCostYear]);
            } else if (selectPlatformManagerName !== 0 && selectCostYear !== 0) {
                dxInstances.dataGridTotalCost.filter(
                    ['platformManagerName', '=', selectPlatformManagerName],
                    'and',
                    ['year', '=', selectCostYear]);
            }
        }

        dxInstances.selectPlatformManagerName.option({
            dataSource: [
                {'id': 0, 'text': '전체'},
                {'id': '홍길동', 'text': '홍길동'},
                {'id': '김김김', 'text': '김김김'},
                {'id': '이이이', 'text': '이이이'},
                {'id': '최최최', 'text': '최최최'},
                {'id': '박땡땡', 'text': '박땡땡'},
            ],
            value: 0,
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function (data) {
                SettingFilter()
                // if (data.value == 0)
                //     dxInstances.dataGridTotalCost.clearFilter();
                // else
                //     dxInstances.dataGridTotalCost.filter(['platformManagerName', '=', data.value]);
            }
        });

        dxInstances.selectCostYear.option({
            dataSource: [
                {'id': 0, 'text': '전체'},
                {'id': '2018', 'text': '2018'},
                {'id': '2019', 'text': '2019'},
                {'id': '2020', 'text': '2020'},
                {'id': '2021', 'text': '2021'},
            ],
            value: 0,
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function (data) {
                SettingFilter()
                // if (data.value == 0)
                //     dxInstances.dataGridTotalCost.clearFilter();
                // else
                //     dxInstances.dataGridTotalCost.filter(['year', '=', data.value]);
            }
        });

        //매출 성과 현황
        dxInstances.dataGridCost.option({
            dataSource: test1,
            columns: [{
                //담당자명
                dataField: 'platformManagerName',
                caption: '담당자명',
            }, {
                //매출목표
                dataField: 'targetCost',
                caption: '매출목표',
                format: {
                    type: "fixedPoint",
                },
            }, {
                //매출금액
                dataField: 'salesAmount',
                caption: '매출금액',
                format: {
                    type: "fixedPoint",
                },
            }, {
                //목표 달성률
                dataField: 'targetPercent',
                caption: '목표 달성률',
            }],
            summary: {
                totalItems: [{
                    column: 'targetCost',
                    displayFormat: 'Total: {0}',
                    summaryType: 'sum'
                }, {
                    column: 'salesAmount',
                    displayFormat: 'Total: {0}',
                    summaryType: 'sum'
                }, {
                    column: 'targetPercent',
                    displayFormat: 'Total: {0}',
                    summaryType: 'sum'
                }
                ],
            }
        });

        //연도별 매출현황
        dxInstances.dataGridYearCost.option({
            dataSource: test2,
            columns: [{
                //담당자명
                dataField: 'platformManagerName',
                caption: '담당자명',
            }, {
                //당해 신규매출
                dataField: 'newCost',
                caption: '당해 신규매출',
                format: {
                    type: "fixedPoint",
                },
            }, {
                //2년차 기업체매출
                dataField: 'secCost',
                caption: '2년차 기업체매출',
                format: {
                    type: "fixedPoint",
                },
            }, {
                //3년차 기업체매출
                dataField: 'thCost',
                caption: '3년차 기업체매출',
                format: {
                    type: "fixedPoint",
                },
            }, {
                //4년차 기업체매출
                dataField: 'fourthCost',
                caption: '4년차 기업체매출',
                format: {
                    type: "fixedPoint",
                },
            }],
            summary: {
                totalItems: [{
                    column: 'newCost',
                    displayFormat: 'Total: {0}',
                    summaryType: 'sum'
                }, {
                    column: 'secCost',
                    displayFormat: 'Total: {0}',
                    summaryType: 'sum'
                }, {
                    column: 'thCost',
                    displayFormat: 'Total: {0}',
                    summaryType: 'sum'
                }, {
                    column: 'fourthCost',
                    displayFormat: 'Total: {0}',
                    summaryType: 'sum'
                }
                ],
            }
        });

        //매출 상세 현황
        dxInstances.dataGridTotalCost.option({
            dataSource: test3,
            columns: [{
                //담당자명
                dataField: 'platformManagerName',
                caption: '담당자명',
            }, {
                //기업체명
                dataField: 'companyName',
                caption: '기업체명',
            }, {
                //검진기간
                dataField: 'secCost',
                caption: '검진기간',
                alignment: 'center',
                columns: [{
                    caption: '검진 시작일',
                    dataField: 'checkupDateBegin',
                }, {
                    caption: '검진 종료일',
                    dataField: 'checkupDateEnd',
                }]
            }, {
                //대상인원(명)
                dataField: 'totalNumber',
                caption: '대상인원(명)',
            }, {
                //예약인원(명)
                dataField: 'reserveNumber',
                caption: '예약인원(명)',
            }, {
                //수검인원(명)
                dataField: 'resultNumber',
                caption: '수검인원(명)',
            }, {
                //미수검인원(명)
                dataField: 'unresultNumber',
                caption: '미수검인원(명)',
            }, {
                //검진비 매출
                dataField: 'checkupCost',
                caption: '검진비 매출',
                alignment: 'center',
                columns: [{
                    caption: '예상',
                    dataField: 'checkupPrediction',
                    format: 'fixedPoint',
                }, {
                    caption: '발생',
                    dataField: 'checkupOccur',
                    format: 'fixedPoint',
                }]
            }, {
                //수수료 매출
                dataField: 'feesCost',
                caption: '수수료 매출',
                alignment: 'center',
                columns: [{
                    caption: '예상',
                    dataField: 'feesPrediction',
                    format: 'fixedPoint',
                }, {
                    caption: '발생',
                    dataField: 'feesOccur',
                    format: 'fixedPoint',
                }, {
                    //계산서 발행
                    dataField: 'checkupBill',
                    caption: '계산서 발행',
                    format: 'fixedPoint',
                }]
            }],
            summary: {
                totalItems: [{
                    column: 'checkupPrediction',
                    displayFormat: 'Total: {0}',
                    summaryType: 'sum',
                    valueFormat: 'fixedPoint',
                }, {
                    column: 'checkupOccur',
                    displayFormat: 'Total: {0}',
                    summaryType: 'sum',
                    valueFormat: 'fixedPoint',
                }, {
                    column: 'feesPrediction',
                    displayFormat: 'Total: {0}',
                    summaryType: 'sum',
                    valueFormat: 'fixedPoint',
                }, {
                    column: 'feesOccur',
                    displayFormat: 'Total: {0}',
                    summaryType: 'sum',
                    valueFormat: 'fixedPoint',
                }
                ],
            }
        });
    });
    let test1 = [{
        "ID": 1,
        "year": 2018,
        "platformManagerName": "홍길동",
        "targetCost": "1",
        "salesAmount": "1",
        "targetPercent": "1"
    }, {
        "ID": 2,
        "year": 2020,
        "platformManagerName": "김김김",
        "targetCost": "2",
        "salesAmount": "2",
        "targetPercent": "2"
    }, {
        "ID": 3,
        "year": 2021,
        "platformManagerName": "이이이",
        "targetCost": "3",
        "salesAmount": "3",
        "targetPercent": "3"
    }];
    let test2 = [{
        "ID": 1,
        "platformManagerName": "홍길동",
        "newCost": "1",
        "secCost": "1",
        "thCost": "1",
        "fourthCost": "1",
    }, {
        "ID": 2,
        "platformManagerName": "김김김",
        "newCost": "2",
        "secCost": "2",
        "thCost": "2",
        "fourthCost": "2",
    }, {
        "ID": 3,
        "platformManagerName": "이이이",
        "newCost": "3",
        "secCost": "3",
        "thCost": "3",
        "fourthCost": "3",
    }];
    let test3 = [{
        "ID": 1,
        "year": 2019,
        "platformManagerName": "홍길동",
        "companyName": "A기업체",
        "checkupDateBegin": "2021-03-01",
        "checkupDateEnd": "2021-10-31",
        "totalNumber": "500",
        "reserveNumber": "350",
        "resultNumber": "100",
        "unresultNumber": "400",
        "checkupPrediction": 150000000,
        "checkupOccur": 30000000,
        "feesPrediction": 10000000,
        "feesOccur": 2000000,
        "checkupBill": " ",
    }, {
        "ID": 2,
        "year": 2020,
        "platformManagerName": "김김김",
        "companyName": "B기업체",
        "checkupDateBegin": "2021-03-01",
        "checkupDateEnd": "2021-06-30",
        "totalNumber": "1,000",
        "reserveNumber": "700",
        "resultNumber": "500",
        "unresultNumber": "500",
        "checkupPrediction": 0,
        "checkupOccur": 0,
        "feesPrediction": 20000000,
        "feesOccur": 10000000,
        "checkupBill": " ",
    }, {
        "ID": 3,
        "year": 2021,
        "platformManagerName": "이이이",
        "companyName": "C기업체",
        "checkupDateBegin": "2021-02-01",
        "checkupDateEnd": "2021-05-31",
        "totalNumber": "200",
        "reserveNumber": "198",
        "resultNumber": "180",
        "unresultNumber": "20",
        "checkupPrediction": 70000000,
        "checkupOccur": 63000000,
        "feesPrediction": 3600000,
        "feesOccur": 18000000,
        "checkupBill": "6/3/2021",
    }, {
        "ID": 4,
        "platformManagerName": "최최최",
        "companyName": "D기업체",
        "checkupDateBegin": "2021-01-01",
        "checkupDateEnd": "2021-04-30",
        "totalNumber": "700",
        "reserveNumber": "658",
        "resultNumber": "600",
        "unresultNumber": "100",
        "checkupPrediction": 126000000,
        "checkupOccur": 108000000,
        "feesPrediction": 18000000,
        "feesOccur": 0,
        "checkupBill": "5/7/2021",
    }];
</script>
</html>
