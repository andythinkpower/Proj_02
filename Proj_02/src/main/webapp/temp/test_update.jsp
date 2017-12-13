<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>修改資料</h1>
	<form action="test.do">
		activityID(必填):<input type="text" name="primary_key"><br>
	<input type="submit" value="送出">	
	</form>	
	<hr><hr>
	<form action="update.do">
	<input name="activityID" value="${original.activityID}" style="display:none;">
	<input name="privacy" value="${original.privacy}" style="display:none;">
	<input name="clickNumber" value="${original.clickNumber}" style="display:none;">
	<input name="memberID" value="${original.memberID}" style="display:none;">
		起始日期:<input type="text" name="actStartDate" value="${original.actStartDate}"><br>
		地區:<input type="text" name="actRegion" value="${original.actRegion}"><br>
		標題:<input type="text" name="actTitle" value="${original.actTitle}"><br>
		簡介:<input type="text" name="introduction" value="${original.introduction}"><br>
		<input type="submit" value="修改">	
	</form>	
	
	結果:<h3>${ans}</h3><br>
	
</body>
</html>