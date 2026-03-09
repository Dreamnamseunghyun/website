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
                            <h3 class="h3">FAQ 상세정보</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>FAQ</div>
                            <div class="row-box1">

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row">
                                        <div class="col-lg-1 tag-name"><span>주제</span></div>
                                        <div class="col-lg-5" id="category" data-ggsj="dxSelectBox"></div>
                                        <div class="col-lg-1 tag-name"><span>작성일시</span></div>
                                        <div class="col-lg-5" id="writedAt" data-ggsj="dxDateBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row center-input">
                                        <div class="col-lg-1 tag-name"><span>제목</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="title" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>내용</div>



                            <div class="text-container">
                                <div class="html-editor" id="contents" data-ggsj="dxHtmlEditor" style="height: 50vh">
                                </div>
                            </div>
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnEdit" data-ggsj="dxButton"><i class="xi-file-check"></i>수정
                            </div>
                            <div class="col-lg-1" id="btnList" data-ggsj="dxButton">목록</div>
                            <div class="col-lg-1" id="btnDelete" data-ggsj="dxButton">삭제</div>
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
        ggsj.openMenu('faq');

        let dxInstances = ggsj.createDx(false);

        dxInstances.category.option({
            dataSource: ggsj.typeDef.faqCategory,
            readOnly: true
        });

        dxInstances.writedAt.option({
            readOnly: true
        });

        dxInstances.title.option({
            readOnly: true
        });

        dxInstances.contents.option({
            toolbar: null,
            readOnly: true
        });

        dxInstances.btnEdit.option({
            stylingMode: 'contained',
            text: '수정',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/commune/faq/${faqId}"/>/edit';
            },
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '목록',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/pm/commune/faq"/>';
            },
        });

        dxInstances.btnDelete.option({
            stylingMode: 'contained',
            text: '삭제',
            type: 'danger',
            onClick: function () {
                if (confirm('정말로 삭제하시겠습니까?')) {
                    $.ajax({
                        url: '<c:url value="/pm/commune/faq/${faqId}"/>',
                        method: 'DELETE',
                    }).then(function () {
                        location.href = '<c:url value="/pm/commune/faq"/>'
                    });
                }
            },
        });

        // load by ajax async
        $.ajax({
            url: '<c:url value="/pm/commune/faq/${faqId}"/>',
            method: 'GET',
        }).then(function (response) {
            ggsj.valuesToDx(response.data);
        });
    });
</script>

</html>
