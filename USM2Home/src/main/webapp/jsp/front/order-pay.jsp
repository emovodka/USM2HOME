<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>
<link rel="stylesheet" href="/assets/css/pay.css">

<style>
body {
    font-family: 'Inter', 'Roboto', 'Arial', sans-serif;
    background: #f7f7fa;
    color: #222;
}
.mod-ct {
    background: #fff;
    border-radius: 22px;
    box-shadow: 0 4px 24px rgba(110,18,126,0.10);
    padding: 40px 32px 32px 32px;
    margin: 40px auto 32px auto;
    max-width: 420px;
    text-align: center;
}
.order {
    font-size: 1.25rem;
    font-weight: 700;
    color: #6e127e;
    margin-bottom: 18px;
}
.amount {
    color: #6e127e;
    font-size: 2.5rem;
    font-weight: 900;
    margin-bottom: 18px;
    letter-spacing: 1px;
}
.qrcode-img-area {
    background: #faf7fb;
    border-radius: 16px;
    padding: 18px 0 10px 0;
    box-shadow: 0 2px 8px rgba(110,18,126,0.08);
    display: inline-block;
    margin-bottom: 18px;
}
.tip {
    margin-top: 18px;
    margin-bottom: 10px;
}
.tip-text {
    color: #6e127e;
    font-size: 1.08rem;
    font-weight: 600;
    margin-bottom: 8px;
}
.btn-success {
    background: #6e127e !important;
    border: none;
    color: #fff !important;
    font-weight: 700;
    border-radius: 10px;
    padding: 12px 32px;
    font-size: 1.1rem;
    margin-top: 10px;
    transition: background 0.2s, box-shadow 0.2s, transform 0.2s;
    box-shadow: 0 2px 8px rgba(110,18,126,0.10);
}
.btn-success:hover {
    background: #4d0e5e !important;
    color: #fff !important;
    box-shadow: 0 4px 16px rgba(110,18,126,0.18);
    transform: translateY(-2px) scale(1.01);
}
.time-item h1 {
    font-size: 1.08rem;
    color: #333;
    font-weight: 500;
    margin: 18px 0 10px 0;
}
@media (max-width: 600px) {
    .mod-ct {
        padding: 18px 4px 18px 4px;
        max-width: 98vw;
    }
    .amount {
        font-size: 2rem;
    }
}
.pay-tip-area {
    margin-top: 30px;
    margin-bottom: 20px;
    text-align: center;
}
.pay-redirect-tip {
    color: #888;
    font-size: 1rem;
    letter-spacing: 0.12em;
    margin-bottom: 10px;
    font-weight: 500;
}
.pay-divider {
    border: none;
    border-top: 1px dashed #e0c7ea;
    margin: 18px auto 18px auto;
    width: 80%;
}
.pay-qrcode-tip {
    color: #6e127e;
    font-size: 1.25rem;
    font-weight: 800;
    margin-bottom: 28px;
    margin-top: 10px;
    letter-spacing: 0.01em;
}
.btn-pay-success {
    background: linear-gradient(90deg, #b47ddb 0%, #6e127e 100%);
    color: #fff;
    font-weight: 700;
    font-size: 1.1rem;
    border: none;
    border-radius: 16px;
    padding: 16px 38px;
    margin-top: 10px;
    box-shadow: 0 2px 12px rgba(110,18,126,0.10);
    transition: background 0.2s, box-shadow 0.2s, transform 0.2s;
    cursor: pointer;
    display: inline-block;
}
.btn-pay-success:hover {
    background: linear-gradient(90deg, #6e127e 0%, #4d0e5e 100%);
    box-shadow: 0 4px 24px rgba(110,18,126,0.18);
    transform: translateY(-2px) scale(1.03);
}
</style>

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

                        <div class="pay-tip-area">
                    
                            <hr class="pay-divider"/>
                            <div class="pay-qrcode-tip">Scan Duitnow QR code to pay</div>
                            <button onclick="submitOrderPay(${order.id})" class="btn-pay-success">payment successful</button>
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
