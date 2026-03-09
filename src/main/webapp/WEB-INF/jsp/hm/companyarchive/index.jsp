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
                            <div class="row-wrap row-wrap1">

                                <div class="row-box1">
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">

                                            <div class="col-lg-12">
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-4 tag-name"><span>?낅줈??湲곗뾽泥?/span></div>
                                                    <div class="col-lg-8" id="selectResultCompany"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                </div>
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-4 tag-name"><span>??곷뀈??/span></div>
                                                    <div class="col-lg-8" id="selectResultCheckupYear"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                </div>
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-4 tag-name"><span>?먮즺紐?/span></div>
                                                    <div class="col-lg-8" id="resultTitle" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-12 center">
                                                        <div class="col-lg-4">
                                                            <div id="noneResultArchive" data-sitebuilder="dxCheckBox"></div>
                                                        </div>
                                                        <div class="col-lg-8">
                                                            <div class="btn2" id="btnResultAttach" data-sitebuilder="dxButton"
                                                                 style="box-shadow: none; margin-right:5px;"></div>
                                                            <div class="btn2" id="btnResultSave" data-sitebuilder="dxButton"
                                                                 style="border:none;"></div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>


                        <div class="row-wrap row-wrap-box">

                            <div id="resultArchiveFilename" class="section sec02 sub_table"
                                 data-sitebuilder="dxDataGrid" style="height:25vh;"></div>

                        </div>


                        <div class="row-wrap row-wrap-box">

                            <div id="dataGridCheckupResult" class="main_table" data-sitebuilder="dxDataGrid"
                                 style="height:25vh;"></div>

                        </div>


                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap1">

                                <div class="row-box1">
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row" style="border:1px solid #eaecef">

                                            <div class="col-lg-12">
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-4 tag-name"><span>?낅줈??湲곗뾽泥?/span></div>
                                                    <div class="col-lg-8" id="selectETCCompany"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                </div>
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-4 tag-name"><span>??곷뀈??/span></div>
                                                    <div class="col-lg-8" id="selectETCCheckupYear"
                                                         data-sitebuilder="dxSelectBox"></div>
                                                </div>
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-4 tag-name"><span>?먮즺紐?/span></div>
                                                    <div class="col-lg-8" id="ETCTitle" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-12 center">
                                                        <div class="col-lg-4">
                                                            <div id="noneETCArchive" data-sitebuilder="dxCheckBox"></div>
                                                        </div>
                                                        <div class="col-lg-8">
                                                            <div class="btn2" id="btnETCAttach" data-sitebuilder="dxButton"
                                                                 style="box-shadow: none; margin-right:5px;"></div>
                                                            <div class="btn2" id="btnETCSave" data-sitebuilder="dxButton"
                                                                 style="border:none;"></div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="row-wrap row-wrap-box">
                            <div id="ETCArchiveFilename" class="section sec02 sub_table" data-sitebuilder="dxDataGrid"
                                 style="height:25vh;"></div>
                        </div>

                            <div class="row-wrap row-wrap-box">

                                <div id="dataGridEtc" class="main_table" data-sitebuilder="dxDataGrid" style="height:25vh;">
                                </div>

                                <form id="formArchive" style="display:none">
                                    <input type="file" id="archive" name="archive" style="display: none;"
                                           multiple="multiple"/>
                                </form>
                                <div id="popupAttach" data-sitebuilder="dxPopup"></div>
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
        sitebuilder.openMenu('companyarchive');

        let dxInstances = sitebuilder.createDx(false);

        let dsResultList = [];
        let dsETCList = [];

        dxInstances.selectResultCheckupYear.option({
            dataSource: sitebuilder.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.selectETCCheckupYear.option({
            dataSource: sitebuilder.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.noneResultArchive.option({
            text: '?먮즺?놁쓬',
            onValueChanged: function (e) {
                if (e.value === true) {
                    dxInstances.resultTitle.option({
                        value: '?먮즺?놁쓬',
                        readOnly: true,
                    });
                    dxInstances.btnResultAttach.option({
                        disabled: true,
                    });
                } else {
                    dxInstances.resultTitle.option({
                        value: '',
                        readOnly: false,
                    });
                    dxInstances.btnResultAttach.option({
                        disabled: false,
                    });
                }
            },
        });

        dxInstances.noneETCArchive.option({
            text: '?먮즺?놁쓬',
            onValueChanged: function (e) {
                if (e.value === true) {
                    dxInstances.ETCTitle.option({
                        value: '?먮즺?놁쓬',
                        readOnly: true,
                    });
                    dxInstances.btnETCAttach.option({
                        disabled: true,
                    });
                } else {
                    dxInstances.ETCTitle.option({
                        value: '',
                        readOnly: false,
                    });
                    dxInstances.btnETCAttach.option({
                        disabled: false,
                    });
                }
            },
        });

        dxInstances.btnResultSave.option({
            stylingMode: 'outlined',
            text: '???,
            type: 'success',
            onClick: function () {
                if (dxInstances.selectResultCompany.option('value') && dxInstances.resultTitle.option('value')) {
                    sitebuilder.notify("??μ쨷?낅땲??..");
                    let data = {};
                    data.companyId = dxInstances.selectResultCompany.option('value');
                    data.checkupYear = dxInstances.selectResultCheckupYear.option('value');
                    data.title = dxInstances.resultTitle.option('value');
                    data.type = 1;
                    data.companyArchiveFiles = dsResultList;

                    console.log(data);
                    let formData = new FormData($('#formAttach')[0]);
                    for (let i = 0; i < fileList.length; i++) {
                        formData.append('archive', fileList[i]);
                    }
                    formData.append('companyArchive', new Blob([JSON.stringify(data)], {
                        type: "application/json"
                    }));
                    $.ajax({
                        url: '<c:url value="/hm/companyarchive"/>',
                        method: 'POST',
                        processData: false,
                        contentType: false,
                        data: formData,
                    }).then(function () {
                        sitebuilder.notify("??λ릺?덉뒿?덈떎.");
                        location.reload();
                    });
                } else if (!dxInstances.selectResultCompany.option('value')) {
                    alert('?낅줈?쒗븷 湲곗뾽泥대? ?좏깮??二쇱꽭??);
                } else if (!dxInstances.resultTitle.option('value')) {
                    alert('?먮즺紐낆쓣 ?낅젰??二쇱꽭??);
                }
            }
        });

        dxInstances.btnETCSave.option({
            stylingMode: 'outlined',
            text: '???,
            type: 'success',
            onClick: function () {
                if (dxInstances.selectETCCompany.option('value') && dxInstances.ETCTitle.option('value')) {
                    sitebuilder.notify("??μ쨷?낅땲??..");
                    let data = {};
                    data.companyId = dxInstances.selectETCCompany.option('value');
                    data.checkupYear = dxInstances.selectETCCheckupYear.option('value');
                    data.title = dxInstances.ETCTitle.option('value');
                    data.type = 0;
                    data.companyArchiveFiles = dsETCList;

                    let formData = new FormData($('#formAttach')[0]);
                    for (let i = 0; i < fileList.length; i++) {
                        formData.append('archive', fileList[i]);
                    }
                    formData.append('companyArchive', new Blob([JSON.stringify(data)], {
                        type: "application/json"
                    }));
                    $.ajax({
                        url: '<c:url value="/hm/companyarchive"/>',
                        method: 'POST',
                        processData: false,
                        contentType: false,
                        data: formData,
                    }).then(function () {
                        sitebuilder.notify("??λ릺?덉뒿?덈떎.");
                        location.reload();
                    });
                } else if (!dxInstances.selectETCCompany.option('value')) {
                    alert('?낅줈?쒗븷 湲곗뾽泥대? ?좏깮??二쇱꽭??);
                } else if (!dxInstances.ETCTitle.option('value')) {
                    alert('?먮즺紐낆쓣 ?낅젰??二쇱꽭??);
                }
            }
        });

        dxInstances.btnResultAttach.option({
            text: '?뚯씪泥⑤?',
            onClick: function () {
                $('#archive').trigger('click');
                $('#archive').on('change', resultArchive);
            },
        });

        dxInstances.btnETCAttach.option({
            text: '?뚯씪泥⑤?',
            onClick: function () {
                $('#archive').trigger('click');
                $('#archive').on('change', ETCArchive);
            },
        });

        dxInstances.resultArchiveFilename.option({
            searchPanel: {
                visible: false,
            },
            showBorders: true,
            columns: [{
                dataField: 'archiveFilename',
                caption: '?뚯씪紐?,
            }, {
                type: 'buttons',
                caption: '??젣',
                buttons: [{
                    text: '??젣',
                    onClick: function (e) {
                        delete dsResultList[e.row.rowIndex];
                        dsResultList = dsResultList.filter(function (item) {
                            return item !== null && item !== undefined && item !== '';
                        });
                        dxInstances.resultArchiveFilename.option({
                            dataSource: dsResultList,
                        });
                    }
                }]
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '泥⑤??뚯씪',
                });
            },
        });

        dxInstances.ETCArchiveFilename.option({
            searchPanel: {
                visible: false,
            },
            showBorders: true,
            columns: [{
                dataField: 'archiveFilename',
                caption: '?뚯씪紐?,
            }, {
                type: 'buttons',
                caption: '??젣',
                buttons: [{
                    text: '??젣',
                    onClick: function (e) {
                        delete dsETCList[e.row.rowIndex];
                        dsETCList = dsETCList.filter(function (item) {
                            return item !== null && item !== undefined && item !== '';
                        });
                        dxInstances.ETCArchiveFilename.option({
                            dataSource: dsETCList,
                        });
                    }
                }]
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '泥⑤??뚯씪',
                });
            },
        });

        let formData = [];
        let fileList = new Object();
        let file;

        function resultArchive() {
            fileList = this.files || [];
            if (!fileList.length) return;

            for (let i = 0; i < fileList.length; i++) {
                if (fileList[0].type !== fileList[i].type) {
                    alert('?먮즺??????숈씪??臾몄꽌?뺤떇(媛숈? ?뚯씪???뺤옣?????뚯씪?ㅻ쭔\n?낅줈??媛?ν빀?덈떎. (?덉떆 : ?먮즺1-?묒??뚯씪?? ?먮즺2-PDF?뚯씪??');
                    location.reload();
                }

                file = fileList[i];
                let resultRow = {};

                let files = this.files || [];
                if (!files.length) return;
                if (files.length) {
                    resultRow.archiveFilename = fileList[i].name;
                    resultRow._crudType = 'INSERT';
                } else {
                    resultRow.archiveFilename = null;
                }
                dsResultList.push(resultRow);
            }
            dxInstances.resultArchiveFilename.option({
                dataSource: dsResultList,
            });
            dxInstances.btnResultAttach.option({
                disabled: true
            });
        }

        function ETCArchive() {
            fileList = this.files || [];
            if (!fileList.length) return;

            for (let i = 0; i < fileList.length; i++) {
                if (fileList[0].type !== fileList[i].type) {
                    alert('?먮즺??????숈씪??臾몄꽌?뺤떇(媛숈? ?뚯씪???뺤옣?????뚯씪?ㅻ쭔\n?낅줈??媛?ν빀?덈떎. (?덉떆 : ?먮즺1-?묒??뚯씪?? ?먮즺2-PDF?뚯씪??');
                    location.reload();
                }

                file = fileList[i];
                let resultRow = {};

                let files = this.files || [];
                if (!files.length) return;
                if (files.length) {
                    resultRow.archiveFilename = fileList[i].name;
                    resultRow._crudType = 'INSERT';
                } else {
                    resultRow.archiveFilename = null;
                }
                dsETCList.push(resultRow);
            }
            dxInstances.ETCArchiveFilename.option({
                dataSource: dsETCList,
            });
            dxInstances.btnETCAttach.option({
                disabled: true
            });
        }

        //湲곗뾽泥?嫄닿컯吏꾨떒寃곌낵??諛??ы썑愿由ъ냼寃ъ꽌
        dxInstances.dataGridCheckupResult.option({
            searchPanel: {
                visible: false,
            },
            columns: [{
                caption: 'CRUD',
                dataField: '_crudType',
                visible: false,
            }, {
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
            }, {
                //?깅줉??                dataField: 'registeredAt',
                caption: '?깅줉??,
                dataType: 'date',
                alignment: 'center',
            }, {
                type: 'buttons',
                caption: '??젣',
                buttons: [{
                    text: '??젣',
                    onClick: function (e) {
                        if (confirm('?뺣쭚濡???젣?섏떆寃좎뒿?덇퉴?')) {
                            $.ajax({
                                url: '<c:url value="/hm/companyarchive"/>/' + e.row.data.companyArchiveId,
                                method: 'POST',
                            }).then(function () {
                                location.href = '<c:url value="/hm/companyarchive"/>';
                            });
                        }
                    }
                }]
            },],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '湲곗뾽泥?嫄닿컯吏꾨떒寃곌낵??諛??ы썑愿由ъ냼寃ъ꽌',
                }, {
                    location: 'after',
                    text: '??곷뀈??,
                }, {
                    location: 'after',
                    widget: "dxSelectBox",
                    options: {
                        width: 200,
                        dataSource: sitebuilder.typeDef.Year,
                        value: new Date().getFullYear(),
                        valueExpr: 'id',
                        displayExpr: 'text',
                        onValueChanged: function (data) {
                            dxInstances.dataGridCheckupResult.filter(["checkupYear", "=", data.value]);
                        }
                    }
                });
            },
        });

        //湲고? ?먮즺 ?낅줈??        dxInstances.dataGridEtc.option({
            searchPanel: {
                visible: false,
            },
            columns: [{
                caption: 'CRUD',
                dataField: '_crudType',
                visible: false,
            }, {
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
                type: 'buttons',
                caption: '泥⑤??뚯씪',
                buttons: [{
                    text: '泥⑤??뚯씪',
                    onClick: function (e) {
                        if (e.row.data.companyArchiveFiles[0].archiveFilename) {
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
                }]
            }, {
                //?깅줉??                dataField: 'registeredAt',
                caption: '?깅줉??,
                dataType: 'date',
                alignment: 'center',
            }, {
                type: 'buttons',
                caption: '??젣',
                buttons: [{
                    text: '??젣',
                    onClick: function (e) {
                        if (confirm('?뺣쭚濡???젣?섏떆寃좎뒿?덇퉴?')) {
                            $.ajax({
                                url: '<c:url value="/hm/companyarchive"/>/' + e.row.data.companyArchiveId,
                                method: 'POST',
                            }).then(function () {
                                location.href = '<c:url value="/hm/companyarchive"/>';
                            });
                        }
                    }
                }]
            },],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '湲고? ?먮즺 ?낅줈??,
                }, {
                    location: 'after',
                    text: '??곷뀈??,
                }, {
                    location: 'after',
                    widget: "dxSelectBox",
                    options: {
                        width: 200,
                        dataSource: sitebuilder.typeDef.Year,
                        value: new Date().getFullYear(),
                        valueExpr: 'id',
                        displayExpr: 'text',
                        onValueChanged: function (data) {
                            dxInstances.dataGridEtc.filter(["checkupYear", "=", data.value]);
                        }
                    }
                });
            },
        });

        //HM ?대떦 companyList
        let ajaxCompanyList = $.ajax({
            url: '<c:url value="/hm/companylist"/>',
            method: 'GET',
        });

        let ajaxResultList = $.ajax({
            url: '<c:url value="/hm/companyarchive/1"/>',
            method: 'GET',
        });

        let ajaxEtcList = $.ajax({
            url: '<c:url value="/hm/companyarchive/0"/>',
            method: 'GET',
        });

        $.when(ajaxResultList, ajaxEtcList, ajaxCompanyList).then(function (respResult, respEtc, respCompany) {
// Load
            if (respResult[0].data.length > 0) {
                let companyArchiveFiles = respResult[0].data[0].companyArchiveFiles;

                dxInstances.resultArchiveFilename.option({
                    fileSystemProvider: companyArchiveFiles,
                });
            }

            dxInstances.dataGridCheckupResult.option({
                dataSource: respResult[0].data,
            });

            dxInstances.dataGridEtc.option({
                dataSource: respEtc[0].data,
            });

            if (respCompany[0].data.length > 0) {
                let dsCompany = respCompany[0].data.map(function (v) {
                    return v;
                });

                dxInstances.selectResultCompany.option({
                    items: dsCompany,
                    valueExpr: 'companyId',
                    displayExpr: 'companyName',
                });

                dxInstances.selectETCCompany.option({
                    items: dsCompany,
                    valueExpr: 'companyId',
                    displayExpr: 'companyName',
                });
            }
        });
    });

</script>
</html>
