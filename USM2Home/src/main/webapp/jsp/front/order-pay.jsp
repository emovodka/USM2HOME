
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>
<link rel="stylesheet" href="/assets/css/pay.css">

<!-- ============================ Agency List Start ================================== -->
<section class="gray-simple">

    <div class="container">

        <!-- row Start -->
        <div class="row">

            <div class="col-lg-12 col-md-12">
                <div>

                    <div class="mod-ct">
                        <div class="order">
                            ${order.house.title}
                        </div>
                        <div class="amount" id="money">
                            RM ${order.house.deposit}
                        </div>
                        <div class="qrcode-img-wrapper" data-role="qrPayImgWrapper">
                            <div data-role="qrPayImg" class="qrcode-img-area">
                                <div class="ui-loading qrcode-loading" data-role="qrPayImgLoading"></div>
                                <div style="position: relative;display: inline-block;">
                                    <img width="200" height="200"
                                         src="/assets/img/alipay_qrcode.png"
                                         title="Please make sure to pay as soon as possible"
                                         style="display: block;margin-top: 20px;">
                                </div>
                            </div>
                        </div>

                        <div class="time-item" style="padding-top: 10px">
                            <div class="time-item" id="msg">
                                <h1>After payment, you will be redirected to the order list page</h1>
                            </div>
                        </div>

                        <div class="tip">
                            <div class="ico-scan-ali"></div>
                            <div class="tip-text">
                                <p id="showtext">Scan Duitnow QR code to pay</p>
                            </div>
                            <div class="tip-text">
                                <button onclick="submitOrderPay(${order.id})" class="btn btn-small btn-success" style="color:#ffffff;" title="Payment successful">payment successful</button>
                            </div>
                        </div>

                        <div class="tip-text">
                        </div>

                    </div>


                </div>

            </div>


        </div>
        <!-- /row -->

    </div>

</section>
<!-- ============================ Agency List End ================================== -->


<%@ include file="../common/footer.jsp" %>
</body>
</html>
