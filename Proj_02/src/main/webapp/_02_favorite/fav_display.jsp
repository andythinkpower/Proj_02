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
	<h1>收藏顯示頁面</h1>
	<c:forEach items="${event_list }" var="event">
		<table class="event" style="border: 2px solid red">
			<thead>
				<tr>
					<th>標題:${event.eventName}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<td hidden>${event.eventID }</td>
				</tr>
				<tr>
					<td>起時時間:${event.dtStart }</td>
					<td>結束時間:${event.durationEnd }</td>
				</tr>
				<tr>
					<td><img src="${ event.imageFile}" /></td>
				</tr>
			</tbody>
		</table>
		<br>

	</c:forEach>

</body>
</html>