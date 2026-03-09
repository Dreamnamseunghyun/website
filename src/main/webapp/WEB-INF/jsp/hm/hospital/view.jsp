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
                            <h3 class="h3">?쇳꽣 ?곸꽭 ?뺣낫</h3>
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
                                            <img id="ciUrl" src="" alt="湲곗뾽泥대줈怨? style="display:none">
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
                                                <div class="col-lg-2 tag-name"><span>蹂묒썝紐?/span></div>
                                                <div class="col-lg-4">
                                                    <div id="hospitalName" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-2 tag-name"><span>蹂묒썝肄붾뱶</span></div>
                                                <div class="col-lg-2">
                                                    <div id="hospitalCode" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div id="noUse" data-sitebuilder="dxCheckBox"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-2 tag-name"><span>?쇳꽣紐?/span></div>
                                                <div class="col-lg-4">
                                                    <div id="centerName" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-2 tag-name"><span>?쇳꽣肄붾뱶</span></div>
                                                <div class="col-lg-4">
                                                    <div id="centerCode" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-2 tag-name"><span>?꾪솕</span></div>
                                                <div class="col-lg-4">
                                                    <div id="telephone" data-sitebuilder="dxTextBox"
                                                         data-sitebuilder-format="tel"></div>
                                                </div>
                                                <div class="col-lg-2 tag-name"><span>?덊럹?댁?</span></div>
                                                <div class="col-lg-4">
                                                    <div id="homepage" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-2 tag-name"><span>?고렪踰덊샇</span></div>
                                                <div class="col-lg-4">
                                                    <div id="zipcode" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-2 tag-name"><span>?꾩튂</span></div>
                                                <div class="col-lg-4">
                                                    <div id="locationDesc" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-2 tag-name"><span>二쇱냼</span></div>
                                                <div class="col-lg-4" id="address1" data-sitebuilder="dxTextBox"></div>
                                                <div class="col-lg-2 tag-name"><span>?곸꽭二쇱냼</span></div>
                                                <div class="col-lg-4" id="address2" data-sitebuilder="dxTextBox"></div>
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
                                    <div class="col-box3 row center-input">
                                        <div class="col-lg-3 tag-name check"><span>寃吏꾩젒?섍린媛?br>(?됱씪 ?ㅼ쟾)</span></div>
                                        <div class="col-lg-9 row period">
                                            <div class="col-lg-6 center" id="receiptNormalBegin"
                                                 data-sitebuilder="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6 center" id="receiptNormalEnd"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box3 row">
                                        <div class="col-lg-3 tag-name check"><span>寃吏꾩젒?섍린媛?br>(?됱씪 ?ㅽ썑)</span></div>
                                        <div class="col-lg-9 row period">
                                            <div class="col-lg-6 center" id="receiptNormalPmBegin"
                                                 data-sitebuilder="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6 center" id="receiptNormalPmEnd"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box3 row">
                                        <div class="col-lg-3 tag-name check"><span>寃吏꾩젒?섍린媛?br>(?좎슂??</span></div>
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
                                        <div class="col-lg-1 tag-name"><span>蹂묒썝 ?뱀씠?ы빆</span></div>
                                        <div class="col-lg-11 row period">
                                            <div id="notes" data-sitebuilder="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">

                                    <div class="col-box1 col-box-vertical5 row">
                                        <div class="col-lg-1 tag-name"><span>蹂묒썝 ?띾낫湲</span></div>
                                        <div class="col-lg-11 row period">
                                            <div id="advertisement" data-sitebuilder="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 寃吏??몃? ?뺣낫 -->

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton"></div>
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
<script>
    $(function () {
        sitebuilder.openMenu('hospital');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.tabs.option({
            hoverStateEnabled: true,
            displayExpr: "centerList",
            keyExpr: "centerId",
            onItemClick: function (e) {
                let center = e.itemData.centerId;
                location.href = '<c:url value="/hm/center"/>/' + center;
            }
        });

        dxInstances.btnAttach.option({
            disabled: true,
            text: '?뚯씪泥⑤?',
            onClick: function () {
                $('#ci').trigger('click');
            },
        });

        dxInstances.hospitalName.option({
            readOnly: true
        });

        dxInstances.hospitalCode.option({
            readOnly: true
        });

        dxInstances.centerCode.option({
            readOnly: true
        });

        dxInstances.centerName.option({
            readOnly: true
        });

        dxInstances.telephone.option({
            readOnly: true
        });

        dxInstances.homepage.option({
            readOnly: true
        });

        // dxInstances.businessNo.option({
        //     mask: '000-00-00000',
        //     readOnly: true
        // });

        dxInstances.address1.option({
            readOnly: true
        });

        dxInstances.address2.option({
            readOnly: true
        });

        dxInstances.zipcode.option({
            readOnly: true
        });

        dxInstances.locationDesc.option({
            readOnly: true
        });

        dxInstances.grade.option({
            dataSource: [
                {'id': 0, 'text': '寃吏꾩꽱??},
                {'id': 1, 'text': '醫낇빀蹂묒썝'},
                {'id': 2, 'text': '?곴툒醫낇빀蹂묒썝'}
            ],
            valueExpr: 'id',
            displayExpr: 'text',
            readOnly: true
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
            displayExpr: 'text',
            readOnly: true
        });

        dxInstances.ableCt.option({
            value: false,
            text: 'CT',
            readOnly: true
        });

        dxInstances.ableMri.option({
            value: false,
            text: 'mri',
            readOnly: true
        });

        dxInstances.ablePark.option({
            value: false,
            text: '二쇱감媛??,
            readOnly: true
        });

        dxInstances.ableSoup.option({
            value: false,
            text: '二??앹궗,媛꾩떇)?쒓났',
            readOnly: true
        });

        dxInstances.ableSatur.option({
            value: false,
            text: '?좎슂寃吏?媛??,
            readOnly: true
        });

        dxInstances.ableSpecial.option({
            value: false,
            text: '?뱀닔寃吏?媛??,
            readOnly: true
        });

        dxInstances.ableAm.option({
            value: false,
            text: '?ㅼ쟾留?媛??,
            readOnly: true
        });

        dxInstances.receiptNormalBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
            readOnly: true
        });

        dxInstances.receiptNormalEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
            readOnly: true
        });

        dxInstances.receiptNormalPmBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
            readOnly: true
        });

        dxInstances.receiptNormalPmEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
            readOnly: true
        });

        dxInstances.receiptSaturBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
            readOnly: true
        });

        dxInstances.receiptSaturEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
            readOnly: true
        });

        dxInstances.notes.option({
            readOnly: true
        });

        dxInstances.advertisement.option({
            readOnly: true
        });

        dxInstances.noUse.option({
            readOnly: true,
            text: '??蹂묒썝???몄텧??以묒??⑸땲??
        });

        dxInstances.advertisement.option({
            height: '150px',
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '紐⑸줉',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/hm/hospital"/>';
            }
        });

        //Load
        $.ajax({
            url: '<c:url value="/hm/center/${centerId}"/>',
            method: 'GET',
        }).then(function (response) {
            console.log(response.data)
            sitebuilder.valuesToDx(response.data);

            $.ajax({
                url: '<c:url value="/hm/tabs"/>',
                method: 'GET',
                data: {
                    hospitalId: response.data.hospitalId,
                    centerId: response.data.centerId,
                },
                success: function (responseTabs) {
                    if (responseTabs.data.length > 1) {
                        let idx;
                        for (idx = 0; idx < responseTabs.data.length; idx++) {
                            if (responseTabs.data[idx].centerId === response.data.centerId) {
                                break;
                            }
                        }

                        dxInstances.tabs.option({
                            items: responseTabs.data,
                            selectedIndex: idx,
                        });
                    } else {
                        dxInstances.tabs.option({
                            visible: false,
                        });
                    }
                }
            })

            if (response.data.ciUrl) {
                $('#ciUrl').attr('src', response.data.ciUrl).show();
            }
        });
    });
</script>
</html>
