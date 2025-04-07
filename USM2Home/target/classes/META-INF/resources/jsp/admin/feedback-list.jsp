


                        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
                        <%@ include file="module/_header.jsp" %>


                        <div class="content-wrapper">
                            <section class="content-header">
                                <h1>
                                    Feedback management
                                    <a href="/admin/feedback/publish" class="btn btn-success btn-xs bg-2 btn-sm">Post Feedback</a>
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
                                                    <th class="col-md-2">Feedback provider</th>
                                                    <th class="col-md-4">Feedback title</th>
                                                    <th class="col-md-2">Status</th>
                                                    <th class="col-md-2">Time</th>
                                                    <th class="col-md-2">Operation</th>
                                                </tr>

                                                <c:forEach items="${pageInfo.records}" var="c">
                                                    <tr>

                                                        <td >${c.user.userDisplayName}</td>
                                                        <td>
                                                            <a href="/admin/feedback/detail/${c.id}" target="_blank">${c.title}</a>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${c.status == 0}">
                                                                    <span class="text-danger">Pending</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="text-success">Processed</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${c.createTime}"/>
                                                        </td>

                                                        <td class="action">
                                                            <a href="/admin/feedback/detail/${c.id}" class="btn btn-primary btn-xs">Check</a>
                                                            <c:if test="${isAdmin}">
                                                                <a href="javascript:void(0)" class="btn btn-xs btn-success" data-toggle="modal"
                                                                   data-target="#reply" onclick="showReplyModal(${c.id})">Reply Feedback</a>
                                                            </c:if>
                                                            <a href="javascript:void(0)" class="btn btn-xs btn-danger" onclick="deleteFeedback(${c.id})">Delete Feedback</a>
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
                                        1:The administrator can see all the rent articles <br>
                                        2:Tenants can see the articles they have posted asking for rent <br>
                                    </p>
                                </div>
                            </section>
                        </div>


                        <!-- Sign Up Modal -->
                        <div class="modal fade" id="reply" tabindex="-1" role="dialog" aria-labelledby="sign-up" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
                                <header class="modal_content_header">
                                    <div class="hm_nav">
                                        <h3 class="hm_nav_title">Reply Feedback</h3>
                                        <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
                                    </div>
                                </header>
                                <div class="modal-content" id="sign-up">
                                    <div class="modal-body">
                                        <div class="login-form">
                                            <form id="feedbackForm">
                                                <div class="row">

                                                    <input type="hidden" name="id" id="feedbackId">
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="form-group">
                                                            <label>Reply Content</label>
                                                            <div class="input-with-icon">
                                        <textarea class="form-control" name="reply"
                                                  style="padding-left: 15px!important;"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="form-group">
                                                            <label>Status</label>
                                                            <div class="simple-input">
                                                                <select name="status" class="form-control">
                                                                    <option value="1">Processed</option>
                                                                    <option value="0">Pending</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <button type="button" onclick="feedbackReplySubmit()"
                                                            class="btn btn-success full-width pop-login bg-2">Submit Reply 
                                                    </button>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Modal -->


                        <%@ include file="module/_footer.jsp" %>



