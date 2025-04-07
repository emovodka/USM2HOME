


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Comment management
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
                            <th  style="width: 10%;">User</th>
                            <th>Title</th>
                            <th>Content</th>
                            <th>Time</th>
                            <th>Operation</th>
                        </tr>
                        <c:forEach items="${pageInfo.records}" var="c">
                            <tr>
                                <td >${c.user.userDisplayName}</td>
                                <td>
                                    <a href="/post/detail/${c.postId}" target="_blank" >${c.post.title}</a>
                                </td>
                                <td>
                                        ${c.content}
                                </td>
                                <td>
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${c.createTime}"/>
                                </td>
                                <td class="action">
                                    <a href="/post/detail/${c.postId}#comment-${c.id}" class="btn btn-primary btn-xs">查看</a>
                                    <a href="javascript:void(0)" class="btn btn-xs btn-danger" onclick="deleteComment(${c.id})">删除</a>
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
                1:Administrator can see all the messages of the articles for rent <br>
                2:Tenants can see the message they created and all the messages of their own articles for rent <br>
                3:The landlord can see their own message creation<br>
            </p>
        </div>
    </section>
</div>



<%@ include file="module/_footer.jsp" %>






