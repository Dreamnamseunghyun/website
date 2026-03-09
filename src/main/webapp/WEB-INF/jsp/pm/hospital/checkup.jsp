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
                            <h3 class="h3">추가검사 수가 등록</h3>
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
                                            <div class="col-lg-4 tag-name"><span>병원명</span></div>
                                            <div class="col-lg-8 period">
                                                <div class="col-lg-12" id="hospitalName"
                                                     data-ggsj="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>대상년도</span></div>
                                            <div class="col-lg-8 row period">
                                                <div class="col-lg-12" id="checkupYear" data-ggsj="dxTextBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12"><div id="btnSame" data-ggsj="dxButton"></div></div>
                                        </div>
                                    </div>
                                </div>



                            </div>



                            <div class="row-wrap right">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12"><div id="searchGrid" data-ggsj="dxTextBox"></div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!-- header -->

                        <div id="treeListHospitalCheckup" data-ggsj="dxTreeList"></div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"><i class="xi-save"></i>저장</div>
                            <div class="col-lg-1" id="btnList" data-ggsj="dxButton">목록</div>
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
        ggsj.openMenu('hospital');

        let dxInstances = ggsj.createDx(false);

        dxInstances.hospitalName.option({
            readOnly: true,
        });

        dxInstances.checkupYear.option({
            readOnly: true,
        });

        dxInstances.btnSame.option({
            stylingMode: 'contained',
            type: 'normal',
            text: '전 년도 동일 적용',
            onClick: function () {
                if (confirm('경고! 모든정보가 덮어씌어 집니다. 복사하시겠습니까?') !== true) {
                    alert('취소하였습니다.');
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
                    ggsj.notify("복사되었습니다.");

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
                caption: '분류코드',
                dataField: 'code',
                allowEditing: false,
            }, {
                caption: '분류명',
                dataField: 'name',
                allowEditing: false,
            }, {
                caption: '검사 수가(원)',
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
                ggsj.valuesToDx(response.data);

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
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.treeListHospitalCheckup.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '저장',
            type: 'success',
            onClick: function () {
                let data = ggsj.dxToValues();
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
                    //location.href = '<c:url value="/pm/hospital"/>'; // refresh 가 맞지 않을까?
                    ggsj.notify("저장되었습니다.");

                    LoadHospitalCheckupList();
                });
            }
        });

        LoadHospitalCheckupList();
    });
</script>
</html>
