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
                            <h3 class="h3">건강한 건강상식</h3>
                        </div>
                    </div>
                    <%--<div class="card-body">--%>
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

                        <div id="dataGridHealthCare" class="main_table" data-ggsj="dxDataGrid">
                        </div>
                    </div>
                    <%--</div>--%>
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
        ggsj.openMenu('healthcare');

        let dxInstances = ggsj.createDx(false);

        dxInstances.searchGrid.option({
            placeholder: '검색',
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridHealthCare.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridHealthCare.option({
            columns: [{
                caption: '순번',
                alignment: 'center',
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'title',
                caption: '제목',
                cellTemplate: function (cellElement, cellInfo) {
                    console.log(cellInfo);
                    cellElement.append("<a href = " + '<c:url value="/pm/healthsense"/>' + '/' + cellInfo.data.healthSenseId + ">" + cellInfo.text + "</a>");
                },
            }, {
                dataField: 'writedAt',
                caption: '작성일',
                alignment: 'center',
                dataType: 'date',
                format: 'yyyy-MM-dd'
            }, {
                type: 'buttons',
                caption: '수정',
                alignment: 'center',
                buttons: [{
                    text: '수정',
                    onClick: function (e) {
                        location.href = '<c:url value="/pm/healthsense"/>/' + e.row.data.healthSenseId + '/edit';
                    },
                }
                ]
            }, {
                type: 'buttons',
                caption: '삭제',
                alignment: 'center',
                buttons: [{
                    text: '삭제',
                    onClick: function (e) {
                        if (confirm('정말로 삭제하시겠습니까?')) {
                            let healthSenseId = e.row.data.healthSenseId;
                            $.ajax({
                                url: '<c:url value="/pm/healthsense"/>/' + healthSenseId,
                                method: 'DELETE',
                            }).then(function () {
                                location.href = '<c:url value="/pm/commune/healthcare"/>';
                            });
                        }
                    },
                }
                ]
            }
            ],
        });

        dxInstances.btnCreate.option({
            stylingMode: 'outlined',
            icon: 'comment',
            text: '등록',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/healthsense/create"/>';
            }
        });

        $.ajax({
            url: '<c:url value="/pm/healthsense"/>',
            method: 'GET',
        }).then(function (response) {
            ggsj.valuesToDx(response.data);
            console.log(response);
            dxInstances.dataGridHealthCare.option({
                dataSource: response.data
            });
        });
    });
</script>
</html>
