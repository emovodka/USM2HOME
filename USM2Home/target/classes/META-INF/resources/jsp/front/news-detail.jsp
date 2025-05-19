<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>

<style>
body {
    font-family: 'Inter', 'Roboto', 'Arial', sans-serif;
    background: #f7f7fa;
    color: #222;
}
.page-title {
    min-height: 160px;
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

.news-card {
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 2px 16px rgba(110,18,126,0.10);
    padding: 36px 36px 32px 36px;
    margin-bottom: 32px;
    max-width: 900px;
    margin-left: auto;
    margin-right: auto;
}
.news-info-row {
    display: flex;
    align-items: center;
    gap: 28px;
    color: #888;
    font-size: 1.08rem;
    margin-bottom: 18px;
    font-weight: 500;
}
.news-title {
    font-size: 2.1rem;
    font-weight: 800;
    color: #6e127e;
    margin-bottom: 22px;
    margin-top: 0;
    letter-spacing: 0.01em;
}
.news-content-area {
    background: #faf7fb;
    border-radius: 12px;
    padding: 22px 24px;
    font-size: 1.13rem;
    color: #333;
    min-height: 80px;
    white-space: pre-wrap;
    word-break: break-all;
}
@media (max-width: 991px) {
    .news-card { padding: 14px 6px 10px 6px; }
}
</style>

<!-- ============================ Page Title Start================================== -->
<div class="page-title" style="background:#f4f4f4 url(/assets/img/inner-banner.jpg);" data-overlay="5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">

                <div class="breadcrumbs-wrap">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">News Details</li>
                    </ol>
                    <h2 class="breadcrumb-title">News Details</h2>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- ============================ Page Title End ================================== -->

<!-- ============================ Agency List Start ================================== -->
<section class="gray-simple">

    <div class="container">

        <!-- row Start -->
        <div class="row">

            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="news-card">
                    <div class="news-info-row">
                        <span><i class="ti-user"></i> Administrator</span>
                        <span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${news.createTime}"/></span>
                    </div>
                    <h2 class="news-title">${news.title}</h2>
                    <div class="news-content-area">
                        ${news.content}
                    </div>
                </div>
            </div>
        </div>
        <!-- /row -->

    </div>

</section>
<!-- ============================ Agency List End ================================== -->


<%@ include file="../common/footer.jsp" %>


</body>
</html>
