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
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<!-- Cookie js -->
<script src="../js/cookie.js"></script>
<title>活動專屬頁面</title>

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

	<p id="eventID" style="display: none;"><%= request.getParameter("eventID") %></p>
	<div id="temp">
		
	</div>
	<h2><a href="<c:url value="/_04_EventPage/eventSearch.jsp" />">找活動</a></h2>
	

	<input type="button" id="favorite" value="收藏" style="width:120px;height:40px;font-size:20px;background-color: orange">
	<input type="button" id="del_favorite" value="刪除收藏" style="width:120px;height:40px;font-size:20px;background-color: orange">
	<script>
        $('#favorite').click(function () {
        	//!!!!! 登入要把cookie 刪除 這個驗證才能成立
        	var user=Cookies.get("user");
        	if(user==undefined){
        		alert("請先登入");
        	}else{
        		//取得該欄位的eventID
                var pk = $("#eventID").text();
                var durationEnd=$("#durationEnd").text();
                var dtStart=$("#dtStart").text();
                var eventName=$("#eventName").text(); 
                var timeStart=$("#timeStart").text();
                var data={"eventID":pk,"durationEnd":durationEnd,"dtStart":dtStart,"eventName":eventName,"timeStart":timeStart};
                //改變按鈕狀態
                $("#favorite").text("已收藏");
                $("#favorite").attr("style", 'style="width:120px;height:40px;font-size:20px;background-color: blue"');      
                //把此欄位的eventID 存到該會員的收藏表格
                $.post('insert.controller',data);
        	}
        });
        $('#del_favorite').click(function () {
        	//取得該欄位的eventID
        	 var pk = $("#eventID").text();
        	 //改變按鈕狀態
             $("#favorite").text("已收藏");
             $("#favorite").attr("style", 'style="width:120px;height:40px;font-size:20px;background-color: blue"');      
             $.post('delete.controller',{"eventID":pk});
        });
        
        
    </script>
	
	
	<table id="eventTable">
		<thead>
			<tr>
				<th width="100px">ImageFile</th> <!-- column1 -->
				<th>EventType</th> <!-- column2 -->
				<th width="300px">EventName</th> <!-- column3 -->
				<th>活動時間</th> <!-- column4 -->
				<th>場次開始時間</th> <!-- column5 -->
				<th>IsCharge</th> <!-- column6 -->
				<th>售票網址</th> <!-- column7 -->
				<th width="300px">ShowGroupName</th> <!-- column8 -->
				<th>活動聯絡電話</th> <!-- column9 -->
				<th>活動網址</th> <!-- column10 -->
				<th>地址</th> <!-- column11 -->
				<th>更新日期</th> <!-- column12 -->
				<th width="100px">活動內容</th> <!-- column13 -->
			</tr>
		</thead>
		<tbody>
			<!-- td插入點 -->
		</tbody>
	</table>
	
	<script>
		// 開啟即執行
		$(function(){
			var user=Cookies.get("user");
			var eventID = $("#eventID").text();
			if(user!==undefined){
			$.getJSON('checkFavorites.controller',{'eventid':eventID,'email':user},function(data){
				console.log(data)	
			});
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			$('#eventTable>tbody').empty();
			$.getJSON('${pageContext.request.contextPath}/_04_EventPage/oneEvent.controller', 'eventID='+eventID , function(data) {
				console.log(data)
				$.each(data, function(index, eventData) {
					var column1 = $("<td></td>").html('<img src="' + eventData.imageFile + '">');
					var column2 = $("<td></td>").text(eventData.eventTypeId);
					var column3 = $("<td></td>").text(eventData.eventName);
					

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
					var column4 = $("<td></td>").text(dtStart + " ~ " + durationEnd);
					
					// 對毫秒數做轉換，取年月日再組裝 ↓
					var timeS = new Date(eventData.timeStart);
					var Y3 = timeS.getFullYear() + '-';
					var M3 = (timeS.getMonth()+1 < 10 ? '0'+(timeS.getMonth()+1) : timeS.getMonth()+1) + '-';
					var D3 = timeS.getDate() + ' ';
					var timeStart = Y3 + M3 + D3;
					var column5 = $("<td></td>").text(timeStart);
					
					var column6 = $("<td></td>").text(eventData.isCharge);
					var column7 = $("<td></td>").html('<a href="' + eventData.shoppingUrl + '">售票網址</a>');
					var column8 = $("<td></td>").text(eventData.showGroupName);
					var column9 = $("<td></td>").text(eventData.contactTel);
					var column10 = $("<td></td>").html('<a href="' + eventData.eventUrl + '">活動網址</a>');
					var column11 = $("<td></td>").text(eventData.address);
					
					// 對毫秒數做轉換，取年月日再組裝 ↓
					var InsertT = new Date(eventData.insertTime);
					var Y4 = InsertT.getFullYear() + '-';
					var M4 = (InsertT.getMonth()+1 < 10 ? '0'+(InsertT.getMonth()+1) : InsertT.getMonth()+1) + '-';
					var D4 = InsertT.getDate() + ' ';
					var insertTime = Y4 + M4 + D4;
					var column12 = $("<td></td>").text(eventData.insertTime);
					
					var column13 = $("<td></td>").text(eventData.vcontent);

					var row = $('<tr></tr>').append(
							[column1, column2, column3, column4, column5, column6, column7, column8, column9, column10, column11, column12, column13]);
					
					//--------Favorite使用---------
					$("#temp").append('<p id="durationEnd" style="display:none">'+durationEnd+'</p>');
					$("#temp").append('<p id="dtStart" style="display:none">'+dtStart+'</p>');
					$("#temp").append('<p id="eventName" style="display:none">'+eventData.eventName+'</p>');
					$("#temp").append('<p id="timeStart" style="display:none">'+timeStart+'</p>');
					//--------Favorite使用---------
					
					$('#eventTable>tbody').append(row);
				});
			}); // JSON END
			
		}); // 開啟即執行 END

		
	</script>
<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>