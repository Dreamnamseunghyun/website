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
                            <h3 class="h3">회원 기본정보 등록</h3>
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
                                                <div class="col-lg-12" id="lookupCompany"
                                                     data-ggsj="dxLookup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2" style="display: none" id="employeeCheckup.companyCheckupId"
                                     data-ggsj="dxTextBox"></div>
                                <div class="col-lg-2" style="display: none" id="companyId" data-ggsj="dxTextBox"></div>

                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>대상년도</span></div>
                                            <div class="col-lg-8 row period">
                                                <div class="col-lg-12" id="employeeCheckup.checkupYear"
                                                     data-ggsj="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!-- 대상년도 -->

                        <!-- 기본 인적사항 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>기본 인적사항
                                <div class="checkText right"><i class="xi-check-min"></i>필수입력 항목입니다.</div>
                            </div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>ID</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-9" id="employeeCode" data-ggsj="dxTextBox"></div>
                                            <div class="col-lg-3">
                                                <div class="btnGray" id="userIdCheck" data-ggsj="dxButton"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>PW</span></div>
                                        <div class="col-lg-10 row period center-box">
                                            <div class="col-lg-12" id="userPw"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>검진자명</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-10" id="employeeName"
                                                 data-ggsj="dxTextBox"></div>
                                            <div class="col-lg-2" id="employeeCheckup.vip"
                                                 data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>생년월일</span></div>
                                        <div class="col-lg-4 row">
                                            <div class="col-lg-12" id="birth"
                                                 data-ggsj="dxDateBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>휴대전화번호</span></div>
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
                                            <div class="col-lg-2 btnGray" id="zipcodeSearch"
                                                 data-ggsj="dxButton"></div>
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
                                        <div class="col-lg-2 tag-name check"><span>대상자 구분</span></div>
                                        <div class="col-lg-4" id="myself" data-ggsj="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name check"><span>비용청구</span></div>
                                        <div class="col-lg-4" id="employeeCheckup.supportType"
                                             data-ggsj="dxSelectBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>사원번호</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeNo" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>검진유형</span></div>
                                        <div class="col-lg-4" id="employeeCheckup.companyCheckupTypeId"
                                             data-ggsj="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name"><span>검진유형명</span></div>
                                        <div class="col-lg-4" id="companyCheckupTypeName"
                                             data-ggsj="dxTextBox"></div>
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
                            <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"><i class="xi-save"></i>저장</div>
                            <div class="col-lg-1" id="btnList" data-ggsj="dxButton">목록</div>
                            <div class="col-lg-1" id="check" style="display: none" data-ggsj="dxTextBox"></div>
                        </div>
                    </div>
                </div>
                <%--                    </div>--%>
            </div>
        </div>
    </div>
        <%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $(function () {
        ggsj.openMenu('employee');

        let dxInstances = ggsj.createDx(false);

        dxInstances.lookupCompany.option({
            displayExpr: 'companyName',
            dropDownOptions: {
                closeOnOutsideClick: true,
                showTitle: false,
            },
            searchEnabled: true,
            searchExpr: 'companyName',
            searchMode: 'contains',
            searchTimeout: 100,
            onValueChanged: function (e) {
                dxInstances.companyId.option({
                    value: e.value.companyId,
                    readOnly: true,
                });
                dxInstances['employeeCheckup.companyCheckupId'].option({
                    value: e.value.companyCheckupId,
                    readOnly: true
                });

                dxInstances['employeeCheckup.checkupYear'].option({
                    value: e.value.checkupYear,
                    readOnly: true
                });

                if (e.value.companyCheckupId) {
                    dxInstances['employeeCheckup.companyCheckupTypeId'].option({
                        dataSource: {
                            load: function () {
                                return $.ajax({
                                    url: '<c:url value="/pm/company"/>/' + e.value.companyId,
                                    method: 'GET',
                                }).then(function (response) {
                                    ggsj.valuesToDx(response.data);
                                    dxInstances['employeeCheckup.companyCheckupTypeId'].option({
                                        dataSource: response.data.companyCheckup.companyCheckupTypes,
                                        displayExpr: 'companyCheckupTypeCode',
                                        valueExpr: 'companyCheckupTypeId',
                                        onItemClick: function (e) {
                                            dxInstances['companyCheckupType.supportPay'].option({
                                                placeholder: e.itemData.supportPay
                                            });
                                            dxInstances['companyCheckupType.copay'].option({
                                                placeholder: e.itemData.copay
                                            });
                                            dxInstances.companyCheckupTypeName.option({
                                                placeholder: e.itemData.companyCheckupTypeName
                                            });
                                        }
                                    });
                                });
                            }
                        },
                    });
                }
            },
        });

        dxInstances.myself.option({
            dataSource: [
                {'id': 1, 'text': '본인'},
                {'id': 2, 'text': '가족'},
            ],
        });

        dxInstances['employeeCheckup.supportType'].option({
            dataSource: [
                {'id': 1, 'text': '본인부담'},
                {'id': 0, 'text': '기업부담'},
            ],
        });

        dxInstances.employeeCode.option({
            valueChangeEvent: "keyup",
            onValueChanged: function () {
                dxInstances.check.option({value: ''});
            }
        });

        dxInstances.userIdCheck.option({
            text: '중복체크',
            onClick: function () {
                if (dxInstances.companyId.option('value') === '') {
                    alert("회사를 선택해주세요.\n\n※ 중복 체크 시 필수 입력사항은 아래와 같습니다.\n1. 기업체명 / 2. 검진자명 / 3. 대상자 구분 / 4. 비용청구\n\n위 4개를 모두 입력 후 [중복체크] 버튼을 클릭해주세요.")
                    // DevExpress.ui.dialog.alert('<div style="width:20vw;">회사를 선택해주세요.<br><br>* 중복 체크시 필수 입력사항<br>- 기업체명<br>- 검진자명<br>- 대상자 구분<br>- 비용청구</div>', "중복체크 경고")

                    return;
                }

                if (dxInstances.myself.option('value') === null) {
                    alert("대상자 구분을 선택해주세요.\n\n※ 중복 체크 시 필수 입력사항은 아래와 같습니다.\n1. 기업체명 / 2. 검진자명 / 3. 대상자 구분 / 4. 비용청구\n\n위 4개를 모두 입력 후 [중복체크] 버튼을 클릭해주세요.")
                    return;
                }

                if (dxInstances['employeeCheckup.supportType'].option('value') === null) {
                    alert("비용청구를 선택하세요\n\n※ 중복 체크 시 필수 입력사항은 아래와 같습니다.\n1. 기업체명 / 2. 검진자명 / 3. 대상자 구분 / 4. 비용청구\n\n위 4개를 모두 입력 후 [중복체크] 버튼을 클릭해주세요.")
                    return;
                }

                if (dxInstances.employeeName.option('value') === '') {
                    alert("검진자명을 입력해주세요.\n\n※ 중복 체크 시 필수 입력사항은 아래와 같습니다.\n1. 기업체명 / 2. 검진자명 / 3. 대상자 구분 / 4. 비용청구\n\n위 4개를 모두 입력 후 [중복체크] 버튼을 클릭해주세요.")
                    return;
                }

                if (dxInstances.employeeCode.option('value') === '') {
                    alert("ID를 입력해주세요.")
                    return;
                }

                $.ajax({
                    url: '<c:url value="/pm/employee/check"/>',
                    method: 'GET',
                    data: {
                        companyId: dxInstances.companyId.option('value'),
                        checkupYear: dxInstances['employeeCheckup.checkupYear'].option('value'),
                        employeeCode: dxInstances.employeeCode.option('value'),
                        employeeName: dxInstances.employeeName.option('value'),
                        myself: dxInstances.myself.option('value'),
                    },
                }).then(function (response) {
                    if (response.data.checkId === 0) {
                        let con = confirm("사용하실 수 있는 아이디입니다. 사용하시겠습니까?");
                        if (con === true) {
                            dxInstances.check.option({value: '1'});
                        } else {
                            dxInstances.check.option({value: ''});
                        }
                    } else {
                        alert("중복된 아이디가 존재합니다.");
                    }
                });
            }
        });

        dxInstances.userPw.option({
            mode: 'password',
            inputAttr: {
                autocomplete: "new-password"
            },
            readOnly: true
        });

        dxInstances.birth.option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            showDropDownButton: false,
        });

        dxInstances['employeeCheckup.notokGuide'].option({
            text: '검진실시 안내',
            value: false,
        });

        dxInstances['employeeCheckup.notokReserve'].option({
            text: '예약 안내',
            value: false,
        });

        dxInstances['employeeCheckup.notokUrge'].option({
            text: '미예약 독려 안내',
            value: false,
        });

        dxInstances['employeeCheckup.notokUpdatedAt'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            showDropDownButton: false,
            readOnly: true,
            value: null,
        });

        dxInstances['employeeCheckup.vip'].option({
            text: 'VIP',
            value: false,
            elementAttr: {
                class: "no-margin"
            }
        });

        dxInstances.sex.option({
            dataSource: [
                {'id': 'M', 'text': '남'},
                {'id': 'F', 'text': '여'},
            ],
            value: 'M',
        });

        dxInstances.mobile.option({
            placeholder: '휴대전화 11자리',
        });

        dxInstances.zipcodeSearch.option({
            text: '주소찾기',
            onClick: function () {
                execution_daum_address(dxInstances.zipcode, dxInstances.address1, dxInstances.address2);
            }
        });

        dxInstances.depart.option({
            placeholder: '부서',
        });

        dxInstances.title.option({
            placeholder: '직책',
        });

        dxInstances['companyCheckupType.supportPay'].option({
            placeholder: '지원금액',
            readOnly: true,
        });

        dxInstances['companyCheckupType.copay'].option({
            placeholder: '본인부담액',
            readOnly: true,
        });

        dxInstances.companyCheckupTypeName.option({
            placeholder: '검진유형명',
            readOnly: true,
        });

        dxInstances['employeeCheckup.specialCheckup'].option({
            text: '특검대상',
            value: false,
        });

        // Save
        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '저장',
            type: 'success',
            onClick: function () {
                let data = ggsj.dxToValues();

                data['companyCheckupType'] = null;
                data['lookupCompany'] = null;
                if (!data.employeeCheckup.checkupYear) {
                    alert('기업체를 선택하세요');
                    return;
                }

                if (!data.myself) {
                    alert('대상자 구분을 선택하세요');
                    return;
                }

                if (data.employeeCheckup.supportType === null) {
                    alert('비용청구를 선택하세요');
                    return;
                }

                if (!data.employeeName) {
                    alert('검진자명을 입력하세요');
                    return;
                }

                if (!data.employeeCode) {
                    alert('ID를 입력하세요');
                    return;
                }

                if (!data.mobile) {
                    alert('휴대전화 번호를 입력하세요');
                    return;
                }

                if (data.check === '') {
                    alert("중복체크를 해주세요.")
                    return;
                }

                if (data.employeeCheckup.companyCheckupTypeId === null) {
                    alert("검진유형을 선택해 해주세요.")
                    return;
                }

                data.birth = new Date(dxInstances.birth.option('text'));

                $.ajax({
                    url: '<c:url value="/pm/employee"/>',
                    method: 'POST',
                    data: JSON.stringify(data),
                }).then(function () {
                    ggsj.notify("저장되었습니다.");
                    location.href = '<c:url value="/pm/employee"/>';
                });
            },
        });

        // List
        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '목록',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/pm/employee"/>';
            }
        });

        /* 다음 주소 연동 */
        function execution_daum_address(zipcode, address1, address2) {
            new daum.Postcode({
                oncomplete: function (data) {
                    let extraAddr = '';

                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        extraAddr = ' (' + extraAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    zipcode.option({
                        value: data.zonecode,
                    });

                    address1.option({
                        value: data.address + ' ' + extraAddr,
                    });

                    address2.focus();
                }
            }).open();

        }

        // Load
        let ajaxCompanyList = {
            url: '<c:url value="/common/company?listType=LAST_ALL"/>',
        }

        $.when($.ajax(ajaxCompanyList)).then(function (responseCompanyList) {
            // Company List
            dxInstances.lookupCompany.option({
                dataSource: responseCompanyList.data,
            });
        });
    });
</script>
</html>
