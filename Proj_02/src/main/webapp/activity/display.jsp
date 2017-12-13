<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="..//js/jquery-3.2.1.min.js" type="text/javascript"></script>
<title>顯示頁面</title>
</head>
<body>
	<a href="../activity/schedule.jsp">建立行程</a>
	<h2>你好:${ans.account }</h2>

	<h1>顯示該會員 所有行程大綱頁面</h1>
	<!-- ActivityController.do -->
	<!-- 隱藏的表格 頁面不會顯示 -->
	<form id="solo" action="ActivityController.do" method="get">
		<input type="text" name="doWhat" value="single" style="display: none;">
		<input id="pk" type="text" name="activityID" value=""
			style="display: none;">
	</form>

	<c:forEach var="schedule" items="${allSchedule}">
		<div style="border:2px solid red;">
        <div id="target">
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
        <button id="update">修改</button>&nbsp;&nbsp;&nbsp;<button id="delete">刪除</button>
    </div>
			<hr>
	</c:forEach>



	<script>
		$(function() {
			//沒點擊按鈕
			$("#target").on(
					"click",
					function() {
						//取得所點選行程的primary key
						var pk = $(this).find(
								"tbody>tr:first-child>td:first-child").text();
						$("#pk").val(pk);
						console.log("target"+pk);
					//	$("#solo").submit();
					});
			//點擊修改按鈕
			$("#update").on(
					"click",
					function() {
						//取得所點選行程的primary key
						var pk = $(this).prev("#table").find(
								"tbody>tr:first-child>td:first-child").text();
						$("#pk").val(pk);
						console.log("update"+pk);
						//$("#solo").submit();
					});
			//點擊刪除按鈕 (要使用ajax來做)
			$("#delete").on(
					'click',
					function() {
						var pk = $(this).prev("#table").find(
								"tbody>tr:first-child>td:first-child").text();
						//告訴Controller 要做刪除動作
						$("#doWhat").val("delete");
						$("#pk").val(pk);
						console.log("delete"+pk);
					});
		});
	</script>


</body>
</html>