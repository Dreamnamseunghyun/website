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
                            <h3 class="h3">Í∏∞ÏóÖ ?ÅÏÑ∏</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap row-wrap-box">
                            <!-- Í∏∞ÏóÖ Í∏∞Î≥∏ ?ïÎ≥¥ -->
                            <div class="row-wrap logo-area-left">
                                <div class="row-box-title"><i class="xi-play-circle"></i>Í∏∞ÏóÖ Í∏∞Î≥∏ ?ïÎ≥¥</div>

                                <div class="row-box6">
                                    <div class="row-box-inner1 logo-box">
                                        <div class="col-box1 col-box-vertical5 row logo-img">
                                            <div class="col-lg-12 center-box">
                                                <img id="ciUrl" src="" alt="Í∏∞ÏóÖÏ≤¥Î°úÍ≥?/>
                                            </div>
                                        </div>
                                        <div class="col-lg-6" id="ciFilename" style="display: none;"
                                             data-sitebuilder="dxTextBox"></div>
                                        <div class="col-box1 row">
                                            <div class="col-lg-12 center-box">
                                                <div class="col-lg-1 btnGray" id="btnAttach" data-sitebuilder="dxButton"></div>
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
                                                    <div class="col-lg-2 tag-name"><span>Í∏∞ÏóÖÏ≤¥Î™Ö</span></div>
                                                    <div class="col-lg-4" id="companyName" data-sitebuilder="dxTextBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>?Ä?ÅÎÖÑ??/span></div>
                                                    <div class="col-lg-4" id="companyCheckup.checkupYear"
                                                         data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>Í∏∞ÏóÖÏΩîÎìú</span></div>
                                                    <div class="col-lg-10" id="companyCode" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>ID ?ÖÎ†•Î¨∏Íµ¨</span></div>
                                                    <div class="col-lg-6">
                                                            <div class="width-info-wrap"><div id="idPlaceHolder" data-sitebuilder="dxRadioGroup"></div></div>
                                                    </div>
                                                    <div class="col-lg-4" id="idText" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>PW ?ÖÎ†•Î¨∏Íµ¨</span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="width-info-wrap"><div id="pwType" data-sitebuilder="dxRadioGroup"></div></div>

                                                    </div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row"
                                                     style="border-bottom:1px solid transparent;">
                                                    <div class="col-lg-12">
                                                        <div class="width-info-wrap">
                                                            <div id="noUse" data-sitebuilder="dxCheckBox"></div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-12">
                                                        <div class="width-info-wrap">
                                                            <div id="useNotiTalk" data-sitebuilder="dxCheckBox"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Í∏∞ÏóÖ Í∏∞Î≥∏ ?ïÎ≥¥ -->

                            <!-- Îß§Îãà?Ä ?ïÎ≥¥ -->
                            <div class="row-wrap logo-area-right">
                                <div class="row-box-title"><i class="xi-play-circle"></i>Îß§Îãà?Ä ?ïÎ≥¥</div>
                                <div class="row-box1">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row col-box-vertical6">
                                            <div class="col-lg-12 center-box button-box">
                                                <div id="btnPlatformManager" data-sitebuilder="dxButton"></div>
                                                <div id="btnCompanyManager" data-sitebuilder="dxButton"></div>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Îß§Îãà?Ä ?ïÎ≥¥ -->

                        <!-- ?¥Î? Í¥ÄÎ¶??ïÎ≥¥ -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>?¥Î? Í¥ÄÎ¶??ïÎ≥¥</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row center-input">
                                        <div class="col-lg-1 tag-name"><span>?àÏÉÅÎß§Ï∂ú</span></div>
                                        <div class="col-lg-11">
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag-name"><span>Ï¥??©ÏÇ∞</span></div>
                                                <div class="col-lg-8 center" id="total" data-sitebuilder="dxNumberBox"></div>
                                            </div>
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag-name"><span>Í≤ÄÏßÑÎπÑ</span></div>
                                                <div class="col-lg-8 center" id="companyCheckup.expectedTotalSupportPay"
                                                     data-sitebuilder="dxNumberBox"></div>
                                            </div>
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag-name"><span>?òÏàòÎ£?/span></div>
                                                <div class="col-lg-8 center"
                                                     id="companyCheckup.expectedTotalPlatformPay"
                                                     data-sitebuilder="dxNumberBox"></div>
                                            </div>
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag-name"><span>Í∏∞Ì?Îß§Ï∂ú</span></div>
                                                <div class="col-lg-8 center" id="companyCheckup.expectedTotalEtcPay"
                                                     data-sitebuilder="dxNumberBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-box1 row">
                                    <div class="col-box1 col-box-vertical3 row">
                                        <div class="col-lg-1 tag-name"><span>Í∏∞ÏóÖÏ≤??πÏù¥?¨Ìï≠</span></div>
                                        <div class="col-lg-11" id="companyCheckup.notes" data-sitebuilder="dxTextArea"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ?¥Î? Í¥ÄÎ¶??ïÎ≥¥ -->

                        <!-- Í≤ÄÏß??∏Î? ?ïÎ≥¥ -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Í≤ÄÏß??∏Î? ?ïÎ≥¥</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row">
                                        <div class="col-lg-1 tag-name"><span>?Ä?ÅÏù∏??/span></div>
                                        <div class="col-lg-11" id="companyCheckup.employeeNumber"
                                             data-sitebuilder="dxNumberBox"></div>
                                    </div>
                                </div><!--row-box-inner-->

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row center-input">
                                        <div class="col-lg-2 tag-name"><span>Í≤ÄÏß??§Ïãú Í∏∞Í∞Ñ</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6 center" id="companyCheckup.checkupDateBegin"
                                                 data-sitebuilder="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6 center" id="companyCheckup.checkupDateEnd"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?àÏïΩ Í∞Ä??Í∏∞Í∞Ñ</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6 center" id="companyCheckup.reserveDateBegin"
                                                 data-sitebuilder="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6 center" id="companyCheckup.reserveDateEnd"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Í≤ÄÏß??∏Î? ?ïÎ≥¥ -->
                        <%-- checkup type dataGrid --%>
                        <div class="row-wrap">

                            <div id="companyCheckup.companyCheckupTypes" class="sub_table"
                                 data-sitebuilder="dxDataGrid">
                            </div>
                        </div>

                    </div>
                    <%--</div>--%>

                    <div class="row btn_area footer-btn">
                        <div class="col-lg-1" id="btnEdit" data-sitebuilder="dxButton"><i class="xi-file-check"></i>?òÏ†ï
                        </div>
                        <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">Î™©Î°ù</div>
                        <div class="col-lg-1" id="btnDelete" data-sitebuilder="dxButton">??†ú</div>
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
        sitebuilder.openMenu('company');

        let dxInstances = sitebuilder.createDx(true);

        dxInstances.btnPlatformManager.option({
            text: 'Ï¥ùÍ¥Ñ Îß§Îãà?Ä',
            onClick: function () {
                location.href = '<c:url value="/pm/manager"/>';
            }
        });

        dxInstances.btnCompanyManager.option({
            text: 'Í∏∞ÏóÖ Îß§Îãà?Ä',
            onClick: function () {
                location.href = '<c:url value="/pm/manager"/>';
            }
        });

        dxInstances.total.option({
            format: "#,### ??
        });

        dxInstances['companyCheckup.expectedTotalSupportPay'].option({
            format: "#,### ??
        });

        dxInstances['companyCheckup.expectedTotalPlatformPay'].option({
            format: "#,### ??
        });

        dxInstances['companyCheckup.expectedTotalEtcPay'].option({
            format: "#,### ??
        });

        dxInstances['companyCheckup.employeeNumber'].option({
            format: "#,### Î™?
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
                {'id': '?¥Î??ÑÌôîÎ≤àÌò∏ (11?êÎ¶¨)', 'text': '?¥Î??ÑÌôî (11?êÎ¶¨)'},
                {'id': '?¨ÏõêÎ≤àÌò∏', 'text': '?¨ÏõêÎ≤àÌò∏'},
                {'id': '?ùÎÖÑ?îÏùº 8?êÎ¶¨', 'text': '?ùÎÖÑ?îÏùº 8?êÎ¶¨'},
                {'id': 'ETC', 'text': 'Í∏∞Ì? (15?êÏù¥??'}
            ],
            valueExpr: 'id',
            onValueChanged: function (e) {
                if (e.value === 'ETC') {
                    dxInstances.idText.focus();
                } else {
                    dxInstances.idText.option('value', '');
                }
            }
        });

        dxInstances.pwType.option({
            layout: "horizontal",
            items: [
                {'id': 0, 'text': '?¥Î??ÑÌôî (11?êÎ¶¨)'},
                {'id': 1, 'text': '?¨ÏõêÎ≤àÌò∏'},
                {'id': 2, 'text': '?ùÎÖÑ?îÏùº 8?êÎ¶¨'},
            ],
            valueExpr: 'id',
        });

        dxInstances['companyCheckup.companyCheckupTypes'].option({
            columns: [{
                dataField: 'companyCheckupTypeCode',
                caption: '?†Ìòï',
                alignment: 'center',
            }, {
                dataField: 'companyCheckupTypeName',
                caption: '?†ÌòïÎ™?,
                alignment: 'center',
            }, {
                dataField: 'supportPay',
                caption: 'ÏßÄ?êÍ∏à??,
                alignment: 'center',
                dataType: 'number'
            }, {
                dataField: 'hospitalPay',
                caption: 'Î≥ëÏõêÏ≤?µ¨??,
                alignment: 'center',
                dataType: 'number'
            }, {
                dataField: 'platformPay',
                caption: '?òÏàòÎ£?,
                alignment: 'center',
                dataType: 'number'
            }, {
                caption: 'Í≤ÄÏßÑÎ????§Ï†ï',
                columns: [{
                    dataField: 'typeSelf',
                    caption: 'Î≥∏Ïù∏',
                    dataType: 'boolean',
                }, {
                    dataField: 'typeFamily',
                    caption: 'Í∏∞ÏóÖÎ∂Ä?¥Í?Ï°?,
                    dataType: 'boolean',
                }, {
                    dataField: 'typeCopay',
                    caption: 'Î≥∏Ïù∏Î∂Ä?¥Í?Ï°?,
                    dataType: 'boolean',
                }],
            }],

            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    html: '<div class="row-box-title"><i class="xi-play-circle"></i>Í∏∞ÏóÖ Í≤ÄÏß??†Ìòï</div>',
                });
            },
            onCellPrepared: function (data) {
                if (data.rowType === 'header') {
                    data.cellElement.css('background', 'white');
                }
            }
        });

        dxInstances.noUse.option({
            text: 'Î°úÍ∑∏??Ï§ëÏ?',
        });

        dxInstances.useNotiTalk.option({
            text: '?àÏïΩ?ÖÎ†§ ?åÎ¶º???êÎèôÎ∞úÏÜ° (Í≤ÄÏß?ÎßàÍ∞ê 45???ÑÏóê ?êÎèô Î∞úÏÜ°(Ï£ºÎßê, Í≥µÌú¥???úÏô∏))',
        });

        dxInstances.btnAttach.option({
            disabled: true,
            text: '?åÏùºÏ≤®Î?',
            onClick: function () {
                ciForm.trigger('click');
            },
        });

        dxInstances.btnEdit.option({
            stylingMode: 'contained',
            text: '?òÏ†ï',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/company/${checkupYear}/${companyId}/edit"/>';
            }
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: 'Î™©Î°ù',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/pm/company"/>';
            }
        });

        dxInstances.btnDelete.option({
            stylingMode: "contained",
            text: "??†ú",
            type: "danger",
            onClick: function () {
                if (confirm('?ïÎßêÎ°???†ú?òÏãúÍ≤†Ïäµ?àÍπå?')) {
                    $.ajax({
                        url: '<c:url value="/company/${companyId}"/>',
                        method: 'DELETE',
                    }).then(function () {
                        location.href = '<c:url value="/pm/company"/>';
                    });
                }
            }
        });

        // Load
        $.ajax({
            url: '<c:url value="/pm/company/${checkupYear}/${companyId}"/>',
            method: 'GET',
        }).then(function (response) {
            sitebuilder.valuesToDx(response.data);

            let total = response.data.companyCheckup;
            dxInstances.total.option({
                value: total.expectedTotalSupportPay + total.expectedTotalPlatformPay + total.expectedTotalEtcPay
            });

            if (response.data.companyCheckup.companyCheckupTypes[0].companyCheckupTypeCode != null) {
                dxInstances['companyCheckup.companyCheckupTypes'].option({
                    dataSource: response.data.companyCheckup.companyCheckupTypes,
                });
            } else {
                dxInstances['companyCheckup.companyCheckupTypes'].option({
                    dataSource: [],
                });
            }

            if (response.data.idPlaceHolder !== '?¥Î??ÑÌôîÎ≤àÌò∏ (11?êÎ¶¨)' && response.data.idPlaceHolder !== '?¨ÏõêÎ≤àÌò∏' && response.data.idPlaceHolder !== '?ùÎÖÑ?îÏùº 8?êÎ¶¨') {
                dxInstances.idPlaceHolder.option('value', 'ETC');
                dxInstances.idText.option('value', response.data.idPlaceHolder);
            }

            if (response.data.ciUrl) {
                $('#ciUrl').attr('src', response.data.ciUrl).show();
            }
        });

    });
</script>
</html>

