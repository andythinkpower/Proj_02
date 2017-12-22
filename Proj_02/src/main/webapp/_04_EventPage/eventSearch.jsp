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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<title>尋找活動</title>

</head>
<body>
<jsp:include page="/commons/header.jsp"></jsp:include>
	<h2><a href="<c:url value="/_04_EventPage/eventSearch.jsp" />">找活動</a></h2>
	
	<form name="selectForm">
		<fieldset>
			<legend>活動類型</legend>

				<input type="checkbox" id="全部" name="manyTypes" value="休閒展覽音樂表演研習親子影視" checked="checked" onclick="switchToAll(this.form)">全部
				<input type="checkbox" id="休閒" name="eventType" value="休閒" onclick="changeTypes(this.form)">休閒
				<input type="checkbox" id="展覽" name="eventType" value="展覽" onclick="changeTypes(this.form)">展覽
				<input type="checkbox" id="音樂" name="eventType" value="音樂" onclick="changeTypes(this.form)">音樂
				<input type="checkbox" id="表演" name="eventType" value="表演" onclick="changeTypes(this.form)">表演
				<input type="checkbox" id="研習" name="eventType" value="研習" onclick="changeTypes(this.form)">研習
				<input type="checkbox" id="親子" name="eventType" value="親子" onclick="changeTypes(this.form)">親子
				<input type="checkbox" id="影視" name="eventType" value="影視" onclick="changeTypes(this.form)">影視
				<span id="count" ></span>
		</fieldset>
	</form>
	
	<table id="eventTable">
		<thead>
			<tr>
				<th width="100px">ImageFile</th> <!-- column1 -->
				<th>EventType</th> <!-- column2 -->
				<th width="300px">EventName</th> <!-- column3 -->
				<th>地區</th> <!-- column4 -->
				<th>IsCharge</th> <!-- column5 -->
				<th>活動時間</th> <!-- column6 -->
				<th width="300px">ShowGroupName</th> <!-- column7 -->
			</tr>
		</thead>
		<tbody>
			<!-- td插入點 -->
		</tbody>
	</table>
	
	<script>
		// 開啟即執行
		$(function(){
			selectEvent(selectForm);
		}); // 開啟即執行 END
		
		// --- 活動類型切換 ---
		function switchToAll(selectForm){
			$(':checkbox[name="manyTypes"]').prop('checked',true);
			$(':checkbox[name="eventType"]').prop('checked',false);
			selectEvent(selectForm);
		}; // switchToAll END
		
		// --- 活動類型切換 ---
		function changeTypes(selectForm){
			
			var selectAll = $('#全部').prop('checked');
			var leisure = $('#休閒 ').prop('checked');
			var exhibit = $('#展覽 ').prop('checked');
			var music = $('#音樂 ').prop('checked');
			var show = $('#表演 ').prop('checked');
			var study = $('#研習 ').prop('checked');
			var family = $('#親子 ').prop('checked');
			var video = $('#影視 ').prop('checked');
			
			if ( leisure == true || exhibit == true || music == true || show == true || study == true || family == true || video == true ) {
				$(':checkbox[name="manyTypes"]').prop('checked',false);
				selectEvent(selectForm);
			} else if ( leisure == false && exhibit == false && music == false && show == false && study == false && family == false && video == false ) {
				$(':checkbox[name="manyTypes"]').prop('checked',true);
				selectEvent(selectForm);
			}; // if END
		}; // changeTypes END
		
		
		// 送controller撈資料
		function selectEvent(selectForm){
			
			var types = [];
			$(':checked[type="checkbox"]').each(function(){
				var typeString = $(this).val();
				types.push(typeString);
			});
			
			$('#eventTable>tbody').empty();
			
			$.getJSON('${pageContext.request.contextPath}/_04_EventPage/searchEvent.controller', 'newTypes='+types, function(data) {
				$.each(data, function(index, eventData) {
					var column1 = $("<td></td>").html('<a href="<c:url value="/_04_EventPage/eventSelf.jsp?eventID=' + eventData.eventID + '"/>"><img width=75px src="' + eventData.imageFile + '" title="' + eventData.briefIntroduction + '"></a>');
					var column2 = $("<td></td>").text(eventData.eventTypeId);
					var column3 = $('<td class="count"></td>').html('<a href="<c:url value="/_04_EventPage/eventSelf.jsp?eventID=' + eventData.eventID + '"/>">' + eventData.eventName + '</a>');
					var column4 = $("<td></td>").text(eventData.areaId);
					var column5 = $("<td></td>").text(eventData.isCharge);
					// 對毫秒數做轉換，取年月日再組裝 ↓
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
				// 取得搜尋筆數
				var count = $('.count').length;
				$('#count').empty().append('&emsp;&emsp;&emsp;共有' + count + '筆活動');
			}); // JSON END
		}; // changeType END

		
//			// --- DataTable寫法(未完成) ---
//			$('#eventTable').DataTable({
//	             "ajax": "Event01.controller",
//	             "columns": [
//					 // URL字串轉顯示圖片 ↓
//	            	 { "data": "imageFile",
//					   "render": function (data) {
//					 // 顯示非null ↓
//					 //	if(type === "display"){return '<img width="75px" src="' + data + '">';}
//					 //	else {return data;}
//							return '<img width="75px" src="' + data + '">';},
//	                 }, // column1
                 
//// 	                 { "data": "imageFile" }, // column1
//	                 { "data": "eventTypeId" }, // column2
                 
//					 // URL字串轉超連結 ↓
//	            	 { "data": "eventUrl",
//	            	   "render": function (data) {
//							return '<a href="' + data + '">' + data + '</a>';
//	            	   }
//	            	 }, // column3

//// 	                 { "data": "eventName" }, // column3
//	                 { "data": "areaId" }, // column4
//	                 { "data": "isCharge" }, // column5
//	                 { "data": "dtStart" }, // column6-a
//// 	                 { "data": "durationEnd" }, // column-b
//	                 { "data": "showGroupName" }, // column7
//	             ]
//			}); // DataTable END
		
	</script>
<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>