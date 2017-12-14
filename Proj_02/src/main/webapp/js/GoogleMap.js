var markers=[]
//上方開啟隱藏圖標鍵 
function CenterControl(controlDiv, map) {

     // Set CSS for the control border.
     var controlUI = document.createElement('div');
     controlUI.style.backgroundColor = '#fff';
     controlUI.style.border = '2px solid #fff';
     controlUI.style.borderRadius = '3px';
     controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
     controlUI.style.cursor = 'pointer';
     controlUI.style.marginBottom = '22px';
     controlUI.style.textAlign = 'center';
     controlUI.title = 'Click to visible the marker';
     controlDiv.appendChild(controlUI);

     // Set CSS for the control interior.
     var controlText = document.createElement('div');
     controlText.style.color = 'rgb(25,25,25)';
     controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
     controlText.style.fontSize = '16px';
     controlText.style.lineHeight = '38px';
     controlText.style.paddingLeft = '5px';
     controlText.style.paddingRight = '5px';
     controlText.innerHTML = '圖標全部隱藏';
     controlUI.appendChild(controlText);

     
     controlUI.addEventListener('click', function() {
    	 var visible=true;
    	 if(visible){
    	 for (var i = 0; i < markers.length; i++) {
    		 markers[i].setVisible(!visible);
    		}
    	 	visible =false;
    	 }else{
    		 for (var i = 0; i < markers.length; i++) {
        		 markers[i].setVisible(!visible);
        		}
    		 visible =true;
        	 }
    	 
     
     });

   }
//初始化地圖
 function initMap() {
	 var map = new google.maps.Map(document.getElementById('map'), {
     zoom: 14,
     center: {lat: 25.041778, lng: 121.543653}
   		});
	 var infoWindow=new google.maps.InfoWindow;
	 var centerControlDiv = document.createElement('div');
     var centerControl = new CenterControl(centerControlDiv, map);
	 centerControlDiv.index = 1;
     map.controls[google.maps.ControlPosition.TOP_CENTER].push(centerControlDiv);

//從後端抓資料載入圖標
$.getJSON('/_05_web/mapcontroller.controller', {  }, function (data) {
	 $.each(data.data, function (i, event01) {
         var eventname=event01.EventName;
		 var address=event01.Address;
         var briefIntroduction=event01.BriefIntroduction;
         var image=event01.logoimageFile;
		 var dtStart=event01.dtStart;
         var eventtype=event01.EventTypeId;
		 var type=event01.type;
		 var point = new google.maps.LatLng(
	    		 parseFloat(event01.Latitude),
	    		 parseFloat(event01.Longitude));
		 var infowincontent = document.createElement('div');
         var strong = document.createElement('strong');
         strong.textContent = eventname
         infowincontent.appendChild(strong);
         infowincontent.appendChild(document.createElement('br'));
		 if(image.length>5){
         var img =document.createElement('img');
         img.setAttribute("src", image);
         infowincontent.appendChild(img);
         infowincontent.appendChild(document.createElement('br'));
		}
		var text = document.createElement('text');
        text.textContent = "日期:"+dtStart;
        infowincontent.appendChild(text);
        infowincontent.appendChild(document.createElement('br'));
        var text = document.createElement('text');
        text.textContent = "地址:"+address;
        infowincontent.appendChild(text);
        infowincontent.appendChild(document.createElement('br'));
        var text = document.createElement('text');
        text.textContent ="簡介:"+briefIntroduction;
        infowincontent.appendChild(text);
        var iconBase = '/Proj_02/img/';
        var block=(type=='thismonth')?'':'_block';
        var icons = {
                          
                         音樂: {
               icon: iconBase + 'music'+block+'.png',
            
          },
                          展覽: {
               icon: iconBase + 'exhibit'+block+'.png',
              
          },
                          表演: {
                icon: iconBase + 'show'+block+'.png',
                
          },
                         研習 : {
                icon: iconBase + 'study'+block+'.png',
                  
          },
                         影視 : {
                icon: iconBase + 'video'+block+'.png',
                
          },
                         休閒: {
           	   icon: iconBase + 'leisure'+block+'.png',
            
          },
                          親子: {
               icon: iconBase + 'family'+block+'.png',
              
            }
        };
        
		var marker = new google.maps.Marker({
	            			type:eventtype,
    	  					position:point, 
	            			map: map,
	            			icon: icons[eventtype].icon,
	            			visible: true
      					});
         marker.addListener("click", function() {
            infoWindow.setContent(infowincontent);
            infoWindow.open(map, marker);
            });
         marker.addListener("mouseout", function() {
             
             infoWindow.close();
             });
         markers.push(marker);
      
      });
 });

}
 