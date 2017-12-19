<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function () {
    //預設星期格式為yy-mm-dd
    $.datepicker.setDefaults({ dateFormat: "yy-mm-dd" });
    //設定日期範圍
    $("#date").datepicker({ minDate: 0, maxDate: "+5M +10D" });         
});	
</script>
<title>create_activity</title>
</head>
<body>

	<h1>建立行程-1</h1>
	<!-- 利用JavaScript 先做一些簡易判斷 符合才可送出(未完成)-->
	<form action="ActivityController.do" method="post" >
	
	<input type="text" name="doWhat" value="schedule" style="display:none;">
		起始時間:<input type="text" name="actStartDate" id="date"> <br><!-- 使用jQuery ui Datepicker  -->
		地區:<input type="text" name="actRegion"> <br> 
		活動標題:<input type="text" name="actTitle">
		<hr>
		上傳圖片:
<!-- 		<input type="file" id="file1"  name="ggggg"> -->
		<hr>
		簡介:
		<textarea rows="20px" cols="40px" name="introduction"></textarea>
		<br> <input type="submit" value="下一步">
	</form>

</body>
</html>