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
                            <h3 class="h3">?Œë¦¼??ê´€ë¦?/h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <%-- checkup type dataGrid --%>
                        <div class="row">
                            <div class="col-lg-3" id="btnCheckupInfo" data-sitebuilder="dxButton"></div>
                            <div class="col-lg-3" id="btnReserve" data-sitebuilder="dxButton"></div>
                            <div class="col-lg-3" id="btnEncouragement" data-sitebuilder="dxButton"></div>
                            <div class="col-lg-3" id="btnNoneReserve" data-sitebuilder="dxButton"></div>
                        </div>
                        <div class="row">
                            <div id="dxGridExceptList" data-sitebuilder="dxDataGrid"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12" id="contents" data-sitebuilder="dxTextArea"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2" id="btnNoneReserveLink" data-sitebuilder="dxButton"></div>
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
        sitebuilder.openMenu('notitokinfo');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.btnCheckupInfo.option({
            text: 'ê²€ì§„ì‹¤???ˆë‚´',
            onClick: function () {
                location.href = '<c:url value="/pm/notitokinfo"/>';
            }
        });
        dxInstances.btnReserve.option({
            text: '?ˆì•½',
            onClick: function () {
                location.href = '<c:url value="/pm/notitokreserve"/>';
            }
        });
        dxInstances.btnEncouragement.option({
            text: '?…ë ¤',
            onClick: function () {
                location.href = '<c:url value="/pm/notitokencouragement"/>';
            }
        });
        dxInstances.btnNoneReserve.option({
            text: 'ë¯¸ì˜ˆ?½ì ê´€ë¦?,
            onClick: function () {
                location.href = '<c:url value="/pm/notitoknonereserve"/>';
            }
        });

        dxInstances.contents.option({
            height: 300,
            value: '?¤ëŠ˜?€ ê±´ê°•ê²€ì§??ˆì•½???˜ê³  ?¶ì–´ì§€??? ì…?ˆë‹¤ ??  ì§€ê¸?ê¼??ˆì•½ ë¶€?ë“œë¦½ë‹ˆ??' + '\n' +
                    '???¹ì‚¬?´íŠ¸ : https://www.sitebuilder.co.kr' + '\n' +
                    '??ê¸°ì—…ì²?ì½”ë“œ : ??01001?? + '\n' +
                    '??ID, PW : ?ˆì•½ ?Œë«???”ë©´?ì„œ ?ˆë‚´' + '\n' +
                    '???ˆì•½ê°€?¥ê¸°ê°?: ??021-00-00~2021-00-00?? + '\n' +
                    '???¬í„¸?¬ì´?¸ì—??"ê±´ê°•?´ì"ë¥?ê²€?‰í•˜?”ë„ ?‘ì†??ê°€?¥í•©?ˆë‹¤.' + '\n' +
                    '??ê±´ê°•?´ì ??566-7527 ??,
            readOnly: true,
        });

        dxInstances.btnNoneReserveLink.option({
            text: 'ë¯¸ì˜ˆ?½ì ê´€ë¦?ë°”ë¡œê°€ê¸?,
        });

        dxInstances.dxGridExceptList.option({
            export: {
                enabled: false
            },
            dataSource: [],
            columnAutoWidth: true,
            allowColumnReordering: true,
            columns: [{
                caption: '?œë²ˆ',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                caption: 'ë°œì†¡??,
                dataField: 'sendDate',
            }, {
                dataField: 'companyName',
                caption: 'ê¸°ì—…ì²´ëª…',
            }, {
                dataField: 'totalSend',
                caption: 'ë°œì†¡ê±´ìˆ˜',
                format: {
                    type: "fixedPoint",
                }
            }, {
                dataField: 'totalSuccess',
                caption: '?±ê³µê±´ìˆ˜',
                format: {
                    type: "fixedPoint",
                }
            }],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: 'ë¯¸ì˜ˆ?½ì ê´€ë¦?ë°œì†¡ ëª©ë¡',
                });
            },
        });
    });
</script>
</html>
