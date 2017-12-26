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
<script src="../js/jquery.twbsPagination.js"></script>
<!-- 分頁js -->
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

.selectArea span:hover , .selectDate span:hover  , .selectType span:hover , #dateRangePicker:hover{
	background-color : #A6D4DF;
}

#emsp , #count{
	background-color : transparent;
}

.stateChecked{
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
	<div class="container">
        <nav aria-label="Page navigation">
            <ul class="pagination" id="pagination"></ul>
        </nav>
    </div>
	
	<script>
		// --- 開啟即執行 ---------------------------------------------------------------------------
		$(function(){
			page=1;
			total_Count=0;
			doCount(selectDate , selectArea , selectType ,page);
			
			//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			//全域變數 設定要查詢第幾頁
			
			
			
		       
			
			//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			
			
			
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
			// 日期選取器 - 設定按取消後的動作
			$('#dateRangePicker').on("cancel.daterangepicker", function(ev, picker) {
				$(this).val('請選擇日期').css('color','red');
			});
			// 給全選的radio & checkbox 顏色
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
				doSearch(selectDate , selectArea , selectType , page);
			});
			$('#dateRangePicker').click(function() {
				$('input[name="pickDate"]').next().removeClass('stateChecked');
				$(this).addClass('stateChecked');
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
			doSearch(selectDate , selectArea , selectType , page);
		
		
		// --- 日期選擇結果操作 ---------------------------------------------------------------------------
		function selectRangeDate() {
			var partDate = $('#dateRangePicker').val().split(' ~ ');
			var startDate = partDate[0];
			var endDate = partDate[1];
			var rangeDate = "where '" + endDate + "' >= dtStart and '" + startDate + "' <= DurationEnd and";
			$('#forDateRangePicker').val(rangeDate).prop('checked',true);
			doSearch(selectDate , selectArea , selectType , page)
		}; // --- 日期選擇結果操作 END ---
		
		// --- 地區類型切換 ---------------------------------------------------------------------------
		function switchToAllArea(selectArea){
			$(':checkbox[name="areaID"]').prop('checked',false);
			doSearch(selectDate , selectArea , selectType , page);
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
				doSearch(selectDate , selectArea , selectType , page);
			} else if ( area100 == false && area103 == false && area104 == false && area105 == false && area106 == false && area108 == false && area110 == false && area111 == false  && area112 == false  && area114 == false  && area115 == false  && area116 == false ) {
				$(':checkbox[name="allArea"]').prop('checked',true);
				doSearch(selectDate , selectArea , selectType , page);
			};
			changeBackgroungColor();
		}; // --- 地區類型切換 END ---
		
		// --- 活動類型切換 ---------------------------------------------------------------------------
		function switchToAllType(selectType){
			$(':checkbox[name="eventType"]').prop('checked',false);
			doSearch(selectDate , selectArea , selectType);
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
			changeBackgroungColor();
		}; // --- 活動類型切換 END ---
		
		// --- 送controller撈資料 ---------------------------------------------------------------------------
		function doSearch(selectDate , selectArea , selectType ,page){
			doCount(selectDate , selectArea , selectType)
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
			
			$.getJSON('${pageContext.request.contextPath}/_04_EventPage/searchEvent.controller', {'newDate':newDate , 'newAreas':newAreas , 'newTypes':newTypes , 'pageNumber':page} , function(data) {
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
			
			$.getJSON('${pageContext.request.contextPath}/_04_EventPage/searchCount.controller', {'newDate':newDate , 'newAreas':newAreas , 'newTypes':newTypes} , function(data) {
				total_Count=data;
				$('#count').empty().append('&emsp;&emsp;&emsp;共有' + data + '筆活動');
			});
		}; // --- controller跑count數 END ---
		var b = total_Count % 10;
		
		
		total_Count = ((total_Count-b) / 10)+1;
	        console.log("aa:"+total_Count);
		
		//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		 var obj = $('#pagination').twbsPagination({
			 
	            //總共有幾頁
	            totalPages: total_Count,
	            //一個頁面要顯示幾個分頁 
	            visiblePages: 10,
	            onPageClick: function (event, page) {
	            	  console.info(page);
	            	doSearch(selectDate , selectArea , selectType , page);
	            }
	        });
		//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		
		
		
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
		
		
	}); // --- 開啟即執行 END ---
		
	</script>
<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>