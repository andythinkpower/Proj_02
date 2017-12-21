<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
 
<title>顯示頁面</title>
</head>
<body>
<jsp:include page="../commons/header.jsp"/>
	<a href="../_02_activity/schedule.jsp">建立行程</a>
	<h2>你好:${member.membernickname }</h2>
	<!-- 暫時這樣取得會員email 之後要用cookie取才對 -->
	<h2 id="email" style="display:none">${member.memberemail}</h2>

	<h1></h1>
	<h1>顯示該會員 所有行程大綱頁面</h1>
	<!-- ActivityController.do -->
	<!-- 隱藏的表格 頁面不會顯示 -->
	<form id="solo" action="ActivityController.do" method="get">
		<input id="doWhat" type="hidden" name="doWhat" value="">
		<input id="pk" type="hidden" name="activityID" value="">
	</form>	
	<div id="wholePage">
	</div>
	<script>
	
        $(function () {
        	//$("#wholePage").empty();
        	reflashPage();
        	//進入頁面 會載入資料 !!(目前尚未輸入參數 )
        	function reflashPage(){
        		$.getJSON("${pageContext.request.contextPath}/_02_activity/show.controller",{"email":$("#email").text()},function(data){        		
             		$.each(data,function(i,v){    
             			var Start=new Date(v.actStartDate);
             			var Start = Start.getFullYear() + '-'+(Start.getMonth()+1 < 10 ? '0'+(Start.getMonth()+1) : Start.getMonth()+1) + '-'+Start.getDate();
    					
             			var act=$("<div style='border:2px solid red;'>").html("<div class='target'><table class='table'>"+
             					"<thead><tr><th colspan='2'>活動名稱:"+v.actTitle+"</th></tr></thead>"+
             					"<tbody><tr><td style='display:none;'>"+v.activityID+"</td><td>起始時間"+Start+"</td>"+
             					"<td>點閱率"+v.clickNumber+"</td></tr><tr><td colspan='2'>地區"+v.actRegion+"</td></tr>"+
             					"<tr><td colspan='2'>活動簡介"+v.introduction+"</td></tr></tbody></table></div>"+
             					"<button class='update'>修改</button>&nbsp;&nbsp;&nbsp;<button class='delete'>刪除</button>");    		
    					$("#wholePage").append(act);
             		});        		
            	})     	
        	}
        	
            //沒點擊按鈕
            $("body").on("click",".target",function () {
                    //取得所點選行程的primary key
                    var pk = $(this).find(
                        "tbody tr:first-child>td:first-child").text();
                    $("#doWhat").attr("value", "single");
                    $("#pk").val(pk);
                    $("#solo").submit();
                });
            //點擊修改按鈕
            $("body").on("click",".update",function () {
                    //取得所點選行程的primary key
                    var pk = $(this).prev(".target").find(
                        "tbody tr:first-child>td:first-child").text();
                    console.log("找到pk:"+pk);
                    $("#doWhat").attr("value", "single");
                    $("#pk").val(pk);
                    console.log("update : " + pk);
                    $("#solo").submit();
                });
            //點擊刪除按鈕 (要使用ajax來做)
            $('body').on('click',".delete",function () {
                    var pk = $(this).parent().find(
                        "tr:first-child>td:first-child").text();
                    $.ajax("${pageContext.request.contextPath}/_02_activity/delete.controller",{
                    	data:{"ActivityID":pk},
                    	dataType:"html",
                    	success:function(data){
                    		alert(data);
                    		$("#wholePage").empty();
                    		reflashPage();
                    	}
                    })
                });
        });
    </script>

<jsp:include page="../commons/footer.jsp"/>
</body>
</html>