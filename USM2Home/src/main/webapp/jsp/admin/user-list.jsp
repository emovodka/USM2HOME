<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            User Management
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
                            <th>Account</th>
                            <th>Name</th>
                            <th>ID Number</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Operation</th>
                        </tr>
                        <c:forEach items="${pageInfo.records}" var="c">
                            <tr>
                                <td>${c.userName}</td>
                                <td>${c.userDisplayName}</td>
                                <td>${c.idCard}</td>
                                <td>${c.phone}</td>
                                <td>${c.email}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${c.status == 0}">
                                            <span class="text-success">Enable</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-danger">Disable</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="action">
                                    <a href="/admin/user/info?id=${c.id}" class="btn btn-xs btn-primary"
                                       >View</a>

                                    <c:if test="${sessionScope.user.id != c.id}">
                                        <a href="/message?uid=${c.id}" class="btn btn-xs btn-success"
                                          >Message</a>
                                    </c:if>
                                    <c:choose>
                                        <c:when test="${c.status == 0}">
                                            <a href="javascript:void(0)" class="btn btn-xs btn-warning"
                                               onclick="disableUser(${c.id})">Disable</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="javascript:void(0)" class="btn btn-xs btn-info"
                                               onclick="enableUser(${c.id})">Enable</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="javascript:void(0)" class="btn btn-xs btn-danger"
                                       onclick="deleteUser(${c.id})">Delete</a>
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
            <p style="color: red">Attention: <br>
                1、User management includes user deletion, disable, enable, view details, private message, etc. <br>
                2、Only the administrator has user management functions <br>
            </p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>



