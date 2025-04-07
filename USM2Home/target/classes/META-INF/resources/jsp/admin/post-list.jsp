<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Rental post management
            <a href="/admin/post/publish" class="btn btn-success btn-xs bg-2 btn-sm">Post a Rental Post</a>
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
                            <th style="width: 10%;">User</th>
                            <th>Title</th>
                            <th style="width: 20%">Time</th>
                            <th style="width: 20%">Operation</th>
                        </tr>
                        <c:forEach items="${pageInfo.records}" var="c">
                            <tr>
                                <td>${c.user.userDisplayName}</td>
                                <td>
                                    <a href="/post/detail/${c.id}" target="_blank">${c.title}</a>
                                </td>
                                <td>
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${c.createTime}"/>
                                </td>
                                <td class="action">
                                    <a href="/admin/post/publish?id=${c.id}" class="btn btn-primary btn-xs">Edit</a>
                                    <a href="javascript:void(0)" class="btn btn-xs btn-danger"
                                       onclick="deletePost(${c.id})">Delete</a>
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
                1、The administrator can see all rental posts <br>
                2、Renters can see their own rental posts <br>
            </p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>



