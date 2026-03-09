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
                            <h3 class="h3">?àÏïΩ?ÅÏÑ∏?ÑÌô©</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- ?åÏÜç Í∏∞ÏóÖ -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap1">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?åÏÜç Í∏∞ÏóÖ</span></div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12" id="companyState"
                                                     data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>Î≥ëÏõêÍ≥ÑÏïΩÎß§Îãà?Ä</span></div>
                                            <div class="col-lg-10">
                                                <div class="col-lg-12" id="employeeCheckup.companyCheckupId"
                                                     data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- ?åÏÜç Í∏∞ÏóÖ -->

                        <div class="row-wrap row-wrap-box">
                            <!-- ?àÏïΩ ?ïÎ≥¥ -->
                            <div class="row-wrap row-wrap2">
                                <div class="row-box-title"><i class="xi-play-circle"></i>?àÏïΩ ?ïÎ≥¥</div>
                                <div class="row-box1">
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?†Ï≤≠ Î≥ëÏõêÎ™?/span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="hospitalCenterName"
                                                     data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>Í≤ÄÏßÑÌù¨ÎßùÏùº</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="desiredAt"
                                                     data-sitebuilder="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?àÏïΩ?±Î°ù?ºÏãú</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="registeredAt"
                                                     data-sitebuilder="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?àÏïΩ?ïÏ†ï??/span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="confirmedAt"
                                                     data-sitebuilder="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?òÍ??ÑÎ£å??/span></div>
                                            <div class="col-lg-10 row period">
                                                <div id="checkupedAt"
                                                     data-sitebuilder="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?àÏïΩ?ÅÌÉú</span></div>
                                            <div class="col-lg-10 row period">
                                                <div id="reservationState"
                                                     data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ?àÏïΩ ?ïÎ≥¥ -->

                            <!-- Í≤ÄÏßÑÏûê ?ïÎ≥¥ -->
                            <div class="row-wrap row-wrap2">
                                <div class="row-box-title"><i class="xi-play-circle"></i>Í≤ÄÏßÑÏûê ?ïÎ≥¥</div>
                                <div class="row-box1">
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>Í≤ÄÏßÑÏûêÎ™?/span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="employeeName"
                                                     data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?ùÎÖÑ?îÏùº / ?±Î≥Ñ</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="birthSex" data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>Í¥ÄÍ≥?/span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="myselfFamily" data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?¥Î??ÑÌôîÎ≤àÌò∏</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="mobile"
                                                     data-sitebuilder="dxTextBox" data-sitebuilder-format="tel"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?¥Î©î??/span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="email"
                                                     data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>Ï£ºÏÜå</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="address" data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Í≤ÄÏßÑÏûê ?ïÎ≥¥ -->
                        </div>

                        <!-- Í∏∞ÏóÖ Î∞?Í≤ÄÏß??ïÎ≥¥ -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Í∏∞ÏóÖ Î∞?Í≤ÄÏß??ïÎ≥¥</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row center-input">
                                        <div class="col-lg-box3 row">
                                            <div class="col-lg-3 tag-name"><span>Í∏∞ÏóÖÏ≤¥Î™Ö</span></div>
                                            <div class="col-lg-9" id="companyName" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                        <div class="col-lg-box3 row">
                                            <div class="col-lg-3 tag-name"><span>Î∂Ä?úÎ™Ö/ÏßÅÏ±Ö</span></div>
                                            <div class="col-lg-4" id="departTitle" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                        <div class="col-lg-box3 row">
                                            <div class="col-lg-3 tag-name"><span>?¨ÏõêÎ≤àÌò∏</span></div>
                                            <div class="col-lg-9" id="employeeNo"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-box1 row">
                                <div class="col-lg-1 tag-name"><span>Í≤ÄÏßÑÏú†??/span></div>
                                <div class="col-lg-11" id="checkupCodeName" data-sitebuilder="dxTextBox"></div>
                            </div>

                            <div class="col-box3 row">
                                <div class="col-box1 col-box-vertical3 row">
                                    <div class="col-lg-3 tag-name"><span>?†ÌÉùÍ≤Ä??/span></div>
                                    <div class="col-lg-9" id="register" data-sitebuilder="dxTextArea"></div>
                                </div>
                            </div>
                            <div class="col-box3 row">
                                <div class="col-box1 col-box-vertical3 row">
                                    <div class="col-lg-3 tag-name"><span>Ï∂îÍ?Í≤Ä??/span></div>
                                    <div class="col-lg-9" id="moreCheck" data-sitebuilder="dxTextArea"></div>
                                </div>
                            </div>
                            <div class="col-box3 row">
                                <div class="col-box1 col-box-vertical3 row">
                                    <div class="col-lg-3 tag-name"><span>?πÍ? ?Ä??Î¨ºÏßà</span></div>
                                    <div class="col-lg-9" id="specialCheckupText" data-sitebuilder="dxTextArea"></div>
                                </div>
                            </div>

                            <div class="col-box1 row">
                                <div class="col-lg-1 tag-name"><span>Í≤ÄÏßÑÎπÑ Ï≤?µ¨</span></div>
                                <div class="col-lg-2" id="supportTypeMyself" data-sitebuilder="dxTextBox"></div>
                                <div class="col-lg-2" style="display: none;" id="supportType"
                                     data-sitebuilder="dxSelectBox"></div>
                                <div class="col-lg-2" style="display: none;" id="myself" data-sitebuilder="dxSelectBox"></div>
                            </div>


                            <div class="col-box1 row center-input">
                                <div class="col-lg-1 tag-name"><span>Î≥∏Ïù∏Î∂Ä??ÎπÑÏö©</span></div>
                                <div class="col-lg-11">
                                    <div class="col-lg-box4 row">
                                        <div class="col-lg-4 tag-name"><span>Ï¥??©ÏÇ∞</span></div>
                                        <div class="col-lg-8" id="total" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-lg-box4 row">
                                        <div class="col-lg-4 tag-name"><span>Í≤ÄÏßÑÎπÑ</span></div>
                                        <div class="col-lg-8" id="hospitalPayComma"
                                             data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-lg-box4 row">
                                        <div class="col-lg-4 tag-name"><span>?†Ìòï Î≥ÄÍ≤?Ï∞®Ïï°</span></div>
                                        <div class="col-lg-8" id="upgradePayComma"
                                             data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-lg-box4 row">
                                        <div class="col-lg-4 tag-name"><span>Ï∂îÍ?Í≤Ä?¨ÎπÑ</span></div>
                                        <div class="col-lg-8" id="sumItemCopayComma" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Í∏∞ÏóÖ Î∞?Í≤ÄÏß??ïÎ≥¥ -->

                        <!-- Í∏∞Ì? ?¨Ìï≠ -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Í∏∞Ì? ?¨Ìï≠</div>
                            <div class="row-box2">
                                <div class="row-box-inner1">
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>?πÏù¥?¨Ìï≠</span></div>
                                        <div class="col-lg-10" id="notes" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>Í±¥Í∞ï?¥Ïûê Î©îÎ™®</span></div>
                                        <div class="col-lg-10" id="platformNotes" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>Î≥ëÏõê Î©îÎ™®</span></div>
                                        <div class="col-lg-10" id="hospitalNotes" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-box2">
                                <div class="row-box-inner1">
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>Í≥†Í∞ù Î¨∏Ïùò?¨Ìï≠</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeNotes" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box1 col-box-vertical2 row">
                                        <div class="col-lg-2 tag-name"><span>?àÏïΩ Î≥¥Î•ò,<br>Ï∑®ÏÜå ?¨Ïú†</span></div>
                                        <div class="col-lg-10" id="stateNotes" data-sitebuilder="dxTextArea"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Í∏∞Ì? ?¨Ìï≠ -->

                    </div><!-- viewport -->
                </div>

                <div class="row btn_area footer-btn">
                    <div class="col-lg-1" id="btnEdit" data-sitebuilder="dxButton"><i class="xi-file-check"></i>?òÏ†ï</div>
                    <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">Î™©Î°ù</div>
                </div>

            </div>
        </div>
    </div>

    <%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        sitebuilder.openMenu('reserve');

        let dxInstances = sitebuilder.createDx(true);
        // dataType: 'date',

        dxInstances.reservationState.option({
            items: [
                {'id': 0, 'text': '?àÏïΩÏ∑®ÏÜå'},
                {'id': 1, 'text': '?àÏïΩ?†Ï≤≠'},
                {'id': 2, 'text': '?àÏïΩ?ïÏ†ï'},
                {'id': 3, 'text': '?àÏïΩÎ≥ÄÍ≤?},
                {'id': 4, 'text': '?òÍ??ÑÎ£å'},
                {'id': 5, 'text': '?àÏïΩÎ≥¥Î•ò'},
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
                {'id': false, 'text': 'Í∏∞ÏóÖÎ∂Ä??},
                {'id': true, 'text': 'Î≥∏Ïù∏Î∂Ä??},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.myself.option({
            items: [
                {'id': null, 'text': 'Í∞ÄÏ°?},
                {'id': 1, 'text': 'Î≥∏Ïù∏'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.btnEdit.option({
            stylingMode: 'contained',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/reserve/${reservationId}"/>' + '/edit';
            }
        });

        // List
        dxInstances.btnList.option({
            stylingMode: 'contained',
            type: 'normal',
            onClick: function () {
                if (dxInstances.reservationState.option('value') === 0) {
                    location.href = '<c:url value="/pm/cancel-reserve"/>';
                } else {
                    location.href = '<c:url value="/pm/reserve"/>';
                }
            }
        });

        let companyId = [];
        let hospitalId = [];

        // Load
        $.ajax({
            url: '<c:url value="/pm/reserve/${reservationId}"/>',
            method: 'GET',
        }).then(function (response) {
            sitebuilder.valuesToDx(response.data);

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
                    return dxInstances.companyName.option('value') + " | " + " (Í≤ÄÏßÑÍ∏∞Í∞? "
                        + new Date(dxInstances.checkupDateBegin).toISOString().substring(0, 10) + " ~ "
                        + new Date(dxInstances.checkupDateEnd).toISOString().substring(0, 10) + " | " + " (?àÏïΩÍ∏∞Í∞Ñ) "
                        + new Date(dxInstances.reserveDateBegin).toISOString().substring(0, 10) + " ~ "
                        + new Date(dxInstances.reserveDateEnd).toISOString().substring(0, 10);
                }
            });

            dxInstances.birthSex.option({
                value: function () {
                    return new Date(dxInstances.birth).toISOString().substring(0, 10)
                        + " / " + (dxInstances.sex === 'M' ? '?? : '??);
                }
            });

            dxInstances.myselfFamily.option({
                value: function () {
                    if (dxInstances.myself.option('value') === 1) {
                        return 'Î≥∏Ïù∏';
                    } else {
                        return '(' + dxInstances.familyName + ') ?òÏùò Í∞ÄÏ°?;
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
                    return (dxInstances.specialCheckup === 0 ? '?¥Îãπ?ÜÏùå' : '?πÍ??Ä??) + '\n' + dxInstances.specialCheckupMemo;
                }
            });

            dxInstances.supportTypeMyself.option({
                value: function () {
                    return (dxInstances.supportType.option('value') === true ? 'Î≥∏Ïù∏Î∂Ä?? : 'Í∏∞ÏóÖÎ∂Ä?? + ' / ' + sitebuilder.numberWithCommas(dxInstances.hospitalPay) + " ??);
                }
            });

            dxInstances.total.option({
                value: function () {
                    if (dxInstances.supportType.option('value') === true) {
                        return sitebuilder.numberWithCommas(dxInstances.hospitalPay + dxInstances.upgradePay + dxInstances.sumItemCopay + dxInstances.sumItemDiscountBill) + " ??;
                    } else {
                        return sitebuilder.numberWithCommas(dxInstances.upgradePay + dxInstances.sumItemCopay + dxInstances.sumItemDiscountBill) + " ??;
                    }
                }
            });

            dxInstances.hospitalPayComma.option({
                value: function () {
                    return (dxInstances.supportType.option('value') === true ? sitebuilder.numberWithCommas(dxInstances.hospitalPay) + " ?? : '0 ??);
                }
            });

            dxInstances.upgradePayComma.option({
                value: function () {
                    return sitebuilder.numberWithCommas(dxInstances.upgradePay) + " ??;
                }
            });

            dxInstances.sumItemCopayComma.option({
                value: function () {
                    return sitebuilder.numberWithCommas(dxInstances.sumItemCopay + dxInstances.sumItemDiscountBill) + " ??;
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
                url: '<c:url value="/pm/reserve/manager"/>',
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
