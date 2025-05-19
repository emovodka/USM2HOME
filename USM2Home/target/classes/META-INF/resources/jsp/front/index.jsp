
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

/* 2. Hero Banner */
.hero_banner {
    min-height: 340px;
    display: flex;
    align-items: center;
    background-size: cover;
    background-position: center;
    border-radius: 0 0 24px 24px;
    box-shadow: 0 4px 24px rgba(110,18,126,0.08);
    position: relative;
    margin-bottom: 32px;
}
.hero_banner h1 {
    color: #fff;
    font-size: 2.6rem;
    font-weight: 700;
    text-shadow: 0 2px 8px rgba(0,0,0,0.18);
    margin-bottom: 12px;
}
.hero_banner p {
    color: #fff;
    font-size: 1.2rem;
    margin-bottom: 32px;
    text-shadow: 0 1px 4px rgba(0,0,0,0.12);
}

/* 3. 搜索框卡片化 */
.full_search_box {
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 2px 16px rgba(110,18,126,0.08);
    padding: 24px 18px 12px 18px;
    margin-top: 18px;
}
.full_search_box .form-group label {
    font-weight: 500;
    color: #6e127e;
}
.full_search_box .form-control {
    border-radius: 12px;
    border: 1px solid #e0e0e0;
    font-size: 1rem;
    padding: 8px 12px;
}
.full_search_box .btn.search-btn {
    background: #6e127e;
    color: #fff;
    border-radius: 12px;
    font-weight: 600;
    padding: 10px 0;
    width: 100%;
    transition: background 0.2s;
}
.full_search_box .btn.search-btn:hover {
    background: #4d0e5e;
}

/* 4. 卡片式房源列表 */
.single_property_style.property_style_2.modern {
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 2px 16px rgba(110,18,126,0.10);
    margin-bottom: 32px;
    overflow: hidden;
    transition: box-shadow 0.2s, transform 0.2s;
    display: flex;
    flex-direction: column;
    min-height: 420px;
}
.single_property_style.property_style_2.modern:hover {
    box-shadow: 0 8px 32px rgba(110,18,126,0.18);
    transform: translateY(-4px) scale(1.02);
}
.listing_thumb_wrapper img {
    border-radius: 0;
    width: 100%;
    height: 200px;
    object-fit: cover;
}
.property_caption_wrappers {
    padding: 18px 20px 0 20px;
    flex: 1 1 auto;
}
.pr-property_title a {
    color: #222;
    font-size: 1.15rem;
    font-weight: 600;
    text-decoration: none;
}
.listing-location-name a {
    color: #6e127e;
    font-size: 0.98rem;
    text-decoration: none;
}
.property-real-price a {
    color: #6e127e;
    font-size: 1.1rem;
    font-weight: 700;
}
.deposit-text {
    color: #888;
    font-size: 0.97rem;
    margin-top: 8px;
    font-weight: 500;
}
.modern_property_footer {
    padding: 12px 20px 16px 20px;
    border-top: 1px solid #f0f0f0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: #faf7fb;
}
.property-lists ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    gap: 18px;
}
.property-lists li {
    color: #555;
    font-size: 0.98rem;
    display: flex;
    align-items: center;
}
.property-lists img {
    width: 18px;
    margin-right: 6px;
}
.fp_types .markHouse {
    background: #fff;
    color: #6e127e;
    border: 1.5px solid #6e127e;
    border-radius: 8px;
    padding: 6px 18px;
    font-weight: 600;
    transition: all 0.2s;
    text-decoration: none;
    cursor: pointer;
    box-shadow: 0 1px 4px rgba(110,18,126,0.06);
}
.fp_types .markHouse:hover {
    background: #6e127e;
    color: #fff;
}

/* 5. section 标题 */
.sec-heading.center h2 {
    color: #6e127e;
    font-size: 2rem;
    font-weight: 700;
    margin-bottom: 8px;
}
.sec-heading.center p {
    color: #666;
    font-size: 1.08rem;
    margin-bottom: 18px;
}

/* 6. "View More"按钮 */
.btn-success.arrow-btn.bg-2 {
    background: #6e127e !important;
    border-radius: 12px;
    color: #fff !important;
    font-weight: 600;
    padding: 12px 36px;
    font-size: 1.1rem;
    box-shadow: 0 2px 8px rgba(110,18,126,0.10);
    border: none;
    transition: background 0.2s, box-shadow 0.2s;
}
.btn-success.arrow-btn.bg-2:hover {
    background: #4d0e5e !important;
    box-shadow: 0 4px 16px rgba(110,18,126,0.18);
}

/* 7. 响应式适配 */
@media (max-width: 991px) {
    .hero_banner { min-height: 220px; }
    .property_caption_wrappers { padding: 14px 10px 0 10px; }
    .modern_property_footer { padding: 10px 10px 12px 10px; }
}
@media (max-width: 575px) {
    .hero_banner h1 { font-size: 1.4rem; }
    .sec-heading.center h2 { font-size: 1.2rem; }
    .single_property_style.property_style_2.modern { min-height: 340px; }
}
</style>

<!-- ============================ Hero Banner Start================================== -->
<div class="image-cover hero_banner" style="background:#6e127e url(/assets/img/usm.jpeg) no-repeat;"
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
