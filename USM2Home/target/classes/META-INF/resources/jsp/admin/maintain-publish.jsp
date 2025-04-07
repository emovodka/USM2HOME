<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="module/_header.jsp" %>
<link rel="stylesheet" href="/assets/plugins/bootstrap-fileinput/css/fileinput.min.css">


<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Post Maintaince
        </h1>
    </section>
    <!-- tab选项卡 -->
    <section class="content container-fluid">
        <div class="row" style="background: #ffffff;margin: 5px;">
            <div class="col-md-12" style="padding:5px 0;">
                <div class="dashboard-wraper">

                    <form action="" id="form">
                        <div class="form-row">

                            <input type="hidden" name="id" value="${maintain.id}">
                            <input type="hidden" id="key" name="key">
                            <input type="hidden" name="houseId" value="${maintain.houseId}">
                            <div class="form-group col-md-12">
                                <label>Title</label>
                                <input type="text" name="title" value="${maintain.title}"
                                       class="form-control">
                            </div>


                            <div class="form-group col-md-12">
                                <label>Content</label>
                                <textarea class="form-control h-240" name="content"
                                          style="min-height: 300px;">${maintain.content}</textarea>
                            </div>

                            <div class="form-group col-md-12">
                                <label>Upload Image</label>
                                <input type="file" name="file" id="file" multiple
                                       class="file-loading"/>
                            </div>


                            <div class="form-group">
                                <div class="col-lg-12 col-md-12">
                                    <button class="btn btn-success bg-2" type="button"
                                            onclick="submitMaintain()">Post
                                    </button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>


            </div>
        </div>
        <div style="padding: 10px">
            <p style="color: red">
                Attention: Click upload button after upload the image
            </p>
        </div>
    </section>
</div>

<%@ include file="module/_footer.jsp" %>
<script src="/assets/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/assets/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<script>
    $(function () {
        var timestamp = Date.parse(new Date());
        $('#key').val(timestamp);
        var control = $("#file");
        var uploadUrl = "/file/upload?key=" + timestamp;
        control.fileinput({
            language: 'zh', //设置语言
            uploadUrl: uploadUrl, //上传的地址
            allowedFileExtensions: ['png', 'jpeg', 'jpg', 'gif'],//接收的文件后缀
            showUpload: true, //显示批量上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            minFileCount: 0,
            maxFileCount: 100,
            enctype: 'multipart/form-data',
            validateInitialCount: true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",

            msgFilesTooMany: "The number of files selected for upload ({n}) exceeds the maximum allowed value {m}！",
        });
        //导入文件上传完成之后的事件
        $("#file").on("fileuploaded", function (event, data, previewId, index) {
            // alert('上传成功');
        });
    });
</script>