<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<title>收藏顯示頁面</title>
</head>
<body>
<jsp:include page="../commons/header.jsp"/>
	<h1>收藏顯示頁面</h1>
	<c:forEach items="${event_list }" var="event">
		<table class="event" >
			<thead>
				<tr>
					<th>標題:${event.eventName}</th>
				</tr>
			</thead>
			<tbody >
				<tr>
				<td hidden class="eventID">${event.eventID }</td>
				</tr>
				<tr>
					<td>起時時間:${event.dtStart }</td>
					<td>結束時間:${event.durationEnd }</td>
				</tr>
				<tr>
					<td><img src="${ event.imageFile}" style="width:150px;" /></td>
				</tr>
			</tbody>
		</table>
		<br>

	</c:forEach>
	

<jsp:include page="../commons/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

<script>
		$(function(){
			$(".event").on('click',function(){
				pk=$(this).find(".eventID").text();				
				console.log(pk);
				
				}); // JSON END
			});

	</script>

</body>
</html>