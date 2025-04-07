<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Favorite Properties
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
                            <th class="col-md-6">Property Information</th>
                            <th class="col-md-6">Operation</th>
                        </tr>

                        <c:forEach items="${pageInfo.records}" var="c">
                            <tr>
                                <td class="dashboard_propert_wrapper">
                                    <img src="${c.house.thumbnailUrl}" alt="">
                                    <div class="title">
                                        <h4><a href="/house/detail/${c.houseId}" target="_blank">${c.house.title}</a></h4>
                                        <span>${c.house.address}</span>
                                        <span class="table-property-price">¥${c.house.monthRent} / 月</span>
                                    </div>
                                </td>
                                <td class="action">
                                    <a href="javascript:void(0)" class="btn btn-danger btn-xs" onclick="cancelMark(${c.id})"><i class="ti-close"></i>Unsave</a>
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
                1:Save to Favorite button is in the upper right corner of the house details page <br>

            </p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>



