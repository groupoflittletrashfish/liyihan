<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
</head>
<script type="text/javascript" src="plugs/js/jquery-1.7.2.js"></script>

<body>
<c:forEach begin="1" end="10">
    <div class="cal">
11111111111111111111111111111111111111
    </div>
</c:forEach>

<div>
    <button onclick="res()">提交答案</button>
</div>
</body>
<script>
    var total=0;
    $('.cal').each(function (index, value) {
        var span=$('<span></span>');
        var one = Math.round(Math.random() * 10);
        var two = Math.round(Math.random() * 100);
        span.html(one + '+' + two + '=');
        $(this).append(span);
        var input = $('<input type="text" class="res">')
        $(this).append(input)
    })

    $('.res').blur(function(){
        var x=$(this).prev().html();
        var y=x.substring(0,x.length-1);
        var arr=y.split("+");
        var r=parseInt(arr[0])+parseInt(arr[1]);
        var z=$(this).val();
        if(r==z){
            total++;
        }else{
            $(this).attr('aaa','bbb');
        }
        $(this).attr('disabled','disabled');
    })

    function res(){
//        alert(1111111)
        if(total==10){
            alert(total+'分，终于成功毕业了')
        }else if(total>=9&&total<10){
            alert(total+'分，快毕业了')
        }else if(total>6&&total<9){
            alert(total+'分，还是不及格')
        }else{
            alert(total+'分，笨老太婆')
        }

        $('input[aaa=bbb]').css('border','1px solid red');
    }

</script>
</html>