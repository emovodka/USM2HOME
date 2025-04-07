<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Bill management
        </h1>
    </section>
    <!-- tab选项卡 -->
    <section class="content container-fluid">
        <div class="row" style="background: #ffffff;margin: 5px;">
            <div class="col-md-12" style="padding:5px 0;">
                <div class="dashboard-wraper">

                    <div class="col-md-6 no-padding" >
                        <form action="" id="form">
                            <div class="form-row">

                                <input type="hidden" name="id" value="${bill.id}">
                                <input type="hidden" name="houseId" value="${bill.houseId}">
                                <input type="hidden" name="orderId" value="${bill.orderId}">
                                <input type="hidden" name="customerUserId"
                                       value="${bill.customerUserId}">
                                <input type="hidden" name="ownerUserId" value="${bill.ownerUserId}">

                                <div class="form-group col-md-12">
                                    <label>Fee type</label>
                                    <input type="text" name="title" value="${bill.title}"
                                           class="form-control">
                                </div>
                                <div class="form-group col-md-12">
                                    <label>Amount</label>
                                    <input type="text" name="totalAmount" value="${bill.totalAmount}"
                                           class="form-control">
                                </div>


                                <div class="form-group">
                                    <div class="col-lg-12 col-md-12">
                                        <button class="btn btn-success bg-2" type="button"
                                                onclick="submitBill()">creat
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>


            </div>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>
