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
                            <div class="row-box-title bottom-0"><i class="xi-play-circle"></i>공지사항</div>
                            <div class="row-box1">
                                <div id="dataGridNotice" data-ggsj="dxDataGrid"></div>
                            </div>
                        </div>

                        <%--                        <div class="row-wrap">--%>
                        <%--                            <div class="row-box-title bottom-0"><i class="xi-play-circle"></i>검진항목 확인</div>--%>
                        <%--                            <div class="row-box1">--%>
                        <%--                                <div id="dataGridCheckupType" data-ggsj="dxDataGrid"></div>--%>
                        <%--                                <div id="popupReview" data-ggsj="dxPopup"></div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>

                        <div class="row-wrap">
                            <div class="row-box-title bottom-0"><i class="xi-play-circle"></i>기업체 검진기간</div>
                            <div class="row-box1">
                                <div id="dataGridCheckupDate" data-ggsj="dxDataGrid"></div>
                            </div>
                        </div>

                        <div class="row btn_area index_btn_area footer-btn">
                            <div class="col-lg-4" id="btnNew" data-ggsj="dxButton"></div>
                            <div class="col-lg-4" id="btnCancel" data-ggsj="dxButton"></div>
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
        let dxInstances = ggsj.createDx(false);

        //공지사항
        dxInstances.dataGridNotice.option({
            dataSource: {
                load: function () {
                    return $.ajax({
                        url: '<c:url value="/hm/commune/notice"/>',
                    });
                }
            },
            columns: [{
                caption: '순번',
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
                caption: '대상',
                alignment: 'center',
            }, {
                dataField: 'title',
                caption: '제목',
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
                caption: '작성자',
                alignment: 'center',
            }, {
                dataField: 'writedAt',
                caption: '작성일자',
                alignment: 'center',
                dataType: 'date',
            }],
        });

        //검진항목 확인
        <%--dxInstances.dataGridCheckupType.option({--%>
        <%--    paging: {--%>
        <%--        enabled: true,--%>
        <%--        pageSize: 5--%>
        <%--    },--%>
        <%--    columns: [{--%>
        <%--        caption: '순번',--%>
        <%--        alignment: 'center',--%>
        <%--        cellTemplate: function (cellElement, cellInfo) {--%>
        <%--            if (cellInfo.data.topList === true) {--%>
        <%--                cellElement.append('<i class="fa fa-thumbtack"></i>');--%>
        <%--            } else {--%>
        <%--                cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);--%>
        <%--            }--%>
        <%--        },--%>
        <%--    }, {--%>
        <%--        //기업체명--%>
        <%--        dataField: 'companyName',--%>
        <%--        caption: '기업체명',--%>
        <%--        alignment: 'center',--%>
        <%--    }, {--%>
        <%--        //기업체 검진유형--%>
        <%--        dataField: 'companyCheckupTypeName',--%>
        <%--        caption: '검진유형',--%>
        <%--        alignment: 'center',--%>
        <%--        cellTemplate: function (cellElement, cellInfo) {--%>
        <%--            cellElement.append("<a href = " + '<c:url value="/hm/contract-checkup"/>/' + cellInfo.data.checkupContractSubTypeId + ">" + cellInfo.data.companyCheckupTypeCode + '.' + cellInfo.data.companyCheckupTypeName + ' - ' + cellInfo.data.subTypeName + "</a>");--%>
        <%--        }--%>
        <%--    }, {--%>
        <%--        //검진항목 등록자(병원매니저? 볼크매니저?)--%>
        <%--        dataField: 'registeredUserName',--%>
        <%--        caption: '등록자',--%>
        <%--        alignment: 'center',--%>
        <%--        cellTemplate: function (cellElement, cellInfo) {--%>
        <%--            if (cellInfo.data.checkupContractReviews) {--%>
        <%--                cellElement.text(cellInfo.data.checkupContractReviews[0].registeredUserName);--%>
        <%--            }--%>
        <%--        }--%>
        <%--    }, {--%>
        <%--        //검진항목 등록일(create_at은 표현하면 안되니까 어떤걸로 할지 말씀드리기)--%>
        <%--        dataField: 'registeredAt',--%>
        <%--        caption: '등록일',--%>
        <%--        alignment: 'center',--%>
        <%--        dataType: 'date',--%>
        <%--    }, {--%>
        <%--        //항목 리뷰 상세보기--%>
        <%--        type: 'buttons',--%>
        <%--        caption: '리뷰조회·작성',--%>
        <%--        buttons: [{--%>
        <%--            name: 'detail',--%>
        <%--            text: '리뷰조회·작성',--%>
        <%--            onClick: function (e) {--%>
        <%--                let popupList = [];--%>
        <%--                let gridData;--%>
        <%--                if (e.row.data.checkupContractReviews[0].review != null) {--%>
        <%--                    popupList = e.row.data.checkupContractReviews;--%>
        <%--                }--%>
        <%--                dxInstances.popupReview.show();--%>
        <%--                dxInstances.popupReview.option({--%>
        <%--                    title: "리뷰 의견 조회/작성",--%>
        <%--                    closeOnOutsideClick: true,--%>
        <%--                    width: 1500,--%>
        <%--                    height: 500,--%>
        <%--                    scrolling: {columnRenderingMode: "virtual"},--%>
        <%--                    contentTemplate: function (contentElement) {--%>
        <%--                        contentElement.append('<div style="font-weight: bold; color: #2ea3aa">리뷰 의견 조회</div>');--%>
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
        <%--                                caption: "순번",--%>
        <%--                                alignment: 'center',--%>
        <%--                                allowEditing: false,--%>
        <%--                                width: 80,--%>
        <%--                                cellTemplate: function (cellElement, cellInfo) {--%>
        <%--                                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);--%>
        <%--                                },--%>
        <%--                            }, {--%>
        <%--                                dataField: "registeredUserName",--%>
        <%--                                caption: "항목 등록자",--%>
        <%--                                alignment: 'center',--%>
        <%--                                allowEditing: false,--%>
        <%--                                width: 100,--%>
        <%--                            }, {--%>
        <%--                                dataField: "writedUserName",--%>
        <%--                                caption: "작성자",--%>
        <%--                                alignment: 'center',--%>
        <%--                                allowEditing: false,--%>
        <%--                                width: 100,--%>
        <%--                            }, {--%>
        <%--                                dataField: "writedAt",--%>
        <%--                                caption: "작성일자",--%>
        <%--                                alignment: 'center',--%>
        <%--                                dataType: "date",--%>
        <%--                                allowEditing: false,--%>
        <%--                                width: 100,--%>
        <%--                            }, {--%>
        <%--                                dataField: "review",--%>
        <%--                                caption: "의견",--%>
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
        <%--                                    ggsj.notify("저장되었습니다.");--%>
        <%--                                    location.reload();--%>
        <%--                                });--%>
        <%--                                dxInstances.popupReview.hide();--%>
        <%--                            },--%>
        <%--                        }));--%>
        <%--                        contentElement.append($("<div />").dxButton({--%>
        <%--                            text: '저장하기',--%>
        <%--                            onClick: function (event) {--%>
        <%--                                $('.dx-link-save').trigger('click');--%>
        <%--                            },--%>
        <%--                        }));--%>
        <%--                        contentElement.append($("<div />").dxButton({--%>
        <%--                            text: '이상없음',--%>
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
        <%--                                    ggsj.notify("저장되었습니다.");--%>
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
        //     dataSource: ggsj.typeDef.Year,
        //     value: new Date().getFullYear(),
        //     onValueChanged: LoadContractCheckupList,
        // });

        <%--function LoadContractCheckupList() {--%>
        <%--    // Load--%>
        <%--    let ajaxTypeList = {--%>
        <%--        url: '<c:url value="/hm/contract-checkupindex"/>',--%>
        <%--    };--%>

        <%--    $.when($.ajax(ajaxTypeList)).then(function (resultList) {--%>
        <%--        // console.log(resultList, '검진항목');--%>
        <%--        dxInstances.dataGridCheckupType.option({--%>
        <%--            dataSource: resultList.data,--%>
        <%--        });--%>
        <%--    });--%>
        <%--}--%>

        // LoadContractCheckupList();

        //기업체 검진기간
        dxInstances.dataGridCheckupDate.option({
            columns: [{
                caption: '순번',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.row.rowIndex + 1);
                },
            }, {
                //기업체명
                dataField: 'companyName',
                caption: '기업체명',
                alignment: 'center',
            }, {
                //기업체 검진기간 시작일
                dataField: 'checkupDateBegin',
                caption: '검진시작일',
                alignment: 'center',
                dataType: 'date',
            }, {
                //기업체 검진기간 종료일
                dataField: 'checkupDateEnd',
                caption: '검진종료일',
                alignment: 'center',
                dataType: 'date',
            }, {
                //기업체 예약가능 시작일
                dataField: 'reserveDateBegin',
                caption: '예약시작일',
                alignment: 'center',
                dataType: 'date',
            }, {
                //기업체 예약가능 종료일
                dataField: 'reserveDateEnd',
                caption: '예약종료일',
                alignment: 'center',
                dataType: 'date',
            },],
        });

        dxInstances.btnNew.option({
            text: '신규 예약신청',
            onClick: function () {
                location.href = '<c:url value="/hm/reserve"/>';
            },
        });

        dxInstances.btnCancel.option({
            text: '예약취소',
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
