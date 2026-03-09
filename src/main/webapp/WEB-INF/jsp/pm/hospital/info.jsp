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
                            <h3 class="h3">병원홍보</h3>
                        </div>
                        <div class="tabs-container" id="tabs" data-ggsj="dxTabs"></div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">

                        <div class="row-wrap row-wrap-box">
                            <div class="row-box4">
                                <div class="row-box-inner">
                                    <div class="col-box1 row">
                                        <div class="col-lg-box1 col-box-border">
                                            <div class="col-lg-4 tag-name"><span>병원명</span></div>
                                            <div class="col-lg-8" id="hospitalCenterName" data-ggsj="dxTextBox">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row-wrap">
                            <div class="row-box-title margin-title"><i class="xi-play-circle"></i>홍보 이미지</div>

                            <div class="row-box1 row-box-margin-bottom">
                                <div class="row-box-inner col-box-margin-right">

                                    <div class="col-box3 col-box-border">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-3 tag-name">전경</div>
                                                <div class="col-lg-5"><div id="centerAdvFilename1" data-ggsj="dxTextBox"></div></div>
                                                <div class="col-lg-4 center-box btn-margin">
                                                        <div id="btnAttach1" data-ggsj="dxButton"></div>
                                                        <div id="btnDelete1" data-ggsj="dxButton"></div>
                                                </div>

                                            </div>
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <img id="centerAdvUrl1" src="" style="display: none;" alt="홍보이미지1"/>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-box3 col-box-border">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-3 tag-name">로비</div>
                                                <div class="col-lg-5"><div id="centerAdvFilename2" data-ggsj="dxTextBox"></div></div>
                                                <div class="col-lg-4 center-box btn-margin">
                                                    <div id="btnAttach2" data-ggsj="dxButton"></div>
                                                    <div id="btnDelete2" data-ggsj="dxButton"></div>
                                                </div>

                                            </div>
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <img id="centerAdvUrl2" src="" style="display: none;" alt="홍보이미지1"/>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-box3 col-box-border">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-3 tag-name">내시경실</div>
                                                <div class="col-lg-5"><div id="centerAdvFilename3" data-ggsj="dxTextBox"></div></div>
                                                <div class="col-lg-4 center-box btn-margin">
                                                    <div id="btnAttach3" data-ggsj="dxButton"></div>
                                                    <div id="btnDelete3" data-ggsj="dxButton"></div>
                                                </div>

                                            </div>
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <img id="centerAdvUrl3" src="" style="display: none;" alt="홍보이미지1"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!--row-box-->


                            <div class="row-box1 row-box-margin-bottom">
                                <div class="row-box-inner col-box-margin-right">

                                    <div class="col-box3 col-box-border">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-3 tag-name">특별한 장비</div>
                                                <div class="col-lg-5" id="centerAdvFilename4" data-ggsj="dxTextBox"></div>
                                                <div class="col-lg-4 center-box btn-margin">
                                                    <div id="btnAttach4" data-ggsj="dxButton"></div>
                                                    <div id="btnDelete4" data-ggsj="dxButton"></div>
                                                </div>

                                            </div>
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <img id="centerAdvUrl4" src="" style="display: none;" alt="홍보이미지1"/>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-box3 col-box-border">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-3 tag-name">특별한 공간</div>
                                                <div class="col-lg-5"><div id="centerAdvFilename5" data-ggsj="dxTextBox"></div></div>
                                                <div class="col-lg-4 center-box btn-margin">
                                                    <div id="btnAttach5" data-ggsj="dxButton"></div>
                                                    <div id="btnDelete5" data-ggsj="dxButton"></div>
                                                </div>

                                            </div>
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <img id="centerAdvUrl5" src="" style="display: none;" alt="홍보이미지1"/>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-box3 col-box-border">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-3 tag-name">특별한 공간</div>
                                                <div class="col-lg-5"><div id="centerAdvFilename6" data-ggsj="dxTextBox"></div></div>
                                                <div class="col-lg-4 center-box btn-margin">
                                                    <div id="btnAttach6" data-ggsj="dxButton"></div>
                                                    <div id="btnDelete6" data-ggsj="dxButton"></div>
                                                </div>

                                            </div>
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <img id="centerAdvUrl6" src="" style="display: none;" alt="홍보이미지1"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!--row-box-->



                        </div>

                    </div>






                    <form id="formCenterAdv">
                        <input type="file" id="centerAdv1" name="centerAdv[]" accept="image/*"
                               style="display: none; width: 372px;"/>
                        <input type="file" id="centerAdv2" name="centerAdv[]" accept="image/*"
                               style="display: none; width: 372px;"/>
                        <input type="file" id="centerAdv3" name="centerAdv[]" accept="image/*"
                               style="display: none; width: 372px;"/>
                        <input type="file" id="centerAdv4" name="centerAdv[]" accept="image/*"
                               style="display: none; width: 372px;"/>
                        <input type="file" id="centerAdv5" name="centerAdv[]" accept="image/*"
                               style="display: none; width: 372px;"/>
                        <input type="file" id="centerAdv6" name="centerAdv[]" accept="image/*"
                               style="display: none; width: 372px;"/>
                    </form>
                    <div class="row btn_area footer-btn">
                        <div class="col-lg-1" id="btnSave" data-ggsj="dxButton" style="margin-right:5px"></div>
                        <div class="col-lg-1" id="btnList" data-ggsj="dxButton" style="margin-left:5px"></div>
                    </div>
                </div>
                <%--                    </div>--%>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/jsp/common/script.jsp" %>
</body>
<script>
    /** @param _dxInstances : {panorama,btnPAttach,lobby,btnLAttach,endoscopy,btnEAttach,equipment,btnEQAttach,btnSAttach,space2,btnSAttach2,review,itemData} */

    $(function () {
        ggsj.openMenu('hospital');

        let dxInstances = ggsj.createDx(false);

        dxInstances.tabs.option({
            hoverStateEnabled: true,
            displayExpr: "centerList",
            keyExpr: "centerId",
            onItemClick: function (e) {
                let center = e.itemData.centerId;
                location.href = '<c:url value="/pm/center"/>/' + center + '/info';
            }
        });

        dxInstances.hospitalCenterName.option({
            readOnly: true,
        });

        for (let i = 1; i <= 6; i++) {
            dxInstances['centerAdvFilename' + i].option({
                readOnly: true,
                placeholder: '600px X 400px 이미지가 적합합니다.'
            });

            dxInstances['btnAttach' + i].option({
                text: '파일첨부',
                onClick: function () {
                    $('#centerAdv' + i).trigger('click');
                },
            });

            dxInstances['btnDelete' + i].option({
                text: '파일삭제',
                onClick: function () {
                    dxInstances['centerAdvFilename' + i].option('value', null);
                    $('#centerAdvUrl' + i).hide();
                },
            });

            $('#centerAdv' + i).on('change', function () {
                if (this.files.length) {
                    dxInstances['centerAdvFilename' + i].option('value', this.files[0].name);
                } else {
                    dxInstances['centerAdvFilename' + i].option('value', null);
                }
            });
        }

        // Save
        dxInstances.btnSave.option({
            stylingMode: 'contained',
            text: '저장',
            type: 'success',
            onClick: function () {
                let data = ggsj.dxToValues();

                let formData = new FormData($('#formCenterAdv')[0]);
                formData.append('center', new Blob([JSON.stringify(data)], {
                    type: "application/json"
                }));

                $.ajax({
                    url: '<c:url value="/pm/center/${centerId}/adv"/>',
                    method: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData,
                }).then(function () {
                    ggsj.notify("저장되었습니다.");
                    location.reload();
                });
            }
        });

        // List
        dxInstances.btnList.option({
            stylingMode: 'contained',
            text: '목록',
            onClick: function (response) {
                console.log(response);
                location.href = '<c:url value="/pm/hospital"/>';
            }
        });

        // Load
        $.ajax({
            url: '<c:url value="/pm/center/${centerId}"/>',
            method: 'GET',
        }).then(function (response) {
            console.log(response)
            ggsj.valuesToDx(response.data);

            $.ajax({
                url: '<c:url value="/pm/tabs"/>',
                method: 'GET',
                data: {
                    hospitalId: response.data.hospitalId,
                    centerId: response.data.centerId,
                },
                success: function (responseTabs) {
                    if (responseTabs.data.length > 1) {
                        let idx;
                        for (idx = 0; idx < responseTabs.data.length; idx++) {
                            if (responseTabs.data[idx].centerId === response.data.centerId) {
                                break;
                            }
                        }

                        dxInstances.tabs.option({
                            items: responseTabs.data,
                            selectedIndex: idx,
                        });
                    } else {
                        dxInstances.tabs.option({
                            visible: false,
                        });
                    }
                }
            });

            for (let i = 1; i <= 6; i++) {
                if (response.data['centerAdvUrl' + i]) {
                    $('#centerAdvUrl' + i).attr('src', response.data['centerAdvUrl' + i]).show();
                }
            }
        });
    });
</script>
</html>
