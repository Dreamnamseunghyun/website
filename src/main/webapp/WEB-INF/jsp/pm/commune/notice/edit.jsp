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
                            <h3 class="h3">Í≥µÏ??¨Ìï≠ ?òÏ†ï</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Í≥µÏ??¨Ìï≠</div>
                            <div class="row-box1">

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Íµ¨Î∂Ñ</span></div>
                                        <div class="col-lg-8" id="group" data-sitebuilder="dxSelectBox"></div>
                                        <div class="col-lg-2" id="topList" data-sitebuilder="dxCheckBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name" id="searchName" data-sitebuilder="dxTextBox"></div>
                                        <div class="col-lg-10" id="targetId" data-sitebuilder="dxLookup"></div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?ëÏÑ±??/span></div>
                                        <div class="col-lg-10" id="writedUserName" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?ëÏÑ±?ºÏãú</span></div>
                                        <div class="col-lg-10" id="writedAt" data-sitebuilder="dxDateBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row center-input">
                                        <div class="col-lg-1 tag-name"><span>?úÎ™©</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="title" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>?¥Ïö©</div>
                            <div class="text-container">
                                <div class="html-editor" id="contents" data-sitebuilder="dxHtmlEditor" style="height: 50vh">
                                </div>
                            </div>
                        </div>


<%--                        <div class="row">--%>

<%--                            <div class="col-lg-2" id="attachFilename" data-sitebuilder="dxTextBox"></div>--%>
<%--                            <div class="col-lg-1 btnGray" id="btnAttach" data-sitebuilder="dxButton"></div>--%>

<%--                            <form id="formAttach">--%>
<%--                                <input type="file" id="attach" name="attach" style="display: none;"/>--%>
<%--                            </form>--%>
<%--                        </div>--%>


                        <div class="row-wrap row-wrap-box">

                            <div class="row-wrap right row-btn">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <form id="formAttach" style="display: none;">
                                                <input type="file" id="attach" name="attach">
                                            </form>
                                            <div class="col-lg-9" id="attachFilename" data-sitebuilder="dxTextBox"></div>
                                            <div class="col-lg-3" id="btnDel" data-sitebuilder="dxButton"></div>
                                        </div>

                                    </div>

                                </div>

                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12">
                                                <div id="btnAttach" data-sitebuilder="dxButton"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>





                    </div>

                    <div class="row btn_area footer-btn">
                        <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>?Ä??/div>
                        <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">Î™©Î°ù</div>
                        <div class="col-lg-1" id="btnDelete" data-sitebuilder="dxButton">??†ú</div>
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
        sitebuilder.openMenu('notice');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.targetId.option({
            searchEnabled: true,
            // searchExpr: 'companyName',
            searchMode: 'contains',
        });

        dxInstances.group.option({
            dataSource: sitebuilder.typeDef.userType,
            onValueChanged: function (e) {
                if (e.previousValue !== null) {
                    dxInstances.targetId.option({
                        value: null,
                    });
                }

                if (e.value === 'CM') {
                    dxInstances.searchName.option({
                        value: 'Í∏∞ÏóÖÏ≤?Í≤Ä??,
                    });
                    LoadCompanyList();
                } else if (e.value === 'HM') {
                    dxInstances.searchName.option({
                        value: 'Î≥ëÏõê Í≤Ä??,
                    });
                    LoadHospitalList();
                } else if (e.value === 'PM') {
                    dxInstances.searchName.option({
                        value: '?¥Î?',
                    });
                    dxInstances.targetId.option({
                        dataSource: null,
                        readOnly: true,
                    });
                } else {
                    dxInstances.searchName.option({
                        value: 'Í∏∞ÏóÖÏ≤?Í≤Ä??,
                    });
                    LoadCompanyList();
                }
            }
        });

        dxInstances.searchName.option({
            readOnly: true,
            value: '- Íµ¨Î∂Ñ ?†ÌÉù -'
        });

        dxInstances.writedUserName.option({
            readOnly: true,
        });

        dxInstances.writedAt.option({
            readOnly: true,
        });

        dxInstances.topList.option({
            text: 'Top Í≥µÏ?',
            value: false,
        });

        dxInstances.btnAttach.option({
            text: '?åÏùºÏ≤®Î?',
            onClick: function () {
                $('#attach').trigger('click');
            },
        });

        dxInstances.btnDel.option({
            text: '?åÏùº??†ú',
            onClick: function () {
                dxInstances.attachFilename.option('value', null);
            },
        });

        dxInstances.attachFilename.option({
            readOnly: true,
        });

        $('#attach').on('change', function () {
            if (this.files.length) {
                dxInstances.attachFilename.option('value', this.files[0].name);
            } else {
                dxInstances.attachFilename.option('value', null);
            }
        });

        // Save
        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '?Ä??,
            type: 'success',
            onClick: function () {
                let data = sitebuilder.dxToValues();

                let formData = new FormData($('#formAttach')[0]);
                formData.append('notice', new Blob([JSON.stringify(data)], {
                    type: "application/json"
                }));

                $.ajax({
                    url: '<c:url value="/pm/commune/notice/${noticeId}"/>',
                    method: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData,
                }).then(function () {
                    sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");
                    <%--location.href = '<c:url value="/pm/commune/notice"/>';--%>
                });
            },
        });

        // List
        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: 'Î™©Î°ù',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/pm/commune/notice"/>';
            },
        });

        // Delete
        dxInstances.btnDelete.option({
            stylingMode: 'contained',
            text: '??†ú',
            type: 'danger',
            onClick: function () {
                if (confirm('?ïÎßêÎ°???†ú?òÏãúÍ≤†Ïäµ?àÍπå?')) {
                    $.ajax({
                        url: '<c:url value="/pm/commune/notice/${noticeId}"/>',
                        method: 'DELETE',
                    }).then(function () {
                        location.href = '<c:url value="/pm/commune/notice"/>'
                    });
                }
            },
        });

        // Load
        $.ajax({
            url: '<c:url value="/pm/commune/notice/${noticeId}"/>',
            method: 'GET',
        }).then(function (response) {
            sitebuilder.valuesToDx(response.data);

            dxInstances.targetId.option({
                value: response.data.targetId,
            });
        });

        function LoadCompanyList() {
            let ajaxCompany = {
                url: '<c:url value="/common/company?listType=LAST_ALL"/>',
                method: 'GET',
            };

            $.when($.ajax(ajaxCompany)).then(function (response) {
                let allCompany = response.data;
                allCompany.unshift({companyId: 0, companyName: '?ÑÏ≤¥'});

                dxInstances.targetId.option({
                    readOnly: false,
                    dataSource: response.data,
                    valueExpr: 'companyId',
                    displayExpr: 'companyName',
                });
            });
        }

        function LoadHospitalList() {
            let ajaxHospital = {
                url: '<c:url value="/common/hospital"/>',
                method: 'GET',
            };

            $.when($.ajax(ajaxHospital)).then(function (response) {
                let allHospital = response.data;
                allHospital.unshift({hospitalId: 0, hospitalName: '?ÑÏ≤¥'});

                dxInstances.targetId.option({
                    readOnly: false,
                    dataSource: response.data,
                    valueExpr: 'hospitalId',
                    displayExpr: 'hospitalName',
                });
            });
        }
    });
</script>
</html>
