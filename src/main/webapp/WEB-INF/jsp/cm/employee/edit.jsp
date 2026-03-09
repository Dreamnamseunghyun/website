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
                            <h3 class="h3">?뚯썝 湲곕낯?뺣낫 ?섏젙</h3>

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

                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>??곷뀈??/span></div>
                                            <div class="col-lg-8 row period">
                                                <div class="col-lg-12" id="employeeCheckup.companyCheckupId" data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </div>
                        <!-- ??곷뀈??-->

                        <!-- 湲곕낯 ?몄쟻?ы빆 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>湲곕낯 ?몄쟻?ы빆</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>ID</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-9" id="employeeCode"
                                                 data-sitebuilder="dxTextBox"></div>
                                            <div class="col-lg-3" id="noUse"
                                                 data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>PW</span></div>
                                        <div class="col-lg-10 row period center-box">
                                            <div class="col-lg-12 btnGray" id="passwordReset"
                                                 data-sitebuilder="dxButton"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>寃吏꾩옄紐?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-9" id="employeeName"
                                                 data-sitebuilder="dxTextBox"></div>
                                            <div class="col-lg-3" id="employeeCheckup.vip"
                                                 data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?앸뀈?붿씪</span></div>
                                        <div class="col-lg-4 row">
                                            <div class="col-lg-12" id="birth"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?대??꾪솕踰덊샇</span></div>
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
                                        <div class="col-lg-2 tag-name"><span>??곸옄 援щ텇</span></div>
                                        <div class="col-lg-4" id="myself" data-sitebuilder="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name"><span>鍮꾩슜泥?뎄</span></div>
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
                                        <div class="col-lg-2 tag-name"><span>寃吏꾩쑀??/span></div>
                                        <div class="col-lg-4" id="employeeCheckup.companyCheckupTypeId"
                                             data-sitebuilder="dxSelectBox"></div>
                                        <div class="col-lg-2 tag-name"><span>寃吏꾩쑀?뺣챸</span></div>
                                        <div class="col-lg-4" id="companyCheckupType.companyCheckupTypeName"
                                             data-sitebuilder="dxSelectBox"></div>
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
                            <div class="col-lg-1" id="btnDelete" data-sitebuilder="dxButton">??젣</div>
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

        dxInstances.companyId.option({
            displayExpr: 'companyName',
            valueExpr: 'companyId',
            readOnly: true
        });

        dxInstances['employeeCheckup.companyCheckupId'].option({
            displayExpr: 'checkupYear',
            valueExpr: 'companyCheckupId',
            readOnly: true
        });

        dxInstances.employeeCode.option({
            readOnly: true
        });

        dxInstances.noUse.option({
            text: '?뚯썝 濡쒓렇??以묐떒',
            value: false,
        });

        dxInstances.passwordReset.option({
            text: '鍮꾨쾲 珥덇린??,
            onClick: function () {
                confirm('?뺣쭚濡?珥덇린???섏떆寃좎뒿?덇퉴?');
                $.ajax({
                    url: '<c:url value="/pm/employee/reset"/>',
                    method: 'PUT',
                    data: JSON.stringify(sitebuilder.dxToValues()),
                }).then(function () {
                });
            }
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
        });

        dxInstances['employeeCheckup.vip'].option({
            text: 'VIP',
            value: false,
        });

        dxInstances.sex.option({
            dataSource: [
                {'id': 'M', 'text': '??},
                {'id': 'F', 'text': '??},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.mobile.option({
            placeholder: '?대??꾪솕 11?먮━',
        });

        dxInstances.zipcodeSearch.option({
            text: '?고렪踰덊샇',
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

        dxInstances['employeeCheckup.companyCheckupTypeId'].option({
            displayExpr: 'companyCheckupTypeCode',
            valueExpr: 'companyCheckupTypeId',
            onValueChanged: function (e) {
                dxInstances['companyCheckupType.supportPay'].option({value: e.value,});
                dxInstances['companyCheckupType.copay'].option({value: e.value,});
                dxInstances['companyCheckupType.companyCheckupTypeName'].option({value: e.value,});
            },
        });

        dxInstances['companyCheckupType.supportPay'].option({
            displayExpr: function (item) {
                return item && sitebuilder.numberWithCommas(item.supportPay);
            },
            valueExpr: 'companyCheckupTypeId',
            readOnly: true
        });

        dxInstances['companyCheckupType.copay'].option({
            displayExpr: function (item) {
                return item && sitebuilder.numberWithCommas(item.copay);
            },
            valueExpr: 'companyCheckupTypeId',
            readOnly: true
        });

        dxInstances['companyCheckupType.companyCheckupTypeName'].option({
            displayExpr: 'companyCheckupTypeName',
            valueExpr: 'companyCheckupTypeId',
            readOnly: true
        });

        dxInstances.myself.option({
            dataSource: [
                {'id': 1, 'text': '蹂몄씤'},
                {'id': 2, 'text': '媛議?},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances['employeeCheckup.supportType'].option({
            dataSource: [
                {'id': 0, 'text': '湲곗뾽遺??},
                {'id': 1, 'text': '蹂몄씤遺??},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances['employeeCheckup.specialCheckup'].option({
            text: '?밴????,
            value: false
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

                if (data.check === '') {
                    alert("以묐났泥댄겕瑜??댁＜?몄슂.")
                    return;
                }

                if (data.employeeCheckup.companyCheckupTypeId === null) {
                    alert("寃吏꾩쑀?뺤쓣 ?좏깮???댁＜?몄슂.")
                    return;
                }

                if (!data.employeeName) {
                    alert('?대쫫???낅젰?섏꽭??);
                    return;
                }

                if (!data.mobile) {
                    alert('?대??꾪솕 踰덊샇瑜??낅젰?섏꽭??);
                    return;
                }

                data.birth = new Date(dxInstances.birth.option('text'));

                $.ajax({
                    url: '<c:url value="/cm/employee/${employeeCheckupId}"/>',
                    method: 'PUT',
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
            },
        });

        // Delete
        dxInstances.btnDelete.option({
            stylingMode: 'contained',
            text: '??젣',
            type: 'danger',
            onClick: function () {
                let data = sitebuilder.dxToValues();

                if (confirm('?뺣쭚濡???젣?섏떆寃좎뒿?덇퉴?')) {
                    $.ajax({
                        url: '<c:url value="/cm/employee/${employeeCheckupId}"/>',
                        method: 'DELETE',
                        data: JSON.stringify(data),
                    }).then(function () {
                        location.href = '<c:url value="/cm/employee"/>'
                    });
                }
            },
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

        // load by ajax async
        $.ajax({
            url: '<c:url value="/cm/employee/${employeeCheckupId}"/>',
            method: 'GET',
        }).then(function (response) {
            sitebuilder.valuesToDx(response.data);

            if (response.data.myDepart != null) {
                dxInstances.depart.option({
                    value: response.data.myDepart
                });
            } else if (response.data.famDepart != null) {
                dxInstances.depart.option({
                    value: response.data.famDepart
                });
            }

            if (response.data.myTitle != null) {
                dxInstances.title.option({
                    value: response.data.myTitle
                });
            } else if (response.data.famTitle != null) {
                dxInstances.title.option({
                    value: response.data.famTitle
                });
            }

            if (response.data.familyName != null) {
                dxInstances.familyName.option({
                    value: response.data.familyName
                });
            } else {
                dxInstances.familyName.option({
                    value: response.data.employeeName
                });
            }

            $.ajax({
                url: '<c:url value="/common/companycheckuptype"/>',
                method: 'GET',
                data: {
                    companyCheckupId: response.data.employeeCheckup.companyCheckupId,
                }
            }).then(function (response2) {
                dxInstances['employeeCheckup.companyCheckupTypeId'].option({
                    dataSource: response2.data,
                });

                dxInstances['companyCheckupType.supportPay'].option({
                    dataSource: response2.data,
                });

                dxInstances['companyCheckupType.copay'].option({
                    dataSource: response2.data,
                });

                dxInstances['companyCheckupType.companyCheckupTypeName'].option({
                    dataSource: response2.data,
                });
            });

            $.ajax({
                url: '<c:url value="/common/company?listType=ALL"/>',
                method: 'GET',
            }).then(function (response3) {
                dxInstances.companyId.option({
                    dataSource: response3.data,
                });

                dxInstances['employeeCheckup.companyCheckupId'].option({
                    dataSource: response3.data,
                });
            });
        });
    });
</script>
</html>
