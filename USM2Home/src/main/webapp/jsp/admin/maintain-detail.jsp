<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Maintance Management
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

                            <input type="hidden" name="id" value="${maintain.id}">
                            <input type="hidden" id="key" name="key">
                            <input type="hidden" name="houseId" value="${maintain.houseId}">
                            <div class="form-group col-md-12">
                                <label><strong style="color: black">Person who report</strong></label>
                                <p>${maintain.user.userDisplayName}</p>

                                <c:if test="${sessionScope.user.role != 'customer'}">
                                    <a class="btn btn-success btn-xs" target="_blank"
                                       href="/message?uid=${c.ownerUser.id}">Send Message</a>
                                </c:if>

                            </div>
                            <div class="form-group col-md-12">
                                <label><strong style="color: black">Property Info</strong></label>
                                <p><a href="/house/detail/${maintain.houseId}">${maintain.house.title}</a></p>
                            </div>

                            <div class="form-group col-md-12">
                                <label><strong style="color: black">Title</strong></label>
                                <p>${maintain.title}</p>
                            </div>


                            <div class="form-group col-md-12">
                                <label><strong style="color: black">Content</strong></label>
                                <p>${maintain.content}</p>
                            </div>

                            <div class="form-group col-md-12">
                                <label><strong style="color: black">Image</strong></label>
                                <p>
                                    <c:forEach items="${maintain.imgUrlList}" var="img">
                                        <img src="${img}" alt="" class="col-md-3 pull-left" style="padding: 5px;">
                                    </c:forEach>
                                </p>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-12 col-md-12">
                                    <a class="btn btn-xs btn-success" href="/admin/maintain">Back</a>
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

