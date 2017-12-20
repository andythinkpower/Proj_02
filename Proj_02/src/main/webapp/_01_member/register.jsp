<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
</head>
<body>

  <form action="<c:url value='/register.controller' />" method="post">
    <h3>註冊新帳號</h3>
    <div class="form-group">
         <label for="username">帳號：</label>
         <input type="text" id="email" placeholder="請輸入E-mail"
         class="" name="memberemail" value="${param.memberemail}">
         <span>${errors.erremail}</span>
       </div>
       <div class="form-group">
         <label for="password">密碼：</label>
         <input type="password" id="password" placeholder="請輸入密碼"
         class="" name="memberpassword" value="${param.memberpassword}">
         <span>${errors.errpsw}</span>
       </div>
       <div class="form-group">
         <a href="">用Facebook登入</a>
         <a href="">用Google登入</a>
       </div>
       <input class="btn btn-primary" type="submit" value="送出" />
  </form>
  
</body>
</html>