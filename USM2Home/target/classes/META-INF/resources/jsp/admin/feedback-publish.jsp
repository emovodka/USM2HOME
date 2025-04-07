<%@ include file="../common/footer.jsp" %>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Publish feedback
        </h1>
    </section>
    <!-- tab选项卡 -->
    <section class="content container-fluid">
        <div class="row" style="background: #ffffff;margin: 5px;">
            <div class="col-md-12" style="padding:5px 0;">
                <div class="dashboard-wraper">

                    <form action="" id="postForm">
                        <div class="form-row">

                            <input type="hidden" name="id" value="${feedback.id}">
                            <div class="form-group col-md-12">
                                <label>Feedback Title</label>
                                <input type="text" name="title" value="${feedback.title}"
                                       class="form-control">
                            </div>


                            <div class="form-group col-md-12">
                                <label>Feedback Content</label>
                                <textarea class="form-control h-240" name="content"
                                          style="min-height: 300px;">${feedback.content}</textarea>
                            </div>


                            <div class="form-group">
                                <div class="col-lg-12 col-md-12">
                                    <button class="btn btn-success bg-2" type="button"
                                            onclick="submitFeedback()">Post
                                    </button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>


            </div>
        </div>
        <div style="padding: 10px">
            <p style="color: red">Attention： <br>
                1:Both tenants and landlords can post feedback, administrator will deal with it <br>
            </p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>



