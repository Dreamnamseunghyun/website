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
                            <h3 class="h3">Î≥ëÏõêÎß§Îãà?Ä ?òÏ†ï</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- Î≥ëÏõê Îß§Îãà?Ä -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Î≥ëÏõê Îß§Îãà?Ä</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>ID</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6" id="centerManagerCode" data-sitebuilder="dxTextBox"></div>
                                            <div class="col-lg-3" id="notokUrge" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-3" id="noUse" data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?åÏÜç</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="hospitalId" data-sitebuilder="dxSelectBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>PW</span></div>
                                        <div class="col-lg-10 row period center-box">
                                            <div class="col-lg-9 btnGray" id="btnResetPW"
                                                 data-sitebuilder="dxButton"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?ºÌÑ∞</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="centerId" data-sitebuilder="dxSelectBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Îß§Îãà?ÄÎ™?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="centerManagerName"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?†ÏÑ†</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-12" id="telephone"
                                                 data-sitebuilder="dxTextBox" data-sitebuilder-format="tel"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?¥Î©î??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="email"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?¥Î??ÑÌôî</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-12" id="mobile"
                                                 data-sitebuilder="dxTextBox" data-sitebuilder-format="tel"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 col-box-vertical3 row">
                                        <div class="col-lg-1 tag-name"><span>Î©îÎ™®</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="notes"
                                                 data-sitebuilder="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Î≥ëÏõê Îß§Îãà?Ä -->

                        <div class="row">
                            <div id="centerManagerGrid" class="sub_table" data-sitebuilder="dxDataGrid"></div>
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>?Ä??/div>
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">Î™©Î°ù</div>
                            <div class="col-lg-1" id="btnDelete" data-sitebuilder="dxButton">??†ú</div>
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
    /** @param _dxInstances : {btnHospitalSearch,hospitalManagerName} */
    $(function () {
        sitebuilder.openMenu('manager');

        let dxInstances = sitebuilder.createDx(false);

        let dsHospital = new DevExpress.data.DataSource({
            load: function () {
                return $.ajax({
                    url: '<c:url value="/pm/hospital"/>',
                    method: 'GET',
                });
            },
        });

        dxInstances.hospitalId.option({
            dataSource: dsHospital,
            placeholder: 'Î≥ëÏõêÍ≤Ä??,
            valueExpr: 'hospitalId',
            displayExpr: 'hospitalName',
            searchEnabled: true,
            searchExpr: ['hospitalName'],
            onItemClick: function () {
                dxInstances.centerId.option({
                    value: null
                })
            },
            onValueChanged: function (e) {
                let ds = dxInstances.centerId.getDataSource();
                ds.filter(['hospitalId', '=', e.value]);
                ds.load();
            },
        });

        dxInstances.centerId.option({
            placeholder: "?ºÌÑ∞Í≤Ä??,
            valueExpr: 'centerId',
            displayExpr: 'centerName',
        });

        dxInstances.noUse.option({
            text: 'Î°úÍ∑∏?∏Ï§ëÏßÄ',
        });

        dxInstances.notokUrge.option({
            text: '?åÎ¶º???ÖÎ†§ ?úÏô∏',
        });

        dxInstances.btnResetPW.option({
            text: 'ÎπÑÎ≤àÏ¥àÍ∏∞??,
            onClick: function () {
                $.ajax({
                    url: '<c:url value="/pm/manager/reset"/>',
                    method: 'PUT',
                    data: JSON.stringify(sitebuilder.dxToValues()),
                }).then(function () {
                });
            }
        });

        dxInstances.centerManagerGrid.option({
            editing: {
                mode: 'batch',
                allowAdding: true,
                allowUpdating: true,
                allowDeleting: true,
                selectTextOnEditStart: true,
                startEditAction: 'click'
            },
            columns: [{
                dataField: 'companyId',
                caption: 'Í∏∞ÏóÖÏ≤¥Î™Ö',
                // setCellValue: function (rowData, value) {
                //     rowData.companyId = value;
                // },
            }, {
                caption: '?∏Î??ÖÎ¨¥',
                alignment: 'center',
                columns: [{
                    dataField: 'contract',
                    caption: 'Í≥ÑÏïΩ',
                    dataType: 'boolean',
                }, {
                    dataField: 'reserve',
                    caption: '?àÏïΩ',
                    dataType: 'boolean',
                }, {
                    dataField: 'result',
                    caption: 'Í≤∞Í≥º',
                    dataType: 'boolean',
                }],
            }
            ],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '?¥Îãπ Í∏∞ÏóÖÏ≤?,
                });

                // Modifies an existing item
                let toolbarItems = e.toolbarOptions.items;
                toolbarItems.forEach(function (item) {
                    if (item.name === "saveButton") {
                        item.visible = false;
                    }
                    ;
                });
            },
            onInitNewRow: function (e) {
                e.data['contract'] = false;
                e.data['reserve'] = false;
                e.data['result'] = false;
            },
        });

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '?Ä??,
            type: 'success',
            onClick: function () {
                let data = sitebuilder.dxToValues();
                let gridData = dxInstances.centerManagerGrid.option('editing.changes').map(function (v) {
                    if (v.type !== 'insert') {
                        v.data = $.extend(true, {}, v.key, v.data);
                    }
                    v.data._crudType = v.type.toUpperCase();
                    return v.data;
                });

                if (!data.centerManagerCode) {
                    alert('IDÎ•??ÖÎ†•?òÏÑ∏??);
                    return;
                }
                if (!data.centerManagerName) {
                    alert('?¥Î¶Ñ???ÖÎ†•?òÏÑ∏??);
                    return;
                }
                if (!data.mobile) {
                    alert('?¥Î??ÑÌôî Î≤àÌò∏Î•??ÖÎ†•?òÏÑ∏??);
                    return;
                }
                if (!data.email) {
                    alert('?¥Î©î?ºÏùÑ ?ÖÎ†•?òÏÑ∏??);
                    return;
                }
                data.centerManagerCompany = gridData;

                $.ajax({
                    url: '<c:url value="/pm/manager/${userId}/hospitaledit"/>',
                    method: 'PUT',
                    data: JSON.stringify(data),
                }).then(function () {
                    sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");
                    location.href = '<c:url value="/pm/manager"/>';
                });
            },
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: 'Î™©Î°ù',
            onClick: function () {
                location.href = '<c:url value="/pm/manager"/>';
            }
        });

        dxInstances.btnDelete.option({
            stylingMode: 'contained',
            text: '??†ú',
            type: 'danger',
            onClick: function () {
                if (confirm('?ïÎßêÎ°???†ú?òÏãúÍ≤†Ïäµ?àÍπå?')) {
                    $.ajax({
                        url: '<c:url value="/pm/manager/${userId}/hospital"/>',
                        method: 'DELETE',
                    }).then(function () {
                        location.href = '<c:url value="/pm/manager"/>'
                    });
                }
            },
        });

        let ajaxHospital = $.ajax({
            url: '<c:url value="/common/hospital"/>',
            method: 'GET',
        });

        let ajaxCenter = $.ajax({
            url: '<c:url value="/common/center"/>',
            method: 'GET',
        });

        let ajaxCompany = $.ajax({
            url: '<c:url value="/common/company?listType=LAST_ALL"/>',
            method: 'GET',
        });

        $.when(ajaxHospital, ajaxCenter, ajaxCompany).then(function (respHospital, respCenter, respCompany) {
            $.ajax({
                url: '<c:url value="/pm/manager/hospital/${userId}"/>',
                method: 'GET',
            }).then(function (response) {
                console.log(response.data);
                sitebuilder.valuesToDx(response.data);
                dxInstances.centerManagerGrid.option({
                    dataSource: response.data.centerManagerCompany
                })

                dxInstances.centerManagerGrid.cancelEditData();
            });

            dxInstances.hospitalId.option({
                dataSource: respHospital[0].data,
            });

            dxInstances.centerId.option({
                dataSource: respCenter[0].data,
            });

            let dsCompany = respCompany[0].data;
            dxInstances.centerManagerGrid.columnOption('companyId', {
                lookup: {
                    dataSource: function (row) {
                        if (row.data) {
                            let changes = dxInstances.centerManagerGrid.option('editing.changes');

                            let ds = [];
                            if (changes.length) {
                                ds = ds.concat(changes.filter(function (v) {
                                    return v.data.companyId;
                                }).map(function (v) {
                                    return v.data.companyId;
                                }));
                            }
                            if (dxInstances.centerManagerGrid.getDataSource()) {
                                ds = ds.concat(dxInstances.centerManagerGrid.getDataSource().items().map(function (v) {
                                    return v.companyId;
                                }));
                            }

                            return dsCompany.filter(function (v) {
                                return row.data.companyId === v.companyId || ds.indexOf(v.companyId) < 0;
                            });
                        }

                        return dsCompany;
                    },
                    valueExpr: 'companyId',
                    displayExpr: 'companyName',
                },
            });
        });
    });
</script>

</html>
