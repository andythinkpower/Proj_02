<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

    停留時間:<input class="aa1" type="text"/>
    種類:<input class="aa2" type="text" />
    名稱:<input class="aa3" type="text" />
    預算:<input class="aa4" type="text" />
    
    停留時間:<input class="bb1" type="text"/>
    種類:<input class="bb2" type="text" />
    名稱:<input class="bb3" type="text" />
    預算:<input class="bb4" type="text" />
    
    停留時間:<input class="vv1" type="text"/>
    種類:<input class="vv2" type="text" />
    名稱:<input class="vv3" type="text" />
    預算:<input class="vv4" type="text" />

    <button id="sub">儲存</button>
	


	<script>
	
	 $(function () {
         var list_bean = []
		
         $("body").on('click', '#sub', function () {
             var bean = { "kinds": $(".aa1").val(), "note": $(".aa2").val(), "budgets": $(".aa3").val(), "dates": $(".aa4").val() };
             list_bean.push(bean);
             bean = { "kinds": $(".bb1").val(), "note": $(".bb2").val(), "budgets": $(".bb3").val(), "dates": $(".bb4").val() };
             list_bean.push(bean);
             bean = { "kinds": $(".vv1").val(), "note": $(".vvv2").val(), "budgets": $(".vv3").val(), "dates": $(".vv4").val() };
             list_bean.push(bean);
             
            var test= JSON.stringify(list_bean);
            
            
            $.ajax({url:'download.do',
            		data:{"list":test},
            		type:"get"});
            
            
             console.log(test);
             console.log(list_bean);
//              $.getJSON("download.do",{"list_bean":test},function(data){
//             	 console.log(data)
//              })
         })

     })
     
	</script>
</body>
</html>