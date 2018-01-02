
<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>維護登錄</title>
<link rel="shortcut icon" href="../img/favicon.ico.png"  type="image/x-icon"/>

<style>
input{ /*針對input作修改*/
	padding: 5px 15px;
	background: #ccc;
	border: 10 none;
	cursor: pointer; /*改變游標狀態*/
	-webkit-border-radius: 5px;
	width: 150px;
}
select { /*針對input作修改*/
	padding: 5px 15px;
	background: #ccc;
	border: 10 none;
	cursor: pointer; /*改變游標狀態*/
	-webkit-border-radius: 5px;
	width: 200px;
}
input[type="submit"] {
	background: #3498db;
	/* Standard */
	background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
	/* Firefox */
	background-image: -moz-linear-gradient(top, #3498db, #2980b9);
	background-image: -ms-linear-gradient(top, #3498db, #2980b9);
	background-image: -o-linear-gradient(top, #3498db, #2980b9);
	background-image: linear-gradient(to bottom, #3498db, #2980b9);
	-webkit-border-radius: 28;
	-moz-border-radius: 28;
	border-radius: 28px;
	font-family: Arial;
	color: #ffffff;
	font-size: 20px;
	padding: 9px 20px 10px 20px;
	text-decoration: none;
	cursor: pointer; /*改變游標狀態*/
}
</style>
</head>
<body>
<%-- <jsp:include page="/fragment/top.jsp"/> --%>
<center>  
<form Action="<c:url value='login2.dd' />" method="POST">
	<table width='330'  >
         <tr>
         	<th colspan='3'>
            	<h1>管理者登入</h1> 
         	</th>
         	<th></th>
         </tr>
         <tr>
             <td align="RIGHT" width='120'>帳號：</td>
             <td align="LEFT">
             	<input type="text" name="userId" size="10" style="background-color:#EBFF9C;">
             </td>
             <td width='120'>
             	<small>
             		<font color='red' size="-1">${ErrorMsgKey.AccountEmptyError}</font>
             	</small>
             </td>
         </tr>
         <tr>
             <td align="RIGHT"width='120'>密碼：</td>
             <td align="LEFT" >
             	<input	type="password" name="pswd"  size="10" style="background-color:#EBFF9C;">
             </td>
             <td width='120'>
             	<small>
             		<font color='red'  size="-1">${ErrorMsgKey.PasswordEmptyError}</font>
             	</small>
             </td>
         </tr>
                   
         <tr>
             <td align="center" colspan='3'>
             	<font color='red' size="-1">${ErrorMsgKey.LoginError}&nbsp;</font>
             </td>     
         </tr>
            
        <tr>
            <td colspan="3" align="center">
                  <input type="submit" value="管理者登入">
            </td>
        </tr>
	</table>        
         
</form>
</center>
</body>

</html>
