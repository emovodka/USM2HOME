<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>

<style>
body {
    font-family: 'Inter', 'Roboto', 'Arial', sans-serif;
    background: #f7f7fa;
    color: #222;
}
.property_block_wrap.style-2 {
    background: #fff;
    border-radius: 22px;
    box-shadow: 0 4px 24px rgba(110,18,126,0.10);
    padding: 36px 32px 32px 32px;
    margin: 32px 0;
    max-width: 900px;
    margin-left: auto;
    margin-right: auto;
}
#content {
    padding: 10px 0 0 0;
}
#content h2 {
    color: #6e127e;
    font-size: 2.1rem;
    font-weight: 800;
    margin-bottom: 28px;
    letter-spacing: 0.01em;
}
#content p {
    font-size: 1.13rem;
    color: #333;
    line-height: 1.8;
    margin-bottom: 14px;
    text-align: left;
}
#content strong {
    color: #6e127e;
    font-weight: 700;
}
.btn-primary {
    background: #6e127e;
    border: none;
    color: #fff;
    font-weight: 600;
    border-radius: 10px;
    padding: 14px 32px;
    font-size: 1.1rem;
    margin-top: 18px;
    transition: background 0.2s, box-shadow 0.2s, transform 0.2s;
    box-shadow: 0 2px 8px rgba(110,18,126,0.10);
}
.btn-primary:hover {
    background: #4d0e5e;
    color: #fff;
    box-shadow: 0 4px 16px rgba(110,18,126,0.18);
    transform: translateY(-2px) scale(1.01);
}
.status-text {
    display: inline-block;
    font-size: 1.1rem;
    font-weight: 600;
    color: #6e127e;
    background: #f3e6f7;
    border-radius: 8px;
    padding: 8px 18px;
    margin: 18px 0;
}
@media (max-width: 991px) {
    .property_block_wrap.style-2 {
        padding: 18px 6px 18px 6px;
    }
    #content h2 {
        font-size: 1.3rem;
    }
    #content p {
        font-size: 1rem;
    }
}
</style>

<!-- ============================ Agency List Start ================================== -->
<section class="gray-simple">

    <div class="container">

        <!-- row Start -->
        <div class="row">

            <div class="col-lg-12 col-md-12">
                <div class="property_block_wrap style-2">

                    <div id="content" style="padding: 10px;">
                        <h2 style="text-align: center;">House Rental Agreement</h2>
                        <p>　　Lessor: <strong>${order.ownerUser.userDisplayName}</strong> (hereinafter referred to as Party A)</p>
                        <p>　　ID Number: <strong>${order.ownerUser.idCard}</strong></p>
                        <p>　　Lessee: <strong>${order.customerUser.userDisplayName}</strong> (hereinafter referred to as Party B)</p>
                        <p>　　ID Number: <strong>${order.customerUser.idCard}</strong></p>
                        <p>　　Based on the principles of voluntariness, equality, and mutual benefit, Party A and Party B have reached an agreement to clarify their rights and obligations regarding Party A's legal property being rented to Party B.</p>
                        <p>　　1. Property Address: <strong>${order.house.address}</strong>, Property Name: <strong>${order.house.title}</strong></p>
                        <p>　　2. Lease Term and Agreements</p>
                        <p>　　2.1. The lease term is <strong>${order.dayNum}</strong> days, from <strong><fmt:formatDate pattern="yyyy-MM-dd" value="${order.startDate}"/></strong> to <strong><fmt:formatDate pattern="yyyy-MM-dd" value="${order.endDate}"/></strong></p>
                        <p>　　2.2. Rental Details:
                            - Daily Rent: <fmt:formatNumber value="${order.monthRent/30 }" pattern="#" type="number"/> MYR/day
                            - Parking Fee: ${order.house.dayParkingFee} MYR/day
                            - Management Fee: ${order.house.dayManagingFee} MYR/day
                            - Duration: <strong>${order.dayNum}</strong> days
                            - Security Deposit: <strong>0</strong> MYR
                            - Total Amount: <strong>${order.totalAmount}</strong> MYR
                        </p>
                        <p>　　The security deposit will be returned to Party B without interest after Party A's inspection at the end of the lease.</p>
                        <p>　　2.3. Party B commits to using the property solely for residential purposes.</p>
                        <p>　　2.4. Upon lease expiration, Party A has the right to reclaim the property, and Party B must return it as scheduled. If Party B wishes to renew the lease, they must notify Party A one month before expiration and sign a new agreement upon Party A's approval.</p>
                        <p>　　3. Property Maintenance and Usage</p>
                        <p>　　3.1. During the lease term, Party A shall ensure the property's safety for use. Party B shall use the property and its facilities reasonably. Party B is responsible for repairs or compensation for any damage caused by improper use.</p>
                        <p>　　3.2. Party A is responsible for property maintenance (except for damage caused by Party B's misuse). Party A must notify Party B seven days before any maintenance work, and Party B shall cooperate.</p>
                        <p>　　3.3. Party B may renovate the property if needed, without affecting its structure, but must obtain Party A's prior consent. Any permanent improvements become Party A's property after lease termination.</p>
                        <p>　　4. Property Transfer and Sublease</p>
                        <p>　　4.1. During the lease term, Party B shall not sublease or lend the property without Party A's written consent.</p>
                        <p>　　4.2. If Party A agrees to sublease, a separate supplementary agreement must be signed.</p>
                        <p>　　5. Breach of Contract by Party B</p>
                        <p>　　Party A may terminate the contract and reclaim the property if Party B:</p>
                        <p>　　(1) Subleases or lends the property without Party A's written consent</p>
                        <p>　　(2) Modifies the property structure without authorization</p>
                        <p>　　(3) Changes the agreed purpose of use or conducts illegal activities</p>
                        <p>　　(4) Delays rent payment for more than one month</p>
                        <p>　　6. This agreement is made in duplicate, with each party holding one copy, effective upon payment by Party B.</p>
                        <!--            <p>　　七、其他说明：水电数字由甲乙双方与其他承租方平均分配</p>-->
                        <!--            <p>　　甲方签字：　　　　　　乙方签字：</p>-->
                        <!--            <p>　　联系方式：　　　　　　联系方式：</p>-->

                    </div>
                    <div style="text-align: center;margin-top: 50px;">
<%--                        订单状态：-2待签合同，-1待付款，0生效中，1已到期，-3已取消，2申请退租，3申请退租不通过--%>
                        <c:choose>
                            <c:when test="${order.status == -2}">
                                <a href="javascript:void(0)" onclick="confirmAgreement(${order.id})"
                                   class="btn btn-primary">I have read and agree to the above contract</a>
                            </c:when>
                            <c:when test="${order.status == -1}">Pending Payment</c:when>
                            <c:when test="${order.status == 0}">Contract in Effect</c:when>
                            <c:when test="${order.status == 1}">Contract Expired</c:when>
                            <c:when test="${order.status == 2}">Termination Requested</c:when>
                            <c:when test="${order.status == 3}">Termination Request Rejected</c:when>
                            <c:when test="${order.status == -3}">Cancelled</c:when>
                        </c:choose>

                    </div>
                    <div style="text-align: center;margin: 20px;">
                        <a href="javascript:void(0)" onclick="printHtml('content')">Print</a>
                    </div>

                </div>

            </div>


        </div>
        <!-- /row -->

    </div>

</section>
<!-- ============================ Agency List End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
    function printHtml(div) {

        var before = "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'></head><body >";
        var print = document.getElementById(div).innerHTML;
        var result = before + print + "</body></html>"

        console.log(result);
        var wind = window.open("", 'newwindow', 'height=300, width=700, top=100, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');

        wind.document.body.innerHTML = result;

        wind.print();
        return false;
    }
</script>
</body>
</html>
