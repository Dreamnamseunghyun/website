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
                            <h2>검진 예약 정보 변경</h2>
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
                                <div id="orgDesiredAt">
                                    <fmt:formatDate
                                            value="${reserve.checkupedAt != null ? reserve.checkupedAt : (reserve.confirmedAt != null ? reserve.confirmedAt : reserve.desiredAt)}"
                                            pattern="yyyy. M. d / a"/>
                                </div>
                                <div id="changeDesiredAt"></div>
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
                                <ul class="list select">
                                    <c:forEach items="${reserve.checkupItems}" var="checkupItem">
                                        <c:if test="${checkupItem.register != '1' && checkupItem.register != '2'}">
                                            <li id="<c:out value="${checkupItem.checkupContractItemId}"/>"
                                                class="${checkupItem.register}">
                                                선택<c:out value="${checkupItem.register}"/> :
                                                <c:out value="${checkupItem.itemName}"/>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </td>
                            <td>
                                <ul class="list add">
                                    <c:forEach items="${reserve.checkupItems}" var="checkupItem">
                                        <c:if test="${checkupItem.register == '2'}">
                                            <li>
                                                - <c:out value="${checkupItem.itemName}"/>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </td>
                            <td>본인부담금액
                                <span id="totalPay" class="chargePoint">
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
                            <a href="#none" class="btn_inner grey">
                                <span class="btn_txt_area">
                                    이전 페이지로
                                </span>
                            </a>
                        </div>
                    </div>

                    <div class="btn_area">
                        <div class="btn check_complete_btn">
                            <span class="button_on_circle"></span>
                            <a href="#none" class="btn_inner green">
                                <span class="btn_txt_area">
                                    변경 가능한 항목 보기
                                </span>
                            </a>
                        </div>
                    </div>

                    <div class="btn_area">
                        <div class="btn cancle_btn">
                            <span class="button_on_circle"></span>
                            <a href="#none" class="btn_inner orange">
                                <span class="btn_txt_area">
                                    변경 가능한 날짜 보기
                                </span>
                            </a>
                        </div>
                    </div>
                    <div class="btn_area">
                        <div class="btn change_btn" style="display: none;">
                            <span class="button_on_circle"></span>
                            <a href="#none" class="btn_inner grey">
                                <span class="btn_txt_area">
                                    예약 변경하기
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

    let employeeNotes = sessionStorage.getItem('employeeNotes');
    if (employeeNotes) {
        sessionStorage.removeItem('employeeNotes');
        $('#employeeNotes').val(employeeNotes);
    }

    let reservationState = <c:out value="${reserve.reservationState}"/>;

    let desiredAt = sessionStorage.getItem('desiredAt');
    if (desiredAt) {
        sessionStorage.removeItem('desiredAt');

        desiredAt = Number(desiredAt);
        if (desiredAt !== <c:out value="${reserve.desiredAt.time}"/>) {
            desiredAt = new Date(desiredAt);

            let changeDesiredAt = desiredAt.getFullYear() + '. ' + (desiredAt.getMonth() + 1) + '. ' + desiredAt.getDate()
                + ' / ' + (desiredAt.getHours() < 12 ? '오전' : '오후');

            $('#orgDesiredAt').addClass('remove_item');
            $('#changeDesiredAt').addClass('change_item').text(changeDesiredAt);

            $('.check_btn').hide();
            $('.change_btn').show();

            $('.cancle_btn').hide();
        } else {
            desiredAt = undefined;
        }
    }

    let selectedItemIds = sessionStorage.getItem('selectedItemIds');
    if (selectedItemIds) {
        sessionStorage.removeItem('selectedItemIds');
        selectedItemIds = JSON.parse(selectedItemIds) || [];

        let sumItemCopay = 0;

        $('ul.list li').addClass('remove_item');
        selectedItemIds.forEach(function (v) {
            v.itemCopay = Number(v.itemCopay);
            sumItemCopay += v.itemCopay;
            let item = $('#' + v.itemId);
            if (item.length) {
                item.removeClass('remove_item');
            } else if (v.register === '2') {
                $('ul.list.add').append('<li class="change_item">' + v.itemName + '</li>');
            } else {
                $('ul.list.select li.' + v.register).last().after('<li class="change_item">선택' + v.register + ' : ' + v.itemName + '</li>');
            }
        });

        if ($('ul.list li').hasClass('remove_item') || $('ul.list li').hasClass('change_item')) {
            let sum = <c:out value="${(reserve.supportType ? reserve.supportPay: 0) + reserve.upgradePay}"/> +sumItemCopay;
            $('#totalPay').text(sum.toLocaleString());

            $('.check_btn').hide();
            $('.change_btn').show();

            $('.check_complete_btn').hide();
        } else {
            selectedItemIds = [];
        }
    } else {
        selectedItemIds = [];
    }


    $('.check_btn').on('click', function () {
        sessionStorage.removeItem('employeeNotes');
        sessionStorage.removeItem('desiredAt');
        sessionStorage.removeItem('selectedItemIds');

        location.href = "target_information.html";
    });

    $('.check_complete_btn').on('click', function () {
        sessionStorage.setItem('employeeNotes', $('#employeeNotes').val());
        if (desiredAt) {
            sessionStorage.setItem('desiredAt', String(desiredAt.getTime()));
        }

        location.href = "ex_item_selection_package.html?" + $.param({
            reservationId: <c:out value="${reserve.reservationId}"/>,
            userId: <c:out value="${reserve.userId}"/>,
            centerId: <c:out value="${reserve.centerId}"/>,
            checkupContractSubTypeId: <c:out value="${reserve.checkupContractSubTypeId}"/>,
        });
    });

    $('.cancle_btn').on('click', function () {
        sessionStorage.setItem('employeeNotes', $('#employeeNotes').val());
        if (selectedItemIds && selectedItemIds.length) {
            sessionStorage.setItem('selectedItemIds', JSON.stringify(selectedItemIds));
        }

        location.href = 'reserve_checkup_date.html?' + $.param({
            reservationId: <c:out value="${reserve.reservationId}"/>,
            userId: <c:out value="${reserve.userId}"/>,
            centerId: <c:out value="${reserve.centerId}"/>,
        });
    });

    console.log(reservationState)

    $('.change_btn').on('click', function () {
        Swal.fire({
            icon: 'info',
            title: "예약을 변경하시겠습니까?",
            showCancelButton: true,
            confirmButtonText: '변경하기',
            cancelButtonText: '닫기',
            cancelButtonColor: '#5d5d5d',
        }).then(function (result) {
            if (result.isConfirmed) {
                $.ajax({
                    url: '<c:url value="/us/reserve/${reserve.reservationId}"/>',
                    method: 'PUT',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({
                        employeeNotes: $('#employeeNotes').val(),
                        desiredAt: desiredAt,
                        selectedItemIds: selectedItemIds.map(function (v) {
                            return v.itemId;
                        }),
                        reservationState: reservationState,
                    }),
                }).then(function (response) {
                    if (response.code === 'SUCCESS') {
                        sessionStorage.removeItem('employeeNotes');
                        sessionStorage.removeItem('desiredAt');

                        Swal.fire({
                            icon: 'success',
                            title: "작성된 정보로 예약이 완료 되었습니다.<br><br>원하시는 일정과 병원의 일정을<br>한번 더 확인하여 최종 확정<br>알림 드리겠습니다.<br><br>언제나 곁에 있겠습니다.<br>다음 건강 검진 때 뵙겠습니다.<br><br><i class='xi-info-o' style='top:2px'></i>최종 확정 알림은 <span class='point_color'>약 2일 ~ 3일 </span>소요 됩니다.",
                            showCancelButton: true,
                            confirmButtonText: '가족 예약하기',
                            cancelButtonText: '닫기',
                            cancelButtonColor: '#5d5d5d',
                        }).then(function (result) {
                            if (result.isConfirmed) {
                                location.href = "target_information.html";
                            } else {
                                location.reload();
                            }
                        });
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
