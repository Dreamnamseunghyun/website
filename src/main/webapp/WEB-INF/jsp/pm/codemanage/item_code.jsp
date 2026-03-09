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
                            <h3 class="h3">항목 코드 관리</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">

                            <div class="row-wrap right">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12" id="searchGrid" data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- Header -->

                        <div id="treeListItemCode" class="main_table" data-ggsj="dxTreeList">
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"><i class="xi-save"></i>저장</div>
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
        ggsj.openMenu('item-code');

        let dxInstances = ggsj.createDx();

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.treeListItemCode.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.treeListItemCode.option({
            editing: {
                mode: "batch",
                allowAdding: true,
                allowUpdating: true,
                allowDeleting: true,
                startEditAction: "click"
            },
            keyExpr: 'keyId',
            parentIdExpr: 'keyParentId',
            columns: [{
                caption: '항목코드',
                dataField: 'code',
                width: 200,
                validationRules: [{type: 'required'}],
            }, {
                caption: '항목명',
                dataField: 'name',
                // width: 220,
                validationRules: [{type: 'required'}],
            }, {
                caption: '검사 설명',
                dataField: 'itemDesc',
                width: 400,
            }, {
                caption: '사용여부',
                dataField: 'noUse',
                alignment: 'center',
                width: 100,
                lookup: {
                    dataSource: [
                        {id: false, text: 'Y'},
                        {id: true, text: 'N'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                caption: '참고치(남) 또는 공통',
                alignment: 'center',
                columns: [{
                    caption: '최저',
                    dataField: 'refMmin',
                    alignment: 'center',
                    width: 60,
                }, {
                    caption: '최고',
                    dataField: 'refMmax',
                    alignment: 'center',
                    width: 60,
                }]
            }, {
                caption: '참고치(여)',
                alignment: 'center',
                columns: [{
                    caption: '최저',
                    dataField: 'refFmin',
                    alignment: 'center',
                    width: 60,
                }, {
                    caption: '최고',
                    dataField: 'refFmax',
                    alignment: 'center',
                    width: 60,
                }]
            }, {
                caption: '단위',
                dataField: 'refUnit',
                alignment: 'center',
                // width: 100,
            }, {
                caption: '결과코드사용여부',
                dataField: 'resultUse',
                alignment: 'center',
                width: 110,
                lookup: {
                    dataSource: [
                        {id: false, text: 'N'},
                        {id: true, text: 'Y'},
                    ],
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }],

            onCellPrepared: function (e) {
                e.cellElement.children(".dx-link-delete").remove();
                if (e.row && e.row.level === 3) {
                    e.cellElement.children(".dx-link-add").remove();
                }
                if (e.rowType === 'header' && e.columnIndex === 10) {
                    e.cellElement.append('추가 / 삭제');
                    e.cellElement.css('font-weight', 'bold');
                }
            },

            onEditorPreparing: function (e) {
                if (e.parentType === 'dataRow') {
                    console.log(e.row);
                }

                if (e.parentType === 'dataRow' && e.dataField === 'itemDesc') {
                    e.editorOptions.disabled = e.row.data && e.row.data.itemType !== 'item';
                }
                if (e.parentType === 'dataRow' &&
                    e.dataField === 'noUse') {
                    e.editorOptions.disabled = e.row.data && e.row.data.itemType === 'category' || e.row.data.itemType === 'class' || e.row.node.parent.data.noUse === true && e.row.data.itemType === 'sub';
                }


                // e.editorOptions.onValueChanged = function(args) {
                //     if (args.value == true && e.row.data.itemType == 'item' && e.row.node.children.length !== 0) {
                //         if (e.parentType === 'dataRow' && e.dataField === 'noUse') {
                //             e.setValue(true);
                //         }
                //     }
                // }

                if (e.parentType === 'dataRow' &&
                    e.dataField === 'refMmin'
                    || e.dataField === 'refMmax'
                    || e.dataField === 'refFmin'
                    || e.dataField === 'refFmax'
                    || e.dataField === 'refUnit'
                    || e.dataField === 'resultUse') {
                    e.editorOptions.disabled = e.row.data && e.row.node.children.length !== 0 && e.row.data.itemType === 'item' || e.row.data.itemType === 'category' || e.row.data.itemType === 'class' || e.row.node.parent.data.noUse === true && e.row.data.itemType === 'sub';
                }
            },

            onInitNewRow: function (e) {
                let parent = null;
                if (!e.data.keyParentId) {
                    e.data.itemType = 'class';
                    return;
                } else {
                    parent = e.component.getNodeByKey(e.data.keyParentId);
                }

                if (parent) {
                    e.data.parentId = parent.data.id;
                    if (parent.data.itemType === 'class') {
                        e.data.itemType = 'category';
                    } else if (parent.data.itemType === 'category') {
                        e.data.itemType = 'item';
                    } else if (parent.data.itemType === 'item') {
                        e.data.itemType = 'sub';
                    }
                }
            },

            onToolbarPreparing: function (e) {
                // Grid Title
                // e.toolbarOptions.items.unshift({
                //     location: 'before',
                //     text: '기업 검진 유형',
                // });

                // Modifies an existing item
                let toolbarItems = e.toolbarOptions.items;
                toolbarItems.forEach(function (item) {
                    if (item.name === "saveButton") {
                        item.visible = false;
                    }
                });
            },
        });

        dxInstances.btnSave.option({
            stylingMode: "contained",
            text: "저장",
            type: "success",
            onClick: function () {
                let changes = dxInstances.treeListItemCode.option('editing.changes');
                let gridData = changes.map(function (v) {
                    if (v.type !== 'insert') {
                        let rowData = dxInstances.treeListItemCode.getNodeByKey(v.key).data;
                        v.data = $.extend(true, {}, rowData, v.data);
                    }
                    v.data._crudType = v.type.toUpperCase();
                    return v.data;
                });

                $.ajax({
                    url: '<c:url value="/pm/item-code"/>',
                    method: 'POST',
                    data: JSON.stringify(gridData),
                }).then(function () {
                    ggsj.notify("저장되었습니다.");

                    //dxInstances.treeListItemCode.cancelEditData();

                    location.reload();
                });
            }
        });

        // Load
        let ajaxItem = $.ajax({
            url: '<c:url value="/pm/item-code"/>',
            method: 'GET',
        });

        $.when(ajaxItem).then(function (resultItem) {
            // Item List
            dxInstances.treeListItemCode.option({
                dataSource: resultItem.data,
            });
            dxInstances.treeListItemCode.cancelEditData();
        });
    });
</script>
</html>
