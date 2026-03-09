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
                            <div class="row-wrap row-wrap1">

                                <div class="row-box1">
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">

                                            <div class="col-lg-12">
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-4 tag-name"><span>업로드 기업체</span></div>
                                                    <div class="col-lg-8" id="selectResultCompany"
                                                         data-ggsj="dxSelectBox"></div>
                                                </div>
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-4 tag-name"><span>대상년도</span></div>
                                                    <div class="col-lg-8" id="selectResultCheckupYear"
                                                         data-ggsj="dxSelectBox"></div>
                                                </div>
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-4 tag-name"><span>자료명</span></div>
                                                    <div class="col-lg-8" id="resultTitle" data-ggsj="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-12 center">
                                                        <div class="col-lg-4">
                                                            <div id="noneResultArchive" data-ggsj="dxCheckBox"></div>
                                                        </div>
                                                        <div class="col-lg-8">
                                                            <div class="btn2" id="btnResultAttach" data-ggsj="dxButton"
                                                                 style="box-shadow: none; margin-right:5px;"></div>
                                                            <div class="btn2" id="btnResultSave" data-ggsj="dxButton"
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
                                 data-ggsj="dxDataGrid" style="height:25vh;"></div>

                        </div>


                        <div class="row-wrap row-wrap-box">

                            <div id="dataGridCheckupResult" class="main_table" data-ggsj="dxDataGrid"
                                 style="height:25vh;"></div>

                        </div>


                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap1">

                                <div class="row-box1">
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row" style="border:1px solid #eaecef">

                                            <div class="col-lg-12">
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-4 tag-name"><span>업로드 기업체</span></div>
                                                    <div class="col-lg-8" id="selectETCCompany"
                                                         data-ggsj="dxSelectBox"></div>
                                                </div>
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-4 tag-name"><span>대상년도</span></div>
                                                    <div class="col-lg-8" id="selectETCCheckupYear"
                                                         data-ggsj="dxSelectBox"></div>
                                                </div>
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-4 tag-name"><span>자료명</span></div>
                                                    <div class="col-lg-8" id="ETCTitle" data-ggsj="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box4 row">
                                                    <div class="col-lg-12 center">
                                                        <div class="col-lg-4">
                                                            <div id="noneETCArchive" data-ggsj="dxCheckBox"></div>
                                                        </div>
                                                        <div class="col-lg-8">
                                                            <div class="btn2" id="btnETCAttach" data-ggsj="dxButton"
                                                                 style="box-shadow: none; margin-right:5px;"></div>
                                                            <div class="btn2" id="btnETCSave" data-ggsj="dxButton"
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
                            <div id="ETCArchiveFilename" class="section sec02 sub_table" data-ggsj="dxDataGrid"
                                 style="height:25vh;"></div>
                        </div>

                            <div class="row-wrap row-wrap-box">

                                <div id="dataGridEtc" class="main_table" data-ggsj="dxDataGrid" style="height:25vh;">
                                </div>

                                <form id="formArchive" style="display:none">
                                    <input type="file" id="archive" name="archive" style="display: none;"
                                           multiple="multiple"/>
                                </form>
                                <div id="popupAttach" data-ggsj="dxPopup"></div>
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
        ggsj.openMenu('companyarchive');

        let dxInstances = ggsj.createDx(false);

        let dsResultList = [];
        let dsETCList = [];

        dxInstances.selectResultCheckupYear.option({
            dataSource: ggsj.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.selectETCCheckupYear.option({
            dataSource: ggsj.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.noneResultArchive.option({
            text: '자료없음',
            onValueChanged: function (e) {
                if (e.value === true) {
                    dxInstances.resultTitle.option({
                        value: '자료없음',
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
            text: '자료없음',
            onValueChanged: function (e) {
                if (e.value === true) {
                    dxInstances.ETCTitle.option({
                        value: '자료없음',
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
            text: '저장',
            type: 'success',
            onClick: function () {
                if (dxInstances.selectResultCompany.option('value') && dxInstances.resultTitle.option('value')) {
                    ggsj.notify("저장중입니다...");
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
                        ggsj.notify("저장되었습니다.");
                        location.reload();
                    });
                } else if (!dxInstances.selectResultCompany.option('value')) {
                    alert('업로드할 기업체를 선택해 주세요');
                } else if (!dxInstances.resultTitle.option('value')) {
                    alert('자료명을 입력해 주세요');
                }
            }
        });

        dxInstances.btnETCSave.option({
            stylingMode: 'outlined',
            text: '저장',
            type: 'success',
            onClick: function () {
                if (dxInstances.selectETCCompany.option('value') && dxInstances.ETCTitle.option('value')) {
                    ggsj.notify("저장중입니다...");
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
                        ggsj.notify("저장되었습니다.");
                        location.reload();
                    });
                } else if (!dxInstances.selectETCCompany.option('value')) {
                    alert('업로드할 기업체를 선택해 주세요');
                } else if (!dxInstances.ETCTitle.option('value')) {
                    alert('자료명을 입력해 주세요');
                }
            }
        });

        dxInstances.btnResultAttach.option({
            text: '파일첨부',
            onClick: function () {
                $('#archive').trigger('click');
                $('#archive').on('change', resultArchive);
            },
        });

        dxInstances.btnETCAttach.option({
            text: '파일첨부',
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
                caption: '파일명',
            }, {
                type: 'buttons',
                caption: '삭제',
                buttons: [{
                    text: '삭제',
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
                    text: '첨부파일',
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
                caption: '파일명',
            }, {
                type: 'buttons',
                caption: '삭제',
                buttons: [{
                    text: '삭제',
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
                    text: '첨부파일',
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
                    alert('자료저장 시 동일한 문서형식(같은 파일의 확장자)의 파일들만\n업로드 가능합니다. (예시 : 자료1-엑셀파일들, 자료2-PDF파일들)');
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
                    alert('자료저장 시 동일한 문서형식(같은 파일의 확장자)의 파일들만\n업로드 가능합니다. (예시 : 자료1-엑셀파일들, 자료2-PDF파일들)');
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

        //기업체 건강진단결과표 및 사후관리소견서
        dxInstances.dataGridCheckupResult.option({
            searchPanel: {
                visible: false,
            },
            columns: [{
                caption: 'CRUD',
                dataField: '_crudType',
                visible: false,
            }, {
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
            }, {
                //등록일
                dataField: 'registeredAt',
                caption: '등록일',
                dataType: 'date',
                alignment: 'center',
            }, {
                type: 'buttons',
                caption: '삭제',
                buttons: [{
                    text: '삭제',
                    onClick: function (e) {
                        if (confirm('정말로 삭제하시겠습니까?')) {
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
                    text: '기업체 건강진단결과표 및 사후관리소견서',
                }, {
                    location: 'after',
                    text: '대상년도',
                }, {
                    location: 'after',
                    widget: "dxSelectBox",
                    options: {
                        width: 200,
                        dataSource: ggsj.typeDef.Year,
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

        //기타 자료 업로드
        dxInstances.dataGridEtc.option({
            searchPanel: {
                visible: false,
            },
            columns: [{
                caption: 'CRUD',
                dataField: '_crudType',
                visible: false,
            }, {
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
                type: 'buttons',
                caption: '첨부파일',
                buttons: [{
                    text: '첨부파일',
                    onClick: function (e) {
                        if (e.row.data.companyArchiveFiles[0].archiveFilename) {
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
                }]
            }, {
                //등록일
                dataField: 'registeredAt',
                caption: '등록일',
                dataType: 'date',
                alignment: 'center',
            }, {
                type: 'buttons',
                caption: '삭제',
                buttons: [{
                    text: '삭제',
                    onClick: function (e) {
                        if (confirm('정말로 삭제하시겠습니까?')) {
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
                    text: '기타 자료 업로드',
                }, {
                    location: 'after',
                    text: '대상년도',
                }, {
                    location: 'after',
                    widget: "dxSelectBox",
                    options: {
                        width: 200,
                        dataSource: ggsj.typeDef.Year,
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

        //HM 담당 companyList
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
