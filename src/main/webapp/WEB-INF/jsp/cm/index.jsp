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
                            <h3 class="h3">COMPANY HOME</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap row-wrap-box">
                            <!-- 기업 기본 정보 -->
                            <div class="row-wrap row-wrap1">
                                <div class="row-box-title"><i class="xi-play-circle"></i>기업 기본 정보</div>

                                <div class="row-box6">
                                    <div class="row-box-inner1 logo-box">
                                        <div class="col-box1 col-box-vertical5 row logo-img">
                                            <div class="col-lg-12 center-box" style="">
                                                <img id="ciUrl" src="" alt="기업체로고"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-6" id="ciFilename" style="display: none;"
                                             data-ggsj="dxTextBox"></div>
                                    </div>
                                </div>

                                <div class="row-box6-5">

                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>기업체명</span></div>
                                                    <div class="col-lg-4" id="companyName" data-ggsj="dxTextBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>대상년도</span></div>
                                                    <div class="col-lg-4" id="companyCheckup.checkupYear"
                                                         data-ggsj="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>검진 실시 기간</span></div>
                                                    <div class="col-lg-4 center"
                                                         id="companyCheckup.checkupDateBegin"
                                                         data-ggsj="dxDateBox"></div>
                                                    <div class="text-center wavy">~</div>
                                                    <div class="col-lg-4 center"
                                                         id="companyCheckup.checkupDateEnd"
                                                         data-ggsj="dxDateBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>예약 가능 기간</span></div>
                                                    <div class="col-lg-4 center"
                                                         id="companyCheckup.reserveDateBegin"
                                                         data-ggsj="dxDateBox"></div>
                                                    <div class="text-center wavy">~</div>
                                                    <div class="col-lg-4 center"
                                                         id="companyCheckup.reserveDateEnd"
                                                         data-ggsj="dxDateBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-1 tag-name"><span>대상인원</span></div>
                                                    <div class="col-lg-2" id="totalNum" data-ggsj="dxTextBox"></div>
                                                    <div class="col-lg-1 tag-name"><span>예약진행</span></div>
                                                    <div class="col-lg-2" id="totalEmployeeNum"
                                                         data-ggsj="dxTextBox"></div>
                                                    <div class="col-lg-1 tag-name"><span>수검완료</span></div>
                                                    <div class="col-lg-2" id="totalFamilyNum"
                                                         data-ggsj="dxTextBox"></div>
                                                    <div class="col-lg-1 tag-name"><span>미예약</span></div>
                                                    <div class="col-lg-2" id="totalNon"
                                                         data-ggsj="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-12" id="Dday" data-ggsj="dxTextBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="dx-viewport">
                            <div class="row-wrap row-wrap-box">
                                <div class="row-wrap">
                                    <div id="dataGridNotice" class="main_table" data-ggsj="dxDataGrid"></div>
                                </div>
                            </div>

                            <div class="row-wrap row-wrap-box">
                                <div class="row-wrap">
                                    <div id="dataGridExaminationStatus" data-ggsj="dxDataGrid">
                                    </div>
                                </div>
                            </div>


                            <div class="row-wrap row-wrap-box">

                                <div class="row-wrap row-wrap1">
                                    <div class="row-box-title">
                                        <i class="xi-play-circle"></i>검진 실시 현황
                                    </div>
                                    <div class="row-box1">
                                        <div class="row-box-inner width-box">
                                            <div class="col-box1 row">
                                                <div class="col-box1 row">
                                                    <div class="col-lg-6"
                                                         style="justify-content: center; border-right:1px solid #eaecef; padding:50px 0!important">
                                                        <div id="PieCheckupApplication" data-ggsj="dxPieChart"></div>
                                                    </div>
                                                    <div class="col-lg-6"
                                                         style="justify-content: center; padding:50px 0!important">
                                                        <div id="PieCheckupCompleted" data-ggsj="dxPieChart"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
        let dxInstances = ggsj.createDx(false);

        dxInstances.companyName.option({
            readOnly: true
        });

        dxInstances['companyCheckup.checkupYear'].option({
            readOnly: true
        });

        dxInstances['companyCheckup.checkupDateBegin'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            readOnly: true
        });

        dxInstances['companyCheckup.checkupDateEnd'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            readOnly: true
        });

        dxInstances['companyCheckup.reserveDateBegin'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            readOnly: true
        });

        dxInstances['companyCheckup.reserveDateEnd'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            readOnly: true
        });

        dxInstances.dataGridNotice.option({
            dataSource: {
                load: function () {
                    return $.ajax({
                        url: '<c:url value="/cm/commune/notice"/>',
                    });
                }
            },
            columns: [{
                caption: '순번',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.topList === true) {
                        cellElement.append('<i class="fa fa-thumbtack"></i>');
                    } else {
                        cellElement.text(cellInfo.row.rowIndex + 1);
                    }
                },
            }, {
                dataField: 'group',
                caption: '구분',
                alignment: 'center',
                lookup: {
                    dataSource: ggsj.typeDef.userType,
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                dataField: 'title',
                caption: '제목',
                cellTemplate: function (cellElement, cellInfo) {
                    let noticeId = cellInfo.row.data.noticeId;
                    if (cellInfo.data.attachUrl) {
                        cellElement.append('<a href="<c:url value="/cm/commune/notice"/>/' + noticeId + '">' + cellInfo.text + '</a>');
                        cellElement.append('<i class="xi-diskette"></i>');
                    } else {
                        cellElement.append('<a href="<c:url value="/cm/commune/notice"/>/' + noticeId + '">' + cellInfo.text + '</a>');
                    }
                },
            }, {
                dataField: 'writedUserName',
                caption: '작성자',
                alignment: 'center',
            }, {
                dataField: 'writedAt',
                caption: '작성일시',
                alignment: 'center',
                dataType: 'datetime',
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    html: '<div class="row-box-title"><i class="xi-play-circle"></i>공지사항</div>'
                });
            },
        });

        dxInstances.dataGridExaminationStatus.option({
            paging: {
                enabled: true,
                pageSize: 5
            },
            columns: [{
                dataField: 'sum',
                caption: '합계',
                alignment: 'center',
                // sortOrder: 'desc',
                visible: false,
            }, {
                dataField: 'count',
                caption: '순번',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.topList === true) {
                        cellElement.append('<i class="fa fa-thumbtack"></i>');
                    } else {
                        cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                    }
                },
                width: 100,
            }, {
                dataField: 'hospitalCenterName',
                caption: '병원명',
                width: 500,
                alignment: 'center',
            }, {
                dataField: 'applyCount',
                caption: '예약진행인원',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.dataCount) {
                        cellElement.text(cellInfo.data.dataCount.applyCount + '명');
                    } else {
                        cellElement.text('0명');
                    }
                },
            }, {
                dataField: 'checkupedCount',
                caption: '수검완료인원',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.dataCount) {
                        cellElement.text(cellInfo.data.dataCount.checkupedCount + '명');
                    } else {
                        cellElement.text('0명');
                    }
                },
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    html: '<div class="row-box-title"><i class="xi-play-circle"></i>병원별 검진현황</div>'
                });
            },
        });

        <%--let applyCount;--%>
        <%--let checkupCount;--%>
        <%--let applyTotal;--%>

        <%--$.ajax({--%>
        <%--    url: '<c:url value="/cm/employee/count"/>',--%>
        <%--    method: 'GET',--%>
        <%--}).then(function (response) {--%>
        //     applyTotal = response.data.totalCount - response.data.checkupCount;
        //     applyCount = response.data.applyCount / applyTotal;
        //     checkupCount = response.data.checkupCount / response.data.totalCount;

        <%--    dxInstances.PieCheckupApplication.option({--%>
        <%--        dataSource: [{--%>
        <%--            name: '총인원',--%>
        <%--            area: 1 - applyCount.toFixed(2)--%>
        <%--        }, {--%>
        <%--            name: '신청인원',--%>
        <%--            area: applyCount.toFixed(2)--%>
        <%--        }],--%>
        <%--        palette: 'Soft',--%>
        <%--        title: '예약신청',--%>
        <%--        series: {--%>
        <%--            argumentField: 'name',--%>
        <%--            valueField: 'area',--%>
        <%--            label: {--%>
        <%--                visible: true,--%>
        <%--                format: 'percent'--%>
        <%--            }--%>
        <%--        },--%>
        <%--    });--%>

        <%--    dxInstances.PieCheckupCompleted.option({--%>
        <%--        dataSource: [{--%>
        <%--            name: '총인원',--%>
        <%--            area: 1 - checkupCount.toFixed(2)--%>
        <%--        }, {--%>
        <%--            name: '수검완료인원',--%>
        <%--            area: checkupCount.toFixed(2)--%>
        <%--        }],--%>
        <%--        palette: 'Soft Pastel',--%>
        <%--        title: '수검완료',--%>
        <%--        sizeGroup: {--%>
        <%--            argumentField: 'name',--%>
        <%--            valueField: 'area',--%>
        <%--            label: {--%>
        <%--                visible: true,--%>
        <%--                format: 'percent'--%>
        <%--            }--%>
        <%--        },--%>
        <%--        series: {--%>
        <%--            argumentField: "name",--%>
        <%--            valueField: "area",--%>
        <%--            label: {--%>
        <%--                visible: true,--%>
        <%--                format: "percent"--%>
        <%--            }--%>
        <%--        },--%>
        <%--    });--%>
        <%--});--%>

        $.ajax({
            url: '<c:url value="/cm/company/checkup"/>',
            method: 'GET',
        }).then(function (response) {
            $.ajax({
                url: '<c:url value="/cm/company/subcheckup"/>',
                method: 'GET',
            }).then(function (res) {
                for (let i = 0; i < response.data.length; i++) {
                    for (let j = 0; j < res.data.length; j++) {
                        if (response.data[i].centerId === res.data[j].centerId) {
                            response.data[i].dataCount = res.data[j];
                        }
                    }
                }
                for (let i = 0; i < response.data.length; i++) {
                    response.data[i].count = i + 1;
                    response.data[i].sum = response.data[i].applyCount + response.data[i].checkupedCount;
                }

                dxInstances.dataGridExaminationStatus.option({
                    dataSource: response.data
                });
            });
        });

        $.ajax({
            url: '<c:url value="/cm/company/count"/>',
            method: 'GET',
        }).then(function (response) {
            let totalCount;
            let applyCount;
            let checkupedCount;
            for (let i = 0; i < response.data.length; i++) {
                if (response.data[i].totalCount != null) {
                    totalCount = response.data[i].totalCount;
                } else if (response.data[i].applyCount != null) {
                    applyCount = response.data[i].applyCount;
                } else if (response.data[i].checkupedCount != null) {
                    checkupedCount = response.data[i].checkupedCount;
                }
            }

            dxInstances.totalNum.option({
                value: totalCount + '명',
                type: 'number',
                readOnly: true,
            });
            dxInstances.totalEmployeeNum.option({
                value: applyCount + '명',
                type: 'number',
                readOnly: true,
            });
            dxInstances.totalFamilyNum.option({
                value: checkupedCount + '명',
                type: 'number',
                readOnly: true,
            });
            dxInstances.totalNon.option({
                value: (totalCount - applyCount - checkupedCount) + '명',
                type: 'number',
                readOnly: true,
            });


            let pieApplyTotal = totalCount - checkupedCount;
            let pieApplyCount = applyCount / pieApplyTotal;
            let pieCheckupCount = checkupedCount / totalCount;
            dxInstances.PieCheckupApplication.option({
                dataSource: [{
                    name: '총인원',
                    area: 1 - pieApplyCount.toFixed(2)
                }, {
                    name: '신청인원',
                    area: pieApplyCount.toFixed(2)
                }],
                palette: 'Soft',
                title: '예약신청',
                series: {
                    argumentField: 'name',
                    valueField: 'area',
                    label: {
                        visible: true,
                        format: 'percent'
                    }
                },
            });

            dxInstances.PieCheckupCompleted.option({
                dataSource: [{
                    name: '총인원',
                    area: 1 - pieCheckupCount.toFixed(2)
                }, {
                    name: '수검완료인원',
                    area: pieCheckupCount.toFixed(2)
                }],
                palette: 'Soft Pastel',
                title: '수검완료',
                sizeGroup: {
                    argumentField: 'name',
                    valueField: 'area',
                    label: {
                        visible: true,
                        format: 'percent'
                    }
                },
                series: {
                    argumentField: "name",
                    valueField: "area",
                    label: {
                        visible: true,
                        format: "percent"
                    }
                },
            });
        });

        let Dday;
        // Load
        $.ajax({
            url: '<c:url value="/cm/company/0"/>',
            method: 'GET',
        }).then(function (response) {
            ggsj.valuesToDx(response.data);

            let gap = new Date(response.data.companyCheckup.checkupDateEnd).getTime() - new Date().getTime()
            Dday = Math.ceil(gap / (1000 * 60 * 60 * 24));

            dxInstances.Dday.option({
                value: '검진기간이 ' + Dday + '일 남았습니다.',
                readOnly: true,
            })
            if (response.data.ciUrl) {
                $('#ciUrl').attr('src', response.data.ciUrl).show();
            }
        });
    });
</script>
</html>
