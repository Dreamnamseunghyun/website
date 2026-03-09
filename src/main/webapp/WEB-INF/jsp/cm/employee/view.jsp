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
                            <h3 class="h3">회원 기본정보 보기</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- 대상년도 -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap2">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>기업체명</span></div>
                                            <div class="col-lg-8 row period">
                                                <div class="col-lg-12" id="companyId"
                                                     data-ggsj="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>대상년도</span></div>
                                            <div class="col-lg-8 row period">
                                                <div class="col-lg-12" id="employeeCheckup.companyCheckupId"
                                                     data-ggsj="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 대상년도 -->

                        <!-- 기본 인적사항 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>기본 인적사항</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>ID</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-9" id="employeeCode"
                                                 data-ggsj="dxTextBox"></div>
                                            <div class="col-lg-3" id="noUse"
                                                 data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>PW</span></div>
                                        <div class="col-lg-10 row period">
                                            <%--                                            <div class="col-lg-12" id="passwordReset"--%>
                                            <%--                                                 data-ggsj="dxButton"></div>--%>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>검진자명</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-9" id="employeeName"
                                                 data-ggsj="dxTextBox"></div>
                                            <div class="col-lg-3" id="employeeCheckup.vip"
                                                 data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>생년월일</span></div>
                                        <div class="col-lg-4 row">
                                            <div class="col-lg-12" id="birth"
                                                 data-ggsj="dxDateBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>휴대전화번호</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="mobile"
                                                 data-ggsj="dxTextBox" data-ggsj-format="tel"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>성별</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-12" id="sex"
                                                 data-ggsj="dxSelectBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <%--주소 표기 다시해야됨--%>
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>우편번호</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2" id="zipcode"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>이메일</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="email"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>주소</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="address1"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>상세주소</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="address2"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>알림톡</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-4" id="employeeCheckup.notokGuide"
                                                 data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-4" id="employeeCheckup.notokReserve"
                                                 data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-4" id="employeeCheckup.notokUrge"
                                                 data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>발송제외 수정일</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeCheckup.notokUpdatedAt"
                                                 data-ggsj="dxDateBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 기본 인적사항 -->

                        <!-- 기업 및 검진정보 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>기업 및 검진정보</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>직원명</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="familyName"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>부서</span></div>
                                        <div class="col-lg-4" id="depart" data-ggsj="dxTextBox"></div>
                                        <div class="col-lg-2 tag-name"><span>직책</span></div>
                                        <div class="col-lg-4" id="title" data-ggsj="dxTextBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>대상자 구분</span></div>
                                        <div class="col-lg-4" id="myself" data-ggsj="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name"><span>비용청구</span></div>
                                        <div class="col-lg-4" id="employeeCheckup.supportType"
                                             data-ggsj="dxSelectBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>사원번호</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeNo"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>검진유형</span></div>
                                        <div class="col-lg-4" id="employeeCheckup.companyCheckupTypeId"
                                             data-ggsj="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name"><span>검진유형명</span></div>
                                        <div class="col-lg-4" id="companyCheckupType.companyCheckupTypeName"
                                             data-ggsj="dxSelectBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>지원금액</span></div>
                                        <div class="col-lg-4" id="companyCheckupType.supportPay"
                                             data-ggsj="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name"><span>본인부담액</span></div>
                                        <div class="col-lg-4" id="companyCheckupType.copay"
                                             data-ggsj="dxSelectBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>특수검진 대상</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeCheckup.specialCheckup"
                                                 data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>특수검진 물질</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeCheckup.specialCheckupMemo"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 col-box-vertical3 row">
                                        <div class="col-lg-1 tag-name"><span>특이사항</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="employeeCheckup.notes"
                                                 data-ggsj="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 기업 및 검진정보 -->

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
        <%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        ggsj.openMenu('employee');

        let dxInstances = ggsj.createDx(true);

        dxInstances.companyId.option({
            displayExpr: 'companyName',
            valueExpr: 'companyId',
            readOnly: true
        });

        dxInstances['employeeCheckup.companyCheckupId'].option({
            displayExpr: 'checkupYear',
            valueExpr: 'companyCheckupId',
            readOnly: true
        });

        dxInstances.employeeCode.option({
            readOnly: true
        });

        dxInstances.noUse.option({
            text: '회원 로그인 중단',
            value: false,
        });

        // dxInstances.passwordReset.option({
        //     text: '비번 초기화',
        //     disabled: true
        // });

        dxInstances.birth.option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            showDropDownButton: false,
        });

        dxInstances['employeeCheckup.notokGuide'].option({
            text: '검진실시 안내',
        });

        dxInstances['employeeCheckup.notokReserve'].option({
            text: '예약 안내',
        });

        dxInstances['employeeCheckup.notokUrge'].option({
            text: '미예약 독려 안내',
        });

        dxInstances['employeeCheckup.notokUpdatedAt'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            showDropDownButton: false,
        });

        dxInstances['employeeCheckup.vip'].option({
            text: 'VIP',
        });

        dxInstances.sex.option({
            dataSource: [
                {'id': 'M', 'text': '남'},
                {'id': 'F', 'text': '여'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.mobile.option({
            placeholder: '휴대전화 11자리',
        });

        // dxInstances.zipcodeSearch.option({
        //     text: '우편번호',
        // });

        dxInstances.depart.option({
            placeholder: '부서',
        });

        dxInstances.title.option({
            placeholder: '직책',
        });

        dxInstances['employeeCheckup.companyCheckupTypeId'].option({
            displayExpr: 'companyCheckupTypeCode',
            valueExpr: 'companyCheckupTypeId',
            onValueChanged: function (e) {
                dxInstances['companyCheckupType.supportPay'].option({value: e.value,});
                dxInstances['companyCheckupType.copay'].option({value: e.value,});
                dxInstances['companyCheckupType.companyCheckupTypeName'].option({value: e.value,});
            },
        });

        dxInstances['companyCheckupType.supportPay'].option({
            displayExpr: function (item) {
                return item && ggsj.numberWithCommas(item.supportPay);
            },
            valueExpr: 'companyCheckupTypeId',
            readOnly: true
        });

        dxInstances['companyCheckupType.copay'].option({
            displayExpr: function (item) {
                return item && ggsj.numberWithCommas(item.copay);
            },
            valueExpr: 'companyCheckupTypeId',
            readOnly: true
        });

        dxInstances['companyCheckupType.companyCheckupTypeName'].option({
            displayExpr: 'companyCheckupTypeName',
            valueExpr: 'companyCheckupTypeId',
            readOnly: true
        });

        dxInstances.myself.option({
            dataSource: [
                {'id': 1, 'text': '본인'},
                {'id': 2, 'text': '가족'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances['employeeCheckup.supportType'].option({
            dataSource: [
                {'id': 0, 'text': '기업부담'},
                {'id': 1, 'text': '본인부담'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances['employeeCheckup.specialCheckup'].option({
            text: '특검대상',
        });

        // Edit
        dxInstances.btnEdit.option({
            stylingMode: 'contained',
            text: '수정',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/cm/employee/${employeeCheckupId}"/>/edit';
            },
        });

        // List
        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '목록',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/cm/employee"/>';
            },
        });

        // Delete
        dxInstances.btnDelete.option({
            stylingMode: 'contained',
            text: '삭제',
            type: 'danger',
            onClick: function () {
                let data = ggsj.dxToValues();

                if (confirm('정말로 삭제하시겠습니까?')) {
                    $.ajax({
                        url: '<c:url value="/cm/employee/${employeeCheckupId}"/>',
                        method: 'DELETE',
                        data: JSON.stringify(data),
                    }).then(function () {
                        location.href = '<c:url value="/cm/employee"/>'
                    });
                }
            },
        });

// load by ajax async
        $.ajax({
            url: '<c:url value="/cm/employee/${employeeCheckupId}"/>',
            method: 'GET',
        }).then(function (response) {
            ggsj.valuesToDx(response.data);

            $.ajax({
                url: '<c:url value="/common/companycheckuptype"/>',
                method: 'GET',
                data: {
                    companyCheckupId: response.data.employeeCheckup.companyCheckupId,
                }
            }).then(function (response2) {
                dxInstances['employeeCheckup.companyCheckupTypeId'].option({
                    dataSource: response2.data,
                });

                dxInstances['companyCheckupType.supportPay'].option({
                    dataSource: response2.data,
                });

                dxInstances['companyCheckupType.copay'].option({
                    dataSource: response2.data,
                });

                dxInstances['companyCheckupType.companyCheckupTypeName'].option({
                    dataSource: response2.data,
                });
            });

            $.ajax({
                url: '<c:url value="/common/company?listType=ALL"/>',
                method: 'GET',
            }).then(function (response3) {
                dxInstances.companyId.option({
                    dataSource: response3.data,
                });

                dxInstances['employeeCheckup.companyCheckupId'].option({
                    dataSource: response3.data,
                });
            });
        });
    });
</script>
</html>
