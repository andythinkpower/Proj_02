<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<title>收藏顯示頁面</title>
<style type="text/css">
	body {
			font-family: Microsoft JhengHei;
/* 			background-color:	#F2E6E6; */
			background-image:url('${pageContext.request.contextPath}/img/OGA1IU0.jpg');
			background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
		}
div[name="event"]{
 width:300px;
 height:300px;
 border:1px solid #BEBEBE;
 float:left;
}	


div[name="eventname"]{
 width:100
 

}
div[name="eventimg"]{
width:100;
height:200;


}
#allevent{
width:80%;
margin:0 10%;


}
img[name="eventimg"]{
width:10%;
height:10%;
}
#footer {
    /* 設定footer的高度 */
     box-sizing: border-box;
    /* 設定footer絕對位置在底部 */
    position: absolute;
    /* 展開footer寬度 */
    width: 100%;
   
}

</style>


</head>
<body>
<jsp:include page="../commons/header.jsp"/>
	<p id="member" style="display: none;" >${member.memberemail }</p>
<div id='allevent'>	</div>

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
				//console.log(event01)
				var title = (event01.eventName.length>12)?(event01.eventName.substring(0,13)+"...""):event01.eventName;
				console.log(title)
				var id=event01.eventID; 
				var img=(event01.imageFile.length>5)?event01.imageFile:'../img/taipei_culture.png';
                var event=$('<div name="event">').html('<div name="eventname"><h5>'+title+'</h5></div><div name="eventimg"><img name="eventimg" src="'+
                										img+'"/></div></div>')
				console.log(event)
				$('#allevent').append(event)
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