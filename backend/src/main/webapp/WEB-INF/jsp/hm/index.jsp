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
                            <h3 class="h3">HOME</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap">
                            <div class="row-box-title bottom-0"><i class="xi-play-circle"></i>怨듭??ы빆</div>
                            <div class="row-box1">
                                <div id="dataGridNotice" data-sitebuilder="dxDataGrid"></div>
                            </div>
                        </div>

                        <%--                        <div class="row-wrap">--%>
                        <%--                            <div class="row-box-title bottom-0"><i class="xi-play-circle"></i>寃吏꾪빆紐??뺤씤</div>--%>
                        <%--                            <div class="row-box1">--%>
                        <%--                                <div id="dataGridCheckupType" data-sitebuilder="dxDataGrid"></div>--%>
                        <%--                                <div id="popupReview" data-sitebuilder="dxPopup"></div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <div class="row-wrap">
                            <div class="row-box-title bottom-0"><i class="xi-play-circle"></i>湲곗뾽泥?寃吏꾧린媛?/div>
                            <div class="row-box1">
                                <div id="dataGridCheckupDate" data-sitebuilder="dxDataGrid"></div>
                            </div>
                        </div>

                        <div class="row btn_area index_btn_area footer-btn">
                            <div class="col-lg-4" id="btnNew" data-sitebuilder="dxButton"></div>
                            <div class="col-lg-4" id="btnCancel" data-sitebuilder="dxButton"></div>
                            <%--                    </div>--%>
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
        let dxInstances = sitebuilder.createDx(false);

        //怨듭??ы빆
        dxInstances.dataGridNotice.option({
            dataSource: {
                load: function () {
                    return $.ajax({
                        url: '<c:url value="/hm/commune/notice"/>',
                    });
                }
            },
            columns: [{
                caption: '?쒕쾲',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    if (cellInfo.data.topList === true) {
                        cellElement.append('<i class="fa fa-thumbtack"></i>');
                    } else {
                        cellElement.text(cellInfo.row.rowIndex + 1);
                    }
                },
            }, {
                dataField: 'targetName',
                caption: '???,
                alignment: 'center',
            }, {
                dataField: 'title',
                caption: '?쒕ぉ',
                cellTemplate: function (cellElement, cellInfo) {
                    let noticeId = cellInfo.row.data.noticeId;
                    if (cellInfo.data.attachUrl) {
                        cellElement.append('<a href="<c:url value="/hm/commune/notice"/>/' + noticeId + '">' + cellInfo.text + '</a>');
                        cellElement.append('<i class="xi-diskette"></i>');
                    } else {
                        cellElement.append('<a href="<c:url value="/hm/commune/notice"/>/' + noticeId + '">' + cellInfo.text + '</a>');
                    }
                },
            }, {
                dataField: 'writedUserName',
                caption: '?묒꽦??,
                alignment: 'center',
            }, {
                dataField: 'writedAt',
                caption: '?묒꽦?쇱옄',
                alignment: 'center',
                dataType: 'date',
            }],
        });

        //寃吏꾪빆紐??뺤씤
        <%--dxInstances.dataGridCheckupType.option({--%>
        <%--    paging: {--%>
        <%--        enabled: true,--%>
        <%--        pageSize: 5--%>
        <%--    },--%>
        <%--    columns: [{--%>
        <%--        caption: '?쒕쾲',--%>
        <%--        alignment: 'center',--%>
        <%--        cellTemplate: function (cellElement, cellInfo) {--%>
        <%--            if (cellInfo.data.topList === true) {--%>
        <%--                cellElement.append('<i class="fa fa-thumbtack"></i>');--%>
        <%--            } else {--%>
        <%--                cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);--%>
        <%--            }--%>
        <%--        },--%>
        <%--    }, {--%>
        <%--        //湲곗뾽泥대챸--%>
        <%--        dataField: 'companyName',--%>
        <%--        caption: '湲곗뾽泥대챸',--%>
        <%--        alignment: 'center',--%>
        <%--    }, {--%>
        <%--        //湲곗뾽泥?寃吏꾩쑀??-%>
        <%--        dataField: 'companyCheckupTypeName',--%>
        <%--        caption: '寃吏꾩쑀??,--%>
        <%--        alignment: 'center',--%>
        <%--        cellTemplate: function (cellElement, cellInfo) {--%>
        <%--            cellElement.append("<a href = " + '<c:url value="/hm/contract-checkup"/>/' + cellInfo.data.checkupContractSubTypeId + ">" + cellInfo.data.companyCheckupTypeCode + '.' + cellInfo.data.companyCheckupTypeName + ' - ' + cellInfo.data.subTypeName + "</a>");--%>
        <%--        }--%>
        <%--    }, {--%>
        <%--        //寃吏꾪빆紐??깅줉??蹂묒썝留ㅻ땲?? 蹂쇳겕留ㅻ땲??)--%>
        <%--        dataField: 'registeredUserName',--%>
        <%--        caption: '?깅줉??,--%>
        <%--        alignment: 'center',--%>
        <%--        cellTemplate: function (cellElement, cellInfo) {--%>
        <%--            if (cellInfo.data.checkupContractReviews) {--%>
        <%--                cellElement.text(cellInfo.data.checkupContractReviews[0].registeredUserName);--%>
        <%--            }--%>
        <%--        }--%>
        <%--    }, {--%>
        <%--        //寃吏꾪빆紐??깅줉??create_at? ?쒗쁽?섎㈃ ?덈릺?덇퉴 ?대뼡嫄몃줈 ?좎? 留먯??쒕━湲?--%>
        <%--        dataField: 'registeredAt',--%>
        <%--        caption: '?깅줉??,--%>
        <%--        alignment: 'center',--%>
        <%--        dataType: 'date',--%>
        <%--    }, {--%>
        <%--        //??ぉ 由щ럭 ?곸꽭蹂닿린--%>
        <%--        type: 'buttons',--%>
        <%--        caption: '由щ럭議고쉶쨌?묒꽦',--%>
        <%--        buttons: [{--%>
        <%--            name: 'detail',--%>
        <%--            text: '由щ럭議고쉶쨌?묒꽦',--%>
        <%--            onClick: function (e) {--%>
        <%--                let popupList = [];--%>
        <%--                let gridData;--%>
        <%--                if (e.row.data.checkupContractReviews[0].review != null) {--%>
        <%--                    popupList = e.row.data.checkupContractReviews;--%>
        <%--                }--%>
        <%--                dxInstances.popupReview.show();--%>
        <%--                dxInstances.popupReview.option({--%>
        <%--                    title: "由щ럭 ?섍껄 議고쉶/?묒꽦",--%>
        <%--                    closeOnOutsideClick: true,--%>
        <%--                    width: 1500,--%>
        <%--                    height: 500,--%>
        <%--                    scrolling: {columnRenderingMode: "virtual"},--%>
        <%--                    contentTemplate: function (contentElement) {--%>
        <%--                        contentElement.append('<div style="font-weight: bold; color: #2ea3aa">由щ럭 ?섍껄 議고쉶</div>');--%>
        <%--                        contentElement.append($("<div id='popupGrid'/>").dxDataGrid({--%>
        <%--                            editing: {--%>
        <%--                                mode: "row",--%>
        <%--                                allowAdding: true--%>
        <%--                            },--%>
        <%--                            onToolbarPreparing: function (e) {--%>
        <%--                                e.toolbarOptions.visible = true;--%>
        <%--                            },--%>
        <%--                            pager: {--%>
        <%--                                visible: true,--%>
        <%--                                allowedPageSizes: 'all',--%>
        <%--                                showPageSizeSelector: false,--%>
        <%--                                showInfo: true,--%>
        <%--                                showNavigationButtons: false--%>
        <%--                            },--%>
        <%--                            paging: {--%>
        <%--                                enabled: false--%>
        <%--                            },--%>
        <%--                            rowAlternationEnabled: true,--%>
        <%--                            scrolling: {columnRenderingMode: "virtual"},--%>
        <%--                            dataSource: popupList,--%>
        <%--                            columns: [{--%>
        <%--                                caption: "?쒕쾲",--%>
        <%--                                alignment: 'center',--%>
        <%--                                allowEditing: false,--%>
        <%--                                width: 80,--%>
        <%--                                cellTemplate: function (cellElement, cellInfo) {--%>
        <%--                                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);--%>
        <%--                                },--%>
        <%--                            }, {--%>
        <%--                                dataField: "registeredUserName",--%>
        <%--                                caption: "??ぉ ?깅줉??,--%>
        <%--                                alignment: 'center',--%>
        <%--                                allowEditing: false,--%>
        <%--                                width: 100,--%>
        <%--                            }, {--%>
        <%--                                dataField: "writedUserName",--%>
        <%--                                caption: "?묒꽦??,--%>
        <%--                                alignment: 'center',--%>
        <%--                                allowEditing: false,--%>
        <%--                                width: 100,--%>
        <%--                            }, {--%>
        <%--                                dataField: "writedAt",--%>
        <%--                                caption: "?묒꽦?쇱옄",--%>
        <%--                                alignment: 'center',--%>
        <%--                                dataType: "date",--%>
        <%--                                allowEditing: false,--%>
        <%--                                width: 100,--%>
        <%--                            }, {--%>
        <%--                                dataField: "review",--%>
        <%--                                caption: "?섍껄",--%>
        <%--                                alignment: 'center',--%>
        <%--                            }],--%>
        <%--                            onSaved: function (event) {--%>
        <%--                                let data = {};--%>
        <%--                                data.review = event.changes[0].data.review--%>
        <%--                                gridData = event.changes[0].data.review--%>
        <%--                                console.log(gridData)--%>
        <%--                                data.checkupContractSubTypeId = e.row.data.checkupContractSubTypeId;--%>
        <%--                                $.ajax({--%>
        <%--                                    url: '<c:url value="/hm/contract-review"/>',--%>
        <%--                                    method: 'POST',--%>
        <%--                                    data: JSON.stringify(data),--%>
        <%--                                }).then(function () {--%>
        <%--                                    sitebuilder.notify("??λ릺?덉뒿?덈떎.");--%>
        <%--                                    location.reload();--%>
        <%--                                });--%>
        <%--                                dxInstances.popupReview.hide();--%>
        <%--                            },--%>
        <%--                        }));--%>
        <%--                        contentElement.append($("<div />").dxButton({--%>
        <%--                            text: '??ν븯湲?,--%>
        <%--                            onClick: function (event) {--%>
        <%--                                $('.dx-link-save').trigger('click');--%>
        <%--                            },--%>
        <%--                        }));--%>
        <%--                        contentElement.append($("<div />").dxButton({--%>
        <%--                            text: '?댁긽?놁쓬',--%>
        <%--                            onClick: function () {--%>
        <%--                                let data = e.row.data;--%>
        <%--                                data._crudType = 'UPDATE';--%>
        <%--                                data.confirmedCheck = false;--%>
        <%--                                let ajaxCheckupSave = $.ajax({--%>
        <%--                                    url: '<c:url value="/hm/contract-checkup"/>',--%>
        <%--                                    method: 'POST',--%>
        <%--                                    data: JSON.stringify(data),--%>
        <%--                                });--%>

        <%--                                $.when(ajaxCheckupSave).then(function () {--%>
        <%--                                    sitebuilder.notify("??λ릺?덉뒿?덈떎.");--%>
        <%--                                    &lt;%&ndash;location.href = '<c:url value="/hm/contract-checkup"/>';&ndash;%&gt;--%>
        <%--                                    location.reload();--%>
        <%--                                });--%>
        <%--                            },--%>
        <%--                        }));--%>
        <%--                        return contentElement;--%>
        <%--                    },--%>
        <%--                });--%>
        <%--            },--%>
        <%--        }]--%>
        <%--    }],--%>
        <%--});--%>

        // dxInstances.checkupYear.option({
        //     dataSource: sitebuilder.typeDef.Year,
        //     value: new Date().getFullYear(),
        //     onValueChanged: LoadContractCheckupList,
        // });

        <%--function LoadContractCheckupList() {--%>
        <%--    // Load--%>
        <%--    let ajaxTypeList = {--%>
        <%--        url: '<c:url value="/hm/contract-checkupindex"/>',--%>
        <%--    };--%>

        <%--    $.when($.ajax(ajaxTypeList)).then(function (resultList) {--%>
        <%--        // console.log(resultList, '寃吏꾪빆紐?);--%>
        <%--        dxInstances.dataGridCheckupType.option({--%>
        <%--            dataSource: resultList.data,--%>
        <%--        });--%>
        <%--    });--%>
        <%--}--%>

        // LoadContractCheckupList();

        //湲곗뾽泥?寃吏꾧린媛?        dxInstances.dataGridCheckupDate.option({
            columns: [{
                caption: '?쒕쾲',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.row.rowIndex + 1);
                },
            }, {
                //湲곗뾽泥대챸
                dataField: 'companyName',
                caption: '湲곗뾽泥대챸',
                alignment: 'center',
            }, {
                //湲곗뾽泥?寃吏꾧린媛??쒖옉??                dataField: 'checkupDateBegin',
                caption: '寃吏꾩떆?묒씪',
                alignment: 'center',
                dataType: 'date',
            }, {
                //湲곗뾽泥?寃吏꾧린媛?醫낅즺??                dataField: 'checkupDateEnd',
                caption: '寃吏꾩쥌猷뚯씪',
                alignment: 'center',
                dataType: 'date',
            }, {
                //湲곗뾽泥??덉빟媛???쒖옉??                dataField: 'reserveDateBegin',
                caption: '?덉빟?쒖옉??,
                alignment: 'center',
                dataType: 'date',
            }, {
                //湲곗뾽泥??덉빟媛??醫낅즺??                dataField: 'reserveDateEnd',
                caption: '?덉빟醫낅즺??,
                alignment: 'center',
                dataType: 'date',
            },],
        });

        dxInstances.btnNew.option({
            text: '?좉퇋 ?덉빟?좎껌',
            onClick: function () {
                location.href = '<c:url value="/hm/reserve"/>';
            },
        });

        dxInstances.btnCancel.option({
            text: '?덉빟痍⑥냼',
            onClick: function () {
                location.href = '<c:url value="/hm/cancel-reserve"/>';
            },
        });

        // Load
        let ajaxCompany = {
            url: '<c:url value="/hm/checkupDate"/>',
            method: 'GET',
        };

        $.when($.ajax(ajaxCompany)).then(function (responseCompany) {
            console.log(responseCompany.data);
            dxInstances.dataGridCheckupDate.option({
                dataSource: responseCompany.data,
            });
        });
    });
</script>
</html>
