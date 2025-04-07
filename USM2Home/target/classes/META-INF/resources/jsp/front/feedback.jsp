
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>



<!-- ============================ Page Title Start================================== -->
<div class="page-title" style="background:#f4f4f4 url(/assets/img/inner-banner.jpg);" data-overlay="5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">

                <div class="breadcrumbs-wrap">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">User Feedback</li>
                    </ol>
                    <h2 class="breadcrumb-title">Quick Feedback, Contact Us</h2>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- ============================ Page Title End ================================== -->

<!-- ============================ Agency List Start ================================== -->
<section class="gray-simple">

    <div class="container">

        <!-- row Start -->
        <div class="row">

            <div class="col-lg-8 col-md-7">
                <div class="property_block_wrap style-2">

                    <div class="property_block_wrap_header no-collapse">
                        <h4 class="property_block_title">Fill in your feedback information</h4>
                    </div>

                    <div class="block-body">
                        <form class="form-simple" id="feedbackForm">
                            <div class="row">
                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input type="text" name="contactName" class="form-control simple">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="email" name="contactEmail" class="form-control simple">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" name="title" class="form-control simple">
                            </div>

                            <div class="form-group">
                                <label>Content</label>
                                <textarea class="form-control simple" name="content"></textarea>
                            </div>

                            <div class="form-group">
                                <button class="btn btn-success bg-2" type="button" onclick="submitFeedback()">Submit</button>
                            </div>
                        </form>
                    </div>

                </div>

            </div>

            <div class="col-lg-4 col-md-5">

                <div class="contact-box">
                    <i class="ti-location-pin"></i>
                    <h4>Company Address</h4>
                    <p>USM DKG31</p>
                </div>

                <div class="contact-box">
                    <i class="ti-email"></i>
                    <h4>Contact Us</h4>
                    <p>yichi@student.usm.my</p>
                    <span>+60123456789</span>
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
