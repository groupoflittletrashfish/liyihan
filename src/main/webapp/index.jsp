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

        #title {
            width: 100%;
            height: 60px;
            border: 1px solid red;
            background: #4A5B79;
            color: white;
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
            line-height:35px;
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

        #sys {
            float: right;
            display: inline;
            margin-right: 10px;
        }

        .sys_menu {
            line-height: 60px;
            borde: 1px solid red;
            width: 100px;
            height: 20px;
            margin: 10px;
            font-family: Consolas;
            font-weight: bold
        }

        .mainMenu{
            border:1px solid red;
            margin:0px;
            height:40px;
            background: pink;
            line-height:40px;

        }
    </style>
</head>
<script type="text/javascript" src="plugs/js/jquery-1.7.2.js"></script>
<div id="title">
    <span id="company">XXX客户管理系统</span>
    <div id="sys">
        <span class="sys_menu">系统导航</span>
        <span class="sys_menu">快速导航</span>
        <span class="sys_menu">帮助中心</span>
        <span class="sys_menu">个人中心</span>
        <span class="sys_menu">安全退出</span>
    </div>
</div>
<div id="content">
    <div id="menu">
        <div id="time"></div>
        <div id="menuList"></div>
    </div>
    <div id="text"></div>
</div>
</html>

<script>
    window.setInterval(initTime,10);
    initMenu();




    //初始化时间
    function initTime() {
        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth()+1;
        var date = now.getDate();
        var h = now.getHours();
        var min = now.getMinutes();
        var sec = now.getSeconds();
        var nowTime = year + '年' + month + '月' + date + '日' + '' + h + ':' +min+':'+ sec
        $('#time').html(nowTime)
    }

    function initMenu(){
        $.ajax({
            url:'system/getMenuList',
            type:'post',
            dataType:'json',
            success:function(data){
                $(data).each(function(index,value){
                    var sonMenu=value.sonMenu;
                    var ul=$('<ul class="mainMenu" onclick=\'openMenu(this,'+JSON.stringify(sonMenu)+')\'></ul>');
                    $('#menuList').append(ul);
                    ul.append(value.mainMenu.menuName)
                })
            }
        })
    }

    function openMenu(obj,son){
        var flag=obj.hasAttribute('open');
        if(flag){
            obj.children("li").hide();
            return;
        }
        if(eval(son).length ==0){
            return;
        }
        $(eval(son)).each(function(index,value){
            var li=$('<li>'+value.menuName+'</li>');
            console.log(li.get(0))
            $(obj).append(li);
        })
        $(obj).attr('open',true);

    }
</script>