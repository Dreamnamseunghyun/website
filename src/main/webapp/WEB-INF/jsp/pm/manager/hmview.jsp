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
                            <h3 class="h3">병원매니저 상세정보</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- 병원 매니저 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>병원 매니저</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>ID</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-6" id="centerManagerCode" data-ggsj="dxTextBox"></div>
                                            <div class="col-lg-3" id="notokUrge" data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-3" id="noUse" data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>소속</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="hospitalId" data-ggsj="dxSelectBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>PW</span></div>
                                        <div class="col-lg-10 row period center-box">
                                            <div class="col-lg-9 btnGray" id="btnResetPW"
                                                 data-ggsj="dxButton"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>센터</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="centerId" data-ggsj="dxSelectBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>매니저명</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="centerManagerName"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>유선</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-12" id="telephone"
                                                 data-ggsj="dxTextBox" data-ggsj-format="tel"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>이메일</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="email"
                                                 data-ggsj="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>휴대전화</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-12" id="mobile"
                                                 data-ggsj="dxTextBox" data-ggsj-format="tel"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 col-box-vertical3 row">
                                        <div class="col-lg-1 tag-name"><span>메모</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="notes"
                                                 data-ggsj="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 병원 매니저 -->

                        <div class="row">
                            <div id="centerManagerGrid" class="sub_table" data-ggsj="dxDataGrid"></div>
                        </div>

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnEdit" data-ggsj="dxButton"><i class="xi-file-check"></i>수정
                            </div>
                            <div class="col-lg-1" id="btnList" data-ggsj="dxButton">목록</div>
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
    /** @param _dxInstances : {btnHospitalSearch,hospitalManagerName} */
    $(function () {
        ggsj.openMenu('manager');

        let dxInstances = ggsj.createDx(true);

        let dsHospital = new DevExpress.data.DataSource({
            load: function () {
                return $.ajax({
                    url: '<c:url value="/pm/hospital"/>',
                    method: 'GET',
                });
            },
        });

        let dsCompany = [];

        dxInstances.hospitalId.option({
            dataSource: dsHospital,
            placeholder: '병원검색',
            valueExpr: 'hospitalId',
            displayExpr: 'hospitalName',
            searchEnabled: true,
            searchExpr: ['hospitalName'],
            onItemClick: function () {
                dxInstances.centerId.option({
                    value: null
                })
            },
            onValueChanged: function (e) {
                let ds = dxInstances.centerId.getDataSource();
                ds.filter(['hospitalId', '=', e.value]);
                ds.load();
            },
        });

        dxInstances.centerId.option({
            placeholder: "센터검색",
            valueExpr: 'centerId',
            displayExpr: 'centerName',
            onItemClick: function () {
                console.log(dsCenter);
            },
        });

        dxInstances.noUse.option({
            text: '로그인중지',
        });

        dxInstances.notokUrge.option({
            text: '알림톡 독려 제외',
        });

        dxInstances.btnResetPW.option({
            disabled: true,
            text: '비번초기화',
            onClick: function () {
                $.ajax({
                    url: '<c:url value="/pm/manager/reset"/>',
                    method: 'PUT',
                    data: JSON.stringify(ggsj.dxToValues()),
                }).then(function () {
                });
            }
        });

        dxInstances.centerManagerGrid.option({
            editing: {
                mode: 'batch',
                allowAdding: false,
                allowUpdating: false,
                allowDeleting: false,
                allowEditing: false,
            },
            columns: [{
                dataField: 'companyId',
                caption: '기업체명',
                // setCellValue: function (rowData, value) {
                //     rowData.companyId = value;
                // },
                lookup: {
                    dataSource: function (row) {
                        if (row.data && dxInstances.centerManagerGrid.getDataSource()) {
                            let ds = dxInstances.centerManagerGrid.getDataSource().items().map(function (v) {
                                return v.companyId;
                            });

                            return dsCompany.filter(function (v) {
                                return row.data.companyId === v.companyId || ds.indexOf(v.companyId) < 0;
                            });
                        }

                        return dsCompany;
                    },
                    valueExpr: 'companyId',
                    displayExpr: 'companyName',
                },
            }, {
                caption: '세부업무',
                alignment: 'center',
                columns: [{
                    dataField: 'contract',
                    caption: '계약',
                    dataType: 'boolean',
                }, {
                    dataField: 'reserve',
                    caption: '예약',
                    dataType: 'boolean',
                }, {
                    dataField: 'result',
                    caption: '결과',
                    dataType: 'boolean',
                }],
            }
            ],
            onToolbarPreparing: function (e) {
                // Grid Title
                e.toolbarOptions.items.unshift({
                    location: 'before',
                    text: '담당 기업체',
                });

                // Modifies an existing item
                let toolbarItems = e.toolbarOptions.items;
                toolbarItems.forEach(function (item) {
                    if (item.name === "saveButton") {
                        item.visible = false;
                    }
                });
            },
            onInitNewRow: function (e) {
                e.data['contract'] = false;
                e.data['reserve'] = false;
                e.data['result'] = false;
            },
        });

        dxInstances.btnEdit.option({
            stylingMode: 'contained',
            text: '수정',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/manager/${userId}"/>/hospitaledit';

            },
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '목록',
            onClick: function () {
                location.href = '<c:url value="/pm/manager"/>';
            }
        });

        let ajaxHospital = {
            url: '<c:url value="/pm/hospital"/>',
            method: 'GET',
        };

        let ajaxCenter = {
            url: '<c:url value="/pm/hospital"/>',
            method: 'GET',
        };

        let ajaxCompany = {
            url: '<c:url value="/common/company?listType=LAST_ALL"/>',
            method: 'GET',
        };

        $.when($.ajax(ajaxHospital), $.ajax(ajaxCenter), $.ajax(ajaxCompany)).then(function (resp1, resp2, resp3) {
            $.ajax({
                url: '<c:url value="/pm/manager/hospital/${userId}"/>',
                method: 'GET',
            }).then(function (response) {
                console.log(response.data);
                ggsj.valuesToDx(response.data);
                dxInstances.centerManagerGrid.option({
                    dataSource: response.data.centerManagerCompany
                });

                dxInstances.centerManagerGrid.cancelEditData();
            });

            dxInstances.hospitalId.option({
                dataSource: resp1[0].data,
            });

            dxInstances.centerId.option({
                dataSource: resp2[0].data,
            });

            dsCompany = resp3[0].data;
        });
    });
</script>

</html>
