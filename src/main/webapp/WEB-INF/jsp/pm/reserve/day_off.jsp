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
                            <h3 class="h3">예약불가</h3>
                        </div>
                    </div>
                    <%--<div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap left" style="">
                                <div class="row-box" style="min-width:400px;">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-5 tag-name"><span>병원검색</span></div>
                                            <div class="col-lg-7" id="lookupCenter" data-ggsj="dxLookup"
                                                 style="width: 250px"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="row-wrap right">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12"><div id="targetCenterId" data-ggsj="dxLookup" style="min-width:190px"></div></div>
                                        </div>

                                    </div>

                                </div>

                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12">
                                                <div class="btnGGSJ" id="btnCopy" data-ggsj="dxButton"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Header -->

                        <%--                        <div class="row">--%>
                        <%--                            <div class="col-lg-3" id="lookupCenter" data-ggsj="dxLookup"></div>--%>
                        <%--                            <div class="col-lg-5"></div>--%>
                        <%--                            <div class="col-lg-3" id="targetCenterId" data-ggsj="dxLookup"></div>--%>
                        <%--                            <div class="col-lg-1" id="btnCopy" data-ggsj="dxButton"></div>--%>
                        <%--                        </div>--%>
                        <div id="dayOffScheduler" data-ggsj="dxScheduler" style="height:78vh"></div>
                    </div>

                    <div id="popupMemo" data-ggsj="dxPopup"></div>
                    <div id="popupItems" data-ggsj="dxPopup"></div>

                    <div class="row btn_area footer-btn">
                        <div class="col-lg-1 btnGGSJ" id="btnItems" data-ggsj="dxButton"></div>
                        <div class="col-lg-1 btnGray" id="btnAmOff" data-ggsj="dxButton"></div>
                        <div class="col-lg-1" id="btnPmOff" data-ggsj="dxButton"></div>
                        <div class="col-lg-1 btnBlue" id="btnAllOff" data-ggsj="dxButton"></div>
                        <div class="col-lg-1" id="btnOn" data-ggsj="dxButton"></div>
                    </div>
                </div>
                <%--</div>--%>
            </div>
        </div>

    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    $(function () {
        ggsj.openMenu('day-off');
        /** @param dxInstances : {lookupCenter,targetCenterId,btnCopy,dayOffScheduler,btnAmOff,btnPmOff,btnAllOff,btnOn} */

        let dxInstances = ggsj.createDx(false);
        let centerId = null;

        function LoadDayOffList() {
            centerId = dxInstances.lookupCenter.option('value');

            let ajaxDayOff = $.ajax({
                url: '<c:url value="/pm/day-off"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {centerId: centerId,}
            });

            $.when(ajaxDayOff).then(function (response) {
                // console.log('전체리스트', response.data);
                dxInstances.dayOffScheduler.option({
                    dataSource: response.data,
                    valueExpr: 'amPm',
                    textExpr: 'impossible',
                    startDateExpr: 'dayOff',
                });
            });
        }

        function saveDayOff(type, memo) {
            if (centerId === null) {
                return;
            }

            let selectDate = dxInstances.dayOffScheduler.option('selectedCellData');

            let data = [];
            let oneDay;
            for (let i = 0; i < selectDate.length; i++) {
                oneDay = {};

                oneDay._crudType = 'INSERT';
                if (type === 'REMOVE') {
                    oneDay._crudType = 'REMOVE';
                }
                oneDay.centerId = centerId;
                oneDay.dayOff = selectDate[i].startDate;

                oneDay.amPm = 'AM';
                if (type === 'PM') {
                    oneDay.amPm = 'PM';
                } else if (type === 'TX') {
                    oneDay.amPm = 'TX';
                    oneDay.notes = memo;
                }

                oneDay.itemIds = null;
                // oneDay.notes = null;

                data.push(oneDay);

                if (type === 'ALL') {
                    oneDay = {};
                    oneDay._crudType = 'INSERT';
                    oneDay.centerId = centerId;
                    oneDay.dayOff = selectDate[i].startDate;
                    oneDay.amPm = 'PM';
                    oneDay.itemIds = null;
                    oneDay.notes = null;

                    data.push(oneDay);
                }
            }

            $.ajax({
                url: '<c:url value="/pm/day-off"/>',
                method: 'POST',
                data: JSON.stringify(data),
            }).then(function () {
                LoadDayOffList();
            });
        }

        dxInstances.lookupCenter.option({
            valueExpr: 'centerId',
            displayExpr: 'hospitalCenterName',
            dropDownOptions: {
                closeOnOutsideClick: true,
                showTitle: false,
            },
            searchEnabled: true,
            searchExpr: 'hospitalCenterName',
            searchMode: 'contains',
            searchTimeout: 100,
            placeholder: "병원을 선택해주세요.",
            searchPlaceholder: "검색",
            onValueChanged: function () {
                LoadDayOffList();
            },
        });

        let resourcesData = [
            {text: 'AM', id: 'AM', color: "#f89e34",},
            {text: 'PM', id: 'PM', color: "#00469c"}
        ];

        dxInstances.dayOffScheduler.option({
            onAppointmentClick(e) {
                e.cancel = true;
                let data = e.appointmentData.impossible;

                dxInstances.popupItems.show();

                dxInstances.popupItems.option({
                    title: "메모",
                    closeOnOutsideClick: true,
                    width: 500,
                    height: 300,
                    contentTemplate: function (contentElement) {
                        contentElement.append($("<div id='items' />").dxTextArea({
                            value: data,
                            height: 210
                        }));
                    }
                });
            },
            onAppointmentDblClick(e) {
                e.cancel = true;
            },
            timeZone: 'Asia/Seoul',
            views: ['month'],
            currentView: 'month',
            currentDate: new Date(),
            resources: [{
                fieldExpr: 'amPm',
                dataSource: resourcesData,
            }],
            editing: {
                allowAdding: false,
                allowDeleting: false,
                allowDragging: false,
                allowResizing: false,
                allowTimeZoneEditing: false,
                allowUpdating: false
            },
        });

        dxInstances.btnItems.option({
            text: '항목 불가',
            onClick: function () {
                if (!dxInstances.lookupCenter.option('value')) {
                    alert('병원을 선택해주세요.');
                    return;
                }
                dxInstances.popupMemo.show();

                dxInstances.popupMemo.option({
                    title: "항목불가 메모",
                    closeOnOutsideClick: true,
                    width: 500,
                    height: 250,
                    contentTemplate: function (contentElement) {
                        contentElement.append($("<div id='notes' />").dxTextArea({
                            height: 130,
                        }));

                        contentElement.append($("<div style='alignment: center;'/>").dxButton({
                            text: '저장',
                            alignment: 'center',
                            onClick: function () {

                                let memo = DevExpress.ui.dxTextArea.getInstance($('#notes'));
                                let items = memo.option('value');

                                saveDayOff('TX', items);

                                dxInstances.popupMemo.hide();
                                ggsj.notify("불가 메모가 저장 되었습니다.");
                            }
                        }));
                    },
                });
            }
        });

        dxInstances.btnAmOff.option({
            text: '오전 불가',
            onClick: function () {
                if (!dxInstances.lookupCenter.option('value')) {
                    alert('병원을 선택해주세요.');
                    return;
                }
                saveDayOff('AM');
                ggsj.notify("오전 불가 저장 되었습니다.");
            }
        });

        dxInstances.btnPmOff.option({
            text: '오후 불가',
            type: "success",
            onClick: function () {
                if (!dxInstances.lookupCenter.option('value')) {
                    alert('병원을 선택해주세요.');
                    return;
                }
                saveDayOff('PM');
                ggsj.notify("오후 불가 저장 되었습니다.");
            }
        });

        dxInstances.btnAllOff.option({
            text: '종일 불가',
            onClick: function () {
                if (!dxInstances.lookupCenter.option('value')) {
                    alert('병원을 선택해주세요.');
                    return;
                }
                saveDayOff('ALL');
                ggsj.notify("종일 불가 저장 되었습니다.");
            }
        });

        dxInstances.btnOn.option({
            text: '불가 해제',
            type: 'danger',
            onClick: function () {
                if (!dxInstances.lookupCenter.option('value')) {
                    alert('병원을 선택해주세요.');
                    return;
                }
                saveDayOff('REMOVE');
                ggsj.notify("불가 해제 되었습니다.");
            }
        });

        dxInstances.targetCenterId.option({
            valueExpr: 'centerId',
            displayExpr: 'hospitalCenterName',
            dropDownOptions: {
                closeOnOutsideClick: true,
                showTitle: false,
            },
            searchEnabled: true,
            searchExpr: 'centerName',
            searchMode: 'contains',
            searchTimeout: 100,
            placeholder: "붙여넣을 병원 선택",
            searchPlaceholder: "검색",
        });

        dxInstances.btnCopy.option({
            text: '전체 복사',
            onClick: function () {
                if (!dxInstances.lookupCenter.option('value')) {
                    alert('병원을 선택해주세요.');
                    return;
                }

                if (!dxInstances.targetCenterId.option('value')) {
                    alert('붙여넣을 병원을 선택해주세요.');
                    return;
                }

                if (confirm('경고! 모든정보가 덮어씌어 집니다. 복사하시겠습니까?') !== true) {
                    alert('취소하였습니다.');
                    return;
                }

                $.ajax({
                    url: '<c:url value="/pm/copy-day-off"/>',
                    method: 'POST',
                    data: JSON.stringify({
                        centerId: dxInstances.lookupCenter.option('value'),
                        targetCenterId: dxInstances.targetCenterId.option('value')
                    })
                }).then(function () {
                    LoadDayOffList();
                    ggsj.notify("복사가 완료 되었습니다.");
                });
            }
        });

        // CenterListLoad
        let ajaxCenterList = $.ajax({
            url: '<c:url value="/common/center"/>',
        });

        $.when(ajaxCenterList).then(function (responseCenterList) {
            // Center List
            dxInstances.lookupCenter.option({
                dataSource: responseCenterList.data,
            });

            dxInstances.targetCenterId.option({
                dataSource: responseCenterList.data,
            });
        });

        <c:if test="${centerId != null}">
        dxInstances.lookupCenter.option({value: <c:out value="${centerId}"/>});
        LoadDayOffList();
        </c:if>
    });
</script>
</html>
