<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ All Property ================================== -->
<section class="gray-simple">

    <div class="container">

        <div class="row">

            <!-- property Sidebar -->
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="hidden-md-down">

                    <div class="page-sidebar">

                        <!-- Find New Property -->
                        <div class="sidebar-widgets" data-select2-id="28">

                            <form action="/house" method="get">

                                <div class="form-group">
                                    <div class="simple-input">
                                        <select id="selectRentType" name="rentType" class="form-control">
                                            <option value="">All Types</option>
                                            <option value="whole"
                                                    <c:if test="${houseSearchVO.rentType == 'whole'}">selected</c:if>>Entire Unit
                                            </option>
                                            <option value="share"
                                                    <c:if test="${houseSearchVO.rentType == 'share'}">selected</c:if>>Shared Unit
                                            </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-with-icon">
                                        <input type="text" class="form-control" name="address" placeholder="Area/Location"
                                               value="${houseSearchVO.address}">
                                        <i class="ti-search"></i>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 pt-4 pb-4">
                                        <h6>Price Range</h6>
                                        <div class="rg-slider">
                                            <input type="text" class="js-range-slider-price" name="priceRange"
                                                   value=""/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 pt-4 pb-4">
                                        <h6>Area Range</h6>
                                        <div class="rg-slider">
                                            <input type="text" class="js-range-slider-area" name="areaRange" value=""/>
                                        </div>
                                    </div>
                                </div>

                                <div class="ameneties-features">
                                    <button type="submit" class="btn btn-success full-width bg-2">Search</button>
                                </div>
                            </form>

                        </div>

                    </div>
                </div>
                <!-- Sidebar End -->

            </div>


            <div class="col-lg-8 col-md-12 col-sm-12">


                <div class="row">

                    <c:forEach items="${pageInfo.records}" var="c">
                        <!-- Single Property -->
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="single_property_style property_style_2 modern">

                                <div class="listing_thumb_wrapper">
                                    <div class="property_gallery_slide-thumb">
                                        <a href="/house/detail/${c.id}">
                                            <img src="${c.thumbnailUrl}" class="img-fluid mx-auto" alt="">
                                        </a>
                                    </div>
                                </div>

                                <div class="property_caption_wrappers pb-0">
                                    <div class="property_short_detail">
                                        <div class="pr_type_status">
                                            <h4 class="pr-property_title mb-1">
                                                <a href="/house/detail/${c.id}">${c.title}</a>
                                            </h4>
                                            <div class="listing-location-name">
                                                <a href="/house/detail/${c.id}">${c.address}</a>
                                            </div>
                                        </div>
                                        <div class="property-real-price">
                                            <a href="/house/detail/${c.id}" class="cl-blue">RM ${c.monthRent}
                                                <span class="price_status">/Month</span></a>
                                            <div class="deposit-text">
                                                <c:if test="${c.deposit != null}">
                                                    Deposit: RM ${Math.round(c.deposit)}
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modern_property_footer">
                                    <div class="property-lists flex-1">
                                        <ul>
                                            <li><span class="flatcons">
                                                <img src="/assets/img/bed.svg" alt=""></span>
                                                    ${c.bedroomNum} Bedroom
                                            </li>
                                            <li><span class="flatcons">
                                                <img src="/assets/img/bath.svg" alt=""></span>
                                                    ${c.toiletNum} Toilet
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="fp_types">
                                        <a href="javascript:void(0)" class="markHouse"
                                           onclick="submitMark(${c.id})">Favorite</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Pagination 分页 -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <%@ include file="../common/page.jsp" %>

                    </div>
                </div>

            </div>


        </div>
    </div>
</section>

<!-- ============================ All Property ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
    let minPrice = ${houseSearchVO.minPrice};
    let maxPrice = ${houseSearchVO.maxPrice};
    let minArea = ${houseSearchVO.minArea};
    let maxArea = ${houseSearchVO.maxArea};
    // Range Slider Script
    $(".js-range-slider-price").ionRangeSlider({
        type: "double",
        min: 0,
        max: 20000,
        from: minPrice,
        to: maxPrice,
        grid: true
    });


    // Range Slider Script
    $(".js-range-slider-area").ionRangeSlider({
        type: "double",
        min: 0,
        max: 300,
        from: minArea,
        to: maxArea,
        grid: true
    });

</script>

</body>
</html>
