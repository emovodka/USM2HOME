<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>
<link rel="stylesheet" href="/assets/plugins/bootstrap-fileinput/css/fileinput.min.css">


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Publish Property Information
        </h1>
    </section>
    <!-- tab选项卡 -->
    <section class="content container-fluid">
        <div class="row" style="background: #ffffff;margin: 5px;">
            <div class="col-md-12" style="padding:5px 0;">
                <div class="dashboard-wraper">

                    <form action="" id="houseForm">
                        <input type="hidden" name="id" value="${house.id}">
                        <input type="hidden" id="key" name="key">
                        <input type="hidden" name="city" value="Penang">
                        <!-- Submit Form -->
                        <div class="col-lg-12 col-md-12">

                            <div class="submit-page form-simple">

                                <!-- Basic Information -->
                                <div class="frm_submit_block">
                                    <h3>Basic Information</h3>
                                    <div class="frm_submit_wrap">
                                        <div class="form-row">

                                            <div class="form-group col-md-6">
                                                <label>Property Type</label>
                                                <select name="rentType" class="form-control">
                                                    <option value="whole"
                                                            <c:if test="${house.rentType == 'whole'}">selected</c:if>>
                                                        Whole Property
                                                    </option>
                                                    <option value="share"
                                                            <c:if test="${house.rentType == 'share'}">selected</c:if>>
                                                        Shared Property
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>RM/Monthly<a href="#" class="tip-topdata"
                                                              data-tip="日租金 = 月租金/30"><i
                                                        class="ti-help"></i></a></label>
                                                <input type="number" name="monthRent" value="${house.monthRent}"
                                                       class="form-control">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Deposit (RM)<a href="#" class="tip-topdata"
                                                              data-tip="Security deposit amount in RM"><i
                                                        class="ti-help"></i></a></label>
                                                <input type="number" step="0.01" name="deposit" value="${house.deposit}"
                                                       class="form-control" min="0">
                                            </div>
                                            <!--
                                            <div class="form-group col-md-6">
                                                <label>Daily Parking Fee</label>
                                                <input type="number" name="dayParkingFee" value="${house.dayParkingFee}"
                                                       class="form-control">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Daily Management Fee</label>
                                                <input type="number" name="dayManagingFee"
                                                       value="${house.dayManagingFee}"
                                                       class="form-control">
                                            </div>
                                            -->

                                            <div class="form-group col-md-6">
                                                <label>Distance to USM (km)<a href="#" class="tip-topdata" data-tip="Enter the distance from property to USM main campus in kilometers"><i class="ti-help"></i></a></label>
                                                <input type="number" step="0.1" name="distanceToUsm" value="${house.distanceToUsm}" class="form-control" min="0" max="999.99">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Property Title (Example: Plaza ivory-3b2b-RoomA)<a href="#" class="tip-topdata"
                                                                data-tip="shared-Plaza ivory-3b2b-RoomA"><i
                                                        class="ti-help"></i></a></label>
                                                <input type="text" name="title" value="${house.title}"
                                                       class="form-control">
                                            </div>

                                            <div class="form-group col-md-8">
                                                <label>Property Address Detail (Example: Plaza ivory-Block A-Level23)<a href="#" class="tip-topdata"
                                                                  data-tip="Tropicana Bay Residence-Block E-Level50"><i
                                                        class="ti-help"></i></a></label>
                                                <input type="text" name="address" value="${house.address}"
                                                       class="form-control">
                                            </div>

                                            <div class="form-group col-md-4">
                                                <label>latitude and longitude<a
                                                        href="http://api.map.baidu.com/lbsapi/getpoint/index.html"
                                                        target="_blank">Click</a>Here<a href="#" class="tip-topdata"
                                                                                   data-tip="latitude and longitude：113.933216,22.524803"><i
                                                        class="ti-help"></i></a></label>
                                                <input type="text" name="longitudeLatitude"
                                                       value="${house.longitudeLatitude}"
                                                       class="form-control">
                                            </div>


                                        </div>
                                    </div>
                                </div>


                                <!-- 房屋结构 -->
                                <div class="frm_submit_block">
                                    <h3>Property Detail Information</h3>
                                    <div class="frm_submit_wrap">
                                        <div class="form-row">


                                            <div class="form-group col-md-6">
                                                <label>Property Certificate number</label>
                                                <input type="text" name="certificateNo"
                                                       

                                                       value="${house.certificateNo}" class="form-control">
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label>Property Area<a href="#" class="tip-topdata"
                                                            data-tip="Whole house type: the area of the whole house. Shared type: the area of a single room"><i
                                                        class="ti-help"></i></a></label>
                                                <input type="text" name="area" value="${house.area}"
                                                       

                                                       class="form-control">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Direction</label>
                                                <input type="text" name="direction" value="${house.direction}"
                                                       class="form-control">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>AC</label>
                                                <select name="hasAirConditioner" class="form-control">
                                                    <option value="1"
                                                            <c:if test="${house.hasAirConditioner == 1}">selected</c:if>>
                                                        Have AC
                                                    </option>
                                                    <option value="0"
                                                            <c:if test="${house.hasAirConditioner == 0}">selected</c:if>>
                                                        No AC
                                                    </option>
                                                </select>
                                            </div>


                                            <div class="form-group col-md-6">
                                                <label>Number of Bedroom</label>
                                                <select name="bedroomNum" class="form-control">
                                                    <option value="1"
                                                            <c:if test="${house.bedroomNum == 1}">selected</c:if>>
                                                        1
                                                    </option>
                                                    <option value="2"
                                                            <c:if test="${house.bedroomNum == 2}">selected</c:if>>
                                                        2
                                                    </option>
                                                    <option value="3"
                                                            <c:if test="${house.bedroomNum == 3}">selected</c:if>>
                                                        3
                                                    </option>
                                                    <option value="4"
                                                            <c:if test="${house.bedroomNum == 4}">selected</c:if>>
                                                        4
                                                    </option>
                                                    <option value="5"
                                                            <c:if test="${house.bedroomNum == 5}">selected</c:if>>
                                                        5
                                                    </option>
                                                    <option value="6"
                                                            <c:if test="${house.bedroomNum == 6}">selected</c:if>>
                                                        6
                                                    </option>
                                                    <option value="7"
                                                            <c:if test="${house.bedroomNum == 7}">selected</c:if>>
                                                        7
                                                    </option>
                                                    <option value="8"
                                                            <c:if test="${house.bedroomNum == 8}">selected</c:if>>
                                                        8
                                                    </option>
                                                </select>
                                            </div>


                                            <div class="form-group col-md-6">
                                                <label>Number of Living Room</label>
                                                <select name="livingRoomNum" class="form-control">
                                                    <option value="1"
                                                            <c:if test="${house.livingRoomNum == 1}">selected</c:if>>
                                                        1
                                                    </option>
                                                    <option value="2"
                                                            <c:if test="${house.livingRoomNum == 2}">selected</c:if>>
                                                        2
                                                    </option>
                                                    <option value="3"
                                                            <c:if test="${house.livingRoomNum == 3}">selected</c:if>>
                                                        3
                                                    </option>
                                                    <option value="4"
                                                            <c:if test="${house.livingRoomNum == 4}">selected</c:if>>
                                                        4
                                                    </option>
                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label>Number of Kitchen </label>
                                                <select name="kitchenNum" class="form-control">
                                                    <option value="1"
                                                            <c:if test="${house.kitchenNum == 1}">selected</c:if>>
                                                        1
                                                    </option>
                                                    <option value="2"
                                                            <c:if test="${house.kitchenNum == 2}">selected</c:if>>
                                                        2
                                                    </option>
                                                    <option value="3"
                                                            <c:if test="${house.kitchenNum == 3}">selected</c:if>>
                                                        3
                                                    </option>
                                                    <option value="4"
                                                            <c:if test="${house.kitchenNum == 4}">selected</c:if>>
                                                        4
                                                    </option>
                                                </select>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label>Number of bathroom</label>
                                                <select name="toiletNum" class="form-control">
                                                    <option value="1"
                                                            <c:if test="${house.toiletNum == 1}">selected</c:if>>
                                                        1
                                                    </option>
                                                    <option value="2"
                                                            <c:if test="${house.toiletNum == 2}">selected</c:if>>
                                                        2
                                                    </option>
                                                    <option value="3"
                                                            <c:if test="${house.toiletNum == 3}">selected</c:if>>
                                                        3
                                                    </option>
                                                    <option value="4"
                                                            <c:if test="${house.toiletNum == 4}">selected</c:if>>
                                                        4
                                                    </option>
                                                </select>
                                            </div>


                                        </div>
                                    </div>
                                </div>

                                <!-- 建筑信息 -->
                                <div class="frm_submit_block">
                                    <h3>Apartment Complex Detail</h3>
                                    <div class="frm_submit_wrap">
                                        <div class="form-row">

                                            <div class="form-group col-md-6">
                                                <label>Bulid Year</label>
                                                <input type="number" name="buildYear" value="${house.buildYear}"
                                                       
                                                       class="form-control">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Total Floor Number</label>
                                                <input type="number" name="floor" value="${house.floor}"
                                                       
                                                       class="form-control">
                                            </div>
                                            
                                            <div class="form-group col-md-6">
                                                <label>atotal Block Number</label>
                                                <input type="number" name="maxFloor" value="${house.maxFloor}"
                                                       
                                                       class="form-control">
                                            </div>
                                            

                                            <div class="form-group col-md-6">
                                                <label>Elevator</label>
                                                <select name="hasElevator" class="form-control">
                                                    <option value="1"
                                                            <c:if test="${house.hasElevator == 1}">selected</c:if>>
                                                        Have
                                                    </option>
                                                    <option value="0"
                                                            <c:if test="${house.hasElevator == 0}">selected</c:if>>
                                                        Don't have
                                                    </option>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                </div>


                                <!-- 联系人信息 -->
                                <div class="frm_submit_block">
                                    <h3>Contact information</h3>
                                    <div class="frm_submit_wrap">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label>Contant Name</label>
                                                <input type="text" name="contactName"
                                                       value="${house.contactName}" class="form-control">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Whatsapp</label>
                                                <input type="text" name="contactPhone"
                                                       value="${house.contactPhone}" class="form-control">
                                            </div>


                                        </div>
                                    </div>
                                </div>

                                <!-- Detailed Information -->
                                <div class="frm_submit_block">
                                    <h3>Detailed description</h3>
                                    <div class="frm_submit_wrap">
                                        <div class="form-row">

                                            <div class="form-group col-md-12">
                                                <label>Description</label>
                                                <textarea class="form-control h-120"
                                                          name="content">${house.content}</textarea>
                                            </div>


                                        </div>
                                    </div>
                                </div>

                                <!-- Gallery -->
                                <c:if test="${house.id == null}">
                                    <div class="frm_submit_block">
                                        <h3>Upload Image</h3>
                                        <div class="frm_submit_wrap">
                                            <div class="form-row">
                                                <div class="form-group col-md-12">
                                                    <input type="file" name="file" id="file" multiple
                                                           class="file-loading"/>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </c:if>


                                <div class="form-group">
                                    <div class="col-lg-12 col-md-12">
                                        <button class="btn btn-success bg-2" type="button"
                                                onclick="submitHouse()">Post
                                        </button>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </form>
                </div>


            </div>
        </div>
        <div style="padding: 10px">
            <p style="color: red">Attention： <br>
                1:Please click the upload button after selecting the image <br>
                2:Upload at least one image <br>
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



