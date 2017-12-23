<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<title>單一行程顯示頁</title>

<!-- temp -->

 <!-- https://developers.google.com/maps/documentation/javascript/reference?hl=zh-tw#DirectionsService google map api 涵式庫-->
    <style>
        #right-panel {
            font-family: 'Roboto','sans-serif';
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
            height: 50%;
            float: right;
            width: 50%;
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
    </style>

<!-- temp -->







</head>
<body>
<jsp:include page="../commons/header.jsp"/>
	<!-- 這邊要顯示個人行程 並且把路徑顯示出來 -->
	<input type='hidden' id='pk' value='${pk}'/>
	
	
	<!-- temp -->
	
	<div id="map"></div>
	
	<div id="section">
	<h1>測試顯示效果 之後這區域要刪掉</h1>
	<div>
	<h3>asd65a4sd6</h3>
	<h3>asd65a4sd6</h3>
	<h3>asd65a4sd6</h3>
	
	</div>
	
	<h1>測試顯示效果 之後這區域要刪掉</h1>
	</div>
	
    <div id="right-panel">
        <div>
            <input type="submit" id="submit">
        </div>
        <div id="directions-panel"></div>
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
                zoom: 12,
                //設定地圖中心點位置     Type: LatLng物件
                    center: { lat: 25.048323, lng: 121.518011}
            });
            //設定一個map物件 給這個directionsDisplay使用
            directionsDisplay.setMap(map);
            
            //當按下送出按鈕時會執行 calculateAndDisplayRoute(自定義名稱)方法
            document.getElementById('submit').addEventListener('click', function () {
                calculateAndDisplayRoute(directionsService, directionsDisplay);
            });
        }

        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
            //宣告一個陣列 存放路徑中間會經過的地點
            // Type: Array < DirectionsWaypoint >
            var waypts = [];
            //把在checkbox的點選的值 用迴圈一個個取出來放入waypts陣列中
            var checkboxArray = document.getElementById("waypoints");
            ////交通路線選擇 (常出現匹配不到 先不使用)
            //var trval = $("#travelMode").val();
			console.log("在MAP");
            console.log(cord);
            var org;
            var des;
            $.each(cord,function(i,v){
            	if(i==0){
            		org=new google.maps.LatLng(v.latitude,v.longitude);
            	}else if(i==cord.length-1){
            		des=new google.maps.LatLng(v.latitude,v.longitude);
            	}
            	else{
            		console.log(i+" : "+v.note);
            		waypts.push({
                        location: new google.maps.LatLng(v.latitude,v.longitude),
                        //stopover 是指出途經地點是路線上停留點的布林值，這會影響路線是否要分為兩條路線。 true代表同一條路線 不用分開
                        stopover: true
                    });
            	}
            })
            
            console.log(waypts);
            // 其方法 route(request:DirectionsRequest, callback:function(DirectionsResult, DirectionsStatus))
            directionsService.route(
                //請求 DirectionsRequest有多種屬性 依需求設定設些屬性值
                {
                    
                    //起始地點 此為id="start"的選項所選的地點
                    origin:org,                    //$("#start").val(),
                    //目的地點 此為id="end"的選項所選的地點
                    destination: des, //$("#end").val(),
                    //有中繼點 此為前面宣告的陣列
                    waypoints: waypts,
                    //優化路徑 如果設true會幫你配整體最佳路線 false 為waypts兩點兩點之間最佳路徑而不是整體
                    optimizeWaypoints: false,
                    //交通方式 有4種 開車 大眾運輸 腳踏車 走路
                    travelMode: 'DRIVING'
                }
                //
                , function (response, status) {
                    if (status === 'OK') {
                        directionsDisplay.setDirections(response);
                        var route = response.routes[0];

                        var summaryPanel = document.getElementById('directions-panel');
                        summaryPanel.innerHTML = '';
                        // For each route, display summary information.
                        for (var i = 0; i < route.legs.length; i++) {
                            var routeSegment = i + 1;
                            summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                                '</b><br>';
                            summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
                            summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
                            summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
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
	
	<!-- temp -->

	<script>
		$(function(){
			//步驟一 先接收剛剛傳過來的活動編號 
			var pk=$('#pk').val();
			console.log("得到的pk:"+pk);
			//步驟二 利用這個編號 去資料庫把資料顯示出來
			$.get('solopage_show.controller',{'activityID':pk},function(data){
				//宣告一個全域變數cord 給Map使用
				cord=data.detailBean;
				var Start=new Date(data.actBean.actStartDate);
				var Start = Start.getFullYear() + '-'+(Start.getMonth()+1 < 10 ? '0'+(Start.getMonth()+1) : Start.getMonth()+1) + '-'+Start.getDate();
				//顯示畫面
				var activity=$("<div>").html("<div>活動標題:"+data.actBean.actTitle+"</div><div>出發時間:"+
				Start+"</div><div>活動地區:"+data.actBean.actRegion+"<div><img src='${pageContext.request.contextPath}"+data.actBean.photoPath+"'</div>"+
				"</div><div>行程描述:"+data.actBean.introduction+"</div>"
				);
				$("#section").append(activity);
				$.each(data.detailBean,function(index,value){
					var detail=$("<div>").html("<div></div>");
					$("#section").append(detail);
				})
				
				
				
				
				
				
			},"json")
		})
	</script>
<jsp:include page="../commons/footer.jsp"/>   
</body>
</html>