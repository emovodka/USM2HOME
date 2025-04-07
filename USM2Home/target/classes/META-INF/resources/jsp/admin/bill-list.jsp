<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Bill management
            <small></small>
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
                            <th class="col-2">Bill name</th>
                            <th class="col-1">Bill Amount</th>
                            <th class="col-1">Tenant</th>
                            <th class="col-1">Landlord</th>
                            <th class="col-2">Property Information</th>
                            <th class="col-2">Time</th>
                            <th class="col-1">Status</th>
                            <th class="col-2">Operation</th>
                        </tr>
                        <c:forEach items="${pageInfo.records}" var="c">
                            <tr>
                                <td>${c.title}</td>
                                <td>${c.totalAmount}</td>
                                <td>${c.customerUser.userDisplayName}</td>
                                <td>${c.ownerUser.userDisplayName}</td>
                                <td>
                                    <a href="/house/detail/${c.houseId}" target="_blank">${c.house.title}</a>
                                </td>

                                <td>
                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${c.createTime}"/>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${c.status == 0}">
                                            <span class="text-danger">Waiting for payment</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-success">Paid</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="action">
                                    <c:if test="${isCustomer && c.status == 0}">
                                        <a href="/admin/bill/pay?billId=${c.id}" class="btn btn-xs btn-success">Pay</a>
                                    </c:if>
                                    <c:if test="${!isCustomer}">
                                        <a href="javascript:void(0)" class="btn btn-danger btn-xs"
                                           onclick="deleteBill(${c.id})">Delete</a>
                                    </c:if>
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
            <p style="color: red">Attention： <br>
                1:The tenant's bill is created by the landlord in the order management page. <br>
                2:Tenants need to pay all bills before surrendering the rent <br>
            </p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>
