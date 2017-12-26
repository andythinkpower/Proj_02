<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var='mem' value="${member }" ></c:set>
	<c:choose>
		<c:when test="${not empty mem }">
			<jsp:include page="../commons/header_login.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="../commons/header.jsp"/>
		</c:otherwise>
	</c:choose>
	
		
	<h1>test</h1>
	<form action="qq.controller">
	
	<input type='submit' value='ss'>
	</form>
	
</body>
</html>