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
                            <h3 class="h3">?åÏõê Í∏∞Î≥∏?ïÎ≥¥ ?òÏ†ï</h3>

                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- ?Ä?ÅÎÖÑ??-->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap2">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>Í∏∞ÏóÖÏ≤¥Î™Ö</span></div>
                                            <div class="col-lg-8 row period">
                                                <div class="col-lg-12" id="companyId"
                                                     data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>?Ä?ÅÎÖÑ??/span></div>
                                            <div class="col-lg-8 row period">
                                                <div class="col-lg-12" id="employeeCheckup.companyCheckupId" data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </div>
                        <!-- ?Ä?ÅÎÖÑ??-->

                        <!-- Í∏∞Î≥∏ ?∏Ï†Å?¨Ìï≠ -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Í∏∞Î≥∏ ?∏Ï†Å?¨Ìï≠</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>ID</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-9" id="employeeCode"
                                                 data-sitebuilder="dxTextBox"></div>
                                            <div class="col-lg-3" id="noUse"
                                                 data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>PW</span></div>
                                        <div class="col-lg-10 row period center-box">
                                            <div class="col-lg-12 btnGray" id="passwordReset"
                                                 data-sitebuilder="dxButton"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Í≤ÄÏßÑÏûêÎ™?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-9" id="employeeName"
                                                 data-sitebuilder="dxTextBox"></div>
                                            <div class="col-lg-3" id="employeeCheckup.vip"
                                                 data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?ùÎÖÑ?îÏùº</span></div>
                                        <div class="col-lg-4 row">
                                            <div class="col-lg-12" id="birth"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?¥Î??ÑÌôîÎ≤àÌò∏</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="mobile"
                                                 data-sitebuilder="dxTextBox" data-sitebuilder-format="tel"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?±Î≥Ñ</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-12" id="sex"
                                                 data-sitebuilder="dxSelectBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <%--Ï£ºÏÜå ?úÍ∏∞ ?§Ïãú?¥Ïïº??-%>
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?∞Ìé∏Î≤àÌò∏</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2" id="zipcode"
                                                 data-sitebuilder="dxTextBox"></div>
                                            <div class="col-lg-2 btnGray" id="zipcodeSearch"
                                                 data-sitebuilder="dxButton"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?¥Î©î??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="email"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Ï£ºÏÜå</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="address1"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?ÅÏÑ∏Ï£ºÏÜå</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="address2"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?åÎ¶º??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-4" id="employeeCheckup.notokGuide"
                                                 data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-4" id="employeeCheckup.notokReserve"
                                                 data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-4" id="employeeCheckup.notokUrge"
                                                 data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Î∞úÏÜ°?úÏô∏ ?òÏ†ï?ºÏãú</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeCheckup.notokUpdatedAt"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Í∏∞Î≥∏ ?∏Ï†Å?¨Ìï≠ -->

                        <!-- Í∏∞ÏóÖ Î∞?Í≤ÄÏßÑÏ†ïÎ≥?-->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Í∏∞ÏóÖ Î∞?Í≤ÄÏßÑÏ†ïÎ≥?/div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>ÏßÅÏõêÎ™?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="familyName"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Î∂Ä??/span></div>
                                        <div class="col-lg-4" id="depart" data-sitebuilder="dxTextBox"></div>
                                        <div class="col-lg-2 tag-name"><span>ÏßÅÏ±Ö</span></div>
                                        <div class="col-lg-4" id="title" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?Ä?ÅÏûê Íµ¨Î∂Ñ</span></div>
                                        <div class="col-lg-4" id="myself" data-sitebuilder="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name"><span>ÎπÑÏö©Ï≤?µ¨</span></div>
                                        <div class="col-lg-4" id="employeeCheckup.supportType"
                                             data-sitebuilder="dxSelectBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?¨ÏõêÎ≤àÌò∏</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeNo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Í≤ÄÏßÑÏú†??/span></div>
                                        <div class="col-lg-4" id="employeeCheckup.companyCheckupTypeId"
                                             data-sitebuilder="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name"><span>Í≤ÄÏßÑÏú†?ïÎ™Ö</span></div>
                                        <div class="col-lg-4" id="companyCheckupType.companyCheckupTypeName"
                                             data-sitebuilder="dxSelectBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>ÏßÄ?êÍ∏à??/span></div>
                                        <div class="col-lg-4" id="companyCheckupType.supportPay"
                                             data-sitebuilder="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name"><span>Î≥∏Ïù∏Î∂Ä?¥Ïï°</span></div>
                                        <div class="col-lg-4" id="companyCheckupType.copay"
                                             data-sitebuilder="dxSelectBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?πÏàòÍ≤ÄÏß??Ä??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeCheckup.specialCheckup"
                                                 data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?πÏàòÍ≤ÄÏß?Î¨ºÏßà</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeCheckup.specialCheckupMemo"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 col-box-vertical3 row">
                                        <div class="col-lg-1 tag-name"><span>?πÏù¥?¨Ìï≠</span></div>
                                        <div class="col-lg-11 row period">
                                            <div id="employeeCheckup.notes"
                                                 data-sitebuilder="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Í∏∞ÏóÖ Î∞?Í≤ÄÏßÑÏ†ïÎ≥?-->

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>?Ä??/div>
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">Î™©Î°ù</div>
                            <div class="col-lg-1" id="btnDelete" data-sitebuilder="dxButton">??†ú</div>
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
        sitebuilder.openMenu('employee');

        let dxInstances = sitebuilder.createDx(false);

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
            text: '?åÏõê Î°úÍ∑∏??Ï§ëÎã®',
            value: false,
        });

        dxInstances.passwordReset.option({
            text: 'ÎπÑÎ≤à Ï¥àÍ∏∞??,
            onClick: function () {
                confirm('?ïÎßêÎ°?Ï¥àÍ∏∞???òÏãúÍ≤†Ïäµ?àÍπå?');
                $.ajax({
                    url: '<c:url value="/pm/employee/reset"/>',
                    method: 'POST',
                    data: JSON.stringify(sitebuilder.dxToValues()),
                }).then(function () {
                    alert("ÎπÑÎ?Î≤àÌò∏Î•?Ï¥àÍ∏∞???àÏäµ?àÎã§.\nÎπÑÎ?Î≤àÌò∏??Î°úÍ∑∏?∏Ïãú Í∏∞ÏóÖ???§Ï†ï??Í∞íÏúºÎ°?Ï¥àÍ∏∞???©Îãà??");
                });
            }
        });

        dxInstances.birth.option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            showDropDownButton: false,
        });

        dxInstances['employeeCheckup.notokGuide'].option({
            text: 'Í≤ÄÏßÑÏã§???àÎÇ¥',
            value: false,
        });

        dxInstances['employeeCheckup.notokReserve'].option({
            text: '?àÏïΩ ?àÎÇ¥',
            value: false,
        });

        dxInstances['employeeCheckup.notokUrge'].option({
            text: 'ÎØ∏Ïòà???ÖÎ†§ ?àÎÇ¥',
            value: false,
        });

        dxInstances['employeeCheckup.notokUpdatedAt'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            showDropDownButton: false,
        });

        dxInstances['employeeCheckup.vip'].option({
            text: 'VIP',
            value: false,
        });

        dxInstances.sex.option({
            dataSource: [
                {'id': 'M', 'text': '??},
                {'id': 'F', 'text': '??},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.mobile.option({
            placeholder: '?¥Î??ÑÌôî 11?êÎ¶¨',
        });

        dxInstances.zipcodeSearch.option({
            text: '?∞Ìé∏Î≤àÌò∏',
            onClick: function () {
                execution_daum_address(dxInstances.zipcode, dxInstances.address1, dxInstances.address2);
            }
        });

        dxInstances.depart.option({
            placeholder: 'Î∂Ä??,
        });

        dxInstances.title.option({
            placeholder: 'ÏßÅÏ±Ö',
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
                return item && sitebuilder.numberWithCommas(item.supportPay);
            },
            valueExpr: 'companyCheckupTypeId',
            readOnly: true
        });

        dxInstances['companyCheckupType.copay'].option({
            displayExpr: function (item) {
                return item && sitebuilder.numberWithCommas(item.copay);
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
                {'id': 1, 'text': 'Î≥∏Ïù∏'},
                {'id': 2, 'text': 'Í∞ÄÏ°?},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances['employeeCheckup.supportType'].option({
            dataSource: [
                {'id': 0, 'text': 'Í∏∞ÏóÖÎ∂Ä??},
                {'id': 1, 'text': 'Î≥∏Ïù∏Î∂Ä??},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances['employeeCheckup.specialCheckup'].option({
            text: '?πÍ??Ä??,
            value: false
        });

        // Save
        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '?Ä??,
            type: 'success',
            onClick: function () {
                let data = sitebuilder.dxToValues();

                data['companyCheckupType'] = null;
                data['lookupCompany'] = null;

                if (data.check === '') {
                    alert("Ï§ëÎ≥µÏ≤¥ÌÅ¨Î•??¥Ï£º?∏Ïöî.")
                    return;
                }

                if (data.employeeCheckup.companyCheckupTypeId === null) {
                    alert("Í≤ÄÏßÑÏú†?ïÏùÑ ?†ÌÉù???¥Ï£º?∏Ïöî.")
                    return;
                }

                if (!data.employeeName) {
                    alert('?¥Î¶Ñ???ÖÎ†•?òÏÑ∏??);
                    return;
                }

                if (!data.mobile) {
                    alert('?¥Î??ÑÌôî Î≤àÌò∏Î•??ÖÎ†•?òÏÑ∏??);
                    return;
                }

                data.birth = new Date(dxInstances.birth.option('text'));

                $.ajax({
                    url: '<c:url value="/pm/employee/${employeeCheckupId}"/>',
                    method: 'PUT',
                    data: JSON.stringify(data),
                }).then(function () {
                    sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");
                    location.href = '<c:url value="/pm/employee"/>?' + $.param({
                        companyId: dxInstances.companyId.option('value'),
                        checkupYear: dxInstances['employeeCheckup.companyCheckupId'].option('text'),
                    });
                });
            },
        });

        // List
        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: 'Î™©Î°ù',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/pm/employee"/>?' + $.param({
                    companyId: dxInstances.companyId.option('value'),
                    checkupYear: dxInstances['employeeCheckup.companyCheckupId'].option('text'),
                });
            },
        });

        // Delete
        dxInstances.btnDelete.option({
            stylingMode: 'contained',
            text: '??†ú',
            type: 'danger',
            onClick: function () {
                let data = sitebuilder.dxToValues();

                if (confirm('?ïÎßêÎ°???†ú?òÏãúÍ≤†Ïäµ?àÍπå?')) {
                    $.ajax({
                        url: '<c:url value="/pm/employee/${employeeCheckupId}"/>',
                        method: 'DELETE',
                        data: JSON.stringify(data),
                    }).then(function () {
                        location.href = '<c:url value="/pm/employee"/>';
                    });
                }
            },
        });

        /* ?§Ïùå Ï£ºÏÜå ?∞Îèô */
        function execution_daum_address(zipcode, address1, address2) {
            new daum.Postcode({
                oncomplete: function (data) {
                    let extraAddr = '';

                    // Í±¥Î¨ºÎ™ÖÏù¥ ?àÍ≥†, Í≥µÎèôÏ£ºÌÉù??Í≤ΩÏö∞ Ï∂îÍ??úÎã§.
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        extraAddr = ' (' + extraAddr + ')';
                    }

                    // ?∞Ìé∏Î≤àÌò∏?Ä Ï£ºÏÜå ?ïÎ≥¥Î•??¥Îãπ ?ÑÎìú???£Îäî??
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

        // load by ajax async
        $.ajax({
            url: '<c:url value="/pm/employee/${employeeCheckupId}"/>',
            method: 'GET',
        }).then(function (response) {
            sitebuilder.valuesToDx(response.data);

            if (response.data.myDepart != null) {
                dxInstances.depart.option({
                    value: response.data.myDepart
                });
            } else if (response.data.famDepart != null) {
                dxInstances.depart.option({
                    value: response.data.famDepart
                });
            }

            if (response.data.myTitle != null) {
                dxInstances.title.option({
                    value: response.data.myTitle
                });
            } else if (response.data.famTitle != null) {
                dxInstances.title.option({
                    value: response.data.famTitle
                });
            }

            if (response.data.familyName != null) {
                dxInstances.familyName.option({
                    value: response.data.familyName
                });
            } else {
                dxInstances.familyName.option({
                    value: response.data.employeeName
                });
            }

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
