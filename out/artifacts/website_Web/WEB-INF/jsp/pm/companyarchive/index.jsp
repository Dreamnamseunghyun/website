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
                            <h3 class="h3">?åÏÇ¨Î≥¥Í????êÎ£å</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <%-- checkup type dataGrid --%>
                            <div class="row-wrap row-wrap-box">
                                <div class="row-wrap">
                                    <div class="row-box2">
                                        <div class="row-box-inner1">
                                            <div class="col-box1 row">
                                                <div class="col-lg-4 tag-name"><span>?Ä?ÅÎÖÑ??/span></div>
                                                <div class="col-lg-8">
                                                    <div class="col-lg-12" id="selectCheckupYear"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row-box2">
                                        <div class="row-box-inner1">
                                            <div class="col-box1 row">
                                                <div class="col-lg-4 tag-name"><span>Í∏∞ÏóÖÏ≤?Í≤Ä??/span></div>
                                                <div class="col-lg-8 row">
                                                    <div class="col-lg-6" id="lookupCompany" data-sitebuilder="dxSelectBox"></div>
                                                    <div class="col-lg-6" id="unregisteredHospital" data-sitebuilder="dxSelectBox"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="row-wrap row-wrap-box" style="margin-bottom:0;">
                                <div id="dataGridCheckupResult" class="main_table" data-sitebuilder="dxDataGrid"
                                     style="height: 35vh;"></div>
                            </div>



                            <div class="row-wrap row-wrap-box">

                                <div class="row-wrap left row-btn">
                                    <div class="row-box" style="width:400px; border:1px solid #eaecef">
                                        <div class="row-box-inner">
                                            <div class="col-box1 row">
                                                <div class="col-lg-5 tag-name"><span>?ÑÏÜ°?ºÏãú</span></div>
                                                <div class="col-lg-7" id="sendDate1" data-sitebuilder="dxDateBox"
                                                     style="width: 250px"></div>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="row-box right-btn">
                                        <div class="row-box-inner">
                                            <div class="col-box1 row">
                                                <div class="col-lg-12">
                                                    <div id="btnSend1"
                                                         data-sitebuilder="dxButton" style="height:34px!important"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        <div class="row-wrap row-wrap-box" style="margin-bottom:0;">
                            <div id="dataGridEtc" class="main_table" data-sitebuilder="dxDataGrid" style="height: 35vh;">
                            </div>
                        </div>


                            <div class="row-wrap row-wrap-box">

                                <div class="row-wrap left row-btn">
                                    <div class="row-box" style="width:400px; border:1px solid #eaecef">
                                        <div class="row-box-inner">
                                            <div class="col-box1 row">
                                                <div class="col-lg-5 tag-name"><span>?ÑÏÜ°?ºÏãú</span></div>
                                                <div class="col-lg-7" id="sendDate2" data-sitebuilder="dxDateBox"
                                                     style="width: 250px"></div>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="row-box right-btn">
                                        <div class="row-box-inner">
                                            <div class="col-box1 row">
                                                <div class="col-lg-12">
                                                    <div id="btnSend2"
                                                         data-sitebuilder="dxButton" style="height:34px!important"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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

        dxInstances.btnSend1.option({
            text: 'Í∏∞ÏóÖ Îß§Îãà?Ä ?ÑÏÜ°',
            onClick: function () {
                $.ajax({
                    url: '<c:url value="/pm/companyarchive/1/sent"/>',
                    method: 'POST',
                }).then(function () {
                    sitebuilder.notify("?ÑÏÜ°?òÏóà?µÎãà??");
                    location.reload();
                });
            }
        });

        dxInstances.btnSend2.option({
            text: 'Í∏∞ÏóÖ Îß§Îãà?Ä ?ÑÏÜ°',
            onClick: function () {
                $.ajax({
                    url: '<c:url value="/pm/companyarchive/0/sent"/>',
                    method: 'POST',
                }).then(function () {
                    sitebuilder.notify("?ÑÏÜ°?òÏóà?µÎãà??");
                    location.reload();
                });
            }
        });

        dxInstances.selectCheckupYear.option({
            dataSource: sitebuilder.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: search,
            // function (data) {
            // dxInstances.dataGridCheckupResult.filter(["checkupYear", "=", data.value]);
            // dxInstances.dataGridEtc.filter(["checkupYear", "=", data.value]);
            // }
        });

        dxInstances.unregisteredHospital.option({
            dataSource: [
                {id: 0, text: '?ÑÏ≤¥'},
                {id: 1, text: 'ÎØ∏Îì±Î°ùÎ≥ë?êÎ≥¥Í∏?},
            ],
            value: 0,
            valueExpr: 'id',
            displayExpr: 'text',
            // onValueChanged: function () {
            //     LdxInstances.dataGridCheckupResult.filter();
            // }
        });

        //Í∏∞ÏóÖÏ≤?Í±¥Í∞ïÏßÑÎã®Í≤∞Í≥º??Î∞??¨ÌõÑÍ¥ÄÎ¶¨ÏÜåÍ≤¨ÏÑú
        dxInstances.dataGridCheckupResult.option({
            paging: {
                pageSize: 10,
            },
            searchPanel: {
                visible: false,
            },
            columns: [{
                //Í∏∞ÏóÖÏ≤¥Î™Ö
                dataField: 'companyName',
                caption: 'Í∏∞ÏóÖÏ≤¥Î™Ö',
                alignment: 'center',
            }, {
                //?Ä?ÅÎÖÑ??                dataField: 'checkupYear',
                caption: '?Ä?ÅÎÖÑ??,
                alignment: 'center',
            }, {
                //Î≥ëÏõêÎ™?                dataField: 'hospitalName',
                caption: 'Î≥ëÏõêÎ™?,
                alignment: 'center',
            }, {
                //?êÎ£åÎ™?                dataField: 'title',
                caption: '?êÎ£åÎ™?,
                alignment: 'center',
            }, {
                dataField: 'attach',
                type: 'buttons',
                caption: 'Ï≤®Î??åÏùº',
                buttons: [{
                    text: 'Ï≤®Î??åÏùº',
                    onClick: function (e) {
                        if (e.row.data.companyArchiveFiles[0].companyArchiveFileId) {
                            dxInstances.popupAttach.show();
                            dxInstances.popupAttach.option({
                                title: "Ï≤®Î??åÏùº",
                                closeOnOutsideClick: true,
                                width: 800,
                                height: 500,
                                contentTemplate: function (contentElement) {
                                    return contentElement.append($("<div />").dxDataGrid({
                                        dataSource: e.row.data.companyArchiveFiles,
                                        columns: [{
                                            dataField: 'archiveFilename',
                                            caption: '?åÏùºÎ™?,
                                        }, {
                                            type: 'buttons',
                                            caption: '?§Ïö¥Î°úÎìú',
                                            buttons: [{
                                                text: '?§Ïö¥Î°úÎìú',
                                                onClick: function (event) {
                                                    location.href = event.row.data.attachUrl;
                                                }
                                            }]
                                        },],
                                    }));
                                },
                            });
                        } else {
                            alert('?±Î°ù???åÏùº???ÜÏäµ?àÎã§.');
                        }
                    },
                }],
            }, {
                //?±Î°ù??                dataField: 'registeredAt',
                caption: '?±Î°ù??,
                dataType: 'date',
                alignment: 'center',
            }, {
                type: 'buttons',
                caption: '??†ú',
                buttons: [{
                    text: '??†ú',
                    onClick: function (e) {
                        if (confirm('?ïÎßêÎ°???†ú?òÏãúÍ≤†Ïäµ?àÍπå?')) {
                            $.ajax({
                                url: '<c:url value="/pm/companyarchive"/>/' + e.row.data.companyArchiveId,
                                method: 'POST',
                            }).then(function () {
                                location.href = '<c:url value="/pm/companyarchive"/>';
                            });
                        }
                    }
                }]
            },],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: 'Í∏∞ÏóÖÏ≤?Í±¥Í∞ïÏßÑÎã®Í≤∞Í≥º??Î∞??¨ÌõÑÍ¥ÄÎ¶¨ÏÜåÍ≤¨ÏÑú',
                });
            },
        });

        //Í∏∞Ì? ?êÎ£å ?ÖÎ°ú??        dxInstances.dataGridEtc.option({
            paging: {
                pageSize: 10,
            },
            searchPanel: {
                visible: false,
            },
            columns: [{
                //Í∏∞ÏóÖÏ≤¥Î™Ö
                dataField: 'companyName',
                caption: 'Í∏∞ÏóÖÏ≤¥Î™Ö',
                alignment: 'center',
            }, {
                //?Ä?ÅÎÖÑ??                dataField: 'checkupYear',
                caption: '?Ä?ÅÎÖÑ??,
                alignment: 'center',
            }, {
                //Î≥ëÏõêÎ™?                dataField: 'hospitalName',
                caption: 'Î≥ëÏõêÎ™?,
                alignment: 'center',
            }, {
                //?êÎ£åÎ™?                dataField: 'title',
                caption: '?êÎ£åÎ™?,
                alignment: 'center',
            }, {
                dataField: 'attach',
                type: 'buttons',
                caption: 'Ï≤®Î??åÏùº',
                buttons: [{
                    text: 'Ï≤®Î??åÏùº',
                    onClick: function (e) {
                        if (e.row.data.companyArchiveFiles[0].companyArchiveFileId) {
                            dxInstances.popupAttach.show();
                            dxInstances.popupAttach.option({
                                title: "Ï≤®Î??åÏùº",
                                closeOnOutsideClick: true,
                                width: 800,
                                height: 500,
                                contentTemplate: function (contentElement) {
                                    return contentElement.append($("<div />").dxDataGrid({
                                        dataSource: e.row.data.companyArchiveFiles,
                                        columns: [{
                                            dataField: 'archiveFilename',
                                            caption: '?åÏùºÎ™?,
                                        }, {
                                            type: 'buttons',
                                            caption: '?§Ïö¥Î°úÎìú',
                                            buttons: [{
                                                text: '?§Ïö¥Î°úÎìú',
                                                onClick: function (event) {
                                                    location.href = event.row.data.attachUrl;
                                                }
                                            }]
                                        },],
                                    }));
                                },
                            });
                        } else {
                            alert('?±Î°ù???åÏùº???ÜÏäµ?àÎã§.');
                        }
                    },
                }],
            }, {
                //?±Î°ù??                dataField: 'registeredAt',
                caption: '?±Î°ù??,
                dataType: 'date',
                alignment: 'center',
            }, {
                type: 'buttons',
                caption: '??†ú',
                buttons: [{
                    text: '??†ú',
                    onClick: function (e) {
                        if (confirm('?ïÎßêÎ°???†ú?òÏãúÍ≤†Ïäµ?àÍπå?')) {
                            $.ajax({
                                url: '<c:url value="/pm/companyarchive"/>/' + e.row.data.companyArchiveId,
                                method: 'POST',
                            }).then(function () {
                                location.href = '<c:url value="/pm/companyarchive"/>';
                            });
                        }
                    }
                }]
            },],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: 'Í∏∞Ì? ?êÎ£å ?ÖÎ°ú??,
                });
            },
        });

        let dsResult = new DevExpress.data.DataSource({
            load: function () {
                return $.ajax({
                    url: '<c:url value="/pm/companyarchive/1"/>',
                    method: 'GET',
                });
            },
        });

        let dsETC = new DevExpress.data.DataSource({
            load: function () {
                return $.ajax({
                    url: '<c:url value="/pm/companyarchive/0"/>',
                    method: 'GET',
                });
            },
        });

        let ajaxCompanyList = $.ajax({
            url: '<c:url value="/common/company?listType=LAST_ALL"/>',
        });

        $.when(ajaxCompanyList, dsResult.load(), dsETC.load()).then(function (resp1, resp2, resp3) {
            let dsCompany = resp1[0].data.map(function (v) {
                return v;
            });

            dxInstances.lookupCompany.option({
                items: dsCompany,
                valueExpr: 'companyId',
                displayExpr: 'companyName',
                onValueChanged: search,
                //     function (data) {
                //     dxInstances.dataGridCheckupResult.filter(["companyId", "=", data.value]);
                //     dxInstances.dataGridEtc.filter(["companyId", "=", data.value]);
                // }
            });

            dxInstances.dataGridCheckupResult.option({
                dataSource: resp2[1].data,
            });

            let resultSentAt = resp2[1].data.map(function (v) {
                return v.sentAt;
            });
            if (resultSentAt[0] != null) {
                dxInstances.sendDate1.option({
                    readOnly: true,
                    value: Math.max.apply(null, resultSentAt),
                });
            } else {
                dxInstances.sendDate1.option({
                    readOnly: true,
                    value: null
                });
            }

            let ETCSentAt = resp3[1].data.map(function (v) {
                return v.sentAt;
            });
            if (ETCSentAt[0] != null) {
                dxInstances.sendDate2.option({
                    readOnly: true,
                    value: Math.max.apply(null, ETCSentAt),
                });
            } else {
                dxInstances.sendDate2.option({
                    readOnly: true,
                    value: null
                });
            }

            dxInstances.dataGridEtc.option({
                dataSource: resp3[1].data,
            });
        });

        function search() {
            let filters = [];

            if (dxInstances.selectCheckupYear.option('value')) {
                filters.push(['checkupYear', "=", dxInstances.selectCheckupYear.option('value')]);
            }

            if (dxInstances.lookupCompany.option('value')) {
                filters.push('and');
                filters.push(['companyId', "=", dxInstances.lookupCompany.option('value')]);
            }

            // if (dxInstances.unregisteredHospital.option('value')) {
            //     filters.push('and');
            //     filters.push(['', "=", dxInstances.unregisteredHospital.option('value')]);
            // }
            dxInstances.dataGridCheckupResult.filter(filters);
            dxInstances.dataGridEtc.filter(filters);
        }
    });

</script>
</html>
