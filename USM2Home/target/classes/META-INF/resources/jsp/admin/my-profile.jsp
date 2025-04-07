<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Edit personal information
            <small></small>
        </h1>
    </section>
    <!-- tab选项卡 -->
    <section class="content container-fluid">
        <div class="row" style="background: #ffffff;margin: 5px;">
            <div class="col-md-12" style="padding:5px 0;" >
                <form action="" id="profileForm">
                    <div class="form-row" >

                        <div class="form-group col-md-6">
                            <label>Account</label>
                            <input type="text" class="form-control" name="userName" value="${user.userName}"
                                   placeholder="Enter your username (4-20 characters)">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Name</label>
                            <input type="text" class="form-control" name="userDisplayName"
                                   value="${user.userDisplayName}" 
                                   placeholder="Enter your full name">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Email</label>
                            <input type="email" class="form-control" name="email" 
                                   value="${user.email}" 
                                   placeholder="example@student.usm.my">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Phone number</label>
                            <input type="text" class="form-control" name="phone" value="${user.phone}" placeholder="60-177122511">
                        </div>

                        <div class="form-group col-md-6">
                            <label>ID Type</label>
                            <select id="idType" class="form-control" onchange="changeIdType()">
                                <option value="mykad" <c:if test="${fn:length(user.idCard) == 14}">selected</c:if>>Malaysia MyKad</option>
                                <option value="passport" <c:if test="${fn:length(user.idCard) == 9}">selected</c:if>>China Passport</option>
                            </select>
                        </div>

                        <div class="form-group col-md-6">
                            <label>ID Number<a href="#" class="tip-topdata" id="idTip" data-tip=""><i class="ti-help"></i></a></label>
                            <input type="text" class="form-control" name="idCard" id="idCard" 
                                   value="${user.idCard}">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Gender</label>
                            <select name="sex" class="form-control">
                                <option value="Male" <c:if test="${user.sex == 'Male'}">selected</c:if>>
                                    Male
                                </option>
                                <option value="Female" <c:if test="${user.sex == 'Female'}">selected</c:if>>
                                    Female
                                </option>
                            </select>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Student Type</label>
                            <select name="job" class="form-control">
                                <option value="Undergraduate" <c:if test="${user.job == 'Undergraduate'}">selected</c:if>>
                                    Undergraduate Student
                                </option>
                                <option value="Master" <c:if test="${user.job == 'Master'}">selected</c:if>>
                                    Postgraduate Student
                                </option>
                                <option value="PhD" <c:if test="${user.job == 'PhD'}">selected</c:if>>
                                    PhD Student
                                </option>
                                <option value="Other" <c:if test="${user.job == 'Other'}">selected</c:if>>
                                    Other
                                </option>
                            </select>
                        </div>

                        <div class="form-group col-md-6">
                            <label>School/Faculty<a href="#" class="tip-topdata" data-tip="Select your school or faculty at USM"><i class="ti-help"></i></a></label>
                            <select name="hobby" class="form-control">
                                <option value="" disabled <c:if test="${empty user.hobby}">selected</c:if>>Select your school/faculty</option>
                                
                                <!-- Engineering -->
                                <optgroup label="Engineering">
                                    <option value="School of Aerospace Engineering" <c:if test="${user.hobby == 'School of Aerospace Engineering'}">selected</c:if>>
                                        School of Aerospace Engineering
                                    </option>
                                    <option value="School of Chemical Engineering" <c:if test="${user.hobby == 'School of Chemical Engineering'}">selected</c:if>>
                                        School of Chemical Engineering
                                    </option>
                                    <option value="School of Civil Engineering" <c:if test="${user.hobby == 'School of Civil Engineering'}">selected</c:if>>
                                        School of Civil Engineering
                                    </option>
                                    <option value="School of Electrical and Electronic Engineering" <c:if test="${user.hobby == 'School of Electrical and Electronic Engineering'}">selected</c:if>>
                                        School of Electrical and Electronic Engineering
                                    </option>
                                    <option value="School of Materials and Mineral Resources Engineering" <c:if test="${user.hobby == 'School of Materials and Mineral Resources Engineering'}">selected</c:if>>
                                        School of Materials and Mineral Resources Engineering
                                    </option>
                                    <option value="School of Mechanical Engineering" <c:if test="${user.hobby == 'School of Mechanical Engineering'}">selected</c:if>>
                                        School of Mechanical Engineering
                                    </option>
                                </optgroup>

                                <!-- Science -->
                                <optgroup label="Science">
                                    <option value="School of Biological Sciences" <c:if test="${user.hobby == 'School of Biological Sciences'}">selected</c:if>>
                                        School of Biological Sciences
                                    </option>
                                    <option value="School of Chemical Sciences" <c:if test="${user.hobby == 'School of Chemical Sciences'}">selected</c:if>>
                                        School of Chemical Sciences
                                    </option>
                                    <option value="School of Computer Sciences" <c:if test="${user.hobby == 'School of Computer Sciences'}">selected</c:if>>
                                        School of Computer Sciences
                                    </option>
                                    <option value="School of Mathematical Sciences" <c:if test="${user.hobby == 'School of Mathematical Sciences'}">selected</c:if>>
                                        School of Mathematical Sciences
                                    </option>
                                    <option value="School of Physics" <c:if test="${user.hobby == 'School of Physics'}">selected</c:if>>
                                        School of Physics
                                    </option>
                                </optgroup>

                                <!-- Arts -->
                                <optgroup label="Arts">
                                    <option value="School of Arts" <c:if test="${user.hobby == 'School of Arts'}">selected</c:if>>
                                        School of Arts
                                    </option>
                                    <option value="School of Communication" <c:if test="${user.hobby == 'School of Communication'}">selected</c:if>>
                                        School of Communication
                                    </option>
                                    <option value="School of Languages, Literacies and Translation" <c:if test="${user.hobby == 'School of Languages, Literacies and Translation'}">selected</c:if>>
                                        School of Languages, Literacies and Translation
                                    </option>
                                </optgroup>

                                <!-- Management -->
                                <optgroup label="Management">
                                    <option value="School of Management" <c:if test="${user.hobby == 'School of Management'}">selected</c:if>>
                                        School of Management
                                    </option>
                                    <option value="Graduate School of Business" <c:if test="${user.hobby == 'Graduate School of Business'}">selected</c:if>>
                                        Graduate School of Business
                                    </option>
                                </optgroup>

                                <!-- Others -->
                                <optgroup label="Others">
                                    <option value="School of Educational Studies" <c:if test="${user.hobby == 'School of Educational Studies'}">selected</c:if>>
                                        School of Educational Studies
                                    </option>
                                    <option value="School of Housing, Building and Planning" <c:if test="${user.hobby == 'School of Housing, Building and Planning'}">selected</c:if>>
                                        School of Housing, Building and Planning
                                    </option>
                                    <option value="School of Pharmaceutical Sciences" <c:if test="${user.hobby == 'School of Pharmaceutical Sciences'}">selected</c:if>>
                                        School of Pharmaceutical Sciences
                                    </option>
                                    <option value="Other" <c:if test="${user.hobby == 'Other'}">selected</c:if>>
                                        Other
                                    </option>
                                </optgroup>
                            </select>
                        </div>

                        <div class="form-group col-md-12">
                            <label>About Myself</label>
                            <textarea class="form-control" name="userDesc">${user.userDesc}</textarea>
                        </div>

                        <div class="form-group col-md-6">
                            <label>IC image</label>

                            <input id='idCardImg' name="idCardImg" class="form-control"   <c:if test="${user.idCardImg !=null && user.idCardImg != ''}"></c:if>
                                   value="${user.idCardImg}" onclick="$('#file').click();">
                            <label class="input-group-btn">
                                <input type="file" id="file" accept=".png, .jpg, .jpeg" style="display: none">
                            </label>
                        </div>
                        <div class="form-group col-md-6">
                            <img src="${user.idCardImg}" id="imgUrl" style="height: 100px;" alt="">
                        </div>

                        <div class="form-group">
                            <div class="col-lg-12 col-md-12">
                            <button class="btn btn-success bg-2" type="button" onclick="submitProfile()">
                                    Save Changes
                            </button>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
        <div style="padding: 10px">
            <p style="color: red">Note: Please ensure all information is accurate before saving.</p>
        </div>
    </section>
</div>

<script>
function submitProfile() {
    // 获取表单数据
    var formData = {};
    $('#profileForm').serializeArray().forEach(function(item) {
        formData[item.name] = item.value;
    });

    // 验证ID格式
    var idType = $('#idType').val();
    var idCard = $('#idCard').val();
    
    if (idType === 'mykad') {
        if (!/^\d{6}-\d{2}-\d{4}$/.test(idCard)) {
            alert('Please enter a valid MyKad number in format: YYMMDD-PB-XXXX');
            return;
        }
    } else {
        if (!/^E\d{8}$/.test(idCard)) {
            alert('Please enter a valid China Passport number in format: E12345678');
            return;
        }
    }

    // 发送AJAX请求
    $.ajax({
        type: 'POST',
        url: '/admin/profile/submit',
        data: formData,
        success: function(result) {
            if (result.code === 1) {
                alert('Save successful');
                window.location.reload();
            } else {
                alert(result.msg);
            }
        },
        error: function() {
            alert('Save failed, please try again');
        }
    });
}

function changeIdType() {
    var idType = document.getElementById('idType').value;
    var idTip = document.getElementById('idTip');
    var idCard = document.getElementById('idCard');
    
    if (idType === 'mykad') {
        idTip.setAttribute('data-tip', 'Format: YYMMDD-PB-XXXX (Example: 991231-07-1234)');
        idCard.setAttribute('placeholder', 'Example: 991231-07-1234');
    } else {
        idTip.setAttribute('data-tip', 'Format: E + 8 digits (Example: E12345678)');
        idCard.setAttribute('placeholder', 'Example: E12345678');
    }
}

// Initialize tooltip
document.addEventListener('DOMContentLoaded', function() {
    changeIdType();
});
</script>

<%@ include file="module/_footer.jsp" %>
