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
                            <h3 class="h3">Í∏∞ÏóÖ ?±Î°ù</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- Í∏∞ÏóÖ Í∏∞Î≥∏ ?ïÎ≥¥ -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap logo-area-left">
                                <div class="row-box-title"><i class="xi-play-circle"></i>Í∏∞ÏóÖ Í∏∞Î≥∏ ?ïÎ≥¥
                                    <div class="checkText right"><i class="xi-check-min"></i>?ÑÏàò?ÖÎ†• ??™©?ÖÎãà??</div>
                                </div>
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
                                                    <div class="col-lg-2 tag-name check"><span>Í∏∞ÏóÖÏ≤¥Î™Ö</span></div>
                                                    <div class="col-lg-4" id="companyName" data-sitebuilder="dxTextBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>?Ä?ÅÎÖÑ??/span></div>
                                                    <div class="col-lg-4" id="companyCheckup.checkupYear"
                                                         data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name check"><span>Í∏∞ÏóÖÏΩîÎìú</span></div>
                                                    <div class="col-lg-8" id="companyCode" data-sitebuilder="dxTextBox"></div>
                                                    <div class="col-lg-2" id="btnCompanySearch" data-sitebuilder="dxButton">

                                                    </div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>ID ?ÖÎ†•Î¨∏Íµ¨</span></div>
                                                    <div class="col-lg-6">
                                                        <div class="width-info-wrap">
                                                            <div id="idPlaceHolder" data-sitebuilder="dxRadioGroup"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4" id="idText" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>PW ?ÖÎ†•Î¨∏Íµ¨</span>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="width-info-wrap">
                                                            <div id="pwType" data-sitebuilder="dxRadioGroup"></div>
                                                        </div>
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
                        <%--                        <div class="card-title">--%>
                        <%--                            <div class="row">--%>
                        <%--                                <h3 style="margin-left:15px;"><i class="xi-play-circle"></i></h3><h3 class="h3" style="margin-left: 5px;"> ?∞ÎèÑÎ≥?Í≤ÄÏß??∏Î? ?ïÎ≥¥</h3>--%>
                        <%--                                <div class="card-title-select">--%>
                        <%--                                    <div class="tag-name"><span>?Ä?ÅÎÖÑ??/span></div>--%>
                        <%--                                    <div id="companyCheckup.checkupYear" data-sitebuilder="dxTextBox"></div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <!-- ?¥Î? Í¥ÄÎ¶??ïÎ≥¥ -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>?¥Î? Í¥ÄÎ¶??ïÎ≥¥</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row">
                                        <div class="col-lg-1 tag-name"><span>?àÏÉÅÎß§Ï∂ú</span></div>
                                        <div class="col-lg-11">
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag-name"><span>Ï¥??©ÏÇ∞</span></div>
                                                <div class="col-lg-8" id="total" data-sitebuilder="dxNumberBox"></div>
                                            </div>
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag-name"><span>Í≤ÄÏßÑÎπÑ</span></div>
                                                <div class="col-lg-8" id="companyCheckup.expectedTotalSupportPay"
                                                     data-sitebuilder="dxNumberBox"></div>
                                            </div>
                                            <div class="col-lg-box4 row">
                                                <div class="col-lg-4 tag-name"><span>?òÏàòÎ£?/span></div>
                                                <div class="col-lg-8" id="companyCheckup.expectedTotalPlatformPay"
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
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Í≤ÄÏß??§Ïãú Í∏∞Í∞Ñ</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6" id="companyCheckup.checkupDateBegin"
                                                 data-sitebuilder="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6" id="companyCheckup.checkupDateEnd"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?àÏïΩ Í∞Ä??Í∏∞Í∞Ñ</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6" id="companyCheckup.reserveDateBegin"
                                                 data-sitebuilder="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6" id="companyCheckup.reserveDateEnd"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Í≤ÄÏß??∏Î? ?ïÎ≥¥ -->

                        <%-- checkup type dataGrid --%>


                        <div class="row-wrap">

                            <div id="dataGridCheckupType" class="sub_table"
                                 data-sitebuilder="dxDataGrid">
                            </div>
                        </div>

                    <%--                    </div>--%>
                </div>
                <div class="row btn_area footer-btn">
                    <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>?Ä??/div>
                    <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">Î™©Î°ù</div>
                    <div class="col-lg-1" id="check" style="display: none" data-sitebuilder="dxTextBox"></div>
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

        let ciForm = $('#ci');

        let ciImage = $('#ciUrl');
        ciImage.hide();

        let dxInstances = sitebuilder.createDx(false);

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
            text: 'Ï§ëÎ≥µÏ≤¥ÌÅ¨',
            onClick: function () {
                if (dxInstances.companyCode.option('value') === '') {
                    alert("Í∏∞ÏóÖÏΩîÎìúÎ•??ÖÎ†•?¥Ï£º?∏Ïöî.");
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
                        let con = confirm("?¨Ïö©?òÏã§ ???àÎäî Í∏∞ÏóÖÏΩîÎìú ?ÖÎãà?? ?¨Ïö©?òÏãúÍ≤†Ïäµ?àÍπå?");
                        if (con === true) {
                            dxInstances.check.option({value: '1'});
                        } else {
                            dxInstances.check.option({value: ''});
                        }
                    } else {
                        alert("Ï§ëÎ≥µ??Í∏∞ÏóÖÏΩîÎìúÍ∞Ä Ï°¥Ïû¨?©Îãà??");
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

        dxInstances.btnPlatformManager.option({
            text: 'Ï¥ùÍ¥Ñ Îß§Îãà?Ä',
        });

        dxInstances.btnCompanyManager.option({
            text: 'Í∏∞ÏóÖ Îß§Îãà?Ä',
        });

        dxInstances['companyCheckup.checkupYear'].option({
            dataSource: checkupYear,
            value: year
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

        // dxInstances.businessNo.option({
        //     mask: '000-00-00000',
        // });

        dxInstances['companyCheckup.checkupDateBegin'].option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            onValueChanged: function (e) {
                dxInstances['companyCheckup.checkupDateEnd'].option("min", e.value);
            },
        });

        dxInstances['companyCheckup.checkupDateEnd'].option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            onValueChanged: function (e) {
                dxInstances['companyCheckup.checkupDateBegin'].option("max", e.value);
                dxInstances['companyCheckup.reserveDateBegin'].option("max", e.value);
                dxInstances['companyCheckup.reserveDateEnd'].option("max", e.value);

            },
        });

        dxInstances['companyCheckup.reserveDateBegin'].option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            onValueChanged: function (e) {
                dxInstances['companyCheckup.reserveDateEnd'].option("min", e.value);
            },
        });

        dxInstances['companyCheckup.reserveDateEnd'].option({
            applyValueMode: 'instantly',
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
            value: '?¥Î??ÑÌôîÎ≤àÌò∏ (11?êÎ¶¨)',
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

        dxInstances.idText.option({
            disabled: true,
        });

        dxInstances.pwType.option({
            layout: "horizontal",
            items: [
                {'id': 0, 'text': '?¥Î??ÑÌôî (11?êÎ¶¨)'},
                {'id': 1, 'text': '?¨ÏõêÎ≤àÌò∏'},
                {'id': 2, 'text': '?ùÎÖÑ?îÏùº 8?êÎ¶¨'},
            ],
            valueExpr: 'id',
            value: 0,
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
                caption: '?†Ìòï',
            }, {
                dataField: 'companyCheckupTypeName',
                caption: '?†ÌòïÎ™?,
            }, {
                dataField: 'supportPay',
                caption: 'ÏßÄ?êÍ∏à??,
                dataType: 'number'
            }, {
                dataField: 'copay',
                caption: 'Î≥∏Ïù∏Î∂Ä?¥Ïï°',
                dataType: 'number'
            }, {
                dataField: 'hospitalPay',
                caption: 'Î≥ëÏõêÏ≤?µ¨??,
                dataType: 'number'
            }, {
                dataField: 'platformPay',
                caption: '?òÏàòÎ£?,
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
            }
        });

        dxInstances.dataGridCheckupType.cancelEditData();

        dxInstances.noUse.option({
            text: 'Î°úÍ∑∏??Ï§ëÏ?',
        });

        dxInstances.useNotiTalk.option({
            text: '?àÏïΩ?ÖÎ†§ ?åÎ¶º???êÎèôÎ∞úÏÜ° (Í≤ÄÏß?ÎßàÍ∞ê 45???ÑÏóê ?êÎèô Î∞úÏÜ°(Ï£ºÎßê, Í≥µÌú¥???úÏô∏))',
        });

        dxInstances.btnAttach.option({
            text: '?åÏùºÏ≤®Î?',
            onClick: function () {
                ciForm.trigger('click');
            },
        });

        dxInstances.ciFilename.option({
            readOnly: true,
        });

        // dxInstances.accountUser.option({
        //     valueExpr: 'userId',
        //     displayExpr: 'platformManagerName',
        // });
        // dxInstances.salesUser.option({
        //     valueExpr: 'userId',
        //     displayExpr: 'platformManagerName',
        // });
        // dxInstances.adminUser.option({
        //     valueExpr: 'userId',
        //     displayExpr: 'platformManagerName',
        // });

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
            text: 'Î™©Î°ù',
            onClick: function () {
                location.href = '<c:url value="/pm/company"/>';
            }
        });

        // Save
        dxInstances.btnSave.option({
            stylingMode: "contained",
            text: "?Ä??,
            type: "success",
            onClick: function () {
                let data = sitebuilder.dxToValues();
                let gridData = dxInstances.dataGridCheckupType.option('editing.changes').map(function (v) {
                    v.data._crudType = v.type.toUpperCase();
                    return v.data;
                });

                if (!data.companyName) {
                    alert('Í∏∞ÏóÖÏ≤¥Î™Ö???ÖÎ†•?¥Ï£º?∏Ïöî.');
                    return;
                }
                if (!data.companyCode) {
                    alert('Í∏∞ÏóÖÏ≤¥ÏΩî?úÎ? ?ÖÎ†•?¥Ï£º?∏Ïöî.');
                    return;
                }

                if (data.check === '') {
                    alert("Ï§ëÎ≥µÏ≤¥ÌÅ¨Î•??¥Ï£º?∏Ïöî.");
                    return;
                }

                if (gridData.length === 0 || !gridData[0].companyCheckupTypeCode) {
                    alert("Í∏∞ÏóÖ Í≤ÄÏß??†Ìòï???ÖÎ†•?¥Ï£º?∏Ïöî.");
                    return;
                }

                if (!gridData[0].companyCheckupTypeName) {
                    alert("Í∏∞ÏóÖ Í≤ÄÏß??†ÌòïÎ™ÖÏùÑ ?ÖÎ†•?¥Ï£º?∏Ïöî.");
                    return;
                }

                if (!gridData[0].supportPay) {
                    alert("Í∏∞ÏóÖ Í≤ÄÏß?ÏßÄ?êÍ∏à?°ÏùÑ ?ÖÎ†•?¥Ï£º?∏Ïöî.");
                    return;
                }

                // if (!data.businessNo) {
                //     alert('?¨ÏóÖ?êÎ≤à?∏Î? ?ÖÎ†•?òÏÑ∏??);
                //     return;
                // }

                if (data.idPlaceHolder === 'ETC') {
                    data.idPlaceHolder = dxInstances.idText.option('value');
                }

                data.companyCheckup.checkupDateBegin = new Date(dxInstances['companyCheckup.checkupDateBegin'].option('text'));
                data.companyCheckup.checkupDateEnd = new Date(dxInstances['companyCheckup.checkupDateEnd'].option('text'));
                data.companyCheckup.reserveDateBegin = new Date(dxInstances['companyCheckup.reserveDateBegin'].option('text'));
                data.companyCheckup.reserveDateEnd = new Date(dxInstances['companyCheckup.reserveDateEnd'].option('text'));

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
                    sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");
                    location.href = '<c:url value="/pm/company"/>';
                });
            }
        });

        <%--$.ajax({--%>
        <%--    url: '<c:url value="/pm/salesmanager"/>',--%>
        <%--    method: 'GET',--%>
        <%--}).then(function (response) {--%>
        <%--    console.log(response);--%>
        <%--    dxInstances['companyCheckup.salesManager'].option({--%>
        <%--        items: response.data,--%>
        <%--        valueExpr: 'salesManager',--%>
        <%--        displayExpr: 'salesManager',--%>
        <%--    });--%>
        <%--});--%>
        <%--$.ajax({--%>
        <%--    url: '<c:url value="/pm/assistmanager"/>',--%>
        <%--    method: 'GET',--%>
        <%--}).then(function (response) {--%>
        <%--    dxInstances['companyCheckup.assistManager'].option({--%>
        <%--        items: response.data,--%>
        <%--        valueExpr: 'assistManager',--%>
        <%--        displayExpr: 'assistManager',--%>
        <%--    });--%>
        <%--});--%>

        // selectPlatformManagerList Load
        <%--$.ajax({--%>
        <%--    url: '<c:url value="/pm/platformmanagerlist"/>',--%>
        <%--    method: 'GET',--%>
        <%--}).then(function (response) {--%>
        <%--    console.log(response);--%>
        <%--    dxInstances.accountUser.option({--%>
        <%--        items: response.data,--%>
        <%--    });--%>
        <%--    dxInstances.salesUser.option({--%>
        <%--        items: response.data,--%>
        <%--    });--%>
        <%--    dxInstances.adminUser.option({--%>
        <%--        items: response.data,--%>
        <%--    });--%>
        <%--});--%>
    });



</script>

</html>


