<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: noname
  Date: 2017/9/22
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>photoWall</title>
    <script type="text/javascript" src="../plugs/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="../plugs/js/jquery.rotate.min.js"></script>
    <style>
        #wall {
            border: 1px solid red;
            position: absolute;
            width: 1000px;
            height: 500px;
            left: 50%;
            top: 50%;
            margin-left: -500px;
            margin-top: -250px;
        }

        .pic {
            max-width: 200px;
            max-height: 200px;
        }

        #back{
            position: fixed;
            top:0px;
            left:0px;
            width:100%;
            height: 100%;
            z-index: 100001;
            background: #A4A4A6;
            opacity: 0.3;
            display:none;
        }

    </style>
</head>
<body>
<div id="wall">
    <div id="back"></div>
    <img id="bigImg"/>
    <c:forEach items="${pics}" var="p">
        <img class="pic"src="../static/pics/${p.url}">
    </c:forEach>
</div>
</body>
</html>

<script>
    $(function () {
        $("img").each(function () {
            var top = Math.random() * 500;
            var left = Math.random() * 1000;
            var index = Math.random() * 100000;
            var rotate = Math.random() * 360;
            if (top > 500 - $(this).height()) {
                top = top - $(this).height();
            }
            if (left > 1000 - $(this).width()) {
                left = left - $(this).width();
            }
            $(this).css('z-index', index).css('position', 'absolute').css('top', top).css('left', left);
            $(this).css('transform', 'rotate(' + rotate + 'deg)').attr('rotate', rotate);

            $(this).hover(function () {
                //图片还原
                $('img').stopRotate();
                restore(this);
            }, function () {
                restore(this, rotate);
            })

            $(this).click(function(){
                var im=$('#bigImg')
                $('#back').show();
                $(im).css('z-index',8888888888);
                im.attr('src',$(this).attr('src'));
                im.css('position','fixed').css('top','50%').css('left','50%');
                im.css('margin-left',-(im.width()/2)).css('margin-top',-(im.height()/2)).rotate({
                    animateTo:0,
                    duration:0
                });
                im.unbind('hover')
                var back=$('#back').not('#bigImg');
                back.click(function(){
                    $('#back').hide();
                    $('#bigImg').attr('src','');
                })
            });
        });
    })

    function restore(obj, rotate) {
        if(rotate==undefined){
            rotate=360
        }
        $(obj).rotate({
            animateTo: rotate,
            duration: 5000
        });
    }

</script>
