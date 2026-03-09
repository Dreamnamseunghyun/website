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
                              <h3 class="h3">?쇳꽣 ?곸꽭 ?섏젙</h3>
                        </div>
                        <div class="tabs-container" id="tabs" data-sitebuilder="dxTabs"></div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- 蹂묒썝 湲곕낯 ?뺣낫 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>蹂묒썝 湲곕낯 ?뺣낫</div>
                            <div class="row-box6">
                                <div class="row-box-inner1 logo-box">
                                    <div class="col-box1 col-box-vertical4 row logo-img">
                                        <div class="col-lg-12 center-box">
                                            <img id="ciUrl" src="" alt="湲곗뾽泥대줈怨?/>
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
                                                    <div class="col-lg-4 tag-name"><span>?쇳꽣紐?/span></div>
                                                    <div class="col-lg-8"><div id="hospitalName" data-sitebuilder="dxTextBox"></div></div>
                                                    <div id="popupHospital" data-sitebuilder="dxPopup"></div>
                                                </div>

                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>蹂묒썝肄붾뱶</span></div>
                                                    <div class="col-lg-4" id="hospitalCode" data-sitebuilder="dxTextBox"></div>
                                                    <div class="col-lg-4" id="noUse" data-sitebuilder="dxCheckBox"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>?쇳꽣紐?/span></div>
                                                    <div class="col-lg-8" id="centerName" data-sitebuilder="dxTextBox"></div>
                                                    <div id="popupCenter" data-sitebuilder="dxPopup"></div>
                                                </div>
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>?쇳꽣肄붾뱶</span></div>
                                                    <div class="col-lg-8" id="centerCode" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-2 tag-name"><span>?꾪솕</span></div>
                                                <div class="col-lg-4" id="telephone" data-sitebuilder="dxTextBox"
                                                     data-sitebuilder-format="tel"></div>
                                                <div class="col-lg-2 tag-name"><span>?덊럹?댁?</span></div>
                                                <div class="col-lg-4" id="homepage" data-sitebuilder="dxTextBox"></div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>?고렪踰덊샇</span></div>
                                                    <div class="col-lg-2"><div id="zipcode" data-sitebuilder="dxTextBox"></div></div>
                                                    <div class="col-lg-10"><div class="btnGray" id="btnZip"
                                                                                data-sitebuilder="dxButton"></div></div>
                                                </div>
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>?꾩튂</span></div>
                                                    <div class="col-lg-8" id="locationDesc" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-2 tag-name"><span>二쇱냼</span></div>
                                                <div class="col-lg-4" id="address1" data-sitebuilder="dxTextBox"></div>
                                                <div class="col-lg-2 tag-name"><span>?곸꽭二쇱냼</span></div>
                                                <div class="col-lg-4" id="address2" data-sitebuilder="dxTextBox"></div>
                                                <div id="sido" data-sitebuilder="dxTextBox" style="display: none;"></div>
                                                <div id="sigungu" data-sitebuilder="dxTextBox" style="display: none;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 蹂묒썝 湲곕낯 ?뺣낫 -->

                        <!-- 寃吏??몃? ?뺣낫 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>寃吏??몃? ?뺣낫</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>蹂묒썝援щ텇</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="grade" data-sitebuilder="dxSelectBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>寃吏꾩?鍮꾧린??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="preday" data-sitebuilder="dxSelectBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>蹂묒썝?쒖꽕</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-3" id="ableCt" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-3" id="ableMri" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-3" id="ablePark" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-3" id="ableSoup" data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?몃??ы빆</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-4" id="ableSatur" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-4" id="ableSpecial" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-4" id="ableAm" data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row center-input">
                                        <div class="col-lg-2 tag-name"><span>寃吏꾩젒?섍린媛??됱씪)</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6 center" id="receiptNormalBegin"
                                                 data-sitebuilder="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6 center" id="receiptNormalEnd"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>寃吏꾩젒?섍린媛??좎슂??</span></div>
                                        <div class="col-lg-10 row period">
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
                                        <div class="col-lg-1 tag-name"><span>蹂묒썝 ?뱀씠?ы빆</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="notes" data-sitebuilder="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">

                                    <div class="col-box1 col-box-vertical5 row">
                                        <div class="col-lg-1 tag-name"><span>蹂묒썝 ?띾낫湲</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="advertisement" data-sitebuilder="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 寃吏??몃? ?뺣낫 -->

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>???/div>
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">紐⑸줉</div>
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
            valueExpr: "centerList",
            onItemClick: function (e) {
                let center = e.itemData.centerId;
                location.href = '<c:url value="/hm/center"/>/' + center + '/edit';
            }
        });

        dxInstances.homepage.option({
            placeholder: '?묒꽦?덉떆) http://www.sitebuilder.co.kr/ ?먮뒗 https://www.sitebuilder.co.kr/'
        });

        dxInstances.btnZip.option({
            text: '?고렪踰덊샇',
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
                {'id': 0, 'text': '寃吏꾩꽱??},
                {'id': 1, 'text': '醫낇빀蹂묒썝'},
                {'id': 2, 'text': '?곴툒醫낇빀蹂묒썝'},
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
            text: '二쇱감媛??
        });
        dxInstances.ableSoup.option({
            value: false,
            text: '二??앹궗,媛꾩떇)?쒓났'
        });

        dxInstances.ableSatur.option({
            value: false,
            text: '?좎슂寃吏?媛??
        });
        dxInstances.ableSpecial.option({
            value: false,
            text: '?뱀닔寃吏?媛??
        });
        dxInstances.ableAm.option({
            value: false,
            text: '?ㅼ쟾留?媛??
        });

        dxInstances.receiptNormalBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
        });

        dxInstances.receiptNormalEnd.option({
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
            text: '?뚯씪泥⑤?',
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
            text: '??蹂묒썝???몄텧??以묒??⑸땲??
        });

        dxInstances.notes.option({
            placeholder: '理쒕? 200???묒꽦'
        });

        dxInstances.advertisement.option({
            height: '150px',
            placeholder: '理쒕? 1000???묒꽦'
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
                    url: '<c:url value="/hm/center/${centerId}/0"/>',
                    method: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData,
                }).then(function () {
                    sitebuilder.notify("??λ릺?덉뒿?덈떎.");
                    location.href = '<c:url value="/hm/hospital"/>';
                });
            }
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            onClick: function () {
                location.href = '<c:url value="/hm/hospital"/>';
            }
        });

        // Load
        $.ajax({
            url: '<c:url value="/hm/center/${centerId}"/>',
            method: 'GET',
        }).then(function (response) {
            // console.log(response);

            sitebuilder.valuesToDx(response.data);

            if (response.data.ciUrl) {
                $('#ciUrl').attr('src', response.data.ciUrl).show();
            }

            $.ajax({
                url: '<c:url value="/hm/tabs"/>',
                method: 'GET',
                data: {
                    hospitalId: response.data.hospitalId,
                    centerId: response.data.centerId,
                },
                success: function (response) {
                    if (response.data.length > 1) {
                        dxInstances.tabs.option({
                            items: response.data,
                        });
                    } else {
                        dxInstances.tabs.option({
                            visible: false,
                        });
                    }
                }
            });
        });

        /* ?ㅼ쓬 二쇱냼 ?곕룞 */
        function execution_daum_address(zipcode, sido, sigungu, address1, address2) {
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
