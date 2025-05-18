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

.post-list-card {
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 2px 16px rgba(110,18,126,0.10);
    padding: 32px 36px 28px 36px;
    margin-bottom: 32px;
    transition: all 0.3s ease;
    max-width: 900px;
    margin-left: auto;
    margin-right: auto;
    border: 1px solid rgba(110,18,126,0.08);
}
.post-list-card:hover {
    box-shadow: 0 8px 32px rgba(110,18,126,0.18);
    transform: translateY(-4px);
    border-color: rgba(110,18,126,0.2);
}
.post-list-info-row {
    display: flex;
    align-items: center;
    gap: 28px;
    color: #888;
    font-size: 1.08rem;
    margin-bottom: 16px;
    font-weight: 500;
}
.post-list-info-row i {
    color: #6e127e;
    margin-right: 6px;
}
.post-list-title {
    font-size: 1.5rem;
    font-weight: 800;
    color: #6e127e;
    margin-bottom: 18px;
    margin-top: 0;
    letter-spacing: 0.01em;
    transition: color 0.2s;
}
.post-list-title:hover {
    color: #4d0e5e;
}
.post-list-summary {
    background: #faf7fb;
    border-radius: 12px;
    padding: 18px 22px;
    font-size: 1.13rem;
    color: #333;
    min-height: 60px;
    margin-bottom: 10px;
    line-height: 1.6;
}
.post-list-time {
    color: #a08bb7;
    font-size: 0.98rem;
    margin-top: 8px;
    margin-bottom: 0;
    display: flex;
    align-items: center;
    gap: 6px;
}
.post-list-time i {
    font-size: 0.9rem;
}
.property_block_title {
    font-size: 1.25rem;
    font-weight: 700;
    color: #6e127e;
    margin-bottom: 8px;
    transition: color 0.2s;
}
.property_block_wrap_header a:hover .property_block_title {
    color: #4d0e5e;
}
.block-body {
    color: #444;
    font-size: 1.08rem;
    margin-bottom: 8px;
}
.block-body p {
    color: #a08bb7;
    font-size: 0.98rem;
    margin-top: 8px;
    margin-bottom: 0;
}
.pagination {
    margin-top: 40px;
    justify-content: center;
}
.pagination .page-item .page-link {
    color: #6e127e;
    border: 1px solid rgba(110,18,126,0.2);
    margin: 0 4px;
    border-radius: 8px;
    padding: 8px 16px;
    transition: all 0.2s;
}
.pagination .page-item.active .page-link {
    background-color: #6e127e;
    border-color: #6e127e;
    color: white;
}
.pagination .page-item .page-link:hover {
    background-color: rgba(110,18,126,0.1);
    border-color: #6e127e;
}
@media (max-width: 991px) {
    .post-list-card { 
        padding: 24px 20px 20px 20px; 
        margin-bottom: 24px;
    }
    
    .post-list-title {
        font-size: 1.3rem;
    }
    
    .post-list-summary {
        font-size: 1.05rem;
        padding: 16px 18px;
    }
}
</style>

<!-- ============================ Page Title Start================================== -->
<div class="page-title" style="background:#f4f4f4 url(/assets/img/usm1.jpeg);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">

                <div class="breadcrumbs-wrap">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page" style="color: #fff !important;">Post details</li>
                    </ol>
                    <h2 class="breadcrumb-title" style="color: #fff !important;">Post to find a rental</h2>
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

            <c:forEach items="${pageInfo.records}" var="c">
                <div class="col-lg-12 col-md-12">
                    <div class="post-list-card">
                        <div class="post-list-info-row">
                            <span><i class="ti-user"></i> ${c.user.userDisplayName}</span>
                            <span><i class="ti-calendar"></i> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${c.createTime}" /></span>
                        </div>
                        <div class="property_block_wrap_header">
                            <a href="/post/detail/${c.id}">
                                <h2 class="post-list-title">${c.title}</h2>
                            </a>
                        </div>
                        <div class="post-list-summary">
                            ${c.summary}
                        </div>
                        <div class="post-list-time">
                            <i class="ti-time"></i> Published time: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${c.createTime}" />
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- /row -->

        <!-- Pagination 分页 -->
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <%@ include file="../common/page.jsp" %>
            </div>
        </div>

    </div>

</section>
<!-- ============================ Agency List End ================================== -->


<%@ include file="../common/footer.jsp" %>


</body>
</html>
