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
                            <h3 class="h3">Î≥ëÏõê?±Î°ù</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- Î≥ëÏõê Í∏∞Î≥∏ ?ïÎ≥¥ -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Î≥ëÏõê Í∏∞Î≥∏ ?ïÎ≥¥
                                <div class="checkText right"><i class="xi-check-min"></i>?ÑÏàò?ÖÎ†• ??™©?ÖÎãà??</div>
                            </div>
                            <div class="row-box6">
                                <div class="row-box-inner1 logo-box">
                                    <div class="col-box1 col-box-vertical4 row logo-img">
                                        <div class="col-lg-12 center-box">
                                            <img id="ciUrl" src="" alt="Í∏∞ÏóÖÏ≤¥Î°úÍ≥?/>
                                        </div>
                                    </div>
                                    <div class="col-lg-6" id="ciFilename" style="display: none;"
                                         data-sitebuilder="dxTextBox"></div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-12 center-box">
                                            <div class="btnGray" id="btnAttach" data-sitebuilder="dxButton"></div>
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
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name check"><span>Î≥ëÏõêÎ™?/span></div>
                                                    <div class="col-lg-2">
                                                        <div class="btnBlue" id="popupBtn"
                                                             data-sitebuilder="dxButton"></div>
                                                    </div>
                                                    <div class="col-lg-5"><div id="hospitalName" data-sitebuilder="dxTextBox"></div></div>
                                                    <div id="popupHospital" data-sitebuilder="dxPopup"></div>
                                                </div>
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name check"><span>Î≥ëÏõêÏΩîÎìú</span></div>
                                                    <div class="col-lg-4"><div id="hospitalCode" data-sitebuilder="dxTextBox"></div></div>
                                                    <div class="col-lg-4"><div id="noUse" data-sitebuilder="dxCheckBox"></div></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name check"><span>?ºÌÑ∞Î™?/span></div>
                                                    <div class="col-lg-2">
                                                        <div class="btnBlue" id="popupCenterBtn"
                                                             data-sitebuilder="dxButton"></div>
                                                    </div>
                                                    <div class="col-lg-5">
                                                        <div id="centerName" data-sitebuilder="dxTextBox"></div>
                                                        <div id="popupCenter" data-sitebuilder="dxPopup"></div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name check"><span>?ºÌÑ∞ÏΩîÎìú</span></div>
                                                    <div class="col-lg-8" id="centerCode" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-2 tag-name"><span>?ÑÌôî</span></div>
                                                <div class="col-lg-4" id="telephone" data-sitebuilder="dxTextBox"
                                                     data-sitebuilder-format="tel"></div>
                                                <div class="col-lg-2 tag-name"><span>?àÌéò?¥Ï?</span></div>
                                                <div class="col-lg-4" id="homepage" data-sitebuilder="dxTextBox"></div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>?∞Ìé∏Î≤àÌò∏</span></div>
                                                    <div class="col-lg-2"><div id="zipcode" data-sitebuilder="dxTextBox"></div></div>
                                                    <div class="col-lg-10"><div class="btnGray" id="btnZip" data-sitebuilder="dxButton"></div></div>
                                                </div>
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>?ÑÏπò</span></div>
                                                    <div class="col-lg-8" id="locationDesc" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-2 tag-name"><span>Ï£ºÏÜå</span></div>
                                                <div class="col-lg-4" id="address1" data-sitebuilder="dxTextBox"></div>
                                                <div class="col-lg-2 tag-name"><span>?ÅÏÑ∏Ï£ºÏÜå</span></div>
                                                <div class="col-lg-4" id="address2" data-sitebuilder="dxTextBox"></div>
                                                <div id="sido" data-sitebuilder="dxTextBox" style="display: none;"></div>
                                                <div id="sigungu" data-sitebuilder="dxTextBox" style="display: none;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Î≥ëÏõê Í∏∞Î≥∏ ?ïÎ≥¥ -->

                        <!-- Í≤ÄÏß??∏Î? ?ïÎ≥¥ -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Í≤ÄÏß??∏Î? ?ïÎ≥¥</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>Î≥ëÏõêÍµ¨Î∂Ñ</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12"><div id="grade" data-sitebuilder="dxSelectBox"></div></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>Í≤ÄÏßÑÏ?ÎπÑÍ∏∞??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12"><div id="preday" data-sitebuilder="dxSelectBox"></div></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Î≥ëÏõê?úÏÑ§</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-3"><div id="ableCt" data-sitebuilder="dxCheckBox"></div></div>
                                            <div class="col-lg-3"><div id="ableMri" data-sitebuilder="dxCheckBox"></div></div>
                                            <div class="col-lg-3"><div id="ablePark" data-sitebuilder="dxCheckBox"></div></div>
                                            <div class="col-lg-3"><div id="ableSoup" data-sitebuilder="dxCheckBox"></div></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?∏Î??¨Ìï≠</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-4"><div id="ableSatur" data-sitebuilder="dxCheckBox"></div></div>
                                            <div class="col-lg-4"><div id="ableSpecial" data-sitebuilder="dxCheckBox"></div></div>
                                            <div class="col-lg-4"><div id="ableAm" data-sitebuilder="dxCheckBox"></div></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box3 row center-input">
                                        <div class="col-lg-3 tag-name check"><span>Í≤ÄÏßÑÏ†ë?òÍ∏∞Í∞?br>(?âÏùº ?§Ï†Ñ)</span></div>
                                        <div class="col-lg-9 row period">
                                            <div class="col-lg-6 center" id="receiptNormalBegin" data-sitebuilder="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6 center" id="receiptNormalEnd" data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box3 row">
                                        <div class="col-lg-3 tag-name check"><span>Í≤ÄÏßÑÏ†ë?òÍ∏∞Í∞?br>(?âÏùº ?§ÌõÑ)</span></div>
                                        <div class="col-lg-9 row period">
                                            <div class="col-lg-6 center" id="receiptNormalPmBegin"
                                                 data-sitebuilder="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6 center" id="receiptNormalPmEnd"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box3 row">
                                        <div class="col-lg-3 tag-name check"><span>Í≤ÄÏßÑÏ†ë?òÍ∏∞Í∞?br>(?†Ïöî??</span></div>
                                        <div class="col-lg-9 row period">
                                            <div class="col-lg-6 center" id="receiptSaturBegin"
                                                 data-sitebuilder="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6 center" id="receiptSaturEnd"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 col-box-vertical3 row">
                                        <div class="col-lg-1 tag-name"><span>Î≥ëÏõê ?πÏù¥?¨Ìï≠</span></div>
                                        <div class="col-lg-11 row period">
                                            <div id="notes" data-sitebuilder="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">

                                    <div class="col-box1 col-box-vertical5 row">
                                        <div class="col-lg-1 tag-name"><span>Î≥ëÏõê ?çÎ≥¥Í∏Ä</span></div>
                                        <div class="col-lg-11 row period">

                                                <div id="advertisement" data-sitebuilder="dxTextArea"></div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Í≤ÄÏß??∏Î? ?ïÎ≥¥ -->
                        <div class="col-lg-1 tag_name" style="display: none;" id="head" data-sitebuilder="dxCheckBox"></div>

                    </div>
                    <%--                    </div>--%>
                </div>

                <div class="row btn_area footer-btn">
                    <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>?Ä??/div>
                    <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">Î™©Î°ù</div>
                </div>

            </div>
        </div>


    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    /** @param _dxInstances : {centerCode,tbClass,btnZip,ct,mri,parking,dish,saturday,weekend,advertisement,popupBtn,popupCenterBtn,popupHospital,popupCenter} */
    $(function () {
        sitebuilder.openMenu('hospital');

        let ciForm = $('#ci');

        let ciImage = $('#ciUrl');
        ciImage.hide();

        let dxInstances = sitebuilder.createDx(false);
        let dsHospital = [];

        function previewImage(input, target) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();

                reader.onload = function (e) {
                    target.attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        dxInstances.popupBtn.option({
            text: "Î≥ëÏõêÎ™??±Î°ù",
            onClick: function () {
                dxInstances.popupHospital.show();
            }
        });

        dxInstances.hospitalName.option({
            readOnly: true
        });

        dxInstances.hospitalCode.option({
            readOnly: true
        });

        dxInstances.centerName.option({
            placeholder: "?ºÌÑ∞Í∞Ä ?ÜÎäî Í≤ΩÏö∞, Î≥ëÏõêÎ™ÖÏúºÎ°??ëÏÑ±?¥Ï£º?∏Ïöî",
            readOnly: true
        });

        dxInstances.centerCode.option({
            readOnly: true
        });

        dxInstances.popupCenterBtn.option({
            text: "?ºÌÑ∞Î™??±Î°ù",
            onClick: function () {
                dxInstances.popupCenter.show();
            }
        });

        dxInstances.head.option({
            value: false,
        });

        dxInstances.popupHospital.option({
            title: "Î≥ëÏõêÏΩîÎìú Î∞?Î≥ëÏõê?¥Î¶Ñ ?±Î°ù",
            closeOnOutsideClick: true,
            width: 800,
            height: 880,
            contentTemplate: function (contentElement) {
                return contentElement.append($('<div style="height: 75vh;"/>').dxDataGrid({
                    dataSource: dsHospital,
                    onToolbarPreparing: function (e) {
                        e.toolbarOptions.visible = true;
                    },
                    searchPanel: {visible: false},
                    editing: {
                        mode: "row",
                        allowAdding: true
                    },
                    export: {enabled: false},
                    stateStoring: {
                        enabled: false,
                    },
                    pager: {
                        visible: true,
                        allowedPageSizes: 'all',
                        showPageSizeSelector: false,
                        showInfo: true,
                        showNavigationButtons: false
                    },
                    paging: {
                        enabled: false
                    },
                    rowAlternationEnabled: true,
                    scrolling: {columnRenderingMode: "virtual"},
                    columns: [{
                        dataField: 'hospitalCode',
                        caption: 'Î≥ëÏõêÏΩîÎìú',
                    }, {
                        dataField: 'hospitalName',
                        caption: 'Î≥ëÏõê?¥Î¶Ñ',
                    }],
                    // valueExpr: 'centerId',
                    // displayExpr: function (item) {
                    //     return item && '[' + item.hospitalCode + ']' + ' // ' +  item.hospitalName;
                    // },
                    searchEnabled: true,
                    searchExpr: 'hospitalName',
                    searchMode: 'contains',
                    onSaving: function (e) {
                        for (let i = 0; i < dsHospital.length; i++) {
                            if (e.changes[0].data.hospitalCode === dsHospital[i].hospitalCode) {
                                alert("Î≥ëÏõêÏΩîÎìúÍ∞Ä Ï§ëÎ≥µ ?©Îãà??");
                                e.changes.pop();
                                return;
                            }
                        }

                        dxInstances.hospitalName.option({
                            value: e.changes[0].data.hospitalName,
                        })
                        dxInstances.hospitalCode.option({
                            value: e.changes[0].data.hospitalCode,
                        })
                        // dxInstances.centerName.option({
                        //     value:e.changes[0].data.hospitalName + '(Î≥∏Ï†ê)',
                        // })
                        // dxInstances.centerCode.option({
                        //     value:e.changes[0].data.hospitalCode,
                        // })
                        dxInstances.popupHospital.hide();
                    },
                }));
            },
        });

        dxInstances.popupCenter.option({
            title: "Î≥ëÏõêÏΩîÎìú Î∞?Î≥ëÏõê?¥Î¶Ñ ?±Î°ù",
            closeOnOutsideClick: true,
            width: 800,
            height: 880,
            contentTemplate: function (contentElement) {
                return contentElement.append($("<div />").dxDataGrid({
                    dataSource: [],
                    onToolbarPreparing: function (e) {
                        e.toolbarOptions.visible = true;
                    },
                    searchPanel: {visible: false},
                    editing: {
                        mode: "row",
                        allowAdding: true
                    },
                    export: {enabled: false},
                    stateStoring: {
                        enabled: false,
                    },
                    pager: {
                        visible: true,
                        allowedPageSizes: 'all',
                        showPageSizeSelector: false,
                        showInfo: true,
                        showNavigationButtons: false
                    },
                    paging: {
                        enabled: false
                    },
                    columns: [{
                        dataField: 'centerCode',
                        caption: '?ºÌÑ∞ÏΩîÎìú',
                    }, {
                        dataField: 'centerName',
                        caption: '?ºÌÑ∞?¥Î¶Ñ',
                    }],
                    searchEnabled: true,
                    searchExpr: 'centerName',
                    searchMode: 'contains',
                    onSaving: function (e) {

                        dxInstances.centerName.option({
                            value: e.changes[0].data.centerName,
                        });
                        dxInstances.centerCode.option({
                            value: e.changes[0].data.centerCode,
                        });
                        dxInstances.popupCenter.hide();
                    },
                }));
            },
        });

        dxInstances.homepage.option({
            placeholder: '?ëÏÑ±?àÏãú) http://www.sitebuilder.co.kr/ ?êÎäî https://www.sitebuilder.co.kr/'
        });

        dxInstances.btnZip.option({
            text: '?∞Ìé∏Î≤àÌò∏',
            onClick: function () {
                execution_daum_address(dxInstances.zipcode, dxInstances.sido, dxInstances.sigungu, dxInstances.address1, dxInstances.address2);
            }
        });

        dxInstances.zipcode.option({
            readOnly: true
        });

        dxInstances.address1.option({
            readOnly: true
        });

        // dxInstances.businessNo.option({
        //     mask: '000-00-00000',
        // });

        dxInstances.locationDesc.option({
            placeholder: '?ëÏÑ±?àÏãú) ?†ÎèÑÎ¶ºÏó≠ 1?∏ÏÑ† 5Î≤àÏ∂úÍµ?(?ÑÎ≥¥ 150M) // 2?∏ÏÑ† 1Î≤àÏ∂úÍµ?(?ÑÎ≥¥ 100M)'
        });

        dxInstances.grade.option({
            dataSource: [
                {'id': 0, 'text': 'Í≤ÄÏßÑÏÑº??},
                {'id': 1, 'text': 'Ï¢ÖÌï©Î≥ëÏõê'},
                {'id': 2, 'text': '?ÅÍ∏âÏ¢ÖÌï©Î≥ëÏõê'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.preday.option({
            dataSource: [
                {'id': 0, 'text': '0??},
                {'id': 3, 'text': '3??},
                {'id': 5, 'text': '5??},
                {'id': 7, 'text': '7??},
                {'id': 10, 'text': '10??},
                {'id': 14, 'text': '14??},
                {'id': 21, 'text': '21??},
                {'id': 30, 'text': '30??}
            ],
            valueExpr: 'id',
            displayExpr: 'text'
        });

        dxInstances.ableCt.option({
            value: false,
            text: 'CT'
        });
        dxInstances.ableMri.option({
            value: false,
            text: 'mri'
        });
        dxInstances.ablePark.option({
            value: false,
            text: 'Ï£ºÏ∞®Í∞Ä??
        });
        dxInstances.ableSoup.option({
            value: false,
            text: 'Ï£??ùÏÇ¨,Í∞ÑÏãù)?úÍ≥µ'
        });

        dxInstances.ableSatur.option({
            value: false,
            text: '?†ÏöîÍ≤ÄÏß?Í∞Ä??
        });
        dxInstances.ableSpecial.option({
            value: false,
            text: '?πÏàòÍ≤ÄÏß?Í∞Ä??
        });
        dxInstances.ableAm.option({
            value: false,
            text: '?§Ï†ÑÎß?Í∞Ä??
        });

        dxInstances.receiptNormalBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
            value: new Date('2021-01-01T07:00:00'),
        });

        dxInstances.receiptNormalEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
            value: new Date('2021-01-01T12:00:00'),
        });

        dxInstances.receiptNormalPmBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
            value: new Date('2021-01-01T14:00:00'),
        });

        dxInstances.receiptNormalPmEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
            value: new Date('2021-01-01T18:00:00'),
        });

        dxInstances.receiptSaturBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
            value: new Date('2021-01-01T07:00:00'),
        });

        dxInstances.receiptSaturEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
            value: new Date('2021-01-01T16:00:00'),
        });

        dxInstances.ciFilename.option({
            readOnly: true,
        });

        dxInstances.btnAttach.option({
            text: '?åÏùºÏ≤®Î?',
            onClick: function () {
                $('#ci').trigger('click');
            },
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

        dxInstances.noUse.option({
            value: false,
            text: '??Î≥ëÏõê???∏Ï∂ú??Ï§ëÏ??©Îãà??
        });

        dxInstances.notes.option({
            placeholder: 'ÏµúÎ? 200???ëÏÑ±'
        });

        dxInstances.advertisement.option({
            placeholder: 'ÏµúÎ? 1000???ëÏÑ±'
        });

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '?Ä??,
            type: 'success',
            onClick: function () {
                let data = sitebuilder.dxToValues();
                console.log(data);

                if (!data.hospitalName) {
                    alert('Î≥ëÏõêÎ™ÖÏùÑ ?ÖÎ†•?òÏÑ∏??);
                    return;
                }
                if (!data.hospitalCode) {
                    alert('Î≥ëÏõêÏΩîÎìúÎ•??ÖÎ†•?òÏÑ∏??);
                    return;
                }

                if (data.grade === null) {
                    alert('Î≥ëÏõêÍµ¨Î∂Ñ???†ÌÉù?òÏÑ∏??);
                    return;
                }
                if (data.preday === null) {
                    alert('Í≤ÄÏßÑÏ?ÎπÑÍ∏∞?úÏùÑ ?†ÌÉù?òÏÑ∏??);
                    return;
                }

                let formData = new FormData($('#formCi')[0]);
                formData.append('hospital', new Blob([JSON.stringify(data)], {
                    type: "application/json"
                }));

                $.ajax({
                    url: '<c:url value="/pm/hospital"/>',
                    method: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData,
                }).then(function () {
                    sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");
                    location.href = '<c:url value="/pm/hospital"/>';
                });
            }
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: 'Î™©Î°ù',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/pm/hospital"/>';
            }
        });

        /* ?§Ïùå Ï£ºÏÜå ?∞Îèô */
        function execution_daum_address(zipcode, sido, sigungu, address1, address2) {
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

                    sido.option({
                        value: data.sido,
                    });

                    sigungu.option({
                        value: data.sigungu,
                    });

                    address1.option({
                        value: data.address + ' ' + extraAddr,
                    });

                    address2.focus();
                }
            }).open();
        }

        // Load
        let ajaxHospitalList = {
            url: '<c:url value="/common/hospital"/>',
        };

        $.when($.ajax(ajaxHospitalList)).then(function (responseHospitalList) {
            dsHospital = responseHospitalList.data;
        });
    });
</script>
</html>
