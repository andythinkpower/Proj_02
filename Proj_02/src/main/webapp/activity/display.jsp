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
	<a href="../activity/schedule.jsp">建立行程</a>
	<h2>你好:${ans.account }</h2>

	<h1>顯示該會員 所有行程大綱頁面</h1>
	
	<c:forEach var="schedule" items="${allSchedule}">
		
	
		
		<table>
        <thead>
            <tr >
                <th colspan="2">${schedule.actTitle}</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${schedule.actStartDate}</td>
                <td>${schedule.clickNumber}</td>
                
            </tr>
            <tr>
                <td colspan="2">${schedule.actRegion}</td>
            </tr>
            <tr>
                <td colspan="2">${schedule.introduction}</td>
            </tr>
            <tr></tr>
            <tr></tr>
        </tbody>

    </table>
			
		
		</c:forEach>
	
	






</body>
</html>