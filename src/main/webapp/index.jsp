<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>yihan</title>
    <style>
        #background {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            z-index: -1;
        }

        #content{
            z-index: 1;
            position: fixed;
            margin-left:50%;
            width:300px;
            left:-150px;
            top:150px;
            text-align: center;
        }

        .menu{
            display: block;
            font-family: "Consolas";
            font-size: 25px;
            letter-spacing: 5px;
            color:#FF00FE;
            font-weight:bold;
            margin-bottom: 10px;
        }
    </style>
</head>
<script type="text/javascript" src="plugs/js/jquery-1.7.2.js"></script>

<body>
<img id="background" src="static/img/background.png">
<div id="content">
    <span class="menu" onclick="ToPhoto()">李薏菡的小照片</span>
    <span class="menu">算术题目</span>
</div>
</body>
<script>
    function ToPhoto(){
        location.href="view/toPhoto";
    }
</script>
</html>