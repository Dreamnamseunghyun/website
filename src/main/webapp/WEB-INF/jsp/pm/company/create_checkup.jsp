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
                            <h3 class="h3">기업 신규 연도 등록</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- 기업 기본 정보 -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap logo-area-left">
                                <div class="row-box-title"><i class="xi-play-circle"></i>기업 기본 정보</div>

                                <div class="row-box6">
                                    <div class="row-box-inner1 logo-box">
                                        <div class="col-box1 col-box-vertical5 row logo-img">
                                            <div class="col-lg-12 center-box">
                                                <img id="ciUrl" src="" alt="기업체로고"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-6" id="ciFilename" style="display: none;"
                                             data-ggsj="dxTextBox"></div>
                                        <div class="col-box1 row">
                                            <div class="col-lg-12 center-box">
                                                <div class="col-lg-1 btnGray" id="btnAttach" data-ggsj="dxButton"></div>
                                                <form id="formCi">
                                                    <input type="file" id="ci" name="ci" accept="image/*"
                                                           style="display: none;"/>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box6-5">

                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12 row">
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>기업체명</span></div>
                                                    <div class="col-lg-4" id="companyName" data-ggsj="dxTextBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>대상년도</span></div>
                                                    <div class="col-lg-4" id="companyCheckup.checkupYear"
                                                         data-ggsj="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>기업코드</span></div>
                                                    <div class="col-lg-10" id="companyCode" data-ggsj="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>ID 입력문구</span></div>
                                                    <div class="col-lg-6">
                                                        <div class="width-info-wrap">
                                                            <div id="idPlaceHolder" data-ggsj="dxRadioGroup"></div>
                                                        </div>
                                                        </div>
                                                    <div class="col-lg-4" id="idText" data-ggsj="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>PW 입력문구</span>
                                                    </div>
                                                    <div class="col-lg-10">
                                                        <div class="width-info-wrap">
                                                            <div id="pwType" data-ggsj="dxRadioGroup"></div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row"
                                                     style="border-bottom:1px solid transparent;">
                                                    <div class="col-lg-12">
                                                        <div class="width-info-wrap">
                                                            <div id="noUse" data-ggsj="dxCheckBox"></div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-12">
                                                        <div class="width-info-wrap">
                                                            <div id="useNotiTalk" data-ggsj="dxCheckBox"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 기업 기본 정보 -->

                            <!-- 매니저 정보 -->
                            <div class="row-wrap logo-area-right">
                                <div class="row-box-title"><i class="xi-play-circle"></i>매니저 정보</div>
                                <div class="row-box1">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row col-box-vertical6">
                                            <div class="col-lg-12 center-box button-box">
                                                <div id="btnPlatformManager" data-ggsj="dxButton"></div>
                                                <div id="btnCompanyManager" data-ggsj="dxButton"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 매니저 정보 -->
                        <%--                        <div class="card-title">--%>
                        <%--                            <div class="row">--%>
                        <%--                                <h3 style="margin-left:15px;"><i class="xi-play-circle"></i></h3><h3 class="h3" style="margin-left: 5px;"> 연도별 검진 세부 정보</h3>--%>
                        <%--                                <div class="card-title-select">--%>
                        <%--                                    <div class="tag-name"><span>대상년도</span></div>--%>
                        <%--                                    <div id="companyCheckup.checkupYear" data-ggsj="dxTextBox"></div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <!-- 내부 관리 정보 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>내부 관리 정보</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row">
                                        <div class="col-lg-1 tag-name"><span>예상매출</span></div>
                                        <div class="col-lg-11">
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag-name"><span>총 합산</span></div>
                                                <div class="col-lg-8" id="total" data-ggsj="dxNumberBox"></div>
                                            </div>
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag-name"><span>검진비</span></div>
                                                <div class="col-lg-8" id="companyCheckup.expectedTotalSupportPay"
                                                     data-ggsj="dxNumberBox"></div>
                                            </div>
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag-name"><span>수수료</span></div>
                                                <div class="col-lg-8" id="companyCheckup.expectedTotalPlatformPay"
                                                     data-ggsj="dxNumberBox"></div>
                                            </div>
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag-name"><span>기타매출</span></div>
                                                <div class="col-lg-8 center" id="companyCheckup.expectedTotalEtcPay"
                                                     data-ggsj="dxNumberBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-box1 row">
                                    <div class="col-box1 col-box-vertical3 row">
                                        <div class="col-lg-1 tag-name"><span>기업체 특이사항</span></div>
                                        <div class="col-lg-11" id="companyCheckup.notes" data-ggsj="dxTextArea"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 내부 관리 정보 -->

                        <!-- 검진 세부 정보 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>검진 세부 정보</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row">
                                        <div class="col-lg-1 tag-name"><span>대상인원</span></div>
                                        <div class="col-lg-11" id="companyCheckup.employeeNumber"
                                             data-ggsj="dxNumberBox"></div>
                                    </div>
                                </div><!--row-box-inner-->

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>검진 실시 기간</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6" id="companyCheckup.checkupDateBegin"
                                                 data-ggsj="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6" id="companyCheckup.checkupDateEnd"
                                                 data-ggsj="dxDateBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>예약 가능 기간</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6" id="companyCheckup.reserveDateBegin"
                                                 data-ggsj="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6" id="companyCheckup.reserveDateEnd"
                                                 data-ggsj="dxDateBox"></div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- 검진 세부 정보 -->

                        <%-- checkup type dataGrid --%>

                        <div class="row-wrap">

                            <div id="dataGridCheckupType" class="sub_table"
                                 data-ggsj="dxDataGrid">
                            </div>
                        </div>

                    </div>
                    <%--</div>--%>
                </div>
                <div class="row btn_area footer-btn">
                    <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"><i class="xi-save"></i>저장</div>
                    <div class="col-lg-1" id="btnList" data-ggsj="dxButton">목록</div>
                </div>


            </div>
        </div>
    </div>


</div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        ggsj.openMenu('company');

        let ciForm = $('#ci');

        let ciImage = $('#ciUrl');
        ciImage.hide();

        let dxInstances = ggsj.createDx(false);

        dxInstances.companyName.option({
            readOnly: true,
        });

        dxInstances.companyCode.option({
            readOnly: true,
        });

        function previewImage(input, target) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();

                reader.onload = function (e) {
                    target.attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        dxInstances.btnPlatformManager.option({
            text: '총괄 매니저',
        });

        dxInstances.btnCompanyManager.option({
            text: '기업 매니저',
        });

        let year = new Date().getFullYear();
        let checkupYear = [];
        for (let i = 0; i < 10; i++) {
            checkupYear.push({
                id: year + i, text: String(year + i)
            });
        }

        dxInstances.total.option({
            format: "#,### 원",
            readOnly: true
        });

        dxInstances['companyCheckup.expectedTotalSupportPay'].option({
            format: "#,### 원"
        });

        dxInstances['companyCheckup.expectedTotalPlatformPay'].option({
            format: "#,### 원"
        });

        dxInstances['companyCheckup.expectedTotalEtcPay'].option({
            format: "#,### 원"
        });

        dxInstances['companyCheckup.employeeNumber'].option({
            format: "#,### 명"
        });

        dxInstances['companyCheckup.checkupDateBegin'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            onValueChanged: function (e) {
                dxInstances['companyCheckup.checkupDateEnd'].option("min", e.value);
            },
        });

        dxInstances['companyCheckup.checkupDateEnd'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            onValueChanged: function (e) {
                dxInstances['companyCheckup.checkupDateBegin'].option("max", e.value);
                dxInstances['companyCheckup.reserveDateBegin'].option("max", e.value);
                dxInstances['companyCheckup.reserveDateEnd'].option("max", e.value);

            },
        });

        dxInstances['companyCheckup.reserveDateBegin'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            onValueChanged: function (e) {
                dxInstances['companyCheckup.reserveDateEnd'].option("min", e.value);
            },
        });

        dxInstances['companyCheckup.reserveDateEnd'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
        });

        dxInstances.idPlaceHolder.option({
            layout: 'horizontal',
            items: [
                {'id': '휴대전화번호 (11자리)', 'text': '휴대전화 (11자리)'},
                {'id': '사원번호', 'text': '사원번호'},
                {'id': '생년월일 8자리', 'text': '생년월일 8자리'},
                {'id': 'ETC', 'text': '기타 (15자이내)'}
            ],
            valueExpr: 'id',
            onValueChanged: function (e) {
                if (e.value === 'ETC') {
                    dxInstances.idText.option({disabled: false});
                    dxInstances.idText.focus();
                } else {
                    dxInstances.idText.option('value', '');
                    dxInstances.idText.option({disabled: true});
                }
            }
        });

        dxInstances.pwType.option({
            layout: "horizontal",
            items: [
                {'id': 0, 'text': '휴대전화 (11자리)'},
                {'id': 1, 'text': '사원번호'},
                {'id': 2, 'text': '생년월일 8자리'},
            ],
            valueExpr: 'id',
        });

        dxInstances.dataGridCheckupType.option({
            editing: {
                mode: "batch",
                allowAdding: true,
                allowUpdating: true,
                allowDeleting: true,
                selectTextOnEditStart: true,
                startEditAction: "click"
            },
            dataSource: {},
            columns: [{
                dataField: 'companyCheckupTypeCode',
                caption: '유형',
            }, {
                dataField: 'companyCheckupTypeName',
                caption: '유형명',
            }, {
                dataField: 'supportPay',
                caption: '지원금액',
                dataType: 'number'
            }, {
                dataField: 'copay',
                caption: '본인부담액',
                dataType: 'number'
            }, {
                dataField: 'hospitalPay',
                caption: '병원청구액',
                dataType: 'number'
            }, {
                dataField: 'platformPay',
                caption: '수수료',
                dataType: 'number'
            }, {
                caption: '검진대상 설정',
                columns: [{
                    dataField: 'typeSelf',
                    caption: '본인',
                    dataType: 'boolean',
                }, {
                    dataField: 'typeFamily',
                    caption: '기업부담가족',
                    dataType: 'boolean',
                }, {
                    dataField: 'typeCopay',
                    caption: '본인부담가족',
                    dataType: 'boolean',
                }],
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    html: '<div class="row-box-title"><i class="xi-play-circle"></i>기업 검진 유형</div>',
                });

                // Modifies an existing item
                let toolbarItems = e.toolbarOptions.items;
                toolbarItems.forEach(function (item) {
                    if (item.name === "saveButton") {
                        item.visible = false;
                    }
                });
            },
            onInitNewRow: function (e) {
                e.data['supportPay'] = 0;
                e.data['copay'] = 0;
                e.data['hospitalPay'] = 0;
                e.data['platformPay'] = 0;
                e.data['typeSelf'] = false;
                e.data['typeFamily'] = false;
                e.data['typeCopay'] = false;
            },
            onCellPrepared: function (data) {
                if (data.rowType === 'header') {
                    data.cellElement.css('background', 'white');
                }
            }
        });

        dxInstances.dataGridCheckupType.cancelEditData();

        dxInstances.noUse.option({
            text: '로그인 중지',
        });

        dxInstances.useNotiTalk.option({
            text: '예약독려 알림톡 자동발송 (검진 마감 45일 전에 자동 발송(주말, 공휴일 제외))',
        });

        dxInstances.btnAttach.option({
            text: '파일첨부',
            enabled: true,
            onClick: function () {
                $('#ci').trigger('click');
            },
        });

        dxInstances.ciFilename.option({
            readOnly: true,
        });

        ciForm.on('change', function () {
            if (this.files.length) {
                dxInstances.ciFilename.option('value', this.files[0].name);
                previewImage(this, ciImage);
                ciImage.show();
            } else {
                dxInstances.ciFilename.option('value', null);
                ciImage.hide();
            }
        });

        // Save
        dxInstances.btnSave.option({
            stylingMode: "contained",
            text: "저장",
            type: "success",
            onClick: function () {
                let data = ggsj.dxToValues().companyCheckup;

                let gridData = dxInstances.dataGridCheckupType.option('editing.changes').map(function (v) {
                    v.data._crudType = v.type.toUpperCase();
                    return v.data;
                });

                data.companyCheckupTypes = gridData;

                $.ajax({
                    url: '<c:url value="/pm/company/${companyId}/checkup"/>',
                    method: 'POST',
                    data: JSON.stringify(data),
                }).then(function () {
                    ggsj.notify("저장되었습니다.");
                    location.href = '<c:url value="/pm/company"/>';
                });
            }
        });

        // List
        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '목록',
            onClick: function () {
                location.href = '<c:url value="/pm/company"/>';
            }
        });

        // Load
        $.ajax({
            url: '<c:url value="/pm/company/${checkupYear}/${companyId}"/>',
            method: 'GET',
        }).then(function (response) {
            ggsj.valuesToDx(response.data);

            let total = response.data.companyCheckup;
            dxInstances.total.option({
                value: total.expectedTotalSupportPay + total.expectedTotalPlatformPay + total.expectedTotalEtcPay
            });

            if (response.data.companyCheckup.companyCheckupTypes[0].companyCheckupTypeCode != null) {
                dxInstances.dataGridCheckupType.option({
                    dataSource: response.data.companyCheckup.companyCheckupTypes,
                });
            } else {
                dxInstances.dataGridCheckupType.option({
                    dataSource: [],
                });
            }

            if (response.data.idPlaceHolder !== '휴대전화번호 (11자리)' && response.data.idPlaceHolder !== '사원번호' && response.data.idPlaceHolder !== '생년월일 8자리') {
                dxInstances.idPlaceHolder.option('value', 'ETC');
                dxInstances.idText.option('value', response.data.idPlaceHolder);
            }

            // dxInstances.accountUserId.option({
            //     value: response.data.accountUserId,
            // });
            // dxInstances.salesUserId.option({
            //     value: response.data.salesUserId,
            // });
            // dxInstances.adminUserId.option({
            //     value: response.data.adminUserId,
            // });

            if (response.data.ciUrl) {
                $('#ciUrl').attr('src', response.data.ciUrl).show();
            }

            dxInstances.dataGridCheckupType.cancelEditData();
        });
    });
</script>
</html>
