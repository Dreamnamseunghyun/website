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
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>건강한 건강상식</div>
                            <div class="row-box1" style="border-bottom:0;">
                                <div class="row-box-inner col-box-margin-right">

                                    <div class="col-box1 col-box-border">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-1 tag-name">제목</div>
                                                <div class="col-lg-11"><div id="title" data-ggsj="dxTextBox"></div></div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-1 tag-name">경로지정</div>
                                                <div class="col-lg-11"><div id="linkUrl" data-ggsj="dxTextBox"></div></div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-1 tag-name">썸네일</div>
                                                <div class="col-lg-9"><div id="attachFilename" data-ggsj="dxTextBox"></div></div>
                                                <div class="col-lg-2 btn-margin2" style="padding:0 16px!important; justify-content:flex-end"><div id="btnAttach" data-ggsj="dxButton"></div></div>
                                            </div>


                                        </div>
                                    </div>

                                </div>
                            </div><!--row-box-->
                        </div>

                        <div class="row-wrap">
                            <div class="row-box1" style="border-bottom:0;">
                                <div class="row-box-inner col-box-margin-right">

                                    <div class="col-box1 col-box-border">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-box1 col-lg-box-vertical row">

                                                <div class="col-lg-12" style="padding:20px!important;">
                                                    <form id="formAttach">
                                                        <input type="file" id="attach" name="attach" accept="image/*" style="display: none;"/>
                                                    </form>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div><!--row-box-->
                        </div>




<%--                        <div class="row">--%>
<%--                            <div class="col-lg-1 tag-area">제목</div>--%>
<%--                            <div class="col-lg-10" id="title" data-ggsj="dxTextBox"></div>--%>
<%--                        </div>--%>

<%--                        <div class="row">--%>
<%--                            <div class="col-lg-1">경로지정</div>--%>
<%--                            <div class="col-lg-10" id="linkUrl" data-ggsj="dxTextBox"></div>--%>
<%--                        </div>--%>

<%--                        <div class="row">--%>
<%--                            <div class="col-lg-1">썸네일</div>--%>
<%--                            <div class="col-lg-8" id="attachFilename" data-ggsj="dxTextBox"></div>--%>
<%--                            <div class="col-lg-2" id="btnAttach" data-ggsj="dxButton"></div>--%>
<%--                            <form id="formAttach">--%>
<%--                                <input type="file" id="attach" name="attach" accept="image/*" style="display: none;"/>--%>
<%--                            </form>--%>
<%--                        </div>--%>





<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-9 logo_img"><img id="healthSenseUrl" src=""--%>
<%--                                                                                        alt="건강상식첨부파일"/></div>--%>
<%--                                                </div>--%>



                    </div>
                    <%--                    </div>--%>
                </div>

                <div class="row btn_area footer-btn">
                    <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"><i class="xi-save"></i>저장</div>
                    <div class="col-lg-1" id="btnList" data-ggsj="dxButton">목록</div>
                    <div class="col-lg-1" id="btnDelete" data-ggsj="dxButton">삭제</div>
                </div>

            </div>
        </div>


    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    /** @param _dxInstances : {thumbnail} */
    $(function () {
        ggsj.openMenu('healthcare');

        let dxInstances = ggsj.createDx(false);

        function previewImage(input, target) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();
                reader.onload = function (e) {
                    target.attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        dxInstances.btnAttach.option({
            text: '파일첨부',
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

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '저장',
            type: 'success',
            onClick: function () {
                let data = ggsj.dxToValues();

                let formData = new FormData($('#formAttach')[0]);
                formData.append('healthsense', new Blob([JSON.stringify(data)], {
                    type: "application/json"
                }));

                $.ajax({
                    url: '<c:url value="/pm/healthsense/${healthSenseId}"/>',
                    method: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData,
                }).then(function () {
                    ggsj.notify("저장되었습니다.");
                    location.href = '<c:url value="/pm/healthsense"/>';
                });
            }
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '목록',
            onClick: function () {
                location.href = '<c:url value="/pm/commune/healthcare"/>';
            }
        });

        dxInstances.btnDelete.option({
            stylingMode: 'contained',
            text: '삭제',
            type: 'danger',
        });

        // load by ajax async
        $.ajax({
            url: '<c:url value="/pm/healthsense/${healthSenseId}"/>',
            method: 'GET',
        }).then(function (response) {
            ggsj.valuesToDx(response.data);
        });
    });
</script>

</html>
