<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <style>
        body,
        html,
        #container {
            overflow: hidden;
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
        }
    </style>
    <script src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=F6ccffoWGKuKBZvGWNd9q8qcxGjNFL2Q"></script>
</head>
<body>
<!--<div class="info">最新版GL地图命名空间为BMapGL, 可按住鼠标右键控制地图旋转、修改倾斜角度。</div>-->
<div id="container"></div>
<script type="text/javascript">
    var map = new BMapGL.Map("container");
    var point = new BMapGL.Point(${longitude}, ${latitude});
    map.centerAndZoom(point, 15);

    var marker = new BMapGL.Marker(point);  // 创建标注
    map.addOverlay(marker);              // 将标注添加到地图中
    var opts = {
        width : 400,     // 信息窗口宽度
        // height: 60,     // 信息窗口高度
        title : "${title}" , // 信息窗口标题
        message:"${title}"
    }
    var infoWindow = new BMapGL.InfoWindow("${address}", opts);  // 创建信息窗口对象
    map.openInfoWindow(infoWindow, point); //开启信息窗口

    marker.addEventListener("click", function(){
        map.openInfoWindow(infoWindow, point); //开启信息窗口
    });
</script>
</body>
</html>

