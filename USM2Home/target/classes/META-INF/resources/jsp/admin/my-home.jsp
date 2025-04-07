<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            My Home
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
                            <th class="col-md-6"><i class="fa fa-file-text"></i>Home Infomation</th>
                            <th class="col-md-2">Type</th>
                            <th class="col-md-2">Landlord</th>
                            <th class="col-md-2">Operation</th>
                        </tr>

                        <c:forEach items="${pageInfo.records}" var="c">
                            <tr>
                                <td class="dashboard_propert_wrapper">
                                    <img src="${c.house.thumbnailUrl}" alt="">
                                    <div class="title">
                                        <h4><a href="/house/detail/${c.houseId}"
                                               target="_blank">${c.house.title}</a></h4>
                                        <span>${c.house.address}</span> <br>
                                        <span>Expiry time:<fmt:formatDate pattern="yyyy-MM-dd" value="${c.endDate}"/></span>
                                    </div>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${c.house.rentType == 'share'}">
                                            <span class="text-success">Share rent</span> <br>
                                            <a href="/house/detail/${c.houseId}#shareHouse" target="_blank">Detail</a>

                                        </c:when>
                                        <c:otherwise> <span class="text-blue">Whole rent</span> </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="action">
                                        ${c.ownerUser.userDisplayName} <br/>
                                        ${c.ownerUser.phone} <br/>

                                    <a class="btn btn-success btn-xs" target="_blank"
                                       href="/message?uid=${c.ownerUser.id}">Send message</a>
                                </td>
                                <td style="text-align: left;">
                                    <a href="/admin/maintain/publish?houseId=${c.houseId}"
                                       class="btn btn-primary btn-xs text-primary">Report Maintance</a>
                                </td>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>


            </div>
        </div>
        <div style="padding: 10px">
            <p style="color: red">Attention: This page displays the home information, from the order currently in effect.</p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>



