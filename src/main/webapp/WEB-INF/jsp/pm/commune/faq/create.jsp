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
                            <h3 class="h3">FAQ ?깅줉</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>FAQ</div>
                            <div class="row-box1">

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>二쇱젣</span></div>
                                        <div class="col-lg-4" id="category" data-sitebuilder="dxSelectBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row center-input">
                                        <div class="col-lg-1 tag-name"><span>?쒕ぉ</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="title" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>?댁슜</div>

                            <div class="text-container">
                                <div class="html-editor" id="contents" data-sitebuilder="dxHtmlEditor" style="height: 50vh">
                                </div>
                            </div>
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>???/div>
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">紐⑸줉</div>
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
        sitebuilder.openMenu('faq');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.category.option({
            dataSource: sitebuilder.typeDef.faqCategory,
            placeholder: "二쇱젣?좏깮",
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '紐⑸줉',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/pm/commune/faq"/>';
            },
        });

        // save by ajax
        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '???,
            type: 'success',
            onClick: function () {
                let data = sitebuilder.dxToValues();
                if (!data.category) {
                    alert('二쇱젣瑜??좏깮?섏꽭??);
                    return;
                }
                if (!data.title) {
                    alert('?쒕ぉ???낅젰?섏꽭??);
                    return;
                }
                if (!data.contents) {
                    alert('?댁슜???낅젰?섏꽭??);
                    return;
                }
                $.ajax({
                    url: '<c:url value="/pm/commune/faq"/>',
                    method: 'POST',
                    data: JSON.stringify(sitebuilder.dxToValues()),
                }).then(function () {
                    sitebuilder.notify("??λ릺?덉뒿?덈떎.");
                    location.href = '<c:url value="/pm/commune/faq"/>';
                });
            },
        });
    });
</script>

</html>
