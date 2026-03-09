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
                            <h3 class="h3">嫄닿컯??嫄닿컯?곸떇</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>嫄닿컯??嫄닿컯?곸떇</div>
                            <div class="row-box1" style="border-bottom:0;">
                                <div class="row-box-inner col-box-margin-right">

                                    <div class="col-box1 col-box-border">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-1 tag-name">?쒕ぉ</div>
                                                <div class="col-lg-11"><div id="title" data-sitebuilder="dxTextBox"></div></div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-1 tag-name">寃쎈줈吏??/div>
                                                <div class="col-lg-11"><div id="linkUrl" data-sitebuilder="dxTextBox"></div></div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-1 tag-name">?몃꽕??/div>
                                                <div class="col-lg-11"><div id="attachFilename" data-sitebuilder="dxTextBox"></div></div>

                                            </div>


                                        </div>
                                    </div>

                                </div>
                            </div><!--row-box-->
                        </div>

                        <div class="row-wrap">
                            <div class="row-box1" style="border-bottom:0!important;">
                                <div class="row-box-inner col-box-margin-right">

                                    <div class="col-box1 col-box-border">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-box1 col-lg-box-vertical row">

                                                <div class="col-lg-12">
                                                    <img id="fileUrl" class="col-lg-9" src="" alt="嫄닿컯?곸떇?대?吏"
                                                         style="display: none;"/>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div><!--row-box-->
                        </div>

<%--                        <div class="row">--%>
<%--                            <div class="col-lg-1">&nbsp</div>--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-lg-1">?쒕ぉ</div>--%>
<%--                            <div class="col-lg-10" id="title" data-sitebuilder="dxTextBox"></div>--%>
<%--                        </div>--%>

<%--                        <div class="row">--%>
<%--                            <div class="col-lg-1">寃쎈줈吏??/div>--%>
<%--                            <div class="col-lg-10" id="linkUrl" data-sitebuilder="dxTextBox"></div>--%>
<%--                        </div>--%>

<%--                        <div class="row">--%>
<%--                            <div class="col-lg-3"></div>--%>
<%--                            <div class="col-lg-7 file_img"><img id="fileUrl" class="col-lg-9" src="" alt="嫄닿컯?곸떇?대?吏"--%>
<%--                                                                style="display: none;"/></div>--%>
<%--                        </div>--%>



                        <%--                    </div>--%>

                    </div>

                    <div class="row btn_area footer-btn">
                        <div class="col-lg-1" id="btnEdit" data-sitebuilder="dxButton"><i class="xi-save"></i>?섏젙</div>
                        <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">紐⑸줉</div>
                        <div class="col-lg-1" id="btnDelete" data-sitebuilder="dxButton">??젣</div>
                    </div>


                </div>


            </div>
        </div>
        <%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        sitebuilder.openMenu('healthcare');

        let dxInstances = sitebuilder.createDx(true);

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '紐⑸줉',
            onClick: function () {
                location.href = '<c:url value="/pm/healthsense"/>';
            }
        });

        dxInstances.btnEdit.option({
            stylingMode: 'contained',
            text: '?섏젙',
            type: 'success',
            onClick: function (e) {
                console.log(e);
                location.href = '<c:url value="/pm/healthsense/${healthSenseId}"/>/edit';
            }
        });

        dxInstances.btnDelete.option({
            stylingMode: 'contained',
            text: '??젣',
            type: 'danger',
        });

        // load by ajax async
        $.ajax({
            url: '<c:url value="/pm/healthsense/${healthSenseId}"/>',
            method: 'GET',
        }).then(function (response) {
            sitebuilder.valuesToDx(response.data);
            console.log(response.data);

            if (response.data.attachUrl) {
                $('#fileUrl').attr('src', response.data.attachUrl).show();
            }
        });
    });
</script>

</html>
