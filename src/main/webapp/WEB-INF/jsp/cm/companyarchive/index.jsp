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
                            <h3 class="h3">회사보관용 자료</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <%-- checkup type dataGrid --%>
                            <div class="row-wrap row-wrap-box">
                                <div class="row-wrap" style="width:1222px!important;">
                                    <div class="row-box3" style="border:1px solid #eaecef!important; border-right:0!important">
                                        <div class="row-box-inner1">
                                            <div class="col-box1 row">
                                                <div class="col-lg-4 tag-name"><span>대상년도</span></div>
                                                <div class="col-lg-8">
                                                    <div class="col-lg-12" id="selectCheckupYear"
                                                         data-ggsj="dxSelectBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row-box3" style="border:1px solid #eaecef!important; border-right:0!important">
                                        <div class="row-box-inner1">
                                            <div class="col-box1 row" style="border-right:0!important">
                                                <div class="col-lg-4 tag-name"><span>업데이트일시</span></div>
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-12" id="resultSentDate" data-ggsj="dxDateBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row-box3" style="border:1px solid #eaecef!important;">
                                        <div class="row-box-inner1">
                                            <div class="col-box1 row">
                                                <div class="col-lg-4 tag-name"><span>병원선택</span></div>
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-12" id="selectResultHospital" data-ggsj="dxSelectBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>


                            <div class="row-wrap row-wrap-box">
                                <div id="dataGridCheckupResult" class="main_table" data-ggsj="dxDataGrid"
                                     style="height: 35vh;"></div>
                            </div>


                            <div class="row-wrap row-wrap-box">
                                <div class="row-wrap" style="width:815px!important">
                                    <div class="row-box2">
                                        <div class="row-box-inner1">
                                            <div class="col-box1 row" style="border-right:0!important">
                                                <div class="col-lg-4 tag-name"><span>업데이트일시</span></div>
                                                <div class="col-lg-8">
                                                    <div class="col-lg-12" id="ETCSentDate"
                                                         data-ggsj="dxDateBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row-box2">
                                        <div class="row-box-inner1">
                                            <div class="col-box1 row">
                                                <div class="col-lg-4 tag-name"><span>병원선택</span></div>
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-12" id="selectETCHospital" data-ggsj="dxSelectBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row-wrap row-wrap-box">
                            <div id="dataGridEtc" class="main_table" data-ggsj="dxDataGrid" style="height: 35vh;">
                                <!--45vh-->
                            </div>
                            </div>

                        <div id="popupAttach" data-ggsj="dxPopup"></div>
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
        ggsj.openMenu('companyarchive');

        let dxInstances = ggsj.createDx(false);

        let dsHospital = new DevExpress.data.DataSource({
            load: function () {
                return $.ajax({
                    url: '<c:url value="/cm/hospitallist"/>',
                    method: 'GET',
                });
            },
        });

        dxInstances.selectCheckupYear.option({
            dataSource: ggsj.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
            // onValueChanged: function () {
            //     LdxInstances.dataGridCheckupResult.filter();
            // }
        });

        //기업체 건강진단결과표 및 사후관리소견서
        dxInstances.dataGridCheckupResult.option({
            searchPanel: {
                visible: false,
            },
            columns: [{
                //기업체명
                dataField: 'companyName',
                caption: '기업체명',
                alignment: 'center',
            }, {
                //대상년도
                dataField: 'checkupYear',
                caption: '대상년도',
                alignment: 'center',
            }, {
                //병원명
                dataField: 'hospitalName',
                caption: '병원명',
                alignment: 'center',
            }, {
                //자료명
                dataField: 'title',
                caption: '자료명',
                alignment: 'center',
            }, {
                dataField: 'attach',
                type: 'buttons',
                caption: '첨부파일',
                buttons: [{
                    text: '첨부파일',
                    onClick: function (e) {
                        if (e.row.data.companyArchiveFiles[0].companyArchiveFileId) {
                            dxInstances.popupAttach.show();
                            dxInstances.popupAttach.option({
                                title: "첨부파일",
                                closeOnOutsideClick: true,
                                width: 800,
                                height: 500,
                                contentTemplate: function (contentElement) {
                                    return contentElement.append($("<div />").dxDataGrid({
                                        dataSource: e.row.data.companyArchiveFiles,
                                        columns: [{
                                            dataField: 'archiveFilename',
                                            caption: '파일명',
                                        }, {
                                            type: 'buttons',
                                            caption: '다운로드',
                                            buttons: [{
                                                text: '다운로드',
                                                onClick: function (event) {
                                                    location.href = event.row.data.attachUrl;
                                                }
                                            }]
                                        },],
                                    }));
                                },
                            });
                        } else {
                            alert('등록된 파일이 없습니다.');
                        }
                    },
                }],
            },],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '기업체 건강진단결과표 및 사후관리소견서',
                });
            },
        });

        //기타 자료 업로드
        dxInstances.dataGridEtc.option({
            searchPanel: {
                visible: false,
            },
            columns: [{
                //기업체명
                dataField: 'companyName',
                caption: '기업체명',
                alignment: 'center',
            }, {
                //대상년도
                dataField: 'checkupYear',
                caption: '대상년도',
                alignment: 'center',
            }, {
                //병원명
                dataField: 'hospitalName',
                caption: '병원명',
                alignment: 'center',
            }, {
                //자료명
                dataField: 'title',
                caption: '자료명',
                alignment: 'center',
            }, {
                dataField: 'attach',
                type: 'buttons',
                caption: '첨부파일',
                buttons: [{
                    text: '첨부파일',
                    onClick: function (e) {
                        if (e.row.data.companyArchiveFiles[0].companyArchiveFileId) {
                            dxInstances.popupAttach.show();
                            dxInstances.popupAttach.option({
                                title: "첨부파일",
                                closeOnOutsideClick: true,
                                width: 800,
                                height: 500,
                                contentTemplate: function (contentElement) {
                                    return contentElement.append($("<div />").dxDataGrid({
                                        dataSource: e.row.data.companyArchiveFiles,
                                        columns: [{
                                            dataField: 'archiveFilename',
                                            caption: '파일명',
                                        }, {
                                            type: 'buttons',
                                            caption: '다운로드',
                                            buttons: [{
                                                text: '다운로드',
                                                onClick: function (event) {
                                                    location.href = event.row.data.attachUrl;
                                                }
                                            }]
                                        },],
                                    }));
                                },
                            });
                        } else {
                            alert('등록된 파일이 없습니다.');
                        }
                    },
                }],
            },],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '기타 자료 업로드',
                });
            },
        });

        let dsResult = new DevExpress.data.DataSource({
            load: function () {
                return $.ajax({
                    url: '<c:url value="/cm/companyarchive/1"/>',
                    method: 'GET',
                });
            },
        });

        let dsETC = new DevExpress.data.DataSource({
            load: function () {
                return $.ajax({
                    url: '<c:url value="/cm/companyarchive/0"/>',
                    method: 'GET',
                });
            },
        });

        $.when(dsResult.load(), dsETC.load(), dsHospital.load()).then(function (resp1, resp2, resp3) {

            let resultSentAt = resp1[0].map(function (v) {
                return v.sentAt;
            });
            console.log(resultSentAt)
            if (resultSentAt[0] != null) {
                dxInstances.resultSentDate.option({
                    readOnly: true,
                    value: Math.max.apply(null, resultSentAt),
                });
            } else {
                dxInstances.resultSentDate.option({
                    readOnly: true,
                    value: null
                });
            }

            let ETCSentAt = resp2[0].map(function (v) {
                return v.sentAt;
            });
            console.log(ETCSentAt)
            if (ETCSentAt[0] != null) {
                dxInstances.ETCSentDate.option({
                    readOnly: true,
                    value: Math.max.apply(null, ETCSentAt),
                });
            } else {
                dxInstances.ETCSentDate.option({
                    readOnly: true,
                    value: null
                });
            }

            dxInstances.dataGridCheckupResult.option({
                dataSource: resp1[0],
            });

            dxInstances.dataGridEtc.option({
                dataSource: resp2[0],
            });

            dxInstances.selectResultHospital.option({
                items: resp3[1].data,
                valueExpr: 'hospitalId',
                displayExpr: 'hospitalName',
                onValueChanged: function (data) {
                    dxInstances.dataGridCheckupResult.filter(["hospitalId", "=", data.value]);
                }
            });

            dxInstances.selectETCHospital.option({
                items: resp3[1].data,
                valueExpr: 'hospitalId',
                displayExpr: 'hospitalName',
                onValueChanged: function (data) {
                    dxInstances.dataGridEtc.filter(["hospitalId", "=", data.value]);
                }
            });
        });
    });

</script>
</html>
