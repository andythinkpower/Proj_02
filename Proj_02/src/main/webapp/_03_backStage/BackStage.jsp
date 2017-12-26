<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="_03_backStage.model.*"%>
<jsp:useBean id="productListingBookSvc" class="_03_backStage.model.EventService"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8/BIG5">
<title>維護</title>
<link rel="shortcut icon" href="../img/favicon.ico.png"  type="image/x-icon"/>

</head>

<style>
.peoplePic {
	background: #1e90ff;
	-webkit-clip-path: circle(50% at 50% 50%);
	clip-path: circle(50% at 50% 50%);
	height: 40px;
	width: 40px;
}

input[type="submit"] {
	position: relative;
	display: inline-block;
 	background: #D0EEFF;
 	border: 1px solid #99D3F5;
 	border-radius: 4px;
 	padding: 4px 12px;
 	overflow: hidden;
 	color: #1E88C7;
 	text-decoration: none;
 	text-indent: 0;
 	line-height: 20px;
}

.file {
	position: relative;
	display: inline-block;
 	background: #D0EEFF;
 	border: 1px solid #99D3F5;
 	border-radius: 4px;
 	padding: 4px 12px;
 	overflow: hidden;
 	color: #1E88C7;
 	text-decoration: none;
 	text-indent: 0;
 	line-height: 20px;
}

.file:hover {
	background: #AADFFD;
 	border-color: #78C3F3;
 	color: #004974;
 	text-decoration: none;
}

.file input {
 	position: absolute;
 	font-size: 100px;
 	right: 0;
 	top: 0;
 	opacity: 0;
}

.TrLeft{
	width:300px;
}

table{
	width:1650px;
	background-color:#CEF6F5;
 	margin-left:50px; 
	color:black;
	font-family:Microsoft JhengHei;
	border:3px black solid;
 	font-size: 16px;
}

.wire{
	padding: 8px;
	text-align: left;
	border-bottom: 2px solid #D8CEF6;
}

.sexyborder{
	width:	555px;
	border: 1px solid #0066cc;
	padding: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

</style>

<body>
<%-- 	<jsp:include page="/fragment/top.jsp" /> --%>
	<br>
	<br>
	<br>
	<br>
	<br>
<header class="intro">    
 		<div class="intro-body">         
 				
 				<a  href="Book.jsp">活動管理</a> 
<!--  				<a  href="Food.jsp">部落格管理</a>  -->
<!--  				<a  href="Interest.jsp">興趣項目管理</a>  -->
<!--  				<a  href="OrderBackList.jsp">訂單管理</a>  -->
 				<a  href="MessageList.jsp">部落格管理</a> 
 				
        </div>
    </header>
	<%-- 	<%@ include file="page2.file" %>				 --%>
</body>
</html>