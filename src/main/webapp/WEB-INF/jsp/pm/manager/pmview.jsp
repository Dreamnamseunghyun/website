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
                            <h3 class="h3">총괄매니저 상세정보</h3>
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
                            <div class="col-lg-1" id="btnEdit" data-ggsj="dxButton"><i class="xi-file-check"></i>수정
                            </div>
                            <div class="col-lg-1" id="btnList" data-ggsj="dxButton">목록</div>
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

        let dxInstances = ggsj.createDx(true);

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
            disabled: true,
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
        // let yearData = ggsj.typeDef.Year
        // yearData.unshift({id: 0, text: '전체'});

        dxInstances.year.option({
            dataSource: ggsj.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.btnEdit.option({
            stylingMode: 'contained',
            text: '수정',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/manager/${userId}"/>/pmedit';
            },
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '목록',
            onClick: function () {
                location.href = '<c:url value="/pm/manager"/>';
            }
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
