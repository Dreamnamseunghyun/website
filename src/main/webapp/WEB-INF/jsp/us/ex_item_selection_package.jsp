<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Í±¥Í∞ï?¥Ïûê(?¨Ïö©?? Í≤ÄÏßÑÌå®?§Ï? ?†ÌÉù</title>
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
    <link href="../css/us/ex_item_selection_package.css" rel="stylesheet" type="text/css">
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
                            <div class="step_color step_color_last">
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


                                    <div class="step step05">
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
                                                <img src="../img/us/reserve/step_line/step_line_img05.png">
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
                            <div class="step_color step_color_last">
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
                                    <div class="step step04">
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
                                                <img src="../img/us/reserve/step_line/step_line_img04.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step04-->
                                    <div class="step step05">
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
                                                <img src="../img/us/reserve/step_line/step_line_img05.png">
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
                            <div class="step_color step_color_last">
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


                                    <div class="step step03">
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
                                                <img src="../img/us/reserve/step_line/step_line_img04.png">
                                            </div>
                                        </div>
                                        <div class="step_border">
                                        </div>
                                    </div><!--step03-->

                                    <div class="step step04">
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
                                                <img src="../img/us/reserve/step_line/step_line_img05.png">
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
                <div class="row title_btn">
                    <div class="col-md-9">
                        <div class="title_area">
                            <div class="title">
                                <span class="point_line point_color"></span>
                                <h2>Í≤ÄÏß??®ÌÇ§ÏßÄ ?†ÌÉù ??™© Íµ¨ÏÑ±</h2>
                            </div>
                            <div class="title_add_txt orange">
                                <c:out value="${selectedItemMessages}" escapeXml="false"/>
                            </div>
                        </div><!--title_area-->
                    </div>
                    <div class="col-md-3 btn_area">
                        <%--<div class="btn result_btn">
                            <span class="button_on_circle"></span>
                            <a href="#" class="btn_inner blue_gradient">
                                <span class="btn_txt_area">
                                    Ï¢ÖÏ†Ñ Í≤ÄÏßÑÍ≤∞Í≥??ïÏù∏?òÍ∏∞
                                </span>
                            </a>
                        </div>--%>
                    </div>
                </div>


                <div class="list_area">
                    <div class="tableArea">
                        <div class="caption">Í∏∞Î≥∏Í≤ÄÏßÑÌï≠Î™?<span class="more detail_view_btn">?ÅÏÑ∏Î≥¥Í∏∞ <i
                                class="xi-caret-down"></i></span></div>
                        <div class="detail_table_area basic_option">
                            <table class="detail_table">
                                <thead>
                                <tr>
                                    <th colspan="2">?ÄÎ∂ÑÎ•ò</th>
                                    <th colspan="4">Ï§ëÎ∂ÑÎ•?/th>
                                    <th colspan="4">?åÎ∂ÑÎ•?/th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="checkupRegister" items="${checkupRegisters}">
                                    <c:if test="${checkupRegister.register == '1'}">
                                        <c:forEach var="checkupItemClass" items="${checkupRegister.checkupItemClasses}"
                                                   varStatus="statusClass">
                                            <c:forEach var="checkupItemCategory"
                                                       items="${checkupItemClass.checkupItemCategories}"
                                                       varStatus="statusCategory">
                                                <c:forEach var="checkupItem" items="${checkupItemCategory.checkupItems}"
                                                           varStatus="statusItem">
                                                    <tr>
                                                        <c:if test="${statusCategory.index == 0 && statusItem.index == 0}">
                                                            <td class="middle_cate" colspan="2"
                                                                style="background: #f7f7f7"
                                                                rowspan="<c:out value="${checkupItemClass.itemCount}"/>">
                                                                <c:out value="${checkupItemClass.itemClassName}"/></td>
                                                        </c:if>
                                                        <c:if test="${statusItem.index == 0}">
                                                            <td class="middle_cate" colspan="4"
                                                                rowspan="<c:out value="${checkupItemCategory.checkupItems.size()}"/>">
                                                                <c:out value="${checkupItemCategory.itemCategoryName}"/></td>
                                                        </c:if>
                                                        <td colspan="4">
                                                            <div class="center_box">
                                                                <span><span class="info_line">-</span><c:out
                                                                        value="${checkupItem.itemName}"/>
                                                                        <c:if test="${checkupItem.checkupContractItemMemo != null && checkupItem.checkupContractItemMemo != ''}">
                                                                        <span class="add_txt orange">
                                                                        (<span><c:out
                                                                                value="${checkupItem.checkupContractItemMemo}"/></span>)
                                                                        </span>
                                                                        </c:if>
                                                                </span>
                                                                <c:if test="${not empty checkupItem.itemDesc}">
                                                                    <span class="info_btn"
                                                                          data-item-desc="<c:out value="${checkupItem.itemDesc}"/>"><a><i
                                                                            class="xi-help"></i></a></span>
                                                                </c:if>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                </c:forEach>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>


                    </div>

                    <c:forEach items="${checkupRegisters}" var="checkupRegister" varStatus="status">
                        <c:if test="${checkupRegister.register != '1'}">
                            <div class="tableArea">
                                <c:if test="${status.index == 1}">
                                    <div class="caption">?†ÌÉù??™©</div>
                                </c:if>

                                <div class="table <c:out value="${checkupRegister.register == '2' ? 'list_way_all' : 'list_way_01'}"/>"
                                     data-select-count="<c:out value="${checkupRegister.selectCount}"/>">
                                    <div class="thead">
                                        <span class="conplateIco">?†ÌÉù?ÑÎ£å</span>
                                        <c:choose>
                                            <c:when test="${checkupRegister.register == '2'}">
                                                <p>Ï∂îÍ? Í≤Ä????™©</p>
                                            </c:when>
                                            <c:otherwise>
                                                <p>?†ÌÉù <c:out value="${checkupRegister.register}"/>Ï§?<c:out
                                                        value="${checkupRegister.selectCount}"/>Í∞ÄÏßÄ</p>
                                                <p class="notice"><c:out value="${checkupRegister.selectMemo}"/></p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tbody">
                                        <c:forEach items="${checkupRegister.checkupItemClasses}" var="checkupItemClass">
                                            <c:forEach items="${checkupItemClass.checkupItemCategories}"
                                                       var="checkupItemCategory">
                                                <c:forEach items="${checkupItemCategory.checkupItems}"
                                                           var="checkupItem">

                                                    <div class="list"
                                                         data-register="<c:out value="${checkupRegister.register}"/>"
                                                         data-item-name="<c:out value="${checkupItem.itemName}"/>"
                                                         data-item-copay="<c:out value="${checkupItem.discountBill == null ? (checkupItem.copay == null ? 0 : checkupItem.copay) : checkupItem.discountBill}"/>"
                                                         data-item-id="<c:out value="${checkupItem.checkupContractItemId}"/>">
                                                        <p><c:out value="${checkupItem.itemName}"/></p>
                                                        <span class="addCost">
                                                            <c:out value="${checkupItem.checkupContractItemMemo}"/>
                                                        </span>
                                                        <c:if test="${(checkupItem.register != '2' && checkupItem.copay > 0) || (checkupItem.register == '2' && (checkupItem.discountBill > 0 || checkupItem.bill > 0))}">
                                                            <p class="addCost">
                                                                <span>Ï∂îÍ?ÎπÑÏö©</span>
                                                                <strong>
                                                                    <c:choose>
                                                                        <c:when test="${checkupItem.register != '2'}">
                                                                            <c:if test="${checkupItem.copay > 0}">
                                                                                <fmt:formatNumber
                                                                                        value="${checkupItem.copay}"
                                                                                        pattern="#,###"/>??                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:choose>
                                                                                <c:when test="${checkupItem.discountBill > 0}">
                                                                                    <fmt:formatNumber
                                                                                            value="${checkupItem.discountBill}"
                                                                                            pattern="#,###"/>??                                                                                </c:when>
                                                                                <c:when test="${checkupItem.bill > 0}">
                                                                                    <fmt:formatNumber
                                                                                            value="${checkupItem.bill}"
                                                                                            pattern="#,###"/>??                                                                                </c:when>
                                                                            </c:choose>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </strong>
                                                            </p>
                                                        </c:if>
                                                        <div class="table_btn"
                                                             data-item-desc="<c:out value="${checkupItem.itemDesc}"/>">
                                                            <a href="#none" class="btn_inner gray_border">
                                                                <span class="btn_txt_area">
                                                                    ?§Î™ÖÎ≥¥Í∏∞
                                                                </span>
                                                            </a>
                                                        </div>
                                                    </div>

                                                </c:forEach>
                                            </c:forEach>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>


                        </c:if>
                    </c:forEach>

                </div><!--list_arae-->
                <div class="btn_area">
                    <div class="btn confirm_btn">
                        <span class="button_on_circle"></span>
                        <a href="#none" class="btn_inner blue_gradient">
                                              <span class="btn_txt_area">
                                                ?†ÌÉù Í≤ÄÏßÑÌï≠Î™??ïÏ†ï?òÍ∏∞

                                                  <!--
                                                  ?Ä?úÎ≥¥??-> ?àÏïΩÎ≥ÄÍ≤?-> Î≥ÄÍ≤ΩÍ??•Ìïú ??™© Î≥¥Í∏∞ ?åÎ??ÑÎïå ?îÎ©¥?êÏÑú Î≥ÄÍ≤ΩÎêò???çÏä§???ÖÎãà??
                                                  "??™© Î≥ÄÍ≤??ïÏ†ï?òÍ∏∞"
                                                  -->
                                                  <!--
                                                  ??™© Î≥ÄÍ≤??ïÏ†ï?òÍ∏∞Î•??åÎ??ÑÎïå -> edit_information.html??Í≤ΩÎ°úÎ°??§Ïñ¥Í∞ÄÍ≤??©Îãà??
                                                  -->
                                                  <!--
                                                  Í∑∏Î¶¨Í≥?edit_information
                                                  (?àÏïΩÎ≥ÄÍ≤?- Î≥ÄÍ≤ΩÍ??•Ìïú?†ÏßúÎ≥¥Í∏∞orÎ≥ÄÍ≤ΩÍ??îÌïú ??™©Î≥¥Í∏∞)Ï≤òÎüº Î≥ÄÍ≤ΩÎêú ??™©???úÏãú?òÎ©∞
                                                  Î≥ÄÍ≤ΩÎê©?àÎã§.
                                                  -->


                                                  <!--
                                                  ?Ä?úÎ≥¥??-> ?àÏïΩÎ≥ÄÍ≤?-> Î≥ÄÍ≤ΩÍ??•Ìïú ?ºÏ†ï Î≥¥Í∏∞ ?åÎ??ÑÎïå ?îÎ©¥?êÏÑú Î≥ÄÍ≤ΩÎêò???çÏä§???ÖÎãà??
                                                  "?àÏïΩ ?ºÏ†ï Î≥ÄÍ≤ΩÌïòÍ∏?
                                                  -->
                                                  <!--
                                                  ?àÏïΩ ?ºÏ†ï Î≥ÄÍ≤ΩÌïòÍ∏∞Î? ?åÎ??ÑÎïå -> edit_information.html??Í≤ΩÎ°úÎ°??§Ïñ¥Í∞ÄÍ≤??©Îãà??
                                                  -->
                                                  <!--
                                                  Í∑∏Î¶¨Í≥?edit_information
                                                  (?àÏïΩÎ≥ÄÍ≤?- Î≥ÄÍ≤ΩÍ??•Ìïú?†ÏßúÎ≥¥Í∏∞orÎ≥ÄÍ≤ΩÍ??îÌïú ??™©Î≥¥Í∏∞)Ï≤òÎüº Î≥ÄÍ≤ΩÎêú ??™©???úÏãú?òÎ©∞
                                                  Î≥ÄÍ≤ΩÎê©?àÎã§.
                                                  -->


                                                  <!--
                                                  <div class="remove_item"></div> <-- ??†ú???çÏä§??                                                  <div class="change_item"></div> <-- Î≥ÄÍ≤ΩÎê† ?çÏä§??                                                  -->





                                              </span>
                        </a>
                    </div>
                </div><!--btn_area-->


            </div><!--container-->


        </div><!--main_cont-->
    </section><!--main_section-->

</main>


<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
    /****
     Ï∂îÍ??¥Ïïº???ùÏóÖ ?ÖÎãà??     ****/

    //Ï¢ÖÏ†Ñ Í≤ÄÏßÑÍ≤∞Í≥ºÎ? ?ïÏù∏?†Ïàò ?ÜÏùÑ???®Îäî ?ùÏóÖ ?ÖÎãà??

    /*
    $(".result_btn").click(function(){
     Swal.fire('Í≥†Í∞ù?? Ï¢ÖÏ†Ñ Í≤∞Í≥ºÍ∞Ä Ï°¥Ïû¨?òÏ? ?äÏäµ?àÎã§.\n\nÏ¢ÖÏ†Ñ??Í±¥Í∞ï?¥ÏûêÎ•??¥Ïö©?òÏã† ?ÅÏù¥ ?ÜÍ±∞??\nÍ≤∞Í≥º?úÍ≥µ ?ôÏùòÍ∞Ä ?ÜÎäî Í≤ΩÏö∞?êÎäî\nÏ¢ÖÏ†Ñ Í≤ÄÏßÑÍ≤∞Í≥??ïÏù∏??Î∂àÍ??©Îãà??', '', 'warning' );
    })
    */

    $("header").load("header.html");
    $("footer").load("footer.html");


    $('.list_way_01 .list').on('click', function () {
        let table = $(this).parents('.table');
        let selectCount = table.data('selectCount');

        let list_selected_length = table.find('.list.selected').length;

        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        } else {
            if (list_selected_length < selectCount) {
                $(this).addClass('selected');
            } else {
                Swal.fire(selectCount + 'Í∞úÎßå ?†ÌÉù Í∞Ä?•Ìï©?àÎã§.', '', 'warning');
            }
        }

        list_selected_length = table.find('.list.selected').length;
        if (list_selected_length < selectCount) {
            $(this).parents('.table').removeClass('active');
        } else {
            $(this).parents('.table').addClass('active');
        }
    }); //list_way_01


    $('.list_way_all .list').on('click', function () {
        $(this).toggleClass('selected');

        let list_selected_length = $(this).parents('.table').find('.list.selected').length;

        if (list_selected_length < 1) {
            $(this).parents('.table').removeClass('active');
        } else {
            $(this).parents('.table').addClass('active');
        }

    }); //list_way_all


    $('.detail_view_btn').on('click', function () {
        $(this).toggleClass('active').parents('.tableArea').find('.detail_table_area').slideToggle(500);
    });

    $('.table_btn').on('click', function () {
        let itemDesc = $(this).data('itemDesc');
        if (itemDesc) {
            Swal.fire(itemDesc, '', 'info');
        } else {
            Swal.fire('?¥Îãπ ??™©???Ä???§Î™Ö???ÜÏäµ?àÎã§.', '', 'warning');
        }
        return false;
    });

    $('.info_btn').on('click', function () {
        Swal.fire($(this).data('itemDesc'), '', 'info');
    });


    <c:forEach items="${selectedCheckupContractItemIds}" var="selectedCheckupContractItemId">
    $('div.list[data-item-id="<c:out value="${selectedCheckupContractItemId}"/>"]').trigger('click');
    </c:forEach>

    <c:forEach items="${reserve.checkupItems}" var="checkupItem">
    $('div.list[data-item-id="<c:out value="${checkupItem.checkupContractItemId}"/>"]').trigger('click');
    </c:forEach>


    $('.confirm_btn').on('click', function () {
        //?µÍ≥º
        let isSelected = true;
        $('.list_way_01').each(function (i, v) {
            let table = $(v);

            let selectCount = table.data('selectCount');
            let list_selected_length = table.find('.list.selected').length;

            if (selectCount !== list_selected_length) {
                Swal.fire('?†ÌÉù ?òÏ? ?äÏ? ??™©???àÏäµ?àÎã§.', '', 'warning');
                isSelected = false;
                return false;
            }
        });

        if (isSelected) {
            let selectedItemIds = [];

            <c:choose>
            <c:when test="${reserve.reservationState == null}">
            $('.list.selected').each(function (i, v) {
                selectedItemIds.push($(v).data('itemId'));
            });

            $.ajax({
                url: '<c:url value="/us/reserve"/>',
                method: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: JSON.stringify({
                    userId: <c:out value="${userId}"/>,
                    checkupContractSubTypeId: <c:out value="${checkupContractSubTypeId}"/>,
                    selectedItemIds: selectedItemIds,
                }),
            }).then(function (response) {
                if (response.code === 'SUCCESS') {
                    <c:choose>
                    <c:when test="${reserveType == 'date'}">
                    location.href = 'ex_item_final_confirm.html?' + $.param({
                        reserveType: 'date',
                        userId: <c:out value="${userId}"/>,
                        reservationId: response.data.reservationId,
                    });
                    </c:when>
                    <c:otherwise>
                    location.href = 'reserve_checkup_date.html?' + $.param({
                        reserveType: '<c:out value="${reserveType}"/>',
                        userId: <c:out value="${userId}"/>,
                        centerId: <c:out value="${centerId}"/>,
                    });
                    </c:otherwise>
                    </c:choose>
                } else {
                    Swal.fire(response.message, '', 'error');
                }
            }, function (jqXHR) {
                console.log(jqXHR);
                Swal.fire('Error!', '', 'error');
            });
            </c:when>

            <c:otherwise>
            $('.list.selected').each(function (i, v) {
                console.log($(v).data())
                selectedItemIds.push({
                    itemId: $(v).data('itemId'),
                    itemCopay: $(v).data('itemCopay'),
                    itemName: $(v).data('itemName'),
                    register: String($(v).data('register')),
                });
            });
            console.log(selectedItemIds)
            sessionStorage.setItem('selectedItemIds', JSON.stringify(selectedItemIds));

            location.href = 'edit_information.html?' + $.param({
                userId: <c:out value="${reserve.userId}"/>,
                reservationId: <c:out value="${reserve.reservationId}"/>,
            });
            </c:otherwise>
            </c:choose>
        }
    });
</script>
</body>
</html>
