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
                            <h3 class="h3">기업매니저 수정</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- 기업체 매니저 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>기업체 매니저</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>ID</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-9" id="companyManagerCode" data-ggsj="dxTextBox"></div>
                                            <div class="col-lg-3" id="noUse" data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>소속</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="companyId"
                                                 data-ggsj="dxLookup"></div>
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
                                        <div class="col-lg-2 tag-name"><span>세부업무</span></div>
                                        <div class="col-lg-4 row">
                                            <div class="col-lg-4" id="contract" data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-4" id="result" data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-4" id="account" data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>매니저명</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="companyManagerName"
                                                 data-ggsj="dxTextBox"></div>
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
                                        <div class="col-lg-2 tag-name"><span>이메일</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="email"
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
                        <!-- 기업체 매니저 -->

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
    $(function () {
        ggsj.openMenu('manager');

        let dxInstances = ggsj.createDx(false);

        dxInstances.companyId.option({
            placeholder: "기업체 검색",
            valueExpr: 'companyId',
            displayExpr: 'companyName',
            searchEnabled: true,
            searchExpr: ['companyName'],
        });

        dxInstances.btnResetPW.option({
            text: '비번초기화',
            onClick: function () {
                $.ajax({
                    url: '<c:url value="/pm/manager/reset"/>',
                    method: 'PUT',
                    data: JSON.stringify(ggsj.dxToValues()),
                }).then(function () {
                    ggsj.notify('초기화되었습니다.');
                });
            }
        });

        dxInstances.contract.option({
            text: '계약',
            hoverStateEnabled: false,
            focusStateEnabled: false,
        });

        dxInstances.result.option({
            text: '결과',
            hoverStateEnabled: false,
            focusStateEnabled: false,
        });

        dxInstances.account.option({
            text: '정산',
            hoverStateEnabled: false,
            focusStateEnabled: false,
        });

        dxInstances.noUse.option({
            text: '로그인중지'
        });

        // dxInstances.mobile.option({
        //     mask: '000-0000-0000',
        //     validationRules: [{type: "required"}, {
        //         type: "pattern",
        //         message: '핸드폰 번호를 입력하세요.',
        //         pattern: /^\(\d{3}\) \d{4}-\d{4}$/i
        //     }]
        // });

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            type: 'success',
            onClick: function () {
                let data = ggsj.dxToValues();

                if (!data.companyManagerCode) {
                    alert('ID를 입력하세요');
                    return;
                }

                if (!data.companyManagerName) {
                    alert('이름을 입력하세요');
                    return;
                }

                if (!data.mobile) {
                    alert('휴대전화 번호를 입력하세요');
                    return;
                }

                $.ajax({
                    url: '<c:url value="/pm/manager/${userId}/companyedit"/>',
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
            onClick: function () {
                location.href = '<c:url value="/pm/manager"/>';
            }
        });

        dxInstances.btnDelete.option({
            stylingMode: 'contained',
            type: 'danger',
            onClick: function () {
                if (confirm('정말로 삭제하시겠습니까?')) {
                    $.ajax({
                        url: '<c:url value="/pm/manager/${userId}/company"/>',
                        method: 'DELETE',
                    }).then(function () {
                        location.href = '<c:url value="/pm/manager"/>';
                    });
                }
            },
        });

        let ajaxCompanyList = $.ajax({
            url: '<c:url value="/common/company"/>',
            method: 'GET',
            data: {listType: 'ALL',}
        });

        $.when(ajaxCompanyList).then(function (response) {
            dxInstances.companyId.option({
                dataSource: response.data,
            });

            $.ajax({
                url: '<c:url value="/pm/manager/company/${userId}"/>',
                method: 'GET',
            }).then(function (response) {
                //console.log(response);
                ggsj.valuesToDx(response.data);
            });
        });
    });
</script>

</html>
