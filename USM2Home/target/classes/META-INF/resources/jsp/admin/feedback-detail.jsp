<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Maintenance management
            <small></small>
        </h1>
    </section>
    <!-- tab选项卡 -->
    <section class="content container-fluid">
        <div class="row" style="background: #ffffff;margin: 5px;">
            <div class="col-md-12" style="padding:5px 0;">
                <div class="dashboard-wraper">
                    <form action="" id="form">
                        <div class="form-row">
                            
                            <div class="form-group col-md-12">
                                <label><strong style="color: black">Feedback provider</strong></label>
                                <p>${feedback.user.userDisplayName}</p>

                                <c:if test="${sessionScope.user.id != feedback.user.id}">
                                    <a class="btn btn-success btn-xs" target="_blank"
                                       href="/message?uid=${feedback.user.id}">Send message</a>
                                </c:if>

                            </div>
                       
                            <div class="form-group col-md-12">
                                <label><strong style="color: black">Feedback title</strong></label>
                                <p>${feedback.title}</p>
                            </div>


                            <div class="form-group col-md-12">
                                <label><strong style="color: black">Feedback content</strong></label>
                                <p>${feedback.content}</p>
                            </div>


                            <div class="form-group col-md-12">
                                <label><strong style="color: black">Reply</strong></label>
                                <p>${feedback.reply}</p>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-12 col-md-12">
                                    <a class="btn btn-xs btn-success" href="/admin/feedback">Return</a>
                                </div>
                            </div>

                        </div>
                    </form>

                </div>


            </div>
        </div>

    </section>
</div>

<%@ include file="module/_footer.jsp" %>

