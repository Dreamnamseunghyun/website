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
                            <!-- 湲곗뾽 湲곕낯 ?뺣낫 -->
                            <div class="row-wrap row-wrap1">
                                <div class="row-box-title"><i class="xi-play-circle"></i>湲곗뾽 湲곕낯 ?뺣낫</div>

                                <div class="row-box6">
                                    <div class="row-box-inner1 logo-box">
                                        <div class="col-box1 col-box-vertical5 row logo-img">
                                            <div class="col-lg-12 center-box" style="">
                                                <img id="ciUrl" src="" alt="湲곗뾽泥대줈怨?/>
                                            </div>
                                        </div>
                                        <div class="col-lg-6" id="ciFilename" style="display: none;"
                                             data-sitebuilder="dxTextBox"></div>
                                    </div>
                                </div>

                                <div class="row-box6-5">

                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>湲곗뾽泥대챸</span></div>
                                                    <div class="col-lg-4" id="companyName" data-sitebuilder="dxTextBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>??곷뀈??/span></div>
                                                    <div class="col-lg-4" id="companyCheckup.checkupYear"
                                                         data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>寃吏??ㅼ떆 湲곌컙</span></div>
                                                    <div class="col-lg-4 center"
                                                         id="companyCheckup.checkupDateBegin"
                                                         data-sitebuilder="dxDateBox"></div>
                                                    <div class="text-center wavy">~</div>
                                                    <div class="col-lg-4 center"
                                                         id="companyCheckup.checkupDateEnd"
                                                         data-sitebuilder="dxDateBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>?덉빟 媛??湲곌컙</span></div>
                                                    <div class="col-lg-4 center"
                                                         id="companyCheckup.reserveDateBegin"
                                                         data-sitebuilder="dxDateBox"></div>
                                                    <div class="text-center wavy">~</div>
                                                    <div class="col-lg-4 center"
                                                         id="companyCheckup.reserveDateEnd"
                                                         data-sitebuilder="dxDateBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-1 tag-name"><span>??곸씤??/span></div>
                                                    <div class="col-lg-2" id="totalNum" data-sitebuilder="dxTextBox"></div>
                                                    <div class="col-lg-1 tag-name"><span>?덉빟吏꾪뻾</span></div>
                                                    <div class="col-lg-2" id="totalEmployeeNum"
                                                         data-sitebuilder="dxTextBox"></div>
                                                    <div class="col-lg-1 tag-name"><span>?섍??꾨즺</span></div>
                                                    <div class="col-lg-2" id="totalFamilyNum"
                                                         data-sitebuilder="dxTextBox"></div>
                                                    <div class="col-lg-1 tag-name"><span>誘몄삁??/span></div>
                                                    <div class="col-lg-2" id="totalNon"
                                                         data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-12" id="Dday" data-sitebuilder="dxTextBox"></div>
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
                                    <div id="dataGridNotice" class="main_table" data-sitebuilder="dxDataGrid"></div>
                                </div>
                            </div>

                            <div class="row-wrap row-wrap-box">
                                <div class="row-wrap">
                                    <div id="dataGridExaminationStatus" data-sitebuilder="dxDataGrid">
                                    </div>
                                </div>
                            </div>


                            <div class="row-wrap row-wrap-box">

                                <div class="row-wrap row-wrap1">
                                    <div class="row-box-title">
                                        <i class="xi-play-circle"></i>寃吏??ㅼ떆 ?꾪솴
                                    </div>
                                    <div class="row-box1">
                                        <div class="row-box-inner width-box">
                                            <div class="col-box1 row">
                                                <div class="col-box1 row">
                                                    <div class="col-lg-6"
                                                         style="justify-content: center; border-right:1px solid #eaecef; padding:50px 0!important">
                                                        <div id="PieCheckupApplication" data-sitebuilder="dxPieChart"></div>
                                                    </div>
                                                    <div class="col-lg-6"
                                                         style="justify-content: center; padding:50px 0!important">
                                                        <div id="PieCheckupCompleted" data-sitebuilder="dxPieChart"></div>
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
        let dxInstances = sitebuilder.createDx(false);

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
                caption: '?쒕쾲',
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
                caption: '援щ텇',
                alignment: 'center',
                lookup: {
                    dataSource: sitebuilder.typeDef.userType,
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                dataField: 'title',
                caption: '?쒕ぉ',
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
                caption: '?묒꽦??,
                alignment: 'center',
            }, {
                dataField: 'writedAt',
                caption: '?묒꽦?쇱떆',
                alignment: 'center',
                dataType: 'datetime',
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    html: '<div class="row-box-title"><i class="xi-play-circle"></i>怨듭??ы빆</div>'
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
                caption: '?⑷퀎',
                alignment: 'center',
                // sortOrder: 'desc',
                visible: false,
            }, {
                dataField: 'count',
                caption: '?쒕쾲',
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
                caption: '蹂묒썝紐?,
                width: 500,
                alignment: 'center',
            }, {
                dataField: 'applyCount',
                caption: '?덉빟吏꾪뻾?몄썝',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.dataCount) {
                        cellElement.text(cellInfo.data.dataCount.applyCount + '紐?);
                    } else {
                        cellElement.text('0紐?);
                    }
                },
            }, {
                dataField: 'checkupedCount',
                caption: '?섍??꾨즺?몄썝',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.dataCount) {
                        cellElement.text(cellInfo.data.dataCount.checkupedCount + '紐?);
                    } else {
                        cellElement.text('0紐?);
                    }
                },
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    html: '<div class="row-box-title"><i class="xi-play-circle"></i>蹂묒썝蹂?寃吏꾪쁽??/div>'
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
        <%--            name: '珥앹씤??,--%>
        <%--            area: 1 - applyCount.toFixed(2)--%>
        <%--        }, {--%>
        <%--            name: '?좎껌?몄썝',--%>
        <%--            area: applyCount.toFixed(2)--%>
        <%--        }],--%>
        <%--        palette: 'Soft',--%>
        <%--        title: '?덉빟?좎껌',--%>
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
        <%--            name: '珥앹씤??,--%>
        <%--            area: 1 - checkupCount.toFixed(2)--%>
        <%--        }, {--%>
        <%--            name: '?섍??꾨즺?몄썝',--%>
        <%--            area: checkupCount.toFixed(2)--%>
        <%--        }],--%>
        <%--        palette: 'Soft Pastel',--%>
        <%--        title: '?섍??꾨즺',--%>
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
                value: totalCount + '紐?,
                type: 'number',
                readOnly: true,
            });
            dxInstances.totalEmployeeNum.option({
                value: applyCount + '紐?,
                type: 'number',
                readOnly: true,
            });
            dxInstances.totalFamilyNum.option({
                value: checkupedCount + '紐?,
                type: 'number',
                readOnly: true,
            });
            dxInstances.totalNon.option({
                value: (totalCount - applyCount - checkupedCount) + '紐?,
                type: 'number',
                readOnly: true,
            });


            let pieApplyTotal = totalCount - checkupedCount;
            let pieApplyCount = applyCount / pieApplyTotal;
            let pieCheckupCount = checkupedCount / totalCount;
            dxInstances.PieCheckupApplication.option({
                dataSource: [{
                    name: '珥앹씤??,
                    area: 1 - pieApplyCount.toFixed(2)
                }, {
                    name: '?좎껌?몄썝',
                    area: pieApplyCount.toFixed(2)
                }],
                palette: 'Soft',
                title: '?덉빟?좎껌',
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
                    name: '珥앹씤??,
                    area: 1 - pieCheckupCount.toFixed(2)
                }, {
                    name: '?섍??꾨즺?몄썝',
                    area: pieCheckupCount.toFixed(2)
                }],
                palette: 'Soft Pastel',
                title: '?섍??꾨즺',
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
            sitebuilder.valuesToDx(response.data);

            let gap = new Date(response.data.companyCheckup.checkupDateEnd).getTime() - new Date().getTime()
            Dday = Math.ceil(gap / (1000 * 60 * 60 * 24));

            dxInstances.Dday.option({
                value: '寃吏꾧린媛꾩씠 ' + Dday + '???⑥븯?듬땲??',
                readOnly: true,
            })
            if (response.data.ciUrl) {
                $('#ciUrl').attr('src', response.data.ciUrl).show();
            }
        });
    });
</script>
</html>
