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
<!-- Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<!-- showEvent CSS -->
<link rel="stylesheet" href="../css/showEvent.css">
<!-- 圖標 -->
<script src="https://use.fontawesome.com/8af200eebc.js"></script>
<!-- 分頁 -->
<script src="../js/jquery.twbsPagination.js"></script>

<title>尋找活動</title>

<style>

body {
	background-image: url('../img/event_background.jpg');
	background-attachment:fixed;
	background-size: cover;
}

#eventSelector {
	width: 900px;
	height:190px;
	margin: auto;
	background : #EBD6D6;
}

.subRegion {
	float: left;
	margin: 5px 0px 0px 15px;
}

#areaMark {
	float: left;
}

#dateMark , #typeMark , #orderMark {
	margin-top: 8px;
	float: left;
}

#areaText {
	width:200px;
	position : relative;
}

.selectArea {
	position : absolute;
	top : 150px;
	left: 890px;
	width : 345px;
	height : 170px;
	border : 1px solid blue;
	background : #E9E2E2;
	display : none;
}

#selectDate , #selectType , #selectOrder {
	width: 740px;
	float: left;
}

#eventSelector label {
	padding-left: 5px;
}

.selectArea span:hover , .selectDate span:hover  , .selectType span:hover , .selectOrder span:hover , #dateRangePicker:hover {
	background-color : #A6D4DF;
}

#emsp , #count {
	background-color : transparent;
}

.stateChecked {
	background-color : yellow;
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
	<p id="member" style="display: none;">${member.memberemail}</p>
	<p id="memberTypes" style="display: none;">${member.events}</p>
	<p id="memberRegions" style="display: none;">${member.regions}</p>
	<br>
	<div id="eventSelector">
	
		<div style="float: left; margin: 10px 0px 0px 15px">
			<i class="fa fa-map-marker fa-2x" id="areaMark" aria-hidden="true"></i><span style="float: left;">&nbsp;&nbsp;去哪裡玩&nbsp;&emsp;</span><input type="text" id="areaText" value="">
				<div id="selectArea" class="selectArea">
			    	<label><input type="checkbox" name="allArea" value="正同埔松安萬信士北內南文" checked="checked"><span>全部</span></label>
			    	<br>
				    <label><input type="checkbox" name="areaID" value="正"><span>中正區</span></label>
				    <label><input type="checkbox" name="areaID" value="同"><span>大同區</span></label>
				    <label><input type="checkbox" name="areaID" value="埔"><span>中山區</span></label>
				    <label><input type="checkbox" name="areaID" value="松"><span>松山區</span></label>
				    <label><input type="checkbox" name="areaID" value="安"><span>大安區</span></label>
				    <label><input type="checkbox" name="areaID" value="萬"><span>萬華區</span></label>
				    <label><input type="checkbox" name="areaID" value="信"><span>信義區</span></label>
				    <label><input type="checkbox" name="areaID" value="士"><span>士林區</span></label>
				    <label><input type="checkbox" name="areaID" value="北"><span>北投區</span></label>
				    <label><input type="checkbox" name="areaID" value="內"><span>內湖區</span></label>
				    <label><input type="checkbox" name="areaID" value="南"><span>南港區</span></label>
				    <label><input type="checkbox" name="areaID" value="文"><span>文山區</span></label>
			    </div>
	    </div>
	    
	    <div class="subRegion">
		    <i class="fa fa-clock-o fa-lg" id="dateMark" aria-hidden="true"></i><span style="float: left;">&nbsp;&nbsp;何時去玩&emsp;</span>
		    <div id="selectDate" class="selectDate">
		    	<label><input type="radio" name="pickDate" value="where" checked="checked" id="allDate"><span>不限</span></label>
			    <label><input type="radio" name="pickDate" value="where datediff ( day , getdate() , dtStart ) <= 0 and datediff ( day , getdate() , DurationEnd) >= 0 and"><span>今日</span></label>
			    <label><input type="radio" name="pickDate" value="where dateadd ( week , datediff( week , '' , getdate() ) , 6 ) >= dtStart  and"><span>本週</span></label>
			    <label><input type="radio" name="pickDate" value="where dateadd ( week , datediff( week , '' , getdate() ) , 6 ) >= dtStart and dateadd( week , datediff( week , '' , getdate() ) , 5 ) <= DurationEnd and"><span>本週末</span></label>
			    <label><input type="radio" name="pickDate" value="where dateadd ( day , 7 , dateadd( week , datediff( week , '' , getdate() ) , 6 ) ) >= dtStart  and"><span>下週</span></label>
			    <label><input type="radio" name="pickDate" value="where dateadd ( day , 7 , dateadd( week , datediff( week , '' , getdate() ) , 6 ) ) >= dtStart and dateadd( day , 7 , dateadd( week , datediff( week , '' , getdate() ) , 5 ) ) <= DurationEnd and"><span>下週末</span></label>
			    <span id="emsp">&emsp;&emsp;</span>
			    <i class="fa fa-calendar-check-o" aria-hidden="true"></i><input type="text" style="width: 240px" value="自訂日期" id="dateRangePicker">
			    <input type="radio" name="pickDate" value="" style="display: none;" id="forDateRangePicker">
		    </div>
		</div>
		
		<div class="subRegion">
		    <i class="fa fa-star fa-lg" id="typeMark" aria-hidden="true"></i><span style="float: left;">&nbsp;&nbsp;活動類型&emsp;</span>
			<div id="selectType" class="selectType">		
				<label><input type="checkbox" name="allType" value="休閒展覽音樂表演研習親子影視" checked="checked"><span>全部</span></label>
				<label><input type="checkbox" name="eventType" value="休閒"><span>休閒</span></label>
				<label><input type="checkbox" name="eventType" value="展覽"><span>展覽</span></label>
				<label><input type="checkbox" name="eventType" value="音樂"><span>音樂</span></label>
				<label><input type="checkbox" name="eventType" value="表演"><span>表演</span></label>
				<label><input type="checkbox" name="eventType" value="研習"><span>研習</span></label>
				<label><input type="checkbox" name="eventType" value="親子"><span>親子</span></label>
				<label><input type="checkbox" name="eventType" value="影視"><span>影視</span></label>
				<span id="count" ></span>
			</div>
		</div>
		
		<div class="subRegion">
		    <i class="fa fa-sort-amount-desc fa-lg" id="orderMark" aria-hidden="true"></i><span style="float: left;">&nbsp;&nbsp;排序依照&emsp;</span>
			<div id="selectOrder" class="selectOrder">		
				<label><input type="radio" name="pickOrder" value="datediff ( day , getdate() , DurationEnd )" checked="checked" id="toBeClose"><span>即將結束</span></label>
				<label><input type="radio" name="pickOrder" value="InsertTime desc"><span>最新刊登</span></label>
				<label><input type="radio" name="pickOrder" value="collectionCount desc"><span>收藏數</span></label>
				<label><input type="radio" name="pickOrder" value="shareCount desc"><span>熱門分享</span></label>
				<label><input type="radio" name="pickOrder" value="IsCharge desc"><span>是否免費</span></label>
			</div>
		</div>
		
	</div> <!-- eventSelector END -->
	
	<div id="showEvent">
		<!-- event插入點 -->
	</div>
	
	<div class="container" style="width: 35%; height: 50px;">
        <nav aria-label="Page navigation">
   	        <ul class="pagination" id="pagination" style="width: 900px; height: 30px; margin: auto;"></ul>
       	</nav>
    </div>
	
	<script>
		// --- 開啟即執行 ---------------------------------------------------------------------------
		$(function(){
			// 給全選的radio & checkbox 顏色
			$('#allDate').next().addClass('stateChecked');
			$(':checkbox[name="allArea"]').next().addClass('stateChecked');
			$(':checkbox[name="allType"]').next().addClass('stateChecked');
			$('#toBeClose').next().addClass('stateChecked');
			var user = $("#member").text();
			if(user.length != 0){
				// 取得會員喜好並改變篩選狀態
				var likeregions = $('#memberRegions').text();
					if (likeregions.match('中正區') != null) {$(':checkbox[value="正"]').prop('checked',true);}
					if (likeregions.match('大同區') != null) {$(':checkbox[value="同"]').prop('checked',true);}
					if (likeregions.match('中山區') != null) {$(':checkbox[value="埔"]').prop('checked',true);}
					if (likeregions.match('松山區') != null) {$(':checkbox[value="松"]').prop('checked',true);}
					if (likeregions.match('大安區') != null) {$(':checkbox[value="安"]').prop('checked',true);}
					if (likeregions.match('萬華區') != null) {$(':checkbox[value="萬"]').prop('checked',true);}
					if (likeregions.match('信義區') != null) {$(':checkbox[value="信"]').prop('checked',true);}
					if (likeregions.match('士林區') != null) {$(':checkbox[value="士"]').prop('checked',true);}
					if (likeregions.match('北投區') != null) {$(':checkbox[value="北"]').prop('checked',true);}
					if (likeregions.match('內湖區') != null) {$(':checkbox[value="內"]').prop('checked',true);}
					if (likeregions.match('南港區') != null) {$(':checkbox[value="南"]').prop('checked',true);}
					if (likeregions.match('文山區') != null) {$(':checkbox[value="文"]').prop('checked',true);}
				var liketypes = $('#memberTypes').text();
					if (liketypes.match('表演萬象') != null) {$(':checkbox[value="表演"]').prop('checked',true);}
					if (liketypes.match('展覽廣場') != null) {$(':checkbox[value="展覽"]').prop('checked',true);}
					if (liketypes.match('音樂現場') != null) {$(':checkbox[value="音樂"]').prop('checked',true);}
					if (liketypes.match('講座研習') != null) {$(':checkbox[value="研習"]').prop('checked',true);}
					if (liketypes.match('電影瞭望') != null) {$(':checkbox[value="影視"]').prop('checked',true);}
					if (liketypes.match('城市萬花筒') != null) {$(':checkbox[value="休閒"]').prop('checked',true);}
					if (liketypes.match('親子活動') != null) {$(':checkbox[value="親子"]').prop('checked',true);}
				var area100 = $(':checkbox[value="正"]').prop('checked');
				var area103 = $(':checkbox[value="同"]').prop('checked');
				var area104 = $(':checkbox[value="埔"]').prop('checked');
				var area105 = $(':checkbox[value="松"]').prop('checked');
				var area106 = $(':checkbox[value="安"]').prop('checked');
				var area108 = $(':checkbox[value="萬"]').prop('checked');
				var area110 = $(':checkbox[value="信"]').prop('checked');
				var area111 = $(':checkbox[value="士"]').prop('checked');
				var area112 = $(':checkbox[value="北"]').prop('checked');
				var area114 = $(':checkbox[value="內"]').prop('checked');
				var area115 = $(':checkbox[value="南"]').prop('checked');
				var area116 = $(':checkbox[value="文"]').prop('checked');
				if ( area100 == true && area103 == true && area104 == true && area105 == true && area106 == true && area108 == true && area110 == true && area111 == true  && area112 == true  && area114 == true  && area115 == true  && area116 == true ) {
					$(':checkbox[name="areaID"]').prop('checked',false);
					$(':checkbox[name="allArea"]').prop('checked',true);
				} else if ( area100 != true && area103 != true && area104 != true && area105 != true && area106 != true && area108 != true && area110 != true && area111 != true  && area112 != true  && area114 != true  && area115 != true  && area116 != true ) {
					$(':checkbox[name="allArea"]').prop('checked',true);
				} else if ( area100 == true || area103 == true || area104 == true || area105 == true || area106 == true || area108 == true || area110 == true || area111 == true  || area112 == true  || area114 == true  || area115 == true  || area116 == true  ) {
					$(':checkbox[name="allArea"]').prop('checked',false);
				};
				var leisure = $(':checkbox[value="休閒"]').prop('checked');
				var exhibit = $(':checkbox[value="展覽"]').prop('checked');
				var music = $(':checkbox[value="音樂"]').prop('checked');
				var show = $(':checkbox[value="表演"]').prop('checked');
				var study = $(':checkbox[value="研習"]').prop('checked');
				var family = $(':checkbox[value="親子"]').prop('checked');
				var video = $(':checkbox[value="影視"]').prop('checked');
				if ( leisure == true && exhibit == true && music == true && show == true && study == true && family == true && video == true ) {
					$(':checkbox[name="eventType"]').prop('checked',false);
					$(':checkbox[name="allType"]').prop('checked',true);
				} else if ( leisure != true && exhibit != true && music != true && show != true && study != true && family != true && video != true ) {
					$(':checkbox[name="allType"]').prop('checked',true);
				} else if ( leisure == true || exhibit == true || music == true || show == true || study == true || family == true || video == true ) {
					$(':checkbox[name="allType"]').prop('checked',false);
				};
				changeBackgroungColor();
				$('#toBeClose').prop('checked',true);
				doCount(selectDate , selectArea , selectType);
			} else{
				doCount(selectDate , selectArea , selectType);
			}
			//宣告全域變數
			page = 1;
			total_Count = 0;
			// 日期選取器
			$('#dateRangePicker').daterangepicker({
				alwaysShowCalendars: true,
				autoUpdateInput : false,
				opens: "right",
				minDate: new Date(),
				showDropdowns: true,
				locale: {
					format: "YYYY-MM-DD",
					separator: " ~ ",
					applyLabel: "確定",
					cancelLabel: "取消",
					daysOfWeek: ["日", "一", "二", "三", "四", "五", "六"],
					monthNames: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
					firstDay: 1,
				},
			});
			// 日期選取器 - 配合autoUpdateInput使用，設定按確定後的動作
			$('#dateRangePicker').on("apply.daterangepicker", function(ev, picker) {
				$(this).val(picker.startDate.format("YYYY-MM-DD") + " ~ " + picker.endDate.format("YYYY-MM-DD")).css('color','black');
				selectRangeDate();
			});
			// 日期選取器 - 點擊 &按取消後的動作
			$('#dateRangePicker').on("cancel.daterangepicker", function(ev, picker) {
				$(this).val('請選擇日期').css('color','red');
			});
			$('#dateRangePicker').on('click', function(ev, picker) {
				$('input[name="pickDate"]').next().removeClass('stateChecked');
				$(this).addClass('stateChecked').val('請選擇日期').css('color','red');;
			});
			// 地區選單懸浮效果binding
			$("#areaText").mouseover(function(){
				$(".selectArea").show();
			});
			$('.selectArea').mouseleave(function(){
				$(".selectArea").hide();
			});
			// radio & dateRangePicker & checkbox 事件binding
			$(':radio[name="pickDate"]').click(function() {
				$(':radio').each(function(){
					if ($(this).prop('checked') == true) {
						$(this).next().addClass('stateChecked');
						if ($('#dateRangePicker').val() != '自訂日期') {
							$('#dateRangePicker').removeClass('stateChecked').val('自訂日期').css('color','black');
						};
					} else {
						$(this).next().removeClass('stateChecked');
					};
				});
				doCount(selectDate , selectArea , selectType);
			});
			$(':checkbox[name="allArea"]').click(function() {
				switchToAllArea(this.id);
			});
			$(':checkbox[name="areaID"]').click(function() {
				changeArea(this.id);
			});
			$(':checkbox[name="allType"]').click(function() {
				switchToAllType(this.id);
			});
			$(':checkbox[name="eventType"]').click(function() {
				changeType(this.id);
			});
			$(':radio[name="pickOrder"]').click(function() {
				$(':radio').each(function(){
					if ($(this).prop('checked') == true) {
						$(this).next().addClass('stateChecked');
					} else {
						$(this).next().removeClass('stateChecked');
					};
				});
				doCount(selectDate , selectArea , selectType);
			});
		}); // --- 開啟即執行 END ---
		
		// --- 日期選擇結果操作 ---------------------------------------------------------------------------
		function selectRangeDate() {
			var partDate = $('#dateRangePicker').val().split(' ~ ');
			var startDate = partDate[0];
			var endDate = partDate[1];
			var rangeDate = "where '" + endDate + "' >= dtStart and '" + startDate + "' <= DurationEnd and";
			$('#forDateRangePicker').val(rangeDate).prop('checked',true);
			doCount(selectDate , selectArea , selectType)
		}; // --- 日期選擇結果操作 END ---
		
		// --- 地區類型切換 ---------------------------------------------------------------------------
		function switchToAllArea(selectArea){
			$(':checkbox[name="areaID"]').prop('checked',false);
			doCount(selectDate , selectArea , selectType)
			changeBackgroungColor();
		};
		function changeArea(selectArea){
			
			var area100 = $(':checkbox[value="正"]').prop('checked');
			var area103 = $(':checkbox[value="同"]').prop('checked');
			var area104 = $(':checkbox[value="埔"]').prop('checked');
			var area105 = $(':checkbox[value="松"]').prop('checked');
			var area106 = $(':checkbox[value="安"]').prop('checked');
			var area108 = $(':checkbox[value="萬"]').prop('checked');
			var area110 = $(':checkbox[value="信"]').prop('checked');
			var area111 = $(':checkbox[value="士"]').prop('checked');
			var area112 = $(':checkbox[value="北"]').prop('checked');
			var area114 = $(':checkbox[value="內"]').prop('checked');
			var area115 = $(':checkbox[value="南"]').prop('checked');
			var area116 = $(':checkbox[value="文"]').prop('checked');
			
			if ( area100 == true && area103 == true && area104 == true && area105 == true && area106 == true && area108 == true && area110 == true && area111 == true  && area112 == true  && area114 == true  && area115 == true  && area116 == true ) {
				$(':checkbox[name="areaID"]').prop('checked',false);
				$(':checkbox[name="allArea"]').prop('checked',true);
				doCount(selectDate , selectArea , selectType)
			} else if ( area100 == false && area103 == false && area104 == false && area105 == false && area106 == false && area108 == false && area110 == false && area111 == false  && area112 == false  && area114 == false  && area115 == false  && area116 == false ) {
				$(':checkbox[name="allArea"]').prop('checked',true);
				doCount(selectDate , selectArea , selectType)
			} else if ( area100 == true || area103 == true || area104 == true || area105 == true || area106 == true || area108 == true || area110 == true || area111 == true  || area112 == true  || area114 == true  || area115 == true  || area116 == true  ) {
				$(':checkbox[name="allArea"]').prop('checked',false);
				doCount(selectDate , selectArea , selectType)
			};
			changeBackgroungColor();
		}; // --- 地區類型切換 END ---
		
		// --- 活動類型切換 ---------------------------------------------------------------------------
		function switchToAllType(selectType){
			$(':checkbox[name="eventType"]').prop('checked',false);
			doCount(selectDate , selectArea , selectType)
			changeBackgroungColor();
		};
		function changeType(selectType){
			
			var leisure = $(':checkbox[value="休閒"]').prop('checked');
			var exhibit = $(':checkbox[value="展覽"]').prop('checked');
			var music = $(':checkbox[value="音樂"]').prop('checked');
			var show = $(':checkbox[value="表演"]').prop('checked');
			var study = $(':checkbox[value="研習"]').prop('checked');
			var family = $(':checkbox[value="親子"]').prop('checked');
			var video = $(':checkbox[value="影視"]').prop('checked');
			
			if ( leisure == true && exhibit == true && music == true && show == true && study == true && family == true && video == true ) {
				$(':checkbox[name="eventType"]').prop('checked',false);
				$(':checkbox[name="allType"]').prop('checked',true);
				doCount(selectDate , selectArea , selectType)
			} else if ( leisure == false && exhibit == false && music == false && show == false && study == false && family == false && video == false ) {
				$(':checkbox[name="allType"]').prop('checked',true);
				doCount(selectDate , selectArea , selectType)
			} else if ( leisure == true || exhibit == true || music == true || show == true || study == true || family == true || video == true ) {
				$(':checkbox[name="allType"]').prop('checked',false);
				doCount(selectDate , selectArea , selectType)
			};
			changeBackgroungColor();
		}; // --- 活動類型切換 END ---
		
		// --- 送controller撈資料 ---------------------------------------------------------------------------
		function doSearch(selectDate , selectArea , selectType , selectOrder , page){
			// 取得date被選擇的值
			var newDate = $('#selectDate :checked[type="radio"]').val()
			// 取得area被選擇的值，再轉成字串
			var areas = [];
			var areaText = [];
			$('#selectArea :checked[type="checkbox"]').each(function(){
				var areaString = $(this).val();
				var showArea = $(this).next().text();
				areas.push(areaString);
				areaText.push(showArea);
			});
			var newAreas = areas.join();
			// 變換text所顯示area
			if (newAreas == '正同埔松安萬信士北內南文') {
				$('#areaText').val('全部')
			} else {
				$('#areaText').val(areaText)
			};
			// 取得type被選擇的值，再轉成字串
			var types = [];
			$('#selectType :checked[type="checkbox"]').each(function(){
				var typeString = $(this).val();
				types.push(typeString);
			});
			var newTypes = types.join();
			
			// 取得ordar被選擇的值
			var newOrder = $('#selectOrder :checked[type="radio"]').val()
			
			$('#showEvent').empty();
			
			$.getJSON('${pageContext.request.contextPath}/_04_EventPage/searchEvent.controller', {'newDate':newDate , 'newAreas':newAreas , 'newTypes':newTypes , 'newOrder':newOrder , 'pageNumber':page} , function(data) {
				$.each(data, function(index, eventData) {
					// 對沒有提供圖片的活動給予圖片，else對圖片失效的連結做處理
					console.log(eventData.eventName);
					if (eventData.imageFile == 'null') {
						var picBox = $('<div class="picBox"></div>').html('<a href="<c:url value="/_04_EventPage/eventSelf.jsp?eventID=' + eventData.eventID + '"/>"><img width=75px src="../img/taipei_culture.png" title="' + eventData.briefIntroduction + '"></a>');
					} else {
						var picBox = $('<div class="picBox"></div>').html('<a href="<c:url value="/_04_EventPage/eventSelf.jsp?eventID=' + eventData.eventID + '"/>"><img width=75px src="' + eventData.imageFile + '" onerror="javascript:this.src=&apos;../img/taipei_culture.png&apos;" title="' + eventData.briefIntroduction + '"></a>');
					};
					var typeTag = $('<span id="type"></span>').html('[&nbsp;' + eventData.eventTypeId + '&nbsp;]');
					var aTag = $('<a href="<c:url value="/_04_EventPage/eventSelf.jsp?eventID=' + eventData.eventID + '"/>"></a>').html('<span id="title">' + eventData.eventName + '</span>');
					var titleBox = $('<div id="titleBox"></div>').append([ typeTag , aTag ]);
					// 將牛埔改顯示為中山區
					if( eventData.areaId == '牛埔' ){
						var rs1 = $('<span></span>').html('<i class="fa fa-map-marker" aria-hidden="true" style="width: 17px"></i>&nbsp;&nbsp;中山區');
					} else {
						var rs1 = $('<span></span>').html('<i class="fa fa-map-marker" aria-hidden="true" style="width: 17px"></i>&nbsp;&nbsp;' + eventData.areaId)
					};
					var rs2 = $('<span></span>').html('<i class="fa fa-usd" aria-hidden="true"></i>&nbsp;&nbsp;' + eventData.isCharge);
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
					var rs3 = $('<span></span>').html('<i class="fa fa-calendar-check-o" aria-hidden="true"></i>&nbsp;&nbsp;活動時間：' + dtStart + ' ~ ' + durationEnd);
					var row1 = $('<div class="row"></div>').append([ rs1 , rs2 , rs3 ]);
					var rs4 = $('<span style="width: 65%"></span>').html('<i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;主辦單位：' + eventData.showGroupName);
					var rs5 = $('<span id="collectCount"></span>').html('<i class="fa fa-heart" aria-hidden="true"></i>&nbsp;&nbsp;收藏人數：&nbsp;' + eventData.collectionCount + '&nbsp;人');
					var row2 = $('<div class="row"></div>').append([ rs4 , rs5 ]);
					// 計算天數差
					var daysdiff = (eventData.durationEnd - new Date().getTime())/86400000;
					if ( daysdiff < 0 ) {
						var daysdiff = 0;
						var days = $('<div id="days"></div>').html('今天結束！');
					} else {
						var daysdiff = Math.floor(daysdiff) + 1;
						var days = $('<div id="days"></div>').html('還剩&nbsp;' + daysdiff + '&nbsp;天');
					};
					var user = $("#member").text();
					if(user.length != 0){
						$.get('checkFavorites.controller' , {'eventid':eventData.eventID , 'email':user} , function(data){
							if(data.toString() == ("collectioned")){
								var collect = $('<div id="collect"></div>').text('已收藏');
								var mainBox = $('<div class="mainBox"></div>').append([ titleBox , row1 , row2 ]);
								var box = $('<div class="box"></div>').append([ picBox , mainBox , days , collect ]);
								$('#showEvent').append(box);
							} else {
								var collect = $('<div id="collect" style="display: none;"></div>').text('加入收藏');
								var mainBox = $('<div class="mainBox"></div>').append([ titleBox , row1 , row2 ]);
								var box = $('<div class="box"></div>').append([ picBox , mainBox , days , collect ]);
								$('#showEvent').append(box);
							};
						});
					} else {
						var mainBox = $('<div class="mainBox"></div>').append([ titleBox , row1 , row2 ]);
						var box = $('<div class="box"></div>').append([ picBox , mainBox , days ]);
						$('#showEvent').append(box);
					};
				});
			}); // JSON END
		}; // --- controller撈資料 END ---
		
		// --- 送controller跑count數 ---------------------------------------------------------------------------
		function doCount(selectDate , selectArea , selectType) {
			// 取得date被選擇的值
			var newDate = $('#selectDate :checked[type="radio"]').val()
			// 取得area被選擇的值，再轉成字串
			var areas = [];
			var areaText = [];
			$('#selectArea :checked[type="checkbox"]').each(function(){
				var areaString = $(this).val();
				var showArea = $(this).next().text();
				areas.push(areaString);
				areaText.push(showArea);
			});
			var newAreas = areas.join();
			// 變換text所顯示area
			if (newAreas == '正同埔松安萬信士北內南文') {
				$('#areaText').val('全部')
			} else {
				$('#areaText').val(areaText)
			};
			// 取得type被選擇的值，再轉成字串
			var types = [];
			$('#selectType :checked[type="checkbox"]').each(function(){
				var typeString = $(this).val();
				types.push(typeString);
			});
			var newTypes = types.join();
			
			$.getJSON('${pageContext.request.contextPath}/_04_EventPage/searchCount.controller', {'newDate':newDate , 'newAreas':newAreas , 'newTypes':newTypes} , function(data) {
				total_Count = data;
				$('#count').empty().append('&emsp;&emsp;共有&nbsp;' + data + '&nbsp;筆活動').css('color','blue');
				// 把活動數除10再無條件進位  Ex:342筆 -> 34.2 -> 35  ->顯示35筆分頁
				total_Count = ((total_Count - (total_Count%10)) / 10+1);
				// destory把現有分頁remove再重新初始化 ，初始化會觸發一次onPageClick，所以會順便做doSearch，代表只要做doCount，也會順便做doSearch
				$('#pagination').twbsPagination('destroy');
				var obj = $('#pagination').twbsPagination({
					// 總共有幾頁
					totalPages: total_Count,
					// 一個頁面要顯示幾個分頁 
					visiblePages: 10,
					// 起始分頁是第幾頁
					startPage:1,
					first: '首頁',
	            	prev: '上一頁',
	            	next: '下一頁',
	            	last: '最後頁',
					// 點擊分頁會觸發的事件
					onPageClick: function (event, page) {
						doSearch(selectDate , selectArea , selectType , selectOrder , page);
					}
				});
			});
		}; // --- controller跑count數 END ---
		
		// 切換被選取顏色
		function changeBackgroungColor() {
			$(':checkbox').each(function(){
				if ($(this).prop('checked') == true) {
					$(this).next().addClass('stateChecked');
				} else {
					$(this).next().removeClass('stateChecked');
				};
			});
		};
		
	</script>
<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>