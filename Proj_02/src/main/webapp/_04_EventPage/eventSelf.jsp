<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- jQuery-ui -->
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jQuery-ui CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<!-- showEvent CSS -->
<!-- <link rel="stylesheet" href="../css/showEvent.css"> -->
<!-- 圖標 -->
<script src="https://use.fontawesome.com/8af200eebc.js"></script>
<!-- 分頁 -->
<script src="../js/jquery.twbsPagination.js"></script>
<!-- Cookie js -->
<script src="../js/cookie.js"></script>

<title>活動專屬頁面</title>

<style>

body {
	background-image: url('../img/event_background.png');
	background-attachment:fixed;
	background-size: cover;
}

#bigBox{
	width: 1450px;
    height: 1095px;
    margin: 0px auto 20px auto;
}

#eventInfo {
	width: 1450px;
    height: 750px;
	margin: 0px auto 20px auto;
    background-color: navajowhite;
    border: 5px solid red;
}

.titleBox {
    width: 1200px;
    height: 100px;
    margin: 15px 0px 0px 0px;
    float: left;
    box-sizing: border-box;
    /*border: 3px solid #46A3FF;*/
}

#type {
    font-size: 20px;
	color: blue;
    text-align: center;
    width: 80px;
    margin: 20px;
    float: left;
}

#title {
    font-size: 30px;
    font-weight: bolder;
	color: red;
    width: 85%;
    height: 90px;
    margin: 15px;
    float: left;
    text-align: center;
    text-overflow: ellipsis;
    overflow: hidden;
	white-space: nowrap;
}

.collectBox {
    width: 225px;
    height: 100px;
    margin: 15px 0px 0px 0px;
    float: right;
    box-sizing: border-box;
    /*border: 3px solid #46A3FF;*/
}

.dayBox {
    width: 200px;
    height: 60px;
    margin: 0px 10px 0px 0px;
    float: right;
    box-sizing: border-box;
    /*border: 3px solid #46A3FF;*/
}

.collect , .nonCollect , #days {
    font-size: 20px;
    font-weight: bolder;
    width: 80%;
    height: 50px;
    float: right;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 5px;
}

.collect {
    color: #00E3E3;
    margin: 10px 25px 0px 0px;
    background-color: #CCFF80;
    box-sizing: border-box;
    border: 1.5px solid #8CEA00;
}

.nonCollect {
    color: #00E3E3;
    margin: 10px 25px 0px 0px;
    background-color: gray;
    box-sizing: border-box;
    border: 1.5px solid #8CEA00;
}

#days {
    color: white;
    margin: 0px 25px 0px 0px;
    background-color: #FF5151;
}

.picBox {
    width: 40%;
    height: 75%;
    margin: 20px 0px 0px 20px;
    float: left;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    /*border: 5px solid red;*/
}

#ownImg {
    width: 500px;
    height: 500px;
    float: left;
}

.mark {
    width: 30px;
    float: left;
    background-color: navajowhite;
}

.date , .detail {
    font-size: 22px;
    height: 35px;
    float: left;
    box-sizing: border-box;
    /*border: 2px solid green;*/
}

.date {
    width: 595px;
    margin: 20px 0px 5px 25px;
    /*border: 2px solid green;*/
}

.detail {
    width: 800px;
    margin: 5px 0px 0px 25px;
    /*border: 2px solid green;*/
}

.mapBox {
    width: 350px;
    height: 258px;
    margin: 15px 0px 0px 25px;
    float: left;
    box-sizing: border-box;
    /*border: 5px solid red;*/
}

.hollowArea {
    width: 400px;
    height: 160px;
    margin: 15px 25px 0px 0px;
    float: right;
    box-sizing: border-box;
    /*border: 5px solid green;*/
}

.insertTime , .buttonBox {
    width: 400px;
    height: 40px;
    margin: 0px 25px 0px 0px;
    float: right;
    box-sizing: border-box;
    /*border: 5px solid green;*/
}

#report {
    color: white;
    font-size: 20px;
    width: 30%;
    height: 50px;
    margin: 0px 0px 0px 0px;
    float: right;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 5px;
    background-color: darkgray;
}

#contextBox {
    width: 1450px;
    height: 400px;
	margin: 60px auto 20px auto;
    float: left;
    background-color: navajowhite;
    border: 5px solid red;
}

#contextText {
	font-size: 30px;
	font-weight: bolder;
    width: 1400px;
    height: 50px;
	margin: 0px 0px 0px 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    vertical-align: middle;
    /*border: 5px solid red;*/
}

#context {
	font-size: 25px;
    width: 1400px;
    height: 400px;
	margin: 0px 0px 0px 20px;
    /*border: 5px solid red;*/
}

</style>

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
	<p id="member" style="display: none;" >${member.memberemail }</p>
	<p id="eventID" style="display: none;"><%= request.getParameter("eventID") %></p>
	<div id="temp">
	    
	</div>
	<div id="bigBox">
	<div id="eventInfo">

		<div class="titleBox">
			<span id="type"></span>
			<div id="title"></div>
		</div>
		
		<div class="collectBox">
<!-- 			<div class="collect" id="favorite">加入收藏</div> -->
<!-- 			<button class="collect" id="favorite">加入收藏</button> -->
<!-- 			<input type="button" class="collect" id="favorite" value="加入收藏"> -->
			<button type="button"  id="favorite"  class="btn btn-success">收藏</button>
			<button type="button"  id="del_favorite"  class="btn btn-secondary disabled">取消收藏</button><br>
			<i class="fa fa-heart" aria-hidden="true"></i>&nbsp;&nbsp;收藏人數：&nbsp;<span></span>&nbsp;人
		</div>
		
		<div class="dayBox">
			<div id="days"></div>
		</div>
		
		<div class="picBox">
			<img id="ownImg" src="http://cultureexpress.taipei/Files/Event/LogoTemp/419a297b81c04b3789b53516eb31fb3d.jpg" />
		</div>
		
		<div class="date">
			<div class="mark"><i class="fa fa-calendar-check-o" aria-hidden="true"></i></div><span></span>
		</div>
		
		<div class="detail">
			<div class="mark"><i class="fa fa-clock-o" aria-hidden="true"></i></div><span id="startTime"></span>
		</div>
		
		<div class="detail">
			<div class="mark"><i class="fa fa-usd fa-lg" aria-hidden="true"></i></div><span id="charge"></span>
		</div>
		
		<div class="detail">
			<div class="mark"><i class="fa fa-user" aria-hidden="true"></i></div><span id="sponsor"></span>
		</div>
		
		<div class="detail">
			<div class="mark"><i class="fa fa-phone fa-lg" aria-hidden="true"></i></div><span id="phone"></span>
		</div>
		
		<div class="detail">
			<div class="mark"><i class="fa fa-share" aria-hidden="true"></i></div>&nbsp;&nbsp;活動網址：<a id="url"></a>
		</div>
		
		<div class="detail">
		    <div class="mark"><i class="fa fa-map-marker fa-lg" aria-hidden="true"></i></div><span id="address"></span>
		</div>
		
		<div class="mapBox">
			<iframe width=100% height=100% frameborder="0" style="border:0" allowfullscreen></iframe>
		</div>
		
		<div class="hollowArea"></div>
			
		<div class="insertTime">
			<span style="float: right"></span>
		</div>
		
		<div class="buttonBox">
			<div id="report">檢舉 / 報錯</div>
		</div>
		
		<div id="contextBox">
			<div id="contextText">詳細內容：</div>
			<div id="context"></div>
		</div>
	
	</div>
	</div>
	
	
	
	<script>
		// 開啟即執行
		$(function(){
			
			var user =$("#member").text();
			var eventID = $("#eventID").text();
			var collection=true;
			if(user.length!=0){
			$.get('checkFavorites.controller',{'eventid':eventID,'email':user},function(data){
				if(data.toString() == ("collectioned")){
				collection=false;
				$('#favorite').text("已收藏")
				$('#favorite').attr("class","btn btn-warning disabled")
				$('#del_favorite').attr("class","btn btn-danger active")
				};
			});
			}
		   $('#favorite').click(function () {
		        if(user.length!=0){
		        	if(collection==true){
			        	var pk = $("#eventID").text();
			            var durationEnd=$("#durationEnd").text();
			            var dtStart=$("#dtStart").text();
			            var eventName=$("#eventName").text(); 
			            var timeStart=$("#timeStart").text();
			            var data={"eventID":pk,"durationEnd":durationEnd,"dtStart":dtStart,"eventName":eventName,"timeStart":timeStart};
			            $.post('insert.controller',data);  
			            $('#favorite').text("已收藏")
						$('#favorite').attr("class","btn btn-warning disabled")
						$('#del_favorite').attr("class","btn btn-danger active")
			            collection=false;
			            var nowCount = $('.collectBox span').text();
			            $('.collectBox span').text(parseInt(nowCount)+1);
		        	}
	        	} else {
	        		alert("請先登入會員!!")
	        	}
		    });
		    $('#del_favorite').click(function () {
	    		 if(collection==false){
	    			 $.post('disFavorite.controller',{'eventid':eventID,'email':user},function(data){
		    			$('#favorite').text("收藏")
		    			$('#favorite').attr("class","btn btn-success active")	 
		    			$('#del_favorite').attr("class","btn btn-danger disabled")
		    			collection=true;
		    			var nowCount = $('.collectBox span').text();
			            $('.collectBox span').text(parseInt(nowCount)-1);
	    			 });
	    		 }
		    });
		    
			
			$.getJSON('${pageContext.request.contextPath}/_04_EventPage/oneEvent.controller', 'eventID='+eventID , function(data) {
				$.each(data, function(index, eventData) {
					
					$('#type').append('[&nbsp;' + eventData.eventTypeId + '&nbsp;]');
					$('#title').append(eventData.eventName);
					$('.collectBox span').append(eventData.collectionCount)
						// 計算天數差
						var daysdiff = (eventData.durationEnd - new Date().getTime())/86400000;
						if ( daysdiff < 0 ) {
							var daysdiff = 0;
						} else {
							var daysdiff = Math.floor(daysdiff) + 1;
						};
					$('#days').append('還剩&nbsp;' + daysdiff + '&nbsp;天');
					// 對沒有提供圖片的活動給予圖片，else對圖片失效的連結做處理
					if (eventData.imageFile == 'null') {
						$('#ownImg').attr('src' , '../img/taipei_culture.png');
					} else {
						$('#ownImg').attr('src' , eventData.imageFile).attr('onerror' , 'javascript:this.src=&apos;../img/taipei_culture.png&apos;');
					};
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
						var ts = new Date(eventData.timeStart);
						var tsH = ts.getHours() + ':';
						var tsM = ts.getMinutes();
						var timeStartHM = tsH + tsM;
						var Y3 = ts.getFullYear() + '-';
						var M3 = (ts.getMonth()+1 < 10 ? '0'+(ts.getMonth()+1) : ts.getMonth()+1) + '-';
						var D3 = ts.getDate() + ' ';
						var timeStart = Y3 + M3 + D3;
						var Insert = new Date(eventData.insertTime);
						var Y4 = Insert.getFullYear() + '-';
						var M4 = (Insert.getMonth()+1 < 10 ? '0'+(Insert.getMonth()+1) : Insert.getMonth()+1) + '-';
						var D4 = Insert.getDate() + ' ';
						var insertTime = Y4 + M4 + D4;
					$('.date span').append('&nbsp;&nbsp;活動時間：' + dtStart + ' ~ ' + durationEnd);
					if (timeStartHM == '0:0') {
						$('#startTime').append('&nbsp;&nbsp;場次時間：');
					} else {
						$('#startTime').append('&nbsp;&nbsp;場次時間：' + timeStartHM);
					};
				if (eventData.isCharge == '免費') {
					$('#charge').append('&nbsp;&nbsp;活動費用：免費');
				} else if (eventData.isCharge == '收費') {
					if (eventData.fee == '0' || eventData.fee == 'null' || eventData.fee == '免費' || eventData.fee == '網址' || eventData.fee == '詳見內文' || eventData.fee == '詳情請見連結') {
						$('#charge').append('&nbsp;&nbsp;活動費用：詳見官方網站');
					} else {
						$('#charge').append('&nbsp;&nbsp;活動費用：' + eventData.fee);
					};
				};
				$('#sponsor').append('&nbsp;&nbsp;主辦單位：' + eventData.showGroupName);
				$('#phone').append('&nbsp;&nbsp;聯絡電話：' + eventData.contactTel);
				if (eventData.eventUrl == 'null') {
					$('#url').text('');
				} else {
					$('#url').attr('href' , eventData.eventUrl).text('由此去');
				};
				$('#address').append('&nbsp;&nbsp;活動地點：' + eventData.address);
				
				if (eventData.latitude != 'null' && eventData.longitude != 'null') {
					$('.mapBox iframe').attr('src' , 'http://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=' + eventData.latitude + ',' + eventData.longitude + '&z=15&output=embed');
				} else {
					$('.mapBox iframe').attr('src' , 'http://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=台北市' + eventData.address + '&z=15&output=embed');
				};
				
				$('.insertTime span').append('更新時間：' + insertTime);
				$('#context').append(eventData.vcontent);
				
				//--------Favorite使用---------
				$("#temp").append('<p id="durationEnd" style="display:none">'+durationEnd+'</p>');
				$("#temp").append('<p id="dtStart" style="display:none">'+dtStart+'</p>');
				$("#temp").append('<p id="eventName" style="display:none">'+eventData.eventName+'</p>');
				$("#temp").append('<p id="timeStart" style="display:none">'+timeStart+'</p>');
				//--------Favorite使用---------
					
				});
			}); // JSON END
		}); // 開啟即執行 END
		
		

		
		
		
	</script>
<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>