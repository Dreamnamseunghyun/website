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
                            <h3 class="h3">예약상세현황</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- 소속 기업 -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap1">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>소속 기업</span></div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12" id="companyState"
                                                     data-ggsj="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>병원계약매니저</span></div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12" id="employeeCheckup.companyCheckupId"
                                                     data-ggsj="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- 소속 기업 -->

                        <div class="row-wrap row-wrap-box">
                            <!-- 예약 정보 -->
                            <div class="row-wrap row-wrap2">
                                <div class="row-box-title"><i class="xi-play-circle"></i>예약 정보</div>
                                <div class="row-box1">
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>신청 병원명</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="hospitalCenterName"
                                                     data-ggsj="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>검진희망일</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="desiredAt"
                                                     data-ggsj="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>예약등록일시</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="registeredAt"
                                                     data-ggsj="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>예약확정일</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="confirmedAt"
                                                     data-ggsj="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>수검완료일</span></div>
                                            <div class="col-lg-10 row period">
                                                <div id="checkupedAt"
                                                     data-ggsj="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>예약상태</span></div>
                                            <div class="col-lg-10 row period">
                                                <div id="reservationState"
                                                     data-ggsj="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 예약 정보 -->

                            <!-- 검진자 정보 -->
                            <div class="row-wrap row-wrap2">
                                <div class="row-box-title"><i class="xi-play-circle"></i>검진자 정보</div>
                                <div class="row-box1">
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>검진자명</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="employeeName"
                                                     data-ggsj="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>생년월일 / 성별</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="birthSex" data-ggsj="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>관계</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="myselfFamily" data-ggsj="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>휴대전화번호</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="mobile"
                                                     data-ggsj="dxTextBox" data-ggsj-format="tel"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>이메일</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="email"
                                                     data-ggsj="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>주소</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="address" data-ggsj="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 검진자 정보 -->
                        </div>

                        <!-- 기업 및 검진 정보 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>기업 및 검진 정보</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row center-input">
                                        <div class="col-lg-box3 row">
                                            <div class="col-lg-3 tag-name"><span>기업체명</span></div>
                                            <div class="col-lg-9" id="companyName" data-ggsj="dxTextBox"></div>
                                        </div>
                                        <div class="col-lg-box3 row">
                                            <div class="col-lg-3 tag-name"><span>부서명/직책</span></div>
                                            <div class="col-lg-4" id="departTitle" data-ggsj="dxTextBox"></div>
                                        </div>
                                        <div class="col-lg-box3 row">
                                            <div class="col-lg-3 tag-name"><span>사원번호</span></div>
                                            <div class="col-lg-9" id="employeeNo"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-box1 row">
                                <div class="col-lg-1 tag-name"><span>검진유형</span></div>
                                <div class="col-lg-11" id="checkupCodeName" data-ggsj="dxTextBox"></div>
                            </div>

                            <div class="col-box3 row">
                                <div class="col-box1 col-box-vertical3 row">
                                    <div class="col-lg-3 tag-name"><span>선택검사</span></div>
                                    <div class="col-lg-9" id="register" data-ggsj="dxTextArea"></div>
                                </div>
                            </div>
                            <div class="col-box3 row">
                                <div class="col-box1 col-box-vertical3 row">
                                    <div class="col-lg-3 tag-name"><span>추가검사</span></div>
                                    <div class="col-lg-9" id="moreCheck" data-ggsj="dxTextArea"></div>
                                </div>
                            </div>
                            <div class="col-box3 row">
                                <div class="col-box1 col-box-vertical3 row">
                                    <div class="col-lg-3 tag-name"><span>특검 대상/물질</span></div>
                                    <div class="col-lg-9" id="specialCheckupText" data-ggsj="dxTextArea"></div>
                                </div>
                            </div>

                            <div class="col-box1 row">
                                <div class="col-lg-1 tag-name"><span>검진비 청구</span></div>
                                <div class="col-lg-2" id="supportTypeMyself" data-ggsj="dxTextBox"></div>
                                <div class="col-lg-2" style="display: none;" id="supportType"
                                     data-ggsj="dxSelectBox"></div>
                                <div class="col-lg-2" style="display: none;" id="myself" data-ggsj="dxSelectBox"></div>
                            </div>


                            <div class="col-box1 row center-input">
                                <div class="col-lg-1 tag-name"><span>본인부담 비용</span></div>
                                <div class="col-lg-11">
                                    <div class="col-lg-box4 row">
                                        <div class="col-lg-4 tag-name"><span>총 합산</span></div>
                                        <div class="col-lg-8" id="total" data-ggsj="dxTextBox"></div>
                                    </div>
                                    <div class="col-lg-box4 row">
                                        <div class="col-lg-4 tag-name"><span>검진비</span></div>
                                        <div class="col-lg-8" id="hospitalPayComma"
                                             data-ggsj="dxTextBox"></div>
                                    </div>
                                    <div class="col-lg-box4 row">
                                        <div class="col-lg-4 tag-name"><span>유형 변경 차액</span></div>
                                        <div class="col-lg-8" id="upgradePayComma"
                                             data-ggsj="dxTextBox"></div>
                                    </div>
                                    <div class="col-lg-box4 row">
                                        <div class="col-lg-4 tag-name"><span>추가검사비</span></div>
                                        <div class="col-lg-8" id="sumItemCopayComma" data-ggsj="dxTextBox"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 기업 및 검진 정보 -->

                        <!-- 기타 사항 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>기타 사항</div>
                            <div class="row-box2">
                                <div class="row-box-inner1">
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>특이사항</span></div>
                                        <div class="col-lg-10" id="notes" data-ggsj="dxTextBox"></div>
                                    </div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>건강살자 메모</span></div>
                                        <div class="col-lg-10" id="platformNotes" data-ggsj="dxTextBox"></div>
                                    </div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>병원 메모</span></div>
                                        <div class="col-lg-10" id="hospitalNotes" data-ggsj="dxTextBox"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-box2">
                                <div class="row-box-inner1">
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>고객 문의사항</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeNotes" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box1 col-box-vertical2 row">
                                        <div class="col-lg-2 tag-name"><span>예약 보류,<br>취소 사유</span></div>
                                        <div class="col-lg-10" id="stateNotes" data-ggsj="dxTextArea"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 기타 사항 -->

                    </div><!-- viewport -->
                </div>

                <div class="row btn_area footer-btn">
                    <div class="col-lg-1" id="btnEdit" data-ggsj="dxButton"><i class="xi-file-check"></i>수정</div>
                    <div class="col-lg-1" id="btnList" data-ggsj="dxButton">목록</div>
                </div>

            </div>
        </div>
    </div>

        <%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        ggsj.openMenu('reserve');

        let dxInstances = ggsj.createDx(true);
        // dataType: 'date',

        dxInstances.reservationState.option({
            items: [
                {'id': 0, 'text': '예약취소'},
                {'id': 1, 'text': '예약신청'},
                {'id': 2, 'text': '예약확정'},
                {'id': 3, 'text': '예약변경'},
                {'id': 4, 'text': '수검완료'},
                {'id': 5, 'text': '예약보류'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances['employeeCheckup.companyCheckupId'].option({
            displayExpr: function (item) {
                return item && item.centerManagerName + ' (' + item.centerName + ')';
            },
            valueExpr: 'userId',
            readOnly: false,
        });

        dxInstances.desiredAt.option({
            dataType: 'date',
            displayFormat: "yyyy-MM-dd a",
        });

        dxInstances.confirmedAt.option({
            dataType: 'date',
            displayFormat: "yyyy-MM-dd a",
        });

        dxInstances.checkupedAt.option({
            dataType: 'date',
            displayFormat: "yyyy-MM-dd a",
        });

        dxInstances.supportType.option({
            items: [
                {'id': false, 'text': '기업부담'},
                {'id': true, 'text': '본인부담'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.myself.option({
            items: [
                {'id': null, 'text': '가족'},
                {'id': 1, 'text': '본인'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.btnEdit.option({
            stylingMode: 'contained',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/hm/reserve/${reservationId}"/>' + '/edit';
            }
        });

        // List
        dxInstances.btnList.option({
            stylingMode: 'contained',
            type: 'normal',
            onClick: function () {
                if (dxInstances.reservationState.option('value') === 0) {
                    location.href = '<c:url value="/hm/cancel-reserve"/>';
                } else {
                    location.href = '<c:url value="/hm/reserve"/>';
                }
            }
        });

        let companyId = [];
        let hospitalId = [];

        // Load
        $.ajax({
            url: '<c:url value="/hm/reserve/${reservationId}"/>',
            method: 'GET',
        }).then(function (response) {
            ggsj.valuesToDx(response.data);

            companyId = response.data.companyId;
            hospitalId = response.data.hospitalId;

            let selectedItems = '';
            let additionalItem = '';
            let selectedItemsA = [];
            let selectedItemsB = [];
            let selectedItemsC = [];
            let selectedItemsD = [];
            let selectedItemsE = [];
            let selectedItemsF = [];

            for (let i = 0; i < response.data.reserveItems.length; i++) {
                if (response.data.reserveItems[i].register === 'A') {
                    selectedItemsA.push(response.data.reserveItems[i].itemName);
                } else if (response.data.reserveItems[i].register === 'B') {
                    selectedItemsB.push(response.data.reserveItems[i].itemName);
                } else if (response.data.reserveItems[i].register === 'C') {
                    selectedItemsC.push(response.data.reserveItems[i].itemName);
                } else if (response.data.reserveItems[i].register === 'D') {
                    selectedItemsD.push(response.data.reserveItems[i].itemName);
                } else if (response.data.reserveItems[i].register === 'E') {
                    selectedItemsE.push(response.data.reserveItems[i].itemName);
                } else if (response.data.reserveItems[i].register === 'F') {
                    selectedItemsF.push(response.data.reserveItems[i].itemName);
                } else if (response.data.reserveItems[i].register === '2') {
                    if (additionalItem === '') {
                        additionalItem = response.data.reserveItems[i].itemName;
                    } else {
                        additionalItem = additionalItem + ' / ' + response.data.reserveItems[i].itemName;
                    }
                }
            }

            if (selectedItemsA.length > 0) {
                selectedItems += ('-A: ' + selectedItemsA + '\n');
            }
            if (selectedItemsB.length > 0) {
                selectedItems += ('-B: ' + selectedItemsB + '\n');
            }
            if (selectedItemsC.length > 0) {
                selectedItems += ('-C: ' + selectedItemsC + '\n');
            }
            if (selectedItemsD.length > 0) {
                selectedItems += ('-D: ' + selectedItemsD + '\n');
            }
            if (selectedItemsE.length > 0) {
                selectedItems += ('-E: ' + selectedItemsE + '\n');
            }
            if (selectedItemsF.length > 0) {
                selectedItems += ('-F: ' + selectedItemsF + '\n');
            }

            dxInstances.register.option({value: selectedItems});
            dxInstances.moreCheck.option({value: additionalItem,});

            dxInstances.companyState.option({
                value: function () {
                    return dxInstances.companyName.option('value') + " | " + " (검진기간) "
                        + new Date(dxInstances.checkupDateBegin).toISOString().substring(0, 10) + " ~ "
                        + new Date(dxInstances.checkupDateEnd).toISOString().substring(0, 10) + " | " + " (예약기간) "
                        + new Date(dxInstances.reserveDateBegin).toISOString().substring(0, 10) + " ~ "
                        + new Date(dxInstances.reserveDateEnd).toISOString().substring(0, 10);
                }
            });

            dxInstances.birthSex.option({
                value: function () {
                    return new Date(dxInstances.birth).toISOString().substring(0, 10)
                        + " / " + (dxInstances.sex === 'M' ? '남' : '여');
                }
            });

            dxInstances.myselfFamily.option({
                value: function () {
                    if (dxInstances.myself.option('value') === 1) {
                        return '본인';
                    } else {
                        return '(' + dxInstances.familyName + ') 님의 가족';
                    }
                }
            });

            dxInstances.address.option({
                value: function () {
                    let zipcode = '';
                    let address1 = '';
                    let address2 = '';
                    if (dxInstances.zipcode != null) {
                        zipcode = "(" + dxInstances.zipcode + ") ";
                    }
                    if (dxInstances.address1 != null) {
                        address1 = dxInstances.address1 + ' ';
                    }
                    if (dxInstances.address2 != null) {
                        address2 = dxInstances.address2;
                    }
                    return zipcode + address1 + address2;
                }
            });

            dxInstances.departTitle.option({
                value: function () {
                    return dxInstances.depart + " / " + dxInstances.title;
                }
            });

            dxInstances.checkupCodeName.option({
                value: function () {
                    return dxInstances.companyCheckupTypeCode + " / " + dxInstances.companyCheckupTypeName + " / " + dxInstances.subTypeName;
                }
            });

            dxInstances.specialCheckupText.option({
                value: function () {
                    return (dxInstances.specialCheckup === 0 ? '해당없음' : '특검대상') + '\n' + dxInstances.specialCheckupMemo;
                }
            });

            dxInstances.supportTypeMyself.option({
                value: function () {
                    return (dxInstances.supportType.option('value') === true ? '본인부담' : '기업부담' + ' / ' + ggsj.numberWithCommas(dxInstances.hospitalPay) + " 원");
                }
            });

            dxInstances.total.option({
                value: function () {
                    if (dxInstances.supportType.option('value') === true) {
                        return ggsj.numberWithCommas(dxInstances.hospitalPay + dxInstances.upgradePay + dxInstances.sumItemCopay + dxInstances.sumItemDiscountBill) + " 원";
                    } else {
                        return ggsj.numberWithCommas(dxInstances.upgradePay + dxInstances.sumItemCopay + dxInstances.sumItemDiscountBill) + " 원";
                    }
                }
            });

            dxInstances.hospitalPayComma.option({
                value: function () {
                    return (dxInstances.supportType.option('value') === true ? ggsj.numberWithCommas(dxInstances.hospitalPay) + " 원" : '0 원');
                }
            });

            dxInstances.upgradePayComma.option({
                value: function () {
                    return ggsj.numberWithCommas(dxInstances.upgradePay) + " 원";
                }
            });

            dxInstances.sumItemCopayComma.option({
                value: function () {
                    return ggsj.numberWithCommas(dxInstances.sumItemCopay + dxInstances.sumItemDiscountBill) + " 원";
                }
            });

            /*if (response.data.resultedAt == null) {
                dxInstances.resultedAt.option({
                    value: null
                });
            }*/

            if (response.data.desiredAt == null) {
                dxInstances.desiredAt.option({
                    value: null
                });
            }
            if (response.data.confirmedAt == null) {
                dxInstances.confirmedAt.option({
                    value: null
                });
            }

            LoadManagerList();
        });

        function LoadManagerList() {
            $.ajax({
                url: '<c:url value="/hm/reserve/manager"/>',
                method: 'GET',
                data: {
                    companyId: companyId,
                    hospitalId: hospitalId
                }
            }).then(function (response) {
                dxInstances['employeeCheckup.companyCheckupId'].option({
                    dataSource: response.data,
                    value: response.data[0].userId
                });
            });
        }
    });
</script>
</html>
