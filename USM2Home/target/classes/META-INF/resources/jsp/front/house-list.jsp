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

/* 2. 顶部大图和标题 */
.page-title {
    min-height: 180px;
    display: flex;
    align-items: center;
    background-size: cover;
    background-position: center;
    border-radius: 0 0 24px 24px;
    box-shadow: 0 4px 24px rgba(110,18,126,0.08);
    position: relative;
    margin-bottom: 32px;
}
.breadcrumbs-wrap .breadcrumb-title,
.breadcrumbs-wrap .breadcrumb-item.active {
    color: #fff !important;
    opacity: 1 !important;
    text-shadow: 0 1px 4px rgba(0,0,0,0.25);
    font-size: 2.1rem;
    font-weight: 700;
}
.breadcrumbs-wrap .breadcrumb-item.active {
    font-size: 1.1rem;
    font-weight: 500;
}

/* 3. 筛选栏卡片化 */
.filter-bar {
    background: #fff;
    border-radius: 14px;
    box-shadow: 0 2px 12px rgba(110,18,126,0.08);
    padding: 18px 20px 10px 20px;
    margin-bottom: 24px;
    display: flex;
    flex-wrap: wrap;
    gap: 18px;
    align-items: center;
}
.filter-bar label {
    color: #6e127e;
    font-weight: 500;
    margin-right: 8px;
}
.filter-bar .form-control {
    border-radius: 10px;
    border: 1px solid #e0e0e0;
    font-size: 1rem;
    padding: 7px 12px;
    min-width: 120px;
}
.filter-bar .btn {
    background: #6e127e;
    color: #fff;
    border-radius: 10px;
    font-weight: 600;
    padding: 8px 24px;
    border: none;
    transition: background 0.2s;
}
.filter-bar .btn:hover {
    background: #4d0e5e;
}

/* 4. 房源卡片列表 */
.single_property_style.property_style_2.modern {
    background: #fff;
    border-radius: 22px;
    box-shadow: 0 4px 24px rgba(110,18,126,0.10);
    margin-bottom: 36px;
    overflow: hidden;
    transition: box-shadow 0.25s, transform 0.22s;
    display: flex;
    flex-direction: column;
    min-height: 420px;
    border: 1.5px solid #f3e6f7;
    position: relative;
}
.single_property_style.property_style_2.modern:hover {
    box-shadow: 0 12px 36px rgba(110,18,126,0.18);
    transform: translateY(-6px) scale(1.025);
    border-color: #e3c6ee;
}
.listing_thumb_wrapper img {
    border-radius: 22px 22px 0 0;
    width: 100%;
    height: 180px;
    object-fit: cover;
    transition: filter 0.2s;
}
.single_property_style.property_style_2.modern:hover .listing_thumb_wrapper img {
    filter: brightness(0.96) saturate(1.1);
}
.property_caption_wrappers {
    padding: 20px 22px 0 22px;
    flex: 1 1 auto;
}
.pr-property_title a {
    color: #222;
    font-size: 1.18rem;
    font-weight: 700;
    text-decoration: none;
    letter-spacing: 0.01em;
}
.listing-location-name a {
    color: #a08bb7;
    font-size: 0.99rem;
    text-decoration: none;
    font-weight: 500;
}
.property-real-price a {
    color: #6e127e;
    font-size: 1.22rem;
    font-weight: 800;
    letter-spacing: 0.01em;
}
.deposit-text {
    color: #6e127e;
    font-size: 1.01rem;
    margin-top: 10px;
    font-weight: 600;
}
.modern_property_footer {
    padding: 14px 22px 18px 22px;
    border-top: 1.5px solid #f3e6f7;
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: #faf7fb;
}
.property-lists ul {
    display: flex !important;
    flex-direction: row !important;
    align-items: center;
    gap: 12px;
    margin-bottom: 0;
}
.property-lists li {
    color: #6e127e;
    font-size: 1.01rem;
    display: flex;
    align-items: center;
    background: #f3e6f7;
    border-radius: 50px;
    padding: 5px 14px 5px 8px;
    margin-right: 6px;
}
.property-lists img {
    width: 20px;
    margin-right: 7px;
}
.fp_types .markHouse {
    background: #fff;
    color: #6e127e;
    border: 1.5px solid #6e127e;
    border-radius: 16px;
    padding: 7px 22px;
    font-weight: 700;
    transition: all 0.2s;
    text-decoration: none;
    cursor: pointer;
    box-shadow: 0 1px 4px rgba(110,18,126,0.06);
    font-size: 1.01rem;
}
.fp_types .markHouse:hover {
    background: #6e127e;
    color: #fff;
    border-color: #6e127e;
    box-shadow: 0 2px 8px rgba(110,18,126,0.13);
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
    .page-title { min-height: 120px; }
    .property_caption_wrappers { padding: 14px 10px 0 10px; }
    .modern_property_footer { padding: 10px 10px 12px 10px; }
    .filter-bar { padding: 10px 6px 6px 6px; gap: 8px; }
}
@media (max-width: 575px) {
    .breadcrumbs-wrap .breadcrumb-title { font-size: 1.1rem; }
    .sec-heading.center h2 { font-size: 1.2rem; }
    .single_property_style.property_style_2.modern { min-height: 340px; }
}
</style>

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
                                            <a href="/house/detail/${c.id}" class="cl-blue">
                                                RM ${c.monthRent}<span class="price_status">/Month</span>
                                            </a>
                                        </div>
                                        <div class="deposit-text">
                                            <c:if test="${c.deposit != null}">
                                                Deposit: <span style="font-weight:600;color:#6e127e;">RM ${Math.round(c.deposit)}</span>
                                            </c:if>
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
