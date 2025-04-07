<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Order Management
            <small></small>
        </h1>
    </section>
    <!-- tab选项卡 -->
    <section class="content container-fluid">
        <div class="row" style="background: #ffffff;margin: 5px;">
            <div class="col-md-12" style="padding:5px 0;">
                <div class="dashboard-wraper">

                    <div style="margin-bottom: 10px;padding: 5px;">

                        <form class="form-inline" action="/admin/order">
                            <div class="form-group" style="margin-right: 5px;">
                                <%--                                    -2待签合同，-1待付款，0生效中，1已到期，-3已取消，2申请退租，3申请退租不通过--%>
                                <select class="form-control" name="status">
                                    <option <c:if test="${status == ''}">selected</c:if> value="">Choose Status:</option>
                                    <option <c:if test="${status == '-2'}">selected</c:if> value="-2">Pending Contract</option>
                                    <option <c:if test="${status == '-1'}">selected</c:if> value="-1">Pending Payment</option>
                                    <option <c:if test="${status == '0'}">selected</c:if> value="0">Contract Effective</option>
                                    <option <c:if test="${status == '1'}">selected</c:if> value="1">Rented Out</option>
                                    <option <c:if test="${status == '-3'}">selected</c:if> value="-3">Order Cancelled</option>
                                    <option <c:if test="${status == '2'}">selected</c:if> value="2">Applied for Rent Out</option>
                                    <option <c:if test="${status == '3'}">selected</c:if> value="3">Rent Out Rejected</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary" ><i class="fa fa-search"></i> Search</button>
                        </form>

                    </div>
                    <table class="table table-bordered table-hover">

                        <tbody>
                        <tr>
                            <th><i class="fa fa-file-text"></i> Order List</th>

                            <c:if test="${sessionScope.user.role != 'customer'}">
                                <th>Tenant</th>
                            </c:if>
                            <c:if test="${sessionScope.user.role != 'owner'}">
                                <th>Landlord</th>
                            </c:if>

                            <th>Operation</th>
                        </tr>

                        <c:forEach items="${pageInfo.records}" var="c">
                            <tr>
                                <td class="dashboard_propert_wrapper">
                                    <img src="${c.house.thumbnailUrl}" alt="">
                                    <div class="title">
                                        <span style="font-weight: bold;color: #0ac1a7"><a href="/house/detail/${c.houseId}" target="_blank">${c.house.title}</a></span>
                                        <br>
                                        <span>${c.house.address}</span> <br>
                                        <span class="table-property-price">Start Date:
                                                <fmt:formatDate pattern="yyyy-MM-dd" value="${c.startDate}"/> &nbsp;
                                                End Date: <span style="color: red;font-weight: bold"><fmt:formatDate pattern="yyyy-MM-dd" value="${c.endDate}"/></span>
                                            </span>
                                        <br>
                                        <span class="table-property-price">Total Amount: RM ${c.totalAmount}</span>
                                            <%--                                            订单状态：-2待签合同，-1待付款，0生效中，1已到期，-3已取消，2申请退租，3申请退租不通过--%>
                                        <c:choose>
                                            <c:when test="${c.status == -2}"> <span
                                                    class="text-warning"> Pending Contract </span></c:when>
                                            <c:when test="${c.status == -1}"> <span
                                                    class="text-warning"> Pending Payment </span></c:when>
                                            <c:when test="${c.status == 0}"> <span
                                                    class="text-success"> Contract Effective </span></c:when>
                                            <c:when test="${c.status == 1}"> <span
                                                    class="text-danger"> Rented Out </span></c:when>
                                            <c:when test="${c.status == -3}"> <span
                                                    class="text-warning"> Order Cancelled </span></c:when>
                                            <c:when test="${c.status == 2}"> <span
                                                    class="text-warning"> Applied for Rent Out </span></c:when>
                                            <c:when test="${c.status == 3}"> <span
                                                    class="text-warning"> Rent Out Rejected </span></c:when>
                                        </c:choose>

                                    </div>
                                </td>
                                <c:if test="${sessionScope.user.role != 'customer'}">
                                    <td>
                                            ${c.customerUser.userDisplayName}<br/>${c.customerUser.phone}
                                        <br>
                                        <a class="btn btn-success btn-xs" target="_blank" href="/message?uid=${c.customerUser.id}">Message</a>
                                    </td>
                                </c:if>
                                <c:if test="${sessionScope.user.role != 'owner'}">
                                    <td>
                                            ${c.ownerUser.userDisplayName}<br/>${c.ownerUser.phone} <br>
                                        <a class="btn btn-success btn-xs" target="_blank" href="/message?uid=${c.ownerUser.id}">Message</a>
                                    </td>
                                </c:if>
                                <td>
                                    <a class="btn btn-xs btn-primary" href="/order/agreement/view?orderId=${c.id}" target="_blank">View Contract</a>
                                    <br>

                                    <c:if test="${(c.status == -2 || c.status == -1)&& sessionScope.user.role == 'customer'}">
                                        <a class="btn btn-xs btn-danger" href="javascript:void(0)"
                                           onclick="cancelOrder(${c.id})">Cancel Order</a>
                                    </c:if>
                                    <c:if test="${(c.status   == 0 || c.status == 3) && sessionScope.user.role == 'customer'}">
                                        <a class="btn btn-xs btn-danger" href="javascript:void(0)"
                                           onclick="endOrder(${c.id})">Apply for Rent Out</a>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role == 'owner' && c.status == 2}">
                                        <a class="btn btn-xs btn-primary" href="javascript:void(0)" onclick="endOrderPass(${c.id})">Rent Out Approved</a>
                                        <a class="btn btn-xs btn-primary" href="javascript:void(0)" onclick="endOrderReject(${c.id})">Rent Out Rejected</a>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role == 'owner' && (c.status == 0 || c.status == 2 || c.status == 3)}">
                                        <a class="btn btn-xs btn-info" href="/admin/bill/publish?orderId=${c.id}">Create Electricity and Water Bill</a>
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
            <p style="color: red">Attention: <br>
                1、Order List page, the administrator can view all orders, the tenant can only view their own orders, the landlord can view their own orders <br>
                2、Tenant can cancel orders, apply for rent out; Landlord can approve or reject rent out applications, create electricity and water bills for orders <br>
                3、Tenant needs to settle and pay all bills before renting out <br>
                4、Administrators have access to view all orders
            </p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>
