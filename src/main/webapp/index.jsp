<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户管理系统</title>
    <style>
        html, body {
            padding: 0;
            margin: 0;
            overflow: hidden;
        }

        * {
            margin: 0px;
            padding: 0px;
        }

        #title {
            width: 100%;
            height: 60px;
            border: 1px solid red;
            background: #4A5B79;
            color: white;
            line-height: 60px;
        }

        #content {
            position: fixed;
            top: 60px;
            bottom: 0px;
            width: 100%;
            border: 1px solid blue;
        }

        #menu {
            postion: fixed;
            top: 60px;
            left: 0px;
            bottom: 0px;
            width: 250px;
            height: 100%;
            border: 1px solid mediumvioletred;
        }

        #time {
            height: 35px;
            border: 1px solid blue;
            line-height: 35px;
            text-align: center;
            background: palegreen;
        }

        #company {
            font-size: 20px;
            font-weight: bolder;
            font-family: Consolas;
            line-height: 60px;
            margin-left: 10px;
        }

        a {
            width: 100px;
            font-family: Consolas;
            text-decoration: none;
            color: white;
            font-weight: bold;
            display: block;
        }

        a:hover {
            color: yellow;
            background-color: #5bc0de;
        }


        #sys {
            list-style: none;
            float: right;
            padding: 0px;
            color: red;
            marhin-top: 0px;
            padding-top: 0px;
            line-height: 60px;
            margin-right: 10px;
        }

        #sys > li {
            float: left;
            padding: 0px;
            text-align: center;
        }

        ul li ul {
            list-style: none;
            position:absolute;
            top:60px;
            z-index:6;
            display: none;
        }

        ul li ul li {
            line-height: 60px;
            margin-top: 5px;
            display: block;
            background-color:#4A5B79 ;
            margin:0px;
        }

        ul li:hover ul{display: block}

        #text>ol{
            position: absolute;
            top:40px;
            left:0px;
            list-style: none;
            width: 250px;
        }

        #text>ol li{
            text-align: center;
            background-color: gray;
            width:250px;
            margin-top:0px;
            line-height: 50px;
            border-bottom:0;
            text-align: left;
            /*padding-right:-40px;*/
        }

        #text>ol li:hover{
            background-color: yellow;
            cursor: pointer;
        }

        ol>li{
            box-shadow:5px 5px 5px gray ;
            padding:0px;
            margin:0px;
        }

        ol{
            list-style: none;
        }

        img{
            width:10px;
            height:10px;
            line-height:50px;
            margin-right:30px;
        }

        .empty{
            margin-right:50px;
        }

        .sonMenu{
            width:100%;
            text-align: center;
            color: rebeccapurple;
            display: block;
        }



    </style>
</head>
<script type="text/javascript" src="plugs/js/jquery-1.7.2.js"></script>
<div id="title">
    <span id="company">XXX客户管理系统</span>
    <ul id="sys">
        <li><a class="sys_menu" href="javascript:void(0)">系统导航</a>
            <ul>
                <li><a href="#">导航1</a></li>
                <li><a href="http://www.baidu.com">百度</a></li>
            </ul>
        </li>
        <li><a class="sys_menu" href="javascript:void(0)">快速导航</a>
            <ul>
                <li><a href="javascript:void(0)">快速导航</a></li>
                <li><a href="javascript:void(0)">快速导航</a></li>
            </ul>
        </li>
        <li><a class="sys_menu" href="javascript:void(0)">帮助中心</a></li>
        <li><a class="sys_menu" href="javascript:void(0)">个人中心</a></li>
        <li><a class="sys_menu" href="javascript:void(0)">安全退出</a></li>
    </ul>
</div>
<div id="content">
    <div id="menu">
        <div id="time"></div>
        <div id="menuList"></div>
    </div>
    <div id="text">
        <ol>

        </ol>
    </div>
</div>

</html>

<script>
    window.setInterval(initTime, 10);
    initMenu();


    //初始化时间
    function initTime() {
        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth() + 1;
        var date = now.getDate();
        var h = now.getHours();
        var min = now.getMinutes();
        var sec = now.getSeconds();
        var nowTime = year + '年' + month + '月' + date + '日' + '' + h + ':' + min + ':' + sec
        $('#time').html(nowTime)
    }

    function initMenu() {
        $.ajax({
            url: 'system/getMenuList',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                $(data).each(function (index, value) {
                    var li=$('<li onclick="openMenu(this)"><img src="static/pics/down.png"/>'+value.mainMenu.menuName+'</li>');
                    $('#text>ol').append(li);
                    var sonMenu=value.sonMenu;
                    if(sonMenu.length>0){
                        var ol=$('<ol></ol>');
                        $(sonMenu).each(function(index,value){
                            var li=$('<li><span class="empty"/><span class="sonMenu" onclick="loadUrl('+value.url+')">'+value.menuName+'</span></li>');
                            ol.append(li);
                        })
                        ol.css('display','none');
                        li.append(ol);
                    }
                })
            }
        })
    }

    function openMenu(obj) {
        $(obj).children('ol').toggle();
    }

    function loadUrl(url){
        alert(url)
        event.stopPropagation();
    }
</script>