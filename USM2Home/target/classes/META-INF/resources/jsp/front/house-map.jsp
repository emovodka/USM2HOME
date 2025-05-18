<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>House Map</title>
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
            font-family: "Arial", sans-serif;
        }
    </style>
    <script src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=F6ccffoWGKuKBZvGWNd9q8qcxGjNFL2Q"></script>
</head>
<body>
<!--<div class="info">The latest version of GL map namespace is BMapGL, you can hold the right mouse button to control map rotation and modify the tilt angle.</div>-->
<div id="container"></div>
<script type="text/javascript">
    var map = new BMapGL.Map("container");
    var point = new BMapGL.Point(${longitude}, ${latitude});
    map.centerAndZoom(point, 15);

    var marker = new BMapGL.Marker(point);  // Create marker
    map.addOverlay(marker);              // Add marker to the map
    var opts = {
        width : 400,     // Info window width
        // height: 60,     // Info window height
        title : "${title}", // Info window title
        message:"${title}"
    };
    var infoWindow = new BMapGL.InfoWindow("${address}", opts);  // Create info window object
    map.openInfoWindow(infoWindow, point); // Open info window

    marker.addEventListener("click", function(){
        map.openInfoWindow(infoWindow, point); // Open info window
    });
</script>
</body>
</html>

