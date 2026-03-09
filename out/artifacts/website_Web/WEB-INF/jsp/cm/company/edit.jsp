<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<%--@elvariable id="sessionLoginName" type="java.lang.String"--%>

<!DOCTYPE html>
<html lang="ko">


<%@include file="/WEB-INF/jsp/common/head.jsp" %>


<body class="fixed-header dashboard menu-pin menu-behind">
<%@include file="/WEB-INF/jsp/common/nav.jsp" %>

<div class="page-container">
    <%@include file="/WEB-INF/jsp/common/header.jsp" %>

    <div class="page-content-wrapper">
        <div class="content sm-gutter">
            <div class=" container-fluid  padding-30 sm-padding-10 container-fixed-lg bg-white">
                <div class="card card-transparent board_internal">
                    <div class="card-header ">
                        <div class="card-title">
                            <h3 class="h3">湲곗뾽 ?섏젙</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- 湲곗뾽 湲곕낯 ?뺣낫 -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap logo-area-left">
                                <div class="row-box-title"><i class="xi-play-circle"></i>湲곗뾽 湲곕낯 ?뺣낫</div>

                                <div class="row-box6">
                                    <div class="row-box-inner1 logo-box">
                                        <div class="col-box1 col-box-vertical5 row logo-img">
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
                                                    <div class="col-lg-2 tag-name"><span>湲곗뾽泥대챸</span></div>
                                                    <div class="col-lg-4" id="companyName" data-sitebuilder="dxTextBox"></div>
                                                    <div class="col-lg-2 tag-name"><span>??곷뀈??/span></div>
                                                    <div class="col-lg-4" id="companyCheckup.checkupYear"
                                                         data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>湲곗뾽肄붾뱶</span></div>
                                                    <div class="col-lg-10" id="companyCode" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>ID ?낅젰臾멸뎄</span></div>
                                                    <div class="col-lg-6">
                                                        <div class="width-info-wrap">
                                                            <div id="idPlaceHolder" data-sitebuilder="dxRadioGroup"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4" id="idText" data-sitebuilder="dxTextBox"></div>
                                                </div>
                                                <div class="col-lg-box1 col-lg-box-vertical row">
                                                    <div class="col-lg-2 tag-name"><span>PW ?낅젰臾멸뎄</span>
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
                            <!-- 湲곗뾽 湲곕낯 ?뺣낫 -->

                            <!-- 留ㅻ땲? ?뺣낫 -->
                            <div class="row-wrap logo-area-right">
                                <div class="row-box-title"><i class="xi-play-circle"></i>留ㅻ땲? ?뺣낫</div>
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
                        <!-- 留ㅻ땲? ?뺣낫 -->
                        <%--                        <div class="card-title">--%>
                        <%--                            <div class="row">--%>
                        <%--                                <h3 style="margin-left:15px;"><i class="xi-play-circle"></i></h3><h3 class="h3" style="margin-left: 5px;"> ?곕룄蹂?寃吏??몃? ?뺣낫</h3>--%>
                        <%--                                <div class="card-title-select">--%>
                        <%--                                    <div class="tag-name"><span>??곷뀈??/span></div>--%>
                        <%--                                    <div id="companyCheckup.checkupYear" data-sitebuilder="dxTextBox"></div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <!-- 寃吏??몃? ?뺣낫 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>寃吏??몃? ?뺣낫</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row">
                                        <div class="col-lg-1 tag-name"><span>??곸씤??/span></div>
                                        <div class="col-lg-11" id="companyCheckup.employeeNumber"
                                             data-sitebuilder="dxNumberBox"></div>
                                    </div>
                                </div><!--row-box-inner-->

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row center-input">
                                        <div class="col-lg-2 tag-name"><span>寃吏??ㅼ떆 湲곌컙</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6 center" id="companyCheckup.checkupDateBegin"
                                                 data-sitebuilder="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6 center" id="companyCheckup.checkupDateEnd"
                                                 data-sitebuilder="dxDateBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?덉빟 媛??湲곌컙</span></div>
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
                        <!-- 寃吏??몃? ?뺣낫 -->

                        <%-- checkup type dataGrid --%>
                        <div class="row-wrap">
                        <div id="dataGridCheckupType" class="section sec02 sub_table" data-sitebuilder="dxDataGrid"
                             style="height: 40vh;"></div>
                        </div>

                    </div>
                    <%--                    </div>--%>
                </div>
                <div class="row btn_area footer-btn">
                    <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>???/div>
                    <div class="col-lg-1" id="btnCancel" data-sitebuilder="dxButton">痍⑥냼</div>
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

        dxInstances.companyName.option({
            readOnly: true,
        });

        dxInstances.companyCode.option({
            readOnly: true,
        });

        function previewImage(input, target) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();

                reader.onload = function (e) {
                    target.attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        dxInstances.btnPlatformManager.option({
            text: '珥앷큵 留ㅻ땲?',
        });

        dxInstances.btnCompanyManager.option({
            text: '湲곗뾽 留ㅻ땲?',
        });

        dxInstances['companyCheckup.employeeNumber'].option({
            format: "#,### 紐?
        });

        dxInstances['companyCheckup.checkupYear'].option({
            readOnly: true,
        });

        dxInstances['companyCheckup.checkupDateBegin'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            onValueChanged: function (e) {
                dxInstances['companyCheckup.checkupDateEnd'].option("min", e.value);
            },
        });

        dxInstances['companyCheckup.checkupDateEnd'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            onValueChanged: function (e) {
                dxInstances['companyCheckup.checkupDateBegin'].option("max", e.value);
                dxInstances['companyCheckup.reserveDateBegin'].option("max", e.value);
                dxInstances['companyCheckup.reserveDateEnd'].option("max", e.value);

            },
        });

        dxInstances['companyCheckup.reserveDateBegin'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            onValueChanged: function (e) {
                dxInstances['companyCheckup.reserveDateEnd'].option("min", e.value);
            },
        });

        dxInstances['companyCheckup.reserveDateEnd'].option({
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
        });

        dxInstances.idPlaceHolder.option({
            layout: 'horizontal',
            items: [
                {'id': '?대??꾪솕踰덊샇 (11?먮━)', 'text': '?대??꾪솕 (11?먮━)'},
                {'id': '?ъ썝踰덊샇', 'text': '?ъ썝踰덊샇'},
                {'id': '?앸뀈?붿씪 8?먮━', 'text': '?앸뀈?붿씪 8?먮━'},
                {'id': 'ETC', 'text': '湲고? (15?먯씠??'}
            ],
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

        dxInstances.pwType.option({
            layout: "horizontal",
            items: [
                {'id': 0, 'text': '?대??꾪솕 (11?먮━)'},
                {'id': 1, 'text': '?ъ썝踰덊샇'},
                {'id': 2, 'text': '?앸뀈?붿씪 8?먮━'},
            ],
            valueExpr: 'id',
        });

        dxInstances.dataGridCheckupType.option({
            editing: {
                mode: "batch",
                allowAdding: true,
                allowUpdating: true,
                allowDeleting: true,
                selectTextOnEditStart: true,
                startEditAction: "click"
            },
            columns: [{
                dataField: 'companyCheckupTypeCode',
                caption: '?좏삎',
                alignment: 'center',
            }, {
                dataField: 'companyCheckupTypeName',
                caption: '?좏삎紐?,
                alignment: 'center',
            }, {
                dataField: 'supportPay',
                caption: '吏?먭툑??,
                alignment: 'center',
                dataType: 'number'
                // }, {
                //     dataField: 'hospitalPay',
                //     caption: '蹂묒썝泥?뎄??,
                //     alignment: 'center',
                //     dataType: 'number'
                // }, {
                //     dataField: 'platformPay',
                //     caption: '?섏닔猷?,
                //     alignment: 'center',
                //     dataType: 'number'
            }, {
                caption: '寃吏꾨????ㅼ젙',
                columns: [{
                    dataField: 'typeSelf',
                    caption: '蹂몄씤',
                    dataType: 'boolean',
                }, {
                    dataField: 'typeFamily',
                    caption: '湲곗뾽遺?닿?議?,
                    dataType: 'boolean',
                }, {
                    dataField: 'typeCopay',
                    caption: '蹂몄씤遺?닿?議?,
                    dataType: 'boolean',
                }],
            }],

            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    html: '<div class="row-box-title"><i class="xi-play-circle"></i>湲곗뾽 寃吏??좏삎</div>',
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
            },
            onCellPrepared: function (data) {
                if (data.rowType === 'header') {
                    data.cellElement.css('background', 'white');
                }
            }
        });

        dxInstances.noUse.option({
            text: '濡쒓렇??以묒?',
        });

        dxInstances.useNotiTalk.option({
            text: '?덉빟?낅젮 ?뚮┝???먮룞諛쒖넚 (寃吏?留덇컧 45???꾩뿉 ?먮룞 諛쒖넚(二쇰쭚, 怨듯쑕???쒖쇅))',
        });

        dxInstances.btnAttach.option({
            text: '?뚯씪泥⑤?',
            onClick: function () {
                $('#ci').trigger('click');
            },
        });

        dxInstances.ciFilename.option({
            readOnly: true,
        });

        ciForm.on('change', function () {
            if (this.files.length) {
                dxInstances.ciFilename.option('value', this.files[0].name);
            } else {
                dxInstances.ciFilename.option('value', null);
            }
        });

        // Save
        dxInstances.btnSave.option({
            stylingMode: "contained",
            text: "???,
            type: "success",
            onClick: function () {
                let data = sitebuilder.dxToValues();
                let gridData = dxInstances.dataGridCheckupType.option('editing.changes').map(function (v) {
                    if (v.type !== 'insert') {
                        v.data = $.extend(true, {}, v.key, v.data);
                    }
                    v.data._crudType = v.type.toUpperCase();
                    return v.data;
                });

                if (!data.companyName) {
                    alert('湲곗뾽泥대챸???낅젰?섏꽭??);
                    return;
                }
                if (!data.companyCode) {
                    alert('湲곗뾽泥댁퐫?쒕? ?낅젰?섏꽭??);
                    return;
                }
                // if (!data.businessNo) {
                //     alert('?ъ뾽?먮쾲?몃? ?낅젰?섏꽭??);
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
                    url: '<c:url value="/cm/company/0"/>',
                    method: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData,
                }).then(function () {
                    sitebuilder.notify("??λ릺?덉뒿?덈떎.");
                    location.href = '<c:url value="/cm/company/0"/>';
                });
            }
        });

        // Cancel
        dxInstances.btnCancel.option({
            stylingMode: 'contained',
            text: '痍⑥냼',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/cm/company/0"/>';
            }
        });

        // Load
        $.ajax({
            url: '<c:url value="/cm/company/0"/>',
            method: 'GET',
        }).then(function (response) {
            sitebuilder.valuesToDx(response.data);
            if (response.data.companyCheckup.companyCheckupTypes[0].companyCheckupTypeCode != null) {
                dxInstances.dataGridCheckupType.option({
                    dataSource: response.data.companyCheckup.companyCheckupTypes,
                });
            } else {
                dxInstances.dataGridCheckupType.option({
                    dataSource: [],
                });
            }

            if (response.data.idPlaceHolder !== '?대??꾪솕踰덊샇 (11?먮━)' && response.data.idPlaceHolder !== '?ъ썝踰덊샇' && response.data.idPlaceHolder !== '?앸뀈?붿씪 8?먮━') {
                dxInstances.idPlaceHolder.option('value', 'ETC');
                dxInstances.idText.option('value', response.data.idPlaceHolder);
            }

            // dxInstances.accountUserId.option({
            //     value: response.data.accountUserId,
            // });
            // dxInstances.salesUserId.option({
            //     value: response.data.salesUserId,
            // });
            // dxInstances.adminUserId.option({
            //     value: response.data.adminUserId,
            // });

            if (response.data.ciUrl) {
                $('#ciUrl').attr('src', response.data.ciUrl).show();
            }

            dxInstances.dataGridCheckupType.cancelEditData();
        });


        // Load
        $.ajax({
            url: '<c:url value="/cm/company/${companyId}"/>',
            method: 'GET',
        }).then(function (response) {
            //console.log(response);
            // dxInstances.accountUserId.option({
            //     dataSource: response.data,
            //     valueExpr: 'userId',
            //     displayExpr: 'platformManagerName',
            // });
            // dxInstances.salesUserId.option({
            //     dataSource: response.data,
            //     valueExpr: 'userId',
            //     displayExpr: 'platformManagerName',
            // });
            // dxInstances.adminUserId.option({
            //     dataSource: response.data,
            //     valueExpr: 'userId',
            //     displayExpr: 'platformManagerName',
            // });
        });
    });
</script>


</html>
