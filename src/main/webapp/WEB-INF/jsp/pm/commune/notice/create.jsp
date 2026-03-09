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
                            <h3 class="h3">怨듭??ы빆 ?깅줉</h3>
                        </div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>怨듭??ы빆</div>
                            <div class="row-box1">

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>援щ텇</span></div>
                                        <div class="col-lg-8" id="group" data-sitebuilder="dxSelectBox"></div>
                                        <div class="col-lg-2" id="topList" data-sitebuilder="dxCheckBox"></div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name only-text" id="searchName"
                                             data-sitebuilder="dxTextBox"></div>
                                        <div class="col-lg-10" id="targetId" data-sitebuilder="dxLookup"></div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 row center-input">
                                        <div class="col-lg-1 tag-name"><span>?쒕ぉ</span></div>
                                        <div class="col-lg-11 row period">
                                            <div class="col-lg-12" id="title" data-sitebuilder="dxTextBox"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>?댁슜</div>

                            <div class="text-container">
                                <div class="html-editor" id="contents" data-sitebuilder="dxHtmlEditor" style="height: 50vh">
                                </div>
                            </div>
                        </div>

<%--                        <div class="row">--%>
<%--                            <div class="col-lg-9"></div>--%>
<%--                            <div class="col-lg-2" id="attachFilename" data-sitebuilder="dxTextBox"></div>--%>
<%--                            <div class="col-lg-1 btnGray" id="btnAttach" data-sitebuilder="dxButton"></div>--%>

<%--                            <form id="formAttach">--%>
<%--                                <input type="file" id="attach" name="attach" style="display: none;"/>--%>
<%--                            </form>--%>
<%--                        </div>--%>


                        <div class="row-wrap row-wrap-box">

                            <div class="row-wrap right row-btn">
                                <div class="row-box">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <form id="formAttach" style="display: none;">
                                                <input type="file" id="attach" name="attach">
                                            </form>
                                            <div class="col-lg-12" id="attachFilename" data-sitebuilder="dxTextBox"></div>
                                        </div>

                                    </div>

                                </div>

                                <div class="row-box right-btn">
                                    <div class="row-box-inner">
                                        <div class="col-box1 row">
                                            <div class="col-lg-12"><div id="btnAttach" data-sitebuilder="dxButton"></div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>


                    <div class="row btn_area footer-btn">
                        <div class="col-lg-1" id="btnSave" data-sitebuilder="dxButton"></div>
                        <div class="col-lg-1" id="btnList" data-sitebuilder="dxButton"></div>
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
        sitebuilder.openMenu('notice');

        let dxInstances = sitebuilder.createDx(false);

        dxInstances.targetId.option({
            searchEnabled: true,
            // searchExpr: 'companyName',
            searchMode: 'contains',
        });

        dxInstances.group.option({
            dataSource: sitebuilder.typeDef.userType,
            onValueChanged: function (e) {
                if (e.value === 'CM') {
                    dxInstances.searchName.option({
                        value: '湲곗뾽泥?寃??,
                    });
                    LoadCompanyList();
                } else if (e.value === 'HM') {
                    dxInstances.searchName.option({
                        value: '蹂묒썝 寃??,
                    });
                    LoadHospitalList();
                } else if (e.value === 'PM') {
                    dxInstances.searchName.option({
                        value: '?대?',
                    });
                    dxInstances.targetId.option({
                        value: 0,
                        readOnly: true,
                    });
                } else {
                    dxInstances.searchName.option({
                        value: '湲곗뾽泥?寃??,
                    });
                    LoadCompanyList();
                }
            }
        });

        dxInstances.searchName.option({
            readOnly: true,
            value: '- 援щ텇 ?좏깮 -'
        });

        dxInstances.topList.option({
            text: 'Top 怨듭?',
            value: false,
        });

        dxInstances.btnAttach.option({
            text: '?뚯씪泥⑤?',
            onClick: function () {
                $('#attach').trigger('click');
            },
        });

        dxInstances.attachFilename.option({
            readOnly: true,
        });

        $('#attach').on('change', function () {
            if (this.files.length) {
                dxInstances.attachFilename.option('value', this.files[0].name);
            } else {
                dxInstances.attachFilename.option('value', null);
            }
        });

        // Save
        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '???,
            type: 'success',
            onClick: function () {
                let data = sitebuilder.dxToValues();
                // 怨듬갚 諛?<p> ?쒓렇 ?쒓굅 ?댁빞??                // console.log('html   :   ' + data.contents.replace(/\s+/g, ''));

                if (!data.group) {
                    alert('援щ텇???좏깮?댁＜?몄슂.');
                    return;
                } else if (!data.title) {
                    alert('?쒕ぉ???낅젰?댁＜?몄슂.');
                    return;
                } else if (!data.contents) {
                    alert('?댁슜???낅젰?댁＜?몄슂.');
                    return;
                }

                let formData = new FormData($('#formAttach')[0]);
                formData.append('notice', new Blob([JSON.stringify(data)], {
                    type: "application/json"
                }));

                $.ajax({
                    url: '<c:url value="/pm/commune/notice"/>',
                    method: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData,
                }).then(function () {
                    sitebuilder.notify("??λ릺?덉뒿?덈떎.");
                    location.href = '<c:url value="/pm/commune/notice"/>';
                });
            },
        });

        // List
        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '紐⑸줉',
            type: 'normal',
            onClick: function () {
                location.href = '<c:url value="/pm/commune/notice"/>';
            },
        });

        function LoadCompanyList() {
            let ajaxCompany = {
                url: '<c:url value="/common/company?listType=LAST_ALL"/>',
                method: 'GET',
            };

            $.when($.ajax(ajaxCompany)).then(function (response) {
                let allCompany = response.data;
                allCompany.unshift({companyId: 0, companyName: '?꾩껜'});

                dxInstances.targetId.option({
                    readOnly: false,
                    dataSource: allCompany,
                    valueExpr: 'companyId',
                    displayExpr: 'companyName',
                    value: 0,
                });
            });
        }

        function LoadHospitalList() {
            let ajaxHospital = {
                url: '<c:url value="/common/hospital"/>',
                method: 'GET',
            };

            $.when($.ajax(ajaxHospital)).then(function (response) {
                let allHospital = response.data;
                allHospital.unshift({hospitalId: 0, hospitalName: '?꾩껜'});

                dxInstances.targetId.option({
                    readOnly: false,
                    dataSource: allHospital,
                    valueExpr: 'hospitalId',
                    displayExpr: 'hospitalName',
                    value: 0,
                });
            });
        }
    });

</script>
</html>
