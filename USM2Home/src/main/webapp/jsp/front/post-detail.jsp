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

.post-card {
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 2px 16px rgba(110,18,126,0.10);
    padding: 32px 28px 24px 28px;
    margin-bottom: 32px;
}
.post-title {
    font-size: 1.6rem;
    font-weight: 700;
    color: #6e127e;
    margin-bottom: 18px;
}
.article_middle_info {
    display: flex;
    gap: 22px;
    margin-bottom: 12px;
    color: #888;
    font-size: 1.05rem;
}
.article_middle_info li {
    list-style: none;
}
.article_body_wrap pre {
    background: #faf7fb;
    border-radius: 10px;
    padding: 18px;
    font-size: 1.08rem;
    color: #333;
    margin: 0;
    white-space: pre-wrap;
    word-break: break-all;
}

.comment-card {
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 2px 16px rgba(110,18,126,0.10);
    padding: 28px 24px 18px 24px;
    margin-bottom: 32px;
}
.comments-title {
    color: #6e127e;
    font-size: 1.25rem;
    font-weight: 700;
    margin-bottom: 18px;
}
.article_comments_wrap {
    margin-bottom: 18px;
    display: flex;
    align-items: flex-start;
}
.article_comments_thumb img {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    object-fit: cover;
    margin-right: 16px;
    box-shadow: 0 1px 4px rgba(110,18,126,0.08);
}
.comment-details {
    background: #faf7fb;
    border-radius: 10px;
    padding: 12px 18px;
    flex: 1;
}
.author-name {
    font-size: 1.08rem;
    font-weight: 700;
    color: #6e127e;
    margin-bottom: 2px;
}
.comment-date {
    color: #888;
    font-size: 0.98rem;
    margin-bottom: 6px;
}
.comment-text {
    color: #333;
    font-size: 1.05rem;
}
.reply-title {
    color: #6e127e;
    font-size: 1.15rem;
    font-weight: 700;
    margin-bottom: 12px;
}
.comment-box {
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 2px 16px rgba(110,18,126,0.10);
    padding: 28px 24px 18px 24px;
    margin-bottom: 32px;
}
.form-control {
    border-radius: 10px;
    border: 1px solid #e0e0e0;
    font-size: 1rem;
    padding: 10px 12px;
}
.btn.search-btn.bg-2 {
    background: #6e127e !important;
    border-radius: 12px;
    color: #fff !important;
    font-weight: 600;
    padding: 10px 36px;
    font-size: 1.1rem;
    box-shadow: 0 2px 8px rgba(110,18,126,0.10);
    border: none;
    transition: background 0.2s, box-shadow 0.2s;
}
.btn.search-btn.bg-2:hover {
    background: #4d0e5e !important;
    box-shadow: 0 4px 16px rgba(110,18,126,0.18);
}
@media (max-width: 991px) {
    .post-card, .comment-card, .comment-box { padding: 14px 6px 10px 6px; }
}
</style>

<!-- ============================ Page Title Start================================== -->
<div class="page-title" style="background:#f4f4f4 url(/assets/img/usm1.jpeg);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">

                <div class="breadcrumbs-wrap">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page"style="color: #fff !important;">Post details</li>
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

            <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="post-card">
                    <div class="article_top_info">
                        <ul class="article_middle_info">
                            <li><a href="#"><span class="icons"><i class="ti-user"></i></span>${post.user.userDisplayName}</a></li>
                            <li><a href="#"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${post.createTime}"/></a></li>
                        </ul>
                    </div>
                    <h2 class="post-title">${post.title}</h2>
                    <div class="post-content-area">
                        ${post.content}
                    </div>
                </div>
            </div>
        </div>
        <!-- /row -->

        <div class="comment-card">
            <div class="comment-area">
                <div class="all-comments">
                    <h3 class="comments-title">${commentList.size()} comments</h3>
                    <div class="comment-list">
                        <ul>
                            <c:forEach items="${commentList}" var="c">
                                <li class="article_comments_wrap">
                                    <article id="comment-${c.id}">
                                        <div class="article_comments_thumb">
                                            <img src="${c.user.userAvatar}" alt="">
                                        </div>
                                        <div class="comment-details">
                                            <div class="comment-meta">
                                                <div class="comment-left-meta">
                                                    <h4 class="author-name">${c.user.userDisplayName}<span class="selected"></span></h4>
                                                    <div class="comment-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${c.createTime}"/></div>
                                                </div>
                                            </div>
                                            <div class="comment-text">
                                                <p>${c.content}</p>
                                            </div>
                                        </div>
                                    </article>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="comment-box submit-form" style="margin-top: 50px;">
                    <h3 class="reply-title">Leave a comment</h3>
                    <div class="comment-form">
                        <form action="#" id="commentForm">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <input type="hidden" name="postId" value="${post.id}">
                                        <textarea name="content" class="form-control" cols="30" rows="6" placeholder="Leave a comment here~"></textarea>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <a href="#" class="btn search-btn bg-2" onclick="submitComment()">Submit</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<!-- ============================ Agency List End ================================== -->


<%@ include file="../common/footer.jsp" %>


</body>
</html>
