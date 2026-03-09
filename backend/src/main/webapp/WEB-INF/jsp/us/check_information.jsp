<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Í±¥Í∞ï?¥Ïûê(?¨Ïö©?? Í≤∞Í≥ºÏ°∞Ìöå</title>
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
    <link href="../css/us/target_information.css" rel="stylesheet" type="text/css">
</head>
<body>
<header></header>
<div class="header_blank"></div>
<!--header-->
<main>
    <section class="main_section">
        <div class="main_cont">
            <div class="container">

                <div class="user_info_area">

                </div><!--user_info_area-->

                <div class="title_area">
                    <span class="point_line point_color"></span>
                    <div class="row">
                        <div class="title col-md-12">
                            <h2>Í≤ÄÏß??àÏïΩ ?ÅÏÑ∏ Ï°∞Ìöå</h2>
                        </div>
                    </div>
                </div><!--title_area-->
                <div class="infoChange">
                    <table class="infoList">
                        <thead>
                        <th>Í≤ÄÏßÑÎ???/th>
                        <th>Í≤ÄÏßÑÏùº</th>
                        <th>ÏßÑÌñâ?ÑÌô©</th>
                        <th>Í≤ÄÏßÑÎ≥ë??/th>
                        <th>Í≤ÄÏßÑÌï≠Î™?/th>
                        <th>?†ÌÉù??™©</th>
                        <th>Ï∂îÍ???™©</th>
                        <th>?àÏ†ïÍ∏àÏï°</th>
                        </thead>
                        <tbody>
                        <tr>
                            <td><c:out value="${reserve.myself == 1 ? 'Î≥∏Ïù∏' : 'Í∞ÄÏ°?}"/></td>
                            <td>
                                <fmt:formatDate
                                        value="${reserve.checkupedAt != null ? reserve.checkupedAt : (reserve.confirmedAt != null ? reserve.confirmedAt : reserve.desiredAt)}"
                                        pattern="yyyy. M. d / a"/>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${reserve.reservationState == null}">ÎØ∏Ïòà??</c:when>
                                    <c:when test="${reserve.reservationState == 0}">?àÏïΩÏ∑®ÏÜå </c:when>
                                    <c:when test="${reserve.reservationState == 1}">?àÏïΩ?†Ï≤≠ </c:when>
                                    <c:when test="${reserve.reservationState == 2}">?àÏïΩ?ïÏ†ï </c:when>
                                    <c:when test="${reserve.reservationState == 3}">?àÏïΩÎ≥ÄÍ≤?</c:when>
                                    <c:when test="${reserve.reservationState == 4}">?òÍ??ÑÎ£å </c:when>
                                    <c:when test="${reserve.reservationState == 5}">?àÏïΩÎ≥¥Î•ò </c:when>
                                </c:choose>
                            </td>
                            <td><c:out value="${reserve.hospitalCenterName}"/></td>
                            <td>
                                <c:out value="${reserve.companyCheckupTypeName}"/>
                                (<c:out value="${reserve.subTypeName}"/>)
                            </td>
                            <td>
                                <ul class="list">
                                    <c:forEach items="${reserve.checkupItems}" var="checkupItem">
                                        <c:if test="${checkupItem.register != '1' && checkupItem.register != '2'}">
                                            <li>
                                                ?†ÌÉù<c:out value="${checkupItem.register}"/> :
                                                <c:out value="${checkupItem.itemName}"/>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </td>
                            <td>
                                <ul class="list">
                                    <c:forEach items="${reserve.checkupItems}" var="checkupItem">
                                        <c:if test="${checkupItem.register == '2'}">
                                            <li>
                                                - <c:out value="${checkupItem.itemName}"/>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </td>
                            <td>Î≥∏Ïù∏Î∂Ä?¥Í∏à??                                <span class="chargePoint">
                                    <fmt:formatNumber
                                            value="${(reserve.supportType ? reserve.hospitalPay: 0) + reserve.upgradePay + reserve.sumItemCopay + reserve.sumItemDiscountBill}"
                                            pattern="#,###"/>
                                </span>
                            </td>
                        </tr>


                        </tbody>
                    </table>
                </div>
                <div class="notiArea">
                    <div class="title">
                        <p>Î≥ëÏõê???®Í∏∞Í≥??∂Ï? ?ïÎ≥¥</p>
                    </div>
                    <div class="txtArea">
                        <textarea class="area" readonly><c:out value="${reserve.employeeNotes}"/></textarea>
                    </div>
                </div>

                <div class="btn_area">
                    <div class="btn check_btn">
                        <span class="button_on_circle"></span>
                        <a href="target_information.html" class="btn_inner grey">
                                                      <span class="btn_txt_area">
                                                        ?¥Ï†Ñ ?òÏù¥ÏßÄÎ°?                                                      </span>
                        </a>
                    </div>
                </div>


            </div><!--container-->


        </div><!--main_cont-->
    </section><!--main_section-->

</main>


<footer>

</footer>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>


    $("header").load("header.html");
    $("footer").load("footer.html");
    $(".user_info_area").load("user_info_area.html?userId=<c:out value="${reserve.userId}"/>");


</script>
</body>
</html>
