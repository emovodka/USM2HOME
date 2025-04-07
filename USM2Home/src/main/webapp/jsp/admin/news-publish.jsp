
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
            发布新闻资讯
        </h1>
    </section>
    <!-- tab选项卡 -->
    <section class="content container-fluid">
        <div class="row" style="background: #ffffff;margin: 5px;">
            <div class="col-md-12" style="padding:5px 0;">
                <div class="dashboard-wraper">

                    <form action="" id="newsForm">
                        <div class="form-row">

                            <input type="hidden" name="id" value="${news.id}">
                            <div class="form-group col-md-12">
                                <label>新闻标题</label>
                                <input type="text" name="title" value="${news.title}"
                                       class="form-control">
                            </div>


                            <div class="form-group col-md-12">
                                <label>新闻内容</label>
                                <textarea class="form-control h-240" name="content"
                                          style="min-height: 300px;">${news.content}</textarea>
                            </div>


                            <div class="form-group">
                                <div class="col-lg-12 col-md-12">
                                    <button class="btn btn-success bg-2" type="button"
                                            onclick="submitNews()">发布
                                    </button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>


            </div>
        </div>
        <div style="padding: 10px">

        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>




