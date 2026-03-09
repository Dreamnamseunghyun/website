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
                            <h3 class="h3">?åÏõê Í∏∞Î≥∏?ïÎ≥¥ ?±Î°ù</h3>
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
                                                <div class="col-lg-12" id="lookupCompany"
                                                     data-sitebuilder="dxLookup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2" style="display: none" id="employeeCheckup.companyCheckupId"
                                     data-sitebuilder="dxTextBox"></div>
                                <div class="col-lg-2" style="display: none" id="companyId" data-sitebuilder="dxTextBox"></div>

                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>?Ä?ÅÎÖÑ??/span></div>
                                            <div class="col-lg-8 row period">
                                                <div class="col-lg-12" id="employeeCheckup.checkupYear"
                                                     data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!-- ?Ä?ÅÎÖÑ??-->

                        <!-- Í∏∞Î≥∏ ?∏Ï†Å?¨Ìï≠ -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Í∏∞Î≥∏ ?∏Ï†Å?¨Ìï≠
                                <div class="checkText right"><i class="xi-check-min"></i>?ÑÏàò?ÖÎ†• ??™©?ÖÎãà??</div>
                            </div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>ID</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-9" id="employeeCode" data-sitebuilder="dxTextBox"></div>
                                            <div class="col-lg-3">
                                                <div class="btnGray" id="userIdCheck" data-sitebuilder="dxButton"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>PW</span></div>
                                        <div class="col-lg-10 row period center-box">
                                            <div class="col-lg-12" id="userPw"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>Í≤ÄÏßÑÏûêÎ™?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-10" id="employeeName"
                                                 data-sitebuilder="dxTextBox"></div>
                                            <div class="col-lg-2" id="employeeCheckup.vip"
                                                 data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>?ùÎÖÑ?îÏùº</span></div>
                                        <div class="col-lg-4 row">
                                            <div class="col-lg-12" id="birth"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>?¥Î??ÑÌôîÎ≤àÌò∏</span></div>
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
                                        <div class="col-lg-2 tag-name"><span>Î∞úÏÜ°?úÏô∏ ?òÏ†ï??/span></div>
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
                                        <div class="col-lg-2 tag-name check"><span>?Ä?ÅÏûê Íµ¨Î∂Ñ</span></div>
                                        <div class="col-lg-4" id="myself" data-sitebuilder="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name check"><span>ÎπÑÏö©Ï≤?µ¨</span></div>
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
                                        <div class="col-lg-2 tag-name check"><span>Í≤ÄÏßÑÏú†??/span></div>
                                        <div class="col-lg-4" id="employeeCheckup.companyCheckupTypeId"
                                             data-sitebuilder="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name"><span>Í≤ÄÏßÑÏú†?ïÎ™Ö</span></div>
                                        <div class="col-lg-4" id="companyCheckupTypeName"
                                             data-sitebuilder="dxTextBox"></div>
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
                                            <div class="col-lg-12" id="employeeCheckup.notes"
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
                            <div class="col-lg-1" id="check" style="display: none" data-sitebuilder="dxTextBox"></div>
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
        sitebuilder.openMenu('employee');

        let dxInstances = sitebuilder.createDx(false);

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
                                    sitebuilder.valuesToDx(response.data);
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
                {'id': 1, 'text': 'Î≥∏Ïù∏'},
                {'id': 2, 'text': 'Í∞ÄÏ°?},
            ],
        });

        dxInstances['employeeCheckup.supportType'].option({
            dataSource: [
                {'id': 1, 'text': 'Î≥∏Ïù∏Î∂Ä??},
                {'id': 0, 'text': 'Í∏∞ÏóÖÎ∂Ä??},
            ],
        });

        dxInstances.employeeCode.option({
            valueChangeEvent: "keyup",
            onValueChanged: function () {
                dxInstances.check.option({value: ''});
            }
        });

        dxInstances.userIdCheck.option({
            text: 'Ï§ëÎ≥µÏ≤¥ÌÅ¨',
            onClick: function () {
                if (dxInstances.companyId.option('value') === '') {
                    alert("?åÏÇ¨Î•??†ÌÉù?¥Ï£º?∏Ïöî.\n\n??Ï§ëÎ≥µ Ï≤¥ÌÅ¨ ???ÑÏàò ?ÖÎ†•?¨Ìï≠?Ä ?ÑÎûò?Ä Í∞ôÏäµ?àÎã§.\n1. Í∏∞ÏóÖÏ≤¥Î™Ö / 2. Í≤ÄÏßÑÏûêÎ™?/ 3. ?Ä?ÅÏûê Íµ¨Î∂Ñ / 4. ÎπÑÏö©Ï≤?µ¨\n\n??4Í∞úÎ? Î™®Îëê ?ÖÎ†• ??[Ï§ëÎ≥µÏ≤¥ÌÅ¨] Î≤ÑÌäº???¥Î¶≠?¥Ï£º?∏Ïöî.")
                    // DevExpress.ui.dialog.alert('<div style="width:20vw;">?åÏÇ¨Î•??†ÌÉù?¥Ï£º?∏Ïöî.<br><br>* Ï§ëÎ≥µ Ï≤¥ÌÅ¨???ÑÏàò ?ÖÎ†•?¨Ìï≠<br>- Í∏∞ÏóÖÏ≤¥Î™Ö<br>- Í≤ÄÏßÑÏûêÎ™?br>- ?Ä?ÅÏûê Íµ¨Î∂Ñ<br>- ÎπÑÏö©Ï≤?µ¨</div>', "Ï§ëÎ≥µÏ≤¥ÌÅ¨ Í≤ΩÍ≥†")

                    return;
                }

                if (dxInstances.myself.option('value') === null) {
                    alert("?Ä?ÅÏûê Íµ¨Î∂Ñ???†ÌÉù?¥Ï£º?∏Ïöî.\n\n??Ï§ëÎ≥µ Ï≤¥ÌÅ¨ ???ÑÏàò ?ÖÎ†•?¨Ìï≠?Ä ?ÑÎûò?Ä Í∞ôÏäµ?àÎã§.\n1. Í∏∞ÏóÖÏ≤¥Î™Ö / 2. Í≤ÄÏßÑÏûêÎ™?/ 3. ?Ä?ÅÏûê Íµ¨Î∂Ñ / 4. ÎπÑÏö©Ï≤?µ¨\n\n??4Í∞úÎ? Î™®Îëê ?ÖÎ†• ??[Ï§ëÎ≥µÏ≤¥ÌÅ¨] Î≤ÑÌäº???¥Î¶≠?¥Ï£º?∏Ïöî.")
                    return;
                }

                if (dxInstances['employeeCheckup.supportType'].option('value') === null) {
                    alert("ÎπÑÏö©Ï≤?µ¨Î•??†ÌÉù?òÏÑ∏??n\n??Ï§ëÎ≥µ Ï≤¥ÌÅ¨ ???ÑÏàò ?ÖÎ†•?¨Ìï≠?Ä ?ÑÎûò?Ä Í∞ôÏäµ?àÎã§.\n1. Í∏∞ÏóÖÏ≤¥Î™Ö / 2. Í≤ÄÏßÑÏûêÎ™?/ 3. ?Ä?ÅÏûê Íµ¨Î∂Ñ / 4. ÎπÑÏö©Ï≤?µ¨\n\n??4Í∞úÎ? Î™®Îëê ?ÖÎ†• ??[Ï§ëÎ≥µÏ≤¥ÌÅ¨] Î≤ÑÌäº???¥Î¶≠?¥Ï£º?∏Ïöî.")
                    return;
                }

                if (dxInstances.employeeName.option('value') === '') {
                    alert("Í≤ÄÏßÑÏûêÎ™ÖÏùÑ ?ÖÎ†•?¥Ï£º?∏Ïöî.\n\n??Ï§ëÎ≥µ Ï≤¥ÌÅ¨ ???ÑÏàò ?ÖÎ†•?¨Ìï≠?Ä ?ÑÎûò?Ä Í∞ôÏäµ?àÎã§.\n1. Í∏∞ÏóÖÏ≤¥Î™Ö / 2. Í≤ÄÏßÑÏûêÎ™?/ 3. ?Ä?ÅÏûê Íµ¨Î∂Ñ / 4. ÎπÑÏö©Ï≤?µ¨\n\n??4Í∞úÎ? Î™®Îëê ?ÖÎ†• ??[Ï§ëÎ≥µÏ≤¥ÌÅ¨] Î≤ÑÌäº???¥Î¶≠?¥Ï£º?∏Ïöî.")
                    return;
                }

                if (dxInstances.employeeCode.option('value') === '') {
                    alert("IDÎ•??ÖÎ†•?¥Ï£º?∏Ïöî.")
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
                        let con = confirm("?¨Ïö©?òÏã§ ???àÎäî ?ÑÏù¥?îÏûÖ?àÎã§. ?¨Ïö©?òÏãúÍ≤†Ïäµ?àÍπå?");
                        if (con === true) {
                            dxInstances.check.option({value: '1'});
                        } else {
                            dxInstances.check.option({value: ''});
                        }
                    } else {
                        alert("Ï§ëÎ≥µ???ÑÏù¥?îÍ? Ï°¥Ïû¨?©Îãà??");
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
                {'id': 'M', 'text': '??},
                {'id': 'F', 'text': '??},
            ],
            value: 'M',
        });

        dxInstances.mobile.option({
            placeholder: '?¥Î??ÑÌôî 11?êÎ¶¨',
        });

        dxInstances.zipcodeSearch.option({
            text: 'Ï£ºÏÜåÏ∞æÍ∏∞',
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

        dxInstances['companyCheckupType.supportPay'].option({
            placeholder: 'ÏßÄ?êÍ∏à??,
            readOnly: true,
        });

        dxInstances['companyCheckupType.copay'].option({
            placeholder: 'Î≥∏Ïù∏Î∂Ä?¥Ïï°',
            readOnly: true,
        });

        dxInstances.companyCheckupTypeName.option({
            placeholder: 'Í≤ÄÏßÑÏú†?ïÎ™Ö',
            readOnly: true,
        });

        dxInstances['employeeCheckup.specialCheckup'].option({
            text: '?πÍ??Ä??,
            value: false,
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
                if (!data.employeeCheckup.checkupYear) {
                    alert('Í∏∞ÏóÖÏ≤¥Î? ?†ÌÉù?òÏÑ∏??);
                    return;
                }

                if (!data.myself) {
                    alert('?Ä?ÅÏûê Íµ¨Î∂Ñ???†ÌÉù?òÏÑ∏??);
                    return;
                }

                if (data.employeeCheckup.supportType === null) {
                    alert('ÎπÑÏö©Ï≤?µ¨Î•??†ÌÉù?òÏÑ∏??);
                    return;
                }

                if (!data.employeeName) {
                    alert('Í≤ÄÏßÑÏûêÎ™ÖÏùÑ ?ÖÎ†•?òÏÑ∏??);
                    return;
                }

                if (!data.employeeCode) {
                    alert('IDÎ•??ÖÎ†•?òÏÑ∏??);
                    return;
                }

                if (!data.mobile) {
                    alert('?¥Î??ÑÌôî Î≤àÌò∏Î•??ÖÎ†•?òÏÑ∏??);
                    return;
                }

                if (data.check === '') {
                    alert("Ï§ëÎ≥µÏ≤¥ÌÅ¨Î•??¥Ï£º?∏Ïöî.")
                    return;
                }

                if (data.employeeCheckup.companyCheckupTypeId === null) {
                    alert("Í≤ÄÏßÑÏú†?ïÏùÑ ?†ÌÉù???¥Ï£º?∏Ïöî.")
                    return;
                }

                data.birth = new Date(dxInstances.birth.option('text'));

                $.ajax({
                    url: '<c:url value="/pm/employee"/>',
                    method: 'POST',
                    data: JSON.stringify(data),
                }).then(function () {
                    sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");
                    location.href = '<c:url value="/pm/employee"/>';
                });
            },
        });

        // List
        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: 'Î™©Î°ù',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/pm/employee"/>';
            }
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
