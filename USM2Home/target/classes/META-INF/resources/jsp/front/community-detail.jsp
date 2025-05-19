<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${communityName}</title>
    <style>
        /* 统一卡片风格，和 index.jsp 一致 */
        body {
            font-family: 'Inter', 'Roboto', 'Arial', sans-serif;
            background: #f7f7fa;
            color: #222;
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
        .top-section {
            display: flex;
            gap: 32px;
            margin: 36px 0 32px 0;
            flex-wrap: wrap;
        }
        .community-info-card {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 2px 16px rgba(110,18,126,0.10);
            padding: 32px 28px 24px 28px;
            flex: 1 1 340px;
            min-width: 320px;
            max-width: 480px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .community-title {
            font-size: 2.1rem;
            font-weight: 800;
            color: #6e127e;
            margin-bottom: 10px;
        }
        .info-list {
            margin: 0 0 18px 0;
            padding: 0;
            list-style: none;
        }
        .info-list li {
            margin-bottom: 10px;
            font-size: 1.08rem;
            color: #555;
            display: flex;
        }
        .info-list .label {
            width: 110px;
            color: #a08bb7;
            font-weight: 600;
            flex-shrink: 0;
        }
        .info-list .value {
            color: #222;
            font-weight: 500;
        }
        .community-description {
            margin-top: 10px;
            color: #666;
            line-height: 1.7;
            font-size: 1.05rem;
        }
        .gallery-card {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 2px 16px rgba(110,18,126,0.10);
            padding: 24px 18px 18px 18px;
            flex: 1 1 340px;
            min-width: 320px;
            max-width: 520px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .main-image {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 12px;
            box-shadow: 0 2px 8px rgba(110,18,126,0.08);
        }
        .thumbnail-container {
            display: flex;
            gap: 10px;
            overflow-x: auto;
        }
        .thumbnail {
            width: 80px;
            height: 60px;
            border-radius: 8px;
            object-fit: cover;
            cursor: pointer;
            transition: opacity 0.2s;
            box-shadow: 0 1px 4px rgba(110,18,126,0.06);
        }
        .thumbnail:hover {
            opacity: 0.8;
        }
        .section-title {
            color: #6e127e;
            font-size: 2rem;
            font-weight: 700;
            margin: 40px 0 20px 0;
            padding-left: 0;
            position: static;
        }
        .apartment-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 28px;
            margin-bottom: 40px;
        }
        .apartment-card {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 2px 16px rgba(110,18,126,0.10);
            overflow: hidden;
            transition: box-shadow 0.2s, transform 0.2s;
            display: flex;
            flex-direction: column;
            min-height: 340px;
        }
        .apartment-card:hover {
            box-shadow: 0 8px 32px rgba(110,18,126,0.18);
            transform: translateY(-4px) scale(1.02);
        }
        .apartment-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 18px 18px 0 0;
        }
        .apartment-info {
            padding: 18px 20px 12px 20px;
            flex: 1 1 auto;
        }
        .apartment-title {
            font-size: 1.18rem;
            font-weight: 700;
            color: #222;
            margin: 0 0 10px 0;
        }
        .apartment-details {
            display: flex;
            gap: 18px;
            margin-bottom: 10px;
        }
        .apartment-layout {
            color: #6e127e;
        }
        .apartment-area {
            color: #a08bb7;
        }
        .feature-icons {
            display: flex;
            gap: 15px;
            margin-bottom: 10px;
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
        .apartment-price {
            color: #6e127e;
            font-size: 1.22rem;
            font-weight: 800;
            margin-bottom: 8px;
        }
        .view-button {
            display: inline-block;
            padding: 10px 28px;
            background: #6e127e;
            color: #fff;
            text-align: center;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
            box-shadow: 0 2px 8px rgba(110,18,126,0.10);
        }
        .view-button:hover {
            background: #4d0e5e;
        }
        .back-button {
            margin-top: 10px;
            margin-bottom: 10px;
            padding: 6px 18px;
            background: #6e127e;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.2s;
        }
        .back-button:hover {
            background: #4d0e5e;
        }
        @media (max-width: 991px) {
            .top-section { flex-direction: column; gap: 18px; }
            .gallery-card, .community-info-card { max-width: 100%; min-width: 0; }
            .apartment-grid { grid-template-columns: 1fr; }
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
        <div class="top-section">
            <div class="community-info-card">
                <div class="community-title">${communityName}</div>
                <ul class="info-list">
                    <li><span class="label">Address</span><span class="value"><c:out value="${communityAddress != null ? communityAddress : 'No address info'}"/></span></li>
                    <li><span class="label">Year Built</span><span class="value"><c:out value="${communityYear != null ? communityYear : 'Unknown'}"/></span></li>
                    <li><span class="label">Developer</span><span class="value"><c:out value="${communityDeveloper != null ? communityDeveloper : 'Unknown'}"/></span></li>
                    <li><span class="label">Distance</span><span class="value"><c:out value="${communityDistance != null ? communityDistance : 'Unknown'}"/></span></li>
                </ul>
                <div class="community-description"><c:out value="${communityInfo}"/></div>
            </div>
            <div class="gallery-card">
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
