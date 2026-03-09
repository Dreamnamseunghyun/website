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
                            <h3 class="h3">Î≥ëÏõê ?ÅÏÑ∏ ?òÏ†ï</h3>
                        </div>
                        <div class="tabs-container" id="tabs" data-sitebuilder="dxTabs"></div>
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
                                    <div class="col-lg-12 center" style="display: none;" id="ciFilename"
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
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name check"><span>Î≥ëÏõêÎ™?/span></div>
                                                    <div class="col-lg-8"><div id="hospitalName" data-sitebuilder="dxTextBox"></div></div>
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
                                                    <div class="col-lg-8"><div id="centerName" data-sitebuilder="dxTextBox"></div></div>
                                                    <div id="popupCenter" data-sitebuilder="dxPopup"></div>
                                                </div>
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name check"><span>?ºÌÑ∞ÏΩîÎìú</span></div>
                                                    <div class="col-lg-8"><div id="centerCode" data-sitebuilder="dxTextBox"></div></div>
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
                                                    <div class="col-lg-10"><div class="btnGray" id="btnZip"
                                                                                data-sitebuilder="dxButton"></div></div>
                                                </div>
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>?ÑÏπò</span></div>
                                                    <div class="col-lg-8"><div id="locationDesc" data-sitebuilder="dxTextBox"></div></div>
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
                                            <div class="col-lg-3" id="ableCt" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-3" id="ableMri" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-3" id="ablePark" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-3" id="ableSoup" data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?∏Î??¨Ìï≠</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-4" id="ableSatur" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-4" id="ableSpecial" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-4" id="ableAm" data-sitebuilder="dxCheckBox"></div>
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

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>?Ä??/div>
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">Î™©Î°ù</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-1" id="popupContainer" data-sitebuilder="dxPopup"></div>
                        </div>
                    </div>
                    <%--                    </div>--%>
                </div>
            </div>
        </div>


    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    /** @param _dxInstances : {btnCenter} */
    $(function () {
        sitebuilder.openMenu('hospital');

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

        dxInstances.tabs.option({
            hoverStateEnabled: true,
            displayExpr: "centerList",
            keyExpr: "centerId",
            onItemClick: function (e) {
                let center = e.itemData.centerId;
                location.href = '<c:url value="/pm/center"/>/' + center + '/edit';
            }
        });

        dxInstances.hospitalCode.option({
            readOnly: true
        });

        dxInstances.centerCode.option({
            readOnly: true
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

        dxInstances.grade.option({
            dataSource: [
                {'id': 0, 'text': 'Í≤ÄÏßÑÏÑº??},
                {'id': 1, 'text': 'Ï¢ÖÌï©Î≥ëÏõê'},
                {'id': 2, 'text': '?ÅÍ∏âÏ¢ÖÌï©Î≥ëÏõê'},
            ],
            valueExpr: 'id',
            displayExpr: 'text'
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
        });

        dxInstances.receiptNormalEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
        });

        dxInstances.receiptNormalPmBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
        });

        dxInstances.receiptNormalPmEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
        });

        dxInstances.receiptSaturBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
        });

        dxInstances.receiptSaturEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
        });

        // dxInstances.ciFilename.option({
        //     readOnly: true,
        // });

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
            text: 'Î≥ëÏõê(?ºÌÑ∞) ?∏Ï∂ú Ï§ëÏ?'
        });

        dxInstances.notes.option({
            placeholder: 'ÏµúÎ? 200???ëÏÑ±'
        });

        dxInstances.advertisement.option({
            height: '150px',
            placeholder: 'ÏµúÎ? 1000???ëÏÑ±'
        });

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            type: 'success',
            onClick: function () {
                let data = sitebuilder.dxToValues();

                let formData = new FormData($('#formCi')[0]);
                formData.append('hospital', new Blob([JSON.stringify(data)], {
                    type: "application/json"
                }));

                $.ajax({
                    url: '<c:url value="/pm/center/${centerId}/0"/>',
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
            onClick: function () {
                location.href = '<c:url value="/pm/hospital"/>';
            }
        });

        // Load
        $.ajax({
            url: '<c:url value="/pm/center/${centerId}"/>',
            method: 'GET',
        }).then(function (response) {
            // console.log(response);

            sitebuilder.valuesToDx(response.data);

            if (response.data.ciUrl) {
                $('#ciUrl').attr('src', response.data.ciUrl).show();
            }

            $.ajax({
                url: '<c:url value="/pm/tabs"/>',
                method: 'GET',
                data: {
                    hospitalId: response.data.hospitalId,
                    centerId: response.data.centerId,
                },
                success: function (responseTabs) {
                    if (responseTabs.data.length > 1) {
                        let idx = responseTabs.data.findIndex(function (element) {
                            return response.data.centerId === element.centerId;
                        });

                        if (idx >= 0) {
                            dxInstances.tabs.option({
                                items: responseTabs.data,
                                selectedIndex: idx,
                            });
                        }
                    } else {
                        dxInstances.tabs.option({
                            visible: false,
                        });
                    }
                }
            });
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
    });
</script>
</html>
