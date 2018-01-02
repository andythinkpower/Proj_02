<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- jQuery-ui -->
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jQuery-ui CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- bootstrap -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<!-- eventSelf CSS -->
<link rel="stylesheet" href="../css/eventSelf.css">
<!-- 圖標 -->
<script src="https://use.fontawesome.com/8af200eebc.js"></script>
<!-- 分頁 -->
<script src="../js/jquery.twbsPagination.js"></script>
<!-- Cookie js -->
<script src="../js/cookie.js"></script>

<title></title>

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
	<p id="member" style="display: none;" >${member.memberemail}</p>
	<p id="eventID" style="display: none;"><%= request.getParameter("eventID") %></p>
	<div id="temp"></div>
	<div id="bigBox">
		<div id="eventInfo">
	
			<div class="titleBox">
				<span id="type"></span>
				<div id="title"></div>
			</div>
			
			<div class="collectBox">
				<div class="collect" id="favorite">加入收藏</div>
				<div style="padding-left: 20px"><i class="fa fa-heart" aria-hidden="true"></i>&nbsp;&nbsp;收藏人數：&nbsp;<span></span>&nbsp;人</div>
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
			
				<div style="width: 270px; height: 50px; float: left;">
					<div style="width: 100px; float: left;">
						<a class="btn btn-success clearfix" href="javascript:fbshareCurrentPage()" target="_blank" alt="Share on Facebook">FB分享</a>
					</div>
					<div style="width: 150px; float: left; margin-top: 8px;">
						&nbsp;&nbsp;分享數：&nbsp;<span id="shareCount"></span>
					</div>
				</div>

				<div id="report">檢舉 / 報錯</div>
				
			</div>
		
		</div>
		
		<div id="contextBox">
			<div id="contextText">詳細內容：</div>
			<div id="context"></div>
		</div>
		
	</div>
	
	<script>
		// 開啟即執行
		$(function(){
			var user = $("#member").text();
			var eventID = $("#eventID").text();
			var collection = true;
			if(user.length != 0){
				$.get('checkFavorites.controller' , {'eventid':eventID , 'email':user} , function(data){
					if(data.toString() == ("collectioned")){
						collection = false;
						$('#favorite').text('取消收藏').attr('class','nonCollect').attr('id','del_favorite');
					};
				});
			};
			$('body').on('click' , '#favorite' , function(){
		        if(user.length != 0){
		        	if(collection == true){
			        	var pk = $('#eventID').text();
			            var durationEnd = $('#durationEnd').text();
			            var dtStart = $('#dtStart').text();
			            var eventName = $('#eventName').text(); 
			            var timeStart = $('#timeStart').text();
			            var data = { 'eventID':pk , 'durationEnd':durationEnd , 'dtStart':dtStart , 'eventName':eventName , 'timeStart':timeStart };
			            $.post('insert.controller',data);  
			            $('#favorite').text('取消收藏').attr('class','nonCollect').attr('id','del_favorite');
			            collection = false;
			            var nowCount = $('.collectBox span').text();
			            $('.collectBox span').text(parseInt(nowCount) + 1);
		        	};
	        	} else {
	        		alert('請先登入會員!!')
	        	};
		    });
			$('body').on('click' , '#del_favorite' , function(){
	    		if(collection == false){
	    			$.post('disFavorite.controller' , {'eventid':eventID , 'email':user} , function(data){
		    			$('#del_favorite').text('加入收藏').attr('class','collect').attr('id','favorite');
		    			collection = true;
		    			var nowCount = $('.collectBox span').text();
			            $('.collectBox span').text(parseInt(nowCount) - 1);
	    			 });
    			};
		    });
			
			$('body').on('click' , '.btn' , function(){
				var eventID = $("#eventID").text();
				$.post('${pageContext.request.contextPath}/_04_EventPage/addShareCount.controller',{'eventID':eventID});
				var nowShare = $('#shareCount').text();
	            $('#shareCount').text(parseInt(nowShare) + 1);
			});
			
			$.getJSON('${pageContext.request.contextPath}/_04_EventPage/oneEvent.controller', 'eventID='+eventID , function(data) {
				$.each(data, function(index, eventData) {
					
					$('#type').append('[&nbsp;' + eventData.eventTypeId + '&nbsp;]');
					$('#title').append(eventData.eventName);
					
					
					
					$(document).ready(function() {
				        document.title = $('#title').text();
				    });
					
					
					
					$('.collectBox span').append(eventData.collectionCount)
					$('#shareCount').append(eventData.shareCount)
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
						$('#ownImg').attr('src' , eventData.imageFile).attr('onerror' , 'javascript:this.src="../img/taipei_culture.png"');
					};
						// 對毫秒數做轉換，取年月日再組裝 ↓
						var Start = new Date(eventData.dtStart);
						var End = new Date(eventData.durationEnd);
						var Y1 = Start.getFullYear() + '-';
						var M1 = (Start.getMonth()+1 < 10 ? '0'+(Start.getMonth()+1) : Start.getMonth()+1) + '-';
						var D1 = (Start.getDate()+1 <= 10 ? '0'+Start.getDate() : Start.getDate());
						var dtStart = Y1 + M1 + D1;
						var Y2 = End.getFullYear() + '-';
						var M2 = (End.getMonth()+1 < 10 ? '0'+(End.getMonth()+1) : End.getMonth()+1) + '-';
						var D2 = (End.getDate()+1 <= 10 ? '0'+End.getDate() : End.getDate());
						var durationEnd = Y2 + M2 + D2;
						var ts = new Date(eventData.timeStart);
						var tsH = ts.getHours() + ':';
						var tsM = ts.getMinutes();
						var timeStartHM = tsH + tsM;
						var Y3 = ts.getFullYear() + '-';
						var M3 = (ts.getMonth()+1 < 10 ? '0'+(ts.getMonth()+1) : ts.getMonth()+1) + '-';
						var D3 = (ts.getDate()+1 <= 10 ? '0'+ts.getDate() : ts.getDate());
						var timeStart = Y3 + M3 + D3;
						var Insert = new Date(eventData.insertTime);
						var Y4 = Insert.getFullYear() + '-';
						var M4 = (Insert.getMonth()+1 < 10 ? '0'+(Insert.getMonth()+1) : Insert.getMonth()+1) + '-';
						var D4 = (Insert.getDate()+1 <= 10 ? '0'+Insert.getDate() : Insert.getDate());
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
				
				// favorite使用
				$("#temp").append('<p id="durationEnd" style="display:none">'+durationEnd+'</p>');
				$("#temp").append('<p id="dtStart" style="display:none">'+dtStart+'</p>');
				$("#temp").append('<p id="eventName" style="display:none">'+eventData.eventName+'</p>');
				$("#temp").append('<p id="timeStart" style="display:none">'+timeStart+'</p>');
					
				});
			}); // JSON END
		}); // 開啟即執行 END
		
		function fbshareCurrentPage()
		    {window.open("https://www.facebook.com/sharer/sharer.php?u="+escape(window.location.href)+"&t="+document.title, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
	    return false; }
		
	</script>
	
<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>