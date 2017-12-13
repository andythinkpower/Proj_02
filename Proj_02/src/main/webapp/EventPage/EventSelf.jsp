<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/table.css" />
<title>EventSelf</title>

</head>
<body>
<h3><a href="<c:url value="/EventPage/Event01.jsp" />">搜尋活動</a></h3>

<c:if test="${not empty select}">
		<table>
			<thead>
				<tr>
					<th>ImageFile</th>
					<th>EventName</th>
					<th>活動時間</th>
					<th>timeStart</th>
					<th>IsCharge</th>
					<th>Fee</th>
					<th>ShoppingUrl</th>
					<th>ShowGroupName</th>
					<th>ContactTel</th>
					<th>EventUrl</th>
					<th>Address</th>
					<th>YouTubeUrl</th>
					<th>vContent</th>
				</tr>
			</thead>
			<tbody>
<!-- 					<tr> -->
<%-- 						<td>${select.imageFile}</td> --%>
<%-- 						<td>${select.eventName}</td> --%>
<%-- 						<td>${select.dtStart} ~ ${select.durationEnd}</td> --%>
<%-- 						<td>${select.timeStart}</td> --%>
<%-- 						<td>${select.isCharge}</td> --%>
<%-- 						<td>${select.fee}</td> --%>
<%-- 						<td><a href="${select.shoppingUrl}">售票網址</a></td> --%>
<%-- 						<td>${select.showGroupName}</td> --%>
<%-- 						<td>${select.contactTel}</td> --%>
<%-- 						<td><a href="${select.eventUrl}">活動網址</a></td> --%>
<%-- 						<td>${select.address}</td> --%>
<%-- 						<td><a href="${select.youTubeUrl}">${select.youTubeUrl}</a></td> --%>
<%-- 						<td>${select.vcontent}</td> --%>
<!-- 					</tr> -->
				<c:forEach var="bean" items="${select}">
					<tr>
						<td><img src="${bean.imageFile}"></td>
						<td>${bean.eventName}</td>
						<td>${bean.dtStart} ~ ${bean.durationEnd}</td>
						<td>${bean.timeStart}</td>
						<td>${bean.isCharge}</td>
						<td>${bean.fee}</td>
						<td><a href="${bean.shoppingUrl}">售票網址</a></td>
						<td>${bean.showGroupName}</td>
						<td>${bean.contactTel}</td>
						<td><a href="${bean.eventUrl}">活動網址</a></td>
						<td>${bean.address}</td>
						<td><a href="${bean.youTubeUrl}">${bean.youTubeUrl}</a></td>
						<td>${bean.vcontent}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

</body>
</html>