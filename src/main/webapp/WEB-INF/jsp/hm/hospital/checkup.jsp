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
                            <h3 class="h3">異붽?寃???섍? ?깅줉</h3>
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
                                            <div class="col-lg-4 tag-name"><span>蹂묒썝紐?/span></div>
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
                                            <div class="col-lg-4 tag-name"><span>??곷뀈??/span></div>
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
                            <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"><i class="xi-save"></i>???/div>
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">紐⑸줉</div>
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
        sitebuilder.openMenu('hospital-checkup');

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
            text: '???꾨룄 ?숈씪 ?곸슜',
        });

        dxInstances.searchGrid.option({
            placeholder: '寃??,
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.treeListHospitalCheckup.searchByText(e.value);
            },
            mode: 'search'
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
                caption: '遺꾨쪟肄붾뱶',
                dataField: 'code',
                allowEditing: false,
            }, {
                caption: '遺꾨쪟紐?,
                dataField: 'name',
                allowEditing: false,
            }, {
                caption: '寃???섍?(??',
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
                url: '<c:url value="/hm/hospital/0/checkup/2022"/>',
                method: 'GET',
            }).then(function (response) {
                console.log(response);
                sitebuilder.valuesToDx(response.data);

                dxInstances.treeListHospitalCheckup.option({
                    dataSource: response.data.hospitalCheckupItems,
                });

                dxInstances.treeListHospitalCheckup.cancelEditData();
            });

            dxInstances.btnList.option({
                stylingMode: 'contained',
                onClick: function () {
                    location.href = '<c:url value="/hm/hospital"/>';
                }
            });
        }

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '???,
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
                    url: '<c:url value="/hm/hospital/0/checkup/2021"/>',
                    method: 'POST',
                    data: JSON.stringify(data),
                }).then(function () {
                    //location.href = '<c:url value="/hm/hospital"/>'; // refresh 媛 留욎? ?딆쓣源?
                    sitebuilder.notify("??λ릺?덉뒿?덈떎.");

                    LoadHospitalCheckupList();
                });
            }
        });

        LoadHospitalCheckupList();
    });
</script>
</html>
