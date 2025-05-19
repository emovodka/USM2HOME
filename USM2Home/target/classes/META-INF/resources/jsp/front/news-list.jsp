<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>

<!-- Add Google Maps API -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>

<!-- Custom CSS -->
<style>
/* 1. 全局字体和背景 */
body {
    font-family: 'Inter', 'Roboto', 'Arial', sans-serif;
    background: #f7f7fa;
    color: #222;
}

/* 2. 顶部大图和标题 */
.page-title {
    min-height: 220px;
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

/* 3. 分组标题卡片化 */
.page-title-group {
    background: #6e127e;
    color: #fff;
    border-radius: 14px 14px 0 0;
    padding: 16px 20px;
    font-size: 1.25rem;
    font-weight: 600;
    margin-top: 30px;
    box-shadow: 0 2px 8px rgba(110,18,126,0.10);
}

/* 4. 社区卡片列表 */
.property-item {
    background: #fff;
    border-radius: 14px;
    box-shadow: 0 2px 12px rgba(110,18,126,0.08);
    margin-bottom: 14px;
    padding: 16px 18px;
    display: flex;
    align-items: center;
    transition: box-shadow 0.2s, transform 0.2s;
    text-decoration: none;
    color: #222;
}
.property-item:hover {
    background: #f8f9fa;
    transform: translateY(-2px) scale(1.01);
    box-shadow: 0 4px 16px rgba(110,18,126,0.16);
}
.property-icon {
    margin-right: 18px;
    width: 44px;
    height: 44px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f0e6f3;
    border-radius: 50%;
    font-size: 1.3rem;
    color: #6e127e;
}
.property-details h5 {
    margin-bottom: 0;
    font-size: 1.08rem;
    font-weight: 600;
}
.view-btn {
    padding: 8px 22px;
    background: #6e127e;
    color: #fff;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    font-size: 1rem;
    transition: background 0.2s, transform 0.2s;
    margin-left: auto;
}
.view-btn:hover {
    background: #4d0e5e;
    transform: scale(1.06);
}

/* 5. section 标题 */
.property-count {
    background: #f8f9fa;
    padding: 10px 15px;
    border-radius: 8px;
    margin-bottom: 15px;
    color: #6e127e;
    font-weight: 500;
    font-size: 1.08rem;
}

/* 6. 地图图片卡片化 */
img[alt="USM Area Map"] {
    border-radius: 16px;
    box-shadow: 0 2px 8px rgba(110,18,126,0.08);
    margin-bottom: 18px;
}

/* 7. 响应式适配 */
@media (max-width: 991px) {
    .page-title { min-height: 120px; }
    .property-item { padding: 12px 8px; }
    .property-icon { width: 36px; height: 36px; font-size: 1.1rem; }
}
@media (max-width: 575px) {
    .breadcrumbs-wrap .breadcrumb-title { font-size: 1.1rem; }
    .page-title-group { font-size: 1rem; padding: 10px 8px; }
}
</style>

<!-- ============================ Page Title Start================================== -->
<div class="page-title" style="background:#f4f4f4 url(/assets/img/usm.jpeg);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="breadcrumbs-wrap">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page" style="color: #fff !important;">Explore</li>
                    </ol>
                    <h2 class="breadcrumb-title" style="color: #fff !important;">Home near USM</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ============================ Page Title End ================================== -->

<!-- Main Content -->
<section class="gray-simple">
    <div class="container">
        <div class="row">
           
        </div>
        
        <!-- Map Container 替换为图片 -->
        <div class="row mb-4">
            <div class="col-12">
                <div style="width:100%; text-align:center;">
                    <img src="/assets/img/Map.png" alt="USM Area Map" style="max-width:100%; border-radius:10px; box-shadow:0 2px 8px rgba(0,0,0,0.08);">
                </div>
            </div>
        </div>

        <!-- Property List -->
        <div class="row">
            <div class="col-12">
                <div class="property-count">
            
                
                </div>

                <!-- Near Bukit Gambier Entrance 分组 -->
                <div style="background: #6e127e; color: #fff; border-radius: 12px 12px 0 0; padding: 16px 20px; font-size: 22px; font-weight: 600; margin-top: 30px;">
                    Near Bukit Gambier Entrance
                </div>
                <div style="background: #fff; border-radius: 0 0 12px 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); padding: 18px 0 8px 0; margin-bottom: 30px;">
                    <a href="/community?name=Gambier Heights" class="property-item">
                        <div class="property-icon"><i class="fas fa-building"></i></div>
                        <div class="property-details"><h5 class="mb-1">Gambier Heights</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/community?name=Arte S" class="property-item">
                        <div class="property-icon"><i class="fas fa-home"></i></div>
                        <div class="property-details"><h5 class="mb-1">Arte S</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/community?name=Plaza Ivory" class="property-item">
                        <div class="property-icon"><i class="fas fa-building"></i></div>
                        <div class="property-details"><h5 class="mb-1">Plaza Ivory</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/community?name=Starhill" class="property-item">
                        <div class="property-icon"><i class="fas fa-home"></i></div>
                        <div class="property-details"><h5 class="mb-1">Starhill</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/community?name=Taman Pekaka" class="property-item">
                        <div class="property-icon"><i class="fas fa-building"></i></div>
                        <div class="property-details"><h5 class="mb-1">Taman Pekaka</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                </div>

                <!-- Near Sungai Dua Entrance 分组 -->
                <div style="background: #6e127e; color: #fff; border-radius: 12px 12px 0 0; padding: 16px 20px; font-size: 22px; font-weight: 600; margin-top: 30px;">
                    Near Sungai Dua Entrance
                </div>
                <div style="background: #fff; border-radius: 0 0 12px 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); padding: 18px 0 8px 0; margin-bottom: 30px;">
                    <a href="/community?name=University Heights" class="property-item">
                        <div class="property-icon"><i class="fas fa-building"></i></div>
                        <div class="property-details"><h5 class="mb-1">University Heights</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/community?name=E-Park" class="property-item">
                        <div class="property-icon"><i class="fas fa-home"></i></div>
                        <div class="property-details"><h5 class="mb-1">E-Park</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/community?name=N-Park" class="property-item">
                        <div class="property-icon"><i class="fas fa-building"></i></div>
                        <div class="property-details"><h5 class="mb-1">N-Park</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/community?name=Sri Saujana" class="property-item">
                        <div class="property-icon"><i class="fas fa-building"></i></div>
                        <div class="property-details"><h5 class="mb-1">Sri Saujana</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/community?name=Sunny Ville" class="property-item">
                        <div class="property-icon"><i class="fas fa-home"></i></div>
                        <div class="property-details"><h5 class="mb-1">Sunny Ville</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                </div>

                <!-- Near Batu Uban Entrance 分组 -->
                <div style="background: #6e127e; color: #fff; border-radius: 12px 12px 0 0; padding: 16px 20px; font-size: 22px; font-weight: 600; margin-top: 30px;">
                    Near Batu Uban Entrance
                </div>
                <div style="background: #fff; border-radius: 0 0 12px 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); padding: 18px 0 8px 0; margin-bottom: 30px;">
                    <a href="/community?name=The View" class="property-item">
                        <div class="property-icon"><i class="fas fa-home"></i></div>
                        <div class="property-details"><h5 class="mb-1">The View</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                </div>

                <!-- Near Queensbay Mall 分组 -->
                <div style="background: #6e127e; color: #fff; border-radius: 12px 12px 0 0; padding: 16px 20px; font-size: 22px; font-weight: 600; margin-top: 30px;">
                    Near Queensbay Mall
                </div>
                <div style="background: #fff; border-radius: 0 0 12px 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); padding: 18px 0 8px 0; margin-bottom: 30px;">
                    <a href="/community?name=Tropicana Bay Residence" class="property-item">
                        <div class="property-icon"><i class="fas fa-home"></i></div>
                        <div class="property-details"><h5 class="mb-1">Tropicana Bay Residence</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/community?name=QuayWest Residence" class="property-item">
                        <div class="property-icon"><i class="fas fa-home"></i></div>
                        <div class="property-details"><h5 class="mb-1">QuayWest Residence</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/community?name=Putra Place" class="property-item">
                        <div class="property-icon"><i class="fas fa-building"></i></div>
                        <div class="property-details"><h5 class="mb-1">Putra Place</h5></div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Initialize Map -->
<script>
function initMap() {
    // USM coordinates (approximate)
    const usmCenter = { lat: 5.3557, lng: 100.3023 };
    
    const map = new google.maps.Map(document.getElementById("map-container"), {
        zoom: 14,
        center: usmCenter,
        styles: [
            {
                "featureType": "poi",
                "elementType": "labels",
                "stylers": [
                    { "visibility": "off" }
                ]
            }
        ]
    });

    // Add markers for properties
    const locations = [
        { name: "Plaza Ivory", lat: 5.3557, lng: 100.3023, url: "/property/detail/plaza-ivory" },
        { name: "E-park", lat: 5.3577, lng: 100.3043, url: "/property/detail/e-park" },
        { name: "N-Park", lat: 5.3577, lng: 100.3043, url: "/property/detail/n-park" },
        { name: "Sunny Ville", lat: 5.3577, lng: 100.3043, url: "/property/detail/sunny-ville" },
        { name: "University Heights", lat: 5.3577, lng: 100.3043, url: "/property/detail/university-heights" },
        { name: "Starhill", lat: 5.3577, lng: 100.3043, url: "/property/detail/starhill" },
        { name: "Gambier Heights", lat: 5.3577, lng: 100.3043, url: "/property/detail/gambier-heights" },
        { name: "Arte S", lat: 5.3577, lng: 100.3043, url: "/property/detail/arte-s" },
        { name: "Sri Saujana", lat: 5.3577, lng: 100.3043, url: "/property/detail/sri-saujana" },
        { name: "QuayWest Residence", lat: 5.3577, lng: 100.3043, url: "/property/detail/quaywest-residence" },
        { name: "Tropicana Bay Residence", lat: 5.3577, lng: 100.3043, url: "/property/detail/tropicana-bay-residence" },
        { name: "Taman Pekaka", lat: 5.3577, lng: 100.3043, url: "/property/detail/taman-pekaka" },
        { name: "The View", lat: 5.3577, lng: 100.3043, url: "/property/detail/the-view" },
        { name: "Putra Place", lat: 5.3577, lng: 100.3043, url: "/property/detail/putra-place" }
    ];

    locations.forEach(location => {
        const marker = new google.maps.Marker({
            position: { lat: location.lat, lng: location.lng },
            map: map,
            title: location.name
        });

        // Add click event to marker
        marker.addListener("click", () => {
            window.location.href = location.url;
        });
    });
}

// Initialize map when page loads
window.onload = initMap;
</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>
