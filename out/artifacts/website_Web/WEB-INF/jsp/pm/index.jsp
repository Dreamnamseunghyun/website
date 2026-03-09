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
                            <h3 class="h3">PLATFORM HOME</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap left">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-5 tag-name"><span>Íµ¨Î∂Ñ</span></div>
                                            <div class="col-lg-7" id="selectStatus" data-sitebuilder="dxSelectBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row-wrap right">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12" id="searchGrid" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Header -->

                        <div id="dataGridHome" class="main_table" data-sitebuilder="dxDataGrid">
                        </div>
                        <!--
                                                <div class="row">&nbsp</div>

                                                <div class="row" style="height: 45vh">
                                                    <div class="col-lg-4"></div>
                                                    <div class="col-lg-2">?àÌôîÎ©?Ï∂îÍ?Íµ¨ÏÑ± ?ºÏùò ?ÑÏöî</div>
                                                </div>
                                                -->

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
        /** @param dxInstances : {selectStatus,dataGridHome} */
        let dxInstances = sitebuilder.createDx(false);

        dxInstances.selectStatus.option({
            dataSource: [
                {id: 'ALL', text: '?ÑÏ≤¥'},
                {id: 'US', text: '?åÏõê'},
                {id: 'CM', text: 'Í∏∞ÏóÖ'},
                {id: 'HM', text: 'Î≥ëÏõê'},
                {id: 'PM', text: '?¥Î?'},
            ],
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function (data) {
                if (data.value === 'ALL')
                    dxInstances.dataGridHome.clearFilter();
                else
                    dxInstances.dataGridHome.filter(['group', '=', data.value]);
            }
        });

        dxInstances.searchGrid.option({
            placeholder: 'Í≤Ä??,
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridHome.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridHome.option({
            columns: [{
                caption: '?úÎ≤à',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.topList === true) {
                        cellElement.append('<i class="fa fa-thumbtack"></i>');
                    } else {
                        cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                    }
                },
            }, {
                dataField: 'group',
                caption: 'Íµ¨Î∂Ñ',
                alignment: 'center',
                lookup: {
                    dataSource: sitebuilder.typeDef.userType,
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                dataField: 'title',
                caption: '?úÎ™©',
                cellTemplate: function (cellElement, cellInfo) {
                    let noticeId = cellInfo.row.data.noticeId;
                    if (cellInfo.data.attachUrl) {
                        cellElement.append('<a href="<c:url value="/pm/commune/notice"/>/' + noticeId + '">' + cellInfo.text + '</a>');
                        cellElement.append('<i class="xi-diskette"></i>');
                    } else {
                        cellElement.append('<a href="<c:url value="/pm/commune/notice"/>/' + noticeId + '">' + cellInfo.text + '</a>');
                    }
                },
            }, {
                dataField: 'writedUserName',
                caption: '?ëÏÑ±??,
                alignment: 'center',
            }, {
                dataField: 'writedAt',
                caption: '?ëÏÑ±??,
                alignment: 'center',
                dataType: 'date',
            }, {
                type: 'buttons',
                caption: '?ÅÏÑ∏',
                alignment: 'center',
                buttons: [{
                    text: '?òÏ†ï',
                    onClick: function (e) {
                        let notice_id = e.row.data;
                        location.href = '<c:url value="/pm/commune/notice"/>/' + notice_id.noticeId + '/edit';
                    }
                }]
            }, {
                type: 'buttons',
                caption: '??†ú',
                alignment: 'center',
                buttons: [{
                    text: '??†ú',
                    onClick: function (e) {
                        if (confirm('?ïÎßêÎ°???†ú?òÏãúÍ≤†Ïäµ?àÍπå?')) {
                            let notice_id = e.row.data;
                            $.ajax({
                                url: '<c:url value="/pm/commune/notice"/>/' + notice_id.noticeId,
                                method: 'DELETE',
                            }).then(function () {
                                location.href = '<c:url value="/pm/commune/notice"/>';
                            });
                        }
                    }
                }]
            }],
        });

        // Load
        let ajaxHome = {
            url: '<c:url value="/pm/commune/notice"/>',
        }

        $.when($.ajax(ajaxHome)).then(function (responseHome) {
            // Company List
            dxInstances.dataGridHome.option({
                dataSource: responseHome.data,
            });

            dxInstances.selectStatus.option({
                value: 'PM',
            });
        });

    });
</script>
</html>
