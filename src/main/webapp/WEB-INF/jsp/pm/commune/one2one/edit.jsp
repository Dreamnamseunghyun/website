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
                            <h3 class="h3">1:1문의</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>문의내용</div>
                            <div class="row-box1">

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>기업체</span></div>
                                        <div class="col-lg-10" id="companyName" data-ggsj="dxTextBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>답글완료</span></div>
                                        <div class="col-lg-10" id="answerCheck" data-ggsj="dxCheckBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>작성자</span></div>
                                        <div class="col-lg-10" id="employeeName" data-ggsj="dxTextBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>질문일시</span></div>
                                        <div class="col-lg-10" id="questionAt" data-ggsj="dxDateBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>구분</span></div>
                                        <div class="col-lg-10" id="category" data-ggsj="dxSelectBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>답변일시</span></div>
                                        <div class="col-lg-10" id="answerAt" data-ggsj="dxDateBox"></div>
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

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 col-box-vertical6 row">
                                        <div class="col-lg-1 tag-name"><span>내용</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="question" data-ggsj="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">

                                    <div class="col-box1 col-box-vertical6 row">
                                        <div class="col-lg-1 tag-name"><span>답글작성</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="answer" data-ggsj="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"></div>
                            <div class="col-lg-1" id="btnList" data-ggsj="dxButton"></div>
                            <div class="col-lg-1" id="btnDelete" data-ggsj="dxButton"></div>
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
    /** @param _dxInstances : {answer} */
    $(function () {
        ggsj.openMenu('one2one');

        let dxInstances = ggsj.createDx(false);

        dxInstances.answerCheck.option({
            value: false,
            text: '답글완료체크'
        });

        dxInstances.questionAt.option({
            alignment: 'center',
            dataType: 'date',
            format: 'yyyy-MM-dd HH:mm:ss',
            readOnly: true
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

        dxInstances.question.option({
            readOnly: true
        });

        dxInstances.category.option({
            items: [
                {'id': 0, 'text': '예약문의'},
                {'id': 1, 'text': '결과상담'},
                {'id': 2, 'text': '불만사항'},
                {'id': 3, 'text': '홈페이지'},
                {'id': 4, 'text': '기타문의'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
            value: category,
            readOnly: true,
        });

        dxInstances.answerAt.option({
            alignment: 'center',
            dataType: 'date',
            format: 'yyyy-MM-dd HH:mm:ss',
            readOnly: true
        });

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '저장',
            type: 'success',
            onClick: function (e) {
                let data = ggsj.dxToValues();

                if (!data.answer) {
                    alert('내용을 입력하세요');
                    return;
                }
                if (!data.title) {
                    alert('제목을 입력하세요');
                    return;
                }
                if (!!data.answer && !data.answerCheck) {
                    alert('답글완료를 체크하세요');
                    return;
                }
                $.ajax({
                    url: '<c:url value="/pm/commune/one2one/${qnaId}/edit"/>',
                    method: 'PUT',
                    data: JSON.stringify(ggsj.dxToValues()),
                }).then(function () {
                    ggsj.notify("저장되었습니다.");
                    location.href = '<c:url value="/pm/commune/one2one"/>';
                });
            },
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '목록',
            onClick: function () {
                location.href = '<c:url value="/pm/commune/one2one"/>';
            }
        });

        dxInstances.btnDelete.option({
            stylingMode: 'contained',
            text: '삭제',
            type: 'danger',
            onClick: function (e) {
                if (confirm('정말로 삭제하시겠습니까?')) {
                    $.ajax({
                        url: '<c:url value="/pm/commune/one2one/${qnaId}"/>',
                        method: 'DELETE',
                    }).then(function (response) {
                        location.href = '../../../../..'
                    });
                }
            },
        });
        // Load
        $.ajax({
            url: '<c:url value="/pm/commune/one2one/${qnaId}"/>',
            method: 'GET',
        }).then(function (response) {
            ggsj.valuesToDx(response.data);
            console.log(response);
        });
    });
</script>
</html>
