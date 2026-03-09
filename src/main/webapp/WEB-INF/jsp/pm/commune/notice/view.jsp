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
                            <h3 class="h3">Í≥µÏ??¨Ìï≠ ?ÅÏÑ∏</h3>
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
                                        <div class="col-lg-10" id="group" data-sitebuilder="dxSelectBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?ÖÏ≤¥</span></div>
                                        <div class="col-lg-10" id="targetName" data-sitebuilder="dxTextBox"></div>
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
<%--                            <div class="col-lg-9"></div>--%>
<%--                            <div class="col-lg-2" id="attachFilename" data-sitebuilder="dxTextBox"></div>--%>
<%--                            <div class="col-lg-1 btnGray" id="btnAttach" data-sitebuilder="dxButton"></div>--%>
<%--                        </div>--%>


                        <div class="row-wrap row-wrap-box">

                            <div class="row-wrap right row-btn">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">

                                            <div class="col-lg-12" id="attachFilename" data-sitebuilder="dxTextBox"></div>
                                        </div>

                                    </div>

                                </div>

                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12"><div id="btnAttach" data-sitebuilder="dxButton"></div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnEdit" data-sitebuilder="dxButton"><i class="xi-file-check"></i>?òÏ†ï
                            </div>
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

        let dxInstances = sitebuilder.createDx(true);

        dxInstances.group.option({
            dataSource: sitebuilder.typeDef.userType,
        });

        dxInstances.writedAt.option({
            readOnly: true,
        });

        dxInstances.contents.option({
            toolbar: null,
        });

        dxInstances.btnAttach.option({
            text: '?§Ïö¥Î°úÎìú',
            disabled: true,
        });

        dxInstances.attachFilename.option({
            readOnly: true,
        });

        // Edit
        dxInstances.btnEdit.option({
            stylingMode: 'contained',
            text: '?òÏ†ï',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/commune/notice/${noticeId}"/>/edit';
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

            if (response.data.attachUrl) {
                dxInstances.btnAttach.option({
                    disabled: false,
                    onClick: function () {
                        location.href = response.data.attachUrl;
                    }
                });
            }
        });
    });
</script>
</html>
