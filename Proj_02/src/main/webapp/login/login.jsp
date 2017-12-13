<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>會員登入</h1>
	<form action="Login.do" >
	帳號:<input type="text" name="account" value="${param.account}">${errors.account} <br>
	密碼:<input type="text" name="psd" value="${param.psd}">${errors.psd}<br>
	<input type="submit" value="送出">${errors.DB }
	</form>
	

</body>
</html>