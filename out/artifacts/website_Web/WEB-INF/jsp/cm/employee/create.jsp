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
                            <h3 class="h3">?뚯썝 湲곕낯?뺣낫 ?깅줉</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- ??곷뀈??-->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap2">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>湲곗뾽泥대챸</span></div>
                                            <div class="col-lg-8 row period">
                                                <div class="col-lg-12" id="companyId"
                                                     data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2" style="display: none" id="employeeCheckup.companyCheckupId"
                                     data-sitebuilder="dxTextBox"></div>

                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>??곷뀈??/span></div>
                                            <div class="col-lg-8 row period">
                                                <div class="col-lg-12" id="employeeCheckup.checkupYear"
                                                     data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!-- ??곷뀈??-->

                        <!-- 湲곕낯 ?몄쟻?ы빆 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>湲곕낯 ?몄쟻?ы빆
                                <div class="checkText right"><i class="xi-check-min"></i>?꾩닔?낅젰 ??ぉ?낅땲??</div>
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
                                        <div class="col-lg-2 tag-name check"><span>寃吏꾩옄紐?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-10" id="employeeName"
                                                 data-sitebuilder="dxTextBox"></div>
                                            <div class="col-lg-2" id="employeeCheckup.vip"
                                                 data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>?앸뀈?붿씪</span></div>
                                        <div class="col-lg-4 row">
                                            <div class="col-lg-12" id="birth"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>?대??꾪솕踰덊샇</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="mobile"
                                                 data-sitebuilder="dxTextBox" data-sitebuilder-format="tel"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?깅퀎</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-12" id="sex"
                                                 data-sitebuilder="dxSelectBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <%--二쇱냼 ?쒓린 ?ㅼ떆?댁빞??-%>
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?고렪踰덊샇</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-2" id="zipcode"
                                                 data-sitebuilder="dxTextBox"></div>
                                            <div class="col-lg-2 btnGray" id="zipcodeSearch"
                                                 data-sitebuilder="dxButton"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?대찓??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="email"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>二쇱냼</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="address1"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?곸꽭二쇱냼</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="address2"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?뚮┝??/span></div>
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
                                        <div class="col-lg-2 tag-name"><span>諛쒖넚?쒖쇅 ?섏젙??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeCheckup.notokUpdatedAt"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 湲곕낯 ?몄쟻?ы빆 -->

                        <!-- 湲곗뾽 諛?寃吏꾩젙蹂?-->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>湲곗뾽 諛?寃吏꾩젙蹂?/div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>吏곸썝紐?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="familyName"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>遺??/span></div>
                                        <div class="col-lg-4" id="depart" data-sitebuilder="dxTextBox"></div>
                                        <div class="col-lg-2 tag-name"><span>吏곸콉</span></div>
                                        <div class="col-lg-4" id="title" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>??곸옄 援щ텇</span></div>
                                        <div class="col-lg-4" id="myself" data-sitebuilder="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name check"><span>鍮꾩슜泥?뎄</span></div>
                                        <div class="col-lg-4" id="employeeCheckup.supportType"
                                             data-sitebuilder="dxSelectBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?ъ썝踰덊샇</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeNo" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>寃吏꾩쑀??/span></div>
                                        <div class="col-lg-4" id="employeeCheckup.companyCheckupTypeId"
                                             data-sitebuilder="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name"><span>寃吏꾩쑀?뺣챸</span></div>
                                        <div class="col-lg-4" id="companyCheckupTypeName"
                                             data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>吏?먭툑??/span></div>
                                        <div class="col-lg-4" id="companyCheckupType.supportPay"
                                             data-sitebuilder="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name"><span>蹂몄씤遺?댁븸</span></div>
                                        <div class="col-lg-4" id="companyCheckupType.copay"
                                             data-sitebuilder="dxSelectBox"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?뱀닔寃吏????/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeCheckup.specialCheckup"
                                                 data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?뱀닔寃吏?臾쇱쭏</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeCheckup.specialCheckupMemo"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 col-box-vertical3 row">
                                        <div class="col-lg-1 tag-name"><span>?뱀씠?ы빆</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="employeeCheckup.notes"
                                                 data-sitebuilder="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 湲곗뾽 諛?寃吏꾩젙蹂?-->

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>???/div>
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">紐⑸줉</div>
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

        dxInstances.myself.option({
            dataSource: [
                {'id': 1, 'text': '蹂몄씤'},
                {'id': 2, 'text': '媛議?},
            ],
        });

        dxInstances['employeeCheckup.supportType'].option({
            dataSource: [
                {'id': 1, 'text': '蹂몄씤遺??},
                {'id': 0, 'text': '湲곗뾽遺??},
            ],
        });

        dxInstances.employeeCode.option({
            valueChangeEvent: "keyup",
            onValueChanged: function () {
                dxInstances.check.option({value: ''});
            }
        });

        dxInstances.userIdCheck.option({
            text: '以묐났泥댄겕',
            onClick: function () {
                if (dxInstances.companyId.option('value') === '') {
                    alert("?뚯궗瑜??좏깮?댁＜?몄슂.\n\n??以묐났 泥댄겕 ???꾩닔 ?낅젰?ы빆? ?꾨옒? 媛숈뒿?덈떎.\n1. 湲곗뾽泥대챸 / 2. 寃吏꾩옄紐?/ 3. ??곸옄 援щ텇 / 4. 鍮꾩슜泥?뎄\n\n??4媛쒕? 紐⑤몢 ?낅젰 ??[以묐났泥댄겕] 踰꾪듉???대┃?댁＜?몄슂.")
                    // DevExpress.ui.dialog.alert('<div style="width:20vw;">?뚯궗瑜??좏깮?댁＜?몄슂.<br><br>* 以묐났 泥댄겕???꾩닔 ?낅젰?ы빆<br>- 湲곗뾽泥대챸<br>- 寃吏꾩옄紐?br>- ??곸옄 援щ텇<br>- 鍮꾩슜泥?뎄</div>', "以묐났泥댄겕 寃쎄퀬")

                    return;
                }

                if (dxInstances.myself.option('value') === null) {
                    alert("??곸옄 援щ텇???좏깮?댁＜?몄슂.\n\n??以묐났 泥댄겕 ???꾩닔 ?낅젰?ы빆? ?꾨옒? 媛숈뒿?덈떎.\n1. 湲곗뾽泥대챸 / 2. 寃吏꾩옄紐?/ 3. ??곸옄 援щ텇 / 4. 鍮꾩슜泥?뎄\n\n??4媛쒕? 紐⑤몢 ?낅젰 ??[以묐났泥댄겕] 踰꾪듉???대┃?댁＜?몄슂.")
                    return;
                }

                if (dxInstances['employeeCheckup.supportType'].option('value') === null) {
                    alert("鍮꾩슜泥?뎄瑜??좏깮?섏꽭??n\n??以묐났 泥댄겕 ???꾩닔 ?낅젰?ы빆? ?꾨옒? 媛숈뒿?덈떎.\n1. 湲곗뾽泥대챸 / 2. 寃吏꾩옄紐?/ 3. ??곸옄 援щ텇 / 4. 鍮꾩슜泥?뎄\n\n??4媛쒕? 紐⑤몢 ?낅젰 ??[以묐났泥댄겕] 踰꾪듉???대┃?댁＜?몄슂.")
                    return;
                }

                if (dxInstances.employeeName.option('value') === '') {
                    alert("寃吏꾩옄紐낆쓣 ?낅젰?댁＜?몄슂.\n\n??以묐났 泥댄겕 ???꾩닔 ?낅젰?ы빆? ?꾨옒? 媛숈뒿?덈떎.\n1. 湲곗뾽泥대챸 / 2. 寃吏꾩옄紐?/ 3. ??곸옄 援щ텇 / 4. 鍮꾩슜泥?뎄\n\n??4媛쒕? 紐⑤몢 ?낅젰 ??[以묐났泥댄겕] 踰꾪듉???대┃?댁＜?몄슂.")
                    return;
                }

                if (dxInstances.employeeCode.option('value') === '') {
                    alert("ID瑜??낅젰?댁＜?몄슂.")
                    return;
                }

                $.ajax({
                    url: '<c:url value="/cm/employee/check"/>',
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
                        let con = confirm("?ъ슜?섏떎 ???덈뒗 ?꾩씠?붿엯?덈떎. ?ъ슜?섏떆寃좎뒿?덇퉴?");
                        if (con === true) {
                            dxInstances.check.option({value: '1'});
                        } else {
                            dxInstances.check.option({value: ''});
                        }
                    } else {
                        alert("以묐났???꾩씠?붽? 議댁옱?⑸땲??");
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
            text: '寃吏꾩떎???덈궡',
            value: false,
        });

        dxInstances['employeeCheckup.notokReserve'].option({
            text: '?덉빟 ?덈궡',
            value: false,
        });

        dxInstances['employeeCheckup.notokUrge'].option({
            text: '誘몄삁???낅젮 ?덈궡',
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
            placeholder: '?대??꾪솕 11?먮━',
        });

        dxInstances.zipcodeSearch.option({
            text: '二쇱냼李얘린',
            onClick: function () {
                execution_daum_address(dxInstances.zipcode, dxInstances.address1, dxInstances.address2);
            }
        });

        dxInstances.depart.option({
            placeholder: '遺??,
        });

        dxInstances.title.option({
            placeholder: '吏곸콉',
        });

        dxInstances['companyCheckupType.supportPay'].option({
            placeholder: '吏?먭툑??,
            readOnly: true,
        });

        dxInstances['companyCheckupType.copay'].option({
            placeholder: '蹂몄씤遺?댁븸',
            readOnly: true,
        });

        dxInstances.companyCheckupTypeName.option({
            placeholder: '寃吏꾩쑀?뺣챸',
            readOnly: true,
        });

        dxInstances['employeeCheckup.specialCheckup'].option({
            text: '?밴????,
            value: false,
        });

        // Save
        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '???,
            type: 'success',
            onClick: function () {
                let data = sitebuilder.dxToValues();

                data['companyCheckupType'] = null;
                data['lookupCompany'] = null;
                if (!data.employeeCheckup.checkupYear) {
                    alert('湲곗뾽泥대? ?좏깮?섏꽭??);
                    return;
                }

                if (!data.myself) {
                    alert('??곸옄 援щ텇???좏깮?섏꽭??);
                    return;
                }

                if (data.employeeCheckup.supportType === null) {
                    alert('鍮꾩슜泥?뎄瑜??좏깮?섏꽭??);
                    return;
                }

                if (!data.employeeName) {
                    alert('寃吏꾩옄紐낆쓣 ?낅젰?섏꽭??);
                    return;
                }

                if (!data.employeeCode) {
                    alert('ID瑜??낅젰?섏꽭??);
                    return;
                }

                if (!data.mobile) {
                    alert('?대??꾪솕 踰덊샇瑜??낅젰?섏꽭??);
                    return;
                }

                if (data.check === '') {
                    alert("以묐났泥댄겕瑜??댁＜?몄슂.")
                    return;
                }

                if (data.employeeCheckup.companyCheckupTypeId === null) {
                    alert("寃吏꾩쑀?뺤쓣 ?좏깮???댁＜?몄슂.")
                    return;
                }

                data.birth = new Date(dxInstances.birth.option('text'));

                $.ajax({
                    url: '<c:url value="/cm/employee"/>',
                    method: 'POST',
                    data: JSON.stringify(data),
                }).then(function () {
                    sitebuilder.notify("??λ릺?덉뒿?덈떎.");
                    location.href = '<c:url value="/cm/employee"/>';
                });
            },
        });

        // List
        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '紐⑸줉',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/cm/employee"/>';
            }
        });

        /* ?ㅼ쓬 二쇱냼 ?곕룞 */
        function execution_daum_address(zipcode, address1, address2) {
            new daum.Postcode({
                oncomplete: function (data) {
                    let extraAddr = '';

                    // 嫄대Ъ紐낆씠 ?덇퀬, 怨듬룞二쇳깮??寃쎌슦 異붽??쒕떎.
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        extraAddr = ' (' + extraAddr + ')';
                    }

                    // ?고렪踰덊샇? 二쇱냼 ?뺣낫瑜??대떦 ?꾨뱶???ｋ뒗??
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
        $.ajax({
            url: '<c:url value="/cm/company/0"/>',
            method: 'GET',
        }).then(function (response) {
            console.log(response, '?닿굅');
            dxInstances.companyId.option({
                items: [response.data],
                displayExpr: 'companyName',
                valueExpr: 'companyId',
                value: response.data.companyId,
                readOnly: true,
            });
            let dsCheckup = [response.data.companyCheckup];
            dxInstances['employeeCheckup.companyCheckupId'].option({
                items: [response.data.companyCheckup],
                displayExpr: 'checkupYear',
                valueExpr: 'companyCheckupId',
                value: dsCheckup[0].companyCheckupId,
                readOnly: true
            });
            dxInstances['employeeCheckup.companyCheckupTypeId'].option({
                items: response.data.companyCheckup.companyCheckupTypes,
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
    });
</script>
</html>
