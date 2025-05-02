<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="module/_header.jsp" %>

<div class="content-wrapper">
    <section class="content-header">
        <h1>Feedback Survey Dashboard</h1>
    </section>
    <section class="content container-fluid">
        <div class="row" style="margin: 5px;">
            <div class="col-md-12" style="padding:20px;">
                <div class="panel panel-info">
                    <div class="panel-heading"><b>Survey Statistics</b></div>
                    <div class="panel-body">
                        <p>Total submissions: <b>${total}</b></p>
                        <table class="table table-bordered">
                            <tr>
                                <th>Question</th>
                                <th>Average Score</th>
                            </tr>
                            <tr><td>1. UI clear and easy to use</td><td>${avg[0]}</td></tr>
                            <tr><td>2. Search/filter easy to use</td><td>${avg[1]}</td></tr>
                            <tr><td>3. Info real/accurate</td><td>${avg[2]}</td></tr>
                            <tr><td>4. Contact valid</td><td>${avg[3]}</td></tr>
                            <tr><td>5. Pictures/desc clear</td><td>${avg[4]}</td></tr>
                            <tr><td>6. Found suitable property</td><td>${avg[5]}</td></tr>
                            <tr><td>7. Favorite/contact easy</td><td>${avg[6]}</td></tr>
                            <tr><td>8. Rental process smooth</td><td>${avg[7]}</td></tr>
                            <tr><td>9. Overall satisfaction</td><td>${avg[8]}</td></tr>
                            <tr><td>10. Would recommend</td><td>${avg[9]}</td></tr>
                            <tr><td>11. Bugs encountered</td><td>${avg[10]}</td></tr>
                        </table>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading"><b>Suggestions & Comments</b></div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <tr>
                                <th>User ID</th>
                                <th>Suggestion</th>
                                <th>Time</th>
                            </tr>
                            <c:forEach items="${surveyList}" var="s">
                                <c:if test="${not empty s.suggestion}">
                                    <tr>
                                        <td>${s.userId}</td>
                                        <td>${s.suggestion}</td>
                                        <td><fmt:formatDate value="${s.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="module/_footer.jsp" %>
