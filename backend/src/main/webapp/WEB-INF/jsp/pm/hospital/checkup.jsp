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
                            <h3 class="h3">Ï∂îÍ?Í≤Ä???òÍ? ?±Î°ù</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap row-wrap2 btn-row-wrap">
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>Î≥ëÏõêÎ™?/span></div>
                                            <div class="col-lg-8 period">
                                                <div class="col-lg-12" id="hospitalName"
                                                     data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>?Ä?ÅÎÖÑ??/span></div>
                                            <div class="col-lg-8 row period">
                                                <div class="col-lg-12" id="checkupYear" data-sitebuilder="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12"><div id="btnSame" data-sitebuilder="dxButton"></div></div>
                                        </div>
                                    </div>
                                </div>



                            </div>



                            <div class="row-wrap right">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12"><div id="searchGrid" data-sitebuilder="dxTextBox"></div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!-- header -->

                        <div id="treeListHospitalCheckup" data-sitebuilder="dxTreeList"></div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>?Ä??/div>
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">Î™©Î°ù</div>
                        </div>
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
        sitebuilder.openMenu('hospital');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.hospitalName.option({
            readOnly: true,
        });

        dxInstances.checkupYear.option({
            readOnly: true,
        });

        dxInstances.btnSame.option({
            stylingMode: 'contained',
            type: 'normal',
            text: '???ÑÎèÑ ?ôÏùº ?ÅÏö©',
            onClick: function () {
                if (confirm('Í≤ΩÍ≥†! Î™®Îì†?ïÎ≥¥Í∞Ä ??ñ¥?åÏñ¥ ÏßëÎãà?? Î≥µÏÇ¨?òÏãúÍ≤†Ïäµ?àÍπå?') !== true) {
                    alert('Ï∑®ÏÜå?òÏ??µÎãà??');
                    return;
                }

                $.ajax({
                    url: '<c:url value="/pm/hospital/${hospitalId}/checkup/${checkupYear}/copy"/>',
                    method: 'POST',
                    data: {
                        hospitalId: ${hospitalId},
                        checkupYear: ${checkupYear},
                    },
                }).then(function () {
                    sitebuilder.notify("Î≥µÏÇ¨?òÏóà?µÎãà??");

                    LoadHospitalCheckupList();
                });
            }
        });

        dxInstances.treeListHospitalCheckup.option({
            keyExpr: 'keyId',
            parentIdExpr: 'keyParentId',
            onToolbarPreparing: function (e) {
                e.toolbarOptions.visible = false;
            },
            editing: {
                mode: 'batch',
                allowAdding: false,
                allowUpdating: true,
                allowDeleting: false,
                selectTextOnEditStart: true,
                startEditAction: "click"
            },
            searchPanel: {visible: false},
            columns: [{
                caption: 'Î∂ÑÎ•òÏΩîÎìú',
                dataField: 'code',
                allowEditing: false,
            }, {
                caption: 'Î∂ÑÎ•òÎ™?,
                dataField: 'name',
                allowEditing: false,
            }, {
                caption: 'Í≤Ä???òÍ?(??',
                dataField: 'bill',
                dataType: 'number',
                allowEditing: true,
            }],
            onEditorPreparing: function (e) {
                if (e.parentType === 'dataRow' && e.dataField === 'bill') {
                    e.editorOptions.disabled = e.row.data && e.row.data.itemType !== 'item';
                }
            },
        });

        function LoadHospitalCheckupList() {
            $.ajax({
                url: '<c:url value="/pm/hospital/${hospitalId}/checkup/${checkupYear}"/>',
                method: 'GET',
            }).then(function (response) {
                sitebuilder.valuesToDx(response.data);

                dxInstances.treeListHospitalCheckup.option({
                    dataSource: response.data.hospitalCheckupItems,
                });

                dxInstances.treeListHospitalCheckup.cancelEditData();
            });

            dxInstances.btnList.option({
                stylingMode: 'contained',
                onClick: function () {
                    location.href = '<c:url value="/pm/hospital"/>';
                }
            });
        }

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.treeListHospitalCheckup.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '?Ä??,
            type: 'success',
            onClick: function () {
                let data = sitebuilder.dxToValues();
                let gridData = dxInstances.treeListHospitalCheckup.option('editing.changes').map(function (v) {
                    v.data._crudType = 'INSERT';
                    v.data.id = v.key;
                    return v.data;
                });

                //console.log(dxInstances.treeListHospitalCheckup.option('editing.changes'));
                //console.log(gridData);

                data.hospitalCheckupItems = gridData;

                $.ajax({
                    url: '<c:url value="/pm/hospital/${hospitalId}/checkup/${checkupYear}"/>',
                    method: 'POST',
                    data: JSON.stringify(data),
                }).then(function () {
                    //location.href = '<c:url value="/pm/hospital"/>'; // refresh Í∞Ä ÎßûÏ? ?äÏùÑÍπ?
                    sitebuilder.notify("?Ä?•Îêò?àÏäµ?àÎã§.");

                    LoadHospitalCheckupList();
                });
            }
        });

        LoadHospitalCheckupList();
    });
</script>
</html>
