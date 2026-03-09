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
                            <h3 class="h3">공지사항</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap">

                                <div class="row-box1">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-3 tag-name"><span>작성일자</span></div>
                                            <div class="col-lg-9 row period">
                                                <div class="col-lg-6" id="startDate" data-ggsj="dxDateBox"></div>
                                                <div class="text-center wavy">~</div>
                                                <div class="col-lg-6" id="endDate" data-ggsj="dxDateBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



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

                        <div id="dataGridNotice" class="main_table" data-ggsj="dxDataGrid">
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
        ggsj.openMenu('notice');

        /** @param dxInstances : {selectStatus,dataGridNotice} */
        let dxInstances = ggsj.createDx(false);

        // dxInstances.selectStatus.option({
        //     dataSource: [
        //         {id: 0, text: '전체'},
        //         {id: 'US', text: '회원'},
        //         {id: 'CM', text: '기업'},
        //         {id: 'HM', text: '병원'},
        //         {id: 'PM', text: '내부'},
        //     ],
        //     value: 0,
        //     valueExpr: 'id',
        //     displayExpr: 'text',
        //     onValueChanged: function (data) {
        //         if (data.value == 0)
        //             dxInstances.dataGridNotice.clearFilter();
        //         else
        //             dxInstances.dataGridNotice.filter(['group', '=', data.value]);
        //     }
        // });

        function SettingFilter() {
            let filters = [];
            let status = dxInstances.selectStatus.option('value');
            let sDate = dxInstances.startDate.option('value');
            let eDate = dxInstances.endDate.option('value');

            dxInstances.dataGridNotice.filter(
                ['writedAt', '>=', sDate],
                'and',
                ['writedAt', '<', new Date(eDate).addDays(1)]);
        }

        dxInstances.startDate.option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            value: new Date().removeTime().addYears(-1),
            useMaskBehavior: true,
            onValueChanged: function (e) {
                dxInstances.endDate.option("min", e.value);

                SettingFilter();
            },
        });

        dxInstances.endDate.option({
            applyValueMode: 'instantly',
            displayFormat: 'yyyy-MM-dd',
            type: 'date',
            value: new Date().removeTime(),
            onValueChanged: function (e) {
                dxInstances.startDate.option("max", e.value);

                SettingFilter();
            },
        });

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridNotice.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridNotice.option({
            dataSource: {
                load: function () {
                    return $.ajax({
                        url: '<c:url value="/cm/commune/notice"/>',
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
                        cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                    }
                },
            }, {
                dataField: 'group',
                caption: '구분',
                width: 80,
                alignment: 'center',
                lookup: {
                    dataSource: ggsj.typeDef.userType,
                    valueExpr: 'id',
                    displayExpr: 'text',
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
                        cellElement.append('<a href="<c:url value="/cm/commune/notice"/>/' + noticeId + '">' + cellInfo.text + '</a>');
                        cellElement.append('<i class="xi-diskette"></i>');
                    } else {
                        cellElement.append('<a href="<c:url value="/cm/commune/notice"/>/' + noticeId + '">' + cellInfo.text + '</a>');
                    }
                },
                // }, {
                //     dataField: 'topList',
                //     caption: 'TOP',
                //     lookup: {
                //         dataSource: [
                //             {'id': false, 'text': ''},
                //             {'id': true, 'text': '📌'},
                //         ],
                //         valueExpr: 'id',
                //         displayExpr: 'text',
                //     },
            }, {
                dataField: 'writedUserName',
                caption: '작성자',
                alignment: 'center',
                width: 80,
            }, {
                dataField: 'writedAt',
                caption: '작성일자',
                alignment: 'center',
                dataType: 'date',
            }],
        });

        // Load
        $.ajax({
            url: '<c:url value="/cm/commune/notice"/>',
            method: 'GET',
        }).then(function (response) {
            console.log(response)
            ggsj.valuesToDx(response.data);
        });

    });
</script>
</html>
