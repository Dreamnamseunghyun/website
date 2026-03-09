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

    <div class="page-content-wrapper">

        <div class="content sm-gutter">
            <div class=" container-fluid  padding-30 sm-padding-10 container-fixed-lg bg-white">
                <div class="card card-transparent board_internal">
                    <div class="card-header ">
                        <div class="card-title">
                            <h3 class="h3">기업 등록</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <div class="row-wrap"> <!--전체 박스-->
                            <div class="row-box2 space">
                                <div class="row-box-title">[ 기본 정보 ]</div>
                                <div class="row-box-inner1"> <!--데이터 박스를 감싸는애-->

                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag_name"><span>기업체명</span></div>
                                        <div class="col-lg-4" id="companyName" data-ggsj="dxTextBox"></div>
                                        <div class="col-lg-3 tag_name"><span>대상년도</span></div>
                                        <div class="col-lg-3" id="companyCheckup.checkupYear"
                                             data-ggsj="dxTextBox"></div>
                                    </div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag_name"><span>기업코드</span></div>
                                        <div class="col-lg-8" id="companyCode"
                                             data-ggsj="dxTextBox"></div>
                                        <div class="col-lg-2" id="btnCompanySearch" data-ggsj="dxButton"></div>
                                    </div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag_name"><span>사업자 등록번호</span></div>
                                        <div class="col-lg-10" id="businessNo" data-ggsj="dxTextBox"></div>
                                    </div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag_name"><span>ID 입력문구</span></div>
                                        <div class="col-lg-10">
                                            <div class="width-info-wrap">
                                                <div id="idPlaceHolder" data-ggsj="dxRadioGroup"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag_name"><span>PW 입력문구</span></div>
                                        <div class="col-lg-10">
                                            <div class="width-info-wrap">
                                                <div id="pwPlaceHolder" data-ggsj="dxRadioGroup"></div>
                                            </div>
                                        </div>
                                    </div>

                                </div><!--row-box-inner 왼쪽-->
                            </div><!--row-box 왼쪽-->

                            <div class="row-box2 space">
                                <div class="row-box-title">[ 기업 정보 ]</div>
                                <div class="row-box-inner1">

                                    <div class="col-box1 row">
                                        <div class="col-box1 col-box-vertical3 row">
                                            <div class="col-lg-4 logo_img"><img id="ciUrl" src="" alt="기업체로고"/>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="col-box1 row">
                                                    <div class="col-box1 col-box-vertical3 row">
                                                        <div class="col-lg-2 tag_name"><span>총괄 매니저</span></div>
                                                        <div class="col-md-10" style="border-left: 1px solid #999;">
                                                            <div class="row">
                                                                <div class="col-md-3 tag_name"><span>매출</span></div>
                                                                <div class="col-md-9" id="accountUser"
                                                                     data-ggsj="dxSelectBox"></div>
                                                                <div class="col-md-3 tag_name"><span>영업관리</span></div>
                                                                <div class="col-md-9" id="salesUser"
                                                                     data-ggsj="dxSelectBox"></div>
                                                                <div class="col-md-3 tag_name"><span>행정</span></div>
                                                                <div class="col-md-9" id="adminUser"
                                                                     data-ggsj="dxSelectBox"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-2" id="btnAttach" data-ggsj="dxButton"></div>
                                        <div class="col-md-9" id="ciFilename" data-ggsj="dxTextBox"></div>
                                    </div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-box2 row">
                                            <div class="col-lg-4 tag_name"><span>로그인중지</span></div>
                                            <div class="col-lg-8" id="noUse" data-ggsj="dxCheckBox"></div>
                                        </div>
                                        <div class="col-lg-box2 row">
                                            <div class="col-lg-6 tag_name"><span>예약독려 알림톡 자동발송</span></div>
                                            <div class="col-lg-6" id="useNotiTalk" data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <form id="formCi">
                                        <input type="file" id="ci" name="ci" accept="image/*" style="display: none;"/>
                                    </form>


                                </div><!--row-box-inner 왼쪽-->
                            </div><!--row-box 오른쪽-->

                        </div><!--row-wrap 1째단-->

                        <div class="row-wrap">
                            <div class="row-box-title">[ 내부 관리 정보 ]</div>
                            <div class="row-box1">
                                <div class="row-box-inner width_box">
                                    <div class="col-box1 row">
                                        <div class="col-lg-1 tag_name"><span>예상매출</span></div>
                                        <div class="col-lg-11" style="border-left: 1px solid darkgrey;">
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag_name"><span>총 합산</span></div>
                                                <div class="col-lg-8" id="total" data-ggsj="dxTextBox"></div>
                                            </div>
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag_name"><span>검진비</span></div>
                                                <div class="col-lg-8" id="totalSupportPay" data-ggsj="dxTextBox"></div>
                                            </div>
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag_name"><span>수수료</span></div>
                                                <div class="col-lg-8" id="totalPlatformPay" data-ggsj="dxTextBox"></div>
                                            </div>
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag_name"><span>기타매출</span></div>
                                                <div class="col-lg-8" id="etcPay" data-ggsj="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!--row-box-inner-->

                                <div class="col-box1 row">
                                    <div class="col-box1 col-box-vertical3 row">
                                        <div class="col-lg-1 tag_name"><span>기업체 특이사항</span></div>
                                        <div class="col-lg-11" id="notes" data-ggsj="dxTextArea"></div>
                                    </div>
                                </div><!--row-box-inner-->
                            </div><!--row-box -->


                        </div><!--row-wrap 2째단-->

                        <div class="row-wrap">
                            <div class="row-box-title">[ 검진 세부 정보 ]</div>
                            <div class="row-box1">
                                <div class="row-box-inner width_box">
                                    <div class="col-box1 row">
                                        <div class="col-lg-1 tag_name"><span>대상인원</span></div>
                                        <div class="col-lg-11" id="companyCheckup.employeeNumber"
                                             data-ggsj="dxTextBox"></div>
                                    </div>
                                </div><!--row-box-inner-->

                                <div class="row-box-inner width_box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag_name"><span>검진 실시 기간</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6" id="companyCheckup.checkupDateBegin"
                                                 data-ggsj="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6" id="companyCheckup.checkupDateEnd"
                                                 data-ggsj="dxDateBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag_name"><span>예약 가능 기간</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6" id="companyCheckup.reserveDateBegin"
                                                 data-ggsj="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6" id="companyCheckup.reserveDateEnd"
                                                 data-ggsj="dxDateBox"></div>
                                        </div>
                                    </div>

                                </div><!--row-box-inner-->
                            </div><!--row-box -->
                        </div><!--row-wrap 4째단-->

                        <%-- checkup type dataGrid --%>
                        <div id="dataGridCheckupType" class="section sec02 sub_table" data-ggsj="dxDataGrid"
                             style="height:37vh"></div>
                    </div>
                    <%--                    </div>--%>
                    <div class="row btn_area footer_btn">
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
        let ciForm = $('#ci');

        let ciImage = $('#ciUrl');
        ciImage.hide();

        let dxInstances = ggsj.createDx(false);

        function previewImage(input, target) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();

                reader.onload = function (e) {
                    target.attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        dxInstances.companyCode.option({
            valueChangeEvent: "keyup",
            onValueChanged: function () {
                dxInstances.check.option({value: ''});
            }
        });

        dxInstances.btnCompanySearch.option({
            text: '중복체크',
            onClick: function () {
                if (dxInstances.companyCode.option('value') === '') {
                    alert("기업코드를 입력해주세요.");
                    return;
                }

                $.ajax({
                    url: '<c:url value="/pm/company/check"/>',
                    method: 'GET',
                    data: {
                        companyCode: dxInstances.companyCode.option('value'),
                    },
                }).then(function (response) {
                    if (response.data.checkCode === 0) {
                        let con = confirm("사용하실 수 있는 기업코드 입니다. 사용하시겠습니까?");
                        if (con === true) {
                            dxInstances.check.option({value: '1'});
                        } else {
                            dxInstances.check.option({value: ''});
                        }
                    } else {
                        alert("중복된 기업코드가 존재합니다.");
                    }
                });
            }
        });

        let year = new Date().getFullYear();
        let checkupYear = [];
        for (let i = 0; i < 10; i++) {
            checkupYear.push({
                id: year + i, text: String(year + i)
            });
        }

        dxInstances['companyCheckup.checkupYear'].option({
            dataSource: checkupYear,
            value: year
        });

        dxInstances.businessNo.option({
            mask: '000-00-00000',
        });

        dxInstances['companyCheckup.checkupDateBegin'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
        });

        dxInstances['companyCheckup.checkupDateEnd'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
        });

        dxInstances['companyCheckup.reserveDateBegin'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
        });

        dxInstances['companyCheckup.reserveDateEnd'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
        });

        dxInstances.idPlaceHolder.option({
            layout: 'horizontal',
            items: [
                'ID입력',
                '휴대전화번호 (11자리)',
                '사원번호',
                '기타 (15자이내 텍스트 입력)',
            ],
            value: 'ID입력',
        });

        dxInstances.pwPlaceHolder.option({
            layout: "horizontal",
            items: [
                'PW입력',
                '휴대전화번호 (11자리)',
                '사원번호',
                '기타 (15자이내 텍스트 입력)',
            ],
            value: 'PW입력',
        });

        dxInstances.dataGridCheckupType.option({
            editing: {
                mode: "batch",
                allowAdding: true,
                allowUpdating: true,
                allowDeleting: true,
                selectTextOnEditStart: true,
                startEditAction: "click",
            },
            // showSpinButtons: false,
            // step: 0,
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
        });

        dxInstances.dataGridCheckupType.cancelEditData();

        dxInstances.noUse.option({
            text: '로그인 중지',
        });

        dxInstances.useNotiTalk.option({
            text: '자동발송',
        });

        dxInstances.btnAttach.option({
            text: '파일첨부',
            onClick: function () {
                ciForm.trigger('click');
            },
            height: 10,
        });

        dxInstances.ciFilename.option({
            readOnly: true,
        });

        dxInstances.accountUser.option({
            valueExpr: 'userId',
            displayExpr: 'platformManagerName',
        });
        dxInstances.salesUser.option({
            valueExpr: 'userId',
            displayExpr: 'platformManagerName',
        });
        dxInstances.adminUser.option({
            valueExpr: 'userId',
            displayExpr: 'platformManagerName',
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

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '목록',
            onClick: function () {
                location.href = '<c:url value="/pm/company"/>';
            }
        });

        // Save
        dxInstances.btnSave.option({
            stylingMode: "contained",
            text: "저장",
            type: "success",
            onClick: function () {
                let data = ggsj.dxToValues();
                let gridData = dxInstances.dataGridCheckupType.option('editing.changes').map(function (v) {
                    v.data._crudType = v.type.toUpperCase();
                    return v.data;
                });

                if (!data.companyName) {
                    alert('기업체명을 입력해주세요.');
                    return;
                }
                if (!data.companyCode) {
                    alert('기업체코드를 입력해주세요.');
                    return;
                }

                if (data.check === '') {
                    alert("중복체크를 해주세요.");
                    return;
                }

                if (gridData.length === 0 || !gridData[0].companyCheckupTypeCode) {
                    alert("기업 검진 유형을 입력해주세요.");
                    return;
                }

                if (!gridData[0].companyCheckupTypeName) {
                    alert("기업 검진 유형명을 입력해주세요.");
                    return;
                }

                if (!gridData[0].supportPay) {
                    alert("기업 검진 지원금액을 입력해주세요.");
                    return;
                }

                // if (!data.businessNo) {
                //     alert('사업자번호를 입력하세요');
                //     return;
                // }

                data.companyCheckup.companyCheckupTypes = gridData;

                let formData = new FormData($('#formCi')[0]);
                formData.append('company', new Blob([JSON.stringify(data)], {
                    type: "application/json"
                }));

                $.ajax({
                    url: '<c:url value="/pm/company"/>',
                    method: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData,
                }).then(function () {
                    ggsj.notify("저장되었습니다.");
                    location.href = '<c:url value="/pm/company"/>';
                });
            }
        });

        $.ajax({
            url: '<c:url value="/pm/salesmanager"/>',
            method: 'GET',
        }).then(function (response) {
            console.log(response);
            dxInstances['companyCheckup.salesManager'].option({
                items: response.data,
                valueExpr: 'salesManager',
                displayExpr: 'salesManager',
            });
        });
        $.ajax({
            url: '<c:url value="/pm/assistmanager"/>',
            method: 'GET',
        }).then(function (response) {
            dxInstances['companyCheckup.assistManager'].option({
                items: response.data,
                valueExpr: 'assistManager',
                displayExpr: 'assistManager',
            });
        });

        // selectPlatformManagerList Load
        $.ajax({
            url: '<c:url value="/pm/platformmanagerlist"/>',
            method: 'GET',
        }).then(function (response) {
            console.log(response);
            dxInstances.accountUser.option({
                items: response.data,
            });
            dxInstances.salesUser.option({
                items: response.data,
            });
            dxInstances.adminUser.option({
                items: response.data,
            });
        });
    });
</script>

</html>

