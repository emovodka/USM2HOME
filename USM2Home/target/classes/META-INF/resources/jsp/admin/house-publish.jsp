<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>
<link rel="stylesheet" href="/assets/plugins/bootstrap-fileinput/css/fileinput.min.css">


<div class="content-wrapper">
    <section class="content-header">
        <h1 style="font-weight: bold; color: #337ab7;">
            Publish Property Information
        </h1>
    </section>
    <section class="content container-fluid">
        <div class="row" style="background: #f8f9fa; margin: 5px;">
            <div class="col-md-12" style="padding: 20px 0;">
                <div class="dashboard-wraper" style="max-width: 950px; margin: 0 auto;">

                    <form action="" id="houseForm" style="background: #fff; border-radius: 10px; box-shadow: 0 2px 12px rgba(0,0,0,0.07); padding: 35px 40px 25px 40px;">
                        <input type="hidden" name="id" value="${house.id}">
                        <input type="hidden" id="key" name="key">
                        <input type="hidden" name="city" value="Penang">

                        <!-- Basic Information -->
                        <div class="frm_submit_block" style="margin-bottom: 30px;">
                            <h3 style="font-weight: bold; color: #337ab7;">Basic Information</h3>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Property Type</label>
                                    <select name="rentType" class="form-control">
                                        <option value="whole" <c:if test="${house.rentType == 'whole'}">selected</c:if>>Whole Property</option>
                                        <option value="share" <c:if test="${house.rentType == 'share'}">selected</c:if>>Shared Property</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>RM/Monthly</label>
                                    <input type="number" name="monthRent" value="${house.monthRent}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Deposit (RM)</label>
                                    <input type="number" step="0.01" name="deposit" value="${house.deposit}" class="form-control" min="0">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Distance to USM (km)</label>
                                    <input type="number" step="0.1" name="distanceToUsm" value="${house.distanceToUsm}" class="form-control" min="0" max="999.99">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Property Title</label>
                                    <input type="text" name="title" value="${house.title}" class="form-control">
                                </div>
                                <div class="form-group col-md-8">
                                    <label>Property Address Detail</label>
                                    <input type="text" name="address" value="${house.address}" class="form-control">
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Latitude and Longitude <a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_blank" style="font-size: 0.9em;">(Get)</a></label>
                                    <input type="text" name="longitudeLatitude" value="${house.longitudeLatitude}" class="form-control">
                                </div>
                            </div>
                        </div>

                        <!-- Property Detail Information -->
                        <div class="frm_submit_block" style="margin-bottom: 30px;">
                            <h3 style="font-weight: bold; color: #337ab7;">Property Detail Information</h3>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Property Certificate number</label>
                                    <input type="text" name="certificateNo" value="${house.certificateNo}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Property Area</label>
                                    <input type="text" name="area" value="${house.area}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Direction</label>
                                    <input type="text" name="direction" value="${house.direction}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>AC</label>
                                    <select name="hasAirConditioner" class="form-control">
                                        <option value="1" <c:if test="${house.hasAirConditioner == 1}">selected</c:if>>Have AC</option>
                                        <option value="0" <c:if test="${house.hasAirConditioner == 0}">selected</c:if>>No AC</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Number of Bedroom</label>
                                    <select name="bedroomNum" class="form-control">
                                        <c:forEach var="i" begin="1" end="8">
                                            <option value="${i}" <c:if test="${house.bedroomNum == i}">selected</c:if>>${i}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Number of Living Room</label>
                                    <select name="livingRoomNum" class="form-control">
                                        <c:forEach var="i" begin="1" end="4">
                                            <option value="${i}" <c:if test="${house.livingRoomNum == i}">selected</c:if>>${i}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Number of Kitchen</label>
                                    <select name="kitchenNum" class="form-control">
                                        <c:forEach var="i" begin="1" end="4">
                                            <option value="${i}" <c:if test="${house.kitchenNum == i}">selected</c:if>>${i}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Number of bathroom</label>
                                    <select name="toiletNum" class="form-control">
                                        <c:forEach var="i" begin="1" end="4">
                                            <option value="${i}" <c:if test="${house.toiletNum == i}">selected</c:if>>${i}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Apartment Complex Detail -->
                        <div class="frm_submit_block" style="margin-bottom: 30px;">
                            <h3 style="font-weight: bold; color: #337ab7;">Apartment Complex Detail</h3>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Build Year</label>
                                    <input type="number" name="buildYear" value="${house.buildYear}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Total Floor Number</label>
                                    <input type="number" name="floor" value="${house.floor}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Total Block Number</label>
                                    <input type="number" name="maxFloor" value="${house.maxFloor}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Elevator</label>
                                    <select name="hasElevator" class="form-control">
                                        <option value="1" <c:if test="${house.hasElevator == 1}">selected</c:if>>Have</option>
                                        <option value="0" <c:if test="${house.hasElevator == 0}">selected</c:if>>Don't have</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Contact Information -->
                        <div class="frm_submit_block" style="margin-bottom: 30px;">
                            <h3 style="font-weight: bold; color: #337ab7;">Contact information</h3>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Contact Name</label>
                                    <input type="text" name="contactName" value="${house.contactName}" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Whatsapp</label>
                                    <input type="text" name="contactPhone" value="${house.contactPhone}" class="form-control">
                                </div>
                            </div>
                        </div>

                        <!-- Detailed Information -->
                        <div class="frm_submit_block" style="margin-bottom: 30px;">
                            <h3 style="font-weight: bold; color: #337ab7;">Detailed description</h3>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label>Description</label>
                                    <textarea class="form-control h-120" name="content" rows="4">${house.content}</textarea>
                                </div>
                            </div>
                        </div>

                        <!-- Gallery -->
                        <c:if test="${house.id == null}">
                            <div class="frm_submit_block" style="margin-bottom: 30px;">
                                <h3 style="font-weight: bold; color: #337ab7;">Upload Image</h3>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <input type="file" name="file" id="file" multiple class="file-loading"/>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="form-group" style="text-align: center;">
                            <button class="btn btn-success bg-2" type="button" onclick="submitHouse()" style="width: 180px; font-size: 1.2em;">Post</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div style="padding: 10px; max-width: 950px; margin: 0 auto;">
            <p style="color: #d9534f; font-weight: bold; font-size: 1.1em;">
                Attention:<br>
                1. Please click the upload button after selecting the image.<br>
                2. Upload at least one image.<br>
            </p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>
<script src="/assets/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script>
    $(function () {
        var timestamp = Date.parse(new Date());
        $('#key').val(timestamp);
        var control = $("#file");
        var uploadUrl = "/file/upload?key=" + timestamp;
        control.fileinput({
            uploadUrl: uploadUrl,
            allowedFileExtensions: ['png', 'jpeg', 'jpg', 'gif'],
            showUpload: true,
            showCaption: false,
            browseClass: "btn btn-primary",
            dropZoneEnabled: true,
            maxFileSize: 0,
            minFileCount: 0,
            maxFileCount: 100,
            enctype: 'multipart/form-data',
            validateInitialCount: true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "The number of files selected for upload ({n}) exceeds the maximum allowed value {m}!",
        });
        $("#file").on("fileuploaded", function (event, data, previewId, index) {
            // Upload completed
        });
    });
</script>



