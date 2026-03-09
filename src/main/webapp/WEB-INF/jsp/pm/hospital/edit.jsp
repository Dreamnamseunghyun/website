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
                            <h3 class="h3">병원 상세 수정</h3>
                        </div>
                        <div class="tabs-container" id="tabs" data-ggsj="dxTabs"></div>
                    </div>
                    <%--                    <div class="card-body">--%>
                    <div class="dx-viewport">
                        <!-- 병원 기본 정보 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>병원 기본 정보
                                <div class="checkText right"><i class="xi-check-min"></i>필수입력 항목입니다.</div>
                            </div>
                            <div class="row-box6">
                                <div class="row-box-inner1 logo-box">
                                    <div class="col-box1 col-box-vertical4 row logo-img">
                                        <div class="col-lg-12 center-box">
                                            <img id="ciUrl" src="" alt="기업체로고"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 center" style="display: none;" id="ciFilename"
                                         data-ggsj="dxTextBox"></div>
                                    <div class="col-box1 row">
                                        <div class="col-lg-12 center-box">
                                            <div class="col-lg-1 btnGray" id="btnAttach" data-ggsj="dxButton"></div>
                                            <form id="formCi">
                                                <input type="file" id="ci" name="ci" accept="image/*"
                                                       style="display: none;"/>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row-box6-5">

                                <div class="row-box-inner1">
                                    <div class="col-box1 row">
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name check"><span>병원명</span></div>
                                                    <div class="col-lg-8"><div id="hospitalName" data-ggsj="dxTextBox"></div></div>
                                                    <div id="popupHospital" data-ggsj="dxPopup"></div>
                                                </div>
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name check"><span>병원코드</span></div>
                                                    <div class="col-lg-4"><div id="hospitalCode" data-ggsj="dxTextBox"></div></div>
                                                    <div class="col-lg-4"><div id="noUse" data-ggsj="dxCheckBox"></div></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name check"><span>센터명</span></div>
                                                    <div class="col-lg-8"><div id="centerName" data-ggsj="dxTextBox"></div></div>
                                                    <div id="popupCenter" data-ggsj="dxPopup"></div>
                                                </div>
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name check"><span>센터코드</span></div>
                                                    <div class="col-lg-8"><div id="centerCode" data-ggsj="dxTextBox"></div></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-2 tag-name"><span>전화</span></div>
                                                <div class="col-lg-4" id="telephone" data-ggsj="dxTextBox"
                                                     data-ggsj-format="tel"></div>
                                                <div class="col-lg-2 tag-name"><span>홈페이지</span></div>
                                                <div class="col-lg-4" id="homepage" data-ggsj="dxTextBox"></div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>우편번호</span></div>
                                                    <div class="col-lg-2"><div id="zipcode" data-ggsj="dxTextBox"></div></div>
                                                    <div class="col-lg-10"><div class="btnGray" id="btnZip"
                                                                                data-ggsj="dxButton"></div></div>
                                                </div>
                                                <div class="col-lg-box2">
                                                    <div class="col-lg-4 tag-name"><span>위치</span></div>
                                                    <div class="col-lg-8"><div id="locationDesc" data-ggsj="dxTextBox"></div></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-box1 col-lg-box-vertical row">
                                                <div class="col-lg-2 tag-name"><span>주소</span></div>
                                                <div class="col-lg-4" id="address1" data-ggsj="dxTextBox"></div>
                                                <div class="col-lg-2 tag-name"><span>상세주소</span></div>
                                                <div class="col-lg-4" id="address2" data-ggsj="dxTextBox"></div>
                                                <div id="sido" data-ggsj="dxTextBox" style="display: none;"></div>
                                                <div id="sigungu" data-ggsj="dxTextBox" style="display: none;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 병원 기본 정보 -->

                        <!-- 검진 세부 정보 -->
                        <div class="row-wrap">
                            <div class="row-box-title"><i class="xi-play-circle"></i>검진 세부 정보</div>
                            <div class="row-box1">
                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>병원구분</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12"><div id="grade" data-ggsj="dxSelectBox"></div></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name check"><span>검진준비기한</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-12"><div id="preday" data-ggsj="dxSelectBox"></div></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>병원시설</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-3" id="ableCt" data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-3" id="ableMri" data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-3" id="ablePark" data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-3" id="ableSoup" data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box2 row">
                                        <div class="col-lg-2 tag-name"><span>세부사항</span></div>
                                        <div class="col-lg-10 row period">
                                            <div class="col-lg-4" id="ableSatur" data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-4" id="ableSpecial" data-ggsj="dxCheckBox"></div>
                                            <div class="col-lg-4" id="ableAm" data-ggsj="dxCheckBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box3 row center-input">
                                        <div class="col-lg-3 tag-name check"><span>검진접수기간<br>(평일 오전)</span></div>
                                        <div class="col-lg-9 row period">
                                            <div class="col-lg-6 center" id="receiptNormalBegin" data-ggsj="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6 center" id="receiptNormalEnd" data-ggsj="dxDateBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box3 row">
                                        <div class="col-lg-3 tag-name check"><span>검진접수기간<br>(평일 오후)</span></div>
                                        <div class="col-lg-9 row period">
                                            <div class="col-lg-6 center" id="receiptNormalPmBegin"
                                                 data-ggsj="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6 center" id="receiptNormalPmEnd"
                                                 data-ggsj="dxDateBox"></div>
                                        </div>
                                    </div>
                                    <div class="col-box3 row">
                                        <div class="col-lg-3 tag-name check"><span>검진접수기간<br>(토요일)</span></div>
                                        <div class="col-lg-9 row period">
                                            <div class="col-lg-6 center" id="receiptSaturBegin"
                                                 data-ggsj="dxDateBox"></div>
                                            <div class="text-center wavy">~</div>
                                            <div class="col-lg-6 center" id="receiptSaturEnd"
                                                 data-ggsj="dxDateBox"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-box-inner width-box">
                                    <div class="col-box1 col-box-vertical3 row">
                                        <div class="col-lg-1 tag-name"><span>병원 특이사항</span></div>
                                        <div class="col-lg-11 row period">
                                            <div id="notes" data-ggsj="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-box-inner width-box">

                                    <div class="col-box1 col-box-vertical5 row">
                                        <div class="col-lg-1 tag-name"><span>병원 홍보글</span></div>
                                        <div class="col-lg-11 row period">
                                            <div id="advertisement" data-ggsj="dxTextArea"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 검진 세부 정보 -->

                        <div class="row btn_area footer-btn">
                            <div class="col-lg-1" id="btnSave" data-ggsj="dxButton"><i class="xi-save"></i>저장</div>
                            <div class="col-lg-1" id="btnList" data-ggsj="dxButton">목록</div>
                        </div>

                        <div class="row">
                            <div class="col-lg-1" id="popupContainer" data-ggsj="dxPopup"></div>
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    /** @param _dxInstances : {btnCenter} */
    $(function () {
        ggsj.openMenu('hospital');

        let ciForm = $('#ci');

        let ciImage = $('#ciUrl');
        ciImage.hide();

        let dxInstances = ggsj.createDx(false);

        function previewImage(input, target) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();

                reader.onload = function (e) {
                    target.attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        dxInstances.tabs.option({
            hoverStateEnabled: true,
            displayExpr: "centerList",
            keyExpr: "centerId",
            onItemClick: function (e) {
                let center = e.itemData.centerId;
                location.href = '<c:url value="/pm/center"/>/' + center + '/edit';
            }
        });

        dxInstances.hospitalCode.option({
            readOnly: true
        });

        dxInstances.centerCode.option({
            readOnly: true
        });

        dxInstances.homepage.option({
            placeholder: '작성예시) http://www.ggsj.co.kr/ 또는 https://www.ggsj.co.kr/'
        });

        dxInstances.btnZip.option({
            text: '우편번호',
            onClick: function () {
                execution_daum_address(dxInstances.zipcode, dxInstances.sido, dxInstances.sigungu, dxInstances.address1, dxInstances.address2);
            }
        });

        dxInstances.zipcode.option({
            readOnly: true
        });

        dxInstances.address1.option({
            readOnly: true
        });

        // dxInstances.businessNo.option({
        //     mask: '000-00-00000',
        // });

        dxInstances.grade.option({
            dataSource: [
                {'id': 0, 'text': '검진센터'},
                {'id': 1, 'text': '종합병원'},
                {'id': 2, 'text': '상급종합병원'},
            ],
            valueExpr: 'id',
            displayExpr: 'text'
        });

        dxInstances.preday.option({
            dataSource: [
                {'id': 0, 'text': '0일'},
                {'id': 3, 'text': '3일'},
                {'id': 5, 'text': '5일'},
                {'id': 7, 'text': '7일'},
                {'id': 10, 'text': '10일'},
                {'id': 14, 'text': '14일'},
                {'id': 21, 'text': '21일'},
                {'id': 30, 'text': '30일'}
            ],
            valueExpr: 'id',
            displayExpr: 'text'
        });

        dxInstances.ableCt.option({
            value: false,
            text: 'CT'
        });
        dxInstances.ableMri.option({
            value: false,
            text: 'mri'
        });
        dxInstances.ablePark.option({
            value: false,
            text: '주차가능'
        });
        dxInstances.ableSoup.option({
            value: false,
            text: '죽(식사,간식)제공'
        });

        dxInstances.ableSatur.option({
            value: false,
            text: '토요검진 가능'
        });
        dxInstances.ableSpecial.option({
            value: false,
            text: '특수검진 가능'
        });
        dxInstances.ableAm.option({
            value: false,
            text: '오전만 가능'
        });

        dxInstances.receiptNormalBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
        });

        dxInstances.receiptNormalEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
        });

        dxInstances.receiptNormalPmBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
        });

        dxInstances.receiptNormalPmEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
        });

        dxInstances.receiptSaturBegin.option({
            type: 'time',
            displayFormat: 'HH:mm',
        });

        dxInstances.receiptSaturEnd.option({
            type: 'time',
            displayFormat: 'HH:mm',
        });

        // dxInstances.ciFilename.option({
        //     readOnly: true,
        // });

        dxInstances.btnAttach.option({
            text: '파일첨부',
            onClick: function () {
                $('#ci').trigger('click');
            },
        });

        ciForm.on('change', function () {
            if (this.files.length) {
                dxInstances.ciFilename.option('value', this.files[0].name);
                previewImage(this, ciImage);
                ciImage.show();
            } else {
                dxInstances.ciFilename.option('value', null);
                ciImage.hide();
            }
        });

        dxInstances.noUse.option({
            text: '병원(센터) 노출 중지'
        });

        dxInstances.notes.option({
            placeholder: '최대 200자 작성'
        });

        dxInstances.advertisement.option({
            height: '150px',
            placeholder: '최대 1000자 작성'
        });

        dxInstances.btnSave.option({
            stylingMode: 'contained',
            type: 'success',
            onClick: function () {
                let data = ggsj.dxToValues();

                let formData = new FormData($('#formCi')[0]);
                formData.append('hospital', new Blob([JSON.stringify(data)], {
                    type: "application/json"
                }));

                $.ajax({
                    url: '<c:url value="/pm/center/${centerId}/0"/>',
                    method: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData,
                }).then(function () {
                    ggsj.notify("저장되었습니다.");
                    location.href = '<c:url value="/pm/hospital"/>';
                });
            }
        });

        dxInstances.btnList.option({
            stylingMode: 'contained',
            onClick: function () {
                location.href = '<c:url value="/pm/hospital"/>';
            }
        });

        // Load
        $.ajax({
            url: '<c:url value="/pm/center/${centerId}"/>',
            method: 'GET',
        }).then(function (response) {
            // console.log(response);

            ggsj.valuesToDx(response.data);

            if (response.data.ciUrl) {
                $('#ciUrl').attr('src', response.data.ciUrl).show();
            }

            $.ajax({
                url: '<c:url value="/pm/tabs"/>',
                method: 'GET',
                data: {
                    hospitalId: response.data.hospitalId,
                    centerId: response.data.centerId,
                },
                success: function (responseTabs) {
                    if (responseTabs.data.length > 1) {
                        let idx = responseTabs.data.findIndex(function (element) {
                            return response.data.centerId === element.centerId;
                        });

                        if (idx >= 0) {
                            dxInstances.tabs.option({
                                items: responseTabs.data,
                                selectedIndex: idx,
                            });
                        }
                    } else {
                        dxInstances.tabs.option({
                            visible: false,
                        });
                    }
                }
            });
        });

        /* 다음 주소 연동 */
        function execution_daum_address(zipcode, sido, sigungu, address1, address2) {
            new daum.Postcode({
                oncomplete: function (data) {
                    let extraAddr = '';

                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        extraAddr = ' (' + extraAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    zipcode.option({
                        value: data.zonecode,
                    });

                    sido.option({
                        value: data.sido,
                    });

                    sigungu.option({
                        value: data.sigungu,
                    });

                    address1.option({
                        value: data.address + ' ' + extraAddr,
                    });

                    address2.focus();
                }
            }).open();
        }
    });
</script>
</html>
