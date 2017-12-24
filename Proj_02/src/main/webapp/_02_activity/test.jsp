<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test</h1>
	<div>
		<h2>顯示照片 :${pageContext.request.contextPath}/uploadFile/test.jpg</h2>
		<img src="${pageContext.request.contextPath}/uploadFile/test.jpg" style="width:200px">
	</div>
	<form action="qq.do">
	
	 <input type="text" name="doWhat" value="update">
		<input type="submit" value="提交"><br>
	</form>
</body>
</html>