<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            新闻资讯管理
            <a href="/admin/news/publish" class="btn btn-success btn-xs bg-2 btn-sm">发布新闻</a>
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
                            <th>标题</th>
                            <th>时间</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${pageInfo.records}" var="c">
                            <tr>
                                <td>${c.title}</td>
                                <td>
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${c.createTime}"/>
                                </td>
                                <td class="action">
                                    <a href="/admin/news/publish?id=${c.id}" class="btn btn-primary btn-xs">Edit</a>
                                    <a href="javascript:void(0)" class="btn btn-xs btn-danger"
                                       onclick="deleteNews(${c.id})">Delete</a>
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
            <p style="color: red">提示： <br>
                1、新闻资讯只有管理员可以操作，管理员可以在这里发布行业信息和租房平台公告内容 <br>
            </p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>



