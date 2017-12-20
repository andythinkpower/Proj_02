<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 馬老師 CSS -->
<link rel="stylesheet" type="text/css" href="../css/table.css" />
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- DataTables -->
<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />

<title>活動專屬頁面</title>

</head>
<body>

	<p id="eventID" style="display: none;"><%= request.getParameter("eventID") %></p>
	
	<h2><a href="<c:url value="/_04_EventPage/eventSearch.jsp" />">找活動</a></h2>
	
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
	
	<script>
		// 開啟即執行
		$(function(){
			
			var eventID = $("#eventID").text();
			$('#eventTable>tbody').empty();
			$.getJSON('${pageContext.request.contextPath}/_04_EventPage/oneEvent.controller', 'eventID='+eventID , function(data) {
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
			
		}); // 開啟即執行function END
		
	</script>

</body>
</html>