<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Í±¥Í∞ï?¥Ïûê(?¨Ïö©?? ÏµúÏ¢Ö?àÏïΩ?ïÎ≥¥ ?ïÏù∏</title>
    <link href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" rel="stylesheet"
          type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet" type="text/css">
    <link href="../css/us/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/us/common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/header.css" rel="stylesheet" type="text/css">
    <link href="../css/us/footer.css" rel="stylesheet" type="text/css">
    <link href="../css/us/reserve_step_line.css" rel="stylesheet" type="text/css">
    <link href="../css/us/sub_common.css" rel="stylesheet" type="text/css">
    <link href="../css/us/ex_item_final_confirm.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="<c:url value="/lib/devextreme/dx.material.sitebuilder.css"/>">
</head>
<body>
<header></header>
<div class="header_blank"></div>
<!--header-->
<main>
    <section class="main_section">
        <div class="main_cont">

            <c:choose>
                <c:when test="${reserveType == 'date'}">
                    <div class="step_line four_step_line"> <!--step_line-->
                        <div class="step_line_color">
                            <div class="step_color step_color_first active">
                            </div>
                            <div class="container">
                            </div>
                            <div class="step_color step_color_last active">
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="step_area">
                                    <div class="step step01 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 1</h3>
                                                </div>
                                                <div class="info">
                                                    Í≤ÄÏß??àÏïΩ
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img01_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step01-->

                                    <div class="step step02 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 2</h3>
                                                </div>
                                                <div class="info">
                                                    Í≤ÄÏß??¨Îßù???†ÌÉù
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img04_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step02-->

                                    <div class="step step03 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 3</h3>
                                                </div>
                                                <div class="info">
                                                    Î≥ëÏõê Î∞???™© ?†ÌÉù
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img03_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step03-->


                                    <div class="step step05 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 4</h3>
                                                </div>
                                                <div class="info">
                                                    ÏµúÏ¢Ö ?àÏïΩ ?ïÎ≥¥
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img05_active.png">
                                            </div>
                                        </div>
                                    </div><!--step04-->

                                </div><!--step_area-->
                            </div><!--row-->
                        </div><!--container-->
                    </div>
                    <!--step_line-->
                </c:when>
                <c:when test="${reserveType == 'item'}">
                    <div class="step_line"> <!--step_line-->
                        <div class="step_line_color">
                            <div class="step_color step_color_first active">
                            </div>
                            <div class="container">
                            </div>
                            <div class="step_color step_color_last active">
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="step_area">
                                    <div class="step step01 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 1</h3>
                                                </div>
                                                <div class="info">
                                                    Í≤ÄÏß??àÏïΩ
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img01_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step01-->
                                    <div class="step step02 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 2</h3>
                                                </div>
                                                <div class="info">
                                                    Í≤ÄÏß???™© ?†ÌÉù
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img02_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step02-->
                                    <div class="step step03 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 3</h3>
                                                </div>
                                                <div class="info">
                                                    Î≥ëÏõê Î∞???™© ?†ÌÉù
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img03_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step03-->
                                    <div class="step step04 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 4</h3>
                                                </div>
                                                <div class="info">
                                                    Í≤ÄÏß??¨Îßù???†ÌÉù
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img04_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step04-->
                                    <div class="step step05 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 5</h3>
                                                </div>
                                                <div class="info">
                                                    ÏµúÏ¢Ö ?àÏïΩ ?ïÎ≥¥
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img05_active.png">
                                            </div>
                                        </div>
                                    </div><!--step05-->

                                </div><!--step_area-->
                            </div><!--row-->
                        </div><!--container-->
                    </div>
                    <!--step_line-->
                </c:when>
                <c:otherwise>
                    <div class="step_line four_step_line"> <!--step_line-->
                        <div class="step_line_color">
                            <div class="step_color step_color_first active">
                            </div>
                            <div class="container">
                            </div>
                            <div class="step_color step_color_last active">
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="step_area">
                                    <div class="step step01 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 1</h3>
                                                </div>
                                                <div class="info">
                                                    Í≤ÄÏß??àÏïΩ
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img01_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step01-->


                                    <div class="step step02 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 2</h3>
                                                </div>
                                                <div class="info">
                                                    Î≥ëÏõê Î∞???™© ?†ÌÉù
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img03_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step02-->


                                    <div class="step step03 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 3</h3>
                                                </div>
                                                <div class="info">
                                                    Í≤ÄÏß??¨Îßù???†ÌÉù
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img04_active.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step03-->

                                    <div class="step step04 active">
                                        <div class="step_inner">
                                            <div class="left_area">
                                                <div class="title">
                                                    <h3>STEP 4</h3>
                                                </div>
                                                <div class="info">
                                                    ÏµúÏ¢Ö ?àÏïΩ ?ïÎ≥¥
                                                </div>
                                            </div>
                                            <div class="right_area">
                                                <img src="../img/us/reserve/step_line/step_line_img05_active.png">
                                            </div>
                                        </div>
                                    </div><!--step04-->

                                </div><!--step_area-->
                            </div><!--row-->
                        </div><!--container-->
                    </div>
                    <!--step_line-->
                </c:otherwise>
            </c:choose>

            <div class="container">
                <div class="user_info_area">

                </div><!--user_info_area-->

                <div class="title_area">
                    <span class="point_line point_color"></span>
                    <div class="title">
                        <h2>Í≤ÄÏß??†ÌòïÎ≥?Í≤Ä?¨Ìï≠Î™?/h2>
                    </div>
                </div><!--title_area-->

                <div class="confirmCost">
                    <p class="confirmList">Í≥†Í∞ù?òÍªò???†ÌÉù?òÏã† Í≤ÄÏß???™©?Ä
                        <span class="point">
                            <c:out value="${reserve.subTypeName}"/> ?®ÌÇ§ÏßÄ
                            <c:forEach items="${reserve.checkupItems}" var="checkupItem" varStatus="status">
                                <c:out value="${checkupItem.itemName}"/><c:if
                                    test="${reserve.checkupItems.size() != status.count}">,</c:if>
                            </c:forEach>
                        </span>
                        ?ÖÎãà??
                    </p>
                    <div class="confirmTable">
                        <table>
                            <tr>
                                <td class="title">Í≤ÄÏß?Î≥ëÏõê</td>
                                <td class="date"><c:out value="${reserve.hospitalCenterName}"/></td>
                            </tr>
                            <tr>
                                <td class="title">Í≤ÄÏß??àÏïΩ ?¨Îßù??/td>
                                <td class="date">
                                    <fmt:formatDate value="${reserve.desiredAt}" pattern="yyyy. M. d (E) / a"/> Í≤ÄÏß?                                </td>
                            </tr>
                            <tr>
                                <td class="title">Î≥∏Ïù∏ Î∂Ä??ÎπÑÏö©</td>
                                <td class="cost costTotal"><span class="total">
                                    <fmt:formatNumber
                                            value="${(reserve.supportType ? reserve.hospitalPay: 0) + reserve.upgradePay + reserve.sumItemCopay + reserve.sumItemDiscountBill}"
                                            pattern="#,###"/>
                                </span>??                                </td>
                            </tr>
                            <tr class="detail detail_sub_title">
                                <td class="title point">Í≤ÄÏß??†Ìòï : ${reserve.subTypeName}</td>
                                <td class="cost">
                                    <fmt:formatNumber
                                            value="${(reserve.supportType ? reserve.hospitalPay: 0) + reserve.upgradePay}"
                                            pattern="#,###"/>??                                </td>
                            </tr>

                            <c:forEach items="${reserve.checkupItems}" var="checkupItem" varStatus="status">
                                <c:if test="${status.first || reserve.checkupItems.get(status.index - 1).register != checkupItem.register}">
                                    <tr class="detail point detail_sub_title">
                                        <td class="title"><c:out
                                                value="${checkupItem.register == '2' ? 'Ï∂îÍ? Í≤Ä?? : '?†ÌÉù ' += checkupItem.register}"/></td>
                                        <td class="cost"></td>
                                    </tr>
                                </c:if>
                                <tr class="detail">
                                    <td class="title"><span class="title_dot">-</span><c:out
                                            value="${checkupItem.itemName}"/></td>

                                    <td class="cost">
                                        <c:choose>
                                            <c:when test="${checkupItem.register != '2'}">
                                                <fmt:formatNumber value="${checkupItem.copay}" pattern="#,###"/>??                                            </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${checkupItem.discountBill != 0}">
                                                        <fmt:formatNumber value="${checkupItem.discountBill}"
                                                                          pattern="#,###"/>??                                                    </c:when>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div><!--confirmCost-->

                <div class="title_area">
                    <span class="point_line point_color"></span>
                    <div class="title">
                        <h2>ÏµúÏ¢Ö ?àÏïΩ???ïÎ≥¥ ?ïÏù∏</h2>
                    </div>
                </div><!--title_area-->

                <div class="confirmUser">
                    <p class="confirmList">??Í≥†Í∞ù?òÏùò ?ïÌôï??Í≤ÄÏß??àÏïΩ???ÑÌï¥ ?úÎ≤à ???ïÏù∏ Î∞??ïÎ≥¥ Í∏∞ÏûÖ Î∂Ä?ÅÎìúÎ¶ΩÎãà??</p>
                    <div class="confirmItems">
                        <table>
                            <tr>
                                <td class="title required">?¥Î¶Ñ</td>
                                <td class="form">

                                    <div class="write">
                                        <div class="input_type1">
                                            <label for="s_v1">
                                                <input type="text" name="s_v1" id="s_v1" placeholder="&nbsp;"
                                                       value="<c:out value="${reserve.reservationName == null ? employee.employeeName : reserve.reservationName}"/>"
                                                       required="" maxlength="15" autocomplete="off">
                                                <span class="label">?¥Î¶Ñ???ÖÎ†•?òÏÑ∏??</span>
                                            </label>
                                        </div>
                                    </div>

                                </td>
                            </tr><!--?¥Î¶Ñ-->
                            <tr>
                                <td class="title required">?ùÎÖÑ?îÏùº</td>
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
                                            <c:out value="${reserve.sex == 'M' ? '?®ÏÑ±' : '?¨ÏÑ±'}"/>
                                        </div>
                                    </div>

                                </td>
                            </tr><!--?±Î≥Ñ-->

                            <tr>
                                <td class="title required">?¥Î??ÑÌôî</td>
                                <td class="form">
                                    <div class="write">
                                        <div class="input_type1">
                                            <label for="s_v4">
                                                <input type="text" name="s_v4" id="s_v4" class="only_num phone_num"
                                                       value="<c:out value="${reserve.mobile == null ? employee.mobile : reserve.mobile}"/>"
                                                       placeholder="&nbsp;" required="" maxlength="13"
                                                       autocomplete="off">
                                                <span class="label">?¥Î???Î≤àÌò∏ (?´ÏûêÎßåÏûÖ??</span>
                                            </label>
                                        </div>
                                    </div>
                                </td>
                            </tr><!--?¥Î??∞Î≤à??->

                            <tr>
                                <td class="title required">Ï£ºÏÜå</td>
                                <td class="form">
                                    <div class="write line_box_type2"><!--Ï£ºÏÜå-->
                                        <div class="line1">
                                            <div class="input_type1 add_info postcode">
                                                <label for="s_v5_1">
                                                    <input type="text" name="s_v5_1" id="s_v5_1"
                                                           class="only_num address_code_1" placeholder="&nbsp;"
                                                           value="<c:out value="${reserve.zipcode == null ? employee.zipcode : reserve.zipcode}"/>"
                                                           required="" maxlength="5" autocomplete="off" readonly>
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
                                                <label for="s_v5_2">
                                                    <input type="text" name="s_v5_2" id="s_v5_2" class="address_code_2"
                                                           value="<c:out value="${reserve.address1 == null ? employee.address1 : reserve.address1}"/>"
                                                           placeholder="&nbsp;" required="" autocomplete="off" readonly>
                                                    <span class="label">Ï£ºÏÜå</span>
                                                </label>
                                            </div>

                                            <div class="input_type1">
                                                <label for="s_v5_3">
                                                    <input type="text" name="s_v5_3" id="s_v5_3" class="address_code_3"
                                                           value="<c:out value="${reserve.address2 == null ? employee.address2 : reserve.address2}"/>"
                                                           placeholder="&nbsp;" required="" autocomplete="off">
                                                    <span class="label">?ÅÏÑ∏Ï£ºÏÜå</span>
                                                </label>
                                            </div>
                                        </div><!--line2-->
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td class="title">?¥Î©î??/td>
                                <td class="form">
                                    <div class="email_type">
                                        <div class="write">
                                            <div class="input_type1">
                                                <label for="s_v6_1">
                                                    <input type="text" name="s_v6_1" id="s_v6_1" class="email_input"
                                                           placeholder="&nbsp;" required="" autocomplete="off">
                                                    <span class="label">?¥Î©î???ÑÏù¥??/span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="email_at">@</div>

                                        <div class="select_box_area">
                                            <div class="select_box">
                                                <input type="hidden" name="s_v6_2" id="s_v6_2" value="">
                                                <select name="email_select" id="email_select"
                                                        class="custom-select sources" for="s_v6_2"
                                                        placeholder="?†ÌÉù ?¥Ï£º?∏Ïöî">
                                                    <option value="" selected>?†ÌÉù ?¥Ï£º?∏Ïöî</option>
                                                    <option value="gmail.com">gmail.com</option>
                                                    <option value="naver.com">naver.com</option>
                                                    <option value="nate.com">nate.com</option>
                                                    <option value="kakao.com">kakao.com</option>
                                                    <option value="daum.net">daum.net</option>
                                                    <option value="direct">ÏßÅÏ†ë?ÖÎ†•</option>
                                                </select>
                                                <input type="text" name="select_box_direct"
                                                       class="select_box_direct email_input" required=""
                                                       autocomplete="off">
                                            </div>
                                        </div>

                                    </div>
                                </td>
                            </tr>


                            <tr>
                                <td class="title">Î≥ëÏõê???®Í∏∞Í≥??∂Ï? ?ïÎ≥¥</td>
                                <td class="form">
                                    <div class="textarea_box">
                                        <textarea class="area" id="employeeNotes"></textarea>
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
                                                    ?àÏïΩ???ïÎ≥¥ ?ïÏù∏ ?ÑÎ£å
                                                  </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="btn_type2">
                            <div class="btn_area">
                                <div class="btn check_complete_btn">
                                    <span class="button_on_circle"></span>
                                    <a class="btn_inner blue_gradient">
                                                      <span class="btn_txt_area">
                                                        ?àÏïΩ ?ÑÎ£å?òÍ∏∞
                                                      </span>
                                    </a>
                                </div>
                            </div>

                            <%--<div class="btn_area">
                                <div class="btn cancle_btn">
                                    <span class="button_on_circle"></span>
                                    <a class="btn_inner grey">
                                                      <span class="btn_txt_area">
                                                        ?àÏïΩ Ï∑®ÏÜå?òÍ∏∞
                                                      </span>
                                    </a>
                                </div>
                            </div>--%>
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

    $('#birth').dxDateBox({
        useMaskBehavior: true,
        displayFormat: 'yyyy.MM.dd',
        placeholder: '?ùÎÖÑ?îÏùº???†ÌÉù??Ï£ºÏÑ∏??',
        <c:if test="${employee.birth != null}">
        value: new Date(<c:out value="${employee.birth.time}"/>),
        </c:if>
    });


    $("header").load("header.html");
    $("footer").load("footer.html");
    $(".user_info_area").load("user_info_area.html?userId=<c:out value="${userId}"/>");


    $('.check_btn').on('click', function () {
        if (getUserInfo()) {
            Swal.fire('?àÏïΩ ?ÑÎ£å?òÍ∏∞\nÎ≤ÑÌäº???åÎü¨Ï£ºÏÑ∏??', '', 'success');
        }
    });

    $('.check_complete_btn').on('click', function () {  //?àÏïΩ ?ÑÎ£å Î≤ÑÌäº
        let userInfo = getUserInfo();
        if (!userInfo) {
            Swal.fire('?àÏïΩ???ïÎ≥¥ ?ïÏù∏??n?ÑÎ£å?òÏã† ???úÎèÑ??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        let reservationInfo = $.extend({}, userInfo, {
            userId: <c:out value="${userId}"/>,
            reservationState: '1',
            employeeNotes: $('#employeeNotes').val(),
        });

        $.ajax({
            url: '<c:url value="/us/reserve"/>',
            method: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(reservationInfo),
        }).then(function (response) {
            if (response.code === 'SUCCESS') {
                Swal.fire({
                    icon: 'success',
                    title: "?ëÏÑ±???ïÎ≥¥Î°??àÏïΩ???ÑÎ£å ?òÏóà?µÎãà??<br><br>?êÌïò?úÎäî ?ºÏ†ïÍ≥?Î≥ëÏõê???ºÏ†ï??br>?úÎ≤à ???ïÏù∏?òÏó¨ ÏµúÏ¢Ö ?ïÏ†ï<br>?åÎ¶º ?úÎ¶¨Í≤†Ïäµ?àÎã§.<br><br>?∏Ï†ú??Í≥ÅÏóê ?àÍ≤†?µÎãà??<br>?§Ïùå Í±¥Í∞ï Í≤ÄÏß???ÎµôÍ≤†?µÎãà??<br><br><i class='xi-info-o' style='top:2px'></i>ÏµúÏ¢Ö ?ïÏ†ï ?åÎ¶º?Ä <span class='point_color'>??2??~ 3??</span>?åÏöî ?©Îãà??",
                    // showCancelButton: true,
                    // confirmButtonText: 'Í∞ÄÏ°??àÏïΩ?òÍ∏∞',
                    // cancelButtonText: '?´Í∏∞',
                    // cancelButtonColor: '#5d5d5d',
                }).then(function (result) {
                    // if (result.isConfirmed) {
                    //     location.href = "target_information.html";
                    // }
                    location.href = "target_information.html";
                });
            } else {
                Swal.fire(response.message, '', 'error');
            }
        }, function (jqXHR) {
            console.log(jqXHR);
            Swal.fire('Error!', '', 'error');
        });
    });

    // $('.cancle_btn').on('click', function () {
    //     Swal.fire({
    //         icon: 'info',
    //         title: "Í≥†Í∞ù?òÏùò ?àÏïΩ??Ï∑®ÏÜå?©Îãà??<br><br>?àÏïΩ ÏµúÏ¢Ö ?ïÏ†ïÍπåÏ???br><span class='point_color'>ÏµúÎ? 24?úÍ∞Ñ</span>???åÏöî ?©Îãà??<br><br>Ï∑®ÏÜå?òÎ†§Î©??ïÏù∏ Î≤ÑÌäº???åÎü¨Ï£ºÏÑ∏??",
    //         showCancelButton: true,
    //         confirmButtonText: '?? Ï∑®ÏÜå?òÍ≤†?µÎãà??',
    //         cancelButtonText: '?´Í∏∞',
    //         cancelButtonColor: '#5d5d5d'
    //     }).then(function (result) {
    //         if (result.isConfirmed) {
    //             location.href = "target_information.html";
    //         }
    //     });
    // });

    function getUserInfo() {
        let employeeName = $('#s_v1');
        if (!employeeName.val()) { //?¥Î¶Ñ
            employeeName.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                employeeName.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('?¥Î¶Ñ???ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        let birth = $('#birth').dxDateBox('instance');
        if (!birth.option('value')) { //?ùÎÖÑ?îÏùº
            Swal.fire('?ùÎÖÑ?îÏùº???†ÌÉù??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        let mobile = $('#s_v4');
        if (!mobile.val()) { //?¥Î??∞Î≤à??            mobile.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                mobile.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('?¥Î??∞Î≤à?∏Î? ?ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        let zipcode = $('#s_v5_1');
        let address1 = $('#s_v5_2');
        let address2 = $('#s_v5_3');
        if (!zipcode.val() || !address1.val()) {
            address2.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                address2.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('?∞Ìé∏Î≤àÌò∏Î•? Í≤Ä?âÌï¥ Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        if (!address2.val()) {
            address2.parents("label").addClass("input_focus").find("input").focus();
            setTimeout(function () {
                address2.parents("label").removeClass("input_focus");
            }, 1000);

            Swal.fire('?ÅÏÑ∏Ï£ºÏÜåÎ•??ÖÎ†•??Ï£ºÏÑ∏??', '', 'warning');
            return;
        }

        let emailId = $('#s_v6_1');
        let emailDomain = $('#s_v6_2');
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

        return {
            reservationName: employeeName.val(),
            employeeName: employeeName.val(),
            sex: '<c:out value="${reserve.sex}"/>',
            mobile: mobile.val(),
            birth: birth.option('value'),
            zipcode: zipcode.val() || undefined,
            address1: address1.val() || undefined,
            address2: address2.val() || undefined,
            email: email,
        };
    }


</script>

</body>
</html>
