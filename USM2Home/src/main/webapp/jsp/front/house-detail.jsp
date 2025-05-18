<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>

<style>
/* 1. 全局字体和背景 */
body {
    font-family: 'Inter', 'Roboto', 'Arial', sans-serif;
    background: #f7f7fa;
    color: #222;
}

/* 2. 主卡片和图片 */
.prt_detail_three_clicks {
    background: #fff;
    border-radius: 22px;
    box-shadow: 0 4px 24px rgba(110,18,126,0.10);
    padding: 32px 28px 24px 28px;
    margin-bottom: 32px;
    margin-top: 18px;
    text-align: center;
}
.pdt_clicks_price h4 {
    color: #6e127e;
    font-size: 1.7rem;
    font-weight: 800;
    margin-bottom: 8px;
}
.pdt_clicks_deposit {
    color: #6e127e;
    font-size: 1.08rem;
    font-weight: 600;
    margin-bottom: 8px;
    margin-top: 4px;
}
.pdt_clicks_title h3 {
    font-size: 2rem;
    font-weight: 700;
    color: #222;
    margin-bottom: 10px;
}
.pdt_clicks_location {
    color: #a08bb7;
    font-size: 1.08rem;
    margin-bottom: 18px;
}

/* 其余美化略，后续可补充 */
.side-booking-header {
    background: #6e127e;
    border-radius: 16px 16px 0 0;
    padding: 24px 20px 18px 24px;
    text-align: left;
}
.side-booking-header .price {
    color: #fff;
    font-size: 2rem;
    font-weight: 800;
    margin: 0;
}
</style>

<!-- ============================ 房子名称 Property Detail Head Start ================================== -->
<div class="pt-5 pb-5 gray-simple">
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10 col-sm-12">
                <div class="prt_detail_three_clicks">
                    <div class="pdt_clicks_price"><h4>RM ${house.monthRent}/month</h4></div>
                    <c:if test="${house.deposit != null}">
                        <div class="pdt_clicks_deposit">Deposit: <span style="font-weight:600; color:#6e127e;">RM ${Math.round(house.deposit)}</span></div>
                    </c:if>
                    <div class="pdt_clicks_title"><h3>${house.title}</h3></div>
                    <div class="pdt_clicks_location"><span><i class="ti-location-pin"></i></span>${house.address}</div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- ============================ Property Detail Head End ================================== -->

<!-- ============================ 地图 Map & Gallery Part Start ================================== -->
<div class="pt-5 pb-5">
    <div class="container-fluid p-0">

<%--        <div class="row">--%>
<%--            <div class="col-lg-12 col-md-12 mb-4">--%>
<%--                <div class="mapg_part_nav">--%>
<%--                    <ul class="nav nav-tabs" id="myTab" role="tablist">--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link active" id="gallery-tab" onclick="toggleGallery()" role="tab"--%>
<%--                               aria-controls="gallery" aria-selected="true"><i class="ti-gallery mr-1"></i>Photos</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" id="map-tab" onclick="toggleMap()" role="tab" aria-controls="map"--%>
<%--                               aria-selected="false"><i class="ti-map-alt mr-1"></i>Map</a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

        <div class="row justify-content-center no-flex">
            <div class="mapg_part_caption">
                <div class="tab-content" id="myTabContent">
                    <!-- Gallery -->
                    <div class="tab-pane active" id="gallery" role="tabpanel" aria-labelledby="gallery-tab">
                        <div class="featured_slick_gallery gray">
                            <div class="featured_slick_gallery-slide">
                                <c:forEach items="${house.slideImgList}" var="url">
                                    <div class="featured_slick_padd">
                                        <a href="${url}" class="mfp-gallery">
                                            <img style="height: 400px;width: 100%;" src="${url}"
                                                 class="img-fluid mx-auto" alt=""/></a></div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>


                    <!-- Map -->
                    <div class="tab-pane " id="map" role="tabpanel" aria-labelledby="map-tab">
                        <div class="map-container">
                            <iframe src="/house/map?id=${house.id}" width="100%" height="500px;"></iframe>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>
<!-- ============================ Map & Gallery Part End ================================== -->


<!-- ============================ Property Detail Start ================================== -->
<section class="gray-dark">
    <div class="container">
        <div class="row">

            <!-- property main detail -->
            <div class="col-lg-8 col-md-12 col-sm-12">

                <!-- Single Block Wrap -->
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header">
                        <a data-toggle="collapse" data-parent="#features" href="#clOne" aria-expanded="true"><h4
                                class="property_block_title">House Details</h4></a>
                    </div>
                    <div id="clOne" class="panel-collapse collapse show" aria-expanded="true">
                        <div class="block-body">
                            <ul class="deatil_features">
                                <li><strong>Status:</strong>
                                    <c:choose>
                                        <c:when test="${house.status == 1}">Renting</c:when>
                                        <c:when test="${house.status == 0}">Rented</c:when>
                                        <c:when test="${house.status == -1}">Not Available</c:when>
                                        <c:when test="${house.status == -2}">Pending</c:when>
                                        <c:when test="${house.status == -3}">Rejected</c:when>
                                        <c:otherwise>Unknown</c:otherwise>
                                    </c:choose>
                                </li>
                                <li><strong>Rent:</strong>RM ${house.monthRent}/month</li>
                                <c:if test="${house.deposit != null}">
                                <li><strong>Deposit:</strong>RM ${Math.round(house.deposit)}</li>
                                </c:if>
                                <li><strong>Certificate No:</strong>${house.certificateNo}</li>
                                <li><strong>Bedroom:</strong>${house.bedroomNum}</li>
                                <li><strong>Toilet:</strong>${house.toiletNum}</li>
                                <li><strong>Kitchen:</strong>${house.kitchenNum}</li>
                                <li><strong>Living Room:</strong>${house.livingRoomNum}</li>
                                <li><strong>Area:</strong>${house.area}m²</li>
                                <li><strong>Air Conditioner:</strong>
                                    <c:choose>
                                        <c:when test="${house.hasAirConditioner == 1}">Yes</c:when>
                                        <c:otherwise>No</c:otherwise>
                                    </c:choose>
                                </li>
                                <li><strong>Build Year:</strong>${house.buildYear}</li>
                                <li><strong>Direction:</strong>${house.direction}</li>
                                <li><strong>Floor:</strong>${house.floor}/${house.maxFloor}</li>
                                <li><strong>Elevator:</strong>
                                    <c:choose>
                                        <c:when test="${house.hasElevator == 1}">Yes</c:when>
                                        <c:otherwise>No</c:otherwise>
                                    </c:choose>
                                </li>
                                <li><strong>Last Order Start Time:</strong><fmt:formatDate pattern="yyyy-MM-dd"
                                                                                value="${house.lastOrderStartTime}"/>
                                </li>
                                <li><strong>Last Order End Time:</strong><fmt:formatDate pattern="yyyy-MM-dd"
                                                                                value="${house.lastOrderStartTime}"/>
                                </li>
                                <li><strong>Contact Name:</strong>${house.contactName}</li>
                                <li><strong>Contact Phone:</strong>${house.contactPhone}</li>
                            </ul>
                        </div>
                    </div>

                </div>

                <!-- Single Block Wrap -->
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header">
                        <a data-toggle="collapse" data-parent="#dsrp" href="#clTwo" aria-expanded="true"><h4
                                class="property_block_title">Detailed Description</h4></a>
                    </div>
                    <div id="clTwo" class="panel-collapse collapse show" aria-expanded="true">
                        <div class="block-body">
                            ${house.content}
                        </div>
                    </div>
                </div>

                <!-- Single Block Wrap -->
                <c:if test="${house.rentType == 'share'}">
                    <div class="property_block_wrap style-2" id="shareHouse">

                        <div class="property_block_wrap_header">
                            <a data-toggle="collapse" data-parent="#rev" href="#clEight" aria-expanded="true"><h4
                                    class="property_block_title">Share House Situation</h4></a>
                        </div>

                        <div id="clEight" class="panel-collapse collapse show" aria-expanded="true">
                            <div class="block-body">
                                <div class="author-review">
                                    <div class="comment-list">
                                        <ul>
                                            <c:forEach items="${house.shareHouseList}" var="c">
                                                <li class="article_comments_wrap">
                                                    <article>
                                                        <div class="article_comments_thumb">
                                                            <a href="/house/detail/${c.id}" target="_blank">
                                                                <img src="${c.thumbnailUrl}" alt=""
                                                                     style="border-radius: 0;">
                                                            </a>
                                                        </div>
                                                        <div class="comment-details">
                                                            <div class="comment-meta">
                                                                <div class="comment-left-meta">
                                                                    <a href="/house/detail/${c.id}" target="_blank">
                                                                        <h4 class="author-name">${c.title}</h4>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <c:choose>
                                                                <c:when test="${c.currentOrder != null}">
                                                                    <div class="comment-text">
                                                                        <p>
                                                                            Gender: ${c.currentOrder.customerUser.sex}，School: ${c.currentOrder.customerUser.job}</p>
                                                                        <p>Hobby: ${c.currentOrder.customerUser.hobby}</p>
                                                                        <p>
                                                                            Personal Description: ${c.currentOrder.customerUser.userDesc}</p>
                                                                        <p>Check-in Date: <fmt:formatDate pattern="yyyy-MM-dd"
                                                                                                 value="${c.currentOrder.startDate}"/></p>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="comment-text">
                                                                        Not Rented Yet
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </article>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </c:if>
                <!-- Single Block Wrap -->
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header">
                        <a data-toggle="collapse" data-parent="#loca" href="#clSix" aria-expanded="true"
                           class="collapsed"><h4 class="property_block_title">Map Location</h4></a>
                    </div>

                    <div id="clSix" class="panel-collapse collapse show" aria-expanded="true">
                        <div class="block-body">
                            <div class="map-container">
                                <iframe src="/house/map?id=${house.id}" width="100%" height="300px;"></iframe>
                            </div>

                        </div>
                    </div>

                </div>

                <!-- Single Block Wrap -->
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header">
                        <a data-toggle="collapse" data-parent="#gal" href="#clSev" aria-expanded="true"
                           class="collapsed"><h4 class="property_block_title">Gallery</h4></a>
                    </div>

                    <div id="clSev" class="panel-collapse collapse show" aria-expanded="true">
                        <div class="block-body">
                            <ul class="list-gallery-inline">
                                <c:forEach items="${house.slideImgList}" var="url">
                                    <li>
                                        <a href="${url}" class="mfp-gallery">
                                            <img src="${url}" class="img-fluid mx-auto" alt=""/>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                </div>

            </div>

            <!-- property Sidebar -->
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="property-sidebar">

                    <c:if test="${isCustomer}">
                        <!-- Share & Like Button -->
                        <div class="like_share_wrap b-0">
                            <ul class="like_share_list">
                                    <%--                            <li><a href="#" class="btn btn-likes" data-toggle="tooltip" data-original-title="Share"><i class="fas fa-share"></i>Share</a></li>--%>
                                <li><a href="javascript:void(0)" class="btn btn-likes"
                                       onclick="submitMark(${house.id})"><i
                                        class="fas fa-heart"></i>Favorite</a></li>
                            </ul>
                        </div>
                    </c:if>

                    <div class="agent-_blocks_wrap b-0">
                        <div class="side-booking-header">
                            <h3 class="price">
                                RM <fmt:formatNumber value="${house.monthRent/30 }" pattern="#"
                                                    type="number"/>&nbsp;/day</h3>
                        </div>
                        <div class="side-booking-body">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-6">
                                    <div class="form-group">
                                        <label>Check-in Date, today</label>
                                        <div class="cld-box">
                                            <i class="ti-calendar"></i>
                                            <input type="text" name="checkin" id="startDate" class="form-control"
                                                   disabled/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-6">
                                    <input type="hidden" id="houseId" value="${house.id}">
                                    <div class="form-group">
                                        <label>Check-out Date, please select</label>
                                        <div class="cld-box">
                                            <i class="ti-calendar"></i>
                                            <input type="text" name="checkout" id="endDate" class="form-control"/>
                                        </div>
                                    </div>
                                </div>

                                <%--                                <div class="side-booking-foot">--%>
                                <%--                                    <span class="sb-header-left">Total</span>--%>
                                <%--                                    <h3 class="price theme-cl" id="totalAmount"></h3>--%>
                                <%--                                </div>--%>

                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="stbooking-footer mt-1">
                                        <div class="form-group mb-0 pb-0">
                                            <c:choose>
                                                <c:when test="${house.status == 1}">
                                                    <a href="javascript:void(0)" onclick="createOrder()"
                                                       class="btn btn-md full-width btn-success bg-2">Book Now</a>
                                                </c:when>
                                                <c:when test="${house.status == 0}">
                                                    <a href="javascript:void(0)" disabled
                                                    class="btn btn-md full-width btn-success bg-red">Rented</a>
                                                </c:when>
                                                <c:when test="${house.status == -1}">
                                                    <a href="javascript:void(0)" disabled
                                                        class="btn btn-md full-width btn-success bg-red">Not Available</a>
                                                </c:when>
                                            </c:choose>

                                            <a  href="/message?uid=${house.userId}" style="margin-top: 10px;"
                                               class="btn btn-md full-width btn-success bg-2">Message Landlord</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

        </div>
    </div>
</section>
<!-- ============================ Property Detail End ================================== -->


<%@ include file="../common/footer.jsp" %>
<!-- Date Booking Script -->
<script src="/assets/js/moment.min.js"></script>
<script src="/assets/js/daterangepicker.js"></script>
<script>

    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var date = now.getDate();
    // 月/日/年
    var today = month + '/' + date + '/' + year;

    $(function () {
        $('input[name="checkin"]').daterangepicker({
            singleDatePicker: true
        });
        $('input[name="checkin"]').val(today);
        $('input[name="checkin"]').attr("placeholder", "Check-in Date");
    });

    // Check In & Check Out Daterange Script
    $(function () {
        $('input[name="checkout"]').daterangepicker({
            singleDatePicker: true,
            format: "yy-mm-dd"
        });
        $('input[name="checkout"]').val(today);
        $('input[name="checkout"]').attr("placeholder", "Check-out Date");
    });


</script>

</body>
</html>
