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
                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>구분</span></div>
                                            <div class="col-lg-8">
                                                <div class="col-lg-12" id="selectStatus"
                                                     data-ggsj="dxSelectBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box2">
                                    <div class="row-box-inner1">
                                        <div class="col-box1 row">
                                            <div class="col-lg-4 tag-name"><span>작성일자</span></div>
                                            <div class="col-lg-8 row period">
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

                <div class="row btn_area index_btn_area footer-btn">
                    <div id="btnCreate" data-ggsj="dxButton">
                        <div class="write_btn">
                            <div>
                                <div class="pencil"></div>
                                <div class="folder">
                                    <div class="top">
                                        <svg viewBox="0 0 24 27">
                                            <path d="M1,0 L23,0 C23.5522847,-1.01453063e-16 24,0.44771525 24,1 L24,8.17157288 C24,8.70200585 23.7892863,9.21071368 23.4142136,9.58578644 L20.5857864,12.4142136 C20.2107137,12.7892863 20,13.2979941 20,13.8284271 L20,26 C20,26.5522847 19.5522847,27 19,27 L1,27 C0.44771525,27 6.76353751e-17,26.5522847 0,26 L0,1 C-6.76353751e-17,0.44771525 0.44771525,1.01453063e-16 1,0 Z"></path>
                                        </svg>
                                    </div>
                                    <div class="paper"></div>
                                </div>
                            </div>
                            <span>등록</span>
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
        ggsj.openMenu('notice');

        /** @param dxInstances : {selectStatus,dataGridNotice} */
        let dxInstances = ggsj.createDx(false);

        dxInstances.selectStatus.option({
            dataSource: [
                {id: 0, text: '전체'},
                {id: 'US', text: '회원'},
                {id: 'CM', text: '기업'},
                {id: 'HM', text: '병원'},
                {id: 'PM', text: '내부'},
            ],
            value: 0,
            valueExpr: 'id',
            displayExpr: 'text',
            onValueChanged: function () {
                SettingFilter();
            }
        });

        function SettingFilter() {
            let filters = [];
            let status = dxInstances.selectStatus.option('value');
            let sDate = dxInstances.startDate.option('value');
            let eDate = dxInstances.endDate.option('value');

            if (status !== 0) {
                filters.push(['group', '=', status]);
                filters.push('and');
            }

            filters.push(['writedAt', '>=', sDate]);
            filters.push('and');
            filters.push(['writedAt', '<', new Date(eDate).addDays(1)]);

            dxInstances.dataGridNotice.filter(filters);
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
            columns: [{
                caption: '순번',
                width: 80,
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
                width: 150,
                alignment: 'center',
            }, {
                dataField: 'title',
                caption: '제목',
                alignment: 'left',
                width: 700,
                cellTemplate: function (cellElement, cellInfo) {
                    let noticeId = cellInfo.row.data.noticeId;
                    if (cellInfo.data.attachUrl) {
                        cellElement.append('<a href="<c:url value="/pm/commune/notice"/>/' + noticeId + '">' + cellInfo.text + '</a>');
                        cellElement.append('<i class="xi-diskette"></i>');
                    } else {
                        cellElement.append('<a href="<c:url value="/pm/commune/notice"/>/' + noticeId + '">' + cellInfo.text + '</a>');
                    }
                },
                // }, {
                //     dataField: 'topList',
                //     caption: 'TOP',
                //     alignment: 'center',
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
            }, {
                dataField: 'writedAt',
                caption: '작성일',
                alignment: 'center',
                dataType: 'date',
            }, {
                type: 'buttons',
                caption: '수정',
                buttons: [{
                    text: '수정',
                    onClick: function (e) {
                        let notice_id = e.row.data;
                        location.href = '<c:url value="/pm/commune/notice"/>/' + notice_id.noticeId + '/edit';
                    }
                }]
            }, {
                type: 'buttons',
                caption: '삭제',
                buttons: [{
                    text: '삭제',
                    onClick: function (e) {
                        if (confirm('정말로 삭제하시겠습니까?')) {
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

        // Create
        dxInstances.btnCreate.option({
            stylingMode: 'outlined',
            text: '등록',
            type: 'success',
            icon: 'comment',
            onClick: function () {
                location.href = '<c:url value="/pm/commune/notice/create"/>';
            },
        });

        let ajaxLoadNoticeList = $.ajax({
            url: '<c:url value="/pm/commune/notice"/>',
        });

        $.when(ajaxLoadNoticeList).then(function (response) {
            dxInstances.dataGridNotice.option({
                dataSource: response.data,
            });

            // $.when(dxInstances.dataGridNotice.getDataSource().load()).then(function () {
            //     SettingFilter();
            // });
        });
    });
</script>
</html>
