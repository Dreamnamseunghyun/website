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
                            <h3 class="h3">Ï¥ùÍ¥ÑÎß§Îãà?Ä ?ÅÏÑ∏?ïÎ≥¥</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- Ï¥ùÍ¥Ñ Îß§Îãà?Ä -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>Ï¥ùÍ¥Ñ Îß§Îãà?Ä</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>ID</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-9" id="platformManagerCode" data-sitebuilder="dxTextBox"></div>
                                            <div class="col-lg-3" id="noUse" data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?∏Î??ÖÎ¨¥</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-3" id="sales" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-3" id="admin" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-3" id="executive" data-sitebuilder="dxCheckBox"></div>
                                            <div class="col-lg-3" id="outsales" data-sitebuilder="dxCheckBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>PW</span></div>
                                        <div class="col-lg-10 row period center-box">
                                            <div class="col-lg-9 btnGray" id="btnResetPW"
                                                 data-sitebuilder="dxButton"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?†ÏÑ†</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-12" id="telephone"
                                                 data-sitebuilder="dxTextBox" data-sitebuilder-format="tel"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Îß§Îãà?ÄÎ™?/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="platformManagerName"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?¥Î??ÑÌôî</span></div>
                                        <div class="col-lg-10 row">
                                            <div class="col-lg-12" id="mobile"
                                                 data-sitebuilder="dxTextBox" data-sitebuilder-format="tel"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>?¥Î©î??/span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12" id="email"
                                                 data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>Îß§Ï∂úÎ™©Ìëú</span></div>
                                        <div class="col-lg-10" style="border-left: 1px solid #e0e0e0;">
                                            <div class="col-lg-box2 row">
                                                <div class="col-lg-4 tag-name"><span>?Ä?ÅÎÖÑ??/span></div>
                                                <div class="col-lg-8" id="year" data-sitebuilder="dxSelectBox"></div>
                                            </div>
                                            <div class="col-lg-box2 row">
                                                <div class="col-lg-4 tag-name"><span>Î™©Ìëú??/span></div>
                                                <div class="col-lg-8" id="targetFigure"
                                                     data-sitebuilder="dxNumberBox"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 col-box-vertical3 row">
                                        <div class="col-lg-1 tag-name"><span>Î©îÎ™®</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="notes"
                                                 data-sitebuilder="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Ï¥ùÍ¥Ñ Îß§Îãà?Ä -->

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnEdit" data-sitebuilder="dxButton"><i class="xi-file-check"></i>?òÏ†ï
                            </div>
                            <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton">Î™©Î°ù</div>
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
    /** @param _dxInstances : {managerType,detailDivision,btnCompanyCreate,lineMobile,noUse,btnResetPW,targetFigure} */
    $(function () {
        sitebuilder.openMenu('manager');

        let dxInstances = sitebuilder.createDx(true);

        dxInstances.sales.option({
            text: '?ÅÏóÖ',
            hoverStateEnabled: false,
            focusStateEnabled: false,
        });

        dxInstances.admin.option({
            text: '?âÏ†ï',
            hoverStateEnabled: false,
            focusStateEnabled: false,
        });

        dxInstances.executive.option({
            text: '?ÑÏõê',
            hoverStateEnabled: false,
            focusStateEnabled: false,
        });

        dxInstances.outsales.option({
            text: '?∏Î??ÅÏóÖ',
            hoverStateEnabled: false,
            focusStateEnabled: false,
        });

        dxInstances.noUse.option({
            text: 'Î°úÍ∑∏?∏Ï§ëÏßÄ',
        });

        dxInstances.btnResetPW.option({
            disabled: true,
            text: 'ÎπÑÎ≤àÏ¥àÍ∏∞??,
            onClick: function () {
                $.ajax({
                    url: '<c:url value="/pm/manager/reset"/>',
                    method: 'PUT',
                    data: JSON.stringify(sitebuilder.dxToValues()),
                }).then(function () {
                });
            }
        });
        // let yearData = sitebuilder.typeDef.Year
        // yearData.unshift({id: 0, text: '?ÑÏ≤¥'});

        dxInstances.year.option({
            dataSource: sitebuilder.typeDef.Year,
            value: new Date().getFullYear(),
            valueExpr: 'id',
            displayExpr: 'text',
        });

        dxInstances.btnEdit.option({
            stylingMode: 'contained',
            text: '?òÏ†ï',
            type: 'success',
            onClick: function () {
                location.href = '<c:url value="/pm/manager/${userId}"/>/pmedit';
            },
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: 'Î™©Î°ù',
            onClick: function () {
                location.href = '<c:url value="/pm/manager"/>';
            }
        });

        $.ajax({
            url: '<c:url value="/pm/manager/pm/${userId}"/>',
            method: 'GET',
        }).then(function (response) {
            console.log(response);
            sitebuilder.valuesToDx(response.data);
        });
    });
</script>

</html>
