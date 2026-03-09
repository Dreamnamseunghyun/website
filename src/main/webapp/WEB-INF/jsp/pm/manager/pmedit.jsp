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
                            <h3 class="h3">총괄매니저 수정</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- 총괄 매니저 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>총괄 매니저</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>ID</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-9" id="platformManagerCode" data-ggsj="dxTextBox"></div>
                                            <div class="col-lg-3" id="noUse" data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>세부업무</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-3" id="sales" data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-3" id="admin" data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-3" id="executive" data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-3" id="outsales" data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>PW</span></div>
                                        <div class="col-lg-10 row period center-box">
                                            <div class="col-lg-9 btnGray" id="btnResetPW"
                                                 data-ggsj="dxButton"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>유선</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-12" id="telephone"
                                                 data-ggsj="dxTextBox" data-ggsj-format="tel"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>매니저명</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="platformManagerName"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>휴대전화</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-12" id="mobile"
                                                 data-ggsj="dxTextBox" data-ggsj-format="tel"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>이메일</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="email"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>매출목표</span></div>
                                        <div class="col-lg-10" style="border-left: 1px solid #e0e0e0;">
                                            <div class="col-lg-box2 row">
                                                <div class="col-lg-4 tag-name"><span>대상년도</span></div>
                                                <div class="col-lg-8" id="year" data-ggsj="dxSelectBox"></div>
                                            </div>
                                            <div class="col-lg-box2 row">
                                                <div class="col-lg-4 tag-name"><span>목표액</span></div>
                                                <div class="col-lg-8" id="targetFigure"
                                                     data-ggsj="dxNumberBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 col-box-vertical3 row">
                                        <div class="col-lg-1 tag-name"><span>메모</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="notes"
                                                 data-ggsj="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 총괄 매니저 -->

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"><i class="xi-save"></i>저장</div>
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
    /** @param _dxInstances : {managerType,detailDivision,btnCompanyCreate,lineMobile,noUse,btnResetPW,targetFigure} */
    $(function () {
        ggsj.openMenu('manager');

        let dxInstances = ggsj.createDx(false);

        dxInstances.sales.option({
            text: '영업',
            hoverStateEnabled: false,
            focusStateEnabled: false,
        });

        dxInstances.admin.option({
            text: '행정',
            hoverStateEnabled: false,
            focusStateEnabled: false,
        });

        dxInstances.executive.option({
            text: '임원',
            hoverStateEnabled: false,
            focusStateEnabled: false,
        });

        dxInstances.outsales.option({
            text: '외부영업',
            hoverStateEnabled: false,
            focusStateEnabled: false,
        });

        dxInstances.noUse.option({
            text: '로그인중지',
        });

        dxInstances.btnResetPW.option({
            text: '비번초기화',
            onClick: function () {
                $.ajax({
                    url: '<c:url value="/pm/manager/reset"/>',
                    method: 'PUT',
                    data: JSON.stringify(ggsj.dxToValues()),
                }).then(function () {
                });
            }
        });

        dxInstances.mobile.option({
            mask: '000-0000-0000',
            validationRules: [{type: "required"}, {
                type: "pattern",
                message: "핸드폰 번호를 입력하세요.",
                pattern: /^\(\d{3}\) \d{4}-\d{4}$/i
            }]
        });

        dxInstances.year.option({
            dataSource: ggsj.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '저장',
            type: 'success',
            onClick: function () {
                let data = ggsj.dxToValues();

                if (!data.platformManagerCode) {
                    alert('ID를 입력하세요');
                    return;
                }

                if (!data.platformManagerName) {
                    alert('이름을 입력하세요');
                    return;
                }

                if (!data.mobile) {
                    alert('휴대전화 번호를 입력하세요');
                    return;
                }

                $.ajax({
                    url: '<c:url value="/pm/manager/${userId}/pmedit"/>',
                    method: 'PUT',
                    data: JSON.stringify(ggsj.dxToValues()),
                }).then(function () {
                    ggsj.notify("저장되었습니다.");
                    location.href = '<c:url value="/pm/manager"/>';
                });
            },
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '목록',
            onClick: function () {
                location.href = '<c:url value="/pm/manager"/>';
            }
        });

        dxInstances.btnDelete.option({
            stylingMode: 'contained',
            text: '삭제',
            type: 'danger',
            onClick: function () {
                if (confirm('정말로 삭제하시겠습니까?')) {
                    $.ajax({
                        url: '<c:url value="/pm/manager/${userId}/pm"/>',
                        method: 'DELETE',
                    }).then(function () {
                        location.href = '<c:url value="/pm/manager"/>'
                    });
                }
            },
        });

        $.ajax({
            url: '<c:url value="/pm/manager/pm/${userId}"/>',
            method: 'GET',
        }).then(function (response) {
            console.log(response);
            ggsj.valuesToDx(response.data);
        });
    });
</script>

</html>
