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
                            <h3 class="h3">?덉빟遺덇?</h3>
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
                                            <div class="col-lg-5 tag-name"><span>蹂묒썝寃??/span></div>
                                            <div class="col-lg-7" id="lookupCenter" data-sitebuilder="dxLookup"
                                                 style="width: 250px"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="row-wrap right">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12">
                                                <div id="targetCenterId" data-sitebuilder="dxLookup"
                                                     style="min-width:190px"></div>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12">
                                                <div class="btnGGSJ" id="btnCopy" data-sitebuilder="dxButton"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- Header -->

                        <%--                        <div class="row">--%>
                        <%--                            <div class="col-lg-3" id="lookupCenter" data-sitebuilder="dxLookup"></div>--%>
                        <%--                            <div class="col-lg-5"></div>--%>
                        <%--                            <div class="col-lg-3" id="targetCenterId" data-sitebuilder="dxLookup"></div>--%>
                        <%--                            <div class="col-lg-1" id="btnCopy" data-sitebuilder="dxButton"></div>--%>
                        <%--                        </div>--%>
                        <div id="dayOffScheduler" data-sitebuilder="dxScheduler" style="height:78vh"></div>
                    </div>

                    <div id="popupMemo" data-sitebuilder="dxPopup"></div>
                    <div id="popupItems" data-sitebuilder="dxPopup"></div>

                    <div class="row btn_area footer-btn">
                        <div class="col-lg-1 btnGGSJ" id="btnItems" data-sitebuilder="dxButton"></div>
                        <div class="col-lg-1 btnGray" id="btnAmOff" data-sitebuilder="dxButton"></div>
                        <div class="col-lg-1" id="btnPmOff" data-sitebuilder="dxButton"></div>
                        <div class="col-lg-1 btnBlue" id="btnAllOff" data-sitebuilder="dxButton"></div>
                        <div class="col-lg-1" id="btnOn" data-sitebuilder="dxButton"></div>
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
        sitebuilder.openMenu('day-off');
        /** @param dxInstances : {lookupCenter,targetCenterId,btnCopy,dayOffScheduler,btnAmOff,btnPmOff,btnAllOff,btnOn} */

        let dxInstances = sitebuilder.createDx(false);
        let centerId = null;

        function LoadDayOffList() {
            centerId = dxInstances.lookupCenter.option('value');

            let ajaxDayOff = $.ajax({
                url: '<c:url value="/hm/day-off"/>',
                cache: false,
                dataType: 'json',
                contentType: 'application/json',
                data: {centerId: centerId,}
            });

            $.when(ajaxDayOff).then(function (response) {
                //console.log('?꾩껜由ъ뒪??, response.data);
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
                url: '<c:url value="/hm/day-off"/>',
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
            placeholder: "蹂묒썝???좏깮?댁＜?몄슂.",
            searchPlaceholder: "寃??,
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
                    title: "硫붾え",
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
            text: '??ぉ 遺덇?',
            onClick: function () {
                if (!dxInstances.lookupCenter.option('value')) {
                    alert('蹂묒썝???좏깮?댁＜?몄슂.');
                    return;
                }
                dxInstances.popupMemo.show();

                dxInstances.popupMemo.option({
                    title: "??ぉ遺덇? 硫붾え",
                    closeOnOutsideClick: true,
                    width: 500,
                    height: 250,
                    contentTemplate: function (contentElement) {
                        contentElement.append($("<div id='notes' />").dxTextArea({
                            height: 130,
                        }));

                        contentElement.append($("<div style='alignment: center;'/>").dxButton({
                            text: '???,
                            alignment: 'center',
                            onClick: function () {

                                let memo = DevExpress.ui.dxTextArea.getInstance($('#notes'));
                                let items = memo.option('value');

                                saveDayOff('TX', items);

                                dxInstances.popupMemo.hide();
                                sitebuilder.notify("遺덇? 硫붾え媛 ????섏뿀?듬땲??");
                            }
                        }));
                    },
                });
            }
        });

        dxInstances.btnAmOff.option({
            text: '?ㅼ쟾 遺덇?',
            onClick: function () {
                if (!dxInstances.lookupCenter.option('value')) {
                    alert('蹂묒썝???좏깮?댁＜?몄슂.');
                    return;
                }
                saveDayOff('AM');
                sitebuilder.notify("?ㅼ쟾 遺덇? ????섏뿀?듬땲??");
            }
        });

        dxInstances.btnPmOff.option({
            text: '?ㅽ썑 遺덇?',
            type: "success",
            onClick: function () {
                if (!dxInstances.lookupCenter.option('value')) {
                    alert('蹂묒썝???좏깮?댁＜?몄슂.');
                    return;
                }
                saveDayOff('PM');
                sitebuilder.notify("?ㅽ썑 遺덇? ????섏뿀?듬땲??");
            }
        });

        dxInstances.btnAllOff.option({
            text: '醫낆씪 遺덇?',
            onClick: function () {
                if (!dxInstances.lookupCenter.option('value')) {
                    alert('蹂묒썝???좏깮?댁＜?몄슂.');
                    return;
                }
                saveDayOff('ALL');
                sitebuilder.notify("醫낆씪 遺덇? ????섏뿀?듬땲??");
            }
        });

        dxInstances.btnOn.option({
            text: '遺덇? ?댁젣',
            type: 'danger',
            onClick: function () {
                if (!dxInstances.lookupCenter.option('value')) {
                    alert('蹂묒썝???좏깮?댁＜?몄슂.');
                    return;
                }
                saveDayOff('REMOVE');
                sitebuilder.notify("遺덇? ?댁젣 ?섏뿀?듬땲??");
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
            placeholder: "遺숈뿬?ｌ쓣 蹂묒썝 ?좏깮",
            searchPlaceholder: "寃??,
        });

        dxInstances.btnCopy.option({
            text: '?꾩껜 蹂듭궗',
            onClick: function () {
                if (!dxInstances.lookupCenter.option('value')) {
                    alert('蹂묒썝???좏깮?댁＜?몄슂.');
                    return;
                }

                if (!dxInstances.targetCenterId.option('value')) {
                    alert('遺숈뿬?ｌ쓣 蹂묒썝???좏깮?댁＜?몄슂.');
                    return;
                }

                if (confirm('寃쎄퀬! 紐⑤뱺?뺣낫媛 ??뼱?뚯뼱 吏묐땲?? 蹂듭궗?섏떆寃좎뒿?덇퉴?') !== true) {
                    alert('痍⑥냼?섏??듬땲??');
                    return;
                }

                $.ajax({
                    url: '<c:url value="/hm/copy-day-off"/>',
                    method: 'POST',
                    data: JSON.stringify({
                        centerId: dxInstances.lookupCenter.option('value'),
                        targetCenterId: dxInstances.targetCenterId.option('value')
                    })
                }).then(function () {
                    LoadDayOffList();
                    sitebuilder.notify("蹂듭궗媛 ?꾨즺 ?섏뿀?듬땲??");
                });
            }
        });

        // CenterListLoad
        let ajaxCenterList = $.ajax({
            url: '<c:url value="/hm/reserve/centerlist"/>',
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

        <c:choose>
        <c:when test="${centerId != null}">
        dxInstances.lookupCenter.option({value: <c:out value="${centerId}"/>});
        LoadDayOffList();
        </c:when>
        <c:otherwise>
        dxInstances.lookupCenter.option({value: <c:out value="${sessionSubTypeId}"/>});
        LoadDayOffList();
        </c:otherwise>
        </c:choose>
    });
</script>
</html>
