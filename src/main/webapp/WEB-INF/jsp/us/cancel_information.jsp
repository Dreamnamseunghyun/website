<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>건강살자(사용자) 결과조회</title>
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
                            <h2>검진 예약 취소</h2>
                        </div>
                    </div>
                </div><!--title_area-->
                <div class="infoChange">
                    <table class="infoList">
                        <thead>
                        <th>검진대상</th>
                        <th>검진일</th>
                        <th>진행현황</th>
                        <th>검진병원</th>
                        <th>검진항목</th>
                        <th>선택항목</th>
                        <th>추가항목</th>
                        <th>예정금액</th>
                        </thead>
                        <tbody>
                        <tr>
                            <td><c:out value="${reserve.myself == 1 ? '본인' : '가족'}"/></td>
                            <td>
                                <fmt:formatDate
                                        value="${reserve.checkupedAt != null ? reserve.checkupedAt : (reserve.confirmedAt != null ? reserve.confirmedAt : reserve.desiredAt)}"
                                        pattern="yyyy. M. d / a"/>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${reserve.reservationState == null}">미예약 </c:when>
                                    <c:when test="${reserve.reservationState == 0}">예약취소 </c:when>
                                    <c:when test="${reserve.reservationState == 1}">예약신청 </c:when>
                                    <c:when test="${reserve.reservationState == 2}">예약확정 </c:when>
                                    <c:when test="${reserve.reservationState == 3}">예약변경 </c:when>
                                    <c:when test="${reserve.reservationState == 4}">수검완료 </c:when>
                                    <c:when test="${reserve.reservationState == 5}">예약보류 </c:when>
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
                                                선택<c:out value="${checkupItem.register}"/> :
                                                <c:out value="${checkupItem.itemName}"/>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </td>
                            <td>
                                <c:forEach items="${reserve.checkupItems}" var="checkupItem">
                                    <c:if test="${checkupItem.register == '2'}">
                                        <li>
                                            <c:out value="${checkupItem.itemName}"/>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>본인부담금액
                                <span class="chargePoint">
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
                        <p>병원에 남기고 싶은 정보</p>
                    </div>
                    <div class="txtArea">
                        <textarea class="area" placeholder="병원에 남기고 싶은 말을 적어주세요." id="employeeNotes"><c:out
                                value="${reserve.employeeNotes}"/></textarea>
                    </div>
                </div>
                <div class="btn_type2">
                    <div class="btn_area">
                        <div class="btn check_btn">
                            <span class="button_on_circle"></span>
                            <a href="target_information.html" class="btn_inner grey">
                                                          <span class="btn_txt_area">
                                                            이전 페이지로
                                                          </span>
                            </a>
                        </div>
                    </div>

                    <div class="btn_area">
                        <div class="btn cancle_btn">
                            <span class="button_on_circle"></span>
                            <a href="#none" class="btn_inner grey">
                                                          <span class="btn_txt_area">
                                                            예약 취소하기
                                                          </span>
                            </a>
                        </div>
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

    $('.cancle_btn').on('click', function () {
        Swal.fire({
            icon: 'info',
            title: '고객님의 예약이 취소됩니다.<br><br>예약취소가 확정되기까지<br><span class="point_color">최대 24시간</span>이 소요 됩니다.<br><br>취소하려면 확인 버튼을 눌러주세요.',
            showCancelButton: true,
            confirmButtonText: '네, 취소하겠습니다.',
            cancelButtonText: '닫기',
            cancelButtonColor: '#5d5d5d',
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '<c:url value="/us/reserve/cancel"/>',
                    method: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({
                        reservationId: <c:out value="${reserve.reservationId}"/>,
                        employeeNotes: $('#employeeNotes').val(),
                    }),
                }).then(function (response) {
                    if (response.code === 'SUCCESS') {
                        location.href = "target_information.html";
                    } else {
                        Swal.fire(response.message, '', 'error');
                    }
                }, function (jqXHR) {
                    console.log(jqXHR);
                    Swal.fire('Error!', '', 'error');
                });
            }
        });
    });

</script>
</body>
</html>
