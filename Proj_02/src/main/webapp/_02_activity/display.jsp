<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>顯示頁面</title>
</head>
<body>
<jsp:include page="../commons/header.jsp"/>
	<a href="../_02_activity/schedule.jsp">建立行程</a>
	<h2>你好:${user_member.email }</h2>


	<h1>顯示該會員 所有行程大綱頁面</h1>
	<!-- ActivityController.do -->
	<!-- 隱藏的表格 頁面不會顯示 -->
	<form id="solo" action="ActivityController.do" method="get">
		<input id="doWhat" type="text" name="doWhat" value="" style="display: none;">
		<input id="pk" type="text" name="activityID" value=""
			style="display: none;">
	</form>

	<c:forEach var="schedule" items="${allSchedule}">
		<div style="border:2px solid red;">
        <div  class="target">
            <table id="table">
                <thead>
                    <tr>
                        <th colspan="2">${schedule.actTitle}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="display:none;">${schedule.activityID}</td>
                        <td>${schedule.actStartDate}</td>
                        <td>${schedule.clickNumber}</td>
                    </tr>
                    <tr>
                        <td colspan="2">${schedule.actRegion}</td>
                    </tr>
                    <tr>
                        <td colspan="2">${schedule.introduction}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <button class="update">修改</button>&nbsp;&nbsp;&nbsp;<button class="delete">刪除</button>
    </div>
			<hr>
	</c:forEach>



	<script>
        $(function () {
            //沒點擊按鈕
            $(".target").on("click",function () {
                    //取得所點選行程的primary key
                    var pk = $(this).find(
                        "tr:first-child>td:first-child").text();
                    $("#doWhat").attr("value", "single");
                    $("#pk").val(pk);
                    console.log("target : " + pk);
                    $("#solo").submit();
                });
            //點擊修改按鈕
            $(".update").on(
                "click",
                function () {
                    //取得所點選行程的primary key
                    var pk = $(this).prev("div").find(
                        "tr:first-child>td:first-child").text();
                    $("#doWhat").attr("value", "single");
                    $("#pk").val(pk);
                    console.log("update : " + pk);
                    $("#solo").submit();
                });
            //點擊刪除按鈕 (要使用ajax來做)
            $(".delete").on('click',function () {
                    var pk = $(this).parent().find(
                        "tr:first-child>td:first-child").text();
                    $("#doWhat").attr("value", "delete");
                    $("#pk").val(pk);
                    $("#solo").submit();
                    //告訴Controller 要做刪除動作 練習用AJAX
                    //type 先暫時用get練習 之後要嘗試轉成delete 還不會寫
//                    $.ajax({
//                 	   //把要刪除的行程primary key傳給後端
//                 	   'data':{"primary_key":pk},
//                 	   'type':'GET',
//                 	   'url':'test.do'
//                    }).done(function(datas){
//                 	   console.log("看看迴圈");
//                 	   console.log(datas);
//                 	   $.each(datas,function(i,v){
//                 		   console.log("測試結果:"+v);
                		  
//                 	   });
//                    });
                });
        });
    </script>

<jsp:include page="../commons/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>