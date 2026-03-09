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
                            <h3 class="h3">?쇳꽣?깅줉</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- ?쇳꽣 湲곕낯 ?뺣낫 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>?쇳꽣 湲곕낯 ?뺣낫</div>
                            <div class="row-box6">
                                <div class="row-box-inner1 logo-box">
                                    <div class="col-box1 col-box-vertical4 row logo-img">
                                        <div class="col-lg-12 center-box">
                                            <img id="ciUrl" src="" alt="湲곗뾽泥대줈怨?/>
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
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>蹂묒썝紐?/span></div>
                                                    <div class="col-lg-5" id="hospitalName" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>蹂묒썝肄붾뱶</span></div>
                                                    <div class="col-lg-8" id="hospitalCode" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>?쇳꽣紐?/span></div>
                                                    <div class="col-lg-2">
                                                        <div class="btnBlue" id="popupBtn" data-sitebuilder="dxButton"></div>
                                                    </div>

                                                    <div class="col-lg-5"><div id="centerName" data-sitebuilder="dxTextBox"></div></div>
                                                    <div id="popupCenter" data-sitebuilder="dxPopup"></div>
                                                </div>
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>?쇳꽣肄붾뱶</span></div>
                                                    <div class="col-lg-4" id="centerCode" data-sitebuilder="dxTextBox"></div>
                                                    <div class="col-lg-4" id="noUse" data-sitebuilder="dxCheckBox"></div>
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
                        <!-- ?쇳꽣 湲곕낯 ?뺣낫 -->

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
                        <div class="col-lg-1 tag_name" style="display: none;" id="head" data-sitebuilder="dxCheckBox"></div>
                        <div class="col-lg-1" style="display: none;" id="hospitalId" data-sitebuilder="dxTextBox"></div>
                    </div>
                    <%--                    </div>--%>
                </div>

                <div class="row btn_area footer-btn">
                    <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>???/div>
                    <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">紐⑸줉</div>
                </div>

            </div>
        </div>


    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>
<script>
    /** @param _dxInstances : {centerCode,tbClass,btnZip,ct,mri,parking,dish,saturday,weekend,advertisement} */
    $(function () {
        sitebuilder.openMenu('hospital');

        let dxInstances = sitebuilder.createDx(false);
        let dsCenter = [];

        dxInstances.hospitalName.option({
            readOnly: true
        });

        dxInstances.hospitalCode.option({
            readOnly: true
        });

        dxInstances.head.option({
            value: false,
        });

        dxInstances.popupBtn.option({
            text: "?쇳꽣紐??깅줉",
            onClick: function () {
                Load();
            }
        });

        dxInstances.popupCenter.option({
            title: "蹂묒썝肄붾뱶 諛?蹂묒썝?대쫫 ?깅줉",
            closeOnOutsideClick: true,
            width: 800,
            height: 880,
            contentTemplate: function (contentElement) {
                return contentElement.append($("<div />").dxDataGrid({
                    dataSource: dsCenter,
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
                        caption: '?쇳꽣肄붾뱶',
                    }, {
                        dataField: 'centerName',
                        caption: '?쇳꽣?대쫫',
                    }],
                    searchEnabled: true,
                    searchExpr: 'centerName',
                    searchMode: 'contains',
                    onSaving: function (e) {
                        for (let i = 0; i < dsCenter.length; i++) {
                            if (e.changes[0].data.centerCode === dsCenter[i].centerCode) {
                                alert("?쇳꽣肄붾뱶媛 以묐났 ?⑸땲??");
                                e.changes.pop();
                                return;
                            }
                        }

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

        dxInstances.homepage.option({
            readOnly: true,
        });

        // dxInstances.businessNo.option({
        //     mask: '000-00-00000',
        // });

        dxInstances.locationDesc.option({
            placeholder: '?묒꽦?덉떆) ?좊룄由쇱뿭 1?몄꽑 5踰덉텧援?(?꾨낫 150M) // 2?몄꽑 1踰덉텧援?(?꾨낫 100M)'
        });

        dxInstances.grade.option({
            dataSource: [
                {'id': 0, 'text': '寃吏꾩꽱??},
                {'id': 1, 'text': '醫낇빀蹂묒썝'},
                {'id': 2, 'text': '?곴툒醫낇빀蹂묒썝'}
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
            value: new Date('2021-01-01T07:00:00'),
        });

        dxInstances.receiptNormalEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
            value: new Date('2021-01-01T16:00:00'),
        });

        dxInstances.receiptSaturBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
            value: new Date('2021-01-01T07:00:00'),
        });

        dxInstances.receiptSaturEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
            value: new Date('2021-01-01T12:00:00'),
        });

        dxInstances.btnAttach.option({
            disabled: true,
            text: '?뚯씪泥⑤?',
            onClick: function () {
                $('#ci').trigger('click');
            },
        });

        dxInstances.noUse.option({
            value: false,
            text: '???쇳꽣???몄텧??以묒??⑸땲??
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
                console.log(data);

                if (!data.centerName) {
                    alert('?쇳꽣紐낆쓣 ?낅젰?섏꽭??);
                    return;
                }
                if (!data.centerCode) {
                    alert('?쇳꽣肄붾뱶瑜??낅젰?섏꽭??);
                    return;
                }

                if (data.grade === null) {
                    alert('蹂묒썝援щ텇???좏깮?섏꽭??);
                    return;
                }
                if (!data.preday) {
                    alert('寃吏꾩?鍮꾧린?쒖쓣 ?좏깮?섏꽭??);
                    return;
                }

                $.ajax({
                    url: '<c:url value="/hm/center/0"/>',
                    method: 'POST',
                    data: JSON.stringify(data),
                }).then(function () {
                    sitebuilder.notify("??λ릺?덉뒿?덈떎.");
                    location.href = '<c:url value="/hm/hospital"/>';
                });
            }
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/hm/hospital"/>';
            }
        });

        $.ajax({
            url: '<c:url value="/hm/center/0/create"/>',
            method: 'GET',
        }).then(function (response) {
            sitebuilder.valuesToDx(response.data);

            if (response.data.ciUrl) {
                $('#ciUrl').attr('src', response.data.ciUrl).show();
            }
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

        // Load
        function Load() {
            let ajaxCenterList = {
                url: '<c:url value="/common/centercheck"/>',
                dataType: 'json',
                contentType: 'application/json',
                data: {
                    hospitalId: dxInstances.hospitalId.option('value'),
                }
            };

            $.when($.ajax(ajaxCenterList)).then(function (responseCenterList) {
                dsCenter = responseCenterList.data;
                dxInstances.popupCenter.show();
            });
        }
    });
</script>
