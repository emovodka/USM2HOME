
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ Page Title Start================================== -->
<div class="page-title" style="background:#f4f4f4 url(/assets/img/inner-banner.jpg);" data-overlay="5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">

                <div class="breadcrumbs-wrap">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">Post details</li>
                    </ol>
                    <h2 class="breadcrumb-title">Post to find a rental</h2>
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
                <div class="article_detail_wrapss single_article_wrap format-standard">
                    <div class="article_body_wrap">

                        <div class="article_top_info">
                            <ul class="article_middle_info">
                                <li><a href="#"><span class="icons"><i
                                        class="ti-user"></i></span>${post.user.userDisplayName}</a>
                                </li>
                                <li><a href="#">
                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${post.createTime}"/>
                                </a>
                                </li>
                            </ul>
                        </div>
                        <h4 class="post-title">${post.title}</h4>
                        <div style="white-space: pre;">
                            <pre>${post.content}</pre>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <!-- /row -->

        <div class="article_detail_wrapss single_article_wrap format-standard">

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
                                                    <h4 class="author-name">${c.user.userDisplayName}<span
                                                            class="selected"></span></h4>
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
                                        <textarea name="content" class="form-control" cols="30" rows="6"
                                                  placeholder="Leave a comment here~"></textarea>
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
