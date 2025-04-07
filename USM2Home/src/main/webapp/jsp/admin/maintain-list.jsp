<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Maintance Management
        </h1>
    </section>
    <!-- tab选项卡 -->
    <section class="content container-fluid">
        <div class="row" style="background: #ffffff;margin: 5px;">
            <div class="col-md-12" style="padding:5px 0;">
                <div class="dashboard-wraper">

                    <table class="table table-bordered table-hover">

                        <tbody>
                        <tr>
                            <th style="width: 10%;">Tenant</th>
                            <th>Title</th>
                            <th>Status</th>
                            <th style="width: 20%">Time</th>
                            <th style="width: 20%">Operation</th>
                        </tr>
                        <c:forEach items="${pageInfo.records}" var="c">
                            <tr>
                                <td >${c.user.userDisplayName}</td>
                                <td>
                                    <a href="/admin/maintain/detail/${c.id}" target="_blank">${c.title}</a>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${c.status == 0}">
                                            <span class="text-danger">Pending</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-success">Already Processed</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${c.createTime}"/>
                                </td>
                                <td class="action">
                                    <c:if test="${!isCustomer && c.status == 0}">
                                        <a href="javascript:void(0)" class="btn btn-xs btn-success"
                                           onclick="finishMaintain(${c.id})">Finish Process</a>
                                    </c:if>
                                    <a href="/admin/maintain/detail/${c.id}" class="btn btn-xs btn-primary">Check</a>
                                    <a href="javascript:void(0)" class="btn btn-xs btn-danger"
                                       onclick="deleteMaintain(${c.id})">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <%@ include file="../common/page.jsp" %>
                </div>


            </div>
        </div>
        <div style="padding: 10px">
            <p style="color: red">Attention:<br>
                1: To report the maintenance, the tenant needs to click on the button on "My Properity" page to report the maintenance report. <br>
            </p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>
