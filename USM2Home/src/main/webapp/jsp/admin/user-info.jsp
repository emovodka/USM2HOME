<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            User Information
            <small></small>
        </h1>
    </section>
    <!-- tab选项卡 -->
    <section class="content container-fluid">
        <div class="row" style="background: #ffffff;margin: 5px;">
            <div class="col-md-12" style="padding:5px 0;">
                <form action="" id="profileForm">
                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label>Account</label>
                            ${user.userName}

                        </div>

                        <div class="form-group col-md-6">
                            <label>Name</label>
                            ${user.userDisplayName}
                        </div>

                        <div class="form-group col-md-6">
                            <label>Email</label>
                            ${user.email}
                        </div>

                        <div class="form-group col-md-6">
                            <label>Phone</label>
                            ${user.phone}
                        </div>

                        <div class="form-group col-md-6">
                            <label>ID Number</label>
                            ${user.idCard}
                        </div>

                        <div class="form-group col-md-6">
                            <label>Gender</label>
                            ${user.sex}
                        </div>

                        <div class="form-group col-md-6">
                            <label>School</label>
                            ${user.job}
                        </div>

                        <div class="form-group col-md-6">
                            <label>Hobby</label>
                            ${user.hobby}
                        </div>

                        <div class="form-group col-md-12">
                            <label>Personal Description</label>
                            ${user.userDesc}
                        </div>

                        <div class="form-group col-md-6">
                            <label>ID image</label>

                            <img src="${user.idCardImg}" id="imgUrl" style="height: 100px;" alt="">
                        </div>

                    </div>

                    <div class="form-group">
                        <div class="col-lg-12 col-md-12">
                            <a class="btn btn-xs btn-success" href="javascript:history.go(-1)">Back</a>
                        </div>
                    </div>
                </form>
            </div>

        </div>
        <div style="padding: 10px">
            <p style="color: red">View any user information page, only the administrator can view it</p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>
