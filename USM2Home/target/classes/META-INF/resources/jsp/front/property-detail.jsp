<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>

<!-- Custom CSS -->
<style>
    .property-gallery {
        margin-bottom: 30px;
    }
    .property-gallery img {
        width: 100%;
        border-radius: 10px;
        margin-bottom: 15px;
    }
    .property-thumbnail {
        width: 100px;
        height: 70px;
        object-fit: cover;
        border-radius: 5px;
        cursor: pointer;
        margin-right: 10px;
    }
    .property-thumbnail:hover {
        opacity: 0.8;
    }
    .property-features {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 30px;
    }
    .feature-item {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }
    .feature-icon {
        width: 40px;
        height: 40px;
        background: #e9ecef;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 15px;
    }
    .contact-form {
        background: #fff;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0,0,0,0.1);
    }
    .price-tag {
        font-size: 24px;
        color: #007bff;
        font-weight: bold;
        margin-bottom: 20px;
    }
</style>

<!-- ============================ Page Title Start================================== -->
<div class="page-title" style="background:#f4f4f4 url(/assets/img/inner-banner.jpg);" data-overlay="5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="breadcrumbs-wrap">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/property/list">Properties</a></li>
                        <li class="breadcrumb-item active" aria-current="page">${property.name}</li>
                    </ol>
                    <h2 class="breadcrumb-title">${property.name}</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ============================ Page Title End ================================== -->

<!-- Property Detail Content -->
<section class="gray-simple">
    <div class="container">
        <div class="row">
            <!-- Property Images -->
            <div class="col-lg-8 col-md-12">
                <div class="property-gallery">
                    <div class="main-image mb-3">
                        <img src="${property.mainImage}" alt="${property.name}" class="img-fluid">
                    </div>
                    <div class="thumbnails d-flex">
                        <c:forEach items="${property.images}" var="image">
                            <img src="${image}" alt="" class="property-thumbnail">
                        </c:forEach>
                    </div>
                </div>

                <!-- Property Description -->
                <div class="property-description mb-4">
                    <h3>Description</h3>
                    <p>${property.description}</p>
                </div>

                <!-- Property Features -->
                <div class="property-features">
                    <h3>Features & Amenities</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="fas fa-bed"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">${property.bedrooms} Bedrooms</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="fas fa-bath"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">${property.bathrooms} Bathrooms</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="fas fa-ruler-combined"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">${property.area} sq ft</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="fas fa-car"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">${property.parking} Parking</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Location Map -->
                <div class="location-map mb-4">
                    <h3>Location</h3>
                    <div id="property-map" style="height: 300px;"></div>
                </div>
            </div>

            <!-- Sidebar -->
            <div class="col-lg-4 col-md-12">
                <div class="contact-form">
                    <div class="price-tag">
                        RM ${property.price} / month
                    </div>
                    <h4>Contact Agent</h4>
                    <form action="/property/contact" method="POST">
                        <input type="hidden" name="propertyId" value="${property.id}">
                        <div class="form-group">
                            <input type="text" class="form-control" name="name" placeholder="Your Name" required>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" name="email" placeholder="Your Email" required>
                        </div>
                        <div class="form-group">
                            <input type="tel" class="form-control" name="phone" placeholder="Your Phone">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" name="message" rows="4" placeholder="Your Message" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Initialize Property Map -->
<script>
function initPropertyMap() {
    const propertyLocation = { 
        lat: ${property.latitude}, 
        lng: ${property.longitude} 
    };
    
    const map = new google.maps.Map(document.getElementById("property-map"), {
        zoom: 15,
        center: propertyLocation,
    });

    new google.maps.Marker({
        position: propertyLocation,
        map: map,
        title: "${property.name}"
    });
}

// Initialize map when page loads
window.onload = initPropertyMap;

// Image gallery functionality
document.querySelectorAll('.property-thumbnail').forEach(thumb => {
    thumb.addEventListener('click', function() {
        document.querySelector('.main-image img').src = this.src;
    });
});
</script>

<%@ include file="../common/footer.jsp" %>
</body>
</html> 