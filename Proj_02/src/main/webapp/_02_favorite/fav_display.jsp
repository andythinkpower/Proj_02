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
	<p id="member" style="display: none;" >${member.memberemail }</p>
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
	
	
	<table id="eventTable">
		<thead>
			<tr>
				<th>ImageFile</th> <!-- column1 -->
				<th>EventType</th> <!-- column2 -->
				<th>EventName</th> <!-- column3 -->
				<th>地區</th> <!-- column4 -->
				<th>IsCharge</th> <!-- column5 -->
				<th>活動時間</th> <!-- column6 -->
				<th>ShowGroupName</th> <!-- column7 -->
			</tr>
		</thead>
		<tbody>
			<!-- td插入點 -->
		</tbody>
	</table>
	

<jsp:include page="../commons/footer.jsp"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

<script>
		$(function(){
			var email =$("#member").text();
			console.log(email)
			/*$.getJSON('getallFavorites.controller', {'email':email }, function (data) {
				$.each(data, function (i, event01) {
					console.log(event01.eventID)
					$.getJSON('getallFavoritesevent.controller', {'eventid':event01.eventID }, function (data) {
						console.log(data)
					});
				});
			});
			*/
			$.getJSON('getallFavoritesevent02.controller', {'email':email }, function (data) {
				$.each(data, function (i, event01) {
				console.log(event01)
				});
			});
			
			
			
			
			
			
			
			
			
			
			
			
			
			/*
			$(".event").on('click',function(){
				pk=$(this).find(".eventID").text();				
				console.log(pk);
				$.getJSON('${pageContext.request.contextPath}/_04_EventPage/oneEvent.controller', 'eventID='+pk , function(data) {
					console.log(data);
					$.each(data, function(index, eventData) {
						var column1 = $("<td></td>").html(
							'<a href="' + eventData.eventUrl + '"><img src="' + eventData.imageFile + '"></a>');
						var column2 = $("<td></td>").text(eventData.eventTypeId);
						var column3 = $("<td></td>").text(eventData.eventName);
						var column4 = $("<td></td>").text(eventData.areaId);
						var column5 = $("<td></td>").text(eventData.isCharge);
						// 對毫秒數做轉換 ↓
						var Start = new Date(eventData.dtStart);
						var End = new Date(eventData.durationEnd);
						var Y1 = Start.getFullYear() + '-';
						var M1 = (Start.getMonth()+1 < 10 ? '0'+(Start.getMonth()+1) : Start.getMonth()+1) + '-';
						var D1 = Start.getDate() + ' ';
						var dtStart = Y1 + M1 + D1;
						var Y2 = End.getFullYear() + '-';
						var M2 = (End.getMonth()+1 < 10 ? '0'+(End.getMonth()+1) : End.getMonth()+1) + '-';
						var D2 = End.getDate() + ' ';
						var durationEnd = Y2 + M2 + D2;
						
						var column6 = $("<td></td>").text(dtStart + " ~ " + durationEnd);
						var column7 = $("<td></td>").text(eventData.showGroupName);

						var row = $('<tr></tr>').append(
								[column1, column2, column3, column4, column5, column6, column7]);
						
						$('#eventTable>tbody').append(row);
					});
				}); // JSON END
				}); */
			});
		
	</script>

</body>
</html>