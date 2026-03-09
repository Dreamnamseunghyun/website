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
                            <h3 class="h3">1:1Î¨∏Ïùò</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Î¨∏Ïùò?¥Ïö©</div>
                            <div class="row-box1">

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Í∏∞ÏóÖÏ≤?/span></div>
                                        <div class="col-lg-10" id="companyName" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?µÍ??ÑÎ£å</span></div>
                                        <div class="col-lg-10" id="answerCheck" data-sitebuilder="dxCheckBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?ëÏÑ±??/span></div>
                                        <div class="col-lg-10" id="employeeName" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>ÏßàÎ¨∏?ºÏãú</span></div>
                                        <div class="col-lg-10" id="questionAt" data-sitebuilder="dxDateBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Íµ¨Î∂Ñ</span></div>
                                        <div class="col-lg-10" id="category" data-sitebuilder="dxSelectBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?µÎ??ºÏãú</span></div>
                                        <div class="col-lg-10" id="answerAt" data-sitebuilder="dxDateBox"></div>
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

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 col-box-vertical6 row">
                                        <div class="col-lg-1 tag-name"><span>?¥Ïö©</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="question" data-sitebuilder="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">

                                    <div class="col-box1 col-box-vertical6 row">
                                        <div class="col-lg-1 tag-name"><span>?µÍ??ëÏÑ±</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="answer" data-sitebuilder="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnCreate" data-sitebuilder="dxButton"></div>
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton"></div>
                            <div class="col-lg-1" id="btnDelete" data-sitebuilder="dxButton"></div>
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
        sitebuilder.openMenu('one2one');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.answerCheck.option({
            value: false,
            readOnly: true
        });

        dxInstances.questionAt.option({
            readOnly: true,
            alignment: 'center',
            dataType: 'date',
            format: 'yyyy-MM-dd HH:mm:ss'
        });

        dxInstances.category.option({
            items: [
                {'id': 0, 'text': '?àÏïΩÎ¨∏Ïùò'},
                {'id': 1, 'text': 'Í≤∞Í≥º?ÅÎã¥'},
                {'id': 2, 'text': 'Î∂àÎßå?¨Ìï≠'},
                {'id': 3, 'text': '?àÌéò?¥Ï?'},
                {'id': 4, 'text': 'Í∏∞Ì?Î¨∏Ïùò'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
            value: category,
            readOnly: true,
        });

        dxInstances.companyName.option({
            readOnly: true
        });

        dxInstances.employeeName.option({
            readOnly: true
        });

        dxInstances.title.option({
            readOnly: true
        });

        dxInstances.answerAt.option({
            alignment: 'center',
            dataType: 'date',
            format: 'yyyy-MM-dd HH:mm:ss',
            readOnly: true
        });

        dxInstances.question.option({
            toolbar: null,
            readOnly: true
        });

        dxInstances.answer.option({
            toolbar: null,
            readOnly: true
        });

        dxInstances.btnCreate.option({
            stylingMode: 'outlined',
            text: '?µÍ??ëÏÑ±',
            type: 'success',
            onClick: function (e) {
                location.href = '<c:url value="/pm/commune/one2one/${qnaId}"/>/edit';
            },
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: 'Î™©Î°ù',
            type: 'normal',
            onClick: function (e) {
                location.href = '<c:url value="/pm/commune/one2one"/>';
            },
        });

        dxInstances.btnDelete.option({
            stylingMode: 'contained',
            text: '??†ú',
            type: 'danger',
            onClick: function (e) {
                if (confirm('?ïÎßêÎ°???†ú?òÏãúÍ≤†Ïäµ?àÍπå?')) {
                    $.ajax({
                        url: '<c:url value="/pm/commune/one2one/${qnaId}"/>',
                        method: 'DELETE',
                    }).then(function (response) {
                        location.href = '../../../../..'
                    });
                }
            },
        });

        $.ajax({
            url: '<c:url value="/pm/commune/one2one/${qnaId}"/>',
            method: 'GET',
        }).then(function (response) {
            sitebuilder.valuesToDx(response.data);
        });
    });
</script>

</html>
