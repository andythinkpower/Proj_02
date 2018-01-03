<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
<title>單一行程顯示頁</title>
<!-- temp -->

<!-- https://developers.google.com/maps/documentation/javascript/reference?hl=zh-tw#DirectionsService google map api 涵式庫-->
<style>
body {
	background-color: #F2E6E6;
}

#right-panel {
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}

#right-panel select, #right-panel input {
	font-size: 15px;
}

#right-panel select {
	width: 100%;
}

#right-panel i {
	font-size: 12px;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 100%;
	float: right;
	width: 100%;
	height: 50%;
}

#right-panel {
	margin: 20px;
	border-width: 2px;
	width: 20%;
	height: 400px;
	float: left;
	text-align: left;
	padding-top: 0;
}

#directions-panel {
	margin-top: 10px;
	background-color: #FFEE77;
	padding: 10px;
}
.option{
	color:red;
}

</style>

<!-- temp -->







</head>
<body>
	<jsp:include page="../commons/header_login.jsp" />
	<p id="activityID" style="display: none;"><%= request.getParameter("activityID") %></p>
	<form id="solo" action="ActivityController.do" method="get">
		<input id="doWhat" type="hidden" name="doWhat" value="">
		<input id="pk" type="hidden" name="activityID" value="">
	</form>	
	<!-- 這邊要顯示個人行程 並且把路徑顯示出來 -->
	<!-- 修改,刪除列 -->
	<div class="row my-2 bg-white">
		<button class="btn btn-sm option update ml-5">修改資料</button>
		<button class="btn btn-sm option delete bg-white ml-5">刪除</button>
		<br>
	</div>
	<!-- 內文 -->
	<div class="row mt-2" style="width: 100%; height: 100%;">
		<!-- 左邊留白 -->
		<div class="col-1"></div>

		<!-- 這邊要動態生成  -->
		<div class="col-5 detail"></div>
		<!-- 這邊要動態生成  -->

		<div class="col-5" style="width: 100%; height: 100%;">
			<div id="dayss">
				<!-- 總共有幾天也是要動態生成 -->

				<!-- 總共有幾天也是要動態生成 -->
			</div>
			<div class="mt-1" id="map"></div>
		</div>
		<!-- 右邊留白 -->
		<div class="col-1"></div>


	</div>



	<script>
	//宣告一個全域變數 用來放個天的矩陣
	var total_day;
	var tempAll=[];
	
	
	$(".update").on('click',function(){
		var pk=$("#activityID").text()
        $("#doWhat").attr("value", "single");
        $("#pk").val(pk);
        console.log("update : " + pk);
        $("#solo").submit();
	})
	
	$(".delete").on('click',function(){
		
 		$.ajax("${pageContext.request.contextPath}/_02_activity/delete.controller",{
                     	data:{"ActivityID":$("#activityID").text()},
                     	success:function(data){
                     		window.location.href="display.jsp";
                     		
                     	}
                     })
		
		
		
		
		
	})
	
	
	$.ajaxSettings.async = false;
			//一進畫面就先讀取資料 顯示全部行程路線
			$.get('update_page.do', {
				'activityID' : $("#activityID").text()
			}, function(data) {
				total_day=data.superList;
				//這區塊是把畫面刻出來
				$.each(data.superList, function(i, v) {
					
					var temp=[];
					
					//動態新增 天數
					$("#dayss").append("<button class='btn change_map ml-1'>D<span>" + (i + 1)+ "</span></button>");
					//左邊活動細節顯示
					var soloDay=$('<div class="card mb-2">').append('<div class="card-header"><h2>第'+(i+1)+'天</h2>'+
					'</div><div class="card-body"></div>');
					$.each(v,function(ii,soloDetail){
						temp.push(soloDetail);
						var pic='../img/viewpoint.png';
						if(soloDetail.kinds=='活動'){
							pic='../img/active.png';
						}else if(soloDetail.kinds=='其他'){
							pic='../img/other.png';
						}else if(soloDetail.kinds=='飯店'){
							pic='../img/⁬hotel.png';
						}else if(soloDetail.kinds=='餐廳'){
							pic='../img/restaurant.png';
						}
						soloDay.append(' <div class="row"> <div class="col-2 ml-2"> <img src="'+pic+'" width="40" />'+
								'</div><div class="col"><img src="../img/time.png" width="40"/>'+soloDetail.times+'</div><div class="col">'+soloDetail.note+'</div>');
					})
					$(".detail").append(soloDay);
					
					tempAll.push(temp);
					//$(".detail").append();
				})
				//這區塊是把畫面刻出來
				//宣告一個全域變數cord 給Map使用
				cord = data.detailBean;
			}, "json")
			
			
			//點選天數 列處單一天行程
			
		

		function initMap() {
			//建立一個 google.maps.DirectionsService class 的物件 Constructor 為 DirectionsService()
			//用來計算多點距離
			var directionsService = new google.maps.DirectionsService();
			//建立一個 google.maps.DirectionsRenderer class 的物件 Constructor 為 DirectionsRenderer(opts?:DirectionsRendererOptions)
			var directionsDisplay = new google.maps.DirectionsRenderer();
			//建立一個 google.maps.Map class 的物件 Constructor 為 Map(mapDiv:Element, opts?:MapOptions)
			var map = new google.maps.Map(document.getElementById('map'), {
				//細節設定(可選)
				//設定比例尺大小
				zoom : 14,
				//設定地圖中心點位置     Type: LatLng物件
				center : {
					lat : 25.057888,
					lng : 121.561137
				}
			});
			//設定一個map物件 給這個directionsDisplay使用
			directionsDisplay.setMap(map);
			
			
			calculateAndDisplayRoute(directionsService,
					directionsDisplay);
			

			//當按下送出按鈕時會執行 calculateAndDisplayRoute(自定義名稱)方法
			$("body").on('click','.change_map',function(){
				//找出對應天數
				var number=$(this).find('span').text();
				//只顯示當天的路徑規劃
				cord=tempAll[number-1];
				calculateAndDisplayRoute(directionsService,
						directionsDisplay);
			})
		}

		function calculateAndDisplayRoute(directionsService, directionsDisplay) {
			//宣告一個陣列 存放路徑中間會經過的地點
			// Type: Array < DirectionsWaypoint >
			var waypts = [];
			//把在checkbox的點選的值 用迴圈一個個取出來放入waypts陣列中
			var checkboxArray = document.getElementById("waypoints");
			////交通路線選擇 (常出現匹配不到 先不使用)
			//var trval = $("#travelMode").val();
			var org;
			var des;
			$.each(cord, function(i, v) {
				//起點跟終點
				if (i == 0) {
					org = new google.maps.LatLng(v.latitude, v.longitude);
				} else if (i == cord.length - 1) {
					des = new google.maps.LatLng(v.latitude, v.longitude);
				}
				//中繼點
				else {
					waypts.push({
						location : new google.maps.LatLng(v.latitude,
								v.longitude),
						//stopover 是指出途經地點是路線上停留點的布林值，這會影響路線是否要分為兩條路線。 true代表同一條路線 不用分開
						stopover : true
					});
				}
			})

			//console.log(waypts);
			// 其方法 route(request:DirectionsRequest, callback:function(DirectionsResult, DirectionsStatus))
			directionsService.route(
			//請求 DirectionsRequest有多種屬性 依需求設定設些屬性值
			{

				//起始地點 此為id="start"的選項所選的地點
				origin : org, //$("#start").val(),
				//目的地點 此為id="end"的選項所選的地點
				destination : des, //$("#end").val(),
				//有中繼點 此為前面宣告的陣列
				waypoints : waypts,
				//優化路徑 如果設true會幫你配整體最佳路線 false 為waypts兩點兩點之間最佳路徑而不是整體
				optimizeWaypoints : false,
				//交通方式 有4種 開車 大眾運輸 腳踏車 走路
				travelMode : 'DRIVING'
			}
			//
			, function(response, status) {
				if (status === 'OK') {
					directionsDisplay.setDirections(response);
					var route = response.routes[0];
						console.log(route.legs);
				} else {
					window.alert('Directions request failed due to ' + status);
				}
			});
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvWJmCF8PSPLdnBnvQH3tON7LkkFr6HNo&callback=initMap">
		
	</script>

	

	<jsp:include page="../commons/footer.jsp" />
</body>
</html>