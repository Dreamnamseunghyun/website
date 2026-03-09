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
                            <h3 class="h3">FAQ</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <div class="row-wrap" style="box-shadow: none; margin:0!important">
                            <div class="row-box1 row" style="border:none;">
                                <div class="tabs-container" id="category" data-sitebuilder="dxTabs"></div>
                            </div>
                        </div>

                        <!-- Header -->
                        <div class="row-wrap row-wrap-box">
                            <div class="row-wrap-box right">
                                <div class="row-wrap row-wrap1">
                                    <div class="col-box1 row">
                                        <div class="col-lg-12" id="searchGrid" data-sitebuilder="dxTextBox"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Header -->

                        <div id="dataGridFaq" data-sitebuilder="dxDataGrid" class="main_table">
                        </div>
                    </div>
                    <%--                    </div>--%>
                </div>

                <div class="row btn_area index_btn_area footer-btn">
                    <div id="btnCreate" data-sitebuilder="dxButton">
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
                            <span>?깅줉</span>
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
        sitebuilder.openMenu('faq');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.category.option({
            items: [{id: 'ALL', text: '?꾩껜'}].concat(sitebuilder.typeDef.faqCategory),
            onItemClick: function (e) {
                //console.log(e);
                if (e.itemData.id === 'ALL') {
                    dxInstances.dataGridFaq.clearFilter();
                } else {
                    dxInstances.dataGridFaq.filter(['category', '=', e.itemData.id]);
                }
            }
        });

        dxInstances.searchGrid.option({
            placeholder: '寃??,
            valueChangeEvent: "keyup",
            onValueChanged: function (e) {
                dxInstances.dataGridFaq.searchByText(e.value);
            },
            mode: 'search'
        });

        dxInstances.dataGridFaq.option({
            dataSource: {
                load: function () {
                    return $.ajax({
                        url: '<c:url value="/pm/commune/faq"/>',
                        dataType: 'json',
                    });
                }
            },

            columns: [{
                caption: '?쒕쾲',
                alignment: 'center',
                width: 70,
                cellTemplate: function (cellElement, cellInfo) {
                    cellElement.text(cellInfo.component.pageIndex() * cellInfo.component.pageSize() + cellInfo.row.rowIndex + 1);
                },
            }, {
                dataField: 'category',
                caption: '遺꾨쪟',
                alignment: 'center',
                lookup: {
                    dataSource: sitebuilder.typeDef.faqCategory,
                    valueExpr: 'id',
                    displayExpr: 'text',
                },
            }, {
                dataField: 'title',
                cellTemplate: function (cellElement, cellInfo) {
                    let faqId = cellInfo.row.data.faqId;
                    cellElement.append('<a href = ' + '<c:url value="/pm/commune/faq"/>/' + faqId + '>' + cellInfo.text + '</a>');
                },
                caption: '?쒕ぉ',
            }, {
                dataField: 'writedAt',
                caption: '?묒꽦??,
                alignment: 'center',
                dataType: 'date',
                format: 'yyyy-MM-dd HH:mm:ss'
            }, {
                type: 'buttons',
                caption: '?섏젙',
                buttons: [{
                    text: '?섏젙',
                    onClick: function (data) {
                        var faq_id = data.row.data;
                        console.log(data);
                        location.href = '<c:url value="/pm/commune/faq"/>/' + faq_id.faqId + '/edit';
                    }
                }
                ]
            }, {
                type: 'buttons',
                caption: '??젣',
                buttons: [{
                    text: '??젣',
                    onClick: function deleteFaq(data) {
                        if (confirm('?뺣쭚濡???젣?섏떆寃좎뒿?덇퉴?')) {
                            var row_data = data.row;
                            var faq_id = row_data.data;
                            $.ajax({
                                url: '<c:url value="/pm/commune/faq"/>/' + faq_id.faqId,
                                method: 'DELETE',
                            }).then(function (response) {
                                console.log(response);
                                location.href = '<c:url value="/pm/commune/faq"/>'
                            });
                        }
                    }
                }]
            }
            ],
        });

        dxInstances.btnCreate.option({
            stylingMode: 'outlined',
            icon: 'comment',
            text: '?깅줉',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/commune/faq/create"/>';
            },
        });
    });
</script>
</html>
