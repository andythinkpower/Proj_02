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
<!-- jQuery-ui -->
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- jQuery-ui CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<title>尋找活動</title>

<style>
.text{
	position : relative;
}

.selectArea{
	position : absolute;
	top : 0px;
	width : 260px;
	height : 120px;
	border : 1px solid blue;
	background : white;
	display : none;
}

.selectArea span:hover , .selectDate span:hover  , .selectType span:hover{
	background-color : #A6D4DF;
}

#count{
	background-color : transparent;
}

.stateChecked{
	background-color : yellow;
}

</style>

</head>
<body>
<jsp:include page="/commons/header.jsp"></jsp:include>
	<h2><a href="<c:url value="/_04_EventPage/eventSearch.jsp" />">找活動</a></h2>
	
<<<<<<< HEAD
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
=======
	<input type="text" id="areaText" value="" style="width:250px;">
 
	<div id="selectArea" class="selectArea">
    	<label><input type="checkbox" name="allArea" value="正同中松安萬信士北內南文" checked="checked"><span>全部</span></label>
    	<br>
	    <label><input type="checkbox" name="areaID" value="正"><span>中正區</span></label>
	    <label><input type="checkbox" name="areaID" value="同"><span>大同區</span></label>
	    <label><input type="checkbox" name="areaID" value="中"><span>中山區</span></label>
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
    
    <div id="selectDate" class="selectDate">
    	<label><input type="radio" id="allDate" name="pickDate" value="where" checked="checked"><span>不限</span></label>
	    <label><input type="radio" name="pickDate" value="where datediff ( day , getdate() , dtStart ) <= 0 and datediff ( day , getdate() , DurationEnd) >= 0 and"><span>今日</span></label>
	    <label><input type="radio" name="pickDate" value="where dateadd ( week , datediff( week , '' , getdate() ) , 6 ) >= dtStart  and"><span>本週</span></label>
	    <label><input type="radio" name="pickDate" value="where dateadd ( week , datediff( week , '' , getdate() ) , 6 ) >= dtStart and dateadd( week , datediff( week , '' , getdate() ) , 5 ) <= DurationEnd  and"><span>本週末</span></label>
	    <label><input type="radio" name="pickDate" value="where dateadd ( day , 7 , dateadd( week , datediff( week , '' , getdate() ) , 6 ) ) >= dtStart  and"><span>下週</span></label>
	    <label><input type="radio" name="pickDate" value="where dateadd ( day , 7 , dateadd( week , datediff( week , '' , getdate() ) , 6 ) ) >= dtStart and dateadd( day , 7 , dateadd( week , datediff( week , '' , getdate() ) , 5 ) ) <= DurationEnd  and"><span>下週末</span></label>
	    <input type="text" id="datePicker" value="">
    </div>
    
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
>>>>>>> branch 'master' of https://github.com/EEIT98Team02/Proj_02.git
	
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
		// --- 開啟即執行 ---------------------------------------------------------------------------
		$(function(){
			var timeNow = new Date();
			// 日期選單
// 			$('#datePicker').daterangepicker({
// 		        minDate : timeNow,
// 				dateFormat : 'yyyy-mm-dd',
// 		        numberOfMonths : 2,
// 			});
			
			$('#datePicker').daterangepicker({
				"minDate" : timeNow,
    "showDropdowns": true,
    "showWeekNumbers": true,
    "showISOWeekNumbers": true,
    "minDate": "yyyy-MM-dd",
    "maxDate": "yyyy-MM-dd"
});
			
			
			// 給全選的checkbox & radio 顏色
			$('#allDate').next().addClass('stateChecked');
			$(':checkbox[name="allArea"]').next().addClass('stateChecked');
			$(':checkbox[name="allType"]').next().addClass('stateChecked');
			// 地區選單懸浮效果binding
			$("#areaText").mouseover(function(){
				$(".selectArea").show();
			});
			$('.selectArea').mouseleave(function(){
				$(".selectArea").hide();
			});
			// radio & checkbox事件binding
			$(':radio[name="pickDate"]').click(function() {
				$(':radio').each(function(){
					if ($(this).prop('checked') == true) {
						$(this).next().addClass('stateChecked');
					} else {
						$(this).next().removeClass('stateChecked');
					};
				});
				doSearch(selectDate , selectArea , selectType);
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
			// 撈活動資料 
			doSearch(selectDate , selectArea , selectType);
		}); // --- 開啟即執行 END ---
		
		// --- 地區類型切換 ---------------------------------------------------------------------------
		function switchToAllArea(selectArea){
			$(':checkbox[name="areaID"]').prop('checked',false);
			doSearch(selectDate , selectArea , selectType);
			// 切換被選取顏色
			changeBackgroungColor();
		};
		function changeArea(selectArea){
			
			var area100 = $(':checkbox[value="正"]').prop('checked');
			var area103 = $(':checkbox[value="同"]').prop('checked');
			var area104 = $(':checkbox[value="中"]').prop('checked');
			var area105 = $(':checkbox[value="松"]').prop('checked');
			var area106 = $(':checkbox[value="安"]').prop('checked');
			var area108 = $(':checkbox[value="萬"]').prop('checked');
			var area110 = $(':checkbox[value="信"]').prop('checked');
			var area111 = $(':checkbox[value="士"]').prop('checked');
			var area112 = $(':checkbox[value="北"]').prop('checked');
			var area114 = $(':checkbox[value="內"]').prop('checked');
			var area115 = $(':checkbox[value="南"]').prop('checked');
			var area116 = $(':checkbox[value="文"]').prop('checked');
			
			if ( area100 == true || area103 == true || area104 == true || area105 == true || area106 == true || area108 == true || area110 == true || area111 == true  || area112 == true  || area114 == true  || area115 == true  || area116 == true  ) {
				$(':checkbox[name="allArea"]').prop('checked',false);
				doSearch(selectDate , selectArea , selectType);
			} else if ( area100 == false && area103 == false && area104 == false && area105 == false && area106 == false && area108 == false && area110 == false && area111 == false  && area112 == false  && area114 == false  && area115 == false  && area116 == false ) {
				$(':checkbox[name="allArea"]').prop('checked',true);
				doSearch(selectDate , selectArea , selectType);
			};
			// 切換被選取顏色
			changeBackgroungColor();
		}; // --- 地區類型切換 END ---
		
		// --- 活動類型切換 ---------------------------------------------------------------------------
		function switchToAllType(selectType){
			$(':checkbox[name="eventType"]').prop('checked',false);
			doSearch(selectDate , selectArea , selectType);
			// 切換被選取顏色
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
			
			if ( leisure == true || exhibit == true || music == true || show == true || study == true || family == true || video == true ) {
				$(':checkbox[name="allType"]').prop('checked',false);
				doSearch(selectDate , selectArea , selectType);
			} else if ( leisure == false && exhibit == false && music == false && show == false && study == false && family == false && video == false ) {
				$(':checkbox[name="allType"]').prop('checked',true);
				doSearch(selectDate , selectArea , selectType);
			};
			// 切換被選取顏色
			changeBackgroungColor();
		}; // --- 活動類型切換 END ---
		
		// --- 送controller撈資料 ---------------------------------------------------------------------------
		function doSearch(selectDate , selectArea , selectType){
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
			if (newAreas == '正同中松安萬信士北內南文') {
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
			
			$('#eventTable > tbody').empty();
			
			$.getJSON('${pageContext.request.contextPath}/_04_EventPage/searchEvent.controller', {'newDate':newDate , 'newAreas':newAreas , 'newTypes':newTypes} , function(data) {
				$.each(data, function(index, eventData) {
					var column1 = $('<td></td>').html('<a href="<c:url value="/_04_EventPage/eventSelf.jsp?eventID=' + eventData.eventID + '"/>"><img width=75px src="' + eventData.imageFile + '" title="' + eventData.briefIntroduction + '"></a>');
					var column2 = $('<td></td>').text(eventData.eventTypeId);
					var column3 = $('<td class="count"></td>').html('<a href="<c:url value="/_04_EventPage/eventSelf.jsp?eventID=' + eventData.eventID + '"/>">' + eventData.eventName + '</a>');
					// 對字元衝突的中正區給予class
					if( eventData.areaId == '中正區' ){
						var column4 = $('<td class="中正區"></td>').text(eventData.areaId);
					} else {
						var column4 = $('<td></td>').text(eventData.areaId);
					};
					var column5 = $('<td></td>').text(eventData.isCharge);
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
					var column6 = $('<td></td>').text(dtStart + " ~ " + durationEnd);
					var column7 = $('<td></td>').text(eventData.showGroupName);

					var row = $('<tr></tr>').append(
							[column1, column2, column3, column4, column5, column6, column7]);
					
					$('#eventTable > tbody').append(row);
				});
				// 對字元衝突的中正區做remove判別
				var area100 = $('#selectArea :checkbox[value="正"]').prop('checked');
				var area104 = $('#selectArea :checkbox[value="中"]').prop('checked');
				if ( area104 == true && area100 == false) {
					$(".中正區").parent().remove();
				};
				// 取得搜尋筆數
				var count = $('.count').length;
				$('#count').empty().append('&emsp;&emsp;&emsp;共有' + count + '筆活動');
			}); // JSON END
		}; // --- controller撈資料 END ---
		
		// 切換被選取顏色用的function
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