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
                            <h3 class="h3">?덉빟?곸꽭?섏젙</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- ?뚯냽 湲곗뾽 -->
                        <div class="row-wrap">
                            <div class="row-box2">
                                <div class="col-box1 row">
                                    <div class="col-lg-2 tag-name"><span>?뚯냽 湲곗뾽</span></div>
                                    <div class="col-lg-10 row period">
                                        <div class="col-lg-12" id="companyState" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-box2">
                                <div class="col-box1 row">
                                    <div class="col-lg-2 tag-name"><span>蹂묒썝怨꾩빟留ㅻ땲?</span></div>
                                    <div class="col-lg-10 row period">
                                        <div class="col-lg-12" id="employeeCheckup.companyCheckupId"
                                             data-sitebuilder="dxSelectBox"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ?뚯냽 湲곗뾽 -->

                        <div class="row-wrap row-wrap-box">
                            <!-- ?덉빟 ?뺣낫 -->
                            <div class="row-wrap row-wrap2">
                                <div class="row-box-title"><i class="xi-play-circle"></i>?덉빟 ?뺣낫</div>
                                <div class="row-box1">
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?좎껌 蹂묒썝紐?/span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="hospitalCenterName"
                                                     data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>寃吏꾪씗留앹씪</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="desiredAt"
                                                     data-sitebuilder="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?덉빟?깅줉?쇱떆</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="registeredAt"
                                                     data-sitebuilder="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?덉빟?뺤젙??/span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-4" id="confirmedAt"
                                                     data-sitebuilder="dxDateBox"></div>
                                                <div class="col-lg-2" id="confirmedAmpm"
                                                     data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?섍??꾨즺??/span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-4" id="checkupedAt"
                                                     data-sitebuilder="dxDateBox"></div>
                                                <div class="col-lg-2" id="checkupedAmpm"
                                                     data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?덉빟?곹깭</span></div>
                                            <div class="col-lg-10 row period">
                                                <div id="reservationState"
                                                     data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ?덉빟 ?뺣낫 -->

                            <!-- 寃吏꾩옄 ?뺣낫 -->
                            <div class="row-wrap row-wrap2">
                                <div class="row-box-title"><i class="xi-play-circle"></i>寃吏꾩옄 ?뺣낫</div>
                                <div class="row-box1">
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>寃吏꾩옄紐?/span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="employeeName"
                                                     data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?앸뀈?붿씪 / ?깅퀎</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="birthSex" data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>愿怨?/span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="myselfFamily" data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?대??꾪솕踰덊샇</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="mobile"
                                                     data-sitebuilder="dxTextBox" data-sitebuilder-format="tel"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>?대찓??/span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="email"
                                                     data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-box-inner width-box">
                                        <div class="col-box1 row">
                                            <div class="col-lg-2 tag-name"><span>二쇱냼</span></div>
                                            <div class="col-lg-10 row period">
                                                <div class="col-lg-12" id="address" data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 寃吏꾩옄 ?뺣낫 -->
                        </div>

                        <!-- 湲곗뾽 諛?寃吏??뺣낫 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>湲곗뾽 諛?寃吏??뺣낫</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row center-input">
                                        <div class="col-lg-box3 row">
                                            <div class="col-lg-3 tag-name"><span>湲곗뾽泥대챸</span></div>
                                            <div class="col-lg-9" id="companyName" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                        <div class="col-lg-box3 row">
                                            <div class="col-lg-3 tag-name"><span>遺?쒕챸/吏곸콉</span></div>
                                            <div class="col-lg-4" id="departTitle" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                        <div class="col-lg-box3 row">
                                            <div class="col-lg-3 tag-name"><span>?ъ썝踰덊샇</span></div>
                                            <div class="col-lg-9" id="employeeNo"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-box1 row">
                                <div class="col-lg-1 tag-name"><span>寃吏꾩쑀??/span></div>
                                <div class="col-lg-11" id="checkupCodeName" data-sitebuilder="dxTextBox"></div>
                            </div>

                            <div class="col-box3 row">
                                <div class="col-box1 col-box-vertical3 row">
                                    <div class="col-lg-3 tag-name"><span>?좏깮寃??/span></div>
                                    <div class="col-lg-9" id="register" data-sitebuilder="dxTextArea"></div>
                                </div>
                            </div>
                            <div class="col-box3 row">
                                <div class="col-box1 col-box-vertical3 row">
                                    <div class="col-lg-3 tag-name"><span>異붽?寃??/span></div>
                                    <div class="col-lg-9" id="moreCheck" data-sitebuilder="dxTextArea"></div>
                                </div>
                            </div>
                            <div class="col-box3 row">
                                <div class="col-box1 col-box-vertical3 row">
                                    <div class="col-lg-3 tag-name"><span>?밴? ???臾쇱쭏</span></div>
                                    <div class="col-lg-9" id="specialCheckupText" data-sitebuilder="dxTextArea"></div>
                                </div>
                            </div>

                            <div class="col-box1 row">
                                <div class="col-lg-1 tag-name"><span>寃吏꾨퉬 泥?뎄</span></div>
                                <div class="col-lg-2" id="supportTypeMyself" data-sitebuilder="dxTextBox"></div>
                                <div class="col-lg-2" style="display: none;" id="supportType"
                                     data-sitebuilder="dxSelectBox"></div>
                                <div class="col-lg-2" style="display: none;" id="myself" data-sitebuilder="dxSelectBox"></div>
                            </div>


                            <div class="col-box1 row center-input">
                                <div class="col-lg-1 tag-name"><span>蹂몄씤遺??鍮꾩슜</span></div>
                                <div class="col-lg-11">
                                    <div class="col-lg-box4 row">
                                        <div class="col-lg-4 tag-name"><span>珥??⑹궛</span></div>
                                        <div class="col-lg-8" id="total" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-lg-box4 row">
                                        <div class="col-lg-4 tag-name"><span>寃吏꾨퉬</span></div>
                                        <div class="col-lg-8" id="hospitalPayComma"
                                             data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-lg-box4 row">
                                        <div class="col-lg-4 tag-name"><span>?좏삎 蹂寃?李⑥븸</span></div>
                                        <div class="col-lg-8" id="upgradePayComma"
                                             data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-lg-box4 row">
                                        <div class="col-lg-4 tag-name"><span>異붽?寃?щ퉬</span></div>
                                        <div class="col-lg-8" id="sumItemCopayComma" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 湲곗뾽 諛?寃吏??뺣낫 -->

                        <!-- 湲고? ?ы빆 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>湲고? ?ы빆</div>
                            <div class="row-box2">
                                <div class="row-box-inner1">
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>?뱀씠?ы빆</span></div>
                                        <div class="col-lg-10" id="notes" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>嫄닿컯?댁옄 硫붾え</span></div>
                                        <div class="col-lg-10" id="platformNotes" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>蹂묒썝 硫붾え</span></div>
                                        <div class="col-lg-10" id="hospitalNotes" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-box2">
                                <div class="row-box-inner1">
                                    <div class="col-box1 row">
                                        <div class="col-lg-2 tag-name"><span>怨좉컼 臾몄쓽?ы빆</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="employeeNotes" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box1 col-box-vertical2 row">
                                        <div class="col-lg-2 tag-name"><span>?덉빟 蹂대쪟,<br>痍⑥냼 ?ъ쑀</span></div>
                                        <div class="col-lg-10" id="stateNotes" data-sitebuilder="dxTextArea"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 湲고? ?ы빆 -->

                    </div><!-- viewport -->
                </div>

                <div class="row btn_area footer-btn">
                    <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-file-check"></i>???                    </div>
                    <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">紐⑸줉</div>
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
                {'id': 0, 'text': '?덉빟痍⑥냼'},
                {'id': 1, 'text': '?덉빟?좎껌'},
                {'id': 2, 'text': '?덉빟?뺤젙'},
                {'id': 3, 'text': '?덉빟蹂寃?},
                {'id': 4, 'text': '?섍??꾨즺'},
                {'id': 5, 'text': '?덉빟蹂대쪟'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
            readOnly: false,
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

        dxInstances.checkupedAt.option({
            applyValueMode: 'instantly',
            dataType: 'date',
            type: 'date',
            displayFormat: "yyyy-MM-dd",
            readOnly: false,
        });

        dxInstances.checkupedAmpm.option({
            items: [
                {'id': 'AM', 'text': 'AM'},
                {'id': 'PM', 'text': 'PM'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
            showAnalogClock: false,
            readOnly: false,
        });

        dxInstances.confirmedAt.option({
            applyValueMode: 'instantly',
            dataType: 'date',
            type: 'date',
            displayFormat: "yyyy-MM-dd",
            readOnly: false,
            onValueChanged: function (e) {
                if (e.event) {
                    if (e.event.type === 'dxclick' && dxInstances.confirmedAmpm.option('value') != null) {
                        dxInstances.reservationState.option({
                            value: 2,
                        });
                        // sitebuilder.notify("?덉빟?뺤젙?쇰줈 蹂寃쎈릺?덉뒿?덈떎.");
                    }
                }
            }
        });

        dxInstances.confirmedAmpm.option({
            items: [
                {'id': 'AM', 'text': 'AM'},
                {'id': 'PM', 'text': 'PM'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
            readOnly: false,
            onValueChanged: function (e) {
                if (e.event) {
                    if (e.event.type === 'dxclick' && dxInstances.confirmedAt.option('value') != null) {
                        dxInstances.reservationState.option({
                            value: 2,
                        });
                        // sitebuilder.notify("?덉빟?뺤젙?쇰줈 蹂寃쎈릺?덉뒿?덈떎.");
                    }
                }
            }
        });

        dxInstances.supportType.option({
            items: [
                {'id': false, 'text': '湲곗뾽遺??},
                {'id': true, 'text': '蹂몄씤遺??},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.myself.option({
            items: [
                {'id': null, 'text': '媛議?},
                {'id': 1, 'text': '蹂몄씤'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.platformNotes.option({
            readOnly: false,
        });

        dxInstances.hospitalNotes.option({
            readOnly: false,
        });

        dxInstances.stateNotes.option({
            readOnly: false,
        });

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            type: 'success',
            onClick: function () {
                let data = sitebuilder.dxToValues();

                if ((data.reservationState === 0 || data.reservationState === 5) && !data.stateNotes) {
                    alert('?덉빟 蹂대쪟 ?먮뒗 痍⑥냼 ?ъ쑀瑜??낅젰?섏꽭??');
                    return;
                }

                if ((data.confirmedAt && !data.confirmedAmpm) || (!data.confirmedAt && data.confirmedAmpm)) {
                    alert('?덉빟?뺤젙?쇱쓣 ?낅젰?섏꽭??');
                    return;
                }

                if (data.reservationState === 2 && (!data.confirmedAt || !data.confirmedAmpm)) {
                    alert('?덉빟?뺤젙?쇱쓣 ?낅젰?섏꽭??');
                    return;
                }

                if ((data.checkupedAt && !data.checkupedAmpm) || (!data.checkupedAt && data.checkupedAmpm)) {
                    alert('?섍??꾨즺?쇱쓣 ?낅젰?섏꽭??');
                    return;
                }

                if (data.reservationState === 4 && (!data.checkupedAt || !data.checkupedAmpm)) {
                    alert('?섍??꾨즺?쇱쓣 ?낅젰?섏꽭??');
                    return;
                }
                delete data.reserveItems;
                console.log(JSON.stringify(data));
                $.ajax({
                    url: '<c:url value="/hm/reserve/notes"/>',
                    method: 'PUT',
                    data: JSON.stringify(data)
                }).then(function () {
                    sitebuilder.notify("??λ릺?덉뒿?덈떎.");
                    location.href = '<c:url value="/hm/reserve/view/${reservationId}"/>';
                });
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
                    return dxInstances.companyName.option('value') + " | " + " (寃吏꾧린媛? "
                        + new Date(dxInstances.checkupDateBegin).toISOString().substring(0, 10) + " ~ "
                        + new Date(dxInstances.checkupDateEnd).toISOString().substring(0, 10) + " | " + " (?덉빟湲곌컙) "
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
                        return '蹂몄씤';
                    } else {
                        return '(' + dxInstances.familyName + ') ?섏쓽 媛議?;
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
                    return (dxInstances.specialCheckup === 0 ? '?대떦?놁쓬' : '?밴????) + '\n' + dxInstances.specialCheckupMemo;
                }
            });

            dxInstances.supportTypeMyself.option({
                value: function () {
                    return (dxInstances.supportType.option('value') === true ? '蹂몄씤遺?? : '湲곗뾽遺?? + ' / ' + sitebuilder.numberWithCommas(dxInstances.hospitalPay) + " ??);
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
