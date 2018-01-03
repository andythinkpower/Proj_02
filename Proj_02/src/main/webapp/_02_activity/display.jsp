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
 <script src="../js/cookie.js" type="text/javascript"></script>
<title>顯示頁面</title>
<style>
	body {
			font-family: Microsoft JhengHei;
/* 			background-color:	#F2E6E6; */
			background-image:url('${pageContext.request.contextPath}/img/05.jpg');
			background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
		}
	
</style>

</head>
<body>
<jsp:include page="../commons/header_login.jsp"/>
	
	<!-- ActivityController.do -->
	<!-- 隱藏的表格 頁面不會顯示 -->
	<form id="solo" action="ActivityController.do" method="get">
		<input id="doWhat" type="hidden" name="doWhat" value="">
		<input id="pk" type="hidden" name="activityID" value="">
	</form>	
	<div id="wholePage">
	</div>
	<div class='fixed-bottom  float-sm-right'>
	<a href="../_02_activity/schedule.jsp"><img src="../img/add2.png" class='float-sm-right m-5' width="75"/></a>
	</div>
	<script>
	
        $(function () {
        	//取得會員主key
        	var email=Cookies.get("user");
        	console.log(email);
        	reflashPage();
        	//進入頁面 會載入資料 !!(目前尚未輸入參數 )
        	function reflashPage(){
        		$.getJSON("${pageContext.request.contextPath}/_02_activity/show.controller",{"email":email},function(data){  
             		$.each(data,function(i,v){    
             			var Start=new Date(v.actStartDate);
             			var Start = Start.getFullYear() +'-'+(Start.getMonth()+1 < 10 ? '0'+(Start.getMonth()+1) : Start.getMonth()+1) + '-'+Start.getDate();
						var title=v.actTitle;
             			if(title.length>10){
             				title=title.substr(0,10)+'...';
             			}
             			var act=$("<div class='col-4'>").html("<div class='card  target' style='width:300px;border:1px solid #BEBEBE;'><div class='actID' style='display:none;'>"+
                     			+v.activityID+"</div><img class='card-img-top show' src='${pageContext.request.contextPath}"+v.photoPath+"' alt='Card image' width='300' height='250'/>"+
                     			"<div class='card-body' style='background-color:#F2E6E6'><h4 class='card-title'>"+title+"</h4><p class='card-text'>出發日期:"+Start+"</p>"+
                     			"<div class='row float-xl-right px-2 '><button class='btn btn-info update'>修改</button><button class='btn btn-danger delete'>刪除</button></div></div></div>");   			

             			if(i%3==0){
             				container_temp=$("<div class='container'></div>");
                 			row_temp=$("<div class='row'></div>");
                 			row_temp.append(act);
                 			container_temp.append(row_temp);
                 			container_temp.append("<br>");
                 			$("#wholePage").append(container_temp);
             			}else{
             				row_temp.append(act);
             			}
           
             		});        		
            	})     	
        	}
        	
            //導向觀賞頁面
            $("body").on("click",".show",function () {
                    //取得所點選行程的primary key

                    var pk = $(this).prev().text();
                    window.location.href = '<c:url value="/_02_activity/solopage_show.jsp?activityID='+pk+'"/>' ;
                });
            //點擊修改按鈕
            $("body").on("click",".update",function () {
                    //取得所點選行程的primary key
                    var pk = $(this).parents(".target").find(".actID").text();
                    $("#doWhat").attr("value", "single");
                    $("#pk").val(pk);
                    console.log("update : " + pk);
                    $("#solo").submit();
                });
            //點擊刪除按鈕 (要使用ajax來做)
            $('body').on('click',".delete",function () {
                    var pk = $(this).parents(".target").find(".actID").text();
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
  <br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../commons/footer.jsp"/>
</body>
</html>