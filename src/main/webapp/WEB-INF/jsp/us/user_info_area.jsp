<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--<div class="title_area">--%>
<%--    <span class="point_line point_color"></span>--%>

<%--    <div class="title">--%>
<%--        <h2>검�??�약?�기</h2>--%>
<%--    </div>--%>

<%--</div>--%>
<%--<!--title_area-->--%>
<%--<div class="row">--%>
<%--    <div class="col-md-6 user_area box_shadow_area">--%>
<%--        <div class="inner_wrap">--%>
<%--            <div class="inner">--%>
<%--                <div class="img_area">--%>
<%--                    &lt;%&ndash;<img src="../img/us/reserve/reserve_checkup/reserve_checkup_user_img.png">&ndash;%&gt;--%>
<%--                    <img src="<c:out value="${company.ciUrl}"/>" alt="Company Logo">--%>
<%--                </div>--%>
<%--                <div class="info_area">--%>
<%--                    <div class="id">--%>
<%--                        <span class="tit">?�이??/span>--%>
<%--                        <span><c:out value="${reserve.employeeCode}"/></span>--%>
<%--                    </div>--%>
<%--                    <div class="name">--%>
<%--                        <span class="tit">?�름</span>--%>
<%--                        <span><c:out value="${reserve.employeeName}"/></span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="burden_mark <c:out value="${reserve.supportType ? 'self' : 'coper'}"/>">--%>
<%--                    <c:out value="${reserve.supportType ? '본인부?? : '기업부??}"/>--%>
<%--                </div>--%>
<%--            </div><!--inner-->--%>
<%--        </div><!--innner_wrap-->--%>
<%--    </div><!--user_area-->--%>


<%--    <div class="col-md-6 period_area box_shadow_area">--%>
<%--        <div class="inner_wrap">--%>
<%--            <div class="inner">--%>
<%--                <div class="period_img">--%>
<%--                    <c:set var="today" value="<%=new java.util.Date()%>"/>--%>
<%--                    <span class="period_txt">--%>
<%--                        <fmt:formatNumber--%>
<%--                                value="${(today.time - reserve.reserveDateEnd.time) / 86400000 - 0.5}" pattern="#"/>--%>
<%--                    </span>--%>
<%--                </div>--%>
<%--                <div class="reserve_period">--%>
<%--                    <div class="title green">?�약기간</div>--%>
<%--                    <div class="period">--%>
<%--                        <span>--%>
<%--                            <fmt:formatDate value="${reserve.reserveDateBegin}" pattern="yyyy.MM.dd"/>--%>
<%--                        </span>--%>
<%--                        ~--%>
<%--                        <span>--%>
<%--                            <fmt:formatDate value="${reserve.reserveDateEnd}" pattern="yyyy.MM.dd"/>--%>
<%--                        </span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="checkup_period">--%>
<%--                    <div class="title blue">검진기�?/div>--%>
<%--                    <div class="period">--%>
<%--                        <span>--%>
<%--                            <fmt:formatDate value="${reserve.checkupDateBegin}" pattern="yyyy.MM.dd"/>--%>
<%--                        </span>--%>
<%--                        ~--%>
<%--                        <span>--%>
<%--                            <fmt:formatDate value="${reserve.checkupDateEnd}" pattern="yyyy.MM.dd"/>--%>
<%--                        </span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div><!--inner-->--%>
<%--        </div><!--innner_wrap-->--%>
<%--    </div><!--period_area-->--%>

<%--</div>--%>

<div class="title_area">
    <span class="point_line point_color"></span>

    <div class="title">
        <h2>검진자 ?�보</h2>
    </div>

</div>
<!--title_area-->
<div class="row">
    <div class="col-md-6 user_area box_shadow_area">
        <div class="inner_wrap">
            <div class="inner">
                <div class="img_area">
                    <img src="<c:out value="${company.ciUrl}"/>" alt="Company Logo">
                    <div class="img_noti">
                        <div class="img"><i class="xi-image"></i></div>
                        <p class="txt">첨�????��?지가<br>?�습?�다.</p>
                    </div>
                </div>
                <div class="info_area">
                    <div class="info_area_inner">
                        <div class="id">
                            <span class="tit">?�이??/span>
                            <span class="user_id"><c:out value="${reserve.employeeCode}"/></span>
                        </div>
                        <div class="name">
                            <span class="tit">?�름</span>
                            <span class="user_name"><c:out value="${reserve.employeeName}"/></span>
                        </div>
                        <div class="burden_mark <c:out value="${reserve.supportType ? 'self' : 'coper'}"/>">
                            <c:out value="${reserve.supportType ? '본인부?? : '기업부??}"/>
                        </div>
                    </div>
                </div>

            </div><!--inner-->
        </div><!--innner_wrap-->
    </div><!--user_area-->


    <div class="col-md-6 period_area box_shadow_area">
        <div class="inner_wrap">
            <div class="inner">
                <div class="period_info">
                    <div class="reserve_period">
                        <div class="title green">?�약기간</div>
                        <div class="period">
                            <span>
                                <fmt:formatDate value="${reserve.reserveDateBegin}" pattern="yyyy.MM.dd"/>
                            </span> ~
                            <span>
                                <fmt:formatDate value="${reserve.reserveDateEnd}" pattern="yyyy.MM.dd"/>
                            </span>
                        </div>
                    </div>
                    <div class="checkup_period">
                        <div class="title blue">검진기�?/div>
                        <div class="period">
                           <span>
                               <fmt:formatDate value="${reserve.checkupDateBegin}" pattern="yyyy.MM.dd"/>
                           </span>
                            ~
                            <span>
                                <fmt:formatDate value="${reserve.checkupDateEnd}" pattern="yyyy.MM.dd"/>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="date_info">
                    <div class="period_img">
                        <c:set var="today" value="<%=new java.util.Date()%>"/>
                        <span class="period_txt">
                            <fmt:formatNumber value="${(today.time - reserve.reserveDateEnd.time) / 86400000 - 0.5}"
                                              pattern="#"/>
                        </span>
                    </div>
                    <div class="period_noti">
                        <p>
                            <span class="user_name"><c:out value="${reserve.employeeName}"/></span> 고객??<br>
                            검�??�약 가?�한 기간??                            <br>
                            <span class="period_txt purple">
                               <fmt:formatNumber
                                       value="${-((today.time - reserve.reserveDateEnd.time) / 86400000 - 0.5)}"
                                       pattern="#" var="reserveEndTime"/>
                               <c:choose>
                                   <c:when test="${reserveEndTime <= 0}">
                                       <c:out value="${-reserveEndTime}"></c:out>
                                   </c:when>
                                   <c:otherwise>
                                       <c:out value="${reserveEndTime}"></c:out>
                                   </c:otherwise>
                               </c:choose>
                               ??                            </span>
                            <c:choose>
                                <c:when test="${reserveEndTime <= 0}">
                                    지?�습?�다.
                                </c:when>
                                <c:otherwise>
                                    ?�았?�니??
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </div>
            </div><!--inner-->
        </div><!--innner_wrap-->
    </div><!--period_area-->

    <div class="col-md-2 checkup_comparison">
        <div class="inner_wrap">
            <div class="inner">
                <div class="img_area">
                    <img src="../img/us/common/item_comparison_img.png">
                </div>
                <div class="info_area">
                    병원검�?br>??��비교
                </div>
            </div>
        </div>
    </div>

</div>


<script>
    $(function () {
        $(".user_info_area .user_area img").on("error", function () {
            $(this).remove();
            $(".user_info_area .img_noti").addClass("no_image");
        });
    });
</script>
