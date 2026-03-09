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
                            <h3 class="h3">?뚯궗蹂닿????먮즺</h3>
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
                                                <div class="col-lg-4 tag-name"><span>??곷뀈??/span></div>
                                                <div class="col-lg-8">
                                                    <div class="col-lg-12" id="selectCheckupYear"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row-box3" style="border:1px solid #eaecef!important; border-right:0!important">
                                        <div class="row-box-inner1">
                                            <div class="col-box1 row" style="border-right:0!important">
                                                <div class="col-lg-4 tag-name"><span>?낅뜲?댄듃?쇱떆</span></div>
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-12" id="resultSentDate" data-sitebuilder="dxDateBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row-box3" style="border:1px solid #eaecef!important;">
                                        <div class="row-box-inner1">
                                            <div class="col-box1 row">
                                                <div class="col-lg-4 tag-name"><span>蹂묒썝?좏깮</span></div>
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-12" id="selectResultHospital" data-sitebuilder="dxSelectBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>


                            <div class="row-wrap row-wrap-box">
                                <div id="dataGridCheckupResult" class="main_table" data-sitebuilder="dxDataGrid"
                                     style="height: 35vh;"></div>
                            </div>


                            <div class="row-wrap row-wrap-box">
                                <div class="row-wrap" style="width:815px!important">
                                    <div class="row-box2">
                                        <div class="row-box-inner1">
                                            <div class="col-box1 row" style="border-right:0!important">
                                                <div class="col-lg-4 tag-name"><span>?낅뜲?댄듃?쇱떆</span></div>
                                                <div class="col-lg-8">
                                                    <div class="col-lg-12" id="ETCSentDate"
                                                         data-sitebuilder="dxDateBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row-box2">
                                        <div class="row-box-inner1">
                                            <div class="col-box1 row">
                                                <div class="col-lg-4 tag-name"><span>蹂묒썝?좏깮</span></div>
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-12" id="selectETCHospital" data-sitebuilder="dxSelectBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row-wrap row-wrap-box">
                            <div id="dataGridEtc" class="main_table" data-sitebuilder="dxDataGrid" style="height: 35vh;">
                                <!--45vh-->
                            </div>
                            </div>

                        <div id="popupAttach" data-sitebuilder="dxPopup"></div>
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
        sitebuilder.openMenu('companyarchive');

        let dxInstances = sitebuilder.createDx(false);

        let dsHospital = new DevExpress.data.DataSource({
            load: function () {
                return $.ajax({
                    url: '<c:url value="/cm/hospitallist"/>',
                    method: 'GET',
                });
            },
        });

        dxInstances.selectCheckupYear.option({
            dataSource: sitebuilder.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
            // onValueChanged: function () {
            //     LdxInstances.dataGridCheckupResult.filter();
            // }
        });

        //湲곗뾽泥?嫄닿컯吏꾨떒寃곌낵??諛??ы썑愿由ъ냼寃ъ꽌
        dxInstances.dataGridCheckupResult.option({
            searchPanel: {
                visible: false,
            },
            columns: [{
                //湲곗뾽泥대챸
                dataField: 'companyName',
                caption: '湲곗뾽泥대챸',
                alignment: 'center',
            }, {
                //??곷뀈??                dataField: 'checkupYear',
                caption: '??곷뀈??,
                alignment: 'center',
            }, {
                //蹂묒썝紐?                dataField: 'hospitalName',
                caption: '蹂묒썝紐?,
                alignment: 'center',
            }, {
                //?먮즺紐?                dataField: 'title',
                caption: '?먮즺紐?,
                alignment: 'center',
            }, {
                dataField: 'attach',
                type: 'buttons',
                caption: '泥⑤??뚯씪',
                buttons: [{
                    text: '泥⑤??뚯씪',
                    onClick: function (e) {
                        if (e.row.data.companyArchiveFiles[0].companyArchiveFileId) {
                            dxInstances.popupAttach.show();
                            dxInstances.popupAttach.option({
                                title: "泥⑤??뚯씪",
                                closeOnOutsideClick: true,
                                width: 800,
                                height: 500,
                                contentTemplate: function (contentElement) {
                                    return contentElement.append($("<div />").dxDataGrid({
                                        dataSource: e.row.data.companyArchiveFiles,
                                        columns: [{
                                            dataField: 'archiveFilename',
                                            caption: '?뚯씪紐?,
                                        }, {
                                            type: 'buttons',
                                            caption: '?ㅼ슫濡쒕뱶',
                                            buttons: [{
                                                text: '?ㅼ슫濡쒕뱶',
                                                onClick: function (event) {
                                                    location.href = event.row.data.attachUrl;
                                                }
                                            }]
                                        },],
                                    }));
                                },
                            });
                        } else {
                            alert('?깅줉???뚯씪???놁뒿?덈떎.');
                        }
                    },
                }],
            },],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '湲곗뾽泥?嫄닿컯吏꾨떒寃곌낵??諛??ы썑愿由ъ냼寃ъ꽌',
                });
            },
        });

        //湲고? ?먮즺 ?낅줈??        dxInstances.dataGridEtc.option({
            searchPanel: {
                visible: false,
            },
            columns: [{
                //湲곗뾽泥대챸
                dataField: 'companyName',
                caption: '湲곗뾽泥대챸',
                alignment: 'center',
            }, {
                //??곷뀈??                dataField: 'checkupYear',
                caption: '??곷뀈??,
                alignment: 'center',
            }, {
                //蹂묒썝紐?                dataField: 'hospitalName',
                caption: '蹂묒썝紐?,
                alignment: 'center',
            }, {
                //?먮즺紐?                dataField: 'title',
                caption: '?먮즺紐?,
                alignment: 'center',
            }, {
                dataField: 'attach',
                type: 'buttons',
                caption: '泥⑤??뚯씪',
                buttons: [{
                    text: '泥⑤??뚯씪',
                    onClick: function (e) {
                        if (e.row.data.companyArchiveFiles[0].companyArchiveFileId) {
                            dxInstances.popupAttach.show();
                            dxInstances.popupAttach.option({
                                title: "泥⑤??뚯씪",
                                closeOnOutsideClick: true,
                                width: 800,
                                height: 500,
                                contentTemplate: function (contentElement) {
                                    return contentElement.append($("<div />").dxDataGrid({
                                        dataSource: e.row.data.companyArchiveFiles,
                                        columns: [{
                                            dataField: 'archiveFilename',
                                            caption: '?뚯씪紐?,
                                        }, {
                                            type: 'buttons',
                                            caption: '?ㅼ슫濡쒕뱶',
                                            buttons: [{
                                                text: '?ㅼ슫濡쒕뱶',
                                                onClick: function (event) {
                                                    location.href = event.row.data.attachUrl;
                                                }
                                            }]
                                        },],
                                    }));
                                },
                            });
                        } else {
                            alert('?깅줉???뚯씪???놁뒿?덈떎.');
                        }
                    },
                }],
            },],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '湲고? ?먮즺 ?낅줈??,
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
