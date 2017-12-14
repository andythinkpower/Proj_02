<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顯示單獨頁面</title>
<style>
#section {
	margin: 5%;
	width: 30%;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 50%;
	float: right;
	width: 50%;
	height: 50%;
}

#directions-panel {
	margin-top: 10px;
	background-color: #FFEE77;
	padding: 10px;
}
</style>
</head>
<body>
	<div id="map"></div>

<!-- 這邊要全部改成表格  -->
	<div id="section">
		<div style="border: 2px solid red;">
			<p>這邊要顯示單一行程 總覽</p>
			<div>標題:${soloBean.actTitle }</div>
			<div>起始時間:${soloBean.actStartDate }</div>
			<div>地區:${soloBean.actRegion }</div>
			<div>照片:${soloBean.actPhoto }</div>
			<div>簡介:${soloBean.introduction }</div>
		</div>

		<p>這邊要顯示單一行程 所有細節</p>
		<div style="border: 2px solid blue;">
			<div>測試文字</div>
			<c:forEach var="detail" items="${soloDetail}">

				<div>第天數:${detail.dates }</div>
				<div>停留時間:${detail.times}</div>
				<div>活動類型:${detail.kinds}</div>
				<div>活動名稱:${detail.note}</div>
				<div>預算:${detail.budget}</div>
				<hr>
			</c:forEach>
		</div>
	</div>

	<script>
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
				zoom : 13,
				//設定地圖中心點位置     Type: LatLng物件
				center : {
					lat : 25.048323,
					lng : 121.518011
				}
			});
			//設定一個map物件 給這個directionsDisplay使用
			directionsDisplay.setMap(map);

			//當按下送出按鈕時會執行 calculateAndDisplayRoute(自定義名稱)方法
			document.getElementById('submit').addEventListener(
					'click',
					function() {
						calculateAndDisplayRoute(directionsService,
								directionsDisplay);
					});
		}

		function calculateAndDisplayRoute(directionsService, directionsDisplay) {
			//宣告一個陣列 存放路徑中間會經過的地點
			// Type: Array < DirectionsWaypoint >
			var waypts = [];
			//把在checkbox的點選的值 用迴圈一個個取出來放入waypts陣列中
			var checkboxArray = document.getElementById('waypoints');
			for (var i = 0; i < checkboxArray.length; i++) {
				//有被點選的checkbox才放入
				if (checkboxArray.options[i].selected) {
					//DirectionsWaypoint物件 包含兩個屬性 location,stopover(type:boolean)
					waypts.push({
						location : checkboxArray[i].value,
						//stopover 是指出途經地點是路線上停留點的布林值，這會影響路線是否要分為兩條路線。 true代表同一條路線 不用分開
						stopover : true
					});
				}
			}
			console.log(waypts);
			// 其方法 route(request:DirectionsRequest, callback:function(DirectionsResult, DirectionsStatus))
			directionsService.route(
			//請求 DirectionsRequest有多種屬性 依需求設定設些屬性值
			{
				//起始地點 此為id="start"的選項所選的地點
				origin : document.getElementById('start').value,
				//目的地點 此為id="end"的選項所選的地點
				destination : document.getElementById('end').value,
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

					var summaryPanel = document
							.getElementById('directions-panel');
					summaryPanel.innerHTML = '';
					// For each route, display summary information.
					for (var i = 0; i < route.legs.length; i++) {
						var routeSegment = i + 1;
						summaryPanel.innerHTML += '<b>Route Segment: '
								+ routeSegment + '</b><br>';
						summaryPanel.innerHTML += route.legs[i].start_address
								+ ' to ';
						summaryPanel.innerHTML += route.legs[i].end_address
								+ '<br>';
						summaryPanel.innerHTML += route.legs[i].distance.text
								+ '<br><br>';
						console.log(route.legs[i]);
					}
				} else {
					window.alert('Directions request failed due to ' + status);
				}
			});
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvWJmCF8PSPLdnBnvQH3tON7LkkFr6HNo&callback=initMap">
		
	</script>


</body>
</html>