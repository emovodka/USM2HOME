
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ Hero Banner Start================================== -->
<div class="image-cover hero_banner" style="background:#334aca url(/assets/img/city-7.jpg) no-repeat;"
     data-overlay="1">
    <div class="container">

        <h1 class="big-header-capt mb-0">Find your home near USM!</h1>
        <p class="text-center mb-5">Search for your ideal home near USM</p>
        <!-- Type -->
        <div class="full_search_box nexio_search lightanic_search hero_search-radius modern">
            <div class="search_hero_wrapping">
                <form action="/house">

                    <div class="row">

                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <div class="form-group">
                                <label>Community Name</label>
                                <div class="input-with-icon">
                                    <input type="text" name="address" class="form-control" placeholder="Enter community name">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>Distance to USM</label>
                                <div class="input-with-icon">
                                    <select id="distanceToUsm" name="distanceToUsm" class="form-control">
                                        <option value="">Any Distance</option>
                                        <option value="0;1">Less than 1km</option>
                                        <option value="1;3">1-3km</option>
                                        <option value="3;5">3-5km</option>
                                        <option value="5;999">More than 5km</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>Rental Type</label>
                                <div class="input-with-icon">
                                    <select id="selectRentType" name="rentType" class="form-control">
                                        <option value="">All Types</option>
                                        <option value="whole">Whole House</option>
                                        <option value="share">Shared House</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <div class="form-group">
                                <label>Monthly Rent Range</label>
                                <div class="input-with-icon">
                                    <select id="price" class="form-control" name="priceRange">
                                        <option value="">All Prices</option>
                                        <option value="0;999">Under 1000</option>
                                        <option value="1000;1999">1000-1999</option>
                                        <option value="2000;3999">2000-3999</option>
                                        <option value="4000;5999">4000-5999</option>
                                        <option value="6000;7999">6000-7999</option>
                                        <option value="8000;9999">8000-9999</option>
                                        <option value="10000;14999">10000-14999</option>
                                        <option value="15000;19999">15000-19999</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-12 small-padd">
                            <div class="form-group none">
                                <button type="submit" class="btn search-btn">Search</button>
                            </div>
                        </div>

                    </div>
                </form>


            </div>
        </div>
    </div>
</div>
<!-- ============================ Hero Banner End ================================== -->

<!-- ============================ 最新发布整租 Start ================================== -->
<section class="gray-simple">
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-lg-7 col-md-8">
                <div class="sec-heading center">
                    <h2>Latest Whole Houses</h2>
                    <p>Here are some of the latest whole house listings</p>
                </div>
            </div>
        </div>

        <div class="row">
            <%--  最新整租--%>
            <c:forEach items="${recentWholeHouseList}" var="c">
                <!-- Single Property -->
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single_property_style property_style_2 modern">

                        <div class="listing_thumb_wrapper">
                            <div class="property_gallery_slide-thumb">
                                <a href="/house/detail/${c.id}">
                                    <img src="${c.thumbnailUrl}" class="img-fluid mx-auto" alt=""></a>
                            </div>
                        </div>

                        <div class="property_caption_wrappers pb-0">
                            <div class="property_short_detail">
                                <div class="pr_type_status">
                                    <h4 class="pr-property_title mb-1">
                                        <a href="/house/detail/${c.id}">
                                                ${c.title}
                                        </a>
                                    </h4>
                                    <div class="listing-location-name">
                                        <a href="/house/detail/${c.id}">
                                                ${c.address}
                                        </a>
                                    </div>
                                </div>
                                <div class="property-real-price">
                                    <a href="/house/detail/${c.id}" class="cl-blue">
                                        RM ${c.monthRent}<span class="price_status">/Month</span>
                                    </a>
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
                                    <li><span class="flatcons"><img src="/assets/img/bed.svg"
                                                                    alt=""></span>${c.bedroomNum} Bedrooms
                                    </li>
                                    <li><span class="flatcons"><img src="/assets/img/bath.svg"
                                                                    alt=""></span>${c.toiletNum} Bathrooms
                                    </li>
                                </ul>
                            </div>
                            <div class="fp_types"><a href="javascript:void(0)" class="markHouse" data-id="${c.id}"
                                                        onclick="submitMark(${c.id})">Favorite</a></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <a href="/house?rentType=whole" class="btn btn-success arrow-btn bg-2">View More
                    <span><i class="ti-arrow-right"></i></span>
                </a>
            </div>
        </div>

    </div>
</section>
<div class="clearfix"></div>
<!-- ============================ 最新发布整租 End ================================== -->


<!-- ============================ 最新发布合租 Start ================================== -->
<section class="gray-simple">
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-lg-7 col-md-8">
                <div class="sec-heading center">
                    <h2>Latest Shared Houses</h2>
                    <p>Here are some of the latest shared house listings</p>
                </div>
            </div>
        </div>

        <div class="row">
            <%--  最新整租--%>
            <c:forEach items="${recentShareHouseList}" var="c">
                <!-- Single Property -->
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single_property_style property_style_2 modern">

                        <div class="listing_thumb_wrapper">
                            <div class="property_gallery_slide-thumb">
                                <a href="/house/detail/${c.id}">
                                    <img src="${c.thumbnailUrl}" class="img-fluid mx-auto" alt=""></a>
                            </div>
                        </div>

                        <div class="property_caption_wrappers pb-0">
                            <div class="property_short_detail">
                                <div class="pr_type_status">
                                    <h4 class="pr-property_title mb-1">
                                        <a href="/house/detail/${c.id}">
                                                ${c.title}
                                        </a>
                                    </h4>
                                    <div class="listing-location-name">
                                        <a href="/house/detail/${c.id}">
                                                ${c.address}
                                        </a>
                                    </div>
                                </div>
                                <div class="property-real-price">
                                    <a href="/house/detail/${c.id}" class="cl-blue">
                                        RM ${c.monthRent}<span class="price_status">/Month</span>
                                    </a>
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
                                        <img src="/assets/img/bed.svg" alt=""></span>${c.bedroomNum} Bedrooms
                                    </li>
                                    <li><span class="flatcons">
                                        <img src="/assets/img/bath.svg"
                                             alt=""></span>${c.toiletNum} Bathrooms
                                    </li>
                                </ul>
                            </div>
                            <div class="fp_types"><a href="javascript:void(0)" class="markHouse" data-id="${c.id}"
                                                     onclick="submitMark(${c.id})">Favorite</a></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <a href="/house?rentType=share" class="btn btn-success arrow-btn bg-2">View More
                    <span><i class="ti-arrow-right"></i></span>
                </a>
            </div>
        </div>

    </div>
</section>
<div class="clearfix"></div>
<!-- ============================ 最新发布合租 End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script th:inline="javascript">
    let openLogin = "${openLogin}";
    if (openLogin == 'Y') {
        $('#gotoLogin').click();
    }
</script>

</body>
</html>
