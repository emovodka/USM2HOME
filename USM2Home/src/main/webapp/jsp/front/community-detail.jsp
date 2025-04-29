<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${communityName}</title>
    <style>
        /* 你的样式全部保留 */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background-color: #f5f5f5;
        }
        .header {
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            padding: 20px 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        h1 {
            font-size: 28px;
            margin: 0;
            color: #333;
        }
        .property-info {
            display: flex;
            flex-wrap: wrap;
            margin: 30px 0;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .property-details {
            flex: 1;
            min-width: 300px;
            padding: 25px;
        }
        .info-row {
            display: flex;
            margin-bottom: 15px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }
        .info-label {
            width: 120px;
            font-weight: 600;
            color: #666;
        }
        .info-value {
            flex: 1;
        }
        .property-description {
            margin-top: 20px;
            line-height: 1.6;
        }
        .gallery {
            flex: 1;
            min-width: 300px;
            background: #f9f9f9;
            padding: 25px;
        }
        .main-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 10px;
        }
        .thumbnail-container {
            display: flex;
            gap: 10px;
            overflow-x: auto;
        }
        .thumbnail {
            width: 80px;
            height: 60px;
            border-radius: 4px;
            object-fit: cover;
            cursor: pointer;
            transition: opacity 0.2s;
        }
        .thumbnail:hover {
            opacity: 0.8;
        }
        .section-title {
            margin: 40px 0 20px;
            font-size: 22px;
            font-weight: 600;
            color: #333;
            position: relative;
            padding-left: 15px;
        }
        .section-title:before {
            content: '';
            position: absolute;
            left: 0;
            top: 5px;
            height: 20px;
            width: 5px;
            background: #1e88e5;
            border-radius: 2px;
        }
        .apartment-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }
        .apartment-card {
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }
        .apartment-card:hover {
            transform: translateY(-5px);
        }
        .apartment-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }
        .apartment-info {
            padding: 15px;
        }
        .apartment-title {
            font-size: 18px;
            font-weight: 600;
            margin: 0 0 10px 0;
        }
        .apartment-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .apartment-area, .apartment-layout {
            font-size: 14px;
            color: #666;
        }
        .apartment-price {
            font-size: 20px;
            font-weight: 600;
            color: #f44336;
            margin: 10px 0;
        }
        .view-button {
            display: block;
            width: 100%;
            padding: 10px;
            background: #1e88e5;
            color: #fff;
            text-align: center;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.2s;
        }
        .view-button:hover {
            background: #1565c0;
        }
        .feature-icons {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }
        .feature-icon {
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #666;
        }
        .feature-icon i {
            margin-right: 5px;
            color: #1e88e5;
        }
        .back-button {
            margin-top: 10px;
            margin-bottom: 10px;
            padding: 6px 18px;
            background: #0a4981;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.2s;
        }
        .back-button:hover {
            background: #1565c0;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="container" style="display: flex; align-items: center;">
            <button onclick="window.history.back();" class="back-button" style="margin-right: 40px;">Back</button>
            <h1 style="margin: 0;">${communityName}</h1>
        </div>
    </div>
    
    <div class="container">
        <div class="property-info">
            <div class="property-details">
                <div class="info-row">
                    <div class="info-label">Address</div>
                    <div class="info-value">
                        <c:out value="${communityAddress != null ? communityAddress : 'No address info'}"/>
                    </div>
                </div>
                <div class="info-row">
                    <div class="info-label">Year Built</div>
                    <div class="info-value">
                        <c:out value="${communityYear != null ? communityYear : 'Unknown'}"/>
                    </div>
                </div>
                <div class="info-row">
                    <div class="info-label">Developer</div>
                    <div class="info-value">
                        <c:out value="${communityDeveloper != null ? communityDeveloper : 'Unknown'}"/>
                    </div>
                </div>
                <div class="info-row">
                    <div class="info-label">Distance</div>
                    <div class="info-value">
                        <c:out value="${communityDistance != null ? communityDistance : 'Unknown'}"/>
                    </div>
                </div>
                <div class="property-description">
                    <c:out value="${communityInfo}"/>
                </div>
            </div>
            
            <div class="gallery">
                <c:choose>
                    <c:when test="${not empty communityImages}">
                        <img src="${communityImages[0]}" alt="${communityName}" class="main-image" id="mainImage">
                        <div class="thumbnail-container">
                            <c:forEach var="img" items="${communityImages}">
                                <img src="${img}" alt="Community View" class="thumbnail">
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <img src="/assets/img/community/default.jpg" alt="No Image" class="main-image">
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <h2 class="section-title">Apartments For Rent</h2>
        <div class="apartment-grid">
            <c:forEach items="${houseList}" var="house">
                <div class="apartment-card">
                    <img src="${house.thumbnailUrl}" alt="${house.title}" class="apartment-image">
                    <div class="apartment-info">
                        <h3 class="apartment-title">${house.title}</h3>
                        <div class="apartment-details">
                            <span class="apartment-layout">${house.bedroomNum} Bedroom, ${house.toiletNum} Bath</span>
                            <span class="apartment-area">${house.area} m²</span>
                        </div>
                        <div class="feature-icons">
                            <span class="feature-icon"><i>🏠</i> ${house.direction}</span>
                            <c:if test="${house.hasAirConditioner == 1}">
                                <span class="feature-icon"><i>❄️</i> AC</span>
                            </c:if>
                            <c:if test="${house.hasElevator == 1}">
                                <span class="feature-icon"><i>🛗</i> Elevator</span>
                            </c:if>
                        </div>
                        <div class="apartment-price">RM ${house.monthRent}/month</div>
                        <a href="/house/detail/${house.id}" class="view-button">View Details</a>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty houseList}">
                <div style="text-align: center; width: 100%; padding: 40px 20px;">
                    <p style="color: #666; font-size: 16px;">No apartments available for rent at the moment.</p>
                </div>
            </c:if>
        </div>
    </div>
    
    <script>
        // 图片切换功能
        const mainImage = document.getElementById('mainImage');
        const thumbnails = document.querySelectorAll('.thumbnail');
        thumbnails.forEach(thumbnail => {
            thumbnail.addEventListener('click', () => {
                mainImage.src = thumbnail.src;
                mainImage.alt = thumbnail.alt;
            });
        });
    </script>
</body>
</html>
