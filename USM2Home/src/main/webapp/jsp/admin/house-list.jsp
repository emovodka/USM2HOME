<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Property management
            <a href="/admin/house/publish" class="btn btn-success btn-xs bg-2 btn-sm">Publish Property</a>
        </h1>
    </section>
    <!-- tab选项卡 -->
    <section class="content container-fluid">
        <div class="row" style="background: #ffffff;margin: 5px;">
            <div class="col-md-12" style="padding:5px 0;">
                <div class="dashboard-wraper">

                    <div style="margin-bottom: 10px;padding: 5px;">
                        <form class="form-inline" action="/admin/house">
                            <div class="form-group">
                                <input type="text" class="form-control" id="keywords" name="keywords"
                                       value="${keywords}" placeholder="enter key words">
                            </div>
                            <div class="form-group">
                                <%-- 状态: 0已租出，1未租出，,-1已下架,-2待审核，-3审核驳回 --%>
                                <select class="form-control" name="status">
                                    <option
                                            <c:if test="${status == ''}">selected</c:if> value="">Select a Property Statu
                                    </option>
                                    <option
                                            <c:if test="${status == '1'}">selected</c:if> value="1">Not Rented
                                    </option>
                                    <option
                                            <c:if test="${status == '0'}">selected</c:if> value="0">Rented
                                    </option>
                                    <option
                                            <c:if test="${status == '-1'}">selected</c:if> value="-1">Not available
                                    </option>
                                    <option
                                            <c:if test="${status == '-2'}">selected</c:if> value="-2">Pending
                                    </option>
                                    <option
                                            <c:if test="${status == '-3'}">selected</c:if> value="-3">Rejected
                                    </option>
                                </select>

                            </div>
                            <button type="submit" class="btn btn-primary"><i
                                    class="fa fa-search"></i> Search
                            </button>
                        </form>

                    </div>

                    <table class="table table-bordered table-hover">

                        <tbody>
                        <tr>
                            <th class="col-md-6">Title</th>
                            <th>Landlord</th>
                            <th>Status</th>
                            <th>Operation</th>
                        </tr>

                        <c:forEach items="${pageInfo.records}" var="c">
                            <tr>
                                <td class="dashboard_propert_wrapper">
                                    <img src="${c.thumbnailUrl}" alt="">
                                    <div class="title">
                                        <span style="font-weight: bold;color: #0ac1a7"><a href="/house/detail/${c.id}"
                                                                                          target="_blank">${c.title}</a></span>
                                        <br>
                                        <small><a href="/house/detail/${c.id}" target="_blank">${c.address}</a></small>
                                        <br>
                                        Property Type：
                                        <c:choose>
                                            <c:when test="${c.rentType == 'whole'}">Whole Property</c:when>
                                            <c:when test="${c.rentType == 'share'}">Share Property</c:when>
                                        </c:choose>
                                        <br>
                                        Rent fee：${c.monthRent} RM/Monthly <br>
                                    </div>
                                </td>

                                <td>
                                        ${c.ownerUser.userDisplayName}
                                    <c:if test="${sessionScope.user.role != 'owner'}">
                                        <a class="btn btn-success btn-xs" target="_blank"
                                           href="/message?uid=${c.ownerUser.id}">Send Message</a>
                                    </c:if>
                                </td>

                                <td>
                                    <c:choose>
                                        <c:when test="${c.status == 1}">
                                            <span class="dashboard_pr_status">Not Rented</span>
                                        </c:when>
                                        <c:when test="${c.status == 0}">
                                            <span class="dashboard_pr_status published">Rented</span>
                                        </c:when>
                                        <c:when test="${c.status == -1}">
                                            <span class="dashboard_pr_status expire">Not Available</span>
                                        </c:when>
                                        <c:when test="${c.status == -2}">
                                            <span class="dashboard_pr_status expire">Pending</span>
                                        </c:when>
                                        <c:when test="${c.status == -3}">
                                            <span class="dashboard_pr_status expire">Rejected</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="dashboard_pr_status ">Unknown Status</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="/house/detail/${c.id}" data-toggle="tooltip" class="btn btn-xs btn-primary"
                                       title="查看">Check details</a>

                                        <%--   已租出的房子无法修改信息     --%>
                                    <c:if test="${c.status != 0}">
                                        <a href="/admin/house/publish?id=${c.id}" class="btn btn-xs btn-info"
                                           data-toggle="tooltip"
                                           title="编辑">Edit</a>
                                    </c:if>

                                    <c:choose>
                                        <c:when test="${c.status == 1}">
                                            <a href="javascript:void(0)" class="btn btn-xs btn-warning"
                                               onclick="downHouse(${c.id})"
                                               data-toggle="tooltip" title="下架">No longer sold</a>
                                        </c:when>
                                        <c:when test="${c.status == -1}">
                                            <a href="javascript:void(0)" onclick="upHouse(${c.id})"
                                               data-toggle="tooltip" title="上架" class="btn btn-xs btn-success"
                                               data-original-title="Running">launched</a>
                                        </c:when>
                                    </c:choose>
                                    <a href="javascript:void(0)" class="btn btn-xs btn-danger"
                                       onclick="deleteHouse(${c.id})"
                                       data-toggle="tooltip" title="删除">Delete</a>

                                    <c:if test="${isAdmin && c.status == -2}">
                                        <a href="javascript:void(0)" class="btn btn-xs btn-success"
                                           onclick="checkPassHouse(${c.id})"
                                           data-toggle="tooltip" title="审核通过">Approved</a>
                                        <a href="javascript:void(0)" class="btn btn-xs btn-danger"
                                           onclick="checkRejectHouse(${c.id})"
                                           data-toggle="tooltip" title="审核驳回">Rejected</a>
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
                1:After the landlord releases the listing information, it needs to wait for the administrator to review and approve before it will be displayed in the front desk<br>
                2:Unrented housing can be shelved, has been shelved can be re-shelved<br>
                3:For audited listings, the administrator can be audited, audited by the state of the listing is not rented; audit rejected the state of the audit is rejected, the need for landlords to re-edit the listing information<br>
                4:The information of the rented properties cannot be edited.<br>
            </p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>
