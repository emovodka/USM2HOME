<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Change password
            <small></small>
        </h1>
    </section>
    <!-- tab选项卡 -->
    <section class="content container-fluid">
        <div class="row" style="background: #ffffff;margin: 5px;">
            <div class="col-md-12" style="padding:5px 0;" >
                <form action="" id="passwordForm">
                    <div class="form-row">

                        <div class="col-md-6 no-padding">
                            <div class="form-group col-md-12">
                                <label>Password</label>
                                <input type="password" class="form-control" name="oldPassword">
                            </div>

                            <div class="form-group col-md-12">
                                <label>New password</label>
                                <input type="password" class="form-control" name="newPassword">
                            </div>

                            <div class="form-group col-md-12">
                                <label>Comfirm new password</label>
                                <input type="password" class="form-control" name="confirmPassword">
                            </div>


                            <div class="form-group col-lg-12 col-md-12">
                                <button class="btn btn-success bg-2" type="button"
                                        onclick="submitPassword()">
                                    Renew password
                                </button>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
        <div style="padding: 10px">
            <p style="color: red">Attention:Password length 6-20 digits</p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>

