<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>

<!-- Add Google Maps API -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>

<!-- Custom CSS -->
<style>
    #map-container {
        height: 400px;
        width: 100%;
        margin-bottom: 20px;
        border-radius: 10px;
        overflow: hidden;
    }
    .property-item {
        padding: 15px;
        border-bottom: 1px solid #eee;
        display: flex;
        align-items: center;
        transition: all 0.3s ease;
        text-decoration: none;
        color: inherit;
    }
    .property-item:hover {
        background: #f8f9fa;
        transform: translateY(-2px);
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    .property-icon {
        margin-right: 15px;
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: #f0f2f5;
        border-radius: 50%;
    }
    .property-details {
        flex-grow: 1;
    }
    .view-btn {
        padding: 8px 20px;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    .view-btn:hover {
        background: #0056b3;
        transform: scale(1.05);
    }
    .property-count {
        background: #f8f9fa;
        padding: 10px 15px;
        border-radius: 5px;
        margin-bottom: 15px;
    }
</style>

<!-- ============================ Page Title Start================================== -->
<div class="page-title" style="background:#f4f4f4 url(/assets/img/inner-banner.jpg);" data-overlay="5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="breadcrumbs-wrap">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">Explore</li>
                    </ol>
                    <h2 class="breadcrumb-title">Home near USM</h2>
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
            <div class="col-12">
                <h1 class="mb-4">Find your home...</h1>
                <p class="text-muted">View popular properties around USM on our map!</p>
            </div>
        </div>
        
        <!-- Map Container -->
        <div class="row mb-4">
            <div class="col-12">
                <div id="map-container"></div>
            </div>
        </div>

        <!-- Property List -->
        <div class="row">
            <div class="col-12">
                <div class="property-count">
                    <p class="mb-0">Scroll down to check all spots!</p>
                    <small class="text-muted">Total 100 properties available for rent</small>
                </div>

                <!-- Property Items -->
                <div class="property-list">
                    <a href="/property/detail/plaza-ivory" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-building"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">Plaza Ivory</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>

                    <a href="/property/detail/e-park" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-home"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">E-park</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>

                    <a href="/property/detail/n-park" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-building"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">N-Park</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/property/detail/sunny-ville" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-home"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">Sunny Ville</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/property/detail/university-heights" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-building"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">University Heights</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/property/detail/starhill" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-home"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">Starhill</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/property/detail/gambier-heights" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-building"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">Gambier Heights</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/property/detail/arte-s" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-home"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">Arte S</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/property/detail/sri-saujana" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-building"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">Sri Saujana</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/property/detail/quaywest-residence" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-home"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">QuayWest Residence</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/property/detail/tropicana-bay-residence" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-home"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">Tropicana Bay Residence</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/property/detail/taman-pekaka" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-building"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">Taman Pekaka</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/property/detail/the-view" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-home"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">The View</h5>
                        </div>
                        <button class="view-btn" onclick="event.stopPropagation();">View</button>
                    </a>
                    <a href="/property/detail/putra-place" class="property-item">
                        <div class="property-icon">
                            <i class="fas fa-building"></i>
                        </div>
                        <div class="property-details">
                            <h5 class="mb-1">Putra Place</h5>
                        </div>
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
