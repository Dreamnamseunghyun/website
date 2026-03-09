<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--@elvariable id="sessionUserId" type="java.lang.String"--%>
<%--@elvariable id="sessionLoginName" type="java.lang.String"--%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Í±¥Í∞ï?¥Ïûê(?¨Ïö©?? ÎßàÏù¥?òÏù¥ÏßÄ</title>
    <link href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet" type="text/css">
    <link href="../css/us/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/us/common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/header.css" rel="stylesheet" type="text/css">
    <link href="../css/us/footer.css" rel="stylesheet" type="text/css">
    <link href="../css/us/reserve_step_line.css" rel="stylesheet" type="text/css">
    <link href="../css/us/sub_common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/mypage.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="<c:url value="/lib/devextreme/dx.material.sitebuilder.css"/>">
    <style>
        .dx-overlay-wrapper {
            z-index: 10000 !important;
        }

        .dx-placeholder {
            font-size: 13px;
            color: #9b9dad;
            letter-spacing: 1.2px;
            font-weight: 400;
        }

        #familyName.select_box_area .dx-dropdowneditor-input-wrapper::after {
            display: none;
        }

        #familyName.select_box_area .dx-dropdowneditor-icon::before {
            border-color: #fff;
        }

        #familyName.select_box_area .dx-texteditor-input {
            color: #fff;
        }

        #familyName .dx-texteditor-container {
            padding-left: 0;
        }

        #familyName .dx-placeholder {
            font-size: 18px;
            color: #ffffff !important;
            font-weight: 500;
        }

        #familyName .dx-texteditor-input {
            font-size: 18px;
            color: #ffffff !important;
        }

        #familyName .dx-dropdowneditor-icon {
            color: #ffffff !important;
        }

        #familyName .dx-texteditor.dx-editor-underlined::after {
            border: 0;
        }

        #familyName .dx-dropdowneditor-input-wrapper {
            border: none;
        }
    </style>
</head>
<body>
<header></header>
<div class="header_blank"></div>
<!--header-->
<main>
    <section class="main_section">
        <div class="main_cont">
            <div class="container">
                <div class="title_area">
                    <span class="point_line point_color"></span>
                    <div class="title">
                        <h2>ÎßàÏù¥?òÏù¥ÏßÄ</h2>
                    </div>
                </div><!--title_area-->

                <div class="confirmUser">
                    <div class="confirmFamily">
                        <div class="write"><!--Ï≤¥ÌÅ¨Î∞ïÏä§-->
                            <div class="chk_type2_2_user chk_area">


                                <div class="chk_boxArea bg_point" id="selectMyself">

                                    <label class="item" for="s_v1_1">
                                        <div class="info_area">
                                            <div class="title"><span>Î≥∏Ïù∏</span></div>
                                            <div class="img">
                                                <img src="../img/us/mypage/familySelection_user_img.png"></div>
                                            <div class="user_name">
                                                <span><c:out value="${sessionLoginName}"/></span>
                                            </div>
                                        </div>

                                        <div class="check_area">
                                            <input type="checkbox" name="s_v1_1" id="s_v1_1" class="hidden" value="Î≥∏Ïù∏"
                                                   <c:if test="${employee.myself == 1}">checked</c:if>>

                                            <label class="cbx" for="s_v1_1">
                                                <svg height="20px" viewBox="0 -8 16 30" width="20px">
                                                    <polyline points="1 7.6 5 11 13 1"></polyline>
                                                </svg>
                                            </label>
                                        </div>

                                    </label>

                                </div><!--chk_box_area-->


                                <div class="chk_boxArea bg_blue" id="selectFamily">

                                    <label class="item" for="s_v1_2">
                                        <div class="info_area">
                                            <div class="title"><span>Í∞ÄÏ°?/span></div>
                                            <div class="img">
                                                <img src="../img/us/mypage/familySelection_family_img.png">
                                            </div>
                                            <div class="user_name">
                                                <span id="familyName" class="select_box_area"></span>
                                            </div>
                                        </div>

                                        <div class="check_area">
                                            <input type="checkbox" name="s_v1_2" id="s_v1_2" class="hidden" value="Í∞ÄÏ°?
                                                   <c:if test="${employee.myself != 1}">checked</c:if>>

                                            <label class="cbx" for="s_v1_2">
                                                <svg height="20px" viewBox="0 -8 16 30" width="20px">
                                                    <polyline points="1 7.6 5 11 13 1"></polyline>
                                                </svg>
                                            </label>
                                        </div>
                                        <c:if test="${employee.myself != 1 && employee.employeeCheckup.supportType == 1}">
                                            <p class="add_info">&#40;Í≤ÄÏßÑÎπÑ ÎØ∏Ï????Ä??#41;</p>
                                        </c:if>
                                    </label>

                                </div><!--chk_box_area-->
                            </div>
                        </div>
                    </div><!--confirmCost-->
                    <div class="confirmItems">
                        <table>
                            <tr>
                                <td class="title">Í∏∞ÏóÖÎ™?/td>
                                <td class="form">

                                    <div class="write">
                                        <div class="input_type1">
                                            <c:out value="${employee.companyName}"/>
                                        </div>
                                    </div>

                                </td>
                            </tr><!--Í∏∞ÏóÖÎ™?->

                            <tr>
                                <td class="title">?¥Î¶Ñ</td>
                                <td class="form">

                                    <div class="write">
                                        <div class="input_type1">
                                            <label for="s_v2">
                                                <input type="text" name="s_v2" id="s_v2" class="ko" placeholder="&nbsp;"
                                                       maxlength="15" autocomplete="off"
                                                       value="<c:out value="${employee.employeeName}"/>">
                                                <span class="label">?¥Î¶Ñ???ÖÎ†•?òÏÑ∏??</span>
                                            </label>
                                        </div>
                                    </div>

                                </td>
                            </tr><!--?¥Î¶Ñ-->

                            <tr>
                                <td class="title">?ùÎÖÑ?îÏùº</td>
                                <td class="form">
                                    <div class="write">
                                        <div class="input_type1 add_info">
                                            <div id="birth" class="select_box_area"></div>
                                        </div>
                                    </div><!--?ùÎÖÑ?îÏùº-->

                                </td>
                            </tr><!--?ùÎÖÑ?îÏùº-->

                            <tr>
                                <td class="title">?±Î≥Ñ</td>
                                <td class="form">

                                    <div class="write"><!--Ï≤¥ÌÅ¨Î∞ïÏä§-->
                                        <div class="chk_type2 chk_area">

                                            <c:choose>
                                                <c:when test="${reserve.reservationState == null}">
                                                    <div class="chk_boxArea">
                                                        <label class="item" for="s_v4_1">
                                                            <input type="checkbox" name="s_v4_1" id="s_v4_1"
                                                                   class="hidden"
                                                                   value="?®ÏÑ±"
                                                                   <c:if test="${employee.sex == 'M'}">checked</c:if>>
                                                            <label class="cbx<c:if test="${employee.sex == 'M'}"> chk_true1</c:if>"
                                                                   for="s_v4_1">
                                                                <svg height="20px" viewBox="0 -8 16 30" width="20px">
                                                                    <polyline points="1 7.6 5 11 13 1"></polyline>
                                                                </svg>
                                                            </label>
                                                            <label class="cbx-lbl<c:if test="${employee.sex == 'M'}"> chk_true2</c:if>"
                                                                   for="s_v4_1">?®ÏÑ±</label>
                                                        </label>
                                                    </div>
                                                    <div class="chk_boxArea">
                                                        <label class="item" for="s_v4_2">
                                                            <input type="checkbox" name="s_v4_2" id="s_v4_2"
                                                                   class="hidden"
                                                                   value="?¨ÏÑ±"
                                                                   <c:if test="${employee.sex == 'F'}">checked</c:if>>
                                                            <label class="cbx<c:if test="${employee.sex == 'F'}"> chk_true1</c:if>"
                                                                   for="s_v4_2">
                                                                <svg height="20px" viewBox="0 -8 16 30" width="20px">
                                                                    <polyline points="1 7.6 5 11 13 1"></polyline>
                                                                </svg>
                                                            </label>
                                                            <label class="cbx-lbl<c:if test="${employee.sex == 'F'}"> chk_true2</c:if>"
                                                                   for="s_v4_2">?¨ÏÑ±</label>
                                                        </label>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:out value="${employee.sex == 'M' ? '?®ÏÑ±' : '?¨ÏÑ±'}"/>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                    </div>

                                </td>
                            </tr><!--?±Î≥Ñ-->

                            <c:if test="${employee.myself == 1}">
                                <tr>
                                    <td class="title">ÎπÑÎ?Î≤àÌò∏ Î≥ÄÍ≤?/td>
                                    <td class="form">
                                        <div class="input_area">
                                            <div class="write">
                                                <div class="input_type1 password_area">
                                                    <label for="s_v5_1" class="password_box">
                                                        <input type='password' name="s_v5_1" id="s_v5_1"
                                                               class="password_input" placeholder="&nbsp;" required=""
                                                               autocomplete="off" maxlength="16">
                                                        <span class="label">ÎπÑÎ?Î≤àÌò∏Î•??ÖÎ†•?¥Ï£º?∏Ïöî.</span>
                                                    </label>
                                                    <span class="password_icon"><i class="fa fa-eye-slash"></i></span>
                                                </div>
                                            </div><!--ÎπÑÎ?Î≤àÌò∏ Î≥ÄÍ≤?->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="title">ÎπÑÎ?Î≤àÌò∏ ?ïÏù∏</td>
                                    <td class="form">
                                        <div class="input_area">
                                            <div class="write">
                                                <div class="input_type1 password_area">
                                                    <label for="s_v5_2" class="password_box">
                                                        <input type='password' name="s_v5_2" id="s_v5_2"
                                                               class="password_input" placeholder="&nbsp;" required=""
                                                               autocomplete="off" maxlength="16">
                                                        <span class="label">ÎπÑÎ?Î≤àÌò∏ ?ïÏù∏</span>
                                                    </label>
                                                    <span class="password_icon"><i class="fa fa-eye-slash"></i></span>
                                                </div>
                                            </div><!--??ÎπÑÎ?Î≤àÌò∏-->
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                            <c:if test="${employee.myself != 1 && employee.employeeCheckup.supportType == 1}">
                                <tr>
                                    <td class="title">Í≤ÄÏßÑÏú†??/td>
                                    <td class="form">
                                        <div class="write">
                                            <div class="input_type1 add_info">
                                                <div id="companyCheckupTypeId"></div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <!--?¥Î??∞Î≤à??->
                            </c:if>

                            <tr>
                                <td class="title">?¥Î??ÑÌôî</td>
                                <td class="form">
                                    <div class="write">
                                        <div class="input_type1">
                                            <label for="s_v6">
                                                <input type="text" name="s_v6" id="s_v6" class="only_num phone_num"
                                                       placeholder="&nbsp;" maxlength="13" autocomplete="off"
                                                       value="<c:out value="${employee.mobile}"/>">
                                                <span class="label">?¥Î???Î≤àÌò∏ (?´ÏûêÎßåÏûÖ??</span>
                                            </label>
                                        </div>
                                    </div>
                                </td>
                            </tr><!--?¥Î??∞Î≤à??->

                            <tr>
                                <td class="title">?¥Î©î??/td>
                                <td class="form">
                                    <div class="email_type">
                                        <div class="write">
                                            <div class="input_type1">
                                                <label for="s_v7_1">
                                                    <input type="text" name="s_v7_1" id="s_v7_1" class="email_input"
                                                           placeholder="&nbsp;" autocomplete="off"
                                                           value="<c:out value="${employee.email.indexOf('@') < 0 ? '' : employee.email.substring(0, employee.email.indexOf('@'))}"/>">
                                                    <span class="label">?¥Î©î???ÑÏù¥??/span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="email_at">@</div>

                                        <div class="write">
                                            <div class="input_type1">
                                                <label for="s_v7_2">
                                                    <input type="text" name="s_v7_2" id="s_v7_2" class="email_input"
                                                           placeholder="&nbsp;" autocomplete="off"
                                                           value="<c:out value="${employee.email.substring(employee.email.indexOf('@') + 1)}"/>">
                                                    <span class="label">?¥Î©î??Ï£ºÏÜå</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr><!--?¥Î©î??->

                            <tr>
                                <td class="title">Ï£ºÏÜå</td>
                                <td class="form">
                                    <div class="write line_box_type2"><!--Ï£ºÏÜå-->
                                        <div class="line1">
                                            <div class="input_type1 add_info postcode">
                                                <label for="s_v9_1">
                                                    <input type="text" name="s_v9_1" id="s_v9_1"
                                                           class="only_num address_code_1" placeholder="&nbsp;"
                                                           maxlength="5" autocomplete="off"
                                                           value="<c:out value="${employee.zipcode}"/>" readonly>
                                                    <span class="label">?∞Ìé∏Î≤àÌò∏</span>
                                                </label>
                                                <div class="add_info">

                                                    <div class="btn_area">
                                                        <div class="btn search_btn" onclick="address_API()">
                                                            <span class="button_on_circle"></span>
                                                            <a class="btn_inner point_color">
                                                                                  <span class="btn_txt_area">
                                                                                    Í≤Ä??<i class="xi-search"></i>
                                                                                  </span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!--line1-->

                                        <div class="line2 float_box">
                                            <div class="input_type1">
                                                <label for="s_v9_2">
                                                    <input type="text" name="s_v9_2" id="s_v9_2" class="address_code_2"
                                                           placeholder="&nbsp;" autocomplete="off"
                                                           value="<c:out value="${employee.address1}"/>" readonly>
                                                    <span class="label">Ï£ºÏÜå</span>
                                                </label>
                                            </div>

                                            <div class="input_type1">
                                                <label for="s_v9_3">
                                                    <input type="text" name="s_v9_3" id="s_v9_3" class="address_code_3"
                                                           placeholder="&nbsp;" autocomplete="off"
                                                           value="<c:out value="${employee.address2}"/>">
                                                    <span class="label">?ÅÏÑ∏Ï£ºÏÜå</span>
                                                </label>
                                            </div>
                                        </div><!--line2-->
                                    </div>

                                </td>
                            </tr>

                        </table>
                        <div class="confirmUser_btn">
                            <div class="btn_area">
                                <div class="btn check_btn">
                                    <span class="button_on_circle"></span>
                                    <a href="#none" class="btn_inner orange">
                                                      <span class="btn_txt_area">
                                                        ?ïÎ≥¥ ?ïÏù∏ ?ÑÎ£å
                                                      </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn_type2">
                        <div class="btn_area">
                            <div class="btn check_edit_btn">
                                <span class="button_on_circle"></span>
                                <a href="#none" class="btn_inner blue_gradient">
                                                      <span class="btn_txt_area">
                                                        ?òÏ†ï
                                                      </span>
                                </a>
                            </div>
                        </div>

                        <div class="btn_area">
                            <div class="btn cancle_btn">
                                <span class="button_on_circle"></span>
                                <a href="javascript:history.back()" class="btn_inner grey">
                                                      <span class="btn_txt_area">
                                                        Ï∑®ÏÜå?òÍ∏∞
                                                      </span>
                                </a>
                            </div>
                        </div>
                    </div>


                </div>
            </div><!--confirmCost-->


        </div><!--container-->


        </div><!--main_cont-->
    </section><!--main_section-->
    <div id="search_address"></div>
</main>


<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="../js/us/custom_select.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/us/address_api.js"></script>
<script src="../js/us/sub_common.js"></script>

<script type="text/javascript" src="<c:url value="/lib/devextreme/dx-quill.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/lib/devextreme/dx.all.js"/>"></script>
<script type="text/javascript" src="<c:url value="/lib/devextreme/localization/dx.messages.ko.js"/>"></script>
<script>

    DevExpress.localization.locale(navigator.language);

    $.ajax({
        url: '<c:url value="/us/family"/>',
    }).then(function (response) {
        $('#familyName').dxSelectBox({
            <c:if test="${employee.myself != 1}">
            value: <c:out value="${employee.userId}"/>,
            </c:if>
            valueExpr: 'userId',
            displayExpr: 'employeeName',
            dataSource: response.data,
            width: '100px',
            focusStateEnabled: false,
            activeStateEnabled: false,
            hoverStateEnabled: false,
            onValueChanged: function (e) {
                location.href = 'mypage.html?userId=' + e.value;
            }
        });
    });

    $('#birth').dxDateBox({
        useMaskBehavior: true,
        displayFormat: 'yyyy.MM.dd',
        placeholder: '?ùÎÖÑ?îÏùº???†ÌÉù??Ï£ºÏÑ∏??',
        value: new Date(<c:out value="${employee.birth.time}"/>),
    });

    $('#companyCheckupTypeId').dxSelectBox({
        valueExpr: 'companyCheckupTypeId',
        displayExpr: 'companyCheckupTypeName',
        placeholder: 'Í≤ÄÏßÑÏú†?ïÏùÑ ?†ÌÉù??Ï£ºÏÑ∏??',
        dataSource: [
            <c:forEach items="${copayCompanyCheckupTypeList}" var="copayCompanyCheckup">
            {
                companyCheckupTypeId: <c:out value="${copayCompanyCheckup.companyCheckupTypeId}"/>,
                companyCheckupTypeName: '<c:out value="${copayCompanyCheckup.companyCheckupTypeName}"/> (<fmt:formatNumber value="${copayCompanyCheckup.hospitalPay}" pattern="#,###"/> ??',
            },
            </c:forEach>
        ],
        value: <c:out value="${employee.employeeCheckup.companyCheckupTypeId}"/>,
        <c:if test="${reserve.reservationState != null}">
        readOnly: true,
        </c:if>
    });


    $("header").load("header.html");
    $("footer").load("footer.html");

    $('.chk_type2_2_user .chk_boxArea label').off();
    $('#selectMyself').on('click', function (e) {
        e.preventDefault();
        location.href = 'mypage.html?userId=<c:out value="${sessionUserId}"/>';
    });
    $('#selectFamily').on('click', function (e) {
        e.preventDefault();
        $('#familyName').dxSelectBox('instance').open();
    });


    $('.check_btn').on('click', function () {
        if (getUserInfo()) {
            Swal.fire('?òÏ†ï \nÎ≤ÑÌäº???åÎü¨Ï£ºÏÑ∏??', '', 'success');
        }
    });

    $('.check_edit_btn').on('click', function () {  //?òÏ†ï Î≤ÑÌäº
        let userInfo = getUserInfo();
        if (!userInfo) {
            Swal.fire('?ïÎ≥¥ ?ïÏù∏??n?ÑÎ£å?òÏã† ???úÎèÑ??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        $.ajax({
            url: '<c:url value="/us/edit"/>',
            method: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(userInfo),
        }).then(function (response) {
            if (response.code === 'SUCCESS') {
                Swal.fire('?ëÏÑ±?òÏã† ?ïÎ≥¥Î°?n?òÏ†ï???ÑÎ£å?òÏóà?µÎãà??', '', 'success').then(function () {
                    location.href = "index.html";
                });
            } else {
                Swal.fire(response.message, '', 'error');
            }
        }, function (jqXHR) {
            console.log(jqXHR);
            Swal.fire('Error!', '', 'error');
        });
    });

    function getUserInfo() {
        <c:if test="${reserve.reservationState != null && reserve.reservationState != 1 && reserve.reservationState != 3}">
        Swal.fire('?àÏïΩ ?ÑÏóê???åÏõê?ïÎ≥¥Î•??òÏ†ï?????ÜÏäµ?àÎã§.', '', 'warning');
        return;
        </c:if>

        let employeeName = $('#s_v2');
        if (!employeeName.val()) { //?¥Î¶Ñ
            employeeName.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                employeeName.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('?¥Î¶Ñ???ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        <c:if test="${reserve.reservationState == null}">
        if ($('#s_v4_1:checked').length <= "0" && $('#s_v4_2:checked').length <= "0") {//?±Î≥Ñ
            $("#s_v4_1").parents("label").find(".cbx").addClass("chk_focus").focus();
            $("#s_v4_2").parents("label").find(".cbx").addClass("chk_focus").focus();

            setTimeout(function () {
                $("#s_v4_1").parents("label").find(".cbx").removeClass('chk_focus');
                $("#s_v4_2").parents("label").find(".cbx").removeClass('chk_focus');
            }, 1000);

            Swal.fire('?±Î≥Ñ???†ÌÉù??Ï£ºÏÑ∏??, '', 'warning');
            return;
        }

        let sex = 'F';
        if ($('#s_v4_1:checked').length) {
            sex = 'M';
        }
        </c:if>

        let birth = $('#birth').dxDateBox('instance');
        if (!birth.option('value')) { //?ùÎÖÑ?îÏùº
            Swal.fire('?ùÎÖÑ?îÏùº???†ÌÉù??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        <c:if test="${employee.myself != 1 && employee.employeeCheckup.supportType == 1}">
        let companyCheckupTypeId = $('#companyCheckupTypeId').dxSelectBox('instance');
        if (!companyCheckupTypeId.option('text')) { //Í≤ÄÏßÑÏú†??            Swal.fire('Í≤ÄÏßÑÏú†?ïÏùÑ ?†ÌÉù??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }
        </c:if>

        let userPw = $('#s_v5_1');
        let checkPw = $('#s_v5_2');
        if (userPw.val() || checkPw.val()) {
            // Î≥ÄÍ≤ΩÎê† ÎπÑÎ?Î≤àÌò∏
            if (!userPw.val()) {
                userPw.parents("label").addClass("input_focus").find("input").focus();
                setTimeout(function () {
                    userPw.parents("label").removeClass("input_focus");
                }, 1000);

                Swal.fire('Î≥ÄÍ≤ΩÌï† ÎπÑÎ?Î≤àÌò∏Î•??ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
                return;
            }

            if (!password_check(userPw.val())) { //ÎπÑÎ?Î≤àÌò∏ ?†Ìö®?±Ï≤¥??                userPw.parents("label").addClass("input_focus").find("input").focus();
                setTimeout(function () {
                    userPw.parents("label").removeClass("input_focus");
                }, 1000);

                Swal.fire('8~16???¥ÎÇ¥, ÏµúÏÜå 1Í∞úÏùò ?´Ïûê ?πÏ?\n ?πÏàòÎ¨∏ÏûêÎ•??¨Ïö©?òÏó¨ ?ÖÎ†•?¥Ï£º?∏Ïöî.', '', 'warning');
                return;
            }

            // ??ÎπÑÎ?Î≤àÌò∏ ?ïÏù∏
            if (!checkPw.val()) {
                checkPw.parents("label").addClass("input_focus").find("input").focus();
                setTimeout(function () {
                    checkPw.parents("label").removeClass("input_focus");
                }, 1000);

                Swal.fire('ÎπÑÎ?Î≤àÌò∏ ?ïÏù∏???ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
                return;
            }

            if (userPw.val() !== checkPw.val()) {
                checkPw.parents("label").addClass("input_focus").find("input").focus();
                setTimeout(function () {
                    checkPw.parents("label").removeClass("input_focus");
                }, 1000);

                Swal.fire('ÎπÑÎ?Î≤àÌò∏Í∞Ä ?ºÏπò?òÏ? ?äÏäµ?àÎã§.', '', 'warning');
                return;
            }
        }

        let mobile = $('#s_v6');
        if (!mobile.val()) { //?¥Î??∞Î≤à??            mobile.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                mobile.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('?¥Î??∞Î≤à?∏Î? ?ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        let emailId = $('#s_v7_1');
        let emailDomain = $('#s_v7_2');
        if (!emailId.val() && emailDomain.val()) { //?¥Î©î???ÑÏù¥??            emailId.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                emailId.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('?¥Î©î???ÑÏù¥?îÎ? ?ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        if (emailId.val() && !emailDomain.val()) { //?¥Î©î??Ï£ºÏÜå
            emailDomain.parents(".select_box").find(".custom-select-trigger").addClass("select_focus").parents(".custom-select-wrapper").find("select.custom-select").focus();
            setTimeout(function () {
                emailDomain.parents(".select_box").find(".custom-select-trigger").removeClass("select_focus");
            }, 1000);

            Swal.fire('?¥Î©î??Ï£ºÏÜåÎ•??ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        let email = emailId.val() && emailDomain.val() ? emailId.val() + '@' + emailDomain.val() : undefined;

        let zipcode = $('#s_v9_1');
        let address1 = $('#s_v9_2');
        let address2 = $('#s_v9_3');
        if ((!zipcode.val() || !address1.val()) && address2.val()) {
            address2.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                address2.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('?∞Ìé∏Î≤àÌò∏Î•? Í≤Ä?âÌï¥ Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        if ((zipcode.val() || address1.val()) && !address2.val()) {
            address2.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                address2.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('?ÅÏÑ∏Ï£ºÏÜåÎ•??ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        return {
            userId: <c:out value="${userId}"/>,
            employeeName: employeeName.val(),
            birth: birth.option('value'),
            userPw: userPw.val() || undefined,
            <c:if test="${reserve.reservationState == null}">
            sex: sex,
            </c:if>
            mobile: mobile.val(),
            email: email,
            zipcode: zipcode.val() || undefined,
            address1: address1.val() || undefined,
            address2: address2.val() || undefined,
            <c:if test="${employee.myself != 1 && employee.employeeCheckup.supportType == 1}">
            employeeCheckup: {
                employeeCheckupId: <c:out value="${employee.employeeCheckup.employeeCheckupId}"/>,
                companyCheckupTypeId: companyCheckupTypeId.option('value'),
            },
            </c:if>
            <c:if test="${reserve.reservationState == 1 || reserve.reservationState == 3}">
            reservationId: <c:out value="${reserve.reservationId}"/>,
            </c:if>
        };
    }
</script>

</body>
</html>
